// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.bluetooth.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.media.AudioManager;
import android.net.Uri;
import android.os.*;
import android.telephony.*;
import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.mediatek.phone.DualTalkUtils;
import com.mediatek.telephony.TelephonyManagerEx;
import java.util.*;

// Referenced classes of package com.android.phone:
//            BluetoothAtPhonebook, PhoneGlobals, CdmaPhoneCallState, PhoneUtils, 
//            PhoneInterfaceManager

public class BluetoothHandsfree
{
    private class BluetoothPhoneState
    {

        private static final int PHONE_CDMA_CALL_WAITING = 4;
        private static final int PHONE_DISCONNECT = 6;
        private static final int PHONE_INCOMING_CDMA_RING = 9;
        private static final int PHONE_INCOMING_RING = 7;
        private static final int PHONE_VT_RING_INFO = 13;
        private static final int PRECISE_CALL_STATE_CHANGED = 2;
        private static final int RETRY_SCO_TIME_WINDOW = 1000;
        private static final int RING = 3;
        private static final int SERVICE_STATE_CHANGED = 1;
        private int mBattchg;
        private int mCall;
        private long mCallStartTime;
        private HashMap mCallStates;
        private int mCallheld;
        private int mCallsetup;
        private DualTalkUtils mDualTalk;
        private boolean mIgnoreRing;
        private String mRingingNumber;
        private int mRingingType;
        private int mRoam;
        private int mRssi;
        private int mService;
        private int mSignal;
        private int mStat;
        private Handler mStateChangeHandler = new _cls1();
        private final BroadcastReceiver mStateReceiver;
        private boolean mStopRing;
        final BluetoothHandsfree this$0;

        private int asuToSignal(SignalStrength signalstrength)
        {
            if (signalstrength.isGsm())
                return gsmAsuToSignal(signalstrength);
            else
                return cdmaDbmEcioToSignal(signalstrength);
        }

        private int cdmaDbmEcioToSignal(SignalStrength signalstrength)
        {
            byte byte2;
            byte byte3;
label0:
            {
                int i = signalstrength.getCdmaDbm();
                int j = signalstrength.getCdmaEcio();
                byte byte0;
                if (i >= -75)
                    byte0 = 4;
                else
                if (i >= -85)
                    byte0 = 3;
                else
                if (i >= -95)
                    byte0 = 2;
                else
                if (i >= -100)
                    byte0 = 1;
                else
                    byte0 = 0;
                byte byte1;
                if (j >= -90)
                    byte1 = 4;
                else
                if (j >= -110)
                    byte1 = 3;
                else
                if (j >= -130)
                    byte1 = 2;
                else
                if (j >= -150)
                    byte1 = 1;
                else
                    byte1 = 0;
                if (byte0 < byte1)
                    byte2 = byte0;
                else
                    byte2 = byte1;
                ServiceState servicestate = mServiceState;
                byte3 = 0;
                if (servicestate == null)
                    break label0;
                if (mServiceState.getNetworkType() != 5)
                {
                    int i1 = mServiceState.getNetworkType();
                    byte3 = 0;
                    if (i1 != 6)
                        break label0;
                }
                int k = signalstrength.getEvdoEcio();
                int l = signalstrength.getEvdoSnr();
                byte byte4;
                if (k >= -650)
                    byte4 = 4;
                else
                if (k >= -750)
                    byte4 = 3;
                else
                if (k >= -900)
                    byte4 = 2;
                else
                if (k >= -1050)
                    byte4 = 1;
                else
                    byte4 = 0;
                byte byte5;
                if (l > 7)
                    byte5 = 4;
                else
                if (l > 5)
                    byte5 = 3;
                else
                if (l > 3)
                    byte5 = 2;
                else
                if (l > 1)
                    byte5 = 1;
                else
                    byte5 = 0;
                if (byte4 < byte5)
                    byte3 = byte4;
                else
                    byte3 = byte5;
            }
            if (byte2 > byte3)
                return byte2;
            else
                return byte3;
        }

        private AtCommandResult cdmaRing()
        {
            BluetoothHandsfree.log("[API] cdmaRing");
            if (sendRingUpdate())
            {
                AtCommandResult atcommandresult = new AtCommandResult(2);
                atcommandresult.addResponse("RING");
                if (sendClipUpdate())
                    atcommandresult.addResponse((new StringBuilder()).append("+CLIP: \"").append(mRingingNumber).append("\",").append(mRingingType).toString());
                Message message = mStateChangeHandler.obtainMessage(9);
                mStateChangeHandler.sendMessageDelayed(message, 3000L);
                return atcommandresult;
            } else
            {
                return null;
            }
        }

        private int getCdmaCallHeldStatus(CdmaPhoneCallState.PhoneCallState phonecallstate, CdmaPhoneCallState.PhoneCallState phonecallstate1)
        {
            BluetoothHandsfree.log("[API] getCdmaCallHeldStatus");
            if (phonecallstate == CdmaPhoneCallState.PhoneCallState.CONF_CALL)
                return phonecallstate1 != CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE ? 1 : 0;
            return phonecallstate != CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE ? 0 : 1;
        }

        private AtCommandResult getCindTestResult()
        {
            this;
            JVM INSTR monitorenter ;
            AtCommandResult atcommandresult = new AtCommandResult("+CIND: (\"service\",(0-1)),(\"call\",(0-1)),(\"callsetup\",(0-3)),(\"callheld\",(0-2)),(\"signal\",(0-5)),(\"roam\",(0-1)),(\"battchg\",(0-5))");
            this;
            JVM INSTR monitorexit ;
            return atcommandresult;
            Exception exception;
            exception;
            throw exception;
        }

        private com.android.internal.telephony.Call.State getPrevCallState(Call call)
        {
            com.android.internal.telephony.Call.State state = (com.android.internal.telephony.Call.State)mCallStates.get(call);
            BluetoothHandsfree.log((new StringBuilder()).append("getPrevCallState: PrevState=").append(state).append(", Current Call=").append(call).toString());
            return state;
        }

        private int gsmAsuToSignal(SignalStrength signalstrength)
        {
            byte byte0 = 4;
            int i = signalstrength.getGsmSignalStrength();
            if (i >= 16)
                byte0 = 5;
            else
            if (i < 8)
            {
                if (i >= byte0)
                    return 3;
                if (i >= 2)
                    return 2;
                return i < 1 ? 0 : 1;
            }
            return byte0;
        }

        private void handlePreciseCallStateChange(boolean flag, Connection connection)
        {
            this;
            JVM INSTR monitorenter ;
            int i;
            int j;
            int k;
            i = 0;
            j = 0;
            k = 0;
            int l;
            int i1;
            AtCommandResult atcommandresult;
            Call call;
            Call call1;
            Call call2;
            List list;
            l = mCallsetup;
            i1 = mCall;
            atcommandresult = new AtCommandResult(2);
            BluetoothHandsfree.log("[handlePreciseCallStateChange]");
            call = mCM.getActiveFgCall();
            call1 = mCM.getFirstActiveBgCall();
            call2 = mCM.getFirstActiveRingingCall();
            list = mCM.getForegroundCalls();
            Object aobj[] = new Object[3];
            aobj[0] = Integer.valueOf(mCallsetup);
            aobj[1] = Integer.valueOf(mCall);
            aobj[2] = Integer.valueOf(mCallheld);
            BluetoothHandsfree.log(String.format("## handlePreciseCallStateChange() - mCallsetup = %d, mCall = %d, mCallheld = %d ##", aobj));
            BluetoothHandsfree.log(String.format("   >>>handlePreciseCallStateChange() - Connection info: %s", new Object[] {
                connection
            }));
            if (!flag);
            com.android.internal.telephony.PhoneConstants.State state;
            state = mCM.getState();
            Object aobj1[] = new Object[2];
            aobj1[0] = Integer.valueOf(mPhoneState.ordinal());
            aobj1[1] = Integer.valueOf(state.ordinal());
            BluetoothHandsfree.log(String.format("   >>>handlePreciseCallStateChange() - PhoneState: %d -> %d", aobj1));
            if (state == mPhoneState) goto _L2; else goto _L1
_L1:
            mPhoneState = state;
            static class _cls31
            {

                static final int $SwitchMap$com$android$internal$telephony$Call$State[];
                static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$State[];

                static 
                {
                    $SwitchMap$com$android$internal$telephony$Call$State = new int[com.android.internal.telephony.Call.State.values().length];
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.ACTIVE.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DIALING.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.ALERTING.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DISCONNECTING.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror3) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.INCOMING.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror4) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.WAITING.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror5) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.HOLDING.ordinal()] = 7;
                    }
                    catch (NoSuchFieldError nosuchfielderror6) { }
                    $SwitchMap$com$android$internal$telephony$PhoneConstants$State = new int[com.android.internal.telephony.PhoneConstants.State.values().length];
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.IDLE.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror7) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.RINGING.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror8) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.OFFHOOK.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror9)
                    {
                        return;
                    }
                }
            }

            _cls31..SwitchMap.com.android.internal.telephony.PhoneConstants.State[mPhoneState.ordinal()];
            JVM INSTR tableswitch 1 1: default 268
        //                       1 1415;
               goto _L3 _L4
_L3:
            callStarted();
_L2:
            com.android.internal.telephony.Call.State state1 = call.getState();
            _cls31..SwitchMap.com.android.internal.telephony.Call.State[state1.ordinal()];
            JVM INSTR tableswitch 1 4: default 320
        //                       1 1434
        //                       2 1454
        //                       3 1526
        //                       4 1553;
               goto _L5 _L6 _L7 _L8 _L9
_L5:
            mAudioPossible = false;
_L26:
            com.android.internal.telephony.Call.State state2 = call2.getState();
            _cls31..SwitchMap.com.android.internal.telephony.Call.State[state2.ordinal()];
            JVM INSTR tableswitch 4 6: default 372
        //                       4 1573
        //                       5 1858
        //                       6 1858;
               goto _L10 _L11 _L12 _L12
_L10:
            com.android.internal.telephony.Call.State state3 = call1.getState();
            _cls31..SwitchMap.com.android.internal.telephony.Call.State[state3.ordinal()];
            JVM INSTR tableswitch 4 7: default 420
        //                       4 1593
        //                       5 420
        //                       6 420
        //                       7 1864;
               goto _L13 _L14 _L13 _L13 _L15
_L13:
            Object aobj2[] = new Object[1];
            aobj2[0] = Integer.valueOf(state1.ordinal());
            BluetoothHandsfree.log(String.format("handlePreciseCallStateChange: Tag fgCall %d", aobj2));
            Object aobj3[] = new Object[1];
            aobj3[0] = Integer.valueOf(state3.ordinal());
            BluetoothHandsfree.log(String.format("handlePreciseCallStateChange: Tag bgCall %d", aobj3));
            Object aobj4[] = new Object[1];
            aobj4[0] = Integer.valueOf(state2.ordinal());
            BluetoothHandsfree.log(String.format("handlePreciseCallStateChange: Tag ringingCall %d", aobj4));
            if (i != 1)
                break MISSING_BLOCK_LABEL_604;
            if (mCall != i)
                break MISSING_BLOCK_LABEL_604;
            com.android.internal.telephony.Call.State state4 = getPrevCallState(call);
            if (mCallheld != 0 || state1 != com.android.internal.telephony.Call.State.ACTIVE || state4 != com.android.internal.telephony.Call.State.IDLE && state4 != com.android.internal.telephony.Call.State.DISCONNECTED && state4 != com.android.internal.telephony.Call.State.DISCONNECTING)
                break MISSING_BLOCK_LABEL_604;
            mCall = 0;
            if (!flag)
                break MISSING_BLOCK_LABEL_604;
            atcommandresult.addResponse((new StringBuilder()).append("+CIEV: 2,").append(mCall).toString());
            if (mCall == i)
                break MISSING_BLOCK_LABEL_717;
            if (i != 1)
                break MISSING_BLOCK_LABEL_644;
            mCallStartTime = System.currentTimeMillis();
            if (l == 2 || l == 3)
                break MISSING_BLOCK_LABEL_644;
            audioOn();
            mCall = i;
            if (!flag)
                break MISSING_BLOCK_LABEL_717;
            atcommandresult.addResponse((new StringBuilder()).append("+CIEV: 2,").append(mCall).toString());
            if (mCall == 0 && com.android.internal.telephony.Call.State.INCOMING == state2 && isMatchIOT1List())
            {
                BluetoothHandsfree.log("append CIEV: 3,1 !");
                atcommandresult.addResponse("+CIEV: 3,1");
            }
            if (mCallsetup == j)
                break MISSING_BLOCK_LABEL_870;
            mCallsetup = j;
            if (!flag)
                break MISSING_BLOCK_LABEL_790;
            if (i1 != 1)
                break MISSING_BLOCK_LABEL_762;
            if (mCallsetup == 1 || (2 & mRemoteBrsf) == 0)
                break MISSING_BLOCK_LABEL_790;
            atcommandresult.addResponse((new StringBuilder()).append("+CIEV: 3,").append(mCallsetup).toString());
            if (!isA2dpMultiProfile() || !isA2dpConnected() || !flag)
                break MISSING_BLOCK_LABEL_870;
            if (!mA2dpSuspended && mCall == 0 && mCallsetup == 1)
            {
                BluetoothHandsfree.log("suspending A2DP stream for incoming call [Pre-Condition: HFP SLC connected, Event: Phone ringing]");
                mA2dpSuspended = mA2dp.suspendSink(mA2dpDevice);
            }
            CdmaPhoneCallState.PhoneCallState phonecallstate;
            CdmaPhoneCallState.PhoneCallState phonecallstate1;
            if (mCM.getDefaultPhone().getPhoneType() != 2)
                break MISSING_BLOCK_LABEL_1134;
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            if (phoneglobals.cdmaPhoneCallState == null)
                break MISSING_BLOCK_LABEL_1134;
            phonecallstate = phoneglobals.cdmaPhoneCallState.getCurrentCallState();
            phonecallstate1 = phoneglobals.cdmaPhoneCallState.getPreviousCallState();
            BluetoothHandsfree.log((new StringBuilder()).append("CDMA call state: ").append(phonecallstate).append(" prev state:").append(phonecallstate1).toString());
            k = getCdmaCallHeldStatus(phonecallstate, phonecallstate1);
            if (mCdmaThreeWayCallState == phonecallstate)
                break MISSING_BLOCK_LABEL_1125;
            if (phonecallstate != CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE || !phoneglobals.cdmaPhoneCallState.IsThreeWayCallOrigStateDialing())
                break MISSING_BLOCK_LABEL_1068;
            mAudioPossible = true;
            if (!flag)
                break MISSING_BLOCK_LABEL_1061;
            if ((2 & mRemoteBrsf) != 0)
            {
                atcommandresult.addResponse("+CIEV: 3,2");
                atcommandresult.addResponse("+CIEV: 4,1");
                mCallheld = k;
                atcommandresult.addResponse("+CIEV: 3,3");
                atcommandresult.addResponse("+CIEV: 3,0");
            }
            callStarted();
            if (phonecallstate != CdmaPhoneCallState.PhoneCallState.CONF_CALL || phonecallstate1 != CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE)
                break MISSING_BLOCK_LABEL_1125;
            mAudioPossible = true;
            if (!flag)
                break MISSING_BLOCK_LABEL_1125;
            if ((2 & mRemoteBrsf) != 0)
            {
                atcommandresult.addResponse("+CIEV: 2,1");
                atcommandresult.addResponse("+CIEV: 3,0");
            }
            mCdmaThreeWayCallState = phonecallstate;
            if (mCM.getDefaultPhone().getPhoneType() != 2 || mCdmaThreeWayCallState != CdmaPhoneCallState.PhoneCallState.CONF_CALL) goto _L17; else goto _L16
_L16:
            boolean flag1 = mCdmaCallsSwapped;
_L28:
            if (mCallheld == k && !flag1)
                break MISSING_BLOCK_LABEL_1227;
            mCallheld = k;
            if (!flag)
                break MISSING_BLOCK_LABEL_1227;
            atcommandresult.addResponse((new StringBuilder()).append("+CIEV: 4,").append(mCallheld).toString());
            if (j != 1 || j == l) goto _L19; else goto _L18
_L18:
            int j1;
            j1 = 128;
            if (connection != null)
                break MISSING_BLOCK_LABEL_1265;
            connection = call2.getEarliestConnection();
            if (connection != null)
                break MISSING_BLOCK_LABEL_1265;
            BluetoothHandsfree.logErr("Could not get a handle on Connection object for new incoming call");
            String s = null;
            if (connection == null) goto _L21; else goto _L20
_L20:
            s = connection.getAddress();
            if (s == null) goto _L21; else goto _L22
_L22:
            j1 = PhoneNumberUtils.toaFromString(s);
              goto _L21
_L31:
            if (!flag) goto _L24; else goto _L23
_L23:
            if ((2 & mRemoteBrsf) != 0)
            {
                atcommandresult.addResponse((new StringBuilder()).append("+CCWA: \"").append(s).append("\",").append(j1).toString());
                atcommandresult.addResponse((new StringBuilder()).append("+CIEV: 3,").append(j).toString());
            }
_L19:
            for (Iterator iterator = list.iterator(); iterator.hasNext(); setPrevCallState((Call)iterator.next()));
              goto _L25
            Exception exception;
            exception;
            throw exception;
_L4:
            mUserWantsAudio = true;
            audioOff();
              goto _L2
_L6:
            i = 1;
            mAudioPossible = true;
            k = 0;
            j = 0;
              goto _L26
_L7:
            j = 2;
            int k1;
            mAudioPossible = true;
            if (mCM.getFgPhone().getPhoneType() == 1)
                callStarted();
            k1 = mCallsetup;
            i = 0;
            k = 0;
            if (j == k1) goto _L26; else goto _L27
_L27:
            audioOn();
            i = 0;
            k = 0;
              goto _L26
_L8:
            j = 3;
            mCallStartTime = System.currentTimeMillis();
            mAudioPossible = true;
            i = 0;
            k = 0;
              goto _L26
_L9:
            i = mCall;
            j = mCallsetup;
            k = mCallheld;
              goto _L26
_L11:
            i = mCall;
            j = mCallsetup;
            k = mCallheld;
              goto _L10
_L14:
            i = mCall;
            j = mCallsetup;
            k = mCallheld;
              goto _L13
_L17:
            if (k != 1)
                break MISSING_BLOCK_LABEL_1883;
            if (call1.getEarliestConnectTime() == mBgndEarliestConnectionTime)
                break MISSING_BLOCK_LABEL_1883;
            flag1 = true;
_L32:
            mBgndEarliestConnectionTime = call1.getEarliestConnectTime();
              goto _L28
_L24:
            mRingingNumber = s;
            mRingingType = j1;
            mIgnoreRing = false;
            mStopRing = false;
            if ((8 & mLocalBrsf) != 0)
            {
                mCallStartTime = System.currentTimeMillis();
                audioOn();
            }
            if (call2 == null) goto _L19; else goto _L29
_L29:
            if (call2.getPhone().getPhoneType() != 2 || cdmaRing() == null) goto _L19; else goto _L30
_L30:
            atcommandresult.addResult(cdmaRing());
              goto _L19
_L25:
            sendURC(atcommandresult.toString());
            if (l != 1)
                break MISSING_BLOCK_LABEL_1827;
            if (mA2dpSuspended && mCall == 0 && mCallsetup == 0)
            {
                if (isA2dpMultiProfile())
                {
                    BluetoothHandsfree.log("resuming A2DP stream [Pre-Condition: A2DP is suspended  Event: Ringing stops]");
                    mA2dp.resumeSink(mA2dpDevice);
                }
                mA2dpSuspended = false;
            }
            BluetoothHandsfree.log("[[handlePreciseCallStateChange]]");
            this;
            JVM INSTR monitorexit ;
            return;
_L21:
            if (s == null)
                s = "";
            if (i == 0 && k == 0) goto _L24; else goto _L31
_L12:
            j = 1;
              goto _L10
_L15:
            if (i == 1)
            {
                k = 1;
            } else
            {
                i = 1;
                k = 2;
            }
              goto _L13
            flag1 = false;
              goto _L32
        }

        private void ignoreRing()
        {
            this;
            JVM INSTR monitorenter ;
            mCallsetup = 0;
            mIgnoreRing = true;
            if (sendUpdate())
                sendURC((new StringBuilder()).append("+CIEV: 3,").append(mCallsetup).toString());
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            throw exception;
        }

        private boolean isCallSwapping()
        {
            return PhoneUtils.getPhoneSwapStatus();
        }

        private boolean isMatchIOT1List()
        {
            BluetoothDevice bluetoothdevice;
            boolean flag;
            bluetoothdevice = mConnectedAudioDevice;
            flag = false;
            if (bluetoothdevice == null) goto _L2; else goto _L1
_L1:
            String s;
            String as[];
            int i;
            int j;
            s = mConnectedAudioDevice.getAddress();
            as = BluetoothHandsfree.IOT1_DEVICES;
            i = as.length;
            j = 0;
_L7:
            flag = false;
            if (j >= i) goto _L2; else goto _L3
_L3:
            if (!s.equals(as[j])) goto _L5; else goto _L4
_L4:
            flag = true;
_L2:
            return flag;
_L5:
            j++;
            if (true) goto _L7; else goto _L6
_L6:
        }

        private void processPendingSCO()
        {
            mHandler.removeMessages(6);
            BluetoothHandsfree.log("A2DP suspended, completing SCO");
            if (mHeadset.connect())
            {
                BluetoothDevice bluetoothdevice = mHeadset.getRemoteDevice();
                BluetoothHandsfree.log((new StringBuilder()).append("onReceive: device=").append(bluetoothdevice).append(" state=").append(getAudioState(bluetoothdevice)).toString());
                if (10 == getAudioState(bluetoothdevice))
                {
                    BluetoothHandsfree.log((new StringBuilder()).append("onReceive: device=").append(bluetoothdevice).append(" from state= STATE_AUDIO_DISCONNECTED to state = STATE_AUDIO_CONNECTING").toString());
                    setAudioState(11, bluetoothdevice);
                    mSCOConnecting = true;
                }
            }
        }

        private void registerPhoneEvents(boolean flag)
        {
            BluetoothHandsfree.log((new StringBuilder()).append("registerPhoneEvents(").append(String.valueOf(flag)).append(")").toString());
            if (flag)
            {
                int k = BluetoothHandsfree.getSimCount();
                for (int l = 0; l < k + 0; l++)
                {
                    mMCM.registerForServiceStateChangedGemini(mStateChangeHandler, 1, Integer.valueOf(l), l);
                    mMCM.registerForPreciseCallStateChangedGemini(mStateChangeHandler, 2, null, l);
                    mMCM.registerForIncomingRingGemini(mStateChangeHandler, 7, null, l);
                    mMCM.registerForCallWaitingGemini(mStateChangeHandler, 4, null, l);
                    mMCM.registerForDisconnectGemini(mStateChangeHandler, 6, null, l);
                }

            } else
            {
                int i = BluetoothHandsfree.getSimCount();
                for (int j = 0; j < i + 0; j++)
                {
                    mMCM.unregisterForServiceStateChangedGemini(mStateChangeHandler, j);
                    mMCM.unregisterForPreciseCallStateChangedGemini(mStateChangeHandler, j);
                    mMCM.unregisterForIncomingRingGemini(mStateChangeHandler, j);
                    mMCM.unregisterForCallWaitingGemini(mStateChangeHandler, j);
                    mMCM.unregisterForDisconnectGemini(mStateChangeHandler, j);
                }

            }
        }

        private void restrictDualTalkStatus(boolean flag)
        {
            AtCommandResult atcommandresult;
            Call call;
            Call call1;
            Call call2;
            List list;
            List list1;
            boolean flag1;
            boolean flag3;
            boolean flag4;
label0:
            {
                BluetoothHandsfree.log((new StringBuilder()).append("restrictDualTalkStatus(").append(flag).append(")").toString());
                atcommandresult = new AtCommandResult(2);
                call = mCM.getActiveFgCall();
                call1 = mCM.getFirstActiveBgCall();
                call2 = mCM.getFirstActiveRingingCall();
                list = mCM.getRingingCalls();
                list1 = mCM.getBackgroundCalls();
                if (call.getState() != com.android.internal.telephony.Call.State.DIALING)
                {
                    com.android.internal.telephony.Call.State state2 = call.getState();
                    com.android.internal.telephony.Call.State state3 = com.android.internal.telephony.Call.State.ALERTING;
                    flag1 = false;
                    if (state2 != state3)
                        break label0;
                }
                flag1 = true;
            }
            boolean flag2 = call2.getState().isRinging();
            flag3 = false;
            if (flag2)
                flag3 = true;
            com.android.internal.telephony.Call.State state = call1.getState();
            com.android.internal.telephony.Call.State state1 = com.android.internal.telephony.Call.State.HOLDING;
            flag4 = false;
            if (state == state1)
                flag4 = true;
            if (!flag3) goto _L2; else goto _L1
_L1:
            if (!flag1) goto _L4; else goto _L3
_L3:
            if (mCallsetup > 0 && !flag)
            {
                mCallsetup = 0;
                atcommandresult.addResponse("+CIEV: 3,0");
                sendURC(atcommandresult.toString());
            }
            BluetoothHandsfree.log("hangup outgoing call when (I, O)");
            mCM.hangupActiveCall(call);
_L9:
            return;
            CallStateException callstateexception;
            callstateexception;
            BluetoothHandsfree.logErr("mCM.hangupActiveCall failed");
            return;
_L4:
            Iterator iterator1 = list.iterator();
_L7:
            if (!iterator1.hasNext()) goto _L2; else goto _L5
_L5:
            Call call4 = (Call)iterator1.next();
            if (call4 == call2 || !call4.getState().isRinging()) goto _L7; else goto _L6
_L6:
            if (flag)
                if (mDualTalk != null)
                {
                    BluetoothHandsfree.log("hangup background incoming call when (I, I)");
                    PhoneUtils.hangupRingingCall(mDualTalk.getSecondActiveRingCall());
                    return;
                } else
                {
                    BluetoothHandsfree.log("fail to hangup background incoming call when (I, I), mDualTalk == null");
                    return;
                }
            BluetoothHandsfree.log("hangup new incoming call when (I, I)");
            if (call2.getEarliestConnection().getCreateTime() > call4.getEarliestConnection().getCreateTime())
            {
                PhoneUtils.hangupRingingCall(call2);
                return;
            } else
            {
                PhoneUtils.hangupRingingCall(call4);
                return;
            }
_L2:
            Call call3;
            if (!flag4)
                continue; /* Loop/switch isn't completed */
            Iterator iterator = list1.iterator();
            do
            {
                if (!iterator.hasNext())
                    continue; /* Loop/switch isn't completed */
                call3 = (Call)iterator.next();
            } while (call3 == call1 || call3.getState() != com.android.internal.telephony.Call.State.HOLDING);
            break; /* Loop/switch isn't completed */
            if (true) goto _L9; else goto _L8
_L8:
            BluetoothHandsfree.log("hangup hold call which hold first when (H, H)");
            if (isCallSwapping())
            {
                BluetoothHandsfree.log("Don't restrict (H, H) now for call is swapping");
                return;
            }
            if (call1.getEarliestConnection().getCreateTime() > call3.getEarliestConnection().getCreateTime())
            {
                PhoneUtils.hangupHoldingCall(call3);
                return;
            } else
            {
                PhoneUtils.hangupHoldingCall(call1);
                return;
            }
        }

        private AtCommandResult ring()
        {
            BluetoothHandsfree.log("[API] ring");
            if (sendRingUpdate())
            {
                AtCommandResult atcommandresult = new AtCommandResult(2);
                atcommandresult.addResponse("RING");
                if (sendClipUpdate())
                    atcommandresult.addResponse((new StringBuilder()).append("+CLIP: \"").append(mRingingNumber).append("\",").append(mRingingType).toString());
                return atcommandresult;
            } else
            {
                return null;
            }
        }

        private void scoClosed()
        {
            synchronized (BluetoothHandsfree.this)
            {
                if (mUserWantsAudio && System.currentTimeMillis() - mCallStartTime < 1000L)
                {
                    Message message = mHandler.obtainMessage(8);
                    mHandler.sendMessage(message);
                }
            }
            return;
            exception;
            bluetoothhandsfree;
            JVM INSTR monitorexit ;
            throw exception;
        }

        private boolean sendClipUpdate()
        {
            return isHeadsetConnected() && mHeadsetType == 2 && mClip && mServiceConnectionEstablished;
        }

        private boolean sendRingUpdate()
        {
            boolean flag = isHeadsetConnected();
            boolean flag1 = mCM.getFirstActiveRingingCall().isRinging();
            BluetoothHandsfree.log((new StringBuilder()).append("sendRingUpdate(): bIsHeadsetConnected = ").append(flag).append(",mIgnoreRing = ").append(mIgnoreRing).append(",mStopRing = ").append(mStopRing).append(",bisRinging = ").append(flag1).append(",mHeadsetType = ").append(mHeadsetType).append(",mServiceConnectionEstablished = ").append(mServiceConnectionEstablished).toString());
            if (flag && !mIgnoreRing && !mStopRing && flag1)
                return mHeadsetType != 2 || mServiceConnectionEstablished;
            else
                return false;
        }

        private boolean sendUpdate()
        {
            return isHeadsetConnected() && mHeadsetType == 2 && mIndicatorsEnabled && mServiceConnectionEstablished;
        }

        private void setPrevCallState(Call call)
        {
            if (call == null)
            {
                return;
            } else
            {
                call.getState();
                BluetoothHandsfree.log((new StringBuilder()).append("setPrevCallState: Call=").append(call).toString());
                mCallStates.put(call, call.getState());
                return;
            }
        }

        private int signalToRssi(int i)
        {
            switch (i)
            {
            case 5: // '\005'
                return 31;

            case 4: // '\004'
                return 19;

            case 3: // '\003'
                return 13;

            case 2: // '\002'
                return 8;

            case 1: // '\001'
                return 4;

            case 0: // '\0'
            default:
                return 0;
            }
        }

        private void stopRing()
        {
            mStopRing = true;
        }

        private AtCommandResult toCindResult()
        {
            this;
            JVM INSTR monitorenter ;
            AtCommandResult atcommandresult = new AtCommandResult(0);
            if (!isVirtualCallInProgress()) goto _L2; else goto _L1
_L1:
            int i;
            int j;
            i = 1;
            j = 0;
_L4:
            if (isA2dpMultiProfile() && isA2dpConnected() && !mA2dpSuspended && mCall == 0 && mCallsetup == 1)
            {
                BluetoothHandsfree.log("suspending A2DP stream for incoming call [Pre-Condition: Phone ringing, Event: HFP reconnects, AT+CIND?]");
                mA2dpSuspended = mA2dp.suspendSink(mA2dpDevice);
            }
            mSignal = asuToSignal(mCM.getDefaultPhone().getSignalStrength());
            String s = (new StringBuilder()).append("+CIND: ").append(mService).append(",").append(i).append(",").append(j).append(",").append(mCallheld).append(",").append(mSignal).append(",").append(mRoam).append(",").append(mBattchg).toString();
            if (mService == 0)
            {
                s = (new StringBuilder()).append("+CIND: ").append(mService).append(",").append(i).append(",").append(j).append(",").append(mCallheld).append(",").append(0).append(",").append(mRoam).append(",").append(mBattchg).toString();
                BluetoothHandsfree.log((new StringBuilder()).append("[toCindResult] mService=").append(mService).append(" mSignal=").append(mSignal).append(" [").append(s).append("]").toString());
            }
            atcommandresult.addResponse(s);
            this;
            JVM INSTR monitorexit ;
            return atcommandresult;
_L2:
            i = mCall;
            j = mCallsetup;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            throw exception;
        }

        private String toCregString()
        {
            this;
            JVM INSTR monitorenter ;
            String s = new String((new StringBuilder()).append("+CREG: 1,").append(mStat).toString());
            this;
            JVM INSTR monitorexit ;
            return s;
            Exception exception;
            exception;
            throw exception;
        }

        private AtCommandResult toCsqResult()
        {
            this;
            JVM INSTR monitorenter ;
            AtCommandResult atcommandresult;
            atcommandresult = new AtCommandResult(0);
            atcommandresult.addResponse((new StringBuilder()).append("+CSQ: ").append(mRssi).append(",99").toString());
            this;
            JVM INSTR monitorexit ;
            return atcommandresult;
            Exception exception;
            exception;
            throw exception;
        }

        private void updateBatteryState(Intent intent)
        {
            this;
            JVM INSTR monitorenter ;
            int i;
            int j;
            i = intent.getIntExtra("level", -1);
            j = intent.getIntExtra("scale", -1);
            BluetoothHandsfree.log("[API] updateBatteryState");
            if (i != -1 && j != -1) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            int k = i * 5;
            int l = k / j;
            if (mBattchg != l)
            {
                mBattchg = l;
                if (sendUpdate())
                    sendURC((new StringBuilder()).append("+CIEV: 7,").append(mBattchg).toString());
            }
            if (true) goto _L1; else goto _L3
_L3:
            Exception exception;
            exception;
            throw exception;
        }

        private void updateBtPhoneStateAfterRadioTechnologyChange()
        {
            BluetoothHandsfree.log("updateBtPhoneStateAfterRadioTechnologyChange...");
            registerPhoneEvents(false);
            registerPhoneEvents(true);
        }

        private void updateCallHeld()
        {
            this;
            JVM INSTR monitorenter ;
            if (mCallheld != 0)
            {
                mCallheld = 0;
                sendURC("+CIEV: 4,0");
            }
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            throw exception;
        }

        private void updateServiceState(boolean flag, ServiceState servicestate)
        {
            int i = 1;
            this;
            JVM INSTR monitorenter ;
            int j;
            boolean flag1;
            int k;
            AtCommandResult atcommandresult;
            if (servicestate.getState() == 0)
                j = i;
            else
                j = 0;
            flag1 = servicestate.getRoaming();
            k = 0;
            if (flag1)
                k = i;
            atcommandresult = new AtCommandResult(2);
            mServiceState = servicestate;
            BluetoothHandsfree.log((new StringBuilder()).append("[API] updateServiceState service=").append(j).append(", mService=").append(mService).append(", roam=").append(k).append(", mRoam=").append(mRoam).toString());
            if (j != 0) goto _L2; else goto _L1
_L1:
            i = 0;
_L4:
            if (j == mService)
                break MISSING_BLOCK_LABEL_165;
            mService = j;
            if (!flag)
                break MISSING_BLOCK_LABEL_165;
            atcommandresult.addResponse((new StringBuilder()).append("+CIEV: 1,").append(mService).toString());
            if (k == mRoam)
                break MISSING_BLOCK_LABEL_212;
            mRoam = k;
            if (!flag)
                break MISSING_BLOCK_LABEL_212;
            atcommandresult.addResponse((new StringBuilder()).append("+CIEV: 6,").append(mRoam).toString());
            if (i == mStat)
                break MISSING_BLOCK_LABEL_238;
            mStat = i;
            if (!flag)
                break MISSING_BLOCK_LABEL_238;
            atcommandresult.addResponse(toCregString());
            sendURC(atcommandresult.toString());
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            if (k == i)
                i = 5;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            throw exception;
        }

        private void updateSignalState(Intent intent)
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag = isHeadsetConnected();
            if (flag) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            SignalStrength signalstrength;
            signalstrength = SignalStrength.newFromBundle(intent.getExtras());
            BluetoothHandsfree.log("[API] updateSignalState");
            if (signalstrength == null)
                break MISSING_BLOCK_LABEL_115;
            int i = asuToSignal(signalstrength);
            mRssi = signalToRssi(i);
            if (i != mSignal)
            {
                mSignal = i;
                if (sendUpdate())
                    sendURC((new StringBuilder()).append("+CIEV: 5,").append(mSignal).toString());
            }
              goto _L1
            Exception exception;
            exception;
            throw exception;
            BluetoothHandsfree.logErr("Signal Strength null");
              goto _L1
        }




















        private BluetoothPhoneState()
        {
            this$0 = BluetoothHandsfree.this;
            super();
            mIgnoreRing = false;
            mStopRing = false;
            mCallStates = new HashMap();
            mCallStartTime = 0L;
            mStateReceiver = new _cls2();
            updateServiceState(false, mCM.getDefaultPhone().getServiceState());
            handlePreciseCallStateChange(false, null);
            mBattchg = 5;
            mSignal = asuToSignal(mCM.getDefaultPhone().getSignalStrength());
            if (DualTalkUtils.isSupportDualTalk() && mDualTalk == null)
            {
                mDualTalk = DualTalkUtils.getInstance();
                if (mDualTalk != null)
                    BluetoothHandsfree.log("get mDualTalk instance succeed");
                else
                    BluetoothHandsfree.logErr("get mDualTalk instance failed");
            }
            registerPhoneEvents(true);
            IntentFilter intentfilter = new IntentFilter("android.intent.action.BATTERY_CHANGED");
            intentfilter.addAction("android.intent.action.SIG_STR");
            intentfilter.addAction("android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED");
            intentfilter.addAction("android.bluetooth.a2dp.profile.action.PLAYING_STATE_CHANGED");
            intentfilter.addAction("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY");
            mContext.registerReceiver(mStateReceiver, intentfilter);
        }

    }

    private class DebugThread extends Thread
    {

        static final String DEBUG_HANDSFREE = "debug.bt.hfp";
        static final String DEBUG_HANDSFREE_AUDIO = "debug.bt.hfp.audio";
        static final String DEBUG_HANDSFREE_AUDIO_ANYTIME = "debug.bt.hfp.audio_anytime";
        static final String DEBUG_HANDSFREE_BATTERY = "debug.bt.hfp.battery";
        static final String DEBUG_HANDSFREE_CLCC = "debug.bt.hfp.clcc";
        static final String DEBUG_HANDSFREE_ROAM = "debug.bt.hfp.roam";
        static final String DEBUG_HANDSFREE_SERVICE = "debug.bt.hfp.service";
        static final String DEBUG_HANDSFREE_SIGNAL = "debug.bt.hfp.signal";
        static final String DEBUG_UNSOL_INBAND_RINGTONE = "debug.bt.unsol.inband";
        final BluetoothHandsfree this$0;

        public void run()
        {
            boolean flag = true;
            boolean flag1 = false;
            boolean flag2 = false;
            do
            {
                if (isInterrupted() || !inDebug())
                    break;
                int i = SystemProperties.getInt("debug.bt.hfp.battery", -1);
                if (i >= 0 && i <= 5)
                {
                    Intent intent1 = new Intent();
                    intent1.putExtra("level", i);
                    intent1.putExtra("scale", 5);
                    mBluetoothPhoneState.updateBatteryState(intent1);
                }
                boolean flag3 = SystemProperties.getBoolean("debug.bt.hfp.service", true);
                boolean flag4 = flag;
                boolean flag5 = false;
                if (flag3 != flag4)
                {
                    Bundle bundle;
                    int k;
                    int l;
                    AtCommandResult atcommandresult;
                    SignalStrength signalstrength;
                    Intent intent;
                    Bundle bundle1;
                    if (!flag)
                        flag = true;
                    else
                        flag = false;
                    flag5 = true;
                }
                if (SystemProperties.getBoolean("debug.bt.hfp.roam", false) != flag1)
                {
                    if (!flag1)
                        flag1 = true;
                    else
                        flag1 = false;
                    flag5 = true;
                }
                if (flag5)
                {
                    bundle = new Bundle();
                    int j;
                    if (flag)
                        j = 0;
                    else
                        j = 1;
                    bundle.putInt("state", j);
                    bundle.putBoolean("roaming", flag1);
                    mBluetoothPhoneState.updateServiceState(true, ServiceState.newFromBundle(bundle));
                }
                if (SystemProperties.getBoolean("debug.bt.hfp.audio", false) != flag2)
                {
                    if (!flag2)
                        flag2 = true;
                    else
                        flag2 = false;
                    if (flag2)
                        audioOn();
                    else
                        audioOff();
                }
                k = SystemProperties.getInt("debug.bt.hfp.signal", -1);
                if (k >= 0 && k <= 31)
                {
                    signalstrength = new SignalStrength(k, -1, -1, -1, -1, -1, -1, true);
                    intent = new Intent();
                    bundle1 = new Bundle();
                    signalstrength.fillInNotifierBundle(bundle1);
                    intent.putExtras(bundle1);
                    mBluetoothPhoneState.updateSignalState(intent);
                }
                if (SystemProperties.getBoolean("debug.bt.hfp.clcc", false))
                    BluetoothHandsfree.log(gsmGetClccResult().toString());
                try
                {
                    sleep(1000L);
                }
                catch (InterruptedException interruptedexception)
                {
                    break;
                }
                l = SystemProperties.getInt("debug.bt.unsol.inband", -1);
                if (l == 0 || l == 1)
                {
                    atcommandresult = new AtCommandResult(2);
                    atcommandresult.addResponse((new StringBuilder()).append("+BSIR: ").append(l).toString());
                    sendURC(atcommandresult.toString());
                }
            } while (true);
        }

        private DebugThread()
        {
            this$0 = BluetoothHandsfree.this;
            super();
        }

    }

    private final class HandsfreeMessageHandler extends Handler
    {

        final BluetoothHandsfree this$0;

        public void handleMessage(Message message)
        {
            BluetoothHandsfree.log((new StringBuilder()).append("[API] mHandler.handleMessage(").append(String.valueOf(message.what)).append(")").toString());
            message.what;
            JVM INSTR tableswitch 4 11: default 84
        //                       4 85
        //                       5 172
        //                       6 226
        //                       7 452
        //                       8 496
        //                       9 536
        //                       10 554
        //                       11 162;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9
_L1:
            return;
_L2:
            synchronized (BluetoothHandsfree.this)
            {
                if (mWaitingForCallStart)
                {
                    mWaitingForCallStart = false;
                    BluetoothHandsfree.logErr("Timeout waiting for call to start");
                    sendURC("ERROR");
                    if (mStartCallWakeLock.isHeld())
                        mStartCallWakeLock.release();
                }
            }
            return;
            exception3;
            bluetoothhandsfree2;
            JVM INSTR monitorexit ;
            throw exception3;
_L9:
            mWaitingForOutCallStart = false;
            return;
_L3:
            synchronized (BluetoothHandsfree.this)
            {
                if (mWaitingForVoiceRecognition)
                {
                    mWaitingForVoiceRecognition = false;
                    BluetoothHandsfree.logErr("Timeout waiting for voice recognition to start");
                    sendURC("ERROR");
                }
            }
            return;
            exception2;
            bluetoothhandsfree1;
            JVM INSTR monitorexit ;
            throw exception2;
_L4:
            synchronized (BluetoothHandsfree.this)
            {
                if (mPendingSco && isA2dpMultiProfile())
                {
                    BluetoothHandsfree.logWarn((new StringBuilder()).append("Timeout suspending A2DP for SCO (mA2dpState = ").append(mA2dpState).append(", mA2dpPlayingState = ").append(mA2dpPlayingState).append("). Starting SCO anyway").toString());
                    if (mHeadset.connect())
                    {
                        BluetoothDevice bluetoothdevice1 = mHeadset.getRemoteDevice();
                        BluetoothHandsfree.log((new StringBuilder()).append("handleMessage: device=").append(bluetoothdevice1).append(" state=").append(getAudioState(bluetoothdevice1)).toString());
                        if (10 == getAudioState(bluetoothdevice1))
                        {
                            BluetoothHandsfree.log((new StringBuilder()).append("handleMessage: device=").append(bluetoothdevice1).append(" from state= STATE_AUDIO_DISCONNECTED to state = STATE_AUDIO_CONNECTING").toString());
                            setAudioState(11, bluetoothdevice1);
                            mSCOConnecting = true;
                        }
                    }
                }
                mPendingSco = false;
            }
            return;
            exception1;
            bluetoothhandsfree;
            JVM INSTR monitorexit ;
            throw exception1;
_L5:
            BluetoothDevice bluetoothdevice = (BluetoothDevice)message.obj;
            if (getAudioState(bluetoothdevice) == 11)
            {
                setAudioState(10, bluetoothdevice);
                mSCOConnecting = false;
                return;
            }
              goto _L1
_L6:
            synchronized (mBluetoothPhoneState)
            {
                if (mBluetoothPhoneState.mCall == 1)
                    audioOn();
            }
            return;
            exception;
            bluetoothphonestate;
            JVM INSTR monitorexit ;
            throw exception;
_L7:
            mBluetoothPhoneState.updateBatteryState((Intent)message.obj);
            return;
_L8:
            mBluetoothPhoneState.updateSignalState((Intent)message.obj);
            return;
        }

        private HandsfreeMessageHandler(Looper looper)
        {
            this$0 = BluetoothHandsfree.this;
            super(looper);
        }

    }

    private class VendorSpecificCommandHandler extends AtCommandHandler
    {

        private String mCommandName;
        private int mCompanyId;
        final BluetoothHandsfree this$0;

        public AtCommandResult handleActionCommand()
        {
            return new AtCommandResult(1);
        }

        public AtCommandResult handleReadCommand()
        {
            return new AtCommandResult(1);
        }

        public AtCommandResult handleSetCommand(Object aobj[])
        {
            broadcastVendorSpecificEventIntent(mCommandName, mCompanyId, 2, aobj, mHeadset.getRemoteDevice());
            return new AtCommandResult(0);
        }

        public AtCommandResult handleTestCommand()
        {
            return new AtCommandResult(1);
        }

        private VendorSpecificCommandHandler(String s, int i)
        {
            this$0 = BluetoothHandsfree.this;
            super();
            mCommandName = s;
            mCompanyId = i;
        }

    }


    private static final int BATTERY_CHANGED = 9;
    private static final int BRSF_AG_EC_NR = 2;
    private static final int BRSF_AG_ENHANCED_CALL_CONTROL = 128;
    private static final int BRSF_AG_ENHANCED_CALL_STATUS = 64;
    private static final int BRSF_AG_ENHANCED_ERR_RESULT_CODES = 256;
    private static final int BRSF_AG_IN_BAND_RING = 8;
    private static final int BRSF_AG_REJECT_CALL = 32;
    private static final int BRSF_AG_THREE_WAY_CALLING = 1;
    private static final int BRSF_AG_VOICE_RECOG = 4;
    private static final int BRSF_AG_VOICE_TAG_NUMBE = 16;
    private static final int BRSF_HF_CLIP = 4;
    private static final int BRSF_HF_CW_THREE_WAY_CALLING = 2;
    private static final int BRSF_HF_EC_NR = 1;
    private static final int BRSF_HF_ENHANCED_CALL_CONTROL = 64;
    private static final int BRSF_HF_ENHANCED_CALL_STATUS = 32;
    private static final int BRSF_HF_REMOTE_VOL_CONTROL = 16;
    private static final int BRSF_HF_VOICE_REG_ACT = 8;
    private static final int CDMA_MAX_CONNECTIONS = 2;
    private static final int CHECK_CALL_STARTED = 4;
    private static final int CHECK_OUT_CALL_STARTED = 11;
    private static final int CHECK_VOICE_RECOGNITION_STARTED = 5;
    static final int CONTACTS_ID_COLUMN_INDEX = 0;
    static final int CONTACTS_NAME_COLUMN_INDEX = 1;
    private static final boolean DBG = true;
    private static final String GEMINI_SIM_NUM = "persist.gemini.sim_num";
    private static final int GSM_MAX_CONNECTIONS = 6;
    private static final String HEADSET_NAME = "bt_headset_name";
    private static final String HEADSET_NREC = "bt_headset_nrec";
    private static final String IOT1_DEVICES[] = {
        "00:0C:55:E2:FC:9E"
    };
    private static final int MESSAGE_CHECK_PENDING_SCO = 6;
    private static final int SCO_AUDIO_STATE = 7;
    private static final int SCO_CONNECTION_CHECK = 8;
    private static final int SIGNAL_STRENGTH_CHANGED = 10;
    private static final int START_CALL_TIMEOUT = 10000;
    private static final int START_OUT_CALL_TIMEOUT = 2000;
    private static final int START_VOICE_RECOGNITION_TIMEOUT = 5000;
    private static final String TAG = "Bluetooth HS/HF";
    public static final int TYPE_HANDSFREE = 2;
    public static final int TYPE_HEADSET = 1;
    public static final int TYPE_UNKNOWN = 0;
    private static final boolean VDBG = true;
    private static final boolean bPassPTS;
    private static BluetoothHandsfree sInstance;
    private static Intent sVoiceCommandIntent;
    private BluetoothA2dp mA2dp;
    private BluetoothDevice mA2dpDevice;
    private int mA2dpPlayingState;
    private int mA2dpState;
    private boolean mA2dpSuspended;
    private final BluetoothAdapter mAdapter = BluetoothAdapter.getDefaultAdapter();
    private boolean mAudioConnected;
    private AudioManager mAudioManager;
    private boolean mAudioPossible;
    private int mAudioState;
    private long mBgndEarliestConnectionTime;
    private BluetoothHeadset mBluetoothHeadset;
    private final BluetoothPhoneState mBluetoothPhoneState = new BluetoothPhoneState();
    private final CallManager mCM;
    private boolean mCdmaCallsSwapped;
    private boolean mCdmaIsSecondCallActive;
    CdmaPhoneCallState.PhoneCallState mCdmaThreeWayCallState;
    private long mClccTimestamps[];
    private boolean mClccUsed[];
    private boolean mClip;
    private boolean mCmee;
    private BluetoothDevice mConnectedAudioDevice;
    private final Context mContext;
    private DebugThread mDebugThread;
    private HandsfreeMessageHandler mHandler;
    private BluetoothAudioGateway mHeadset;
    private int mHeadsetType;
    private boolean mIndicatorsEnabled;
    private boolean mIsLimitDTCall;
    private boolean mIsPendingAudioOn;
    private boolean mIsProcAudioOff;
    private int mLocalBrsf;
    private final MTKCallManager mMCM = MTKCallManager.getInstance();
    private boolean mPendingAudioState;
    private boolean mPendingSco;
    private com.android.internal.telephony.PhoneConstants.State mPhoneState;
    private final BluetoothAtPhonebook mPhonebook;
    private PowerManager mPowerManager;
    private android.bluetooth.BluetoothProfile.ServiceListener mProfileListener;
    private int mRemoteBrsf;
    private boolean mSCOConnecting;
    private int mScoGain;
    private boolean mServiceConnectionEstablished;
    private ServiceState mServiceState;
    private android.os.PowerManager.WakeLock mStartCallWakeLock;
    private android.os.PowerManager.WakeLock mStartVoiceRecognitionWakeLock;
    private boolean mUserWantsAudio;
    private boolean mVirtualCallStarted;
    private boolean mVoiceRecognitionStarted;
    private boolean mWaitingForCallStart;
    private boolean mWaitingForOutCallStart;
    private boolean mWaitingForVoiceRecognition;

    private BluetoothHandsfree(Context context, CallManager callmanager)
    {
        mAudioConnected = false;
        mSCOConnecting = false;
        mBgndEarliestConnectionTime = 0L;
        mClip = false;
        mIndicatorsEnabled = false;
        mCmee = false;
        mWaitingForOutCallStart = false;
        mPhoneState = com.android.internal.telephony.PhoneConstants.State.IDLE;
        mCdmaThreeWayCallState = CdmaPhoneCallState.PhoneCallState.IDLE;
        mScoGain = 0x80000000;
        mRemoteBrsf = 0;
        mLocalBrsf = 0;
        mCdmaIsSecondCallActive = false;
        mCdmaCallsSwapped = false;
        mIsLimitDTCall = true;
        mVirtualCallStarted = false;
        mIsProcAudioOff = false;
        mIsPendingAudioOn = false;
        mProfileListener = new android.bluetooth.BluetoothProfile.ServiceListener() {

            final BluetoothHandsfree this$0;

            public void onServiceConnected(int i, BluetoothProfile bluetoothprofile)
            {
                if (i == 1)
                {
                    mBluetoothHeadset = (BluetoothHeadset)bluetoothprofile;
                    synchronized (BluetoothHandsfree.this)
                    {
                        if (mPendingAudioState)
                        {
                            mBluetoothHeadset.setAudioState(mHeadset.getRemoteDevice(), mAudioState);
                            mPendingAudioState = false;
                        }
                    }
                    return;
                } else
                {
                    if (i == 2)
                        mA2dp = (BluetoothA2dp)bluetoothprofile;
                    return;
                }
                exception;
                bluetoothhandsfree;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void onServiceDisconnected(int i)
            {
                if (i == 1)
                    mBluetoothHeadset = null;
                else
                if (i == 2)
                {
                    mA2dp = null;
                    return;
                }
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
;
        mCM = callmanager;
        mContext = context;
        boolean flag;
        if (mAdapter != null)
            flag = true;
        else
            flag = false;
        mHeadset = null;
        mConnectedAudioDevice = null;
        mHeadsetType = 0;
        if (flag)
            mAdapter.getProfileProxy(mContext, mProfileListener, 2);
        mA2dpState = 0;
        mA2dpPlayingState = 11;
        mA2dpDevice = null;
        mA2dpSuspended = false;
        mPowerManager = (PowerManager)context.getSystemService("power");
        mStartCallWakeLock = mPowerManager.newWakeLock(1, "Bluetooth HS/HF:StartCall");
        mStartCallWakeLock.setReferenceCounted(false);
        mStartVoiceRecognitionWakeLock = mPowerManager.newWakeLock(1, "Bluetooth HS/HF:VoiceRecognition");
        mStartVoiceRecognitionWakeLock.setReferenceCounted(false);
        mLocalBrsf = 99;
        if (sVoiceCommandIntent == null)
        {
            sVoiceCommandIntent = new Intent("android.intent.action.VOICE_COMMAND");
            sVoiceCommandIntent.setFlags(0x10000000);
        }
        if (mContext.getPackageManager().resolveActivity(sVoiceCommandIntent, 0) != null && BluetoothHeadset.isBluetoothVoiceDialingEnabled(mContext))
            mLocalBrsf = 4 | mLocalBrsf;
        HandlerThread handlerthread = new HandlerThread("BluetoothHandsfreeHandler");
        handlerthread.start();
        mHandler = new HandsfreeMessageHandler(handlerthread.getLooper());
        mPhonebook = new BluetoothAtPhonebook(mContext, this);
        mUserWantsAudio = true;
        mVirtualCallStarted = false;
        mVoiceRecognitionStarted = false;
        mAudioManager = (AudioManager)context.getSystemService("audio");
        cdmaSetSecondCallState(false);
        if (flag)
            resetAtState();
    }

    private boolean allowAudioAnytime()
    {
        boolean flag = inDebug();
        boolean flag1 = false;
        if (flag)
        {
            boolean flag2 = SystemProperties.getBoolean("debug.bt.hfp.audio_anytime", false);
            flag1 = false;
            if (flag2)
                flag1 = true;
        }
        return flag1;
    }

    private void broadcastVendorSpecificEventIntent(String s, int i, int j, Object aobj[], BluetoothDevice bluetoothdevice)
    {
        log((new StringBuilder()).append("broadcastVendorSpecificEventIntent(").append(s).append(")").toString());
        Intent intent = new Intent("android.bluetooth.headset.action.VENDOR_SPECIFIC_HEADSET_EVENT");
        intent.putExtra("android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_CMD", s);
        intent.putExtra("android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_CMD_TYPE", j);
        intent.putExtra("android.bluetooth.headset.extra.VENDOR_SPECIFIC_HEADSET_EVENT_ARGS", ((java.io.Serializable) (aobj)));
        intent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
        intent.addCategory((new StringBuilder()).append("android.bluetooth.headset.intent.category.companyid.").append(Integer.toString(i)).toString());
        mContext.sendBroadcast(intent, "android.permission.BLUETOOTH");
    }

    private void callStarted()
    {
        this;
        JVM INSTR monitorenter ;
        if (mWaitingForCallStart)
        {
            mWaitingForCallStart = false;
            sendURC("OK");
            if (mStartCallWakeLock.isHeld())
                mStartCallWakeLock.release();
        }
        mHandler.removeMessages(11);
        mWaitingForOutCallStart = false;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private String cdmaConnectionToClccEntry(int i, Connection connection)
    {
label0:
        {
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            CdmaPhoneCallState.PhoneCallState phonecallstate = phoneglobals.cdmaPhoneCallState.getCurrentCallState();
            CdmaPhoneCallState.PhoneCallState phonecallstate1 = phoneglobals.cdmaPhoneCallState.getPreviousCallState();
            log((new StringBuilder()).append("[API] cdmaConnectionToClccEntry : index=").append(String.valueOf(i)).toString());
            byte byte0;
            if (phonecallstate1 == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE && phonecallstate == CdmaPhoneCallState.PhoneCallState.CONF_CALL)
                byte0 = 0;
            else
                switch (_cls31..SwitchMap.com.android.internal.telephony.Call.State[connection.getState().ordinal()])
                {
                case 4: // '\004'
                default:
                    break label0;

                case 6: // '\006'
                    byte0 = 5;
                    break;

                case 5: // '\005'
                    byte0 = 4;
                    break;

                case 3: // '\003'
                    byte0 = 3;
                    break;

                case 2: // '\002'
                    byte0 = 2;
                    break;

                case 7: // '\007'
                    byte0 = 1;
                    break;

                case 1: // '\001'
                    if (i == 0)
                    {
                        if (mCdmaIsSecondCallActive)
                            byte0 = 1;
                        else
                            byte0 = 0;
                        break;
                    }
                    if (mCdmaIsSecondCallActive)
                        byte0 = 0;
                    else
                        byte0 = 1;
                    break;
                }
            int j;
            if (phonecallstate == CdmaPhoneCallState.PhoneCallState.CONF_CALL)
            {
                if (phonecallstate1 == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE)
                    j = 1;
                else
                    j = 0;
            } else
            {
                j = 0;
            }
            int k;
            if (connection.isIncoming())
                k = 1;
            else
                k = 0;
            String s = connection.getAddress();
            int l = -1;
            if (s != null)
                l = PhoneNumberUtils.toaFromString(s);
            String s1 = (new StringBuilder()).append("+CLCC: ").append(i + 1).append(",").append(k).append(",").append(byte0).append(",0,").append(j).toString();
            if (s != null)
                s1 = (new StringBuilder()).append(s1).append(",\"").append(s).append("\",").append(l).toString();
            return s1;
        }
        return null;
    }

    private AtCommandResult cdmaGetClccResult()
    {
        this;
        JVM INSTR monitorenter ;
        Connection aconnection[];
        Call call;
        Call call1;
        aconnection = new Connection[2];
        call = mCM.getActiveFgCall();
        call1 = mCM.getFirstActiveRingingCall();
        if (call1.getState() != com.android.internal.telephony.Call.State.INCOMING) goto _L2; else goto _L1
_L1:
        log("Filling clccConnections[0] for INCOMING state");
        aconnection[0] = call1.getLatestConnection();
_L8:
        if (PhoneGlobals.getInstance().cdmaPhoneCallState.getCurrentCallState() != CdmaPhoneCallState.PhoneCallState.SINGLE_ACTIVE) goto _L4; else goto _L3
_L3:
        cdmaSetSecondCallState(false);
_L10:
        AtCommandResult atcommandresult = new AtCommandResult(0);
        int i = 0;
_L11:
        if (i >= aconnection.length || aconnection[i] == null) goto _L6; else goto _L5
_L5:
        String s = cdmaConnectionToClccEntry(i, aconnection[i]);
        if (s == null)
            break MISSING_BLOCK_LABEL_250;
        atcommandresult.addResponse(s);
        break MISSING_BLOCK_LABEL_250;
_L2:
        if (!call.getState().isAlive()) goto _L8; else goto _L7
_L7:
        if (!call1.isRinging())
            break MISSING_BLOCK_LABEL_170;
        log("Filling clccConnections[0] & [1] for CALL WAITING state");
        aconnection[0] = call.getEarliestConnection();
        aconnection[1] = call1.getLatestConnection();
          goto _L8
        Exception exception;
        exception;
        throw exception;
label0:
        {
            if (call.getConnections().size() > 1)
                break label0;
            log("Filling clccConnections[0] with ForgroundCall latest connection");
            aconnection[0] = call.getLatestConnection();
        }
          goto _L8
        log("Filling clccConnections[0] & [1] with ForgroundCall connections");
        aconnection[0] = call.getEarliestConnection();
        aconnection[1] = call.getLatestConnection();
          goto _L8
_L4:
        if (PhoneGlobals.getInstance().cdmaPhoneCallState.getCurrentCallState() != CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE) goto _L10; else goto _L9
_L9:
        cdmaSetSecondCallState(true);
          goto _L10
_L6:
        this;
        JVM INSTR monitorexit ;
        return atcommandresult;
        i++;
          goto _L11
    }

    private void closeConnectedSco()
    {
        if (mAudioConnected)
        {
            log((new StringBuilder()).append("closeConnectedSco : mAudioConnected=").append(String.valueOf(mAudioConnected)).toString());
            BluetoothDevice bluetoothdevice;
            if (isHeadsetConnected())
            {
                log("headset is connected");
                bluetoothdevice = mHeadset.getRemoteDevice();
                if (isAudioOn())
                {
                    mHeadset.close();
                    mIsProcAudioOff = true;
                }
            } else
            {
                bluetoothdevice = mConnectedAudioDevice;
            }
            log("mAudioManager.setBluetoothScoOn(false)");
            mAudioManager.setBluetoothScoOn(false);
            if (bluetoothdevice != null)
                setAudioState(10, bluetoothdevice);
            else
                logErr("audio device is null when close audio");
            mAudioConnected = false;
        }
    }

    private void configAudioParameters()
    {
        String s = mHeadset.getRemoteDevice().getName();
        if (s == null)
            s = "<unknown>";
        mAudioManager.setParameters((new StringBuilder()).append("bt_headset_name=").append(s).append(";").append("bt_headset_nrec").append("=on").toString());
    }

    private String connectionToClccEntry(int i, Connection connection)
    {
        String s;
label0:
        {
label1:
            {
                log((new StringBuilder()).append("[API] connectionToClccEntry(").append(String.valueOf(i)).append(")").toString());
                byte byte0;
                switch (_cls31..SwitchMap.com.android.internal.telephony.Call.State[connection.getState().ordinal()])
                {
                case 4: // '\004'
                default:
                    break label1;

                case 6: // '\006'
                    byte0 = 5;
                    break;

                case 5: // '\005'
                    byte0 = 4;
                    break;

                case 3: // '\003'
                    byte0 = 3;
                    break;

                case 2: // '\002'
                    byte0 = 2;
                    break;

                case 7: // '\007'
                    byte0 = 1;
                    break;

                case 1: // '\001'
                    byte0 = 0;
                    break;
                }
                Call call = connection.getCall();
                int j = 0;
                if (call != null)
                    if (call.isMultiparty())
                        j = 1;
                    else
                        j = 0;
                int k;
                if (connection.isIncoming())
                    k = 1;
                else
                    k = 0;
                String s1 = connection.getAddress();
                int l = -1;
                if (s1 != null)
                    l = PhoneNumberUtils.toaFromString(s1);
                s = (new StringBuilder()).append("+CLCC: ").append(i + 1).append(",").append(k).append(",").append(byte0).append(",0,").append(j).toString();
                if (s1 != null)
                    return (new StringBuilder()).append(s).append(",\"").append(s1).append("\",").append(l).toString();
                break label0;
            }
            s = null;
        }
        return s;
    }

    private void expectCallStart()
    {
        this;
        JVM INSTR monitorenter ;
        mWaitingForCallStart = true;
        Message message = Message.obtain(mHandler, 4);
        mHandler.sendMessageDelayed(message, 10000L);
        if (!mStartCallWakeLock.isHeld())
            mStartCallWakeLock.acquire(10000L);
        mWaitingForOutCallStart = true;
        Message message1 = Message.obtain(mHandler, 11);
        mHandler.sendMessageDelayed(message1, 2000L);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void expectVoiceRecognition()
    {
        this;
        JVM INSTR monitorenter ;
        mWaitingForVoiceRecognition = true;
        Message message = Message.obtain(mHandler, 5);
        mHandler.sendMessageDelayed(message, 5000L);
        if (!mStartVoiceRecognitionWakeLock.isHeld())
            mStartVoiceRecognitionWakeLock.acquire(5000L);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void failedScoConnect(BluetoothDevice bluetoothdevice)
    {
        Message message = Message.obtain(mHandler, 7);
        message.obj = bluetoothdevice;
        mHandler.sendMessageDelayed(message, 2000L);
    }

    private int getAudioState(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        BluetoothHeadset bluetoothheadset = mBluetoothHeadset;
        if (bluetoothheadset != null) goto _L2; else goto _L1
_L1:
        int j = 10;
_L4:
        this;
        JVM INSTR monitorexit ;
        return j;
_L2:
        int i = mBluetoothHeadset.getAudioState(bluetoothdevice);
        j = i;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    private String getPhoneNumberByIndex(int i, boolean flag)
    {
        Cursor cursor;
        String s1;
        String s2;
        log((new StringBuilder()).append("getPhoneNumberByIndex(").append(i).append(", ").append(String.valueOf(flag)).append(")").toString());
        if (i < 1)
        {
            logErr((new StringBuilder()).append("getPhoneNumberByIndex : Invalid index value : ").append(i).toString());
            return null;
        }
        Uri uri = android.provider.ContactsContract.Contacts.CONTENT_URI;
        cursor = null;
        String s;
        String as[];
        ContentResolver contentresolver;
        StringBuilder stringbuilder;
        int j;
        long l;
        String s3;
        if (flag)
            s = "display_name";
        else
            s = "_id";
        as = (new String[] {
            "_id", "display_name"
        });
        contentresolver = mContext.getContentResolver();
        cursor = contentresolver.query(uri, as, "in_visible_group=1", null, s);
        s1 = null;
        if (cursor == null)
            break MISSING_BLOCK_LABEL_243;
        j = cursor.getCount();
        s1 = null;
        if (i > j)
            break MISSING_BLOCK_LABEL_243;
        log((new StringBuilder()).append("contactCursor.getCount() = ").append(cursor.getCount()).toString());
        cursor.moveToPosition(i - 1);
        l = cursor.getLong(0);
        log((new StringBuilder()).append("Query startPointId = ").append(l).toString());
        s3 = querySuperPrimaryPhone(l);
        s1 = s3;
        if (cursor != null)
        {
            log("close contactCursor");
            cursor.close();
        } else
        {
            log("[ERR] contactCursor is null");
        }
_L1:
        stringbuilder = (new StringBuilder()).append("getPhoneNumberByIndex return ");
        Exception exception;
        Exception exception1;
        if (s1 != null)
            s2 = s1;
        else
            s2 = "null";
        log(stringbuilder.append(s2).toString());
        return s1;
        exception1;
        log("[ERR] query Phone number failed");
        if (cursor != null)
        {
            log("close contactCursor");
            cursor.close();
            s1 = null;
        } else
        {
            log("[ERR] contactCursor is null");
            s1 = null;
        }
          goto _L1
        exception;
        if (cursor != null)
        {
            log("close contactCursor");
            cursor.close();
        } else
        {
            log("[ERR] contactCursor is null");
        }
        throw exception;
    }

    public static int getSimCount()
    {
        return Integer.parseInt(SystemProperties.get("persist.gemini.sim_num", "2"));
    }

    private AtCommandResult gsmGetClccResult()
    {
        this;
        JVM INSTR monitorenter ;
        Connection aconnection[];
        LinkedList linkedlist;
        LinkedList linkedlist1;
        boolean aflag[];
        aconnection = new Connection[6];
        linkedlist = new LinkedList();
        linkedlist1 = new LinkedList();
        Call call = mCM.getActiveFgCall();
        Call call1 = mCM.getFirstActiveBgCall();
        Call call2 = mCM.getFirstActiveRingingCall();
        if (call2.getState().isAlive())
            linkedlist1.addAll(call2.getConnections());
        if (call.getState().isAlive())
            linkedlist1.addAll(call.getConnections());
        if (call1.getState().isAlive())
            linkedlist1.addAll(call1.getConnections());
        aflag = new boolean[6];
        int i = 0;
_L2:
        if (i >= 6)
            break; /* Loop/switch isn't completed */
        aflag[i] = mClccUsed[i];
        mClccUsed[i] = false;
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        Iterator iterator = linkedlist1.iterator();
_L17:
        if (!iterator.hasNext()) goto _L4; else goto _L3
_L3:
        Connection connection1;
        long l2;
        connection1 = (Connection)iterator.next();
        l2 = connection1.getCreateTime();
        int j1 = 0;
_L6:
        boolean flag;
        flag = false;
        if (j1 >= 6)
            break MISSING_BLOCK_LABEL_247;
        if (!aflag[j1] || l2 != mClccTimestamps[j1])
            break MISSING_BLOCK_LABEL_267;
        mClccUsed[j1] = true;
        flag = true;
        aconnection[j1] = connection1;
        if (flag)
            continue; /* Loop/switch isn't completed */
        linkedlist.add(connection1);
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        throw exception;
        j1++;
        if (true) goto _L6; else goto _L5
_L5:
        int j;
        long l;
        Connection connection;
        mClccUsed[j] = true;
        mClccTimestamps[j] = l;
        aconnection[j] = connection;
        linkedlist.remove(connection);
_L4:
        if (linkedlist.isEmpty()) goto _L8; else goto _L7
_L7:
        j = 0;
        while (mClccUsed[j]) 
            j++;
        l = ((Connection)linkedlist.get(0)).getCreateTime();
        connection = (Connection)linkedlist.get(0);
        int k = 0;
_L14:
        long l1;
        if (k >= linkedlist.size())
            continue; /* Loop/switch isn't completed */
        l1 = ((Connection)linkedlist.get(k)).getCreateTime();
        if (l1 >= l) goto _L10; else goto _L9
_L9:
        l = l1;
        connection = (Connection)linkedlist.get(k);
          goto _L10
_L8:
        AtCommandResult atcommandresult = new AtCommandResult(0);
        int i1 = 0;
_L12:
        String s;
        if (i1 >= aconnection.length)
            break; /* Loop/switch isn't completed */
        if (!mClccUsed[i1])
            break MISSING_BLOCK_LABEL_458;
        s = connectionToClccEntry(i1, aconnection[i1]);
        if (s == null)
            break MISSING_BLOCK_LABEL_458;
        atcommandresult.addResponse(s);
        i1++;
        if (true) goto _L12; else goto _L11
_L11:
        return atcommandresult;
_L10:
        k++;
        if (true) goto _L14; else goto _L13
_L13:
        if (true) goto _L5; else goto _L15
_L15:
        if (true) goto _L17; else goto _L16
_L16:
    }

    private boolean inDebug()
    {
        return SystemProperties.getBoolean("debug.bt.hfp", false);
    }

    static BluetoothHandsfree init(Context context, CallManager callmanager)
    {
        com/android/phone/BluetoothHandsfree;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_32;
        sInstance = new BluetoothHandsfree(context, callmanager);
_L1:
        BluetoothHandsfree bluetoothhandsfree = sInstance;
        com/android/phone/BluetoothHandsfree;
        JVM INSTR monitorexit ;
        return bluetoothhandsfree;
        Log.d("Bluetooth HS/HF", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/BluetoothHandsfree;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void initializeHandsfreeAtParser()
    {
        log("Registering Handsfree AT commands");
        AtParser atparser = mHeadset.getAtParser();
        final Phone phone = mCM.getDefaultPhone();
        atparser.register(Character.valueOf('A'), new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleBasicCommand(String s)
            {
                sendURC("OK");
                mBluetoothPhoneState.stopRing();
                PhoneUtils.answerCall(mCM.getFirstActiveRingingCall());
                return new AtCommandResult(2);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register(Character.valueOf('D'), new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleBasicCommand(String s)
            {
                BluetoothHandsfree.log((new StringBuilder()).append("Handle ATD").append(s).toString());
                if (mWaitingForOutCallStart || mBluetoothPhoneState.mCallsetup == 2 || mBluetoothPhoneState.mCallsetup == 3)
                {
                    BluetoothHandsfree.log((new StringBuilder()).append("mWaitingForOutCallStart=").append(String.valueOf(mWaitingForOutCallStart)).append(", mBluetoothPhoneState.mCallsetup=").append(mBluetoothPhoneState.mCallsetup).toString());
                    return new AtCommandResult(1);
                }
                if (s.length() <= 0)
                    break MISSING_BLOCK_LABEL_397;
                if (s.charAt(-1 + s.length()) == ';')
                    s = s.substring(0, -1 + s.length());
                if (s.charAt(0) != '>') goto _L2; else goto _L1
_L1:
                String s1;
                String s3 = s.substring(1);
                BluetoothHandsfree.log((new StringBuilder()).append("ATD memory dial : ").append(s3).toString());
                String s2;
                Intent intent;
                String s4;
                try
                {
                    s4 = getPhoneNumberByIndex(Integer.parseInt(s3), true);
                }
                catch (NumberFormatException numberformatexception)
                {
                    BluetoothHandsfree.log((new StringBuilder()).append("[ERR] wrong memory index : ").append(s3).toString());
                    s1 = null;
                    continue; /* Loop/switch isn't completed */
                }
                s1 = s4;
_L4:
                if (s1 != null)
                {
                    s2 = s1.replaceAll("-", "");
                    BluetoothHandsfree.log((new StringBuilder()).append("phoneNumber = ").append(s2).toString());
                    terminateScoUsingVirtualVoiceCall();
                    intent = new Intent("android.intent.action.CALL_PRIVILEGED", Uri.fromParts("tel", PhoneNumberUtils.convertPreDial(s2), null));
                    intent.setClassName("com.android.phone", "com.android.phone.OutgoingCallBroadcaster");
                    intent.putExtra("com.android.phone.extra.slot", mPhonebook.getDefaultSIM());
                    intent.putExtra("com.android.phone.extra.forbid_dialog", true);
                    intent.putExtra("com.android.phone.extra.international", 2);
                    intent.setFlags(0x10000000);
                    mContext.startActivity(intent);
                    expectCallStart();
                    return new AtCommandResult(2);
                }
                break; /* Loop/switch isn't completed */
_L2:
                s1 = s;
                if (true) goto _L4; else goto _L3
_L3:
                BluetoothHandsfree.log("phoneNumber is null");
                return new AtCommandResult(1);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CHUP", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                sendURC("OK");
                if (isVirtualCallInProgress())
                    terminateScoUsingVirtualVoiceCall();
                else
                if (mCM.hasActiveFgCall())
                {
                    BluetoothHandsfree.log("PhoneUtils.hangupActiveCall(mCM.getActiveFgCall())");
                    PhoneUtils.hangupActiveCall(mCM.getActiveFgCall());
                } else
                if (mCM.hasActiveRingingCall())
                    PhoneUtils.hangupRingingCall(mCM.getFirstActiveRingingCall());
                else
                if (mCM.hasActiveBgCall())
                    PhoneUtils.hangupHoldingCall(mCM.getFirstActiveBgCall());
                return new AtCommandResult(2);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+BRSF", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            private AtCommandResult sendBRSF()
            {
                BluetoothHandsfree.log((new StringBuilder()).append("sendBRSF : ").append(String.valueOf(mLocalBrsf)).toString());
                return new AtCommandResult((new StringBuilder()).append("+BRSF: ").append(mLocalBrsf).toString());
            }

            public AtCommandResult handleActionCommand()
            {
                BluetoothHandsfree.log("handleActionCommand");
                return sendBRSF();
            }

            public AtCommandResult handleReadCommand()
            {
                BluetoothHandsfree.log("handleReadCommand");
                return sendBRSF();
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                BluetoothHandsfree.log((new StringBuilder()).append("handleSetCommand : length=").append(String.valueOf(aobj.length)).append(", mrsf=").append(String.valueOf(aobj[0])).toString());
                if (aobj.length == 1 && (aobj[0] instanceof Integer))
                    mRemoteBrsf = ((Integer)aobj[0]).intValue();
                else
                    BluetoothHandsfree.logWarn("HF didn't sent BRSF assuming 0");
                return sendBRSF();
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CCWA", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                return new AtCommandResult(0);
            }

            public AtCommandResult handleReadCommand()
            {
                return new AtCommandResult("+CCWA: 1");
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                return new AtCommandResult(0);
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+CCWA: (\"n\",(1))");
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CMER", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleReadCommand()
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("+CMER: 3,0,0,");
                String s;
                if (mIndicatorsEnabled)
                    s = "1";
                else
                    s = "0";
                return new AtCommandResult(stringbuilder.append(s).toString());
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj.length < 4)
                    return new AtCommandResult(1);
                if (aobj[0].equals(Integer.valueOf(3)) && aobj[1].equals(Integer.valueOf(0)) && aobj[2].equals(Integer.valueOf(0)))
                {
                    boolean flag1;
                    if (aobj[3].equals(Integer.valueOf(0)))
                    {
                        mIndicatorsEnabled = false;
                        flag1 = true;
                    } else
                    {
                        boolean flag = aobj[3].equals(Integer.valueOf(1));
                        flag1 = false;
                        if (flag)
                        {
                            mIndicatorsEnabled = true;
                            flag1 = true;
                        }
                    }
                    if (flag1)
                        if ((2 & mRemoteBrsf) == 0)
                        {
                            mServiceConnectionEstablished = true;
                            sendURC("OK");
                            if (isIncallAudio())
                                audioOn();
                            else
                            if (mCM.getFirstActiveRingingCall().isRinging())
                                mBluetoothPhoneState.ring();
                            return new AtCommandResult(2);
                        } else
                        {
                            return new AtCommandResult(0);
                        }
                }
                return reportCmeError(4);
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+CMER: (3),(0),(0),(0-1)");
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CMEE", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                mCmee = true;
                return new AtCommandResult(0);
            }

            public AtCommandResult handleReadCommand()
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("+CMEE: ");
                String s;
                if (mCmee)
                    s = "1";
                else
                    s = "0";
                return new AtCommandResult(stringbuilder.append(s).toString());
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj.length == 0)
                {
                    mCmee = false;
                    return new AtCommandResult(0);
                }
                if (!(aobj[0] instanceof Integer))
                    return new AtCommandResult(1);
                BluetoothHandsfree bluetoothhandsfree = BluetoothHandsfree.this;
                boolean flag;
                if (((Integer)aobj[0]).intValue() == 1)
                    flag = true;
                else
                    flag = false;
                bluetoothhandsfree.mCmee = flag;
                return new AtCommandResult(0);
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+CMEE: (0-1)");
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+BLDN", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                return redial();
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CIND", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleReadCommand()
            {
                return mBluetoothPhoneState.toCindResult();
            }

            public AtCommandResult handleTestCommand()
            {
                return mBluetoothPhoneState.getCindTestResult();
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CSQ", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                return mBluetoothPhoneState.toCsqResult();
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CREG", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleReadCommand()
            {
                return new AtCommandResult(mBluetoothPhoneState.toCregString());
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+VTS", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            private boolean isValidDtmf(char c)
            {
                switch (c)
                {
                default:
                    if (Character.digit(c, 14) == -1)
                        return false;
                    // fall through

                case 35: // '#'
                case 42: // '*'
                    return true;
                }
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj.length >= 1)
                {
                    char c;
                    if (aobj[0] instanceof Integer)
                        c = ((Integer)aobj[0]).toString().charAt(0);
                    else
                        c = ((String)aobj[0]).charAt(0);
                    if (isValidDtmf(c))
                    {
                        mCM.sendDtmf(c);
                        return new AtCommandResult(0);
                    }
                }
                return new AtCommandResult(1);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CLCC", new AtCommandHandler() {

            final BluetoothHandsfree this$0;
            final Phone val$phone;

            public AtCommandResult handleActionCommand()
            {
                int i = phone.getPhoneType();
                if (isVirtualCallInProgress())
                {
                    String s = phone.getLine1Number();
                    AtCommandResult atcommandresult = new AtCommandResult(0);
                    String s1;
                    if (s == null)
                        s1 = "+CLCC: 1,0,0,0,0,\"\",0";
                    else
                        s1 = (new StringBuilder()).append("+CLCC: 1,0,0,0,0,\"").append(s).append("\",").append(PhoneNumberUtils.toaFromString(s)).toString();
                    atcommandresult.addResponse(s1);
                    return atcommandresult;
                }
                if (i == 2)
                    return cdmaGetClccResult();
                if (i == 1)
                    return gsmGetClccResult();
                else
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                phone = phone1;
                super();
            }
        }
);
        atparser.register("+CHLD", new AtCommandHandler() {

            final BluetoothHandsfree this$0;
            final Phone val$phone;

            public AtCommandResult handleSetCommand(Object aobj[])
            {
label0:
                {
                    int i;
label1:
                    {
label2:
                        {
                            i = phone.getPhoneType();
                            Call call = mCM.getFirstActiveRingingCall();
                            Call call1 = mCM.getFirstActiveBgCall();
                            if (aobj.length < 1)
                                break label0;
                            if (aobj[0].equals(Integer.valueOf(0)))
                            {
                                boolean flag1;
                                if (call != null && call.isRinging())
                                    flag1 = PhoneUtils.hangupRingingCall(call);
                                else
                                    flag1 = PhoneUtils.hangupHoldingCall(call1);
                                if (flag1)
                                    return new AtCommandResult(0);
                                else
                                    return new AtCommandResult(1);
                            }
                            if (aobj[0].equals(Integer.valueOf(1)))
                            {
                                if (i == 2)
                                {
                                    if (call != null && call.isRinging())
                                    {
                                        BluetoothHandsfree.log("CHLD:1 Callwaiting Answer call");
                                        PhoneUtils.hangupRingingAndActive(phone);
                                    } else
                                    {
                                        BluetoothHandsfree.log("CHLD:1 Hangup Call");
                                        PhoneUtils.hangup(PhoneGlobals.getInstance().mCM);
                                    }
                                    return new AtCommandResult(0);
                                }
                                if (i == 1)
                                {
                                    boolean flag;
                                    if (mCM.hasActiveFgCall())
                                    {
                                        if (call != null && call.getState().isAlive())
                                            flag = PhoneUtils.answerAndEndActive(mCM, call);
                                        else
                                            flag = PhoneUtils.hangupActiveCall(mCM.getActiveFgCall());
                                    } else
                                    if (call1 != null && call1.getState().isAlive())
                                    {
                                        PhoneUtils.switchHoldingAndActive(call1);
                                        flag = true;
                                    } else
                                    {
                                        flag = false;
                                    }
                                    if (flag)
                                        return new AtCommandResult(0);
                                    else
                                        return new AtCommandResult(1);
                                } else
                                {
                                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                                }
                            }
                            if (!aobj[0].equals(Integer.valueOf(2)))
                                break label1;
                            sendURC("OK");
                            if (i == 2)
                            {
                                if (call.isRinging())
                                {
                                    BluetoothHandsfree.log("CHLD:2 Callwaiting Answer call");
                                    PhoneUtils.answerCall(call);
                                    PhoneUtils.setMute(false);
                                    cdmaSetSecondCallState(true);
                                } else
                                if (PhoneGlobals.getInstance().cdmaPhoneCallState.getCurrentCallState() == CdmaPhoneCallState.PhoneCallState.CONF_CALL)
                                {
                                    BluetoothHandsfree.log("CHLD:2 Swap Calls");
                                    PhoneUtils.switchHoldingAndActive(call1);
                                    cdmaSwapSecondCallState();
                                }
                            } else
                            {
                                if (i != 1)
                                    break label2;
                                if (call != null && call.isRinging())
                                    PhoneGlobals.getInstance().phoneMgr.answerRingingCall();
                                else
                                    PhoneUtils.switchHoldingAndActive(call1);
                            }
                            return new AtCommandResult(2);
                        }
                        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                    }
label3:
                    {
                        if (!aobj[0].equals(Integer.valueOf(3)))
                            break label0;
                        sendURC("OK");
                        if (i == 2)
                        {
                            CdmaPhoneCallState.PhoneCallState phonecallstate = PhoneGlobals.getInstance().cdmaPhoneCallState.getCurrentCallState();
                            if (phonecallstate == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE)
                            {
                                BluetoothHandsfree.log("CHLD:3 Merge Calls");
                                PhoneUtils.mergeCalls();
                            } else
                            if (phonecallstate == CdmaPhoneCallState.PhoneCallState.CONF_CALL)
                                mBluetoothPhoneState.updateCallHeld();
                        } else
                        {
                            if (i != 1)
                                break label3;
                            if (mCM.hasActiveFgCall() && mCM.hasActiveBgCall())
                                PhoneUtils.mergeCalls();
                        }
                        return new AtCommandResult(2);
                    }
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                }
                return new AtCommandResult(1);
            }

            public AtCommandResult handleTestCommand()
            {
                mServiceConnectionEstablished = true;
                sendURC("+CHLD: (0,1,2,3)");
                sendURC("OK");
                if (isIncallAudio())
                    audioOn();
                else
                if (mCM.getFirstActiveRingingCall().isRinging())
                    mBluetoothPhoneState.ring();
                return new AtCommandResult(2);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                phone = phone1;
                super();
            }
        }
);
        atparser.register("+COPS", new AtCommandHandler() {

            final BluetoothHandsfree this$0;
            final Phone val$phone;

            public AtCommandResult handleReadCommand()
            {
                String s = phone.getServiceState().getOperatorAlphaLong();
                if (s != null)
                {
                    if (s.length() > 16)
                        s = s.substring(0, 16);
                    return new AtCommandResult((new StringBuilder()).append("+COPS: 0,0,\"").append(s).append("\"").toString());
                } else
                {
                    return new AtCommandResult("+COPS: 0");
                }
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj.length == 2 && (aobj[0] instanceof Integer) && (aobj[1] instanceof Integer))
                {
                    if (((Integer)aobj[0]).intValue() == 3 && ((Integer)aobj[1]).intValue() == 0)
                        return new AtCommandResult(0);
                    else
                        return reportCmeError(4);
                } else
                {
                    return new AtCommandResult(1);
                }
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+COPS: (3),(0)");
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                phone = phone1;
                super();
            }
        }
);
        atparser.register("+CPIN", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleReadCommand()
            {
                return new AtCommandResult("+CPIN: READY");
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+BTRH", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleReadCommand()
            {
                return new AtCommandResult(0);
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                return new AtCommandResult(1);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CIMI", new AtCommandHandler() {

            final BluetoothHandsfree this$0;
            final Phone val$phone;

            public AtCommandResult handleActionCommand()
            {
                String s = phone.getSubscriberId();
                if (s != null && s.length() != 0)
                    return new AtCommandResult(s);
                else
                    return reportCmeError(13);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                phone = phone1;
                super();
            }
        }
);
        atparser.register("+CLIP", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleReadCommand()
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("+CLIP: ");
                String s;
                if (mClip)
                    s = "1";
                else
                    s = "0";
                return new AtCommandResult(stringbuilder.append(s).append(",1").toString());
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj.length < 1 || !aobj[0].equals(Integer.valueOf(0)) && !aobj[0].equals(Integer.valueOf(1)))
                {
                    return new AtCommandResult(1);
                } else
                {
                    mClip = aobj[0].equals(Integer.valueOf(1));
                    return new AtCommandResult(0);
                }
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+CLIP: (0-1)");
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CGSN", new AtCommandHandler() {

            final BluetoothHandsfree this$0;
            final Phone val$phone;

            public AtCommandResult handleActionCommand()
            {
                return new AtCommandResult((new StringBuilder()).append("+CGSN: ").append(phone.getDeviceId()).toString());
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                phone = phone1;
                super();
            }
        }
);
        atparser.register("+CGMM", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                String s = SystemProperties.get("ro.product.model");
                if (s != null)
                    return new AtCommandResult((new StringBuilder()).append("+CGMM: ").append(s).toString());
                else
                    return new AtCommandResult(1);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CGMI", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                String s = SystemProperties.get("ro.product.manufacturer");
                if (s != null)
                    return new AtCommandResult((new StringBuilder()).append("+CGMI: ").append(s).toString());
                else
                    return new AtCommandResult(1);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+NREC", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj[0].equals(Integer.valueOf(0)))
                {
                    mAudioManager.setParameters("bt_headset_nrec=off");
                    return new AtCommandResult(0);
                }
                if (aobj[0].equals(Integer.valueOf(1)))
                {
                    mAudioManager.setParameters("bt_headset_nrec=on");
                    return new AtCommandResult(0);
                } else
                {
                    return new AtCommandResult(1);
                }
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+BVRA", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (!BluetoothHeadset.isBluetoothVoiceDialingEnabled(mContext))
                    return new AtCommandResult(1);
                if (aobj.length < 1 || !aobj[0].equals(Integer.valueOf(1)))
                    break MISSING_BLOCK_LABEL_135;
                BluetoothHandsfree bluetoothhandsfree = BluetoothHandsfree.this;
                bluetoothhandsfree;
                JVM INSTR monitorenter ;
                boolean flag;
                if (isVoiceRecognitionInProgress() || isCellularCallInProgress())
                    break MISSING_BLOCK_LABEL_102;
                flag = isVirtualCallInProgress();
                if (flag)
                    break MISSING_BLOCK_LABEL_102;
                mContext.startActivity(BluetoothHandsfree.sVoiceCommandIntent);
                expectVoiceRecognition();
                bluetoothhandsfree;
                JVM INSTR monitorexit ;
                return new AtCommandResult(2);
                ActivityNotFoundException activitynotfoundexception;
                activitynotfoundexception;
                AtCommandResult atcommandresult = new AtCommandResult(1);
                bluetoothhandsfree;
                JVM INSTR monitorexit ;
                return atcommandresult;
                Exception exception;
                exception;
                bluetoothhandsfree;
                JVM INSTR monitorexit ;
                throw exception;
                if (aobj.length >= 1 && aobj[0].equals(Integer.valueOf(0)))
                {
                    if (isVoiceRecognitionInProgress())
                        audioOff();
                    return new AtCommandResult(0);
                } else
                {
                    return new AtCommandResult(1);
                }
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+BVRA: (0-1)");
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CNUM", new AtCommandHandler() {

            final BluetoothHandsfree this$0;
            final Phone val$phone;

            public AtCommandResult handleActionCommand()
            {
                String s = TelephonyManagerEx.getDefault().getLine1Number(mPhonebook.getDefaultSIM());
                BluetoothHandsfree.log((new StringBuilder()).append("+CNUM:").append(s).toString());
                if (s == null)
                    return new AtCommandResult(0);
                else
                    return new AtCommandResult((new StringBuilder()).append("+CNUM: ,\"").append(s).append("\",").append(PhoneNumberUtils.toaFromString(s)).append(",,4").toString());
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                phone = phone1;
                super();
            }
        }
);
        atparser.register("+VGM", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                return new AtCommandResult(0);
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+VGS", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                int i = 1;
                if (aobj.length == i && (aobj[0] instanceof Integer))
                {
                    mScoGain = ((Integer)aobj[0]).intValue();
                    if (!mAudioManager.isBluetoothScoOn())
                        i = 0;
                    mAudioManager.setStreamVolume(6, mScoGain, i);
                    return new AtCommandResult(0);
                } else
                {
                    return new AtCommandResult(i);
                }
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        atparser.register("+CPAS", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            public AtCommandResult handleActionCommand()
            {
                int i = _cls31..SwitchMap.com.android.internal.telephony.PhoneConstants.State[mCM.getState().ordinal()];
                byte byte0 = 0;
                switch (i)
                {
                case 3: // '\003'
                    byte0 = 4;
                    break;

                case 2: // '\002'
                    byte0 = 3;
                    break;

                case 1: // '\001'
                    byte0 = 0;
                    break;
                }
                return new AtCommandResult((new StringBuilder()).append("+CPAS: ").append(byte0).toString());
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
        mPhonebook.register(atparser);
    }

    private void initializeHeadsetAtParser()
    {
        log("Registering Headset AT commands");
        mHeadset.getAtParser().register("+CKPD", new AtCommandHandler() {

            final BluetoothHandsfree this$0;

            private AtCommandResult headsetButtonPress()
            {
                if (mCM.getFirstActiveRingingCall().isRinging())
                {
                    mBluetoothPhoneState.stopRing();
                    sendURC("OK");
                    PhoneUtils.answerCall(mCM.getFirstActiveRingingCall());
                    audioOn();
                    return new AtCommandResult(2);
                }
                if (mCM.hasActiveFgCall())
                {
                    if (!isAudioOn())
                        audioOn();
                    else
                    if (mHeadset.getDirection() != 1 || System.currentTimeMillis() - mHeadset.getConnectTimestamp() >= 5000L)
                    {
                        audioOff();
                        PhoneUtils.hangup(PhoneGlobals.getInstance().mCM);
                    }
                    return new AtCommandResult(0);
                } else
                {
                    return redial();
                }
            }

            public AtCommandResult handleActionCommand()
            {
                return headsetButtonPress();
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                return headsetButtonPress();
            }

            
            {
                this$0 = BluetoothHandsfree.this;
                super();
            }
        }
);
    }

    private boolean isA2dpConnected()
    {
        log((new StringBuilder()).append("isA2dpConnected(): mA2dpState = ").append(mA2dpState).toString());
        return mA2dpState == 2;
    }

    private boolean isA2dpMultiProfile()
    {
        boolean flag;
        if (mA2dp != null && mHeadset != null && mA2dpDevice != null)
            flag = true;
        else
            flag = false;
        log((new StringBuilder()).append("[API] isA2dpMultiProfile : ").append(String.valueOf(flag)).toString());
        if (mA2dpDevice == null)
            log("mA2dpDevice is null");
        if (mA2dp == null)
            log("mA2dp is null");
        return flag;
    }

    private boolean isCellularCallInProgress()
    {
        return mCM.hasActiveFgCall() || mCM.hasActiveRingingCall();
    }

    private boolean isHeadsetConnected()
    {
        if (mHeadset != null && mHeadsetType != 0)
            return mHeadset.isConnected();
        else
            return false;
    }

    private boolean isIncallAudio()
    {
        com.android.internal.telephony.Call.State state = mCM.getActiveFgCallState();
        log((new StringBuilder()).append("isIncallAudio: state = ").append(state).toString());
        return state == com.android.internal.telephony.Call.State.ACTIVE || state == com.android.internal.telephony.Call.State.ALERTING || state == com.android.internal.telephony.Call.State.DIALING;
    }

    private boolean isVirtualCallInProgress()
    {
        return mVirtualCallStarted;
    }

    private boolean isVoiceRecognitionInProgress()
    {
        return mVoiceRecognitionStarted || mWaitingForVoiceRecognition;
    }

    private static void log(String s)
    {
        Log.d("Bluetooth HS/HF", (new StringBuilder()).append("[BT][HFG] ").append(s).toString());
    }

    private static void logErr(String s)
    {
        Log.e("Bluetooth HS/HF", (new StringBuilder()).append("[BT][HFG] ").append(s).toString());
    }

    private static void logInfo(String s)
    {
        Log.i("Bluetooth HS/HF", (new StringBuilder()).append("[BT][HFG] ").append(s).toString());
    }

    private static void logWarn(String s)
    {
        Log.w("Bluetooth HS/HF", (new StringBuilder()).append("[BT][HFG] ").append(s).toString());
    }

    private String querySuperPrimaryPhone(long l)
    {
        Cursor cursor;
        cursor = null;
        log((new StringBuilder()).append("querySuperPrimaryPhone : id=").append(l).toString());
        Uri uri = ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, l);
        Uri uri1 = Uri.withAppendedPath(uri, "data");
        log((new StringBuilder()).append("baseUri=").append(uri.toString()).toString());
        log((new StringBuilder()).append("dataUri=").append(uri1.toString()).toString());
        cursor = mContext.getContentResolver().query(uri1, new String[] {
            "data1", "is_super_primary"
        }, "mimetype=?", new String[] {
            "vnd.android.cursor.item/phone_v2"
        }, "is_super_primary DESC");
        if (cursor == null)
            break MISSING_BLOCK_LABEL_175;
        log((new StringBuilder()).append("c.getCount() = ").append(cursor.getCount()).toString());
        String s = null;
        if (cursor == null) goto _L2; else goto _L1
_L1:
        if (!cursor.moveToFirst()) goto _L4; else goto _L3
_L3:
        String s2;
        log("get first column");
        s2 = cursor.getString(0);
        s = s2;
_L2:
        Exception exception;
        StringBuilder stringbuilder;
        String s1;
        if (cursor != null)
        {
            cursor.close();
            log("close cursor c");
        } else
        {
            log("cursor c is null");
        }
        stringbuilder = (new StringBuilder()).append("querySuperPrimaryPhone : ");
        if (s != null)
            s1 = s;
        else
            s1 = "null";
        log(stringbuilder.append(s1).toString());
        return s;
_L4:
        log("moveToFirst failed");
        s = null;
          goto _L2
        exception;
        if (cursor != null)
        {
            cursor.close();
            log("close cursor c");
        } else
        {
            log("cursor c is null");
        }
        throw exception;
    }

    private AtCommandResult redial()
    {
        HashMap hashmap = new HashMap();
        String s = mPhonebook.getLastDialledNumber(hashmap);
        log((new StringBuilder()).append("[API] redial : number=").append(s).toString());
        if (!mWaitingForOutCallStart && mBluetoothPhoneState.mCallsetup != 2 && mBluetoothPhoneState.mCallsetup != 3)
        {
            if (s == null)
            {
                log("Bluetooth redial requested (+BLDN), but no previous outgoing calls found. Ignoring");
                return new AtCommandResult(1);
            }
            terminateScoUsingVirtualVoiceCall();
            Intent intent = new Intent("android.intent.action.CALL_PRIVILEGED", Uri.fromParts("tel", s, null));
            intent.setClassName("com.android.phone", "com.android.phone.OutgoingCallBroadcaster");
            intent.putExtra("com.android.phone.extra.slot", mPhonebook.getDefaultSIM());
            intent.putExtra("com.android.phone.extra.forbid_dialog", true);
            intent.putExtra("com.android.phone.extra.international", 2);
            Object obj = hashmap.get("vtcall");
            if (obj != null)
            {
                if ((obj instanceof Integer) && ((Integer)obj).intValue() == 1)
                {
                    intent.putExtra("is_vt_call", true);
                    log((new StringBuilder()).append("[VT] isVTCall==").append(((Integer)obj).intValue()).toString());
                } else
                {
                    log("[VT] isVTCall is 0 or not Integer type");
                }
            } else
            {
                log("[VT] isVTCall == null");
            }
            intent.setFlags(0x10000000);
            mContext.startActivity(intent);
            expectCallStart();
            return new AtCommandResult(2);
        } else
        {
            log((new StringBuilder()).append("mWaitingForOutCallStart=").append(String.valueOf(mWaitingForOutCallStart)).append(", mBluetoothPhoneState.mCallsetup=").append(mBluetoothPhoneState.mCallsetup).toString());
            return new AtCommandResult(1);
        }
    }

    private void registerAllVendorSpecificCommands()
    {
        registerVendorSpecificCommand("+XEVENT", 85, mHeadset.getAtParser());
    }

    private void registerVendorSpecificCommand(String s, int i, AtParser atparser)
    {
        atparser.register(s, new VendorSpecificCommandHandler(s, i));
    }

    private void sendURC(String s)
    {
        log((new StringBuilder()).append("sendURC: Tag sendURC ").append(s).toString());
        if (isHeadsetConnected() && s.length() > 0)
            mHeadset.sendURC(s);
    }

    private void setAudioState(int i, BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        log((new StringBuilder()).append("setAudioState(").append(i).append(")").toString());
        if (mBluetoothHeadset != null)
            break MISSING_BLOCK_LABEL_68;
        mAdapter.getProfileProxy(mContext, mProfileListener, 1);
        mPendingAudioState = true;
        mAudioState = i;
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        mBluetoothHeadset.setAudioState(bluetoothdevice, i);
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    private void startDebug()
    {
        if (mDebugThread == null)
        {
            mDebugThread = new DebugThread();
            mDebugThread.start();
        }
    }

    private void stopDebug()
    {
        if (mDebugThread != null)
        {
            mDebugThread.interrupt();
            mDebugThread = null;
        }
    }

    public static String typeToString(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            return "handsfree";

        case 1: // '\001'
            return "headset";

        case 0: // '\0'
            return "unknown";
        }
        return null;
    }

    void audioOff()
    {
        this;
        JVM INSTR monitorenter ;
        log((new StringBuilder()).append("audioOff(): mPendingSco: ").append(mPendingSco).append(", mA2dpState: ").append(mA2dpState).append(", mA2dpSuspended: ").append(mA2dpSuspended).toString());
        mIsPendingAudioOn = false;
        if (!mIsProcAudioOff)
            break MISSING_BLOCK_LABEL_76;
        log("[API] audio off is processing");
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        doAudioOff();
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    boolean audioOn()
    {
        boolean flag = false;
        this;
        JVM INSTR monitorenter ;
        log("audioOn()");
        mIsPendingAudioOn = false;
        if (!mIsProcAudioOff) goto _L2; else goto _L1
_L1:
        log("[API] audioOn() called when audio off is in progress");
        mIsPendingAudioOn = true;
_L3:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        if (isHeadsetConnected())
            break MISSING_BLOCK_LABEL_61;
        log("audioOn(): headset is not connected!");
        flag = false;
          goto _L3
        Exception exception;
        exception;
        throw exception;
        if (mHeadsetType != 2 || mServiceConnectionEstablished)
            break MISSING_BLOCK_LABEL_87;
        log("audioOn(): service connection not yet established!");
        flag = false;
          goto _L3
        if (!mAudioConnected)
            break MISSING_BLOCK_LABEL_106;
        log("audioOn(): audio is already connected");
        flag = true;
          goto _L3
        if (mUserWantsAudio)
            break MISSING_BLOCK_LABEL_124;
        log("audioOn(): user requested no audio, ignoring");
        flag = false;
          goto _L3
        if (!mSCOConnecting)
            break MISSING_BLOCK_LABEL_143;
        log("audioOn(): audio connection is on going");
        flag = true;
          goto _L3
        if (!mPendingSco)
            break MISSING_BLOCK_LABEL_161;
        log("audioOn(): SCO already pending");
        flag = true;
          goto _L3
        mPendingSco = false;
        if (mA2dpSuspended) goto _L5; else goto _L4
_L4:
        if (!isA2dpMultiProfile() || mA2dpPlayingState != 10) goto _L7; else goto _L6
_L6:
        log("suspending A2DP stream [Pre-Condition: A2DP streaming, Event: Turn SCO On]");
        log((new StringBuilder()).append("Current mA2dpPlayingState =").append(mA2dpPlayingState).append(", waiting for A2DP streaming to stop").toString());
        mA2dpSuspended = mA2dp.suspendSink(mA2dpDevice);
        if (!mA2dpSuspended) goto _L9; else goto _L8
_L8:
        mPendingSco = true;
        Message message = mHandler.obtainMessage(6);
        mHandler.sendMessageDelayed(message, 2000L);
_L5:
        boolean flag1;
        if (mPendingSco)
            break MISSING_BLOCK_LABEL_486;
        flag1 = mHeadset.connect();
        flag = false;
        if (!flag1) goto _L3; else goto _L10
_L10:
        BluetoothDevice bluetoothdevice = mHeadset.getRemoteDevice();
        log((new StringBuilder()).append("audioOn: device=").append(bluetoothdevice).append(" state=").append(getAudioState(bluetoothdevice)).toString());
        if (10 == getAudioState(bluetoothdevice))
        {
            log((new StringBuilder()).append("audioOn: device=").append(bluetoothdevice).append(" from state= STATE_AUDIO_DISCONNECTED to state = STATE_AUDIO_CONNECTING").toString());
            setAudioState(11, bluetoothdevice);
            mSCOConnecting = true;
        }
        break MISSING_BLOCK_LABEL_491;
_L9:
        logWarn("Could not suspend A2DP stream for SCO, going ahead with SCO");
          goto _L5
_L7:
        if (!isA2dpMultiProfile() || mA2dpPlayingState != 11) goto _L5; else goto _L11
_L11:
        log("suspending A2DP stream [Pre-Condition: A2DP not streaming, Event: Turn SCO On]");
        log((new StringBuilder()).append("Current mA2dpPlayingState =").append(mA2dpPlayingState).append(", A2DP streaming is already stopped").toString());
        mA2dpSuspended = mA2dp.suspendSink(mA2dpDevice);
          goto _L5
        flag = true;
          goto _L3
        flag = true;
          goto _L3
    }

    public void cdmaSetSecondCallState(boolean flag)
    {
        log((new StringBuilder()).append("cdmaSetSecondCallState: Setting mCdmaIsSecondCallActive to ").append(flag).toString());
        mCdmaIsSecondCallActive = flag;
        if (!mCdmaIsSecondCallActive)
            mCdmaCallsSwapped = false;
    }

    public void cdmaSwapSecondCallState()
    {
        log("cdmaSetSecondCallState: Toggling mCdmaIsSecondCallActive");
        boolean flag;
        if (!mCdmaIsSecondCallActive)
            flag = true;
        else
            flag = false;
        mCdmaIsSecondCallActive = flag;
        mCdmaCallsSwapped = true;
    }

    void connectHeadset(BluetoothAudioGateway bluetoothaudiogateway, int i)
    {
        this;
        JVM INSTR monitorenter ;
        mHeadset = bluetoothaudiogateway;
        mHeadsetType = i;
        if (mHeadsetType != 1) goto _L2; else goto _L1
_L1:
        initializeHeadsetAtParser();
_L5:
        mSCOConnecting = false;
        registerAllVendorSpecificCommands();
        bluetoothaudiogateway.startEventThread();
        configAudioParameters();
        if (inDebug())
            startDebug();
        if (!isIncallAudio()) goto _L4; else goto _L3
_L3:
        audioOn();
_L7:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        initializeHandsfreeAtParser();
          goto _L5
        Exception exception;
        exception;
        throw exception;
_L4:
        if (!mCM.getFirstActiveRingingCall().isRinging()) goto _L7; else goto _L6
_L6:
        mBluetoothPhoneState.ring();
          goto _L7
    }

    void disconnectHeadset()
    {
        this;
        JVM INSTR monitorenter ;
        audioOff();
        terminateScoUsingVirtualVoiceCall();
        mHeadsetType = 0;
        stopDebug();
        resetAtState();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    void doAudioOff()
    {
        this;
        JVM INSTR monitorenter ;
        log((new StringBuilder()).append("doAudioOff(): mPendingSco: ").append(mPendingSco).append(", mA2dpState: ").append(mA2dpState).append(", mA2dpSuspended: ").append(mA2dpSuspended).toString());
        mPendingSco = false;
        mHandler.removeMessages(6);
        closeConnectedSco();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    BluetoothAudioGateway getHeadset()
    {
        return mHeadset;
    }

    public void handleSCOEvent(int i, BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        log((new StringBuilder()).append("[HANDLER] handleSCOEvent(").append(i).append(")").toString());
        mConnectedAudioDevice = bluetoothdevice;
        i;
        JVM INSTR tableswitch 4 6: default 64
    //                   4 90
    //                   5 179
    //                   6 233;
           goto _L1 _L2 _L3 _L4
_L1:
        log((new StringBuilder()).append("Unsupported SCO message ").append(i).toString());
_L7:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (!isHeadsetConnected() || !mAudioPossible && !allowAudioAnytime() || mAudioConnected) goto _L6; else goto _L5
_L5:
        logInfo("Routing audio for incoming SCO connection");
        mAudioConnected = true;
        log("mAudioManager.setBluetoothScoOn(true)");
        mAudioManager.setBluetoothScoOn(true);
        setAudioState(12, bluetoothdevice);
          goto _L7
        Exception exception;
        exception;
        throw exception;
_L6:
        logInfo("Rejecting incoming SCO connection");
        mHeadset.close();
        mIsProcAudioOff = true;
          goto _L7
_L3:
        if (isHeadsetConnected() && !mAudioConnected)
        {
            log("Routing audio for outgoing SCO conection");
            mAudioConnected = true;
            log("mAudioManager.setBluetoothScoOn(true)");
            mAudioManager.setBluetoothScoOn(true);
            setAudioState(12, bluetoothdevice);
        }
        mSCOConnecting = false;
          goto _L7
_L4:
        log((new StringBuilder()).append("handleSCOEvent: SCO_CLOSED mSCOConnecting=").append(mSCOConnecting).toString());
        if (mSCOConnecting) goto _L9; else goto _L8
_L8:
        log((new StringBuilder()).append("case SCO_CLOSED, mA2dpState: ").append(mA2dpState).append(", mA2dpSuspended: ").append(mA2dpSuspended).toString());
        if (mA2dpSuspended)
        {
            if (isA2dpMultiProfile())
            {
                log("resuming A2DP stream [Pre-Condition: A2DP is suspended  Event: SCO Disconnected]");
                mA2dp.resumeSink(mA2dpDevice);
            }
            mA2dpSuspended = false;
        }
        doAudioOff();
        mBluetoothPhoneState.scoClosed();
        mConnectedAudioDevice = null;
        mIsProcAudioOff = false;
        if (mIsPendingAudioOn)
        {
            log("[API] process the pedding userWantsAudioOn when audio off is completed");
            mIsPendingAudioOn = false;
            audioOn();
        }
          goto _L7
_L9:
        failedScoConnect(bluetoothdevice);
          goto _L7
    }

    void ignoreRing()
    {
        log("[API] ignoreRing");
        mBluetoothPhoneState.ignoreRing();
    }

    boolean initiateScoUsingVirtualVoiceCall()
    {
        boolean flag = false;
        this;
        JVM INSTR monitorenter ;
        log("initiateScoUsingVirtualVoiceCall: Received");
        if (!isCellularCallInProgress() && !isVoiceRecognitionInProgress()) goto _L2; else goto _L1
_L1:
        Log.e("Bluetooth HS/HF", "initiateScoUsingVirtualVoiceCall: Call in progress");
_L3:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        if (mBluetoothPhoneState.sendUpdate() && !isVirtualCallInProgress())
        {
            AtCommandResult atcommandresult = new AtCommandResult(2);
            atcommandresult.addResponse("+CIEV: 3,2");
            atcommandresult.addResponse("+CIEV: 2,1");
            atcommandresult.addResponse("+CIEV: 3,0");
            sendURC(atcommandresult.toString());
            Log.d("Bluetooth HS/HF", "initiateScoUsingVirtualVoiceCall: Sent Call-setup procedure");
        }
        mVirtualCallStarted = true;
        if (audioOn())
            break MISSING_BLOCK_LABEL_139;
        log("initiateScoUsingVirtualVoiceCall: audioON failed");
        terminateScoUsingVirtualVoiceCall();
        flag = false;
          goto _L3
        Exception exception;
        exception;
        throw exception;
        mAudioPossible = true;
        log("initiateScoUsingVirtualVoiceCall: Done");
        flag = true;
          goto _L3
    }

    boolean isAudioOn()
    {
        boolean flag = true;
        if (mHeadset == null || !mHeadset.isSCOConnected() || mAudioConnected != flag)
            flag = false;
        log((new StringBuilder()).append("[API] isAudioOn : ").append(String.valueOf(flag)).toString());
        return flag;
    }

    void onBluetoothDisabled()
    {
        this;
        JVM INSTR monitorenter ;
        audioOff();
        mIsProcAudioOff = false;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    void onBluetoothEnabled()
    {
        this;
        JVM INSTR monitorenter ;
        log("[API] onBluetoothEnabled");
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public AtCommandResult reportCmeError(int i)
    {
        if (mCmee)
        {
            AtCommandResult atcommandresult = new AtCommandResult(2);
            atcommandresult.addResponse((new StringBuilder()).append("+CME ERROR: ").append(i).toString());
            return atcommandresult;
        } else
        {
            return new AtCommandResult(1);
        }
    }

    void resetAtState()
    {
        this;
        JVM INSTR monitorenter ;
        mClip = false;
        mIndicatorsEnabled = false;
        mServiceConnectionEstablished = false;
        mCmee = false;
        mClccTimestamps = new long[6];
        mClccUsed = new boolean[6];
        int i = 0;
_L2:
        if (i >= 6)
            break; /* Loop/switch isn't completed */
        mClccUsed[i] = false;
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        mRemoteBrsf = 0;
        mPhonebook.resetAtState();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void sendScoGainUpdate(int i)
    {
        if (mScoGain != i && (0x10 & mRemoteBrsf) != 0)
        {
            sendURC((new StringBuilder()).append("+VGS:").append(i).toString());
            mScoGain = i;
        }
    }

    void setVirtualCallInProgress(boolean flag)
    {
        mVirtualCallStarted = flag;
    }

    boolean startVoiceRecognition()
    {
        boolean flag = false;
        this;
        JVM INSTR monitorenter ;
        if (!isCellularCallInProgress() && !isVirtualCallInProgress() && !mVoiceRecognitionStarted) goto _L2; else goto _L1
_L1:
        Log.e("Bluetooth HS/HF", "startVoiceRecognition: Call in progress");
_L3:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        mVoiceRecognitionStarted = true;
        if (!mWaitingForVoiceRecognition)
            break MISSING_BLOCK_LABEL_101;
        mWaitingForVoiceRecognition = false;
        sendURC("OK");
_L4:
        flag = audioOn();
        if (flag)
            break MISSING_BLOCK_LABEL_76;
        mVoiceRecognitionStarted = false;
        if (mStartVoiceRecognitionWakeLock.isHeld())
            mStartVoiceRecognitionWakeLock.release();
          goto _L3
        Exception exception;
        exception;
        throw exception;
        sendURC("+BVRA: 1");
          goto _L4
    }

    boolean stopVoiceRecognition()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = isVoiceRecognitionInProgress();
        boolean flag1 = false;
        if (flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return flag1;
_L2:
        mVoiceRecognitionStarted = false;
        sendURC("+BVRA: 0");
        audioOff();
        flag1 = true;
        if (true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    boolean terminateScoUsingVirtualVoiceCall()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        log("terminateScoUsingVirtualVoiceCall: Received");
        flag = isVirtualCallInProgress();
        boolean flag1 = false;
        if (flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return flag1;
_L2:
        audioOff();
        if (mBluetoothPhoneState.sendUpdate())
        {
            AtCommandResult atcommandresult = new AtCommandResult(2);
            atcommandresult.addResponse("+CIEV: 2,0");
            sendURC(atcommandresult.toString());
            log("terminateScoUsingVirtualVoiceCall: Sent Call-setup procedure");
        }
        mVirtualCallStarted = false;
        mAudioPossible = false;
        log("terminateScoUsingVirtualVoiceCall: Done");
        flag1 = true;
        if (true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    void updateBtHandsfreeAfterRadioTechnologyChange()
    {
        Log.d("Bluetooth HS/HF", "updateBtHandsfreeAfterRadioTechnologyChange...");
        mBluetoothPhoneState.updateBtPhoneStateAfterRadioTechnologyChange();
    }

    void userWantsAudioOff()
    {
        this;
        JVM INSTR monitorenter ;
        log("[API] userWantsAudioOff");
        mUserWantsAudio = false;
        audioOff();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    void userWantsAudioOn()
    {
        this;
        JVM INSTR monitorenter ;
        log("[API] userWantsAudioOn");
        mUserWantsAudio = true;
        audioOn();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }









/*
    static boolean access$1502(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mIndicatorsEnabled = flag;
        return flag;
    }

*/



/*
    static boolean access$1602(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mServiceConnectionEstablished = flag;
        return flag;
    }

*/



/*
    static boolean access$1702(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mClip = flag;
        return flag;
    }

*/



/*
    static ServiceState access$1802(BluetoothHandsfree bluetoothhandsfree, ServiceState servicestate)
    {
        bluetoothhandsfree.mServiceState = servicestate;
        return servicestate;
    }

*/




/*
    static BluetoothDevice access$2002(BluetoothHandsfree bluetoothhandsfree, BluetoothDevice bluetoothdevice)
    {
        bluetoothhandsfree.mA2dpDevice = bluetoothdevice;
        return bluetoothdevice;
    }

*/



/*
    static int access$2102(BluetoothHandsfree bluetoothhandsfree, int i)
    {
        bluetoothhandsfree.mA2dpState = i;
        return i;
    }

*/



/*
    static int access$2202(BluetoothHandsfree bluetoothhandsfree, int i)
    {
        bluetoothhandsfree.mA2dpPlayingState = i;
        return i;
    }

*/



/*
    static boolean access$2302(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mA2dpSuspended = flag;
        return flag;
    }

*/



/*
    static boolean access$2402(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mPendingSco = flag;
        return flag;
    }

*/




/*
    static BluetoothA2dp access$2902(BluetoothHandsfree bluetoothhandsfree, BluetoothA2dp bluetootha2dp)
    {
        bluetoothhandsfree.mA2dp = bluetootha2dp;
        return bluetootha2dp;
    }

*/






/*
    static boolean access$3302(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mSCOConnecting = flag;
        return flag;
    }

*/




/*
    static com.android.internal.telephony.PhoneConstants.State access$3502(BluetoothHandsfree bluetoothhandsfree, com.android.internal.telephony.PhoneConstants.State state)
    {
        bluetoothhandsfree.mPhoneState = state;
        return state;
    }

*/



/*
    static boolean access$3602(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mUserWantsAudio = flag;
        return flag;
    }

*/



/*
    static boolean access$3802(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mAudioPossible = flag;
        return flag;
    }

*/



/*
    static int access$3902(BluetoothHandsfree bluetoothhandsfree, int i)
    {
        bluetoothhandsfree.mRemoteBrsf = i;
        return i;
    }

*/






/*
    static long access$4202(BluetoothHandsfree bluetoothhandsfree, long l)
    {
        bluetoothhandsfree.mBgndEarliestConnectionTime = l;
        return l;
    }

*/








/*
    static boolean access$4902(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mWaitingForCallStart = flag;
        return flag;
    }

*/




/*
    static boolean access$5102(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mWaitingForOutCallStart = flag;
        return flag;
    }

*/



/*
    static boolean access$5202(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mWaitingForVoiceRecognition = flag;
        return flag;
    }

*/





/*
    static BluetoothHeadset access$5702(BluetoothHandsfree bluetoothhandsfree, BluetoothHeadset bluetoothheadset)
    {
        bluetoothhandsfree.mBluetoothHeadset = bluetoothheadset;
        return bluetoothheadset;
    }

*/



/*
    static boolean access$5802(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mPendingAudioState = flag;
        return flag;
    }

*/









/*
    static boolean access$6802(BluetoothHandsfree bluetoothhandsfree, boolean flag)
    {
        bluetoothhandsfree.mCmee = flag;
        return flag;
    }

*/










/*
    static int access$8102(BluetoothHandsfree bluetoothhandsfree, int i)
    {
        bluetoothhandsfree.mScoGain = i;
        return i;
    }

*/



    // Unreferenced inner class com/android/phone/BluetoothHandsfree$BluetoothPhoneState$1

/* anonymous class */
    class BluetoothPhoneState._cls1 extends Handler
    {

        final BluetoothPhoneState this$1;

        public void handleMessage(Message message)
        {
            BluetoothHandsfree.log((new StringBuilder()).append("mStateChangeHandler.handleMessage(): msg = ").append(message.what).toString());
            switch (message.what)
            {
            case 5: // '\005'
            case 8: // '\b'
            case 10: // '\n'
            case 11: // '\013'
            case 12: // '\f'
            default:
                break;

            case 2: // '\002'
            case 4: // '\004'
            case 6: // '\006'
                boolean flag = ((AsyncResult)message.obj).result instanceof Connection;
                Connection connection = null;
                if (flag)
                    connection = (Connection)((AsyncResult)message.obj).result;
                handlePreciseCallStateChange(sendUpdate(), connection);
                return;

            case 1: // '\001'
                AsyncResult asyncresult = (AsyncResult)message.obj;
                int i = ((Integer)(Integer)asyncresult.userObj).intValue();
                if (mPhonebook.getDefaultSIM() == i)
                {
                    ServiceState servicestate = (ServiceState)asyncresult.result;
                    updateServiceState(sendUpdate(), servicestate);
                    return;
                }
                break;

            case 9: // '\t'
                BluetoothHandsfree.log("CDMA phone call, make the ring");
                AtCommandResult atcommandresult1 = cdmaRing();
                if (atcommandresult1 != null)
                {
                    sendURC(atcommandresult1.toString());
                    return;
                }
                break;

            case 3: // '\003'
            case 7: // '\007'
            case 13: // '\r'
                AtCommandResult atcommandresult = ring();
                if (atcommandresult != null)
                {
                    sendURC(atcommandresult.toString());
                    return;
                }
                break;
            }
        }

            
            {
                this$1 = BluetoothPhoneState.this;
                super();
            }
    }


    // Unreferenced inner class com/android/phone/BluetoothHandsfree$BluetoothPhoneState$2

/* anonymous class */
    class BluetoothPhoneState._cls2 extends BroadcastReceiver
    {

        final BluetoothPhoneState this$1;

        public void onReceive(Context context, Intent intent)
        {
            String s;
            s = intent.getAction();
            BluetoothHandsfree.log((new StringBuilder()).append("[API] mStateReceiver.onReceive(").append(s).append(")").toString());
            if (!s.equals("android.intent.action.BATTERY_CHANGED")) goto _L2; else goto _L1
_L1:
            Message message1 = mHandler.obtainMessage(9, intent);
            mHandler.sendMessage(message1);
_L13:
            return;
_L2:
            if (s.equals("android.intent.action.SIG_STR"))
            {
                Message message = mHandler.obtainMessage(10, intent);
                mHandler.sendMessage(message);
                return;
            }
            if (!s.equals("android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED")) goto _L4; else goto _L3
_L3:
            int k;
            int l;
            BluetoothDevice bluetoothdevice1;
            k = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
            l = intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0);
            bluetoothdevice1 = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if (bluetoothdevice1 == null || mA2dpDevice != null && !bluetoothdevice1.equals(mA2dpDevice))
            {
                BluetoothHandsfree.log((new StringBuilder()).append("device=").append(bluetoothdevice1).append(", mA2dpDevice=").append(mA2dpDevice).toString());
                return;
            }
            BluetoothHandsfree bluetoothhandsfree1 = _fld0;
            bluetoothhandsfree1;
            JVM INSTR monitorenter ;
            mA2dpState = k;
            BluetoothHandsfree.log((new StringBuilder()).append("A2DP ACTION_CONNECTION_STATE_CHANGED:").append(l).append("->").append(k).toString());
            if (k != 0) goto _L6; else goto _L5
_L5:
            mA2dpPlayingState = 11;
            mA2dpDevice = null;
_L7:
            if (k != 0)
                break MISSING_BLOCK_LABEL_386;
            if (mA2dpSuspended && mPendingSco)
            {
                processPendingSCO();
                mPendingSco = false;
            }
            mA2dpSuspended = false;
            bluetoothhandsfree1;
            JVM INSTR monitorexit ;
            return;
            Exception exception1;
            exception1;
            bluetoothhandsfree1;
            JVM INSTR monitorexit ;
            throw exception1;
_L6:
            mA2dpDevice = bluetoothdevice1;
            if (true) goto _L7; else goto _L4
_L4:
            int i;
            int j;
            if (!s.equals("android.bluetooth.a2dp.profile.action.PLAYING_STATE_CHANGED"))
                continue; /* Loop/switch isn't completed */
            i = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
            j = intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0);
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if (bluetoothdevice == null || mA2dpDevice != null && !bluetoothdevice.equals(mA2dpDevice))
            {
                BluetoothHandsfree.log((new StringBuilder()).append("device=").append(bluetoothdevice).append(", mA2dpDevice=").append(mA2dpDevice).toString());
                return;
            }
            BluetoothHandsfree bluetoothhandsfree = _fld0;
            bluetoothhandsfree;
            JVM INSTR monitorenter ;
            mA2dpPlayingState = i;
            BluetoothHandsfree.log((new StringBuilder()).append("A2DP ACTION_PLAYING_STATE_CHANGED:").append(j).append("->").append(i).toString());
            if (i != 11) goto _L9; else goto _L8
_L8:
            if (mA2dpSuspended && mPendingSco)
            {
                processPendingSCO();
                mPendingSco = false;
            }
_L11:
            bluetoothhandsfree;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            bluetoothhandsfree;
            JVM INSTR monitorexit ;
            throw exception;
_L9:
            if (mA2dpPlayingState != 10 || !isA2dpMultiProfile() || !sendUpdate() || mA2dpSuspended || mCall != 0 || mCallsetup != 1) goto _L11; else goto _L10
_L10:
            BluetoothHandsfree.log("suspending A2DP stream for incoming call [Pre-Condition: HFP SLC connected, Phone ringing, Event: A2DP starts to play]");
            mA2dpSuspended = mA2dp.suspendSink(mA2dpDevice);
              goto _L11
            if (!intent.getAction().equals("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY")) goto _L13; else goto _L12
_L12:
            mPhonebook.handleAccessPermissionResult(intent);
            return;
        }

            
            {
                this$1 = BluetoothPhoneState.this;
                super();
            }
    }

}
