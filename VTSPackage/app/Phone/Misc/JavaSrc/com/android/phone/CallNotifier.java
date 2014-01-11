// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActivityManagerNative;
import android.app.IActivityManager;
import android.bluetooth.*;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.database.sqlite.SQLiteDiskIOException;
import android.media.AudioManager;
import android.media.ToneGenerator;
import android.net.Uri;
import android.os.*;
import android.telephony.*;
import android.text.TextUtils;
import android.util.EventLog;
import android.util.Log;
import android.widget.Toast;
import com.android.internal.telephony.*;
import com.android.internal.telephony.cdma.CdmaCallWaitingNotification;
import com.android.internal.telephony.cdma.SignalToneUtil;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.android.internal.telephony.sip.SipPhone;
import com.mediatek.calloption.CallOptionUtils;
import com.mediatek.phone.*;
import com.mediatek.phone.gemini.GeminiRegister;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.phone.provider.CallHistoryAsync;
import com.mediatek.phone.vt.VTCallUtils;
import com.mediatek.phone.vt.VTInCallScreenFlags;
import com.mediatek.vt.VTManager;
import java.io.PrintStream;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, Ringer, PhoneUtils, CallerInfoCache, 
//            InCallUiState, CdmaPhoneCallState, InCallScreen, PhoneInterfaceManager, 
//            CallLogAsync, NotificationMgr, CdmaDisplayInfo, NvRAMAgent

public class CallNotifier extends Handler
    implements com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener
{
    private class CustomInfo
    {

        public int callVideo;
        public long date;
        final CallNotifier this$0;

        private CustomInfo()
        {
            this$0 = CallNotifier.this;
            super();
        }

    }

    private class EmergencyTonePlayerVibrator
    {

        private final int EMG_VIBRATE_LENGTH = 1000;
        private final int EMG_VIBRATE_PAUSE = 1000;
        private Vibrator mEmgVibrator;
        private int mInCallVolume;
        private ToneGenerator mToneGenerator;
        private final long mVibratePattern[] = {
            1000L, 1000L
        };
        final CallNotifier this$0;

        private void start()
        {
            log("call startEmergencyToneOrVibrate.");
            int i = mAudioManager.getRingerMode();
            if (mIsEmergencyToneOn == 1 && i == 2)
            {
                log("EmergencyTonePlayerVibrator.start(): emergency tone...");
                if (mToneGenerator != null)
                {
                    mInCallVolume = mAudioManager.getStreamVolume(0);
                    mAudioManager.setStreamVolume(0, mAudioManager.getStreamMaxVolume(0), 0);
                    mToneGenerator.startTone(92);
                    mCurrentEmergencyToneState = 1;
                }
            } else
            if (mIsEmergencyToneOn == 2)
            {
                log("EmergencyTonePlayerVibrator.start(): emergency vibrate...");
                if (mEmgVibrator != null)
                {
                    mEmgVibrator.vibrate(mVibratePattern, 0);
                    mCurrentEmergencyToneState = 2;
                    return;
                }
            }
        }

        private void stop()
        {
            log("call stopEmergencyToneOrVibrate.");
            if (mCurrentEmergencyToneState == 1 && mToneGenerator != null)
            {
                mToneGenerator.stopTone();
                mToneGenerator.release();
                mAudioManager.setStreamVolume(0, mInCallVolume, 0);
            } else
            if (mCurrentEmergencyToneState == 2 && mEmgVibrator != null)
                mEmgVibrator.cancel();
            mCurrentEmergencyToneState = 0;
        }



        public EmergencyTonePlayerVibrator()
        {
            this$0 = CallNotifier.this;
            super();
            mEmgVibrator = new SystemVibrator();
        }
    }

    private final class GeminiPhoneStateListener extends PhoneStateListener
    {

        boolean inAirplaneMode;
        int mSlotId;
        final CallNotifier this$0;

        public void onCallForwardingIndicatorChanged(boolean flag)
        {
            Log.i("CallNotifier", (new StringBuilder()).append("PhoneStateListener.onCallForwardingIndicatorChanged: cfi=").append(flag).toString());
            mCfiStatus[mSlotId] = flag;
            if (!inAirplaneMode)
                onCfiChanged(flag, mSlotId);
        }

        public void onMessageWaitingIndicatorChanged(boolean flag)
        {
            Log.i("CallNotifier", (new StringBuilder()).append("PhoneStateListener.onMessageWaitingIndicatorChanged: mwi=").append(flag).toString());
            onMwiChanged(flag, mSlotId);
        }

        public void onServiceStateChanged(ServiceState servicestate)
        {
            Log.i("CallNotifier", (new StringBuilder()).append("PhoneStateListener.onServiceStateChanged: serviceState=").append(servicestate).toString());
            boolean flag;
            if (servicestate.getState() == 3)
                flag = true;
            else
                flag = false;
            inAirplaneMode = flag;
            if (inAirplaneMode)
                onCfiChanged(false, mSlotId);
            else
            if (mCfiStatus[mSlotId] && servicestate.getState() == 0)
            {
                onCfiChanged(true, mSlotId);
                return;
            }
        }

        public GeminiPhoneStateListener(int i)
        {
            this$0 = CallNotifier.this;
            super();
            inAirplaneMode = true;
            mSlotId = i;
        }
    }

    private class InCallTonePlayer extends Thread
    {

        public static final int TONE_BUSY = 2;
        public static final int TONE_CALL_ENDED = 4;
        public static final int TONE_CALL_REMINDER = 15;
        public static final int TONE_CALL_WAITING = 1;
        public static final int TONE_CDMA_DROP = 8;
        public static final int TONE_CONGESTION = 3;
        public static final int TONE_INTERCEPT = 7;
        public static final int TONE_NONE = 0;
        static final int TONE_OFF = 0;
        static final int TONE_ON = 1;
        public static final int TONE_OTA_CALL_END = 11;
        public static final int TONE_OUT_OF_SERVICE = 9;
        public static final int TONE_REDIAL = 10;
        private static final int TONE_RELATIVE_VOLUME_HIPRI = 80;
        private static final int TONE_RELATIVE_VOLUME_HIPRIEST = 100;
        private static final int TONE_RELATIVE_VOLUME_LOPRI = 50;
        public static final int TONE_REORDER = 6;
        public static final int TONE_RING_BACK = 12;
        static final int TONE_STOPPED = 2;
        static final int TONE_TIMEOUT_BUFFER = 20;
        public static final int TONE_UNOBTAINABLE_NUMBER = 13;
        public static final int TONE_VOICE_PRIVACY = 5;
        private int mState;
        private int mToneId;
        final CallNotifier this$0;

        public void run()
        {
            int i;
            log((new StringBuilder()).append("InCallTonePlayer.run(toneId = ").append(mToneId).append(")...").toString());
            i = mCM.getFgPhone().getPhoneType();
            mToneId;
            JVM INSTR tableswitch 1 15: default 128
        //                       1 158
        //                       2 478
        //                       3 548
        //                       4 562
        //                       5 621
        //                       6 635
        //                       7 649
        //                       8 663
        //                       9 663
        //                       10 677
        //                       11 576
        //                       12 691
        //                       13 705
        //                       14 128
        //                       15 719;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L9 _L10 _L11 _L12 _L13 _L1 _L14
_L1:
            throw new IllegalArgumentException((new StringBuilder()).append("Bad toneId: ").append(mToneId).toString());
_L2:
            byte byte0;
            char c;
            int j;
            byte0 = 22;
            c = 'P';
            j = 0x7fffffeb;
_L25:
            boolean flag;
            int k;
            boolean flag1;
            long l;
            byte byte1;
            if (mBluetoothHeadset != null)
            {
                if (mBluetoothHeadset.isAudioOn())
                    byte1 = 6;
                else
                    byte1 = 0;
            } else
            {
                byte1 = 0;
            }
            if (byte1 != 0)
                break MISSING_BLOCK_LABEL_212;
            if (mToneId == 15)
                byte1 = 1;
            ToneGenerator tonegenerator;
            try
            {
                log((new StringBuilder()).append("toneVolume is ").append(c).toString());
                tonegenerator = new ToneGenerator(byte1, c);
            }
            catch (RuntimeException runtimeexception)
            {
                Log.w("CallNotifier", (new StringBuilder()).append("InCallTonePlayer: Exception caught while creating ToneGenerator: ").append(runtimeexception).toString());
                tonegenerator = null;
            }
            flag = true;
            if (tonegenerator == null) goto _L16; else goto _L15
_L15:
            k = mAudioManager.getRingerMode();
            if (i != 2) goto _L18; else goto _L17
_L17:
            if (byte0 != 93) goto _L20; else goto _L19
_L19:
            flag1 = false;
            if (k == 0)
                break MISSING_BLOCK_LABEL_330;
            flag1 = false;
            if (k == 1)
                break MISSING_BLOCK_LABEL_330;
            log((new StringBuilder()).append("- InCallTonePlayer: start playing call tone=").append(byte0).toString());
            flag1 = true;
            flag = false;
_L27:
            this;
            JVM INSTR monitorenter ;
            if (!flag1) goto _L22; else goto _L21
_L21:
            if (mState == 2) goto _L22; else goto _L23
_L23:
            mState = 1;
            log("- InCallTonePlayer: startTone");
            if ((mToneId == 1 || mToneId == 15) && DualTalkUtils.isSupportDualTalk())
                mAudioManager.setParameters("SetWarningTone=14");
            tonegenerator.startTone(byte0);
            l = j + 20;
            wait(l);
_L30:
            if (!flag) goto _L22; else goto _L24
_L24:
            tonegenerator.stopTone();
_L22:
            tonegenerator.release();
            mState = 0;
            log("- InCallTonePlayer: stopTone");
            this;
            JVM INSTR monitorexit ;
_L16:
            if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                resetAudioStateAfterDisconnect();
            mToneThread = null;
            return;
_L3:
            if (i == 2)
            {
                byte0 = 96;
                c = '2';
                j = 1000;
            } else
            if (i == 1 || i == 3)
            {
                byte0 = 17;
                c = 'P';
                j = 4000;
            } else
            {
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
            }
              goto _L25
_L4:
            byte0 = 18;
            c = 'P';
            j = 4000;
              goto _L25
_L5:
            byte0 = 27;
            c = 'P';
            j = 512;
              goto _L25
_L11:
            if (mApplication.cdmaOtaConfigData.otaPlaySuccessFailureTone == 1)
            {
                byte0 = 93;
                c = 'P';
                j = 750;
            } else
            {
                byte0 = 27;
                c = 'P';
                j = 200;
            }
              goto _L25
_L6:
            byte0 = 86;
            c = 'P';
            j = 5000;
              goto _L25
_L7:
            byte0 = 38;
            c = 'P';
            j = 4000;
              goto _L25
_L8:
            byte0 = 37;
            c = '2';
            j = 500;
              goto _L25
_L9:
            byte0 = 95;
            c = '2';
            j = 375;
              goto _L25
_L10:
            byte0 = 87;
            c = '2';
            j = 5000;
              goto _L25
_L12:
            byte0 = 23;
            c = '\u01C2';
            j = 0x7fffffeb;
              goto _L25
_L13:
            byte0 = 21;
            c = 'P';
            j = 1000;
              goto _L25
_L14:
            log("InCallTonePlayer.TONE_CALL_NOTIFY ");
            byte0 = 27;
            c = 'd';
            j = 500;
              goto _L25
_L20:
            if (byte0 != 96 && byte0 != 38 && byte0 != 39 && byte0 != 37 && byte0 != 95)
                break MISSING_BLOCK_LABEL_861;
            flag1 = false;
            if (k == 0) goto _L27; else goto _L26
_L26:
            log((new StringBuilder()).append("InCallTonePlayer:playing call fail tone:").append(byte0).toString());
            flag1 = true;
            flag = false;
              goto _L27
            if (byte0 != 87 && byte0 != 86)
                break MISSING_BLOCK_LABEL_925;
            flag1 = false;
            if (k == 0) goto _L27; else goto _L28
_L28:
            flag1 = false;
            if (k == 1) goto _L27; else goto _L29
_L29:
            log((new StringBuilder()).append("InCallTonePlayer:playing tone for toneType=").append(byte0).toString());
            flag1 = true;
            flag = false;
              goto _L27
            flag1 = true;
              goto _L27
_L18:
            flag1 = true;
              goto _L27
            InterruptedException interruptedexception;
            interruptedexception;
            Log.w("CallNotifier", (new StringBuilder()).append("InCallTonePlayer stopped: ").append(interruptedexception).toString());
              goto _L30
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
              goto _L27
        }

        public void stopTone()
        {
            this;
            JVM INSTR monitorenter ;
            if (mState == 1)
                notify();
            mState = 2;
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        InCallTonePlayer(int i)
        {
            this$0 = CallNotifier.this;
            super();
            mToneId = i;
            mState = 0;
        }
    }

    private class SignalInfoTonePlayer extends Thread
    {

        private int mToneId;
        final CallNotifier this$0;

        public void run()
        {
            log((new StringBuilder()).append("SignalInfoTonePlayer.run(toneId = ").append(mToneId).append(")...").toString());
            if (mSignalInfoToneGenerator != null)
            {
                mSignalInfoToneGenerator.stopTone();
                mSignalInfoToneGenerator.startTone(mToneId);
            }
        }

        SignalInfoTonePlayer(int i)
        {
            this$0 = CallNotifier.this;
            super();
            mToneId = i;
        }
    }


    private static final int CALLERINFO_QUERYING = -1;
    private static final int CALLERINFO_QUERY_READY = 0;
    private static final int CALLWAITING_ADDCALL_DISABLE_TIME = 30000;
    private static final int CALLWAITING_ADDCALL_DISABLE_TIMEOUT = 23;
    private static final int CALLWAITING_CALLERINFO_DISPLAY_DONE = 22;
    private static final int CALLWAITING_CALLERINFO_DISPLAY_TIME = 20000;
    private static final int CALL_DURATION_THRESHOLD_FOR_CALL_HISTORY = 10000;
    public static final int CALL_TYPE_NONE = 0;
    public static final int CALL_TYPE_SIP = -2;
    private static final int CDMA_CALL_WAITING_REJECT = 26;
    private static final boolean DBG = true;
    private static final int DISPLAYINFO_NOTIFICATION_DONE = 24;
    private static final int DISPLAYINFO_NOTIFICATION_TIME = 2000;
    private static final int DISPLAY_BUSY_MESSAGE = 50;
    private static final int EMERGENCY_TONE_ALERT = 1;
    private static final int EMERGENCY_TONE_OFF = 0;
    private static final int EMERGENCY_TONE_VIBRATE = 2;
    private static final int EVENT_OTA_PROVISION_CHANGE = 25;
    private static final int EVENT_SIMINFO_CHANGED = 2001;
    private static final int FAKE_SIP_PHONE_INCOMING_RING = 42;
    private static final int FAKE_SIP_PHONE_INCOMING_RING_DELAY = 2000;
    private static final String LOG_TAG = "CallNotifier";
    private static final int PHONE_CDMA_CALL_WAITING = 8;
    private static final int PHONE_DISCONNECT = 3;
    private static final int PHONE_DISCONNECT2 = 103;
    private static final int PHONE_DISCONNECT3 = 203;
    private static final int PHONE_DISCONNECT4 = 303;
    private static final int PHONE_DISCONNECT_GEMINI[] = {
        3, 103, 203, 303
    };
    private static final int PHONE_ENHANCED_VP_OFF = 10;
    private static final int PHONE_ENHANCED_VP_ON = 9;
    private static final int PHONE_INCOMING_RING = 5;
    private static final int PHONE_MWI_CHANGED = 21;
    private static final int PHONE_MWI_CHANGED2 = 121;
    private static final int PHONE_MWI_CHANGED3 = 221;
    private static final int PHONE_MWI_CHANGED4 = 321;
    private static final int PHONE_MWI_CHANGED_GEMINI[] = {
        21, 121, 221, 321
    };
    private static final int PHONE_NEW_RINGING_CONNECTION = 2;
    private static final int PHONE_RESEND_MUTE = 12;
    private static final int PHONE_RINGBACK_TONE = 11;
    private static final int PHONE_STATE_CHANGED = 1;
    private static final int PHONE_STATE_DISPLAYINFO = 6;
    private static final int PHONE_STATE_LISTENER_EVENT = 13;
    private static final int PHONE_STATE_SIGNALINFO = 7;
    private static final int PHONE_UNKNOWN_CONNECTION_APPEARED = 4;
    private static final int PHONE_VT_RING_INFO = 13;
    private static final int PHONE_WAITING_DISCONNECT = 15;
    private static final int PHONE_WAITING_DISCONNECT_STOP_TONE_PLAYER = 18;
    private static final int RINGER_CUSTOM_RINGTONE_QUERY_TIMEOUT = 100;
    private static final int RINGTONE_QUERY_WAIT_TIME = 500;
    private static final int TONE_RELATIVE_VOLUME_SIGNALINFO = 80;
    private static final int UPDATE_IN_CALL_NOTIFICATION = 27;
    private static final boolean VDBG = true;
    public static boolean mIsWaitingQueryComplete = true;
    private static CallNotifier sInstance;
    private PhoneGlobals mApplication;
    private AudioManager mAudioManager;
    BlackListManager mBlackListManager;
    private BluetoothHeadset mBluetoothHeadset;
    private android.bluetooth.BluetoothProfile.ServiceListener mBluetoothProfileServiceListener;
    private CallManager mCM;
    private MTKCallManager mCMGemini;
    private CallLogAsync mCallLog;
    private boolean mCallWaitingTimeOut;
    private InCallTonePlayer mCallWaitingTonePlayer;
    private int mCallerInfoQueryState;
    private Object mCallerInfoQueryStateGuard;
    private boolean mCfiStatus[];
    private int mCurrentEmergencyToneState;
    DualTalkUtils mDualTalk;
    private EmergencyTonePlayerVibrator mEmergencyTonePlayerVibrator;
    private InCallTonePlayer mInCallRingbackTonePlayer;
    private boolean mIsCdmaRedialCall;
    private int mIsEmergencyToneOn;
    private com.android.internal.telephony.PhoneConstants.State mLastState;
    private Phone mPhone;
    private PhoneStateListener mPhoneStateListeners[];
    private com.android.internal.telephony.Call.State mPreviousCallState;
    private com.android.internal.telephony.Call.State mPreviousCdmaCallState;
    private Ringer mRinger;
    private ToneGenerator mSignalInfoToneGenerator;
    private boolean mSilentRingerRequested;
    InCallTonePlayer mToneThread;
    private Vibrator mVibrator;
    private InCallTonePlayer mVideoOrVoiceCallWaitingTonePlayer;
    private boolean mVoicePrivacyState;
    private boolean ok2Ring;

    private CallNotifier(PhoneGlobals phoneglobals, Phone phone, Ringer ringer, CallLogAsync calllogasync)
    {
        mCallWaitingTimeOut = false;
        mCallerInfoQueryStateGuard = new Object();
        mLastState = com.android.internal.telephony.PhoneConstants.State.IDLE;
        mVoicePrivacyState = false;
        mIsCdmaRedialCall = false;
        mCurrentEmergencyToneState = 0;
        mPreviousCallState = com.android.internal.telephony.Call.State.IDLE;
        mVideoOrVoiceCallWaitingTonePlayer = null;
        ok2Ring = true;
        mToneThread = null;
        mBluetoothProfileServiceListener = new android.bluetooth.BluetoothProfile.ServiceListener() {

            final CallNotifier this$0;

            public void onServiceConnected(int i, BluetoothProfile bluetoothprofile)
            {
                mBluetoothHeadset = (BluetoothHeadset)bluetoothprofile;
                log((new StringBuilder()).append("- Got BluetoothHeadset: ").append(mBluetoothHeadset).toString());
            }

            public void onServiceDisconnected(int i)
            {
                mBluetoothHeadset = null;
            }

            
            {
                this$0 = CallNotifier.this;
                super();
            }
        }
;
        mPhoneStateListeners = null;
        mCfiStatus = null;
        mApplication = phoneglobals;
        mPhone = phone;
        mCM = phoneglobals.mCM;
        mCMGemini = phoneglobals.mCMGemini;
        mCallLog = calllogasync;
        if (DualTalkUtils.isSupportDualTalk())
            mDualTalk = DualTalkUtils.getInstance();
        mAudioManager = (AudioManager)mApplication.getSystemService("audio");
        registerForNotifications();
        BluetoothAdapter bluetoothadapter;
        if (mCM.getFgPhone().getPhoneType() == 2)
            try
            {
                mSignalInfoToneGenerator = new ToneGenerator(0, 80);
            }
            catch (RuntimeException runtimeexception)
            {
                Log.w("CallNotifier", (new StringBuilder()).append("CallNotifier: Exception caught while creating mSignalInfoToneGenerator: ").append(runtimeexception).toString());
                mSignalInfoToneGenerator = null;
            }
        mRinger = ringer;
        bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter != null)
            bluetoothadapter.getProfileProxy(mApplication.getApplicationContext(), mBluetoothProfileServiceListener, 1);
        listenPhoneState();
        mBlackListManager = new BlackListManager(mApplication);
        SIMInfoWrapper.getDefault().registerForSimInfoUpdate(this, 2001, null);
    }

    private void checkAndTriggerRingTone()
    {
        log("checkAndTriggerRingTone");
        if (DualTalkUtils.isSupportDualTalk() && !mRinger.isRinging())
        {
            log("trigger the ringtone!");
            Call call = mCM.getFirstActiveRingingCall();
            if (call.getPhone().getPhoneType() == 3 && PhoneUtils.isRealIncomingCall(call.getState()))
            {
                Connection connection = call.getLatestConnection();
                if (connection != null)
                {
                    Object obj = connection.getUserData();
                    CallerInfo callerinfo;
                    if (obj instanceof PhoneUtils.CallerInfoToken)
                    {
                        callerinfo = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
                    } else
                    {
                        boolean flag = obj instanceof CallerInfo;
                        callerinfo = null;
                        if (flag)
                            callerinfo = (CallerInfo)obj;
                    }
                    if (callerinfo != null && callerinfo.contactRingtoneUri != null)
                        mRinger.setCustomRingtoneUri(callerinfo.contactRingtoneUri);
                    else
                        mRinger.setCustomRingtoneUri(android.provider.Settings.System.DEFAULT_RINGTONE_URI);
                    mRinger.ring();
                    return;
                }
            }
        } else
        {
            log("checkAndTriggerRingTone:  return directly");
        }
    }

    private void closeVTManager()
    {
        log("closeVTManager()!");
        log("- call VTManager onDisconnected ! ");
        VTManager.getInstance().onDisconnected();
        log("- finish call VTManager onDisconnected ! ");
        log("- set VTManager close ! ");
        VTManager.getInstance().setVTClose();
        log("- finish set VTManager close ! ");
        if (VTInCallScreenFlags.getInstance().mVTInControlRes)
        {
            PhoneGlobals.getInstance().sendBroadcast(new Intent("android.phone.extra.VT_CALL_END"));
            VTInCallScreenFlags.getInstance().mVTInControlRes = false;
        }
    }

    private String formatDuration(long l)
    {
        long l1 = 0L;
        if (l >= 60L)
        {
            l1 = l / 60L;
            l -= l1 * 60L;
        }
        long l2 = l;
        StringBuilder stringbuilder = (new StringBuilder()).append(mApplication.getString(0x7f0d02be)).append("(");
        PhoneGlobals phoneglobals = mApplication;
        Object aobj[] = new Object[2];
        aobj[0] = Long.valueOf(l1);
        aobj[1] = Long.valueOf(l2);
        return stringbuilder.append(phoneglobals.getString(0x7f0d0074, aobj)).append(")").toString();
    }

    private String getLogNumber(Connection connection, CallerInfo callerinfo)
    {
        String s;
        if (connection.isIncoming())
            s = connection.getAddress();
        else
        if (callerinfo != null && !TextUtils.isEmpty(callerinfo.phoneNumber) && !callerinfo.isEmergencyNumber() && !callerinfo.isVoiceMailNumber())
            s = callerinfo.phoneNumber;
        else
        if (connection.getCall().getPhone().getPhoneType() == 2)
            s = connection.getOrigDialString();
        else
            s = connection.getAddress();
        if (s == null)
            return null;
        int i = connection.getNumberPresentation();
        String s1 = PhoneUtils.modifyForSpecialCnapCases(mApplication, callerinfo, s, i);
        if (!PhoneNumberUtils.isUriNumber(s1))
            s1 = PhoneNumberUtils.stripSeparators(s1);
        log((new StringBuilder()).append("getLogNumber: ").append(s1).toString());
        return s1;
    }

    private boolean ignoreAllIncomingCalls(Phone phone)
    {
        boolean flag4;
label0:
        {
            Connection connection;
label1:
            {
                if (!PhoneGlobals.sVoiceCapable)
                {
                    Log.w("CallNotifier", "Got onNewRingingConnection() on non-voice-capable device! Ignoring...");
                    return true;
                }
                if (PhoneUtils.isPhoneInEcm(phone))
                {
                    log("Incoming call while in ECM: always allow...");
                    return false;
                }
                boolean flag;
                if (android.provider.Settings.Global.getInt(mApplication.getContentResolver(), "device_provisioned", 0) != 0)
                    flag = true;
                else
                    flag = false;
                if (!flag)
                {
                    Log.i("CallNotifier", "Ignoring incoming call: not provisioned");
                    return true;
                }
                if (TelephonyCapabilities.supportsOtasp(phone))
                {
                    boolean flag3;
                    if (mApplication.cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION)
                        flag3 = true;
                    else
                        flag3 = false;
                    if (mApplication.cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_SUCCESS_FAILURE_DLG)
                        flag4 = true;
                    else
                        flag4 = false;
                    if (mApplication.cdmaOtaProvisionData.inOtaSpcState)
                    {
                        Log.i("CallNotifier", "Ignoring incoming call: OTA call is active");
                        return true;
                    }
                    if (flag3 || flag4)
                        break label0;
                }
                connection = mCM.getFirstActiveRingingCall().getLatestConnection();
                if (connection != null)
                {
                    String s = connection.getAddress();
                    if (!TextUtils.isEmpty(s))
                    {
                        BlackListManager blacklistmanager = mBlackListManager;
                        int i;
                        if (connection.isVideo())
                            i = 1;
                        else
                            i = 0;
                        boolean flag1 = blacklistmanager.shouldBlock(s, i);
                        CallerInfoCache.CacheEntry cacheentry = mApplication.callerInfoCache.getCacheEntry(s);
                        boolean flag2 = false;
                        if (cacheentry != null)
                            flag2 = cacheentry.sendToVoicemail;
                        log((new StringBuilder()).append("the call should be rejected by black list or auto reject: ").append(flag1).append(" / ").append(flag2).toString());
                        if (flag1 || flag2)
                            break label1;
                    }
                }
                return false;
            }
            CallerInfo callerinfo = new CallerInfo();
            callerinfo.shouldSendToVoicemail = true;
            connection.setUserData(callerinfo);
            return true;
        }
        if (flag4)
            mApplication.dismissOtaDialogs();
        mApplication.clearOtaState();
        mApplication.clearInCallScreenMode();
        return false;
    }

    static CallNotifier init(PhoneGlobals phoneglobals, Phone phone, Ringer ringer, CallLogAsync calllogasync)
    {
        com/android/phone/CallNotifier;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_34;
        sInstance = new CallNotifier(phoneglobals, phone, ringer, calllogasync);
_L1:
        CallNotifier callnotifier = sInstance;
        com/android/phone/CallNotifier;
        JVM INSTR monitorexit ;
        return callnotifier;
        Log.wtf("CallNotifier", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/CallNotifier;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void initFakeCall(Connection connection, int i)
    {
        mApplication.inCallUiState.latestDisconnectCall = new InCallUiState.FakeCall();
        mApplication.inCallUiState.latestDisconnectCall.cause = connection.getDisconnectCause();
        if (GeminiUtils.isGeminiSupport())
            mApplication.inCallUiState.latestDisconnectCall.slotId = i;
        else
            mApplication.inCallUiState.latestDisconnectCall.slotId = 0;
        mApplication.inCallUiState.latestDisconnectCall.number = connection.getAddress();
        mApplication.inCallUiState.latestDisconnectCall.phoneType = connection.getCall().getPhone().getPhoneType();
    }

    private void listenPhoneState()
    {
        int ai[] = GeminiUtils.getSlots();
        int i = ai.length;
        if (mCfiStatus == null)
            mCfiStatus = new boolean[i];
        TelephonyManager telephonymanager = (TelephonyManager)mApplication.getSystemService("phone");
        if (GeminiUtils.isGeminiSupport())
        {
            if (mPhoneStateListeners == null)
                mPhoneStateListeners = new PhoneStateListener[i];
            for (int j = 0; j < i; j++)
            {
                if (mPhoneStateListeners[j] == null)
                    mPhoneStateListeners[j] = new GeminiPhoneStateListener(ai[j]);
                mCfiStatus[j] = false;
                telephonymanager.listenGemini(mPhoneStateListeners[j], 13, ai[j]);
            }

        } else
        {
            mCfiStatus[0] = false;
            if (mPhoneStateListeners == null)
            {
                mPhoneStateListeners = new PhoneStateListener[1];
                mPhoneStateListeners[0] = new GeminiPhoneStateListener(ai[0]);
            }
            telephonymanager.listen(mPhoneStateListeners[0], 13);
        }
    }

    private void log(String s)
    {
        Log.d("CallNotifier", s);
    }

    private void onCdmaCallWaiting(AsyncResult asyncresult)
    {
        removeMessages(22);
        removeMessages(23);
        mApplication.cdmaPhoneCallState.setCurrentCallState(CdmaPhoneCallState.PhoneCallState.SINGLE_ACTIVE);
        if (!mApplication.isShowingCallScreen())
        {
            log("- showing incoming call (CDMA call waiting)...");
            showIncomingCall();
        } else
        {
            mApplication.getInCallScreenInstance().requestUpdateScreen();
        }
        mCallWaitingTimeOut = false;
        sendEmptyMessageDelayed(22, 20000L);
        mApplication.cdmaPhoneCallState.setAddCallMenuStateAfterCallWaiting(false);
        sendEmptyMessageDelayed(23, 30000L);
        CdmaCallWaitingNotification cdmacallwaitingnotification = (CdmaCallWaitingNotification)asyncresult.result;
        int i = cdmacallwaitingnotification.isPresent;
        log((new StringBuilder()).append("onCdmaCallWaiting: isPresent=").append(i).toString());
        if (i == 1)
        {
            int j = cdmacallwaitingnotification.signalType;
            int k = cdmacallwaitingnotification.alertPitch;
            int l = cdmacallwaitingnotification.signal;
            log((new StringBuilder()).append("onCdmaCallWaiting: uSignalType=").append(j).append(", uAlertPitch=").append(k).append(", uSignal=").append(l).toString());
            (new SignalInfoTonePlayer(SignalToneUtil.getAudioToneFromSignalInfo(j, k, l))).start();
        }
    }

    private void onCdmaCallWaitingReject()
    {
        Call call = mCM.getFirstActiveRingingCall();
        if (call.getState() == com.android.internal.telephony.Call.State.WAITING)
        {
            Connection connection = call.getLatestConnection();
            if (connection != null)
            {
                String s = connection.getAddress();
                int i = connection.getNumberPresentation();
                long l = connection.getCreateTime();
                long l1 = connection.getDurationMillis();
                byte byte0;
                Object obj;
                CallerInfo callerinfo;
                String s1;
                int j;
                CallLogAsync.AddCallArgs addcallargs;
                if (mCallWaitingTimeOut)
                    byte0 = 3;
                else
                    byte0 = 1;
                obj = connection.getUserData();
                if (obj == null || (obj instanceof CallerInfo))
                    callerinfo = (CallerInfo)obj;
                else
                    callerinfo = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
                s1 = PhoneUtils.modifyForSpecialCnapCases(mApplication, callerinfo, s, i);
                if (callerinfo != null)
                    j = callerinfo.numberPresentation;
                else
                    j = i;
                log((new StringBuilder()).append("- onCdmaCallWaitingReject(): logNumber set to: ").append(s1).append(", newPresentation value is: ").append(j).toString());
                if (GeminiUtils.isGeminiSupport())
                {
                    int k = 1;
                    int i1 = GeminiUtils.getSlotByPhoneType(2);
                    if (mApplication.phoneMgr.hasIccCardGemini(i1))
                    {
                        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(PhoneGlobals.getInstance(), i1);
                        if (siminfo != null)
                            k = (int)siminfo.mSimId;
                    }
                    addcallargs = new CallLogAsync.AddCallArgs(mApplication, callerinfo, s1, i, byte0, l, l1, k);
                } else
                {
                    addcallargs = new CallLogAsync.AddCallArgs(mApplication, callerinfo, s1, i, byte0, l, l1);
                }
                try
                {
                    mCallLog.addCall(addcallargs);
                }
                catch (SQLiteDiskIOException sqlitediskioexception)
                {
                    Log.e("CallNotifier", "Error!! - onDisconnect() Disk Full!");
                    sqlitediskioexception.printStackTrace();
                }
                if (byte0 == 3)
                    showMissedCallNotification(connection, l);
                else
                    removeMessages(22);
                PhoneUtils.hangup(connection);
            }
            mCallWaitingTimeOut = false;
        }
    }

    private void onCfiChanged(boolean flag, int i)
    {
        log((new StringBuilder()).append("onCfiChanged(): ").append(flag).append("simId:").append(i).toString());
        mApplication.notificationMgr.updateCfi(flag, i);
    }

    private void onCustomRingQueryComplete()
    {
        Object obj = mCallerInfoQueryStateGuard;
        obj;
        JVM INSTR monitorenter ;
        int i = mCallerInfoQueryState;
        boolean flag;
        flag = false;
        if (i != -1)
            break MISSING_BLOCK_LABEL_28;
        mCallerInfoQueryState = 0;
        flag = true;
        obj;
        JVM INSTR monitorexit ;
        if (flag)
        {
            Log.w("CallNotifier", "CallerInfo query took too long; falling back to default ringtone");
            EventLog.writeEvent(0x112a0, new Object[0]);
        }
        if (mCM.getState() != com.android.internal.telephony.PhoneConstants.State.RINGING)
        {
            Log.i("CallNotifier", "onCustomRingQueryComplete: No incoming call! Bailing out...");
            return;
        }
        break MISSING_BLOCK_LABEL_83;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        if (mCM.getRingingPhone().getPhoneType() == 3 || mCM.getRingingPhone().getPhoneType() == 2)
        {
            log("RINGING... (onCustomRingQueryComplete)");
            mRinger.ring();
        }
        log("- showing incoming call (custom ring query complete)...");
        showIncomingCall();
        return;
    }

    private void onCustomRingtoneQueryTimeout(String s)
    {
        Log.w("CallNotifier", "CallerInfo query took too long; look up local fallback cache.");
        CallerInfoCache.CacheEntry cacheentry = mApplication.callerInfoCache.getCacheEntry(s);
        if (cacheentry != null)
        {
            if (cacheentry.sendToVoicemail)
            {
                log("send to voicemail flag detected (in fallback cache). hanging up.");
                PhoneUtils.hangupRingingCall(mCM.getFirstActiveRingingCall());
                return;
            }
            if (cacheentry.customRingtone != null)
            {
                log((new StringBuilder()).append("custom ringtone found (in fallback cache), setting up ringer: ").append(cacheentry.customRingtone).toString());
                mRinger.setCustomRingtoneUri(Uri.parse(cacheentry.customRingtone));
            }
        } else
        {
            log("Failed to find fallback cache. Use default ringer tone.");
        }
        onCustomRingQueryComplete();
    }

    private void onDisconnect(AsyncResult asyncresult, int i)
    {
        Connection connection;
        byte byte0;
        long l;
        long l1;
        byte byte1;
        CallerInfo callerinfo;
        String s1;
        int k;
        CallLogAsync.AddCallArgs addcallargs;
        int k1;
        int i2;
        log((new StringBuilder()).append("onDisconnect()...  CallManager state: ").append(mCM.getState()).append(", sim id ").append(i).toString());
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        int j;
        if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
            PhoneUtils.setAudioControlState(0);
        else
        if (state == com.android.internal.telephony.PhoneConstants.State.RINGING)
        {
            log("state == PhoneConstants.State.RINGING");
            removeMessages(42);
            sendEmptyMessageDelayed(42, 2000L);
        }
        ok2Ring = true;
        mVoicePrivacyState = false;
        connection = (Connection)asyncresult.result;
        if (connection != null)
            log((new StringBuilder()).append("onDisconnect: cause = ").append(connection.getDisconnectCause()).append(", incoming = ").append(connection.isIncoming()).append(", date = ").append(connection.getCreateTime()).append(", number = ").append(connection.getAddress()).toString());
        else
            Log.w("CallNotifier", "onDisconnect: null connection");
        j = 0;
        if (connection != null)
        {
            int i3 = connection.getCall().getPhone().getPhoneType();
            j = 0;
            if (i3 == 2)
                j = android.provider.Settings.Global.getInt(mApplication.getContentResolver(), "call_auto_retry", 0);
        }
        stopSignalInfoTone();
        if (connection != null && connection.getCall().getPhone().getPhoneType() == 2)
        {
            mApplication.cdmaPhoneCallState.resetCdmaPhoneCallState();
            removeMessages(22);
            removeMessages(23);
        }
        if (mApplication.inCallUiState.delayFinished && state == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            log("Meet the case to cache the disconnect call information!!");
            mApplication.inCallUiState.delayFinished = false;
            mApplication.inCallUiState.latestDisconnectCall = new InCallUiState.FakeCall();
            mApplication.inCallUiState.latestDisconnectCall.cause = connection.getDisconnectCause();
            boolean flag;
            Call call;
            Call call1;
            Call call2;
            Call call3;
            Call call4;
            String s;
            Phone phone;
            boolean flag1;
            boolean flag2;
            String s2;
            int j1;
            int j2;
            com.android.internal.telephony.Connection.DisconnectCause disconnectcause1;
            String s3;
            int l2;
            if (GeminiUtils.isGeminiSupport())
                mApplication.inCallUiState.latestDisconnectCall.slotId = i;
            else
                mApplication.inCallUiState.latestDisconnectCall.slotId = 0;
            mApplication.inCallUiState.latestDisconnectCall.conn = connection;
            mApplication.inCallUiState.latestDisconnectCall.number = connection.getAddress();
            mApplication.inCallUiState.latestDisconnectCall.phoneType = connection.getCall().getPhone().getPhoneType();
        } else
        {
            log("Don't meet the case clear disconnect call information!!");
            mApplication.inCallUiState.latestDisconnectCall = null;
        }
        flag = false;
        if (connection != null)
        {
            l2 = connection.getCall().getPhone().getPhoneType();
            flag = false;
            if (l2 == 3)
                flag = true;
        }
        call = mCM.getFirstActiveRingingCall();
        if (call.getPhone().getPhoneType() == 2)
        {
            if (PhoneUtils.isRealIncomingCall(call.getState()))
            {
                log("cancelCallInProgressNotifications()... (onDisconnect)");
                mApplication.notificationMgr.cancelCallInProgressNotifications();
            } else
            {
                log("stopRing()... (onDisconnect)");
                mRinger.stopRing();
            }
        } else
        {
            log("stopRing()... (onDisconnect)");
            mRinger.stopRing();
            if (DualTalkUtils.isSupportDualTalk() && state == com.android.internal.telephony.PhoneConstants.State.RINGING)
                switchRingToneByNeeded(mCM.getFirstActiveRingingCall());
        }
_L13:
        if (mCallWaitingTonePlayer != null)
        {
            mCallWaitingTonePlayer.stopTone();
            mCallWaitingTonePlayer = null;
        }
        if (connection != null && TelephonyCapabilities.supportsOtasp(connection.getCall().getPhone()))
        {
            s3 = connection.getAddress();
            if (connection.getCall().getPhone().isOtaSpNumber(s3))
            {
                log("onDisconnect: this was an OTASP call!");
                mApplication.handleOtaspDisconnect();
            }
        }
        byte0 = 0;
        if (connection != null)
        {
            com.android.internal.telephony.Connection.DisconnectCause disconnectcause2 = connection.getDisconnectCause();
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.BUSY)
            {
                log("- need to play BUSY tone!");
                byte0 = 2;
            } else
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.CONGESTION || disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.BEARER_NOT_AVAIL || disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.NO_CIRCUIT_AVAIL)
            {
                log("- need to play CONGESTION tone!");
                byte0 = 3;
            } else
            if ((disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.NORMAL || disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.LOCAL) && mApplication.isOtaCallInActiveState())
            {
                log("- need to play OTA_CALL_END tone!");
                byte0 = 11;
            } else
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.CDMA_REORDER)
            {
                log("- need to play CDMA_REORDER tone!");
                byte0 = 6;
            } else
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.CDMA_INTERCEPT)
            {
                log("- need to play CDMA_INTERCEPT tone!");
                byte0 = 7;
            } else
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.CDMA_DROP)
            {
                log("- need to play CDMA_DROP tone!");
                byte0 = 8;
            } else
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.OUT_OF_SERVICE)
            {
                log("- need to play OUT OF SERVICE tone!");
                byte0 = 9;
            } else
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.UNOBTAINABLE_NUMBER || disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.INVALID_NUMBER_FORMAT || disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.INVALID_NUMBER)
            {
                if (mApplication.getInCallScreenInstance() != null && mApplication.getInCallScreenInstance().isFinishing())
                {
                    log("display incallscreen again!");
                    initFakeCall(connection, i);
                    mApplication.displayCallScreen(true);
                }
                log("- need to play TONE_UNOBTAINABLE_NUMBER tone!");
                byte0 = 13;
            } else
            if (disconnectcause2 == com.android.internal.telephony.Connection.DisconnectCause.ERROR_UNSPECIFIED)
            {
                log("- DisconnectCause is ERROR_UNSPECIFIED: play TONE_CALL_ENDED!");
                byte0 = 4;
            } else
            {
                com.android.internal.telephony.Connection.DisconnectCause disconnectcause3 = com.android.internal.telephony.Connection.DisconnectCause.FDN_BLOCKED;
                byte0 = 0;
                if (disconnectcause2 == disconnectcause3)
                {
                    log("cause is FDN_BLOCKED");
                    mApplication.inCallUiState.setPendingCallStatusCode(Constants.CallStatusCode.FDN_BLOCKED);
                    if (mApplication.getInCallScreenInstance() != null && mApplication.getInCallScreenInstance().isFinishing())
                    {
                        log("display incallscreen again!");
                        initFakeCall(connection, i);
                        mApplication.displayCallScreen(true);
                        byte0 = 0;
                    } else
                    if (mApplication.getInCallScreenInstance() != null)
                    {
                        log("incall screen not null, do nothing.!");
                        byte0 = 0;
                    } else
                    {
                        mApplication.displayCallScreen(true);
                        byte0 = 0;
                    }
                }
            }
        }
        if (byte0 == 0 && mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE && connection != null)
        {
            disconnectcause1 = connection.getDisconnectCause();
            if (disconnectcause1 == com.android.internal.telephony.Connection.DisconnectCause.NORMAL || disconnectcause1 == com.android.internal.telephony.Connection.DisconnectCause.LOCAL || disconnectcause1 == com.android.internal.telephony.Connection.DisconnectCause.NORMAL_UNSPECIFIED)
            {
                log("- need to play CALL_ENDED tone!");
                byte0 = 4;
                mIsCdmaRedialCall = false;
            }
        }
        call1 = mCM.getFgPhone().getForegroundCall();
        call2 = mCM.getFgPhone().getBackgroundCall();
        call3 = mCM.getBgPhone().getForegroundCall();
        call4 = mCM.getBgPhone().getBackgroundCall();
        if (state == com.android.internal.telephony.PhoneConstants.State.RINGING && call1.isIdle() && call2.isIdle() && call3.isIdle() && call4.isIdle())
            PhoneUtils.setAudioControlState(1);
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            if (byte0 == 0)
                resetAudioStateAfterDisconnect();
            mApplication.notificationMgr.cancelCallInProgressNotifications();
        }
        if (connection == null) goto _L2; else goto _L1
_L1:
        s = connection.getAddress();
        l = connection.getCreateTime();
        l1 = connection.getDurationMillis();
        log((new StringBuilder()).append("onDisconnect: number = ").append(s).append(", duration = ").append(l1).toString());
        if (!connection.getCall().isMultiparty() && 0L != l1 / 1000L)
            Toast.makeText(PhoneGlobals.getInstance().getApplicationContext(), formatDuration((int)(l1 / 1000L)), 0).show();
        com.android.internal.telephony.Connection.DisconnectCause disconnectcause = connection.getDisconnectCause();
        phone = connection.getCall().getPhone();
        flag1 = PhoneNumberUtils.isLocalEmergencyNumber(s, mApplication);
        log((new StringBuilder()).append("onDisconnect isShouldSendtoVoicemail flag:").append(PhoneUtils.getShouldSendToVoiceMailFlag(connection)).toString());
        boolean flag3;
        boolean flag4;
        if (connection.isIncoming())
        {
            if (PhoneUtils.getShouldSendToVoiceMailFlag(connection))
                byte1 = 5;
            else
            if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.INCOMING_MISSED)
                byte1 = 3;
            else
                byte1 = 1;
        } else
        {
            byte1 = 2;
        }
        log((new StringBuilder()).append("onDisconnect callLogType:").append(byte1).toString());
        log((new StringBuilder()).append("- callLogType: ").append(byte1).append(", UserData: ").append(connection.getUserData()).toString());
        callerinfo = getCallerInfoFromConnection(connection);
        s1 = getLogNumber(connection, callerinfo);
        log("- onDisconnect(): logNumber set to: xxxxxxx");
        k = getPresentation(connection, callerinfo);
        if (phone.getPhoneType() == 2 && flag1 && mCurrentEmergencyToneState != 0 && mEmergencyTonePlayerVibrator != null)
            mEmergencyTonePlayerVibrator.stop();
        flag2 = mApplication.getResources().getBoolean(0x7f0a000c);
        if (TelephonyCapabilities.supportsOtasp(phone) && phone.isOtaSpNumber(s))
            flag3 = true;
        else
            flag3 = false;
        if ((!flag1 || flag2) && !flag3)
            flag4 = true;
        else
            flag4 = false;
        if (!flag4) goto _L4; else goto _L3
_L3:
        if (!GeminiUtils.isGeminiSupport() || flag)
        {
            int i1;
            if (flag)
            {
                i1 = -2;
            } else
            {
                boolean flag5 = PhoneGlobals.getInstance().phoneMgr.hasIccCard();
                i1 = 0;
                if (flag5)
                {
                    android.provider.Telephony.SIMInfo siminfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(0);
                    if (siminfo != null)
                        i1 = (int)siminfo.mSimId;
                    else
                        i1 = 1;
                }
            }
            addcallargs = new CallLogAsync.AddCallArgs(mApplication, callerinfo, s1, k, byte1, l, l1, i1);
        } else
        {
            boolean flag6 = PhoneGlobals.getInstance().phoneMgr.hasIccCardGemini(i);
            int k2 = 0;
            if (flag6)
            {
                android.provider.Telephony.SIMInfo siminfo1 = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(PhoneGlobals.getInstance(), i);
                k2 = 0;
                if (siminfo1 != null)
                    k2 = (int)siminfo1.mSimId;
            }
            addcallargs = new CallLogAsync.AddCallArgs(mApplication, callerinfo, s1, k, byte1, l, l1, k2);
        }
        mCallLog.addCall(addcallargs);
        if (readNVData(900) != 0) goto _L6; else goto _L5
_L5:
        j1 = readNVData(901);
        if (j1 >= 60) goto _L6; else goto _L7
_L7:
        k1 = addcallargs.durationInSec;
        System.out.println((new StringBuilder()).append("OTA phone -iduration=").append(k1).toString());
        if (k1 % 60 <= 0) goto _L9; else goto _L8
_L8:
        i2 = 1 + k1 / 60;
_L11:
        j2 = i2 + j1;
        System.out.println((new StringBuilder()).append("OTA phone nTol=").append(j2).toString());
        if (j2 >= 60)
            j2 = 60;
        try
        {
            writeNVData(901, j2);
        }
        catch (SQLiteDiskIOException sqlitediskioexception)
        {
            Log.e("CallNotifier", "Error!! - onDisconnect() Disk Full!");
            sqlitediskioexception.printStackTrace();
        }
_L6:
        if (!flag1 && !connection.isIncoming() && !connection.isVideo() && !flag && l1 >= 10000L)
        {
            s2 = CallOptionUtils.getCurrentCountryISO(PhoneGlobals.getInstance());
            try
            {
                (new CallHistoryAsync()).addCall(new com.mediatek.phone.provider.CallHistoryAsync.AddCallArgs(PhoneGlobals.getInstance(), s1, s2, l, i, GeminiUtils.isGeminiSupport()));
            }
            catch (SQLiteDiskIOException sqlitediskioexception1)
            {
                Log.e("CallNotifier", "Error!! - onDisconnect() Disk Full!");
                sqlitediskioexception1.printStackTrace();
            }
        }
_L4:
        if (byte1 == 3)
            showMissedCallNotification(connection, l);
        if (byte0 != 0)
        {
            log((new StringBuilder()).append("- starting post-disconnect tone (").append(byte0).append(")...").toString());
            mToneThread = new InCallTonePlayer(byte0);
            mToneThread.start();
        }
        if ((mPreviousCdmaCallState == com.android.internal.telephony.Call.State.DIALING || mPreviousCdmaCallState == com.android.internal.telephony.Call.State.ALERTING) && !flag1 && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.INCOMING_MISSED && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.NORMAL && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.LOCAL && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.INCOMING_REJECTED)
        {
            if (mIsCdmaRedialCall)
                break MISSING_BLOCK_LABEL_2353;
            if (j != 1)
                break; /* Loop/switch isn't completed */
            PhoneUtils.placeCall(mApplication, phone, s, null, false, null);
            mIsCdmaRedialCall = true;
        }
_L2:
        return;
_L9:
        i2 = k1 / 60;
        if (true) goto _L11; else goto _L10
_L10:
        mIsCdmaRedialCall = false;
        return;
        mIsCdmaRedialCall = false;
        return;
        if (true) goto _L13; else goto _L12
_L12:
    }

    private void onDisconnectForVTWaiting(AsyncResult asyncresult, int i)
    {
        log((new StringBuilder()).append("onDisconnectForVTWaiting()... , sim id : ").append(i).toString());
        Connection connection = (Connection)asyncresult.result;
        if (connection != null)
        {
            connection.getAddress();
            long l = connection.getCreateTime();
            long l1 = connection.getDurationMillis();
            connection.getDisconnectCause();
            connection.getCall().getPhone();
            boolean flag;
            int j;
            CallerInfo callerinfo;
            String s;
            int k;
            CallLogAsync.AddCallArgs addcallargs;
            if (connection.getCall().getPhone().getPhoneType() == 3)
                flag = true;
            else
                flag = false;
            if (connection.isVideo())
                j = 1;
            else
                j = 0;
            callerinfo = getCallerInfoFromConnection(connection);
            s = getLogNumber(connection, callerinfo);
            k = getPresentation(connection, callerinfo);
            if (!GeminiUtils.isGeminiSupport() || flag)
            {
                byte byte0;
                Message message;
                if (flag)
                {
                    byte0 = -2;
                } else
                {
                    boolean flag1 = PhoneGlobals.getInstance().phoneMgr.hasIccCard();
                    byte0 = 0;
                    if (flag1)
                        byte0 = 1;
                }
                addcallargs = new CallLogAsync.AddCallArgs(mApplication, callerinfo, s, k, 3, l, l1, byte0, j);
            } else
            {
                boolean flag2 = PhoneGlobals.getInstance().phoneMgr.hasIccCardGemini(i);
                int i1 = 0;
                if (flag2)
                {
                    android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(PhoneGlobals.getInstance(), i);
                    i1 = 0;
                    if (siminfo != null)
                        i1 = (int)siminfo.mSimId;
                }
                addcallargs = new CallLogAsync.AddCallArgs(mApplication, callerinfo, s, k, 3, l, l1, i1, j);
            }
            if (!flag)
            {
                message = Message.obtain();
                message.what = 18;
                if (mVideoOrVoiceCallWaitingTonePlayer == null)
                {
                    mVideoOrVoiceCallWaitingTonePlayer = new InCallTonePlayer(1);
                    mVideoOrVoiceCallWaitingTonePlayer.start();
                }
                sendMessageDelayed(message, 3000L);
                if (connection.isVideo())
                    Toast.makeText(PhoneGlobals.getInstance().getApplicationContext(), 0x7f0d0072, 1).show();
                else
                    Toast.makeText(PhoneGlobals.getInstance().getApplicationContext(), 0x7f0d0073, 1).show();
            }
            try
            {
                mCallLog.addCall(addcallargs);
            }
            catch (SQLiteDiskIOException sqlitediskioexception)
            {
                Log.e("CallNotifier", "Error!! - onDisconnect() Disk Full!");
                sqlitediskioexception.printStackTrace();
            }
            showMissedCallNotification(connection, l);
        }
    }

    private void onDisplayInfo(AsyncResult asyncresult)
    {
        com.android.internal.telephony.cdma.CdmaInformationRecords.CdmaDisplayInfoRec cdmadisplayinforec = (com.android.internal.telephony.cdma.CdmaInformationRecords.CdmaDisplayInfoRec)(com.android.internal.telephony.cdma.CdmaInformationRecords.CdmaDisplayInfoRec)asyncresult.result;
        if (cdmadisplayinforec != null)
        {
            String s = cdmadisplayinforec.alpha;
            log((new StringBuilder()).append("onDisplayInfo: displayInfo=").append(s).toString());
            CdmaDisplayInfo.displayInfoRecord(mApplication, s);
            sendEmptyMessageDelayed(24, 2000L);
        }
    }

    private void onMwiChanged(boolean flag, int i)
    {
        log((new StringBuilder()).append("onMwiChanged(): ").append(flag).append("simid:").append(i).toString());
        if (!PhoneGlobals.sVoiceCapable)
        {
            Log.w("CallNotifier", "Got onMwiChanged() on non-voice-capable device! Ignoring...");
            return;
        } else
        {
            mApplication.notificationMgr.updateMwi(flag, i);
            return;
        }
    }

    private void onNewRingingConnection(AsyncResult asyncresult)
    {
label0:
        {
            Connection connection = (Connection)asyncresult.result;
            log((new StringBuilder()).append("onNewRingingConnection(): state = ").append(mCM.getState()).append(", conn = { ").append(connection).append(" }").toString());
            Call call = connection.getCall();
            Phone phone = call.getPhone();
            ok2Ring = true;
            if (ignoreAllIncomingCalls(phone))
            {
                PhoneUtils.hangupRingingCall(call);
                ok2Ring = false;
                return;
            }
            if (connection == null)
            {
                Log.w("CallNotifier", "CallNotifier.onNewRingingConnection(): null connection!");
                return;
            }
            if (!connection.isRinging())
            {
                Log.i("CallNotifier", "CallNotifier.onNewRingingConnection(): connection not ringing!");
                return;
            }
            if (DualTalkUtils.isSupportDualTalk())
            {
                if (mDualTalk == null)
                    mDualTalk = DualTalkUtils.getInstance();
                if (call == null || !mDualTalk.isAllowedIncomingCall(call))
                    break label0;
                mDualTalk.switchPhoneByNeededForRing(call.getPhone());
            }
            stopSignalInfoTone();
            com.android.internal.telephony.Call.State state = connection.getState();
            log((new StringBuilder()).append("- connection is ringing!  state = ").append(state).toString());
            CallStateException callstateexception;
            if (PhoneUtils.isRealIncomingCall(state))
            {
                PhoneUtils.setAudioControlState(1);
                startIncomingCallQuery(connection);
                PhoneUtils.setAudioMode();
            } else
            {
                log("- starting call waiting tone...");
                mIsWaitingQueryComplete = false;
                if (mCallWaitingTonePlayer == null)
                {
                    mCallWaitingTonePlayer = new InCallTonePlayer(1);
                    mCallWaitingTonePlayer.start();
                }
                startIncomingCallQuery(connection);
            }
            log("- onNewRingingConnection() done.");
            return;
        }
        try
        {
            call.hangup();
            return;
        }
        // Misplaced declaration of an exception variable
        catch (CallStateException callstateexception)
        {
            log(callstateexception.toString());
        }
    }

    private void onPhoneStateChanged(AsyncResult asyncresult)
    {
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        log((new StringBuilder()).append("onPhoneStateChanged: state = ").append(state).toString());
        if (DualTalkUtils.isSupportDualTalk())
        {
            if (mDualTalk == null)
                mDualTalk = DualTalkUtils.getInstance();
            mDualTalk.updateState();
        }
        if (mVibrator == null)
            mVibrator = (Vibrator)mApplication.getApplicationContext().getSystemService("vibrator");
        NotificationMgr.StatusBarHelper statusbarhelper = mApplication.notificationMgr.statusBarHelper;
        boolean flag;
        if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
            flag = true;
        else
            flag = false;
        statusbarhelper.enableNotificationAlerts(flag);
        Phone phone = mCM.getFgPhone();
        if (phone.getPhoneType() == 2)
        {
            if (phone.getForegroundCall().getState() == com.android.internal.telephony.Call.State.ACTIVE && (mPreviousCdmaCallState == com.android.internal.telephony.Call.State.DIALING || mPreviousCdmaCallState == com.android.internal.telephony.Call.State.ALERTING))
            {
                if (mIsCdmaRedialCall)
                    (new InCallTonePlayer(10)).start();
                stopSignalInfoTone();
            }
            mPreviousCdmaCallState = phone.getForegroundCall().getState();
        }
        mApplication.updatePhoneState(state);
        mApplication.updateBluetoothIndication(false);
        if (state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
        {
            if (mCallWaitingTonePlayer != null)
            {
                mCallWaitingTonePlayer.stopTone();
                mCallWaitingTonePlayer = null;
            }
            PhoneUtils.setAudioControlState(2);
            log("onPhoneStateChanged: OFF HOOK");
            com.android.internal.telephony.Call.State state2 = mCM.getActiveFgCallState();
            if (mAudioManager.getMode() != 2)
                PhoneUtils.setAudioMode(mCM);
            else
            if (state2 == com.android.internal.telephony.Call.State.ACTIVE && PhoneUtils.isSupportFeature("TTY"))
                PhoneUtils.openTTY();
            if (!mApplication.isShowingCallScreen())
                mApplication.requestWakeState(PhoneGlobals.WakeState.SLEEP);
            log("stopRing()... (OFFHOOK state)");
            mRinger.stopRing();
            if (((PowerManager)mApplication.getApplicationContext().getSystemService("power")).isScreenOn())
            {
                log("- posting UPDATE_IN_CALL_NOTIFICATION request...");
                removeMessages(27);
                sendEmptyMessageDelayed(27, 1000L);
            }
        } else
        if (state == com.android.internal.telephony.PhoneConstants.State.RINGING && DualTalkUtils.isSupportDualTalk() && (mCM.hasActiveFgCall() || mCM.hasActiveBgCall()) && mCallWaitingTonePlayer == null)
        {
            mCallWaitingTonePlayer = new InCallTonePlayer(1);
            mCallWaitingTonePlayer.start();
            log("Start waiting tone.");
        }
        if (phone.getPhoneType() == 2)
        {
            Connection connection = phone.getForegroundCall().getLatestConnection();
            if (connection != null && PhoneNumberUtils.isLocalEmergencyNumber(connection.getAddress(), mApplication))
            {
                log("onPhoneStateChanged: it is an emergency call.");
                com.android.internal.telephony.Call.State state1 = phone.getForegroundCall().getState();
                if (mEmergencyTonePlayerVibrator == null)
                    mEmergencyTonePlayerVibrator = new EmergencyTonePlayerVibrator();
                if (state1 != com.android.internal.telephony.Call.State.DIALING && state1 != com.android.internal.telephony.Call.State.ALERTING)
                {
                    if (state1 == com.android.internal.telephony.Call.State.ACTIVE && mCurrentEmergencyToneState != 0 && mEmergencyTonePlayerVibrator != null)
                        mEmergencyTonePlayerVibrator.stop();
                } else
                {
                    mIsEmergencyToneOn = android.provider.Settings.Global.getInt(mApplication.getContentResolver(), "emergency_tone", 0);
                    if (mIsEmergencyToneOn != 0 && mCurrentEmergencyToneState == 0 && mEmergencyTonePlayerVibrator != null)
                        mEmergencyTonePlayerVibrator.start();
                }
            }
        }
        if ((phone.getPhoneType() == 1 || phone.getPhoneType() == 3) && !mCM.getActiveFgCallState().isDialing() && mInCallRingbackTonePlayer != null)
        {
            mInCallRingbackTonePlayer.stopTone();
            mInCallRingbackTonePlayer = null;
        }
        if (mCM.getActiveFgCallState() == com.android.internal.telephony.Call.State.ACTIVE && mPreviousCallState != com.android.internal.telephony.Call.State.IDLE && mPreviousCallState != com.android.internal.telephony.Call.State.ACTIVE && mPreviousCallState != com.android.internal.telephony.Call.State.HOLDING && mPreviousCallState != com.android.internal.telephony.Call.State.DISCONNECTED && mPreviousCallState != com.android.internal.telephony.Call.State.DISCONNECTING)
        {
            Log.d("CallNotifier", (new StringBuilder()).append("onPhoneStateChanged mCM.getActiveFgCallState()= ").append(mCM.getActiveFgCallState()).toString());
            Log.d("CallNotifier", (new StringBuilder()).append("onPhoneStateChanged mPreviousCallState= ").append(mPreviousCallState).toString());
            mVibrator.vibrate(300L);
        }
        Log.d("CallNotifier", (new StringBuilder()).append("before set value, mPreviousCallState= ").append(mPreviousCallState).toString());
        mPreviousCallState = mCM.getActiveFgCallState();
        Log.d("CallNotifier", (new StringBuilder()).append("end after set value, mPreviousCallState= ").append(mPreviousCallState).toString());
    }

    private void onResendMute()
    {
        boolean flag = PhoneUtils.getMute();
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        PhoneUtils.setMute(flag1);
        PhoneUtils.setMute(flag);
    }

    private void onRingbackTone(AsyncResult asyncresult)
    {
        if (((Boolean)(Boolean)asyncresult.result).booleanValue())
        {
            if (mCM.getActiveFgCallState().isDialing() && mInCallRingbackTonePlayer == null)
            {
                mInCallRingbackTonePlayer = new InCallTonePlayer(12);
                mInCallRingbackTonePlayer.start();
            }
        } else
        if (mInCallRingbackTonePlayer != null)
        {
            mInCallRingbackTonePlayer.stopTone();
            mInCallRingbackTonePlayer = null;
            return;
        }
    }

    private void onSignalInfo(AsyncResult asyncresult)
    {
        if (!PhoneGlobals.sVoiceCapable)
        {
            Log.w("CallNotifier", "Got onSignalInfo() on non-voice-capable device! Ignoring...");
        } else
        {
            if (PhoneUtils.isRealIncomingCall(mCM.getFirstActiveRingingCall().getState()))
            {
                stopSignalInfoTone();
                return;
            }
            com.android.internal.telephony.cdma.CdmaInformationRecords.CdmaSignalInfoRec cdmasignalinforec = (com.android.internal.telephony.cdma.CdmaInformationRecords.CdmaSignalInfoRec)(com.android.internal.telephony.cdma.CdmaInformationRecords.CdmaSignalInfoRec)asyncresult.result;
            if (cdmasignalinforec != null)
            {
                boolean flag = cdmasignalinforec.isPresent;
                log((new StringBuilder()).append("onSignalInfo: isPresent=").append(flag).toString());
                if (flag)
                {
                    int i = cdmasignalinforec.signalType;
                    int j = cdmasignalinforec.alertPitch;
                    int k = cdmasignalinforec.signal;
                    log((new StringBuilder()).append("onSignalInfo: uSignalType=").append(i).append(", uAlertPitch=").append(j).append(", uSignal=").append(k).toString());
                    (new SignalInfoTonePlayer(SignalToneUtil.getAudioToneFromSignalInfo(i, j, k))).start();
                    return;
                }
            }
        }
    }

    private void onUnknownConnectionAppeared(AsyncResult asyncresult)
    {
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
        {
            onPhoneStateChanged(asyncresult);
            log("- showing incoming call (unknown connection appeared)...");
            showIncomingCall();
        }
    }

    private void registerForNotifications()
    {
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.registerForPreciseCallStateChanged(obj, this, 1);
        GeminiRegister.registerForNewRingingConnection(obj, this, 2);
        GeminiRegister.registerForDisconnect(obj, this, PHONE_DISCONNECT_GEMINI);
        GeminiRegister.registerForUnknownConnection(obj, this, 4);
        GeminiRegister.registerForIncomingRing(obj, this, 5);
        GeminiRegister.registerForVtRingInfo(obj, this, 13);
        GeminiRegister.registerForVtReplaceDisconnect(obj, this, 15);
        if (GeminiUtils.isGeminiSupport())
        {
            mCM.registerForCdmaOtaStatusChange2(this, 25, null);
            mCM.registerForCallWaiting2(this, 8, null);
            mCM.registerForDisplayInfo2(this, 6, null);
            mCM.registerForSignalInfo2(this, 7, null);
            mCM.registerForInCallVoicePrivacyOn2(this, 9, null);
            mCM.registerForInCallVoicePrivacyOff2(this, 10, null);
        }
        if (mCM.getFgPhone().getPhoneType() == 1)
        {
            GeminiRegister.registerForRingbackTone(obj, this, 11);
            if (!GeminiUtils.isGeminiSupport())
                mCM.registerForResendIncallMute(this, 12, null);
            return;
        } else
        {
            mCM.registerForCdmaOtaStatusChange(this, 25, null);
            mCM.registerForCallWaiting(this, 8, null);
            mCM.registerForDisplayInfo(this, 6, null);
            mCM.registerForSignalInfo(this, 7, null);
            mCM.registerForInCallVoicePrivacyOn(this, 9, null);
            mCM.registerForInCallVoicePrivacyOff(this, 10, null);
            return;
        }
    }

    private void resetAudioStateAfterDisconnect()
    {
        log("resetAudioStateAfterDisconnect()...");
        if (mBluetoothHeadset != null)
            mBluetoothHeadset.disconnectAudio();
        PhoneUtils.turnOnSpeaker(mApplication, false, true);
        PhoneUtils.setAudioMode(mCM);
    }

    private void setDefaultRingtoneUri(Connection connection)
    {
        CallerInfoCache.CacheEntry cacheentry = mApplication.callerInfoCache.getCacheEntry(connection.getAddress());
        if (cacheentry != null && cacheentry.customRingtone != null)
        {
            log((new StringBuilder()).append("Before query; custom ringtone found in CallerInfoCache for call( ").append(connection.getAddress()).append(" ), setting up ringer: ").append(cacheentry.customRingtone).toString());
            mRinger.setCustomRingtoneUri(Uri.parse(cacheentry.customRingtone));
            return;
        } else
        {
            log("Before query; custom ringtone not found in CallerInfoCache. Use default ringer tone.");
            mRinger.setCustomRingtoneUri(android.provider.Settings.System.DEFAULT_RINGTONE_URI);
            return;
        }
    }

    private void showIncomingCall()
    {
        log((new StringBuilder()).append("showIncomingCall()...  phone state = ").append(mCM.getState()).toString());
        try
        {
            ActivityManagerNative.getDefault().closeSystemDialogs("call");
        }
        catch (RemoteException remoteexception) { }
        mApplication.requestWakeState(PhoneGlobals.WakeState.FULL);
        log("- updating notification from showIncomingCall()...");
        mApplication.notificationMgr.updateNotificationAndLaunchIncomingCallUi();
    }

    private void startIncomingCallQuery(Connection connection)
    {
        Object obj = mCallerInfoQueryStateGuard;
        obj;
        JVM INSTR monitorenter ;
        int i = mCallerInfoQueryState;
        boolean flag;
        flag = false;
        if (i != 0)
            break MISSING_BLOCK_LABEL_29;
        mCallerInfoQueryState = -1;
        flag = true;
        obj;
        JVM INSTR monitorexit ;
        if (flag)
        {
            setDefaultRingtoneUri(connection);
            PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(mApplication, connection, this, this);
            Exception exception;
            if (callerinfotoken.isFinal)
            {
                log("- CallerInfo already up to date, using available data");
                onQueryComplete(0, this, callerinfotoken.currentInfo);
                return;
            } else
            {
                log("- Starting query, posting timeout message.");
                sendMessageDelayed(Message.obtain(this, 100, connection.getAddress()), 500L);
                return;
            }
        }
        break MISSING_BLOCK_LABEL_111;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        EventLog.writeEvent(0x112a1, new Object[0]);
        if (mCM.getRingingPhone().getPhoneType() == 3)
        {
            log("RINGING... (request to ring arrived while query is running)");
            mRinger.ring();
        }
        log("- showing incoming call (couldn't start query)...");
        showIncomingCall();
        return;
    }

    public void autoVTVoiceAnswerCall(Call call)
    {
        log("autointernalAnswerCall()...");
        if (mCM.hasActiveRingingCall())
        {
            int i = mCM.getRingingPhone().getPhoneType();
            if (i == 1)
            {
                boolean flag = mCM.hasActiveFgCall();
                boolean flag1 = mCM.hasActiveBgCall();
                if (flag && flag1)
                {
                    log("autointernalAnswerCall: answering (both lines in use!)...");
                    PhoneUtils.answerAndEndActive(mCM, mCM.getFirstActiveRingingCall());
                    mApplication.getInCallScreenInstance().setOnAnswerAndEndFlag(true);
                } else
                {
                    log("autointernalAnswerCall: answering...");
                    PhoneUtils.answerCall(call);
                }
            } else
            {
                log((new StringBuilder()).append("phone type: ").append(i).toString());
            }
            mApplication.setLatestActiveCallOrigin(null);
        }
    }

    CallerInfo getCallerInfoFromConnection(Connection connection)
    {
        Object obj = connection.getUserData();
        if (obj != null && !(obj instanceof CallerInfo))
        {
            if (obj instanceof Uri)
                return null;
            else
                return ((PhoneUtils.CallerInfoToken)obj).currentInfo;
        } else
        {
            return (CallerInfo)obj;
        }
    }

    public boolean getIsCdmaRedialCall()
    {
        return mIsCdmaRedialCall;
    }

    int getPresentation(Connection connection, CallerInfo callerinfo)
    {
        int i;
        if (callerinfo == null)
        {
            i = connection.getNumberPresentation();
        } else
        {
            i = callerinfo.numberPresentation;
            log((new StringBuilder()).append("- getPresentation(): ignoring connection's presentation: ").append(connection.getNumberPresentation()).toString());
        }
        log((new StringBuilder()).append("- getPresentation: presentation: ").append(i).toString());
        return i;
    }

    com.android.internal.telephony.Call.State getPreviousCdmaCallState()
    {
        return mPreviousCdmaCallState;
    }

    boolean getVoicePrivacyState()
    {
        return mVoicePrivacyState;
    }

    public void handleMessage(Message message)
    {
label0:
        {
label1:
            {
                switch (message.what)
                {
                case 50: // '2'
                default:
                    break;

                case 2: // '\002'
                    break label0;

                case 2001: 
                    for (int l = 0; l < mCfiStatus.length; l++)
                        if (mCfiStatus[l])
                            onCfiChanged(true, l);

                    break;

                case 42: // '*'
                    checkAndTriggerRingTone();
                    return;

                case 27: // '\033'
                    mApplication.notificationMgr.updateInCallNotification();
                    return;

                case 12: // '\f'
                    onResendMute();
                    return;

                case 11: // '\013'
                    log("- receive the ring back...");
                    onRingbackTone((AsyncResult)message.obj);
                    return;

                case 10: // '\n'
                    log("PHONE_ENHANCED_VP_OFF...");
                    if (mVoicePrivacyState)
                    {
                        (new InCallTonePlayer(5)).start();
                        mVoicePrivacyState = false;
                        log("- updating notification for VP state...");
                        mApplication.notificationMgr.updateInCallNotification();
                        return;
                    }
                    break;

                case 9: // '\t'
                    log("PHONE_ENHANCED_VP_ON...");
                    if (!mVoicePrivacyState)
                    {
                        (new InCallTonePlayer(5)).start();
                        mVoicePrivacyState = true;
                        log("- updating notification for VP state...");
                        mApplication.notificationMgr.updateInCallNotification();
                        return;
                    }
                    break;

                case 25: // '\031'
                    log("EVENT_OTA_PROVISION_CHANGE...");
                    mApplication.handleOtaspEvent(message);
                    return;

                case 24: // '\030'
                    log("Received Display Info notification done event ...");
                    CdmaDisplayInfo.dismissDisplayInfoRecord();
                    return;

                case 7: // '\007'
                    log("Received PHONE_STATE_SIGNALINFO event");
                    onSignalInfo((AsyncResult)message.obj);
                    return;

                case 6: // '\006'
                    log("Received PHONE_STATE_DISPLAYINFO event");
                    onDisplayInfo((AsyncResult)message.obj);
                    return;

                case 23: // '\027'
                    log("Received CALLWAITING_ADDCALL_DISABLE_TIMEOUT event ...");
                    mApplication.cdmaPhoneCallState.setAddCallMenuStateAfterCallWaiting(true);
                    mApplication.updateInCallScreen();
                    return;

                case 22: // '\026'
                    Log.i("CallNotifier", "Received CALLWAITING_CALLERINFO_DISPLAY_DONE event");
                    mCallWaitingTimeOut = true;
                    onCdmaCallWaitingReject();
                    return;

                case 26: // '\032'
                    Log.i("CallNotifier", "Received CDMA_CALL_WAITING_REJECT event");
                    onCdmaCallWaitingReject();
                    return;

                case 8: // '\b'
                    log("Received PHONE_CDMA_CALL_WAITING event");
                    onCdmaCallWaiting((AsyncResult)message.obj);
                    return;

                case 21: // '\025'
                case 121: // 'y'
                case 221: 
                case 321: 
                    int k = GeminiRegister.getSlotIdByRegisterEvent(message.what, PHONE_MWI_CHANGED_GEMINI);
                    onMwiChanged(GeminiUtils.getMessageWaitingIndicator(mApplication.phone, k), k);
                    return;

                case 100: // 'd'
                    onCustomRingtoneQueryTimeout((String)message.obj);
                    return;

                case 4: // '\004'
                    onUnknownConnectionAppeared((AsyncResult)message.obj);
                    return;

                case 3: // '\003'
                case 103: // 'g'
                case 203: 
                case 303: 
                    log("DISCONNECT");
                    Connection connection = (Connection)((AsyncResult)message.obj).result;
                    if ((!connection.isIncoming() || !PhoneUtils.getShouldSendToVoiceMailFlag(connection)) && ok2Ring)
                        mApplication.wakeUpScreen();
                    int j = GeminiRegister.getSlotIdByRegisterEvent(message.what, PHONE_DISCONNECT_GEMINI);
                    onDisconnect((AsyncResult)message.obj, j);
                    return;

                case 1: // '\001'
                    log("CallNotifier Phone state change");
                    onPhoneStateChanged((AsyncResult)message.obj);
                    return;

                case 18: // '\022'
                    if (mVideoOrVoiceCallWaitingTonePlayer != null)
                    {
                        mVideoOrVoiceCallWaitingTonePlayer.stopTone();
                        mVideoOrVoiceCallWaitingTonePlayer = null;
                        return;
                    }
                    break;

                case 15: // '\017'
                    int i = GeminiUtils.get3GCapabilitySIM();
                    log((new StringBuilder()).append(" - handleMessage : PHONE_WAITING_DISCONNECT ! simId=").append(i).toString());
                    onDisconnectForVTWaiting((AsyncResult)message.obj, i);
                    return;

                case 13: // '\r'
                    log(" - handleMessage : RING INFO for video call ! ");
                    if (VTCallUtils.isVTRinging() && !mSilentRingerRequested)
                    {
                        log("RINGING... (PHONE_VT_RING_INFO event)");
                        boolean flag3;
                        if (android.provider.Settings.Global.getInt(mApplication.getContentResolver(), "device_provisioned", 0) != 0)
                            flag3 = true;
                        else
                            flag3 = false;
                        if (flag3)
                        {
                            mRinger.ring();
                            return;
                        }
                    } else
                    {
                        log("RING before NEW_RING, skipping");
                        return;
                    }
                    break;

                case 5: // '\005'
                    log("PHONE_INCOMING_RING ! ");
                    if (message.obj == null || ((AsyncResult)message.obj).result == null)
                        break;
                    PhoneBase phonebase = (PhoneBase)((AsyncResult)message.obj).result;
                    boolean flag = phonebase instanceof SipPhone;
                    Call call = phonebase.getRingingCall();
                    boolean flag1 = false;
                    if (call != null)
                        flag1 = PhoneUtils.getShouldSendToVoiceMailFlag(call.getLatestConnection());
                    if (phonebase.getState() != com.android.internal.telephony.PhoneConstants.State.RINGING || mSilentRingerRequested || flag1 || !ok2Ring)
                        break label1;
                    log("RINGING... (PHONE_INCOMING_RING event)");
                    boolean flag2;
                    if (android.provider.Settings.Global.getInt(mApplication.getContentResolver(), "device_provisioned", 0) != 0)
                        flag2 = true;
                    else
                        flag2 = false;
                    if (flag2 && !flag)
                    {
                        mRinger.ring();
                        return;
                    }
                    break;
                }
                return;
            }
            log("RING before NEW_RING, skipping");
            return;
        }
        log("RINGING... (new)");
        onNewRingingConnection((AsyncResult)message.obj);
        mSilentRingerRequested = false;
    }

    boolean hasPendingCallerInfoQuery()
    {
        return mCallerInfoQueryState == -1;
    }

    boolean isRinging()
    {
        return mRinger.isRinging();
    }

    public void onQueryComplete(int i, Object obj, CallerInfo callerinfo)
    {
        if (!(obj instanceof CustomInfo)) goto _L2; else goto _L1
_L1:
        log("CallerInfo query complete, posting missed call notification");
        mApplication.notificationMgr.notifyMissedCall(callerinfo.name, callerinfo.phoneNumber, callerinfo.phoneLabel, callerinfo.cachedPhoto, callerinfo.cachedPhotoIcon, ((CustomInfo)obj).date, ((CustomInfo)obj).callVideo);
_L4:
        return;
_L2:
        if (!(obj instanceof CallNotifier)) goto _L4; else goto _L3
_L3:
        log("CallerInfo query complete (for CallNotifier), updating state for incoming call..");
        removeMessages(100);
        Object obj1 = mCallerInfoQueryStateGuard;
        obj1;
        JVM INSTR monitorenter ;
        int j = mCallerInfoQueryState;
        boolean flag;
        flag = false;
        if (j != -1)
            break MISSING_BLOCK_LABEL_111;
        mCallerInfoQueryState = 0;
        flag = true;
        obj1;
        JVM INSTR monitorexit ;
        mIsWaitingQueryComplete = true;
        if (!flag) goto _L4; else goto _L5
_L5:
        if (callerinfo.shouldSendToVoicemail)
        {
            log("send to voicemail flag detected. hanging up.");
            PhoneUtils.hangupRingingCall(mCM.getFirstActiveRingingCall());
            callerinfo.shouldSendToVoicemail = true;
            return;
        }
        break MISSING_BLOCK_LABEL_162;
        Exception exception;
        exception;
        obj1;
        JVM INSTR monitorexit ;
        throw exception;
        if (callerinfo.contactRingtoneUri != null)
        {
            log("custom ringtone found, setting up ringer.");
            log((new StringBuilder()).append("contactRingtoneUri = ").append(callerinfo.contactRingtoneUri).append(" for ").append(callerinfo.phoneNumber).toString());
            ((CallNotifier)obj).mRinger.setCustomRingtoneUri(callerinfo.contactRingtoneUri);
        } else
        if (DualTalkUtils.isSupportDualTalk())
        {
            Ringer ringer = ((CallNotifier)obj).mRinger;
            callerinfo.contactRingtoneUri = ringer.getCustomRingToneUri();
            log((new StringBuilder()).append("set call's uri = ").append(ringer.getCustomRingToneUri()).append(" for ").append(callerinfo).toString());
        }
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.hasMultipleRingingCall())
        {
            Ringer ringer1 = ((CallNotifier)obj).mRinger;
            Call call = mDualTalk.getFirstActiveRingingCall();
            Call call1 = mDualTalk.getSecondActiveRingCall();
            CallerInfo callerinfo1 = getCallerInfoFromConnection(call.getLatestConnection());
            CallerInfo callerinfo2 = getCallerInfoFromConnection(call1.getLatestConnection());
            log((new StringBuilder()).append("foregorund calller info = ").append(callerinfo1).toString());
            log((new StringBuilder()).append("background calller info = ").append(callerinfo2).toString());
            Uri uri = null;
            if (callerinfo1 != null)
                uri = callerinfo1.contactRingtoneUri;
            Uri uri1;
            if (uri == null)
                if (VTCallUtils.isVideoCall(call))
                    uri = android.provider.Settings.System.DEFAULT_VIDEO_CALL_URI;
                else
                    uri = android.provider.Settings.System.DEFAULT_RINGTONE_URI;
            uri1 = null;
            if (callerinfo2 != null)
                uri1 = callerinfo2.contactRingtoneUri;
            if (uri1 == null)
                if (VTCallUtils.isVideoCall(call1))
                    uri1 = android.provider.Settings.System.DEFAULT_VIDEO_CALL_URI;
                else
                    uri1 = android.provider.Settings.System.DEFAULT_RINGTONE_URI;
            if (ringer1.isRinging() && !uri.equals(uri1))
            {
                ringer1.stopRing();
                ringer1.setCustomRingtoneUri(uri);
                ringer1.ring();
            }
        }
        onCustomRingQueryComplete();
        return;
    }

    public void onTimeToReminder()
    {
        log("- onTimeToReminder ...");
        (new InCallTonePlayer(15)).start();
    }

    public int readNVData(int i)
    {
        NvRAMAgent nvramagent = NvRAMAgent.Stub.asInterface(ServiceManager.getService("NvRAMAgent"));
        byte abyte1[] = nvramagent.readFile(35);
        byte abyte0[] = abyte1;
_L2:
        byte byte0 = abyte0[i];
        System.out.println((new StringBuilder()).append("b:").append(byte0).toString());
        return byte0;
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
        abyte0 = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    void resetAudioState()
    {
        log("resetAudioState()...");
        if (mBluetoothHeadset != null)
            mBluetoothHeadset.disconnectAudio();
        PhoneUtils.turnOnSpeaker(mApplication, false, true);
    }

    public void resetBeforeCall()
    {
        if (mToneThread != null && mToneThread.isAlive())
        {
            mToneThread.stopTone();
            log("resetBeforeCall: notify the tone thread to exit.");
            return;
        } else
        {
            log("resetBeforeCall: do nothing.");
            return;
        }
    }

    void restartRinger()
    {
        log("restartRinger()...");
        if (!isRinging())
        {
            Call call = mCM.getFirstActiveRingingCall();
            log((new StringBuilder()).append("- ringingCall state: ").append(call.getState()).toString());
            if (call.getState() == com.android.internal.telephony.Call.State.INCOMING)
            {
                mRinger.ring();
                return;
            }
        }
    }

    void sendCdmaCallWaitingReject()
    {
        sendEmptyMessage(26);
    }

    void sendMwiChangedDelayed(long l, int i)
    {
        Message message = Message.obtain();
        int j = GeminiUtils.getIndexInArray(i, GeminiUtils.getSlots());
        log((new StringBuilder()).append("sendMwiChangedDelayed, error slot(): slotId=").append(i).append(" index:").append(j).toString());
        if (j != -1)
        {
            message.what = PHONE_MWI_CHANGED_GEMINI[j];
            sendMessageDelayed(message, l);
            return;
        } else
        {
            log("sendMwiChangedDelayed, error slot");
            return;
        }
    }

    void showMissedCallNotification(Connection connection, long l)
    {
        CustomInfo custominfo = new CustomInfo();
        custominfo.date = l;
        if (connection != null)
        {
            boolean flag = connection.isVideo();
            int i = 0;
            if (flag)
                i = 1;
            custominfo.callVideo = i;
        } else
        {
            custominfo.callVideo = 0;
        }
        PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(mApplication, connection, this, custominfo);
        if (callerinfotoken != null)
        {
            log("showMissedCallNotification: Querying for CallerInfo on missed call...");
            if (callerinfotoken.isFinal)
            {
                CallerInfo callerinfo = callerinfotoken.currentInfo;
                String s = callerinfo.name;
                String s1 = callerinfo.phoneNumber;
                if (callerinfo.isVoiceMailNumber())
                {
                    if (s == null)
                        s = callerinfo.phoneNumber;
                    if (connection != null)
                        s1 = connection.getAddress();
                }
                if (callerinfo.numberPresentation == PhoneConstants.PRESENTATION_RESTRICTED)
                    s = mApplication.getString(0x7f0d0177);
                else
                if (callerinfo.numberPresentation != PhoneConstants.PRESENTATION_ALLOWED)
                    s = mApplication.getString(0x7f0d0176);
                else
                    s1 = PhoneUtils.modifyForSpecialCnapCases(mApplication, callerinfo, s1, callerinfo.numberPresentation);
                mApplication.notificationMgr.notifyMissedCall(s, s1, callerinfo.phoneLabel, callerinfo.cachedPhoto, callerinfo.cachedPhotoIcon, l, custominfo.callVideo);
            }
            return;
        } else
        {
            Log.w("CallNotifier", (new StringBuilder()).append("showMissedCallNotification: got null CallerInfo for Connection ").append(connection).toString());
            return;
        }
    }

    void silenceRinger()
    {
        mSilentRingerRequested = true;
        log("stopRing()... (silenceRinger)");
        mRinger.stopRing();
    }

    void stopSignalInfoTone()
    {
        log("stopSignalInfoTone: Stopping SignalInfo tone player");
        (new SignalInfoTonePlayer(98)).start();
    }

    void switchRingToneByNeeded(Call call)
    {
        if (PhoneUtils.isRealIncomingCall(call.getState()))
        {
            CallerInfo callerinfo = getCallerInfoFromConnection(call.getLatestConnection());
            if (callerinfo != null)
            {
                Uri uri = callerinfo.contactRingtoneUri;
                if (uri == null)
                {
                    log("switchRingToneByNeeded: custUri == null");
                    if (VTCallUtils.isVideoCall(call))
                        uri = android.provider.Settings.System.DEFAULT_VIDEO_CALL_URI;
                    else
                        uri = android.provider.Settings.System.DEFAULT_RINGTONE_URI;
                }
                log((new StringBuilder()).append("switchRingToneByNeeded: ring call = ").append(call).toString());
                log((new StringBuilder()).append("switchRingToneByNeeded: new ringUri = ").append(uri).toString());
                log((new StringBuilder()).append("switchRingToneByNeeded: old ringUri = ").append(mRinger.getCustomRingToneUri()).toString());
                if (!uri.equals(mRinger.getCustomRingToneUri()))
                {
                    mRinger.stopRing();
                    mRinger.setCustomRingtoneUri(uri);
                    mRinger.ring();
                    log("switchRingToneByNeeded: stop and start new ring!");
                    return;
                }
            }
        }
    }

    void unregisterCallNotifierRegistrations()
    {
        Log.d("CallNotifier", "unregisterCallNotifierRegistrations...");
        removeMessages(2);
        removeMessages(1);
        removeMessages(3);
        removeMessages(5);
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.unregisterForDisconnect(obj, this);
        GeminiRegister.unregisterForIncomingRing(obj, this);
        GeminiRegister.unregisterForPreciseCallStateChanged(obj, this);
        GeminiRegister.unregisterForUnknownConnection(obj, this);
        GeminiRegister.unregisterForNewRingingConnection(obj, this);
        GeminiRegister.unregisterForRingbackTone(obj, this);
        GeminiRegister.unregisterForVtRingInfo(obj, this);
        GeminiRegister.unregisterForVtReplaceDisconnect(obj, this);
        if (GeminiUtils.isGeminiSupport())
        {
            int ai[] = GeminiUtils.getSlots();
            for (int i = 0; i < ai.length; i++)
            {
                mCMGemini.unregisterForCallWaitingGemini(this, ai[i]);
                mCMGemini.unregisterForDisplayInfoGemini(this, ai[i]);
                mCMGemini.unregisterForSignalInfoGemini(this, ai[i]);
                mCMGemini.unregisterForCdmaOtaStatusChangeGemini(this, ai[i]);
            }

            mCM.unregisterForCdmaOtaStatusChange2(this);
            mCM.unregisterForCallWaiting2(this);
            mCM.unregisterForDisplayInfo2(this);
            mCM.unregisterForSignalInfo2(this);
            mCM.unregisterForInCallVoicePrivacyOn2(this);
            mCM.unregisterForInCallVoicePrivacyOff2(this);
            return;
        } else
        {
            mCM.unregisterForCallWaiting(this);
            mCM.unregisterForDisplayInfo(this);
            mCM.unregisterForSignalInfo(this);
            mCM.unregisterForCdmaOtaStatusChange(this);
            mCM.unregisterForResendIncallMute(this);
            return;
        }
    }

    void updateCallNotifierRegistrationsAfterRadioTechnologyChange()
    {
        Log.d("CallNotifier", "updateCallNotifierRegistrationsAfterRadioTechnologyChange...");
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.unregisterForDisconnect(obj, this);
        GeminiRegister.unregisterForIncomingRing(obj, this);
        GeminiRegister.unregisterForPreciseCallStateChanged(obj, this);
        GeminiRegister.unregisterForUnknownConnection(obj, this);
        GeminiRegister.unregisterForNewRingingConnection(obj, this);
        GeminiRegister.unregisterForRingbackTone(obj, this);
        GeminiRegister.unregisterForVtRingInfo(obj, this);
        GeminiRegister.unregisterForVtReplaceDisconnect(obj, this);
        if (GeminiUtils.isGeminiSupport())
        {
            int ai[] = GeminiUtils.getSlots();
            int i = ai.length;
            for (int j = 0; j < i; j++)
            {
                int k = ai[j];
                mCMGemini.unregisterForCallWaitingGemini(this, k);
                mCMGemini.unregisterForDisplayInfoGemini(this, k);
                mCMGemini.unregisterForSignalInfoGemini(this, k);
                mCMGemini.unregisterForCdmaOtaStatusChangeGemini(this, k);
            }

            mCM.unregisterForCdmaOtaStatusChange2(this);
            mCM.unregisterForCallWaiting2(this);
            mCM.unregisterForDisplayInfo2(this);
            mCM.unregisterForSignalInfo2(this);
            mCM.unregisterForInCallVoicePrivacyOn2(this);
            mCM.unregisterForInCallVoicePrivacyOff2(this);
        } else
        {
            mCM.unregisterForCallWaiting(this);
            mCM.unregisterForDisplayInfo(this);
            mCM.unregisterForSignalInfo(this);
            mCM.unregisterForCdmaOtaStatusChange(this);
            mCM.unregisterForResendIncallMute(this);
        }
        if (mSignalInfoToneGenerator != null)
            mSignalInfoToneGenerator.release();
        mInCallRingbackTonePlayer = null;
        mCallWaitingTonePlayer = null;
        GeminiRegister.unregisterForInCallVoicePrivacyOn(obj, this);
        GeminiRegister.unregisterForInCallVoicePrivacyOff(obj, this);
        registerForNotifications();
    }

    public int writeNVData(int i, int j)
    {
        NvRAMAgent nvramagent = NvRAMAgent.Stub.asInterface(ServiceManager.getService("NvRAMAgent"));
        byte abyte1[] = nvramagent.readFile(35);
        byte abyte0[] = abyte1;
_L1:
        abyte0[i] = (byte)j;
        int l = nvramagent.writeFile(35, abyte0);
        int k = l;
_L2:
        System.out.println((new StringBuilder()).append("flag=").append(k).toString());
        return k;
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
        abyte0 = null;
          goto _L1
        Exception exception;
        exception;
        exception.printStackTrace();
        k = 0;
          goto _L2
    }





/*
    static int access$1102(CallNotifier callnotifier, int i)
    {
        callnotifier.mCurrentEmergencyToneState = i;
        return i;
    }

*/









/*
    static BluetoothHeadset access$502(CallNotifier callnotifier, BluetoothHeadset bluetoothheadset)
    {
        callnotifier.mBluetoothHeadset = bluetoothheadset;
        return bluetoothheadset;
    }

*/



}
