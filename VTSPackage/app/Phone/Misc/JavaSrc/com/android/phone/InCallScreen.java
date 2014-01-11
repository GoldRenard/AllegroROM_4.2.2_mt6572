// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.bluetooth.*;
import android.content.*;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Typeface;
import android.os.*;
import android.telephony.PhoneNumberUtils;
import android.telephony.ServiceState;
import android.text.method.DialerKeyListener;
import android.util.EventLog;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.widget.*;
import com.android.internal.telephony.*;
import com.android.internal.telephony.cdma.CdmaMmiCode;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.android.internal.telephony.gsm.*;
import com.android.internal.telephony.sip.SipPhone;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.telephony.IServiceStateExt;
import com.mediatek.phone.*;
import com.mediatek.phone.ext.*;
import com.mediatek.phone.gemini.GeminiRegister;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.phone.recording.PhoneRecorder;
import com.mediatek.phone.recording.PhoneRecorderHandler;
import com.mediatek.phone.vt.*;
import java.util.*;

// Referenced classes of package com.android.phone:
//            CallFeaturesSetting, PhoneGlobals, InCallUiState, PhoneUtils, 
//            OtaUtils, DTMFTwelveKeyDialer, CdmaPhoneCallState, CallTime, 
//            CallCard, InCallControlState, ManageConferenceUtils, InCallTouchUi, 
//            RespondViaSmsManager, AdminReceiver, CallNotifier, Ringer, 
//            PhoneInterfaceManager, NotificationMgr, Profiler

public class InCallScreen extends Activity
    implements android.view.View.OnClickListener, CallTime.OnTickListener, android.widget.PopupMenu.OnMenuItemClickListener, com.mediatek.phone.recording.PhoneRecorderHandler.Listener, android.content.DialogInterface.OnShowListener, IInCallScreen, com.mediatek.phone.VoiceCommandHandler.Listener
{
    public static final class InCallAudioMode extends Enum
    {

        private static final InCallAudioMode $VALUES[];
        public static final InCallAudioMode BLUETOOTH;
        public static final InCallAudioMode EARPIECE;
        public static final InCallAudioMode SPEAKER;

        public static InCallAudioMode valueOf(String s)
        {
            return (InCallAudioMode)Enum.valueOf(com/android/phone/InCallScreen$InCallAudioMode, s);
        }

        public static InCallAudioMode[] values()
        {
            return (InCallAudioMode[])$VALUES.clone();
        }

        static 
        {
            SPEAKER = new InCallAudioMode("SPEAKER", 0);
            BLUETOOTH = new InCallAudioMode("BLUETOOTH", 1);
            EARPIECE = new InCallAudioMode("EARPIECE", 2);
            InCallAudioMode aincallaudiomode[] = new InCallAudioMode[3];
            aincallaudiomode[0] = SPEAKER;
            aincallaudiomode[1] = BLUETOOTH;
            aincallaudiomode[2] = EARPIECE;
            $VALUES = aincallaudiomode;
        }

        private InCallAudioMode(String s, int i)
        {
            super(s, i);
        }
    }

    private static final class SyncWithPhoneStateStatus extends Enum
    {

        private static final SyncWithPhoneStateStatus $VALUES[];
        public static final SyncWithPhoneStateStatus PHONE_NOT_IN_USE;
        public static final SyncWithPhoneStateStatus SUCCESS;

        public static SyncWithPhoneStateStatus valueOf(String s)
        {
            return (SyncWithPhoneStateStatus)Enum.valueOf(com/android/phone/InCallScreen$SyncWithPhoneStateStatus, s);
        }

        public static SyncWithPhoneStateStatus[] values()
        {
            return (SyncWithPhoneStateStatus[])$VALUES.clone();
        }

        static 
        {
            SUCCESS = new SyncWithPhoneStateStatus("SUCCESS", 0);
            PHONE_NOT_IN_USE = new SyncWithPhoneStateStatus("PHONE_NOT_IN_USE", 1);
            SyncWithPhoneStateStatus asyncwithphonestatestatus[] = new SyncWithPhoneStateStatus[2];
            asyncwithphonestatestatus[0] = SUCCESS;
            asyncwithphonestatestatus[1] = PHONE_NOT_IN_USE;
            $VALUES = asyncwithphonestatestatus;
        }

        private SyncWithPhoneStateStatus(String s, int i)
        {
            super(s, i);
        }
    }


    private static String ACTION_LOCKED = "com.mediatek.dm.LAWMO_LOCK";
    public static final String ACTION_UNDEFINED = "com.android.phone.InCallScreen.UNDEFINED";
    private static String ACTION_UNLOCK = "com.mediatek.dm.LAWMO_UNLOCK";
    private static final int ADD_VOICEMAIL_NUMBER = 106;
    static final int AUTO_RETRY_OFF = 0;
    static final int AUTO_RETRY_ON = 1;
    private static final int CALL_ENDED_EXTRA_LONG_DELAY = 5000;
    private static final int CALL_ENDED_LONG_DELAY = 2000;
    private static final int CALL_ENDED_SHORT_DELAY = 0;
    private static final int CRSS_SUPP_SERVICE = 141;
    private static final boolean DBG = true;
    public static final int DELAYED_CLEANUP_AFTER_DISCONNECT = 108;
    public static final int DELAYED_CLEANUP_AFTER_DISCONNECT2 = 147;
    public static final int DELAYED_CLEANUP_AFTER_DISCONNECT3 = 247;
    public static final int DELAYED_CLEANUP_AFTER_DISCONNECT4 = 347;
    public static final int DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI[] = {
        108, 147, 247, 347
    };
    private static final int DELAY_AUTO_ANSWER = 125;
    private static final int DELAY_TO_FINISH_INCALLSCREEN = 203;
    private static final int DONT_ADD_VOICEMAIL_NUMBER = 107;
    private static final int EVENT_HEADSET_PLUG_STATE_CHANGED = 103;
    private static final int EVENT_HIDE_PROVIDER_INFO = 121;
    private static final int EVENT_PAUSE_DIALOG_COMPLETE = 120;
    static final String EXTRA_FORCE_SPEAKER_ON = "com.android.phone.extra.FORCE_SPEAKER_ON";
    static final String EXTRA_GATEWAY_PROVIDER_PACKAGE = "com.android.phone.extra.GATEWAY_PROVIDER_PACKAGE";
    static final String EXTRA_GATEWAY_URI = "com.android.phone.extra.GATEWAY_URI";
    public static final String EXTRA_SEND_EMPTY_FLASH = "com.android.phone.extra.SEND_EMPTY_FLASH";
    private static final int FAKE_INCOMING_CALL_WIDGET = 160;
    static final String KEY_EMERGENCY_DIALER = "com.android.phone.EmergencyDialer";
    private static final String LOG_TAG = "InCallScreen";
    private static final int PAUSE_PROMPT_DIALOG_TIMEOUT = 2000;
    private static final int PHONE_CDMA_CALL_WAITING = 115;
    private static final int PHONE_DISCONNECT = 102;
    private static final int PHONE_DISCONNECT2 = 144;
    private static final int PHONE_DISCONNECT3 = 244;
    private static final int PHONE_DISCONNECT4 = 344;
    private static final int PHONE_DISCONNECT_GEMINI[] = {
        102, 144, 244, 344
    };
    private static final int PHONE_INCOMING_RING = 123;
    private static final int PHONE_NEW_RINGING_CONNECTION = 124;
    private static final int PHONE_RECORD_STATE_UPDATE = 130;
    private static final int PHONE_STATE_CHANGED = 101;
    private static final String PIN_REQUIRED = "PIN_REQUIRED";
    private static final int POST_ON_DIAL_CHARS = 104;
    private static final int PROVIDER_INFO_TIMEOUT = 5000;
    private static final String PUK_REQUIRED = "PUK_REQUIRED";
    private static final int REQUEST_CLOSE_OTA_FAILURE_NOTICE = 119;
    private static final int REQUEST_CLOSE_SPC_ERROR_NOTICE = 118;
    private static final int REQUEST_UPDATE_BLUETOOTH_INDICATION = 114;
    private static final int REQUEST_UPDATE_SCREEN = 122;
    private static final int REQUEST_UPDATE_SCREEN_EXT = 204;
    private static final int SEND_MESSAGE = 1;
    private static final int SET_IGNORE_USER_ACTIVITY = 126;
    static final String SHOW_DIALPAD_EXTRA = "com.android.phone.ShowDialpad";
    private static final int SUPP_SERVICE_FAILED = 110;
    private static final int SUPP_SERVICE_NOTIFICATION = 140;
    static final int SUP_TYPE = 145;
    private static final boolean VDBG = true;
    private static final int VT_EM_AUTO_ANSWER = 202;
    private static final int VT_VOICE_ANSWER_OVER = 161;
    private static final int WILD_PROMPT_CHAR_ENTERED = 105;
    private static boolean mLocaleChanged = false;
    private static List prevPhonenums = new ArrayList();
    private static int sPreHeadsetPlugState = -1;
    private ComponentName componentName;
    private Boolean delayTime_disableTouch;
    private int lock_screen_time;
    private BluetoothAdapter mAdapter;
    private PhoneGlobals mApp;
    private Call mBackgroundCall;
    private com.android.internal.telephony.Call.State mBackgroundLastState;
    private BluetoothAdapter mBluetoothAdapter;
    private boolean mBluetoothConnectionPending;
    private long mBluetoothConnectionRequestTime;
    private BluetoothHeadset mBluetoothHeadset;
    private android.bluetooth.BluetoothProfile.ServiceListener mBluetoothProfileServiceListener;
    private CallManager mCM;
    private MTKCallManager mCMGemini;
    private CallCard mCallCard;
    private AlertDialog mCallLostDialog;
    private AlertDialog mCallSelectDialog;
    private CallTime mCallTime;
    private AlertDialog mCanDismissDialog;
    private final BroadcastReceiver mDMLockReceiver = new BroadcastReceiver() {

        final InCallScreen this$0;

        public void onReceive(Context context, Intent intent)
        {
label0:
            {
                String s = intent.getAction();
                if (s.equals(InCallScreen.ACTION_LOCKED))
                {
                    if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                        break label0;
                    Toast.makeText(InCallScreen.this, 0x7f0d0005, 1).show();
                } else
                if (s.equals(InCallScreen.ACTION_UNLOCK))
                {
                    if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                        break label0;
                    Toast.makeText(InCallScreen.this, 0x7f0d0006, 1).show();
                }
                mCallCard.updateState(mCM);
                updateInCallTouchUi();
                if (Constants.VTScreenMode.VT_SCREEN_OPEN == mVTInCallScreen.getVTScreenMode())
                {
                    mVTInCallScreen.updateVTScreen(mVTInCallScreen.getVTScreenMode());
                    return;
                }
            }
        }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
    }
;
    private DTMFTwelveKeyDialer mDialer;
    private android.content.DialogInterface.OnClickListener mDialogClickListener;
    DualTalkUtils mDualTalk;
    private AlertDialog mExitingECMDialog;
    InCallScreenExtension mExtension;
    private Call mForegroundCall;
    private com.android.internal.telephony.Call.State mForegroundLastState;
    private AlertDialog mGenericErrorDialog;
    private Handler mHandler;
    private InCallControlState mInCallControlState;
    private InCallMenuState mInCallMenuState;
    private InCallTouchUi mInCallTouchUi;
    private boolean mInVoiceAnswerVideoCall;
    private boolean mIsDestroyed;
    private boolean mIsForegroundActivity;
    private boolean mIsForegroundActivityForProximity;
    private long mLastClickActionTime;
    private final BroadcastReceiver mLocaleChangeReceiver = new BroadcastReceiver() {

        final InCallScreen this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.LOCALE_CHANGED"))
            {
                InCallScreen.mLocaleChanged = true;
                mApp.notificationMgr.updateInCallNotification();
            }
        }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
    }
;
    private ManageConferenceUtils mManageConferenceUtils;
    private AlertDialog mMissingVoicemailDialog;
    private Dialog mMmiStartedDialog;
    private boolean mOnAnswerandEndCall;
    private boolean mPauseInProgress;
    private AlertDialog mPausePromptDialog;
    private Phone mPhone;
    private PopupMenu mPopupMenu;
    private String mPostDialStrAfterPause;
    private PowerManager mPowerManager;
    private ProgressDialog mProgressDialog;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final InCallScreen this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.HEADSET_PLUG"))
            {
                Message message = Message.obtain(mHandler, 103, intent.getIntExtra("state", 0), 0);
                mHandler.sendMessage(message);
            }
        }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
    }
;
    private boolean mRegisteredForPhoneStates;
    private RespondViaSmsManager mRespondViaSmsManager;
    private Call mRingingCall;
    private com.android.internal.telephony.Call.State mRingingLastState;
    private ViewStub mSecCallInfo;
    private IServiceStateExt mServiceStateExt;
    private boolean mShowStatusIndication;
    private AlertDialog mSimCollisionDialog;
    private boolean mSpeechEnabled;
    private AlertDialog mStorageSpaceDialog;
    private AlertDialog mSuppServiceFailureDialog;
    private boolean mSwappingCalls;
    private IVTInCallScreen mVTInCallScreen;
    private ProgressDialog mVTVoiceAnswerDialog;
    private Timer mVTVoiceAnswerTimer;
    private VoiceCommandHandler mVoiceCommandHandler;
    private ImageView mVoiceRecorderIcon;
    private AlertDialog mWaitPromptDialog;
    private AlertDialog mWildPromptDialog;
    private EditText mWildPromptText;
    private DevicePolicyManager policyManager;
    private Point sScreenSize;
    private Timer timer;
    private TimerTask timerTask;

    public InCallScreen()
    {
        mSpeechEnabled = false;
        mShowStatusIndication = false;
        mLastClickActionTime = 0L;
        mForegroundLastState = com.android.internal.telephony.Call.State.IDLE;
        mBackgroundLastState = com.android.internal.telephony.Call.State.IDLE;
        mRingingLastState = com.android.internal.telephony.Call.State.IDLE;
        delayTime_disableTouch = Boolean.valueOf(false);
        lock_screen_time = 8000;
        mIsDestroyed = false;
        mIsForegroundActivity = false;
        mIsForegroundActivityForProximity = false;
        mPauseInProgress = false;
        mSwappingCalls = false;
        mOnAnswerandEndCall = false;
        mInVoiceAnswerVideoCall = false;
        mVTVoiceAnswerDialog = null;
        mVTVoiceAnswerTimer = null;
        mHandler = new Handler() {

            final InCallScreen this$0;

            public void handleMessage(Message message)
            {
                if (!mIsDestroyed) goto _L2; else goto _L1
_L1:
                log((new StringBuilder()).append("Handler: ignoring message ").append(message).append("; we're destroyed!").toString());
_L4:
                return;
_L2:
                if (!mIsForegroundActivity)
                    log((new StringBuilder()).append("Handler: handling message ").append(message).append(" while not in foreground").toString());
                switch (message.what)
                {
                default:
                    Log.wtf("InCallScreen", (new StringBuilder()).append("mHandler: unexpected message: ").append(message).toString());
                    return;

                case 110: // 'n'
                    onSuppServiceFailed((AsyncResult)message.obj);
                    return;

                case 140: 
                    onSuppServiceNotification((AsyncResult)message.obj);
                    return;

                case 141: 
                    onSuppCrssSuppServiceNotification((AsyncResult)message.obj);
                    return;

                case 101: // 'e'
                    log("----------------------------------------InCallScreen Phone state change----------------------------------");
                    onPhoneStateChanged((AsyncResult)message.obj);
                    return;

                case 102: // 'f'
                case 144: 
                case 244: 
                case 344: 
                    onDisconnect((AsyncResult)message.obj, message.what);
                    return;

                case 103: // 'g'
                    if (InCallScreen.sPreHeadsetPlugState != message.arg1 || InCallScreen.sPreHeadsetPlugState == -1)
                    {
                        if (!isBluetoothAudioConnected())
                            if (message.arg1 != 1)
                            {
                                if (VTCallUtils.isVTActive() && VTCallUtils.isVTDialWithSpeakerOff())
                                {
                                    PhoneUtils.turnOnSpeaker(InCallScreen.this, true, true);
                                    VTCallUtils.setVTDialWithSpeakerOff(false);
                                } else
                                {
                                    PhoneUtils.restoreSpeakerMode(InCallScreen.this);
                                }
                            } else
                            {
                                PhoneUtils.turnOnSpeaker(InCallScreen.this, false, false);
                            }
                        InCallScreen.sPreHeadsetPlugState = message.arg1;
                    }
                    updateScreen();
                    mInCallTouchUi.refreshAudioModePopup();
                    mVTInCallScreen.refreshAudioModePopup();
                    return;

                case 53: // '5'
                case 153: 
                case 253: 
                case 353: 
                    int i = GeminiRegister.getSlotIdByRegisterEvent(message.what, PhoneGlobals.MMI_CANCEL_GEMINI);
                    onMMICancel(i);
                    return;

                case 52: // '4'
                case 152: 
                case 252: 
                case 352: 
                    onMMIComplete((MmiCode)((AsyncResult)message.obj).result);
                    return;

                case 104: // 'h'
                    handlePostOnDialChars((AsyncResult)message.obj, (char)message.arg1);
                    return;

                case 106: // 'j'
                    addVoiceMailNumberPanel();
                    return;

                case 107: // 'k'
                    dontAddVoiceMailNumber();
                    return;

                case 108: // 'l'
                case 147: 
                case 247: 
                case 347: 
                    log((new StringBuilder()).append("mHandler() DELAYED_CLEANUP_AFTER_DISCONNECT  : ").append(message.what).toString());
                    delayedCleanupAfterDisconnect(message.what);
                    return;

                case 114: // 'r'
                    log("REQUEST_UPDATE_BLUETOOTH_INDICATION...");
                    if (mApp.inCallUiState.inCallScreenMode != InCallUiState.InCallScreenMode.UNDEFINED)
                    {
                        updateScreen();
                        return;
                    }
                    break;

                case 115: // 's'
                    log("Received PHONE_CDMA_CALL_WAITING event ...");
                    if (mCM.getFirstActiveRingingCall().getLatestConnection() != null)
                    {
                        updateScreen();
                        mApp.updateWakeState();
                        return;
                    }
                    break;

                case 118: // 'v'
                    if (mApp.otaUtils != null)
                    {
                        mApp.otaUtils.onOtaCloseSpcNotice();
                        return;
                    }
                    break;

                case 119: // 'w'
                    if (mApp.otaUtils != null)
                    {
                        mApp.otaUtils.onOtaCloseFailureNotice();
                        return;
                    }
                    break;

                case 120: // 'x'
                    if (mPausePromptDialog != null)
                    {
                        log("- DISMISSING mPausePromptDialog.");
                        mPausePromptDialog.dismiss();
                        mPausePromptDialog = null;
                        return;
                    }
                    break;

                case 121: // 'y'
                    mApp.inCallUiState.providerInfoVisible = false;
                    if (mCallCard != null)
                    {
                        mCallCard.updateState(mCM);
                        return;
                    }
                    break;

                case 160: 
                    log("handleMessage FAKE_INCOMING_CALL_WIDGET");
                    mInCallTouchUi.updateState(mCM);
                    if (mSuppServiceFailureDialog != null && mSuppServiceFailureDialog.isShowing())
                    {
                        mSuppServiceFailureDialog.dismiss();
                        mSuppServiceFailureDialog = null;
                    }
                    mSuppServiceFailureDialog = (new android.app.AlertDialog.Builder(InCallScreen.this)).setMessage(0x7f0d02db).setPositiveButton(0x7f0d0192, null).setCancelable(true).create();
                    mSuppServiceFailureDialog.getWindow().addFlags(4);
                    mSuppServiceFailureDialog.show();
                    return;

                case 125: // '}'
                    try
                    {
                        if (createPackageContext("com.mediatek.engineermode", 2).getSharedPreferences("AutoAnswer", 1).getBoolean("flag", false) && mCM != null)
                        {
                            PhoneUtils.answerCall(mCM.getFirstActiveRingingCall());
                            return;
                        }
                    }
                    catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
                    {
                        namenotfoundexception.printStackTrace();
                        return;
                    }
                    break;

                case 130: 
                    requestUpdateRecordState(PhoneRecorderHandler.getInstance().getPhoneRecorderState(), PhoneRecorderHandler.getInstance().getCustomValue());
                    return;

                case 122: // 'z'
                case 204: 
                    updateScreen();
                    return;

                case 123: // '{'
                    onIncomingRing();
                    return;

                case 124: // '|'
                    onNewRingingConnection();
                    return;

                case 161: 
                    log("- handler : VT_VOICE_ANSWER_OVER ! ");
                    if (getInVoiceAnswerVideoCall())
                    {
                        setInVoiceAnswerVideoCall(false);
                        delayedCleanupAfterDisconnect();
                        return;
                    }
                    break;

                case -302: 
                case -202: 
                case -102: 
                case -2: 
                    if (((int[])(int[])((AsyncResult)message.obj).result)[0] == 1)
                    {
                        log("- handler : PHONE_SPEECH_INFO enabled!");
                        mSpeechEnabled = true;
                        if (!mInCallControlState.dialpadEnabled)
                        {
                            log("- handler : PHONE_SPEECH_INFO updateInCallTouchUi!");
                            updateInCallTouchUi();
                            return;
                        }
                    } else
                    {
                        log("- handler : PHONE_SPEECH_INFO disabled!");
                        mSpeechEnabled = false;
                        return;
                    }
                    break;

                case 202: 
                    log("- handler : VT_EM_AUTO_ANSWER ! ");
                    internalAnswerCall();
                    return;

                case 203: 
                    InCallUiState incalluistate = mApp.inCallUiState;
                    if (incalluistate.hasPendingCallStatusCode())
                    {
                        log("- DELAY_TO_FINISH_INCALLSCREEN: need to show status indication!");
                        showStatusIndication(incalluistate.getPendingCallStatusCode());
                        incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.SUCCESS);
                        return;
                    }
                    if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                    {
                        finish();
                        return;
                    }
                    break;
                }
                if (true) goto _L4; else goto _L3
_L3:
            }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
        }
;
        mBluetoothProfileServiceListener = new android.bluetooth.BluetoothProfile.ServiceListener() {

            final InCallScreen this$0;

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
                this$0 = InCallScreen.this;
                super();
            }
        }
;
        mDialogClickListener = new android.content.DialogInterface.OnClickListener() {

            final InCallScreen this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (dialoginterface == mSimCollisionDialog && i == -1)
                    PhoneUtils.startNewCall(mCM);
            }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
        }
;
    }

    private void activeManage()
    {
        Intent intent = new Intent("android.app.action.ADD_DEVICE_ADMIN");
        intent.putExtra("android.app.extra.DEVICE_ADMIN", componentName);
        intent.putExtra("android.app.extra.ADD_EXPLANATION", "------------");
        startActivityForResult(intent, 0);
    }

    private void addVoiceMailNumberPanel()
    {
        if (mMissingVoicemailDialog != null)
        {
            mMissingVoicemailDialog.dismiss();
            mMissingVoicemailDialog = null;
        }
        log("addVoiceMailNumberPanel: finishing InCallScreen...");
        endInCallScreenSession();
        log("show vm setting");
        Intent intent = new Intent("com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL");
        intent.setClass(this, com/android/phone/CallFeaturesSetting);
        startActivity(intent);
    }

    private void amendLayoutForDifferentScreen()
    {
        if (PhoneGlobals.sHasNavigationBar)
            ((ViewStub)findViewById(0x7f08000f)).getLayoutParams().height = getResources().getDimensionPixelSize(0x7f0c0049);
    }

    private void bailOutAfterCanDismissDialog()
    {
        if (mCanDismissDialog != null)
        {
            log("bailOutAfterCanDismissDialog: DISMISSING mCanDismissDialog.");
            mCanDismissDialog.dismiss();
            mCanDismissDialog = null;
        }
        log("bailOutAfterCanDismissDialog(): end InCallScreen session...");
        mApp.inCallUiState.clearPendingCallStatusCode();
        if (!mCM.hasActiveFgCall() && !mCM.hasActiveBgCall() && !mCM.hasActiveRingingCall())
            endInCallScreenSession(true);
    }

    private void bailOutAfterErrorDialog()
    {
        if (mGenericErrorDialog != null)
        {
            log("bailOutAfterErrorDialog: DISMISSING mGenericErrorDialog.");
            mGenericErrorDialog.dismiss();
            mGenericErrorDialog = null;
        }
        log("bailOutAfterErrorDialog(): end InCallScreen session...");
        mApp.inCallUiState.clearPendingCallStatusCode();
        if (!mCM.hasActiveFgCall() && !mCM.hasActiveBgCall() && !mCM.hasActiveRingingCall())
            endInCallScreenSession(true);
    }

    private boolean canHangupAll()
    {
        Call call = mCM.getActiveFgCall();
        Call call1 = mCM.getFirstActiveBgCall();
        boolean flag = false;
        if (call1 != null)
        {
            com.android.internal.telephony.Call.State state = call1.getState();
            com.android.internal.telephony.Call.State state1 = com.android.internal.telephony.Call.State.HOLDING;
            flag = false;
            if (state == state1)
                if (call != null && call.getState() == com.android.internal.telephony.Call.State.ACTIVE)
                {
                    flag = true;
                } else
                {
                    boolean flag1 = PhoneUtils.hasActivefgEccCall(mCM);
                    flag = false;
                    if (flag1)
                        flag = true;
                }
        }
        log((new StringBuilder()).append("canHangupAll = ").append(flag).toString());
        return flag;
    }

    private boolean checkOtaspStateOnResume()
    {
label0:
        {
            boolean flag;
            if (mApp.otaUtils == null)
            {
                log("checkOtaspStateOnResume: no OtaUtils instance; nothing to do.");
                flag = false;
            } else
            {
                if (mApp.cdmaOtaScreenState == null || mApp.cdmaOtaProvisionData == null)
                    break label0;
                OtaUtils.CdmaOtaInCallScreenUiState.State state = mApp.otaUtils.getCdmaOtaInCallScreenUiState();
                if (state != OtaUtils.CdmaOtaInCallScreenUiState.State.NORMAL && state != OtaUtils.CdmaOtaInCallScreenUiState.State.ENDED)
                    flag = false;
                else
                    flag = true;
                if (flag)
                {
                    mApp.otaUtils.updateUiWidgets(this, mInCallTouchUi, mCallCard);
                    if (state == OtaUtils.CdmaOtaInCallScreenUiState.State.NORMAL)
                    {
                        log("checkOtaspStateOnResume - in OTA Normal mode");
                        setInCallScreenMode(InCallUiState.InCallScreenMode.OTA_NORMAL);
                        return flag;
                    }
                    if (state == OtaUtils.CdmaOtaInCallScreenUiState.State.ENDED)
                    {
                        log("checkOtaspStateOnResume - in OTA END mode");
                        setInCallScreenMode(InCallUiState.InCallScreenMode.OTA_ENDED);
                        return flag;
                    }
                } else
                {
                    log("checkOtaspStateOnResume - Set OTA NORMAL Mode");
                    setInCallScreenMode(InCallUiState.InCallScreenMode.OTA_NORMAL);
                    if (mApp.otaUtils != null)
                    {
                        mApp.otaUtils.cleanOtaScreen(false);
                        return flag;
                    }
                }
            }
            return flag;
        }
        throw new IllegalStateException("checkOtaspStateOnResume: app.cdmaOta* objects(s) not initialized");
    }

    private void cleanupAfterDisconnect(int i)
    {
        mCM.clearDisconnected();
    }

    private void closeDialpadInternal(boolean flag)
    {
        mDialer.closeDialer(flag);
        mApp.inCallUiState.showDialpad = false;
    }

    private boolean comparePhoneNumbers()
    {
        if (prevPhonenums != null && prevPhonenums.size() != 0)
        {
            List list = mCM.getActiveFgCall().getConnections();
            if (prevPhonenums.size() != list.size())
                return false;
            for (int i = 0; i < list.size(); i++)
            {
                if (!prevPhonenums.contains(list.get(i)))
                    return false;
                if (prevPhonenums.size() == 1 && !((Connection)list.get(i)).isAlive())
                    return false;
            }

            return true;
        } else
        {
            return true;
        }
    }

    private PopupMenu constructPopupMenu(View view)
    {
        PopupMenu popupmenu = new PopupMenu(this, view);
        Menu menu = popupmenu.getMenu();
        popupmenu.inflate(0x7f100003);
        popupmenu.setOnMenuItemClickListener(this);
        setupMenuItems(menu);
        return popupmenu;
    }

    private View createWildPromptView()
    {
        LinearLayout linearlayout = new LinearLayout(this);
        linearlayout.setOrientation(1);
        linearlayout.setPadding(5, 5, 5, 5);
        android.widget.LinearLayout.LayoutParams layoutparams = new android.widget.LinearLayout.LayoutParams(-1, -2);
        TextView textview = new TextView(this);
        textview.setTextSize(14F);
        textview.setTypeface(Typeface.DEFAULT_BOLD);
        textview.setText(getResources().getText(0x7f0d01a1));
        linearlayout.addView(textview, layoutparams);
        mWildPromptText = new EditText(this);
        mWildPromptText.setKeyListener(DialerKeyListener.getInstance());
        mWildPromptText.setMovementMethod(null);
        mWildPromptText.setTextSize(14F);
        mWildPromptText.setMaxLines(1);
        mWildPromptText.setHorizontallyScrolling(true);
        mWildPromptText.setBackgroundResource(0x1080018);
        android.widget.LinearLayout.LayoutParams layoutparams1 = new android.widget.LinearLayout.LayoutParams(-1, -2);
        layoutparams1.setMargins(0, 3, 0, 0);
        linearlayout.addView(mWildPromptText, layoutparams1);
        return linearlayout;
    }

    private void dismissAllDialogs()
    {
        log("dismissAllDialogs()...");
        if (mGenericErrorDialog != null)
        {
            log("- DISMISSING mGenericErrorDialog.");
            mGenericErrorDialog.dismiss();
            mGenericErrorDialog = null;
        }
        if (mStorageSpaceDialog != null)
        {
            log("- DISMISSING mStorageSpaceDialog.");
            mStorageSpaceDialog.dismiss();
            mStorageSpaceDialog = null;
        }
        if (mCallSelectDialog != null)
        {
            mCallSelectDialog.dismiss();
            mCallSelectDialog = null;
        }
        if (mSuppServiceFailureDialog != null)
        {
            log("- DISMISSING mSuppServiceFailureDialog.");
            mSuppServiceFailureDialog.dismiss();
            mSuppServiceFailureDialog = null;
        }
        dismissDialogs();
    }

    private void dismissDialogs()
    {
        log("dismissDialogs()...");
        if (mExtension.dismissDialogs())
            return;
        if (mMissingVoicemailDialog != null)
        {
            log("- DISMISSING mMissingVoicemailDialog.");
            mMissingVoicemailDialog.dismiss();
            mMissingVoicemailDialog = null;
        }
        if (mMmiStartedDialog != null)
        {
            log("- DISMISSING mMmiStartedDialog.");
            mMmiStartedDialog.dismiss();
            mMmiStartedDialog = null;
        }
        if (mGenericErrorDialog != null)
        {
            log("- DISMISSING mGenericErrorDialog.");
            mGenericErrorDialog.dismiss();
            mGenericErrorDialog = null;
        }
        if (mWaitPromptDialog != null)
        {
            log("- DISMISSING mWaitPromptDialog.");
            mWaitPromptDialog.dismiss();
            mWaitPromptDialog = null;
        }
        if (mWildPromptDialog != null)
        {
            log("- DISMISSING mWildPromptDialog.");
            mWildPromptDialog.dismiss();
            mWildPromptDialog = null;
        }
        if (mCallLostDialog != null)
        {
            log("- DISMISSING mCallLostDialog.");
            mCallLostDialog.dismiss();
            mCallLostDialog = null;
        }
        if (mCanDismissDialog != null)
        {
            setPhone(PhoneGlobals.getInstance().phone);
            if (mBackgroundCall.isIdle() && mForegroundCall.isIdle() && mRingingCall.isIdle())
                endInCallScreenSession();
            log("- DISMISSING mCanDismissDialog.");
            mCanDismissDialog.dismiss();
            mCanDismissDialog = null;
        }
        if ((mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL || mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_ENDED) && mApp.otaUtils != null)
            mApp.otaUtils.dismissAllOtaDialogs();
        if (mPausePromptDialog != null)
        {
            log("- DISMISSING mPausePromptDialog.");
            mPausePromptDialog.dismiss();
            mPausePromptDialog = null;
        }
        if (mSimCollisionDialog != null)
        {
            mSimCollisionDialog.dismiss();
            mSimCollisionDialog = null;
        }
        if (mExitingECMDialog != null)
        {
            log("- DISMISSING mExitingECMDialog.");
            mExitingECMDialog.dismiss();
            mExitingECMDialog = null;
        }
        log("dismissDialogs() done");
    }

    private void dismissProgressIndication()
    {
        log("dismissProgressIndication()...");
        if (mProgressDialog != null)
        {
            mProgressDialog.dismiss();
            mProgressDialog = null;
        }
    }

    private void dontAddVoiceMailNumber()
    {
        if (mMissingVoicemailDialog != null)
        {
            mMissingVoicemailDialog.dismiss();
            mMissingVoicemailDialog = null;
        }
        log("dontAddVoiceMailNumber: finishing InCallScreen...");
        endInCallScreenSession();
    }

    private void dumpBluetoothState()
    {
        log("============== dumpBluetoothState() =============");
        log((new StringBuilder()).append("= isBluetoothAvailable: ").append(isBluetoothAvailable()).toString());
        log((new StringBuilder()).append("= isBluetoothAudioConnected: ").append(isBluetoothAudioConnected()).toString());
        log((new StringBuilder()).append("= isBluetoothAudioConnectedOrPending: ").append(isBluetoothAudioConnectedOrPending()).toString());
        log((new StringBuilder()).append("= PhoneGlobals.showBluetoothIndication: ").append(mApp.showBluetoothIndication()).toString());
        log("=");
        if (mBluetoothAdapter != null)
        {
            if (mBluetoothHeadset != null)
            {
                List list = mBluetoothHeadset.getConnectedDevices();
                if (list.size() > 0)
                {
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)list.get(0);
                    log((new StringBuilder()).append("= BluetoothHeadset.getCurrentDevice: ").append(bluetoothdevice).toString());
                    log((new StringBuilder()).append("= BluetoothHeadset.State: ").append(mBluetoothHeadset.getConnectionState(bluetoothdevice)).toString());
                    log((new StringBuilder()).append("= BluetoothHeadset audio connected: ").append(mBluetoothHeadset.isAudioConnected(bluetoothdevice)).toString());
                }
                return;
            } else
            {
                log("= mBluetoothHeadset is null");
                return;
            }
        } else
        {
            log("= mBluetoothAdapter is null; device is not BT capable");
            return;
        }
    }

    private void endInCallScreenSession(boolean flag)
    {
        log((new StringBuilder()).append("endInCallScreenSession(").append(flag).append(")...  phone state = ").append(mCM.getState()).toString());
        handleRecordProc();
        if (flag)
        {
            Log.i("InCallScreen", "endInCallScreenSession(): FORCING a call to super.finish()!");
            super.finish();
        } else
        {
            moveTaskToBack(true);
        }
        setInCallScreenMode(InCallUiState.InCallScreenMode.UNDEFINED);
    }

    private void finishIfNecessory()
    {
label0:
        {
            String s = SystemProperties.get("gsm.sim.state");
            if (!s.equals("PIN_REQUIRED") && !s.equals("PUK_REQUIRED"))
            {
                Iterator iterator = ((ActivityManager)getApplicationContext().getSystemService("activity")).getRunningTasks(5).iterator();
                android.app.ActivityManager.RunningTaskInfo runningtaskinfo;
                do
                {
                    if (!iterator.hasNext())
                        break label0;
                    runningtaskinfo = (android.app.ActivityManager.RunningTaskInfo)iterator.next();
                    log((new StringBuilder()).append("info.baseActivity.getPackageName() ").append(runningtaskinfo.baseActivity.getPackageName()).toString());
                } while (runningtaskinfo == null || !runningtaskinfo.baseActivity.getPackageName().equals("com.mediatek.oobe"));
                super.finish();
                return;
            }
            log("PIN or PUK Locked, need finish InCallScreen.");
            super.finish();
        }
    }

    private String getSuppServiceMOStringId(SuppServiceNotification suppservicenotification)
    {
        switch (suppservicenotification.code)
        {
        case 8: // '\b'
            return getResources().getString(0x7f0d0101);

        case 7: // '\007'
            return getResources().getString(0x7f0d0100);

        case 6: // '\006'
            return getResources().getString(0x7f0d00ff);

        case 5: // '\005'
            return getResources().getString(0x7f0d00fe);

        case 4: // '\004'
            String s = getResources().getString(0x7f0d00fd);
            return (new StringBuilder()).append(s).append(" ").append(suppservicenotification.index).toString();

        case 3: // '\003'
            return getResources().getString(0x7f0d00fc);

        case 2: // '\002'
            return getResources().getString(0x7f0d00fb);

        case 1: // '\001'
            return getResources().getString(0x7f0d00fa);

        case 0: // '\0'
            return getResources().getString(0x7f0d00f9);
        }
        return getResources().getString(0x7f0d02da);
    }

    private String getSuppServiceMTStringId(SuppServiceNotification suppservicenotification)
    {
        switch (suppservicenotification.code)
        {
        case 16: // '\020'
            return (new StringBuilder()).append(getResources().getString(0x7f0d0102)).append("(").append(getResources().getString(0x7f0d0112)).append(")").toString();

        case 15: // '\017'
            return (new StringBuilder()).append(getResources().getString(0x7f0d0102)).append("(").append(getResources().getString(0x7f0d0111)).append(")").toString();

        case 14: // '\016'
            return (new StringBuilder()).append(getResources().getString(0x7f0d0102)).append("(").append(getResources().getString(0x7f0d0110)).append(")").toString();

        case 13: // '\r'
            return (new StringBuilder()).append(getResources().getString(0x7f0d0102)).append("(").append(getResources().getString(0x7f0d010f)).append(")").toString();

        case 12: // '\f'
            return (new StringBuilder()).append(getResources().getString(0x7f0d0102)).append("(").append(getResources().getString(0x7f0d010e)).append(")").toString();

        case 11: // '\013'
            return (new StringBuilder()).append(getResources().getString(0x7f0d0102)).append("(").append(getResources().getString(0x7f0d010d)).append(")").toString();

        case 10: // '\n'
            return getResources().getString(0x7f0d010c);

        case 9: // '\t'
            return getResources().getString(0x7f0d010b);

        case 8: // '\b'
            return getResources().getString(0x7f0d010a);

        case 7: // '\007'
            return getResources().getString(0x7f0d0109);

        case 6: // '\006'
            return getResources().getString(0x7f0d0108);

        case 5: // '\005'
            return getResources().getString(0x7f0d0107);

        case 4: // '\004'
            return getResources().getString(0x7f0d0106);

        case 3: // '\003'
            return getResources().getString(0x7f0d0105);

        case 2: // '\002'
            return getResources().getString(0x7f0d0104);

        case 1: // '\001'
            String s = getResources().getString(0x7f0d0103);
            return (new StringBuilder()).append(s).append(" ").append(suppservicenotification.index).toString();

        case 0: // '\0'
            return getResources().getString(0x7f0d0102);
        }
        return getResources().getString(0x7f0d02da);
    }

    public static boolean getmLocaleChangedOnlyForTest()
    {
        return mLocaleChanged;
    }

    private boolean handleCallKey()
    {
        boolean flag = true;
        boolean flag1 = mCM.hasActiveRingingCall();
        boolean flag2 = mCM.hasActiveFgCall();
        boolean flag3 = mCM.hasActiveBgCall();
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null && mDualTalk.isCdmaAndGsmActive())
        {
            flag = handleCallKeyForDualTalk();
        } else
        {
            int i = 1;
            if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null)
            {
                Phone phone = mDualTalk.getFirstPhone();
                if (phone != null)
                    i = phone.getPhoneType();
            } else
            {
                i = mPhone.getPhoneType();
            }
            if (i == 2)
            {
                CdmaPhoneCallState.PhoneCallState phonecallstate = mApp.cdmaPhoneCallState.getCurrentCallState();
                if (flag1)
                {
                    log("answerCall: First Incoming and Call Waiting scenario");
                    internalAnswerCall();
                    return flag;
                }
                if (phonecallstate == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE && flag2)
                {
                    log("answerCall: Merge 3-way call scenario");
                    PhoneUtils.mergeCalls(mCM);
                    return flag;
                }
                if (phonecallstate == CdmaPhoneCallState.PhoneCallState.CONF_CALL)
                {
                    log("answerCall: Switch btwn 2 calls scenario");
                    internalSwapCalls();
                    return flag;
                }
                if (phonecallstate == CdmaPhoneCallState.PhoneCallState.SINGLE_ACTIVE && flag2)
                {
                    log("handleCallKey: hold/unhold cdma case.");
                    internalSwapCalls();
                    return flag;
                }
            } else
            {
                if (i != flag && i != 3)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                if (flag1)
                {
                    Log.w("InCallScreen", "handleCallKey: incoming call is ringing! (PhoneWindowManager should have handled this key.)");
                    internalAnswerCall();
                    return flag;
                }
                if (flag2 && flag3)
                {
                    log("handleCallKey: both lines in use ");
                    if (mCM.hasActiveFgCall())
                    {
                        log("handleCallKey: ==> swap calls.");
                        internalSwapCalls();
                        return flag;
                    }
                } else
                {
                    if (flag3)
                    {
                        log("handleCallKey: call on hold ==> unhold.");
                        PhoneUtils.switchHoldingAndActive(mCM.getFirstActiveBgCall());
                        return flag;
                    }
                    log("handleCallKey: call in foregound ==> ignoring.");
                    log((new StringBuilder()).append("handleCallKey: ignoreThisCallKey = ").append(false).toString());
                    if (true)
                    {
                        PhoneUtils.switchHoldingAndActive(mCM.getFirstActiveBgCall());
                        return flag;
                    }
                }
            }
        }
        return flag;
    }

    private boolean handleCallKeyForDualTalk()
    {
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING)
            log("handleCallKeyForDualTalk: rev call-key when ringing!");
        return false;
    }

    private boolean handleDialerKeyDown(int i, KeyEvent keyevent)
    {
        log((new StringBuilder()).append("handleDialerKeyDown: keyCode ").append(i).append(", event ").append(keyevent).append("...").toString());
        if (okToDialDTMFTones())
            return mDialer.onDialerKeyDown(keyevent);
        else
            return false;
    }

    private void handleMissingVoiceMailNumber()
    {
        log("handleMissingVoiceMailNumber");
        final Message msg = Message.obtain(mHandler);
        msg.what = 107;
        final Message msg2 = Message.obtain(mHandler);
        msg2.what = 106;
        mMissingVoicemailDialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0d01a2).setMessage(0x7f0d01a3).setPositiveButton(0x7f0d0192, new android.content.DialogInterface.OnClickListener() {

            final InCallScreen this$0;
            final Message val$msg;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                log("Missing voicemail AlertDialog: POSITIVE click...");
                msg.sendToTarget();
                mApp.pokeUserActivity();
            }

            
            {
                this$0 = InCallScreen.this;
                msg = message;
                super();
            }
        }
).setNegativeButton(0x7f0d01a4, new android.content.DialogInterface.OnClickListener() {

            final InCallScreen this$0;
            final Message val$msg2;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                log("Missing voicemail AlertDialog: NEGATIVE click...");
                msg2.sendToTarget();
                mApp.pokeUserActivity();
            }

            
            {
                this$0 = InCallScreen.this;
                msg2 = message;
                super();
            }
        }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

            final InCallScreen this$0;
            final Message val$msg;

            public void onCancel(DialogInterface dialoginterface)
            {
                log("Missing voicemail AlertDialog: CANCEL handler...");
                msg.sendToTarget();
                mApp.pokeUserActivity();
            }

            
            {
                this$0 = InCallScreen.this;
                msg = message;
                super();
            }
        }
).create();
        mMissingVoicemailDialog.getWindow().addFlags(2);
        mMissingVoicemailDialog.setOnShowListener(this);
        mMissingVoicemailDialog.show();
    }

    private void handlePostOnDialChars(AsyncResult asyncresult, char c)
    {
        Connection connection = (Connection)asyncresult.result;
        if (connection != null)
        {
            com.android.internal.telephony.Connection.PostDialState postdialstate = (com.android.internal.telephony.Connection.PostDialState)asyncresult.userObj;
            log((new StringBuilder()).append("handlePostOnDialChar: state = ").append(postdialstate).append(", ch = ").append(c).toString());
            static class _cls33
            {

                static final int $SwitchMap$com$android$internal$telephony$Call$State[];
                static final int $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[];
                static final int $SwitchMap$com$android$internal$telephony$Connection$PostDialState[];
                static final int $SwitchMap$com$android$internal$telephony$Phone$SuppService[];
                static final int $SwitchMap$com$android$phone$Constants$CallStatusCode[];
                static final int $SwitchMap$com$android$phone$InCallScreen$InCallAudioMode[];
                static final int $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode[];
                static final int $SwitchMap$com$android$phone$InCallUiState$ProgressIndicationType[];

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
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DISCONNECTING.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.IDLE.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.HOLDING.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror3) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DIALING.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror4) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.ALERTING.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror5) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.INCOMING.ordinal()] = 7;
                    }
                    catch (NoSuchFieldError nosuchfielderror6) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.WAITING.ordinal()] = 8;
                    }
                    catch (NoSuchFieldError nosuchfielderror7) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Call$State[com.android.internal.telephony.Call.State.DISCONNECTED.ordinal()] = 9;
                    }
                    catch (NoSuchFieldError nosuchfielderror8) { }
                    $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode = new int[InCallUiState.InCallScreenMode.values().length];
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode[InCallUiState.InCallScreenMode.MANAGE_CONFERENCE.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror9) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode[InCallUiState.InCallScreenMode.CALL_ENDED.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror10) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode[InCallUiState.InCallScreenMode.NORMAL.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror11) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode[InCallUiState.InCallScreenMode.OTA_NORMAL.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror12) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode[InCallUiState.InCallScreenMode.OTA_ENDED.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror13) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$InCallScreenMode[InCallUiState.InCallScreenMode.UNDEFINED.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror14) { }
                    $SwitchMap$com$android$phone$InCallUiState$ProgressIndicationType = new int[InCallUiState.ProgressIndicationType.values().length];
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$ProgressIndicationType[InCallUiState.ProgressIndicationType.NONE.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror15) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$ProgressIndicationType[InCallUiState.ProgressIndicationType.TURNING_ON_RADIO.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror16) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallUiState$ProgressIndicationType[InCallUiState.ProgressIndicationType.RETRYING.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror17) { }
                    $SwitchMap$com$android$phone$Constants$CallStatusCode = new int[Constants.CallStatusCode.values().length];
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.SUCCESS.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror18) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.POWER_OFF.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror19) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.EMERGENCY_ONLY.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror20) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.OUT_OF_SERVICE.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror21) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.NO_PHONE_NUMBER_SUPPLIED.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror22) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.DIALED_MMI.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror23) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.CALL_FAILED.ordinal()] = 7;
                    }
                    catch (NoSuchFieldError nosuchfielderror24) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.VOICEMAIL_NUMBER_MISSING.ordinal()] = 8;
                    }
                    catch (NoSuchFieldError nosuchfielderror25) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.CDMA_CALL_LOST.ordinal()] = 9;
                    }
                    catch (NoSuchFieldError nosuchfielderror26) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.EXITED_ECM.ordinal()] = 10;
                    }
                    catch (NoSuchFieldError nosuchfielderror27) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.OUT_OF_3G_FAILED.ordinal()] = 11;
                    }
                    catch (NoSuchFieldError nosuchfielderror28) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.FDN_BLOCKED.ordinal()] = 12;
                    }
                    catch (NoSuchFieldError nosuchfielderror29) { }
                    try
                    {
                        $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.DROP_VOICECALL.ordinal()] = 13;
                    }
                    catch (NoSuchFieldError nosuchfielderror30) { }
                    $SwitchMap$com$android$phone$InCallScreen$InCallAudioMode = new int[InCallAudioMode.values().length];
                    try
                    {
                        $SwitchMap$com$android$phone$InCallScreen$InCallAudioMode[InCallAudioMode.SPEAKER.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror31) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallScreen$InCallAudioMode[InCallAudioMode.BLUETOOTH.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror32) { }
                    try
                    {
                        $SwitchMap$com$android$phone$InCallScreen$InCallAudioMode[InCallAudioMode.EARPIECE.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror33) { }
                    $SwitchMap$com$android$internal$telephony$Connection$PostDialState = new int[com.android.internal.telephony.Connection.PostDialState.values().length];
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$PostDialState[com.android.internal.telephony.Connection.PostDialState.STARTED.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror34) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$PostDialState[com.android.internal.telephony.Connection.PostDialState.WAIT.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror35) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$PostDialState[com.android.internal.telephony.Connection.PostDialState.WILD.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror36) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$PostDialState[com.android.internal.telephony.Connection.PostDialState.COMPLETE.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror37) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$PostDialState[com.android.internal.telephony.Connection.PostDialState.PAUSE.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror38) { }
                    $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause = new int[com.android.internal.telephony.Connection.DisconnectCause.values().length];
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.LOCAL.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror39) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.NORMAL.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror40) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Connection$DisconnectCause[com.android.internal.telephony.Connection.DisconnectCause.INCOMING_REJECTED.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror41) { }
                    $SwitchMap$com$android$internal$telephony$Phone$SuppService = new int[com.android.internal.telephony.Phone.SuppService.values().length];
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Phone$SuppService[com.android.internal.telephony.Phone.SuppService.SWITCH.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror42) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Phone$SuppService[com.android.internal.telephony.Phone.SuppService.SEPARATE.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror43) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Phone$SuppService[com.android.internal.telephony.Phone.SuppService.TRANSFER.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror44) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Phone$SuppService[com.android.internal.telephony.Phone.SuppService.CONFERENCE.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror45) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Phone$SuppService[com.android.internal.telephony.Phone.SuppService.REJECT.ordinal()] = 5;
                    }
                    catch (NoSuchFieldError nosuchfielderror46) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Phone$SuppService[com.android.internal.telephony.Phone.SuppService.HANGUP.ordinal()] = 6;
                    }
                    catch (NoSuchFieldError nosuchfielderror47) { }
                    try
                    {
                        $SwitchMap$com$android$internal$telephony$Phone$SuppService[com.android.internal.telephony.Phone.SuppService.UNKNOWN.ordinal()] = 7;
                    }
                    catch (NoSuchFieldError nosuchfielderror48)
                    {
                        return;
                    }
                }
            }

            switch (_cls33..SwitchMap.com.android.internal.telephony.Connection.PostDialState[postdialstate.ordinal()])
            {
            case 5: // '\005'
                mDialer.stopLocalToneIfNeeded();
                mPostDialStrAfterPause = connection.getRemainingPostDialString();
                mPauseInProgress = true;
                return;

            case 4: // '\004'
                mDialer.stopLocalToneIfNeeded();
                return;

            case 3: // '\003'
                log("handlePostOnDialChars: show WILD prompt");
                mDialer.stopLocalToneIfNeeded();
                showWildPromptDialog(connection);
                return;

            case 2: // '\002'
                log("handlePostOnDialChars: show WAIT prompt...");
                mDialer.stopLocalToneIfNeeded();
                showWaitPromptDialog(connection, connection.getRemainingPostDialString());
                return;

            case 1: // '\001'
                mDialer.stopLocalToneIfNeeded();
                if (mPauseInProgress)
                    showPausePromptDialog(connection, mPostDialStrAfterPause);
                mPauseInProgress = false;
                mDialer.startLocalToneIfNeeded(c);
                return;
            }
        }
    }

    private void handleRecordProc()
    {
        PhoneRecorder phonerecorder = PhoneRecorder.getInstance(getApplicationContext());
        if (prevPhonenums != null && prevPhonenums.size() != 0)
        {
            if (phonerecorder.ismFlagRecord())
            {
                boolean flag;
                if (!comparePhoneNumbers())
                    flag = true;
                else
                    flag = false;
                if (flag)
                    if (PhoneRecorderHandler.getInstance().getCustomValue() == 0)
                    {
                        if (PhoneRecorder.isRecording())
                            stopRecord();
                    } else
                    if (1 == PhoneRecorderHandler.getInstance().getCustomValue())
                        mVTInCallScreen.stopRecord();
            }
            updatePrevPhonenums();
            requestUpdateRecordState(PhoneRecorderHandler.getInstance().getPhoneRecorderState(), PhoneRecorderHandler.getInstance().getCustomValue());
            return;
        }
        log((new StringBuilder()).append("the record custom value is ").append(PhoneRecorderHandler.getInstance().getCustomValue()).toString());
        if (PhoneRecorderHandler.getInstance().getCustomValue() == 0)
        {
            if (PhoneRecorder.isRecording())
                stopRecord();
        } else
        if (1 == PhoneRecorderHandler.getInstance().getCustomValue())
            mVTInCallScreen.stopRecord();
        updatePrevPhonenums();
    }

    private void handleSwapCdmaAndGsm()
    {
        Call call;
        Call call1;
        int i;
        call = mDualTalk.getActiveFgCall();
        call1 = mDualTalk.getFirstActiveBgCall();
        i = call.getPhone().getPhoneType();
        int j = call1.getPhone().getPhoneType();
        log((new StringBuilder()).append("handleSwapCdmaAndGsm fgCall = ").append(call.getConnections()).toString());
        log((new StringBuilder()).append("handleSwapCdmaAndGsm bgCall = ").append(call1.getConnections()).toString());
        if (i != 1 || j != 1)
            break MISSING_BLOCK_LABEL_131;
        log("handleSwapCdmaAndGsm: switch between two GSM calls.");
        call.getPhone().switchHoldingAndActive();
_L1:
        return;
        Exception exception4;
        exception4;
        log(exception4.toString());
        return;
        if (i == 2)
        {
            if (PhoneUtils.hasMultipleConnections(call))
            {
                log("handleSwapCdmaAndGsm: cdma has multiple calls and in foreground, only switch the audio.");
                try
                {
                    call1.getPhone().switchHoldingAndActive();
                    return;
                }
                catch (Exception exception3)
                {
                    log(exception3.toString());
                }
                return;
            }
            log("handleSwapCdmaAndGsm: cdma has single call and in foreground, switch by phone");
            try
            {
                call.getPhone().switchHoldingAndActive();
                call1.getPhone().switchHoldingAndActive();
                return;
            }
            catch (Exception exception2)
            {
                log(exception2.toString());
            }
            return;
        }
        if (i == 1)
        {
            if (PhoneUtils.hasMultipleConnections(call1))
            {
                log("handleSwapCdmaAndGsm: cdma has multiple calls and in background, only switch the audio");
                try
                {
                    call.getPhone().switchHoldingAndActive();
                    return;
                }
                catch (Exception exception1)
                {
                    log(exception1.toString());
                }
                return;
            }
            log("handleSwapCdmaAndGsm: cdma has single call and in background, switch by phone");
            try
            {
                call.getPhone().switchHoldingAndActive();
                call1.getPhone().switchHoldingAndActive();
                return;
            }
            catch (Exception exception)
            {
                log(exception.toString());
            }
            return;
        }
          goto _L1
    }

    private void initInCallScreen()
    {
        log("initInCallScreen()...");
        getWindow().addFlags(32768);
        mCallTime = new CallTime(this);
        mCallCard = (CallCard)findViewById(0x7f08006e);
        log((new StringBuilder()).append("  - mCallCard = ").append(mCallCard).toString());
        mSecCallInfo = (ViewStub)findViewById(0x7f08000f);
        mCallCard.setInCallScreenInstance(this);
        mVoiceRecorderIcon = (ImageView)findViewById(0x7f0800f3);
        mVoiceRecorderIcon.setBackgroundResource(0x7f0200b2);
        mVoiceRecorderIcon.setVisibility(4);
        initInCallTouchUi();
        mInCallControlState = new InCallControlState(this, mCM);
        mInCallMenuState = new InCallMenuState(this, mCM);
        mManageConferenceUtils = new ManageConferenceUtils(this, mCM);
        mDialer = new DTMFTwelveKeyDialer(this, (ViewStub)findViewById(0x7f080073));
        mPowerManager = (PowerManager)getSystemService("power");
        mVTInCallScreen = new VTInCallScreenProxy(this, mDialer);
    }

    private void initInCallTouchUi()
    {
        log("initInCallTouchUi()...");
        mInCallTouchUi = (InCallTouchUi)findViewById(0x7f08006f);
        mInCallTouchUi.setInCallScreenInstance(this);
        mRespondViaSmsManager = new RespondViaSmsManager();
        mRespondViaSmsManager.setInCallScreenInstance(this);
    }

    private void initPolicyManager()
    {
        delayTime_disableTouch = Boolean.valueOf(getResources().getBoolean(0x7f0a000f));
        lock_screen_time = getResources().getInteger(0x7f0b0006);
        if (delayTime_disableTouch.booleanValue())
        {
            policyManager = (DevicePolicyManager)getSystemService("device_policy");
            componentName = new ComponentName(this, com/android/phone/AdminReceiver);
        }
    }

    private void initVTAutoAnswer()
    {
    }

    private void internalAnswerAndEnd()
    {
        log("internalAnswerAndEnd()...");
        PhoneUtils.dumpCallManager();
        PhoneUtils.answerAndEndActive(mCM, mCM.getFirstActiveRingingCall());
    }

    private void internalHangup()
    {
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        log((new StringBuilder()).append("internalHangup()...  phone state = ").append(state).toString());
        PhoneUtils.hangup(mCM);
        if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            Log.w("InCallScreen", "internalHangup(): phone is already IDLE!");
            if (mCallCard.getVisibility() == 4 || mCallCard.getVisibility() == 8)
            {
                endInCallScreenSession();
                Log.w("InCallScreen", "internalHangup(): phone is already IDLE, end ourself!");
            }
        }
    }

    private void internalResolveIntent(Intent intent)
    {
        String s;
label0:
        {
            if (intent != null && intent.getAction() != null)
            {
                s = intent.getAction();
                log((new StringBuilder()).append("internalResolveIntent: action=").append(s).toString());
                if (s.equals("android.intent.action.MAIN"))
                {
                    if (intent.hasExtra("com.android.phone.ShowDialpad"))
                    {
                        boolean flag = intent.getBooleanExtra("com.android.phone.ShowDialpad", false);
                        log((new StringBuilder()).append("- internalResolveIntent: SHOW_DIALPAD_EXTRA: ").append(flag).toString());
                        mApp.inCallUiState.showDialpad = flag;
                        boolean flag1 = mCM.hasActiveFgCall();
                        boolean flag2 = mCM.hasActiveBgCall();
                        if (flag && !flag1 && flag2)
                            PhoneUtils.switchHoldingAndActive(mCM.getFirstActiveBgCall());
                    }
                    if (intent.getBooleanExtra("isForPlaceCall", false))
                    {
                        mCallCard.hideCallStates(mCM);
                        return;
                    }
                } else
                {
                    if (s.equals("android.intent.action.ANSWER"))
                    {
                        internalAnswerCall();
                        mApp.setRestoreMuteOnInCallResume(false);
                        return;
                    }
                    if (!s.equals("com.android.phone.DISPLAY_ACTIVATION_SCREEN"))
                        break label0;
                    if (!TelephonyCapabilities.supportsOtasp(mPhone))
                        throw new IllegalStateException((new StringBuilder()).append("Received ACTION_DISPLAY_ACTIVATION_SCREEN intent on non-OTASP-capable device: ").append(intent).toString());
                    setInCallScreenMode(InCallUiState.InCallScreenMode.OTA_NORMAL);
                    if (mApp.cdmaOtaProvisionData != null && !mApp.cdmaOtaProvisionData.isOtaCallIntentProcessed)
                    {
                        mApp.cdmaOtaProvisionData.isOtaCallIntentProcessed = true;
                        mApp.cdmaOtaScreenState.otaScreenState = OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION;
                        return;
                    }
                }
            }
            return;
        }
        if (s.equals("com.android.phone.PERFORM_CDMA_PROVISIONING"))
            throw new IllegalStateException((new StringBuilder()).append("Unexpected ACTION_PERFORM_CDMA_PROVISIONING received by InCallScreen: ").append(intent).toString());
        if (!s.equals("android.intent.action.CALL") && !s.equals("android.intent.action.CALL_EMERGENCY"))
        {
            if (s.equals("com.android.phone.InCallScreen.UNDEFINED"))
            {
                Log.wtf("InCallScreen", "internalResolveIntent: got launched with ACTION_UNDEFINED");
                return;
            } else
            {
                Log.wtf("InCallScreen", (new StringBuilder()).append("internalResolveIntent: unexpected intent action: ").append(s).toString());
                return;
            }
        } else
        {
            throw new IllegalStateException((new StringBuilder()).append("Unexpected CALL action received by InCallScreen: ").append(intent).toString());
        }
    }

    private void internalRespondViaSms()
    {
        log("internalRespondViaSms()...");
        PhoneUtils.dumpCallManager();
        Call call;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.hasMultipleRingingCall())
            call = mDualTalk.getFirstActiveRingingCall();
        else
            call = mCM.getFirstActiveRingingCall();
        mRespondViaSmsManager.showRespondViaSmsPopup(call);
        internalSilenceRinger();
    }

    private void internalSilenceRinger()
    {
        mSwappingCalls = false;
        log("internalSilenceRinger()...");
        CallNotifier callnotifier = mApp.notifier;
        if (callnotifier.isRinging())
            callnotifier.silenceRinger();
    }

    private void internalSwapCalls()
    {
        log("internalSwapCalls()...");
        mSwappingCalls = true;
        closeDialpadInternal(true);
        mDialer.clearDigits();
        IBluetoothHeadsetPhone ibluetoothheadsetphone;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isCdmaAndGsmActive())
            handleSwapCdmaAndGsm();
        else
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.hasDualHoldCallsOnly())
        {
            Call call = mDualTalk.getSecondActiveBgCall();
            try
            {
                call.getPhone().switchHoldingAndActive();
            }
            catch (CallStateException callstateexception1)
            {
                log((new StringBuilder()).append("internalSwapCalls exception = ").append(callstateexception1).toString());
            }
        } else
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isDualTalkMultipleHoldCase())
        {
            Phone phone = mDualTalk.getActiveFgCall().getPhone();
            if (phone.getBackgroundCall().getState().isAlive())
            {
                log("Cal foreground phone's switchHoldingAndActive");
                try
                {
                    phone.switchHoldingAndActive();
                }
                catch (CallStateException callstateexception)
                {
                    log(callstateexception.toString());
                }
            } else
            {
                log("PhoneUtils.switchHoldingAndActive");
                PhoneUtils.switchHoldingAndActive(mDualTalk.getFirstActiveBgCall());
            }
        } else
        {
            PhoneUtils.switchHoldingAndActive(mCM.getFirstActiveBgCall());
        }
        if (mCM.getBgPhone().getPhoneType() != 2)
            break MISSING_BLOCK_LABEL_78;
        ibluetoothheadsetphone = mApp.getBluetoothPhoneService();
        if (ibluetoothheadsetphone == null)
            break MISSING_BLOCK_LABEL_78;
        ibluetoothheadsetphone.cdmaSwapSecondCallState();
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("InCallScreen", Log.getStackTraceString(new Throwable()));
        return;
    }

    private void lockscreen()
    {
        Log.d("lockNow", (new StringBuilder()).append("mDialer.isOpened() --> ").append(mDialer.isOpened()).append(" lock_screen_time ").append(lock_screen_time).toString());
        if (!mDialer.isOpened())
        {
            Log.d("lockNow", "run lock now");
            if (isVTInCallScreenOn())
            {
                restartLockScreenTimer();
                Log.d("lockNow----lijian---111----", (new StringBuilder()).append("mDialer.isOpened() --> ").append(mDialer.isOpened()).append(" lock_screen_time ").append(lock_screen_time).toString());
            } else
            {
                Log.d("lockNow-----lijian---222222--", (new StringBuilder()).append("mDialer.isOpened() --> ").append(mDialer.isOpened()).append(" lock_screen_time ").append(lock_screen_time).toString());
                boolean flag = policyManager.isAdminActive(componentName);
                if (!flag)
                {
                    policyManager.setActiveAdmin(componentName, false);
                    policyManager.lockNow();
                }
                if (flag)
                {
                    policyManager.lockNow();
                    return;
                }
            }
        }
    }

    private void log(String s)
    {
        Log.d("InCallScreen", s);
    }

    private void muteIncomingCall(boolean flag)
    {
        Ringer ringer = PhoneGlobals.getInstance().ringer;
        if (flag && ringer.isRinging())
            ringer.stopRing();
        ringer.setMute(flag);
    }

    private boolean okToRecordVoice()
    {
        com.android.internal.telephony.Call.State state = mCM.getFirstActiveRingingCall().getState();
        com.android.internal.telephony.Call.State state1 = com.android.internal.telephony.Call.State.IDLE;
        boolean flag = false;
        if (state == state1)
        {
            log((new StringBuilder()).append("fgCall state:").append(mCM.getActiveFgCall().getState()).toString());
            log((new StringBuilder()).append("phoneType").append(mCM.getFgPhone().getPhoneType()).toString());
            com.android.internal.telephony.Call.State state2 = mCM.getActiveFgCall().getState();
            com.android.internal.telephony.Call.State state3 = com.android.internal.telephony.Call.State.ACTIVE;
            flag = false;
            if (state2 == state3)
            {
                int i = mCM.getFgPhone().getPhoneType();
                flag = false;
                if (i != 3)
                    flag = true;
            }
        }
        return flag;
    }

    private void onAddCallClick()
    {
        PhoneUtils.startNewCall(mCM);
    }

    private void onDisconnect(AsyncResult asyncresult, int i)
    {
label0:
        {
label1:
            {
label2:
                {
                    Connection connection;
                    com.android.internal.telephony.Connection.DisconnectCause disconnectcause;
                    boolean flag;
                    Call call;
label3:
                    {
                        log("onDisconnect: start...");
                        mSwappingCalls = false;
                        mCM.getState();
                        connection = (Connection)asyncresult.result;
                        disconnectcause = connection.getDisconnectCause();
                        log((new StringBuilder()).append("onDisconnect: connection '").append(connection).append("', cause = ").append(disconnectcause).append(", showing screen: ").append(mApp.isShowingCallScreen()).toString());
                        if (mCallSelectDialog != null && mCallSelectDialog.isShowing())
                        {
                            mCallSelectDialog.dismiss();
                            mCallSelectDialog = null;
                        }
                        if (mExtension.onDisconnect(connection))
                            break label2;
                        if (!phoneIsInUse())
                            flag = true;
                        else
                            flag = false;
                        boolean flag1;
                        if (mPhone.getPhoneType() == 2)
                            flag1 = true;
                        else
                            flag1 = false;
                        int j = 0;
                        if (flag1)
                        {
                            j = 0;
                            if (flag)
                                j = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "call_auto_retry", 0);
                        }
                        if (mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL && mApp.cdmaOtaProvisionData != null && !mApp.cdmaOtaProvisionData.inOtaSpcState)
                        {
                            setInCallScreenMode(InCallUiState.InCallScreenMode.OTA_ENDED);
                            updateScreen();
                            return;
                        }
                        if (mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_ENDED || mApp.cdmaOtaProvisionData != null && mApp.cdmaOtaProvisionData.inOtaSpcState)
                            break label0;
                        mDialer.clearDigits();
                        if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.CALL_BARRED)
                        {
                            showGenericErrorDialog(0x7f0d0189, false);
                            return;
                        }
                        if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.FDN_BLOCKED && Constants.CallStatusCode.FDN_BLOCKED == mApp.inCallUiState.getPendingCallStatusCode())
                        {
                            showGenericErrorDialog(0x7f0d0188, false);
                            return;
                        }
                        if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.CS_RESTRICTED)
                        {
                            showGenericErrorDialog(0x7f0d018a, false);
                            return;
                        }
                        if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.CS_RESTRICTED_EMERGENCY)
                        {
                            showGenericErrorDialog(0x7f0d018b, false);
                            return;
                        }
                        if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.CS_RESTRICTED_NORMAL)
                        {
                            showGenericErrorDialog(0x7f0d018c, false);
                            return;
                        }
                        if (flag1)
                        {
                            com.android.internal.telephony.Call.State state = mApp.notifier.getPreviousCdmaCallState();
                            if (state == com.android.internal.telephony.Call.State.ACTIVE && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.INCOMING_MISSED && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.NORMAL && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.LOCAL && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.INCOMING_REJECTED)
                                showCallLostDialog();
                            else
                            if ((state == com.android.internal.telephony.Call.State.DIALING || state == com.android.internal.telephony.Call.State.ALERTING) && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.INCOMING_MISSED && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.NORMAL && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.LOCAL && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.INCOMING_REJECTED)
                                if (mApp.inCallUiState.needToShowCallLostDialog)
                                {
                                    showCallLostDialog();
                                    mApp.inCallUiState.needToShowCallLostDialog = false;
                                } else
                                if (j == 0)
                                {
                                    showCallLostDialog();
                                    mApp.inCallUiState.needToShowCallLostDialog = false;
                                } else
                                {
                                    mApp.inCallUiState.needToShowCallLostDialog = true;
                                }
                        }
                        call = connection.getCall();
                        if (call == null)
                            break label3;
                        List list = call.getConnections();
                        if (list == null || list.size() <= 1)
                            break label3;
                        Iterator iterator = list.iterator();
                        do
                            if (!iterator.hasNext())
                                break label3;
                        while (((Connection)iterator.next()).getState() != com.android.internal.telephony.Call.State.ACTIVE);
                        log("- Still-active conf call; clearing DISCONNECTED...");
                        mApp.updateWakeState();
                        mCM.clearDisconnected();
                    }
                    boolean flag2;
                    if ((disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.INCOMING_MISSED || disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.INCOMING_REJECTED) && flag)
                        flag2 = true;
                    else
                        flag2 = false;
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.INCOMING_REJECTED && PhoneUtils.getShouldSendToVoiceMailFlag(connection) && (mRingingCall.getState() == com.android.internal.telephony.Call.State.DISCONNECTING || mRingingCall.getState() == com.android.internal.telephony.Call.State.DISCONNECTED || mRingingCall.getState() == com.android.internal.telephony.Call.State.IDLE))
                        break label1;
                    boolean flag3;
                    if (mRespondViaSmsManager != null && mRespondViaSmsManager.isShowingPopup())
                        flag3 = true;
                    else
                        flag3 = false;
                    if (flag2 && flag3)
                    {
                        log("- onDisconnect: Respond-via-SMS dialog is still being displayed...");
                        InCallUiState.sLastInCallScreenStatus = 0;
                        return;
                    }
                    if (flag2)
                    {
                        log("- onDisconnect: bailOutImmediately...");
                        updateInCallTouchUi();
                        int i1 = GeminiUtils.getIndexInArray(i, PHONE_DISCONNECT_GEMINI);
                        log((new StringBuilder()).append("- onDisconnect: bailOutImmediately...index=").append(i1).append(" msg=").append(i).toString());
                        if (i1 != -1)
                        {
                            delayedCleanupAfterDisconnect(DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI[i1]);
                            return;
                        }
                    } else
                    {
                        log("- onDisconnect: delayed bailout...");
                        if (flag && (mCM.hasDisconnectedFgCall() || mCM.hasDisconnectedBgCall()))
                        {
                            log("- onDisconnect: switching to 'Call ended' state...");
                            setInCallScreenMode(InCallUiState.InCallScreenMode.CALL_ENDED);
                        }
                        updateScreen();
                        if (!mCM.hasActiveFgCall())
                        {
                            log("- onDisconnect: cleaning up after FG call disconnect...");
                            if (mWaitPromptDialog != null)
                            {
                                log("- DISMISSING mWaitPromptDialog.");
                                mWaitPromptDialog.dismiss();
                                mWaitPromptDialog = null;
                            }
                            if (mWildPromptDialog != null)
                            {
                                log("- DISMISSING mWildPromptDialog.");
                                mWildPromptDialog.dismiss();
                                mWildPromptDialog = null;
                            }
                            if (mPausePromptDialog != null)
                            {
                                log("- DISMISSING mPausePromptDialog.");
                                mPausePromptDialog.dismiss();
                                mPausePromptDialog = null;
                            }
                        }
                        if (mPhone.getPhoneType() == 2 && !flag)
                        {
                            mCM.clearDisconnected();
                            log("onDisconnect: Call Collision case - staying on InCallScreen.");
                            PhoneUtils.dumpCallState(mPhone);
                            return;
                        }
                        if (flag && !isForegroundActivity() && isForegroundActivityForProximity())
                        {
                            log("Force waking up the screen to let users see \"disconnected\" state");
                            if (call != null)
                                mCallCard.updateElapsedTimeWidget(call);
                            mApp.inCallUiState.showAlreadyDisconnectedState = true;
                            mApp.wakeUpScreen();
                            return;
                        }
                        int k;
                        switch (_cls33..SwitchMap.com.android.internal.telephony.Connection.DisconnectCause[disconnectcause.ordinal()])
                        {
                        case 2: // '\002'
                        case 3: // '\003'
                            k = 2000;
                            break;

                        case 1: // '\001'
                            k = 0;
                            break;

                        default:
                            k = 5000;
                            break;
                        }
                        int l = GeminiUtils.getIndexInArray(i, PHONE_DISCONNECT_GEMINI);
                        log((new StringBuilder()).append("onDisconnect() PHONE_DISCONNECT : index=").append(l).toString());
                        if (l != -1)
                        {
                            mHandler.removeMessages(DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI[l]);
                            mHandler.sendEmptyMessageDelayed(DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI[l], k);
                            return;
                        }
                    }
                }
                return;
            }
            int j1 = GeminiUtils.getIndexInArray(i, PHONE_DISCONNECT_GEMINI);
            delayedCleanupAfterDisconnect(DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI[j1]);
            mRingingCall.getPhone().clearDisconnected();
            return;
        }
        log("onDisconnect: OTA Call end already handled");
    }

    private void onHoldClick()
    {
        boolean flag;
        boolean flag1;
        boolean flag2;
        flag = mCM.hasActiveFgCall();
        flag1 = mCM.hasActiveBgCall();
        if (mDualTalk != null && mDualTalk.hasDualHoldCallsOnly())
            flag2 = true;
        else
            flag2 = false;
        log((new StringBuilder()).append("onHoldClick: hasActiveCall = ").append(flag).append(", hasHoldingCall = ").append(flag1).toString());
        if (!flag || flag1) goto _L2; else goto _L1
_L1:
        PhoneUtils.switchHoldingAndActive(mCM.getFirstActiveBgCall());
_L4:
        closeDialpadInternal(true);
        return;
_L2:
        if (!flag && flag1 && !flag2)
            PhoneUtils.switchHoldingAndActive(mCM.getFirstActiveBgCall());
        else
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null && mDualTalk.isMultiplePhoneActive() && !mDualTalk.hasActiveCdmaPhone())
            if (flag)
            {
                log("onHoldClick: has active call.");
                Call call1 = mDualTalk.getActiveFgCall();
                try
                {
                    call1.getPhone().switchHoldingAndActive();
                }
                catch (CallStateException callstateexception1)
                {
                    log("onHoldClick: CallStateException.");
                }
            } else
            {
                log("onHoldClick: has two background calls");
                Call call = mDualTalk.getFirstActiveBgCall();
                try
                {
                    call.getPhone().switchHoldingAndActive();
                }
                catch (CallStateException callstateexception)
                {
                    log("onHoldClick: CallStateException.");
                }
            }
        if (true) goto _L4; else goto _L3
_L3:
    }

    private void onIncomingRing()
    {
        log("onIncomingRing()...");
        if (mIsForegroundActivity && mInCallTouchUi != null)
            mInCallTouchUi.onIncomingRing();
    }

    private void onMMICancel(int i)
    {
        log("onMMICancel()...");
        PhoneUtils.cancelMmiCodeExt(mPhone, i);
        log("onMMICancel: finishing InCallScreen...");
        dismissAllDialogs();
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            endInCallScreenSession();
        else
            log("Got MMI_COMPLETE, Phone isn't in idle, don't finishing InCallScreen...");
        if (mMmiStartedDialog != null)
        {
            mMmiStartedDialog.dismiss();
            mMmiStartedDialog = null;
            log("Got MMI_COMPLETE, Phone isn't in idle, dismiss the start progress dialog...");
        }
    }

    private void onMMIComplete(MmiCode mmicode)
    {
        int i;
        if (mmicode instanceof GsmMmiCode)
            i = 1;
        else
        if (mmicode instanceof CdmaMmiCode)
            i = 2;
        else
            i = mPhone.getPhoneType();
        if (i == 2)
            PhoneUtils.displayMMIComplete(mPhone, mApp, mmicode, null, null);
        else
        if (i == 1 && mmicode.getState() != com.android.internal.telephony.MmiCode.State.PENDING)
        {
            log("Got MMI_COMPLETE, finishing InCallScreen...");
            if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                endInCallScreenSession();
            else
                log("Got MMI_COMPLETE, Phone isn't in idle, don't finishing InCallScreen...");
            if (mMmiStartedDialog != null)
            {
                mMmiStartedDialog.dismiss();
                mMmiStartedDialog = null;
                log("Got MMI_COMPLETE, Phone isn't in idle, dismiss the start progress dialog...");
                return;
            }
        }
    }

    private void onNewRingingConnection()
    {
        log("onNewRingingConnection()...");
        mRespondViaSmsManager.dismissPopup();
    }

    private void onPhoneStateChanged(AsyncResult asyncresult)
    {
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        log((new StringBuilder()).append("onPhoneStateChanged: current state = ").append(state).toString());
        if (mExtension.onPhoneStateChanged(mCM))
            return;
        if (state != com.android.internal.telephony.PhoneConstants.State.RINGING)
            muteIncomingCall(false);
        enableHomeKeyDispatched(mCM.hasActiveRingingCall());
        restartLockScreenTimer();
        if (!mIsForegroundActivity)
        {
            log("onPhoneStateChanged: Activity not in foreground! Bailing out...");
            return;
        }
        updateLocalCache();
        log((new StringBuilder()).append("fgCall state : ").append(mForegroundCall.getState()).toString());
        log((new StringBuilder()).append("bgCall state : ").append(mBackgroundCall.getState()).toString());
        log((new StringBuilder()).append("ringingCall state : ").append(mRingingCall.getState()).toString());
        if (PhoneUtils.getPhoneSwapStatus() && mForegroundCall.getState() == com.android.internal.telephony.Call.State.ACTIVE && mBackgroundCall.getState() == com.android.internal.telephony.Call.State.HOLDING)
            PhoneUtils.setPhoneSwapStatus(false);
        updateExpandedViewState();
        requestUpdateScreen();
        mApp.updateWakeState();
        log("onPhoneStateChanged() end");
    }

    private void onVTVoiceAnswer()
    {
        log("onVTVoiceAnswer() ! ");
        setInVoiceAnswerVideoCall(true);
        try
        {
            log("onVTVoiceAnswer() : call CallManager.voiceAccept() start ");
            mCM.voiceAccept(mRingingCall);
            log("onVTVoiceAnswer() : call CallManager.voiceAccept() end ");
            return;
        }
        catch (CallStateException callstateexception)
        {
            callstateexception.printStackTrace();
        }
    }

    private void openDialpadInternal(boolean flag)
    {
        mDialer.openDialer(flag);
        mApp.inCallUiState.showDialpad = true;
    }

    private boolean phoneIsInUse()
    {
        return mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE;
    }

    private void registerForPhoneStates()
    {
        int i;
label0:
        {
            if (!mRegisteredForPhoneStates)
            {
                Object obj;
                if (GeminiUtils.isGeminiSupport())
                    obj = mCMGemini;
                else
                    obj = mCM;
                GeminiRegister.registerForPreciseCallStateChanged(obj, mHandler, 101);
                GeminiRegister.registerForDisconnect(obj, mHandler, PHONE_DISCONNECT_GEMINI);
                i = mPhone.getPhoneType();
                if (i == 1)
                {
                    GeminiRegister.registerForMmiComplete(obj, mHandler, PhoneGlobals.MMI_COMPLETE_GEMINI);
                } else
                {
                    if (i != 2)
                        break label0;
                    log("Registering for Call Waiting.");
                    mCM.registerForCallWaiting(mHandler, 115, null);
                }
                GeminiRegister.registerForPostDialCharacter(obj, mHandler, 104);
                GeminiRegister.registerForSuppServiceFailed(obj, mHandler, 110);
                GeminiRegister.registerForIncomingRing(obj, mHandler, 123);
                GeminiRegister.registerForNewRingingConnection(obj, mHandler, 124);
                registerForPhoneStatesMTK(obj);
                mRegisteredForPhoneStates = true;
            }
            return;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
    }

    private void registerForPhoneStatesMTK(Object obj)
    {
        GeminiRegister.registerForCrssSuppServiceNotification(obj, mHandler, 141);
        GeminiRegister.registerForSpeechInfo(obj, mHandler, PhoneUtils.PHONE_SPEECH_INFO_GEMINI);
        GeminiRegister.registerForSuppServiceNotification(obj, mHandler, 140);
    }

    private void selectWhichCallActive(List list)
    {
        ArrayList arraylist = new ArrayList();
        log("+selectWhichCallActive");
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Call call = (Call)iterator.next();
            if (call.getState() == com.android.internal.telephony.Call.State.HOLDING)
                arraylist.add(call);
        } while (true);
        if (mCallSelectDialog == null || !mCallSelectDialog.isShowing())
        {
            android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(this)).setNegativeButton(getResources().getString(0x1040000), (android.content.DialogInterface.OnClickListener)null);
            CallPickerAdapter callpickeradapter = new CallPickerAdapter(this, arraylist);
            if (2 == arraylist.size())
            {
                callpickeradapter.setOperatorName(mCallCard.getOperatorNameByCall((Call)arraylist.get(0)), mCallCard.getOperatorNameByCall((Call)arraylist.get(1)));
                callpickeradapter.setOperatorColor(mCallCard.getOperatorColorByCall((Call)arraylist.get(0)), mCallCard.getOperatorColorByCall((Call)arraylist.get(1)));
                callpickeradapter.setCallerInfoName(mCallCard.getCallInfoName(1), mCallCard.getCallInfoName(2));
                builder.setSingleChoiceItems(callpickeradapter, -1, new android.content.DialogInterface.OnClickListener() {

                    final InCallScreen this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        Call call1 = (Call)((AlertDialog)dialoginterface).getListView().getAdapter().getItem(i);
                        Call call2 = mDualTalk.getFirstActiveBgCall();
                        Call call3 = mDualTalk.getSecondActiveBgCall();
                        if (call1 != null && call2 != null && call3 != null)
                        {
                            Phone phone = call2.getPhone();
                            Phone phone1 = call3.getPhone();
                            log((new StringBuilder()).append("select call at phone :").append(call1.getPhone()).append(" firstPhone ").append(phone).append(" secondPhone ").append(phone1).toString());
                            if (call1.getPhone() == phone)
                            {
                                mLastClickActionTime = SystemClock.uptimeMillis();
                                PhoneUtils.switchHoldingAndActive(call1);
                            } else
                            {
                                handleUnholdAndEnd(mDualTalk.getActiveFgCall());
                            }
                        }
                        dialoginterface.dismiss();
                    }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
                }
).setTitle(getResources().getString(0x7f0d0000));
                mCallSelectDialog = builder.create();
                mCallSelectDialog.show();
            }
        }
        log("-selectWhichCallActive");
    }

    private void setInCallScreenMode(InCallUiState.InCallScreenMode incallscreenmode)
    {
        log((new StringBuilder()).append("setInCallScreenMode: ").append(incallscreenmode).toString());
        mApp.inCallUiState.inCallScreenMode = incallscreenmode;
        switch (_cls33..SwitchMap.com.android.phone.InCallUiState.InCallScreenMode[incallscreenmode.ordinal()])
        {
        case 6: // '\006'
            setIntent(new Intent("com.android.phone.InCallScreen.UNDEFINED"));
            if (mCM.getState() != com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
            {
                if (mApp.otaUtils != null)
                    mApp.otaUtils.cleanOtaScreen(true);
            } else
            {
                log("WARNING: Setting mode to UNDEFINED but phone is OFFHOOK, skip cleanOtaScreen.");
            }
            mCallCard.setVisibility(0);
            log("setInCallScreenMode: (UNDEFINED): Set mCallCard VISIBLE");
            return;

        case 5: // '\005'
            mApp.otaUtils.setCdmaOtaInCallScreenUiState(OtaUtils.CdmaOtaInCallScreenUiState.State.ENDED);
            mCallCard.setVisibility(8);
            return;

        case 4: // '\004'
            mApp.otaUtils.setCdmaOtaInCallScreenUiState(OtaUtils.CdmaOtaInCallScreenUiState.State.NORMAL);
            mCallCard.setVisibility(8);
            return;

        case 3: // '\003'
            mManageConferenceUtils.setPanelVisible(false);
            mManageConferenceUtils.stopConferenceTime();
            if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                mCallCard.setVisibility(8);
            else
                mCallCard.setVisibility(0);
            log((new StringBuilder()).append("setInCallScreenMode: (NORMAL) Set mCallCard VISIBLE +").append(mCallCard.getVisibility()).toString());
            return;

        case 2: // '\002'
            mManageConferenceUtils.setPanelVisible(false);
            mManageConferenceUtils.stopConferenceTime();
            mCallCard.setVisibility(0);
            log("setInCallScreenMode(CALL_ENDED): Set mCallCard VISIBLE");
            return;

        case 1: // '\001'
            if (!PhoneUtils.isConferenceCall(mCM.getActiveFgCall()))
            {
                Log.w("InCallScreen", "MANAGE_CONFERENCE: no active conference call!");
                setInCallScreenMode(InCallUiState.InCallScreenMode.NORMAL);
                return;
            }
            List list = mCM.getFgCallConnections();
            if (list != null && list.size() > 1)
            {
                mManageConferenceUtils.initManageConferencePanel();
                mManageConferenceUtils.updateManageConferencePanel(list);
                mManageConferenceUtils.setPanelVisible(true);
                long l = mCM.getActiveFgCall().getEarliestConnection().getDurationMillis();
                mManageConferenceUtils.startConferenceTime(SystemClock.elapsedRealtime() - l);
                return;
            } else
            {
                Log.w("InCallScreen", (new StringBuilder()).append("MANAGE_CONFERENCE: Bogus TRUE from isConferenceCall(); connections = ").append(list).toString());
                setInCallScreenMode(InCallUiState.InCallScreenMode.NORMAL);
                return;
            }
        }
    }

    private void setupMenuItems(Menu menu)
    {
        Call call = mCM.getFirstActiveRingingCall();
        Call call1 = mCM.getFirstActiveBgCall();
        InCallControlState incallcontrolstate = getUpdatedInCallControlState();
        MenuItem menuitem = menu.findItem(0x7f08013a);
        MenuItem menuitem1 = menu.findItem(0x7f08013b);
        MenuItem menuitem2 = menu.findItem(0x7f080140);
        MenuItem menuitem3 = menu.findItem(0x7f080139);
        MenuItem menuitem4 = menu.findItem(0x7f080142);
        MenuItem menuitem5 = menu.findItem(0x7f080143);
        MenuItem menuitem6 = menu.findItem(0x7f080144);
        MenuItem menuitem7 = menu.findItem(0x7f080145);
        MenuItem menuitem8 = menu.findItem(0x7f080138);
        if (DualTalkUtils.isSupportDualTalk())
        {
            if (mDualTalk.isSupportHoldAndUnhold())
            {
                menuitem8.setVisible(true);
                if (mDualTalk.getActiveFgCall().getState() == com.android.internal.telephony.Call.State.ACTIVE)
                    menuitem8.setTitle(0x7f0d02e8);
                else
                if (mDualTalk.getFirstActiveBgCall().getState() == com.android.internal.telephony.Call.State.HOLDING)
                {
                    menuitem8.setTitle(0x7f0d0079);
                } else
                {
                    menuitem8.setVisible(false);
                    log("some thing is wrong!!");
                }
            } else
            {
                menuitem8.setVisible(false);
            }
        } else
        {
            menuitem8.setVisible(false);
        }
        int i = mCM.getActiveFgCall().getPhone().getPhoneType();
        if (menuitem != null)
            menuitem.setVisible(false);
        if (menuitem1 != null)
            menuitem1.setVisible(false);
        menuitem2.setVisible(false);
        menuitem3.setVisible(false);
        menuitem4.setVisible(false);
        menuitem5.setVisible(false);
        menuitem6.setVisible(false);
        menuitem7.setVisible(false);
        if (PhoneUtils.isDMLocked())
            return;
        mInCallMenuState.update();
        if (call.getState() != com.android.internal.telephony.Call.State.IDLE && (call.getState() != com.android.internal.telephony.Call.State.DISCONNECTED || call1 == null || call1.getState() != com.android.internal.telephony.Call.State.IDLE))
        {
            menuitem3.setVisible(mInCallMenuState.canVTVoiceAnswer);
        } else
        {
            if (!ViewConfiguration.get(this).hasPermanentMenuKey())
                if (incallcontrolstate.canAddCall)
                {
                    if (menuitem != null)
                        menuitem.setVisible(true);
                } else
                if (incallcontrolstate.canMerge)
                {
                    if (i != 1 && i != 3)
                        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                    if (menuitem1 != null)
                        menuitem1.setVisible(true);
                } else
                if (menuitem != null)
                {
                    menuitem.setVisible(true);
                    menuitem.setEnabled(false);
                }
            if (okToRecordVoice())
            {
                PhoneRecorder phonerecorder = PhoneRecorder.getInstance(getApplicationContext());
                menuitem2.setVisible(true);
                menuitem2.setEnabled(true);
                if (!phonerecorder.ismFlagRecord())
                    menuitem2.setTitle(0x7f0d0007);
                else
                    menuitem2.setTitle(0x7f0d0008);
            }
            menuitem4.setVisible(mInCallMenuState.canHangupAll);
            menuitem5.setVisible(mInCallMenuState.canHangupHolding);
        }
        menuitem6.setVisible(mInCallMenuState.canHangupActiveAndAnswerWaiting);
        menuitem7.setVisible(mInCallMenuState.canECT);
    }

    private void showCallLostDialog()
    {
        log("showCallLostDialog()...");
        if (!mIsForegroundActivity)
        {
            log("showCallLostDialog: not the foreground Activity! Bailing out...");
            return;
        }
        if (mCallLostDialog != null)
        {
            log("showCallLostDialog: There is a mCallLostDialog already.");
            return;
        } else
        {
            mCallLostDialog = (new android.app.AlertDialog.Builder(this)).setMessage(0x7f0d0191).setIconAttribute(0x1010355).create();
            mCallLostDialog.show();
            return;
        }
    }

    private void showCanDismissDialog(int i, boolean flag)
    {
        log((new StringBuilder()).append("showCanDismissDialog...isStartupError = ").append(flag).toString());
        showCanDismissDialog(getResources().getText(i), flag);
    }

    private void showCanDismissDialog(CharSequence charsequence, boolean flag)
    {
        log((new StringBuilder()).append("showCanDismissDialog...message = ").append(charsequence).toString());
        if (mCanDismissDialog != null && mCanDismissDialog.isShowing())
        {
            log("already showing, skip...");
            return;
        }
        android.content.DialogInterface.OnClickListener onclicklistener;
        android.content.DialogInterface.OnCancelListener oncancellistener;
        if (flag)
        {
            onclicklistener = new android.content.DialogInterface.OnClickListener() {

                final InCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    bailOutAfterCanDismissDialog();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
            oncancellistener = new android.content.DialogInterface.OnCancelListener() {

                final InCallScreen this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    bailOutAfterCanDismissDialog();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
        } else
        {
            onclicklistener = new android.content.DialogInterface.OnClickListener() {

                final InCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    delayedCleanupAfterDisconnect();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
            oncancellistener = new android.content.DialogInterface.OnCancelListener() {

                final InCallScreen this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    delayedCleanupAfterDisconnect();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
        }
        mCanDismissDialog = (new android.app.AlertDialog.Builder(this)).setMessage(charsequence).setPositiveButton(0x7f0d0192, onclicklistener).setOnCancelListener(oncancellistener).create();
        mCanDismissDialog.getWindow().addFlags(2);
        mCanDismissDialog.setOnShowListener(this);
        mCanDismissDialog.show();
    }

    private void showExitingECMDialog()
    {
        Log.i("InCallScreen", "showExitingECMDialog()...");
        if (mExitingECMDialog != null)
        {
            log("- DISMISSING mExitingECMDialog.");
            mExitingECMDialog.dismiss();
            mExitingECMDialog = null;
        }
        final InCallUiState inCallUiState = mApp.inCallUiState;
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final InCallScreen this$0;
            final InCallUiState val$inCallUiState;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                inCallUiState.clearPendingCallStatusCode();
            }

            
            {
                this$0 = InCallScreen.this;
                inCallUiState = incalluistate;
                super();
            }
        }
;
        android.content.DialogInterface.OnCancelListener oncancellistener = new android.content.DialogInterface.OnCancelListener() {

            final InCallScreen this$0;
            final InCallUiState val$inCallUiState;

            public void onCancel(DialogInterface dialoginterface)
            {
                inCallUiState.clearPendingCallStatusCode();
            }

            
            {
                this$0 = InCallScreen.this;
                inCallUiState = incalluistate;
                super();
            }
        }
;
        mExitingECMDialog = (new android.app.AlertDialog.Builder(this)).setMessage(0x7f0d0312).setPositiveButton(0x7f0d0192, onclicklistener).setOnCancelListener(oncancellistener).create();
        mExitingECMDialog.getWindow().addFlags(4);
        mExitingECMDialog.setOnShowListener(this);
        mExitingECMDialog.show();
    }

    private void showPausePromptDialog(Connection connection, String s)
    {
        Resources resources = getResources();
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(resources.getText(0x7f0d019d));
        stringbuilder.append(s);
        if (mPausePromptDialog != null)
        {
            log("- DISMISSING mPausePromptDialog.");
            mPausePromptDialog.dismiss();
            mPausePromptDialog = null;
        }
        mPausePromptDialog = (new android.app.AlertDialog.Builder(this)).setMessage(stringbuilder.toString()).create();
        mPausePromptDialog.show();
        Message message = Message.obtain(mHandler, 120);
        mHandler.sendMessageDelayed(message, 2000L);
    }

    private void showProgressIndication(int i, int j)
    {
        log((new StringBuilder()).append("showProgressIndication(message ").append(j).append(")...").toString());
        dismissProgressIndication();
        mProgressDialog = new ProgressDialog(this);
        mProgressDialog.setTitle(getText(i));
        mProgressDialog.setMessage(getText(j));
        mProgressDialog.setIndeterminate(true);
        mProgressDialog.setCancelable(false);
        mProgressDialog.getWindow().addFlags(4);
        mProgressDialog.show();
    }

    private void showStatusIndication(Constants.CallStatusCode callstatuscode)
    {
        _cls33..SwitchMap.com.android.phone.Constants.CallStatusCode[callstatuscode.ordinal()];
        JVM INSTR tableswitch 1 13: default 645
    //                   1 635
    //                   2 434
    //                   3 425
    //                   4 303
    //                   5 284
    //                   6 221
    //                   7 196
    //                   8 175
    //                   9 169
    //                   10 164
    //                   11 158
    //                   12 142
    //                   13 76;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14
_L1:
        break MISSING_BLOCK_LABEL_645;
_L14:
        int k1 = mApp.inCallUiState.getSlot();
        String s = mApp.inCallUiState.getNumber();
        log((new StringBuilder()).append("DROP_VOICECALL number:").append(s).toString());
        mVTInCallScreen.showReCallDialog(0x7f0d0018, s, k1);
        return;
_L13:
        log("showGenericErrorDialog, fdn_only");
        showGenericErrorDialog(0x7f0d0188, false);
        return;
_L12:
        mShowStatusIndication = false;
        return;
_L11:
        showExitingECMDialog();
        return;
_L10:
        mShowStatusIndication = false;
        return;
_L9:
        if (mRingingCall.isIdle())
        {
            handleMissingVoiceMailNumber();
            return;
        } else
        {
            mShowStatusIndication = false;
            return;
        }
_L8:
        if (mRingingCall.isIdle())
        {
            showCanDismissDialog(0x7f0d02d8, true);
            return;
        } else
        {
            mShowStatusIndication = false;
            return;
        }
_L7:
        mSwappingCalls = false;
        com.android.internal.telephony.PhoneConstants.State state;
        if (GeminiUtils.isGeminiSupport())
            state = ((GeminiPhone)mPhone).getState();
        else
            state = mCM.getState();
        if (state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
            Toast.makeText(mApp, 0x7f0d02d9, 0).show();
        mShowStatusIndication = false;
        return;
_L6:
        if (mRingingCall.isIdle())
        {
            showGenericErrorDialog(0x7f0d02d7, true);
            return;
        }
        break; /* Loop/switch isn't completed */
_L5:
        boolean flag1 = true;
        if (PhoneGlobals.getInstance().phoneMgr == null) goto _L16; else goto _L15
_L15:
        int ai1[];
        int l;
        int i1;
        ai1 = GeminiUtils.getSlots();
        l = ai1.length;
        i1 = 0;
_L21:
        flag1 = false;
        if (i1 >= l) goto _L16; else goto _L17
_L17:
        int j1 = ai1[i1];
        if (!PhoneGlobals.getInstance().phoneMgr.isSimInsert(j1)) goto _L19; else goto _L18
_L18:
        flag1 = true;
_L16:
        if (!flag1)
        {
            int k;
            if (mServiceStateExt.isImeiLocked())
                k = 0x7f0d018e;
            else
                k = 0x7f0d0186;
            showCanDismissDialog(k, true);
            return;
        }
        if (mRingingCall.isIdle())
        {
            showCanDismissDialog(0x7f0d02d6, true);
            return;
        }
        break; /* Loop/switch isn't completed */
_L19:
        i1++;
        if (true) goto _L21; else goto _L20
_L20:
        break; /* Loop/switch isn't completed */
_L4:
        showGenericErrorDialog(0x7f0d02d5, true);
        return;
_L3:
        Log.w("InCallScreen", "handleStartupError: POWER_OFF");
        if (PhoneGlobals.getInstance().phoneMgr != null)
        {
            int ai[] = GeminiUtils.getSlots();
            boolean flag = false;
            StringBuffer stringbuffer = null;
            for (int i = 0; i < ai.length; i++)
                if (!PhoneGlobals.getInstance().phoneMgr.isSimInsert(ai[i]))
                {
                    if (stringbuffer == null)
                        stringbuffer = new StringBuffer(1 + ai[i]);
                    else
                        stringbuffer.append(", ").append(1 + ai[i]);
                } else
                {
                    flag = true;
                }

            if (!flag)
            {
                int j;
                if (mServiceStateExt.isImeiLocked())
                    j = 0x7f0d018e;
                else
                    j = 0x7f0d0186;
                showCanDismissDialog(j, true);
                return;
            }
            if (stringbuffer != null)
            {
                Resources resources = getResources();
                Object aobj[] = new Object[1];
                aobj[0] = stringbuffer.toString();
                showCanDismissDialog(resources.getString(0x7f0d014b, aobj), true);
                return;
            }
        }
        showCanDismissDialog(0x7f0d02d4, true);
        return;
_L2:
        Log.wtf("InCallScreen", "showStatusIndication: nothing to display");
        return;
        showCanDismissDialog(0x7f0d02d8, true);
        throw new IllegalStateException((new StringBuilder()).append("showStatusIndication: unexpected status code: ").append(callstatuscode).toString());
    }

    private void showWaitPromptDialog(final Connection c, String s)
    {
        log((new StringBuilder()).append("showWaitPromptDialogChoice: '").append(s).append("'...").toString());
        Resources resources = getResources();
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(resources.getText(0x7f0d019c));
        stringbuilder.append(s);
        if (mWaitPromptDialog != null && mWaitPromptDialog.isShowing())
        {
            log("mWaitPromptDialog already show");
            return;
        } else
        {
            mWaitPromptDialog = (new android.app.AlertDialog.Builder(this)).setMessage(stringbuilder.toString()).setPositiveButton(0x7f0d019f, new android.content.DialogInterface.OnClickListener() {

                final InCallScreen this$0;
                final Connection val$c;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    log("handle WAIT_PROMPT_CONFIRMED, proceed...");
                    c.proceedAfterWaitChar();
                }

            
            {
                this$0 = InCallScreen.this;
                c = connection;
                super();
            }
            }
).setNegativeButton(0x7f0d01a0, new android.content.DialogInterface.OnClickListener() {

                final InCallScreen this$0;
                final Connection val$c;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    log("handle POST_DIAL_CANCELED!");
                    c.cancelPostDial();
                }

            
            {
                this$0 = InCallScreen.this;
                c = connection;
                super();
            }
            }
).create();
            mWaitPromptDialog.getWindow().addFlags(4);
            mWaitPromptDialog.show();
            return;
        }
    }

    private void showWildPromptDialog(final Connection c)
    {
        View view = createWildPromptView();
        if (mWildPromptDialog != null)
        {
            log("- DISMISSING mWildPromptDialog.");
            mWildPromptDialog.dismiss();
            mWildPromptDialog = null;
        }
        mWildPromptDialog = (new android.app.AlertDialog.Builder(this)).setView(view).setPositiveButton(0x7f0d019e, new android.content.DialogInterface.OnClickListener() {

            final InCallScreen this$0;
            final Connection val$c;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                log("handle WILD_PROMPT_CHAR_ENTERED, proceed...");
                EditText edittext = mWildPromptText;
                String s = null;
                if (edittext != null)
                {
                    s = mWildPromptText.getText().toString();
                    mWildPromptText = null;
                }
                c.proceedAfterWildChar(s);
                mApp.pokeUserActivity();
            }

            
            {
                this$0 = InCallScreen.this;
                c = connection;
                super();
            }
        }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

            final InCallScreen this$0;
            final Connection val$c;

            public void onCancel(DialogInterface dialoginterface)
            {
                log("handle POST_DIAL_CANCELED!");
                c.cancelPostDial();
                mApp.pokeUserActivity();
            }

            
            {
                this$0 = InCallScreen.this;
                c = connection;
                super();
            }
        }
).create();
        mWildPromptDialog.getWindow().addFlags(4);
        mWildPromptDialog.show();
        mWildPromptText.requestFocus();
    }

    private void startRecord()
    {
        PhoneRecorderHandler.getInstance().startVoiceRecord(0);
    }

    private void stopRecord()
    {
        PhoneRecorderHandler.getInstance().stopVoiceRecord();
    }

    private SyncWithPhoneStateStatus syncWithPhoneState()
    {
        log("syncWithPhoneState()...");
        PhoneUtils.dumpCallState(mPhone);
        dumpBluetoothState();
        if (!TelephonyCapabilities.supportsOtasp(mCM.getFgPhone()) || mApp.inCallUiState.inCallScreenMode != InCallUiState.InCallScreenMode.OTA_NORMAL && mApp.inCallUiState.inCallScreenMode != InCallUiState.InCallScreenMode.OTA_ENDED)
        {
            boolean flag = GeminiUtils.hasPendingMmi(mPhone);
            boolean flag1 = mApp.inCallUiState.isProgressIndicationActive();
            boolean flag2 = mApp.inCallUiState.showAlreadyDisconnectedState;
            if (!mCM.hasActiveFgCall() && !mCM.hasActiveBgCall() && !mCM.hasActiveRingingCall() && !flag && !flag1 && !flag2)
            {
                Log.i("InCallScreen", "syncWithPhoneState: phone is idle (shouldn't be here)");
                return SyncWithPhoneStateStatus.PHONE_NOT_IN_USE;
            } else
            {
                log("syncWithPhoneState: it's ok to be here; update the screen...");
                updateScreen();
                return SyncWithPhoneStateStatus.SUCCESS;
            }
        } else
        {
            return SyncWithPhoneStateStatus.SUCCESS;
        }
    }

    private void unregisterForPhoneStates()
    {
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.unregisterForPreciseCallStateChanged(obj, mHandler);
        GeminiRegister.unregisterForDisconnect(obj, mHandler);
        int i = mPhone.getPhoneType();
        if (i == 1)
        {
            GeminiRegister.unregisterForMmiComplete(obj, mHandler);
            GeminiRegister.unregisterForMmiInitiate(obj, mHandler);
        } else
        if (i == 2)
        {
            log("Registering for Call Waiting.");
            mCM.unregisterForCallWaiting(mHandler);
        }
        GeminiRegister.unregisterForPostDialCharacter(obj, mHandler);
        GeminiRegister.unregisterForSuppServiceFailed(obj, mHandler);
        GeminiRegister.unregisterForIncomingRing(obj, mHandler);
        GeminiRegister.unregisterForNewRingingConnection(obj, mHandler);
        unregisterForPhoneStatesMTK(obj);
        mRegisteredForPhoneStates = false;
    }

    private void unregisterForPhoneStatesMTK(Object obj)
    {
        GeminiRegister.unregisterForSpeechInfo(obj, mHandler);
        GeminiRegister.unregisterForCrssSuppServiceNotification(obj, mHandler);
        GeminiRegister.unregisterForSuppServiceNotification(obj, mHandler);
    }

    private void updateCallCardVisibilityPerDialerState(boolean flag)
    {
        if (isDialerOpened() && !PhoneUtils.isLandscape(this))
        {
            log((new StringBuilder()).append("- updateCallCardVisibilityPerDialerState(animate=").append(flag).append("): dialpad open, hide mCallCard...").toString());
            if (flag)
            {
                AnimationUtils.Fade.hide(mCallCard, 8);
            } else
            {
                mCallCard.setVisibility(8);
                return;
            }
        } else
        if (mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.NORMAL || mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.CALL_ENDED)
        {
            log((new StringBuilder()).append("- updateCallCardVisibilityPerDialerState(animate=").append(flag).append("): dialpad dismissed, show mCallCard...").toString());
            if (flag)
            {
                AnimationUtils.Fade.show(mCallCard);
                return;
            } else
            {
                mCallCard.setVisibility(0);
                return;
            }
        }
    }

    private void updateExpandedViewState()
    {
        boolean flag = true;
        if (mIsForegroundActivity)
        {
            if (mApp.proximitySensorModeEnabled())
            {
                NotificationMgr.StatusBarHelper statusbarhelper = mApp.notificationMgr.statusBarHelper;
                if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING)
                    flag = false;
                statusbarhelper.enableExpandedView(flag);
                return;
            } else
            {
                mApp.notificationMgr.statusBarHelper.enableExpandedView(false);
                return;
            }
        } else
        {
            mApp.notificationMgr.statusBarHelper.enableExpandedView(flag);
            return;
        }
    }

    private void updateInCallTouchUi()
    {
        if (mInCallTouchUi != null)
            mInCallTouchUi.updateState(mCM);
    }

    private void updateLocalCache()
    {
        mForegroundCall = mCM.getActiveFgCall();
        mBackgroundCall = mCM.getFirstActiveBgCall();
        mRingingCall = mCM.getFirstActiveRingingCall();
    }

    private void updateManageConferencePanelIfNecessary()
    {
        log((new StringBuilder()).append("updateManageConferencePanelIfNecessary: ").append(mCM.getActiveFgCall()).append("...").toString());
        List list = mCM.getFgCallConnections();
        if (list == null)
        {
            log("==> no connections on foreground call!");
            setInCallScreenMode(InCallUiState.InCallScreenMode.NORMAL);
            SyncWithPhoneStateStatus syncwithphonestatestatus1 = syncWithPhoneState();
            if (syncwithphonestatestatus1 != SyncWithPhoneStateStatus.SUCCESS)
            {
                Log.w("InCallScreen", (new StringBuilder()).append("- syncWithPhoneState failed! status = ").append(syncwithphonestatestatus1).toString());
                log("updateManageConferencePanelIfNecessary: endInCallScreenSession... 1");
                endInCallScreenSession();
            }
        } else
        {
            int i = list.size();
            if (i <= 1)
            {
                log("==> foreground call no longer a conference!");
                setInCallScreenMode(InCallUiState.InCallScreenMode.NORMAL);
                SyncWithPhoneStateStatus syncwithphonestatestatus = syncWithPhoneState();
                if (syncwithphonestatestatus != SyncWithPhoneStateStatus.SUCCESS)
                {
                    Log.w("InCallScreen", (new StringBuilder()).append("- syncWithPhoneState failed! status = ").append(syncwithphonestatestatus).toString());
                    log("updateManageConferencePanelIfNecessary: endInCallScreenSession... 2");
                    endInCallScreenSession();
                    return;
                }
            } else
            if (i != mManageConferenceUtils.getNumCallersInConference())
            {
                log("==> Conference size has changed; need to rebuild UI!");
                mManageConferenceUtils.updateManageConferencePanel(list);
                return;
            }
        }
    }

    private void updatePrevPhonenums()
    {
        log("-updatePrevPhonenums:update the previous phone number list.");
        List list = mCM.getActiveFgCall().getConnections();
        prevPhonenums.clear();
        for (int i = 0; i < list.size(); i++)
            prevPhonenums.add(list.get(i));

    }

    private void updateProgressIndication()
    {
        if (mCM.hasActiveRingingCall())
        {
            dismissProgressIndication();
            return;
        }
        InCallUiState incalluistate = mApp.inCallUiState;
        switch (_cls33..SwitchMap.com.android.phone.InCallUiState.ProgressIndicationType[incalluistate.getProgressIndication().ordinal()])
        {
        case 3: // '\003'
            showProgressIndication(0x7f0d02e2, 0x7f0d02e4);
            return;

        case 2: // '\002'
            showProgressIndication(0x7f0d02e2, 0x7f0d02e3);
            return;

        case 1: // '\001'
            dismissProgressIndication();
            return;
        }
        Log.wtf("InCallScreen", (new StringBuilder()).append("updateProgressIndication: unexpected value: ").append(incalluistate.getProgressIndication()).toString());
        dismissProgressIndication();
    }

    private void updateScreen()
    {
        log("updateScreen()...");
        InCallUiState.InCallScreenMode incallscreenmode = mApp.inCallUiState.inCallScreenMode;
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        log((new StringBuilder()).append("  - phone state = ").append(state).toString());
        log((new StringBuilder()).append("  - inCallScreenMode = ").append(incallscreenmode).toString());
        if (!mExtension.updateScreen(mCM, mIsForegroundActivity))
        {
            if (!mRingingCall.getState().isRinging() && mRespondViaSmsManager != null)
                mRespondViaSmsManager.dismissPopup();
            updateCallTime();
            if (!mIsForegroundActivity)
            {
                log("- updateScreen: not the foreground Activity! Bailing out...");
                return;
            }
            if (incallscreenmode == InCallUiState.InCallScreenMode.OTA_NORMAL)
            {
                log("- updateScreen: OTA call state NORMAL (NOT updating in-call UI)...");
                mCallCard.setVisibility(8);
                if (mApp.otaUtils != null)
                {
                    mApp.otaUtils.otaShowProperScreen();
                    return;
                } else
                {
                    Log.w("InCallScreen", "OtaUtils object is null, not showing any screen for that.");
                    return;
                }
            }
            if (incallscreenmode == InCallUiState.InCallScreenMode.OTA_ENDED)
            {
                log("- updateScreen: OTA call ended state (NOT updating in-call UI)...");
                mCallCard.setVisibility(8);
                mApp.wakeUpScreen();
                if (mApp.cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION)
                {
                    log("- updateScreen: OTA_STATUS_ACTIVATION");
                    if (mApp.otaUtils != null)
                    {
                        log("- updateScreen: mApp.otaUtils is not null, call otaShowActivationScreen");
                        mApp.otaUtils.otaShowActivateScreen();
                        return;
                    }
                } else
                {
                    log("- updateScreen: OTA Call end state for Dialogs");
                    if (mApp.otaUtils != null)
                    {
                        log("- updateScreen: Show OTA Success Failure dialog");
                        mApp.otaUtils.otaShowSuccessFailure();
                        return;
                    }
                }
            } else
            {
                if (incallscreenmode == InCallUiState.InCallScreenMode.MANAGE_CONFERENCE)
                {
                    log("- updateScreen: manage conference mode (NOT updating in-call UI)...");
                    if (PhoneUtils.isLandscape(this))
                        mSecCallInfo.setVisibility(8);
                    else
                        mCallCard.setVisibility(8);
                    updateManageConferencePanelIfNecessary();
                    return;
                }
                if (incallscreenmode == InCallUiState.InCallScreenMode.CALL_ENDED)
                    log("- updateScreen: call ended state...");
                log("- updateScreen: updating the in-call UI...");
                updateInCallTouchUi();
                mCallCard.updateState(mCM);
                handleRecordProc();
                if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING)
                {
                    if (mDialer.isOpened())
                    {
                        Log.i("InCallScreen", "During RINGING state we force hiding dialpad.");
                        closeDialpadInternal(false);
                    }
                    mDialer.clearDigits();
                }
                updateCallCardVisibilityPerDialerState(false);
                updateProgressIndication();
                if (mCM.hasActiveRingingCall())
                {
                    dismissAllDialogs();
                    return;
                }
                List list = mCM.getFgCallConnections();
                int i = mCM.getFgPhone().getPhoneType();
                if (i == 2)
                {
                    Connection connection1 = mCM.getFgCallLatestConnection();
                    if (mApp.cdmaPhoneCallState.getCurrentCallState() == CdmaPhoneCallState.PhoneCallState.CONF_CALL)
                    {
                        Iterator iterator1 = list.iterator();
                        do
                        {
                            if (!iterator1.hasNext())
                                break;
                            Connection connection2 = (Connection)iterator1.next();
                            if (connection2 != null && connection2.getPostDialState() == com.android.internal.telephony.Connection.PostDialState.WAIT)
                                connection2.cancelPostDial();
                        } while (true);
                    } else
                    if (connection1 != null && connection1.getPostDialState() == com.android.internal.telephony.Connection.PostDialState.WAIT)
                    {
                        log("show the Wait dialog for CDMA");
                        showWaitPromptDialog(connection1, connection1.getRemainingPostDialString());
                        return;
                    }
                } else
                {
                    if (i != 1 && i != 3)
                        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                    Iterator iterator = list.iterator();
                    do
                    {
                        if (!iterator.hasNext())
                            break;
                        Connection connection = (Connection)iterator.next();
                        if (connection != null && connection.getPostDialState() == com.android.internal.telephony.Connection.PostDialState.WAIT)
                            showWaitPromptDialog(connection, connection.getRemainingPostDialString());
                    } while (true);
                }
            }
        }
    }

    private void updateVoiceCallRecordState(int i)
    {
        log((new StringBuilder()).append("updateVoiceCallRecordState... state = ").append(i).toString());
        CallManager callmanager = mCM;
        com.android.internal.telephony.Call.State state = null;
        if (callmanager != null)
        {
            Call call = mCM.getFirstActiveRingingCall();
            state = null;
            if (call != null)
                state = call.getState();
        }
        if (1 == i && state != null && !state.isRinging())
            mVoiceRecorderIcon.setVisibility(0);
        else
        if (i == 0 || state != null && state.isRinging())
        {
            mVoiceRecorderIcon.setVisibility(4);
            return;
        }
    }

    public void acceptIncomingCallByVoiceCommand()
    {
        log("acceptIncomingCallByVoiceCommand");
        handleOnscreenButtonClick(0x7f080008);
        if (!mApp.isHeadsetPlugged() && !mApp.isBluetoothHeadsetAudioOn())
        {
            log("acceptIncomingCallByVoiceCommand(), turn on speaker");
            PhoneUtils.turnOnSpeaker(mApp, true, true, true);
        }
    }

    void adjustProcessPriority()
    {
        int i = Process.myPid();
        if (Process.getThreadPriority(i) != 0)
            Process.setThreadPriority(i, 0);
    }

    public void cancelLockScreenTimer()
    {
        if (delayTime_disableTouch.booleanValue() && !isVTInCallScreenOn() && timer != null)
            timer.cancel();
    }

    void connectBluetoothAudio()
    {
        log("connectBluetoothAudio()...");
        if (mBluetoothHeadset != null)
            mBluetoothHeadset.connectAudio();
        mBluetoothConnectionPending = true;
        mBluetoothConnectionRequestTime = SystemClock.elapsedRealtime();
    }

    public void delayStartLockScreen()
    {
        timer = new Timer();
        timerTask = new TimerTask() {

            final InCallScreen this$0;

            public void run()
            {
                Log.d("lockNow", (new StringBuilder()).append("mIsForegroundActivity = ").append(mIsForegroundActivity).toString());
                if (mIsForegroundActivity)
                {
                    Log.d("lockNow", "lockscreen");
                    lockscreen();
                    return;
                } else
                {
                    Log.d("lockNow", "! lockscreen");
                    cancelLockScreenTimer();
                    return;
                }
            }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
        }
;
        timer.schedule(timerTask, lock_screen_time, lock_screen_time);
    }

    public void delayedCleanupAfterDisconnect()
    {
        int ai[] = GeminiUtils.getSlots();
        for (int i = 0; i < ai.length; i++)
            delayedCleanupAfterDisconnect(DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI[i]);

    }

    public void delayedCleanupAfterDisconnect(int i)
    {
        boolean flag;
        if (GeminiUtils.isGeminiSupport())
            log((new StringBuilder()).append("delayedCleanupAfterDisconnect()...  GeminiPhone state = ").append(((GeminiPhone)mPhone).getState()).toString());
        else
            log((new StringBuilder()).append("delayedCleanupAfterDisconnect()...  Phone state = ").append(mPhone.getState()).toString());
        mCM.clearDisconnected();
        if (phoneIsInUse() || mApp.inCallUiState.isProgressIndicationActive())
            flag = true;
        else
            flag = false;
        if (flag)
        {
            log("- delayedCleanupAfterDisconnect: staying on the InCallScreen...");
            return;
        }
        log("- delayedCleanupAfterDisconnect: phone is idle...");
        if (mIsForegroundActivity)
        {
            log("- delayedCleanupAfterDisconnect: finishing InCallScreen...");
            InCallUiState.sLastInCallScreenStatus = -1;
            log("- Post-call behavior:");
            int j = GeminiRegister.getSlotIdByRegisterEvent(i, DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI);
            boolean flag1 = isPhoneStateRestricted(j);
            log((new StringBuilder()).append(" - isPhoneStateRestricted slot=").append(j).append(", isPhoneStateRestricted = ").append(flag1).toString());
            if (isPhoneStateRestricted() && PhoneGlobals.sVoiceCapable)
            {
                Intent intent = mApp.createPhoneEndIntent();
                ActivityOptions activityoptions = ActivityOptions.makeCustomAnimation(this, 0x7f050000, 0x7f050001);
                log((new StringBuilder()).append("- Show Call Log (or Dialtacts) after disconnect. Current intent: ").append(intent).toString());
                if (intent != null)
                    try
                    {
                        intent.addFlags(0x10000);
                        startActivity(intent, activityoptions.toBundle());
                    }
                    catch (ActivityNotFoundException activitynotfoundexception)
                    {
                        Log.w("InCallScreen", (new StringBuilder()).append("delayedCleanupAfterDisconnect: transition to call log failed; intent = ").append(intent).toString());
                    }
            }
            endInCallScreenSession();
            finishIfNecessory();
        } else
        if (phoneIsInUse())
            InCallUiState.sLastInCallScreenStatus = -1;
        else
            InCallUiState.sLastInCallScreenStatus = 0;
        endInCallScreenSession();
        finishIfNecessory();
        requestUpdateScreenDelay(200L);
        mApp.setLatestActiveCallOrigin(null);
    }

    void disconnectBluetoothAudio()
    {
        log("disconnectBluetoothAudio()...");
        if (mBluetoothHeadset != null)
            mBluetoothHeadset.disconnectAudio();
        mBluetoothConnectionPending = false;
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.dispatchPopulateAccessibilityEvent(accessibilityevent);
        mCallCard.dispatchPopulateAccessibilityEvent(accessibilityevent);
        return true;
    }

    void doSuppCrssSuppServiceNotification(String s)
    {
        int i;
label0:
        {
            Call call = mForegroundCall;
            Connection connection = null;
            if (call != null)
            {
                i = mPhone.getPhoneType();
                if (i == 2)
                {
                    connection = mForegroundCall.getLatestConnection();
                } else
                {
                    if (i != 1)
                        break label0;
                    connection = mForegroundCall.getEarliestConnection();
                }
            }
            if (connection == null)
            {
                log(" Connnection is null");
                return;
            }
            Object obj = connection.getUserData();
            if (obj instanceof CallerInfo)
            {
                CallerInfo callerinfo1 = (CallerInfo)obj;
                log((new StringBuilder()).append("SuppCrssSuppService ci.phoneNumber:").append(callerinfo1.phoneNumber).toString());
                if (!callerinfo1.isVoiceMailNumber() && !callerinfo1.isEmergencyNumber())
                    callerinfo1.phoneNumber = s;
            } else
            if (obj instanceof PhoneUtils.CallerInfoToken)
            {
                CallerInfo callerinfo = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
                if (!callerinfo.isVoiceMailNumber())
                    callerinfo.phoneNumber = s;
            }
            connection.setUserData(obj);
            updateScreen();
            return;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
    }

    void doSuppCrssSuppServiceNotificationforInComing()
    {
label0:
        {
            log("doSuppCrssSuppServiceNotificationforInComing...");
            Call call = mCM.getFirstActiveRingingCall();
            Connection connection = null;
            if (call != null)
                connection = call.getLatestConnection();
            if (connection != null)
            {
                Object obj = connection.getUserData();
                if (!(obj instanceof CallerInfo) || !((CallerInfo)obj).shouldSendToVoicemail)
                    break label0;
                log("should not update Screen and Notification.");
            }
            return;
        }
        updateScreen();
        mApp.notificationMgr.updateInCallNotification();
    }

    void enableHomeKeyDispatched(boolean flag)
    {
        log((new StringBuilder()).append("enableHomeKeyDispatched, enable = ").append(flag).toString());
        Window window = getWindow();
        android.view.WindowManager.LayoutParams layoutparams = window.getAttributes();
        if (flag)
            layoutparams.flags = 0x80000000 | layoutparams.flags;
        else
            layoutparams.flags = 0x7fffffff & layoutparams.flags;
        window.setAttributes(layoutparams);
    }

    public void endInCallScreenSession()
    {
        log((new StringBuilder()).append("endInCallScreenSession()... phone state = ").append(mCM.getState()).toString());
        endInCallScreenSession(false);
    }

    public void finish()
    {
        log("finish()...");
        dismissDialogs();
        moveTaskToBack(true);
    }

    void finishForTest()
    {
        super.finish();
    }

    CallCard getCallCardOnlyForTest()
    {
        return mCallCard;
    }

    CallTime getCallTimeOnlyForTest()
    {
        return mCallTime;
    }

    InCallControlState getInCallControlStateOnlyForTest()
    {
        return mInCallControlState;
    }

    InCallMenuState getInCallMenuStateOnlyForTest()
    {
        return mInCallMenuState;
    }

    InCallTouchUi getInCallTouchUi()
    {
        return mInCallTouchUi;
    }

    public boolean getInVoiceAnswerVideoCall()
    {
        return mInVoiceAnswerVideoCall;
    }

    ManageConferenceUtils getManageConferenceUtilsOnlyForTest()
    {
        return mManageConferenceUtils;
    }

    public boolean getOnAnswerAndEndFlag()
    {
        return mOnAnswerandEndCall;
    }

    RespondViaSmsManager getRespondViaSmsManagerOnlyForTest()
    {
        return mRespondViaSmsManager;
    }

    public Point getScreenSize()
    {
        if (sScreenSize == null)
        {
            Point point = new Point();
            getWindowManager().getDefaultDisplay().getSize(point);
            sScreenSize = point;
        }
        return sScreenSize;
    }

    boolean getSwappingCalls()
    {
        return mSwappingCalls;
    }

    public InCallControlState getUpdatedInCallControlState()
    {
        log("getUpdatedInCallControlState()...");
        mInCallControlState.update();
        return mInCallControlState;
    }

    public IVTInCallScreen getVTInCallScreenInstance()
    {
        return mVTInCallScreen;
    }

    ImageView getVoiceRecorderIconOnlyForTest()
    {
        return mVoiceRecorderIcon;
    }

    PhoneGlobals getmAppOnlyForTest()
    {
        return mApp;
    }

    CallManager getmCMOnlyForTest()
    {
        return mCM;
    }

    BroadcastReceiver getmDMLockReceiverOnlyForTest()
    {
        return mDMLockReceiver;
    }

    DTMFTwelveKeyDialer getmDialerOnlyForTest()
    {
        return mDialer;
    }

    boolean getmIsForegroundActivityForProximityOnlyForTest()
    {
        return mIsForegroundActivityForProximity;
    }

    boolean getmIsForegroundActivityOnlyForTest()
    {
        return mIsForegroundActivity;
    }

    PopupMenu getmPopupMenuOnlyForTest()
    {
        return mPopupMenu;
    }

    PowerManager getmPowerManagerOnlyForTest()
    {
        return mPowerManager;
    }

    BroadcastReceiver getmReceiverOnlyForTest()
    {
        return mReceiver;
    }

    void handleAnswerAndEnd(Call call)
    {
        log("+handleAnswerAndEnd");
        mDualTalk.getAllNoIdleCalls().size();
        if (!call.getState().isAlive()) goto _L2; else goto _L1
_L1:
        Phone phone = call.getPhone();
        if (call.getState() != com.android.internal.telephony.Call.State.ACTIVE) goto _L4; else goto _L3
_L3:
        log("+handleAnswerAndEnd: hangup Call.State.ACTIVE");
        if (!(phone instanceof SipPhone)) goto _L6; else goto _L5
_L5:
        call.hangup();
_L2:
        Call call1 = mDualTalk.getFirstActiveRingingCall();
        if (mDualTalk.hasActiveCdmaPhone() && call1.getPhone().getPhoneType() != 2)
        {
            log("handleAnswerAndEnd: cdma phone has acttive call, don't switch it and answer the ringing only");
            Exception exception;
            try
            {
                call1.getPhone().acceptCall();
            }
            catch (Exception exception1)
            {
                log(exception1.toString());
            }
        } else
        {
            PhoneUtils.answerCall(mDualTalk.getFirstActiveRingingCall());
        }
        log("-handleAnswerAndEnd");
        return;
_L6:
        try
        {
            phone.hangupActiveCall();
        }
        // Misplaced declaration of an exception variable
        catch (Exception exception)
        {
            log(exception.toString());
        }
          goto _L2
_L4:
        if (call.getState() != com.android.internal.telephony.Call.State.HOLDING) goto _L2; else goto _L7
_L7:
        log("+handleAnswerAndEnd: hangup Call.State.HOLDING and switch H&A");
        call.hangup();
        phone.switchHoldingAndActive();
          goto _L2
    }

    void handleHoldAndUnhold()
    {
        if (DualTalkUtils.isSupportDualTalk()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        Call call1;
        Call call = mDualTalk.getActiveFgCall();
        call1 = mDualTalk.getFirstActiveBgCall();
        try
        {
            if (call.getState().isAlive())
            {
                call.getPhone().switchHoldingAndActive();
                return;
            }
        }
        catch (Exception exception)
        {
            log((new StringBuilder()).append("handleHoldAndUnhold: ").append(exception.toString()).toString());
            return;
        }
        if (!call1.getState().isAlive()) goto _L1; else goto _L3
_L3:
        call1.getPhone().switchHoldingAndActive();
        return;
    }

    boolean handleOnScreenMenuItemClick(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2131231036: 
        case 2131231037: 
        case 2131231038: 
        case 2131231039: 
        case 2131231041: 
        default:
            return false;

        case 2131231032: 
            onHoldClick();
            return false;

        case 2131231034: 
            onAddCallClick();
            updateInCallTouchUi();
            return true;

        case 2131231035: 
            mSwappingCalls = false;
            PhoneUtils.mergeCalls(mCM);
            return true;

        case 2131231040: 
            onVoiceRecordClick(menuitem);
            return true;

        case 2131231033: 
            onVTVoiceAnswer();
            return true;

        case 2131231042: 
            PhoneUtils.hangupAllCalls();
            return true;

        case 2131231043: 
            PhoneUtils.hangupHoldingCall(mCM.getFirstActiveBgCall());
            return true;

        case 2131231044: 
            PhoneUtils.hangup(mCM.getActiveFgCall());
            return true;

        case 2131231045: 
            break;
        }
        int i;
        if (!GeminiUtils.isGeminiSupport())
            break MISSING_BLOCK_LABEL_185;
        i = GeminiUtils.getSlotNotIdle(mPhone);
        if (i != -1)
            try
            {
                ((GeminiPhone)mPhone).explicitCallTransferGemini(i);
            }
            catch (CallStateException callstateexception)
            {
                callstateexception.printStackTrace();
            }
        break MISSING_BLOCK_LABEL_202;
        mPhone.explicitCallTransfer();
        return true;
    }

    public void handleOnscreenButtonClick(int i)
    {
        log((new StringBuilder()).append("handleOnscreenButtonClick(id ").append(i).append(")...").toString());
        PhoneGlobals.getInstance().pokeUserActivity();
        if (mExtension.handleOnscreenButtonClick(i))
        {
            mApp.pokeUserActivity();
            return;
        }
        switch (i)
        {
        case 2131230818: 
            setInCallScreenMode(InCallUiState.InCallScreenMode.MANAGE_CONFERENCE);
            requestUpdateScreen();
            break;

        case 2131230857: 
        case 2131230859: 
            if (mPopupMenu != null)
                mPopupMenu.dismiss();
            mPopupMenu = constructPopupMenu(findViewById(i));
            if (mPopupMenu != null && mPopupMenu.getMenu().hasVisibleItems())
                mPopupMenu.show();
            break;

        case 2131230821: 
        case 2131230856: 
            mSwappingCalls = false;
            PhoneUtils.mergeCalls(mCM);
            break;

        case 2131230855: 
            if (mShowStatusIndication)
                log("ignore addButton click event");
            else
                onAddCallClick();
            break;

        case 2131230847: 
            onMuteClick();
            break;

        case 2131230845: 
            onOpenCloseDialpad();
            break;

        case 2131230841: 
            internalHangup();
            break;

        case 2131230853: 
            long l = SystemClock.uptimeMillis();
            if (l - mLastClickActionTime <= 1000L)
                break;
            if (DualTalkUtils.isSupportDualTalk() && mDualTalk.isDualTalkMultipleHoldCase())
                selectWhichCallActive(mDualTalk.getAllNoIdleCalls());
            else
                internalSwapCalls();
            mLastClickActionTime = l;
            break;

        case 2131230852: 
            onHoldClick();
            break;

        case 2131230730: 
            internalRespondViaSms();
            break;

        case 2131230729: 
            hangupRingingCall();
            break;

        case 2131230728: 
            internalAnswerCall();
            break;

        default:
            Log.w("InCallScreen", (new StringBuilder()).append("handleOnscreenButtonClick: unexpected ID ").append(i).toString());
            break;
        }
        mApp.pokeUserActivity();
        if (i == 0x7f080085)
        {
            Log.w("InCallScreen", (new StringBuilder()).append("handleOnscreenButtonClick: id == R.id.swapButton ").append(i).toString());
            return;
        }
        if (i == 0x7f080088)
        {
            Log.w("InCallScreen", (new StringBuilder()).append("handleOnscreenButtonClick: id == R.id.mergeButton ").append(i).toString());
            return;
        } else
        {
            updateInCallTouchUi();
            return;
        }
    }

    public void handleOtaCallEnd()
    {
        log("handleOtaCallEnd entering");
        if ((mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL || mApp.cdmaOtaScreenState != null && mApp.cdmaOtaScreenState.otaScreenState != OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_UNDEFINED) && mApp.cdmaOtaProvisionData != null && !mApp.cdmaOtaProvisionData.inOtaSpcState)
        {
            log("handleOtaCallEnd - Set OTA Call End stater");
            setInCallScreenMode(InCallUiState.InCallScreenMode.OTA_ENDED);
            updateScreen();
        }
    }

    public void handleStorageFull(boolean flag)
    {
        if (PhoneUtils.getMountedStorageCount() > 1)
        {
            log("handleStorageFull(), mounted storage count > 1");
            if (1 == PhoneUtils.getDefaultStorageType())
            {
                log("handleStorageFull(), SD card is using");
                showStorageFullDialog(0x20500e9, true);
            } else
            if (PhoneUtils.getDefaultStorageType() == 0)
            {
                log("handleStorageFull(), phone storage is using");
                showStorageFullDialog(0x20500e7, true);
                return;
            } else
            {
                log("handleStorageFull(), never happen here");
                return;
            }
        } else
        if (1 == PhoneUtils.getMountedStorageCount())
        {
            log("handleStorageFull(), mounted storage count == 1");
            if (1 == PhoneUtils.getDefaultStorageType())
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("handleStorageFull(), SD card is using, ");
                String s;
                if (flag)
                    s = "checking case";
                else
                    s = "recording case";
                log(stringbuilder.append(s).toString());
                String s1;
                if (flag)
                    s1 = getResources().getString(0x7f0d0034);
                else
                    s1 = getResources().getString(0x7f0d006c);
                Toast.makeText(PhoneGlobals.getInstance(), s1, 1).show();
                return;
            }
            if (PhoneUtils.getDefaultStorageType() == 0)
            {
                log("handleStorageFull(), phone storage is using");
                showStorageFullDialog(0x20500e8, false);
                return;
            } else
            {
                log("handleStorageFull(), never happen here");
                return;
            }
        }
    }

    void handleSwitchFailed()
    {
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING)
        {
            log("send message to update screen after 500ms");
            requestUpdateScreenDelay(500L);
            Toast.makeText(this, 0x7f0d02db, 1).show();
            return;
        }
        Object obj;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null)
        {
            obj = mDualTalk.getAllActiveCalls();
        } else
        {
            obj = new ArrayList();
            Iterator iterator = mCM.getAllPhones().iterator();
            while (iterator.hasNext()) 
            {
                Phone phone = (Phone)iterator.next();
                log((new StringBuilder()).append("active phone = ").append(phone).append(" phone state = ").append(phone.getState()).toString());
                if (phone.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
                {
                    Call call = phone.getForegroundCall();
                    log((new StringBuilder()).append("active call = ").append(call.getConnections()).append(" state = ").append(call.getState()).toString());
                    if (call != null && call.getState().isAlive())
                        ((List) (obj)).add(call);
                }
            }
        }
        if (obj == null || ((List) (obj)).size() < 2)
        {
            log("This is only one ACTIVE call, so do nothing.");
            return;
        }
        long l = CallTime.getCallDuration((Call)((List) (obj)).get(0));
        long l1 = CallTime.getCallDuration((Call)((List) (obj)).get(1));
        log("More than one ACTIVE calls, hangup the latest.");
        if (l > l1)
            try
            {
                ((Call)((List) (obj)).get(1)).hangup();
                return;
            }
            catch (CallStateException callstateexception)
            {
                return;
            }
        ((Call)((List) (obj)).get(0)).hangup();
        return;
    }

    void handleUnholdAndEnd(Call call)
    {
        log("+handleUnholdAndEnd");
        mDualTalk.getAllNoIdleCalls().size();
        if (!call.getState().isAlive()) goto _L2; else goto _L1
_L1:
        Phone phone = call.getPhone();
        if (call.getState() != com.android.internal.telephony.Call.State.ACTIVE) goto _L4; else goto _L3
_L3:
        log("+handleUnholdAndEnd: hangup Call.State.ACTIVE");
        if (!(phone instanceof SipPhone)) goto _L6; else goto _L5
_L5:
        call.hangup();
_L2:
        mDualTalk.getSecondActiveBgCall().getPhone().switchHoldingAndActive();
_L7:
        log("-handleUnholdAndEnd");
        return;
_L6:
        phone.hangupActiveCall();
          goto _L2
        Exception exception;
        exception;
        log(exception.toString());
          goto _L7
_L4:
        if (call.getState() != com.android.internal.telephony.Call.State.HOLDING) goto _L2; else goto _L8
_L8:
        log("+handleUnholdAndEnd: hangup Call.State.HOLDING and switch H&A");
        call.hangup();
        phone.switchHoldingAndActive();
          goto _L2
    }

    void handleVideoAndVoiceIncoming(DualTalkUtils dualtalkutils)
    {
        if (dualtalkutils != null && DualTalkUtils.isSupportDualTalk() && dualtalkutils.hasMultipleRingingCall())
        {
            Call call = dualtalkutils.getFirstActiveRingingCall();
            Call call1 = dualtalkutils.getSecondActiveRingCall();
            if ((VTCallUtils.isVideoCall(call) || VTCallUtils.isVideoCall(call1)) && call1.getState().isAlive())
            {
                try
                {
                    call1.hangup();
                    return;
                }
                catch (Exception exception)
                {
                    log(exception.toString());
                }
                return;
            }
        }
    }

    void hangupRingingCall()
    {
        log("hangupRingingCall()...");
        PhoneUtils.dumpCallManager();
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk.hasMultipleRingingCall())
        {
            PhoneUtils.hangupForDualTalk(mDualTalk.getFirstActiveRingingCall());
            PhoneGlobals.getInstance().notifier.switchRingToneByNeeded(mDualTalk.getSecondActiveRingCall());
            return;
        } else
        {
            PhoneUtils.hangupRingingCall(mCM.getFirstActiveRingingCall());
            internalSilenceRinger();
            return;
        }
    }

    boolean ignoreUpdateScreen()
    {
        boolean flag = mCM.hasActiveFgCall();
        boolean flag1 = mCM.hasActiveBgCall();
        return (flag || flag1) && mApp.notifier.hasPendingCallerInfoQuery();
    }

    public void internalAnswerCall()
    {
        log("internalAnswerCall()...");
        boolean flag = mCM.hasActiveRingingCall();
        if (DualTalkUtils.isSupportDualTalk() && (mDualTalk.hasMultipleRingingCall() || mDualTalk.isDualTalkAnswerCase() || mDualTalk.isRingingWhenOutgoing()))
            internalAnswerCallForDualTalk();
        else
        if (flag)
        {
            Phone phone = mCM.getRingingPhone();
            Call call = mCM.getFirstActiveRingingCall();
            int i = phone.getPhoneType();
            if (i == 2)
            {
                log("internalAnswerCall: answering (CDMA)...");
                if (mCM.hasActiveFgCall() && mCM.getFgPhone().getPhoneType() == 3)
                {
                    log("internalAnswerCall: answer CDMA incoming and end SIP ongoing");
                    PhoneUtils.answerAndEndActive(mCM, call);
                } else
                {
                    PhoneUtils.answerCall(call);
                }
            } else
            if (i == 3)
            {
                log("internalAnswerCall: answering (SIP)...");
                if (mCM.hasActiveFgCall() && mCM.getFgPhone().getPhoneType() == 2)
                {
                    log("internalAnswerCall: answer SIP incoming and end CDMA ongoing");
                    PhoneUtils.answerAndEndActive(mCM, call);
                } else
                if (mCM.hasActiveFgCall() && mCM.getFgPhone().getPhoneType() != 2 && mCM.hasActiveBgCall())
                {
                    PhoneUtils.answerAndEndActive(mCM, call);
                } else
                {
                    if (mCM.hasActiveFgCall() && VTCallUtils.isVideoCall(mCM.getActiveFgCall()))
                        try
                        {
                            mCM.getFgPhone().hangupActiveCall();
                        }
                        catch (Exception exception)
                        {
                            log(exception.toString());
                        }
                    PhoneUtils.answerCall(call);
                }
            } else
            if (i == 1)
            {
                log("internalAnswerCall: answering (GSM)...");
                boolean flag1 = mCM.hasActiveFgCall();
                boolean flag2 = mCM.hasActiveBgCall();
                if (flag1 && flag2)
                {
                    log("internalAnswerCall: answering (both lines in use!)...");
                    PhoneUtils.answerAndEndActive(mCM, mCM.getFirstActiveRingingCall());
                    setOnAnswerAndEndFlag(true);
                } else
                {
                    log("internalAnswerCall: answering...");
                    PhoneUtils.answerCall(call);
                }
            } else
            {
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
            }
            mApp.setLatestActiveCallOrigin(null);
            return;
        }
    }

    void internalAnswerCallForDualTalk()
    {
        Call call = mDualTalk.getFirstActiveRingingCall();
        if (!mDualTalk.isRingingWhenOutgoing()) goto _L2; else goto _L1
_L1:
        Call call4;
        log("internalAnswerCallForDualTalk: ringing when dialing");
        call4 = mDualTalk.getSecondActivieFgCall();
        if (!call4.getState().isDialing()) goto _L2; else goto _L3
_L3:
        Phone phone2 = call4.getPhone();
        if (!(phone2 instanceof SipPhone)) goto _L5; else goto _L4
_L4:
        call4.hangup();
_L2:
        List list;
        int i;
        list = mDualTalk.getAllNoIdleCalls();
        i = list.size();
        if (i <= 2) goto _L7; else goto _L6
_L6:
        log("internalAnswerCallForDualTalk: has more than two calls exist.");
        if (!mDualTalk.hasActiveCdmaPhone()) goto _L9; else goto _L8
_L8:
        handleAnswerAndEnd(call.getPhone().getForegroundCall());
        log("internalAnswerCallForDualTalk (C+G): hangup the gsm active call!");
_L11:
        return;
_L5:
        try
        {
            phone2.hangupActiveCall();
        }
        catch (Exception exception1)
        {
            log("internalAnswerCallForDualTalk:Exception ");
        }
          goto _L2
_L9:
        try
        {
            handleAnswerAndEnd(mCM.getActiveFgCall());
            return;
        }
        catch (Exception exception)
        {
            log(exception.toString());
        }
        return;
_L7:
        if (i != 2)
            break MISSING_BLOCK_LABEL_430;
        log("internalAnswerCallForDualTalk: has two calls exist.");
        if (((Call)list.get(0)).getPhone() == ((Call)list.get(1)).getPhone())
        {
            log("internalAnswerCallForDualTalk: two calls exist in the same phone.");
            handleAnswerAndEnd(mCM.getActiveFgCall());
            return;
        }
        Phone phone1;
        log("internalAnswerCallForDualTalk: two calls exist in diffrent phone.");
        if (!mDualTalk.hasActiveOrHoldBothCdmaAndGsm())
            break MISSING_BLOCK_LABEL_341;
        phone1 = mDualTalk.getActiveGsmPhone();
        Call call3 = mDualTalk.getActiveCdmaPhone().getForegroundCall();
        if (PhoneUtils.hasMultipleConnections(call3))
        {
            log("internalAnswerCallForDualTalk: cdma has multiple connections, disconneted it!");
            call3.hangup();
            PhoneUtils.answerCall(call);
            return;
        }
        if (phone1.getForegroundCall().getState().isAlive())
        {
            call.getPhone().acceptCall();
            log("internalAnswerCallForDualTalk: cdma hold + gsm active + gsm ringing");
            return;
        }
        log("internalAnswerCallForDualTalk: cdma active + gsm holding + cdma ringing/gsm ringing");
        PhoneUtils.answerCall(call);
        return;
        Iterator iterator = list.iterator();
_L13:
        if (!iterator.hasNext()) goto _L11; else goto _L10
_L10:
        com.android.internal.telephony.Call.State state;
        Call call2 = (Call)iterator.next();
        state = call2.getState();
        if (state == com.android.internal.telephony.Call.State.ACTIVE)
        {
            if (call.getPhone() != call2.getPhone())
                call2.getPhone().switchHoldingAndActive();
            PhoneUtils.answerCall(call);
            return;
        }
        if (state != com.android.internal.telephony.Call.State.HOLDING) goto _L13; else goto _L12
_L12:
        PhoneUtils.answerCall(call);
          goto _L13
        if (i != 1)
            continue; /* Loop/switch isn't completed */
        Call call1;
        log("internalAnswerCallForDualTalk: there is one call exist.");
        call1 = (Call)list.get(0);
        if (call1.getPhone().getPhoneType() == 2 && PhoneUtils.hasMultipleConnections(call1))
        {
            log("internalAnswerCallForDualTalk: hangup the cdma multiple call and answer the gsm call!");
            call1.hangup();
            PhoneUtils.answerCall(call);
            return;
        }
        if (call1.getPhone() == call.getPhone())
        {
            PhoneUtils.answerCall(call);
            return;
        }
        Phone phone;
        if (call1.getState() != com.android.internal.telephony.Call.State.ACTIVE)
            break MISSING_BLOCK_LABEL_581;
        if (VTCallUtils.isVideoCall(call1) || VTCallUtils.isVideoCall(call))
        {
            log("internalAnswerCallForDualTalk: there is one video call, hangup current call!");
            phone = call1.getPhone();
            if (!(phone instanceof SipPhone))
                break MISSING_BLOCK_LABEL_571;
            call1.hangup();
        }
_L15:
        PhoneUtils.answerCall(call);
        return;
        phone.hangupActiveCall();
        if (true) goto _L15; else goto _L14
_L14:
        PhoneUtils.answerCall(call);
        return;
        if (i != 0) goto _L11; else goto _L16
_L16:
        log("internalAnswerCallForDualTalk: there is no call exist.");
        handleVideoAndVoiceIncoming(mDualTalk);
        PhoneUtils.answerCall(call);
        return;
          goto _L2
    }

    public void internalHangupAll()
    {
        log("internalHangupAll()...");
        GeminiUtils.hangupAll(mPhone);
    }

    void internalHangupAllCalls(CallManager callmanager)
    {
        List list;
        log("internalHangupAllCalls");
        list = callmanager.getAllPhones();
        Iterator iterator = list.iterator();
_L9:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        Phone phone;
        Call call;
        Call call1;
        phone = (Phone)iterator.next();
        call = phone.getForegroundCall();
        call1 = phone.getBackgroundCall();
        if (phone.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            break MISSING_BLOCK_LABEL_310;
        if (phone instanceof SipPhone) goto _L4; else goto _L3
_L3:
        Log.d("InCallScreen", (new StringBuilder()).append(phone.toString()).append("   ").append(phone.getClass().toString()).toString());
        if (call == null) goto _L6; else goto _L5
_L5:
        if (!call.getState().isAlive() || call1 == null) goto _L6; else goto _L7
_L7:
        if (!call1.getState().isAlive()) goto _L6; else goto _L8
_L8:
        phone.hangupAll();
          goto _L9
        Exception exception;
        exception;
        Log.d("InCallScreen", exception.toString());
_L2:
        return;
_L6:
        if (call == null) goto _L11; else goto _L10
_L10:
        if (!call.getState().isAlive()) goto _L11; else goto _L12
_L12:
        call.hangup();
          goto _L9
_L11:
        if (call1 == null) goto _L9; else goto _L13
_L13:
        if (!call1.getState().isAlive()) goto _L9; else goto _L14
_L14:
        call1.hangup();
          goto _L9
_L4:
        Log.d("InCallScreen", (new StringBuilder()).append(phone.toString()).append("   ").append(phone.getClass().toString()).toString());
        if (call == null) goto _L16; else goto _L15
_L15:
        if (call.getState().isAlive())
            call.hangup();
_L16:
        if (call1 == null) goto _L9; else goto _L17
_L17:
        if (!call1.getState().isAlive()) goto _L9; else goto _L18
_L18:
        call1.hangup();
          goto _L9
        Log.d("InCallScreen", (new StringBuilder()).append("Phone is idle  ").append(phone.toString()).append("   ").append(phone.getClass().toString()).toString());
          goto _L9
    }

    boolean isBluetoothAudioConnected()
    {
        if (mBluetoothHeadset == null)
        {
            log("isBluetoothAudioConnected: ==> FALSE (null mBluetoothHeadset)");
        } else
        {
            List list = mBluetoothHeadset.getConnectedDevices();
            if (!list.isEmpty())
            {
                BluetoothDevice bluetoothdevice = (BluetoothDevice)list.get(0);
                boolean flag = mBluetoothHeadset.isAudioConnected(bluetoothdevice);
                log((new StringBuilder()).append("isBluetoothAudioConnected: ==> isAudioOn = ").append(flag).toString());
                return flag;
            }
        }
        return false;
    }

    boolean isBluetoothAudioConnectedOrPending()
    {
        if (isBluetoothAudioConnected())
        {
            log("isBluetoothAudioConnectedOrPending: ==> TRUE (really connected)");
            return true;
        }
        if (mBluetoothConnectionPending)
        {
            long l = SystemClock.elapsedRealtime() - mBluetoothConnectionRequestTime;
            if (l < 5000L)
            {
                log((new StringBuilder()).append("isBluetoothAudioConnectedOrPending: ==> TRUE (requested ").append(l).append(" msec ago)").toString());
                return true;
            } else
            {
                log((new StringBuilder()).append("isBluetoothAudioConnectedOrPending: ==> FALSE (request too old: ").append(l).append(" msec ago)").toString());
                mBluetoothConnectionPending = false;
                return false;
            }
        } else
        {
            log("isBluetoothAudioConnectedOrPending: ==> FALSE");
            return false;
        }
    }

    public boolean isBluetoothAvailable()
    {
        log("isBluetoothAvailable()...");
        BluetoothHeadset bluetoothheadset = mBluetoothHeadset;
        boolean flag = false;
        if (bluetoothheadset != null)
        {
            List list = mBluetoothHeadset.getConnectedDevices();
            int i = list.size();
            flag = false;
            if (i > 0)
            {
                BluetoothDevice bluetoothdevice = (BluetoothDevice)list.get(0);
                flag = true;
                log((new StringBuilder()).append("  - headset state = ").append(mBluetoothHeadset.getConnectionState(bluetoothdevice)).toString());
                log((new StringBuilder()).append("  - headset address: ").append(bluetoothdevice).toString());
                log((new StringBuilder()).append("  - isConnected: ").append(flag).toString());
            }
        }
        log((new StringBuilder()).append("  ==> ").append(flag).toString());
        return flag;
    }

    boolean isDialerOpened()
    {
        return mDialer != null && mDialer.isOpened();
    }

    boolean isForegroundActivity()
    {
        return mIsForegroundActivity;
    }

    boolean isForegroundActivityForProximity()
    {
        return mIsForegroundActivityForProximity;
    }

    boolean isKeyEventAcceptableDTMF(KeyEvent keyevent)
    {
        return mDialer != null && mDialer.isKeyEventAcceptable(keyevent);
    }

    boolean isManageConferenceMode()
    {
        return mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.MANAGE_CONFERENCE;
    }

    boolean isNeedToUpdateInCallNotification()
    {
        Iterator iterator = ((ActivityManager)getApplicationContext().getSystemService("activity")).getRunningTasks(1).iterator();
        boolean flag1;
        do
        {
            boolean flag = iterator.hasNext();
            flag1 = false;
            if (!flag)
                break;
            android.app.ActivityManager.RunningTaskInfo runningtaskinfo = (android.app.ActivityManager.RunningTaskInfo)iterator.next();
            String s = runningtaskinfo.topActivity.getClassName();
            log("start dump");
            log((new StringBuilder()).append("info.baseActivity.getPackageName() ").append(runningtaskinfo.baseActivity.getPackageName()).toString());
            log((new StringBuilder()).append("info.topActivity.getClassName() ").append(s).toString());
            log("stop dump");
            if (!"com.android.phone.InCallScreen".equals(s))
                continue;
            flag1 = true;
            break;
        } while (true);
        return !flag1;
    }

    public boolean isOtaCallInActiveState()
    {
        return mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL || mApp.cdmaOtaScreenState != null && mApp.cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION;
    }

    public boolean isOtaCallInEndState()
    {
        return mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_ENDED;
    }

    public boolean isPhoneStateRestricted()
    {
        boolean flag;
label0:
        {
            if (GeminiUtils.isGeminiSupport())
            {
                boolean flag2 = false;
                boolean flag3 = false;
                int ai[] = GeminiUtils.getSlots();
                int j = ai.length;
                int k = 0;
                do
                {
                    if (k >= j)
                        break;
                    int l = ai[k];
                    int i1 = ((GeminiPhone)mPhone).getServiceStateGemini(l).getState();
                    if (i1 == 2)
                        flag2 = true;
                    if (i1 == 1)
                        flag3 = true;
                    if (flag2 && flag3)
                        break;
                    k++;
                } while (true);
                return flag2 || flag3 || PhoneGlobals.getInstance().getKeyguardManager().inKeyguardRestrictedInputMode();
            }
            int i = mCM.getServiceState();
            if (i != 2 && i != 1)
            {
                boolean flag1 = mApp.getKeyguardManager().inKeyguardRestrictedInputMode();
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    public boolean isPhoneStateRestricted(int i)
    {
        boolean flag;
label0:
        {
            if (GeminiUtils.isGeminiSupport())
            {
                int k = ((GeminiPhone)mPhone).getServiceStateGemini(i).getState();
                log((new StringBuilder()).append("isPhoneStateRestricted - sim : ").append(i).append(" state: ").append(k).toString());
                return k == 2 || k == 1 || PhoneGlobals.getInstance().getKeyguardManager().inKeyguardRestrictedInputMode();
            }
            int j = mCM.getServiceState();
            if (j != 2 && j != 1)
            {
                boolean flag1 = PhoneGlobals.getInstance().getKeyguardManager().inKeyguardRestrictedInputMode();
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    public boolean isQuickResponseDialogShowing()
    {
        return mRespondViaSmsManager != null && mRespondViaSmsManager.isShowingPopup();
    }

    public boolean isVTInCallScreenOn()
    {
        return false;
    }

    BroadcastReceiver mLocaleChangeReceiverOnlyForTest()
    {
        return mLocaleChangeReceiver;
    }

    boolean okToDialDTMFTones()
    {
        boolean flag = mCM.hasActiveRingingCall();
        com.android.internal.telephony.Call.State state = mCM.getActiveFgCall().getState();
        com.android.internal.telephony.Call.State state1 = mCM.getFirstActiveBgCall().getState();
        boolean flag1;
        if (mApp.inCallUiState.inCallScreenMode != InCallUiState.InCallScreenMode.MANAGE_CONFERENCE)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if ((state == com.android.internal.telephony.Call.State.ACTIVE || state == com.android.internal.telephony.Call.State.ALERTING || state1 == com.android.internal.telephony.Call.State.HOLDING) && !flag && flag1)
            flag2 = true;
        else
            flag2 = false;
        log((new StringBuilder()).append("[okToDialDTMFTones] foreground state: ").append(state).append(", background state: ").append(state1).append(", ringing state: ").append(flag).append(", call screen mode: ").append(mApp.inCallUiState.inCallScreenMode).append(", result: ").append(flag2).toString());
        return flag2 || mSpeechEnabled && flag1 && !flag;
    }

    boolean okToShowDialpad()
    {
        com.android.internal.telephony.Call.State state = mCM.getActiveFgCallState();
        return okToDialDTMFTones() || state == com.android.internal.telephony.Call.State.DIALING;
    }

    boolean okToShowFTAMenu()
    {
        log("okToAcceptWaitingAndHangupActive");
        boolean flag;
        if (GeminiUtils.isGeminiSupport())
        {
            int i = GeminiUtils.getSlotNotIdle(PhoneGlobals.getInstance().phone);
            log((new StringBuilder()).append("slot = ").append(i).toString());
            flag = false;
            if (i != -1)
                flag = PhoneGlobals.getInstance().phoneMgr.isTestIccCardGemini(i);
        } else
        {
            flag = PhoneGlobals.getInstance().phoneMgr.isTestIccCard();
        }
        log((new StringBuilder()).append("retval = ").append(flag).toString());
        return flag;
    }

    public void onBackPressed()
    {
        log("onBackPressed()...");
        if (mCM.hasActiveRingingCall())
        {
            log("BACK key while ringing: ignored");
            return;
        }
        if (mDialer.isOpened())
        {
            closeDialpadInternal(true);
            return;
        }
        if (mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.MANAGE_CONFERENCE)
        {
            setInCallScreenMode(InCallUiState.InCallScreenMode.NORMAL);
            requestUpdateScreen();
            return;
        } else
        {
            super.onBackPressed();
            return;
        }
    }

    public void onClick(View view)
    {
        int i = view.getId();
        log((new StringBuilder()).append("onClick(View ").append(view).append(", id ").append(i).append(")...").toString());
        switch (i)
        {
        case 2131230966: 
            long l = SystemClock.uptimeMillis();
            if (mInCallControlState.canSwap && l - mLastClickActionTime > 1000L)
            {
                internalSwapCalls();
                mLastClickActionTime = l;
                log("Respond the swap click action.");
            } else
            {
                log("Ignore the swap click action.");
            }
            break;

        case 2131230893: 
            log("onClick: mButtonManageConferenceDone...");
            setInCallScreenMode(InCallUiState.InCallScreenMode.NORMAL);
            requestUpdateScreen();
            break;

        default:
            if ((mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL || mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_ENDED) && mApp.otaUtils != null)
                mApp.otaUtils.onClickHandler(i);
            else
                Log.w("InCallScreen", (new StringBuilder()).append("onClick: unexpected click from ID ").append(i).append(" (View = ").append(view).append(")").toString());
            break;
        }
        Object aobj[] = new Object[1];
        Object obj;
        if (view instanceof TextView)
            obj = ((TextView)view).getText();
        else
            obj = "";
        aobj[0] = obj;
        EventLog.writeEvent(0x1129f, aobj);
        mApp.pokeUserActivity();
    }

    protected void onCreate(Bundle bundle)
    {
        Log.i("InCallScreen", (new StringBuilder()).append("onCreate()...  this = ").append(this).toString());
        mServiceStateExt = (IServiceStateExt)MediatekClassFactory.createInstance(com/mediatek/common/telephony/IServiceStateExt, new Object[] {
            this
        });
        Profiler.callScreenOnCreate();
        super.onCreate(bundle);
        if (!PhoneGlobals.sVoiceCapable)
        {
            Log.wtf("InCallScreen", "onCreate() reached on non-voice-capable device");
            finish();
            return;
        }
        mApp = PhoneGlobals.getInstance();
        mApp.setInCallScreenInstance(this);
        int i = 0x280000;
        if (mApp.getPhoneState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
        {
            log("onCreate: set window FLAG_DISMISS_KEYGUARD flag ");
            if (!PhoneUtils.isDMLocked())
                i |= 0x400000;
        }
        android.view.WindowManager.LayoutParams layoutparams = getWindow().getAttributes();
        layoutparams.flags = i | layoutparams.flags;
        if (!mApp.proximitySensorModeEnabled())
            layoutparams.inputFeatures = 4 | layoutparams.inputFeatures;
        getWindow().setAttributes(layoutparams);
        mCM = mApp.mCM;
        mCMGemini = mApp.mCMGemini;
        log((new StringBuilder()).append("- onCreate: phone state = ").append(mCM.getState()).toString());
        setPhone(mApp.phone);
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBluetoothAdapter != null)
            mBluetoothAdapter.getProfileProxy(this, mBluetoothProfileServiceListener, 1);
        requestWindowFeature(1);
        mExtension = ExtensionManager.getInstance().getInCallScreenExtension();
        mExtension.onCreate(bundle, this, this, mCM);
        setContentView(0x7f04001c);
        initInCallScreen();
        initPolicyManager();
        registerForPhoneStates();
        if (bundle == null)
        {
            log("onCreate(): this is our very first launch, checking intent...");
            internalResolveIntent(getIntent());
        }
        if (VTInCallScreenFlags.getInstance().mVTIsInflate && mVTInCallScreen != null)
        {
            log("onCreate(): VTInCallScreen already inflated before destroy, inflate again");
            mVTInCallScreen.initVTInCallScreen();
        }
        Profiler.callScreenCreated();
        registerReceiver(mLocaleChangeReceiver, new IntentFilter("android.intent.action.LOCALE_CHANGED"));
        IntentFilter intentfilter = new IntentFilter(ACTION_LOCKED);
        intentfilter.addAction(ACTION_UNLOCK);
        registerReceiver(mDMLockReceiver, intentfilter);
        mHandler.sendEmptyMessageDelayed(125, 2000L);
        registerReceiver(mReceiver, new IntentFilter("android.intent.action.HEADSET_PLUG"));
        PhoneRecorderHandler.getInstance().setListener(this);
        amendLayoutForDifferentScreen();
        log("onCreate(): exit");
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        if (ViewConfiguration.get(this).hasPermanentMenuKey())
            (new MenuInflater(this)).inflate(0x7f100002, menu);
        return true;
    }

    protected void onDestroy()
    {
        Log.i("InCallScreen", (new StringBuilder()).append("onDestroy()...  this = ").append(this).toString());
        super.onDestroy();
        mIsDestroyed = true;
        unregisterReceiver(mLocaleChangeReceiver);
        unregisterReceiver(mDMLockReceiver);
        mApp.clearInCallScreenInstance(this);
        PhoneRecorderHandler.getInstance().clearListener(this);
        if (mCallCard != null)
            mCallCard.setInCallScreenInstance(null);
        if (mInCallTouchUi != null)
            mInCallTouchUi.setInCallScreenInstance(null);
        mRespondViaSmsManager.setInCallScreenInstance(null);
        if (mCallTime != null)
        {
            mCallTime.cancelTimer();
            mCallTime.setCallTimeListener(null);
        }
        mDialer.clearInCallScreenReference();
        mDialer = null;
        unregisterForPhoneStates();
        if (mBluetoothHeadset != null)
        {
            mBluetoothAdapter.closeProfileProxy(1, mBluetoothHeadset);
            mBluetoothHeadset = null;
        }
        unregisterReceiver(mReceiver);
        dismissAllDialogs();
        if (mApp.otaUtils != null)
            mApp.otaUtils.clearUiWidgets();
        mExtension.onDestroy(this);
    }

    void onDialerClose(boolean flag)
    {
        log("onDialerClose()...");
        if ((mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL || mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_ENDED || mApp.cdmaOtaScreenState != null && mApp.cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION) && mApp.otaUtils != null)
            mApp.otaUtils.otaShowProperScreen();
        updateInCallTouchUi();
        updateCallCardVisibilityPerDialerState(flag);
        mApp.pokeUserActivity();
        requestUpdateScreen();
    }

    void onDialerOpen(boolean flag)
    {
        log("onDialerOpen()...");
        updateInCallTouchUi();
        updateCallCardVisibilityPerDialerState(flag);
        mApp.pokeUserActivity();
        if ((mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL || mApp.inCallUiState.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_ENDED) && mApp.otaUtils != null)
            mApp.otaUtils.hideOtaScreen();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
label0:
        {
label1:
            {
label2:
                {
label3:
                    {
                        log((new StringBuilder()).append("onKeyDown(keycode ").append(i).append(")...").toString());
                        if (Constants.VTScreenMode.VT_SCREEN_CLOSE == mVTInCallScreen.getVTScreenMode() && mVTInCallScreen.onKeyDown(i, keyevent))
                            break label2;
                        restartLockScreenTimer();
                        switch (i)
                        {
                        default:
                            break;

                        case 3: // '\003'
                            break label0;

                        case 5: // '\005'
                            break label3;

                        case 27: // '\033'
                            break label2;

                        case 68: // 'D'
                            log("------------ Temp testing -----------------");
                            return true;

                        case 70: // 'F'
                            log("----------- InCallScreen call state dump --------------");
                            PhoneUtils.dumpCallState(mPhone);
                            PhoneUtils.dumpCallManager();
                            return true;

                        case 76: // 'L'
                            log("----------- InCallScreen View dump --------------");
                            getWindow().getDecorView().debug();
                            return true;

                        case 91: // '['
                            onMuteClick();
                            return true;

                        case 4: // '\004'
                            if (mDialer.isOpened())
                            {
                                log("mDialer.isOpened(): DTMFTwelveKeyDialer is opened");
                                closeDialpadInternal(true);
                                return true;
                            }
                            break;

                        case 24: // '\030'
                        case 25: // '\031'
                        case 164: 
                            if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING)
                            {
                                Log.w("InCallScreen", "VOLUME key: incoming call is ringing! (PhoneWindowManager should have handled this key.)");
                                internalSilenceRinger();
                                return true;
                            }
                            break;
                        }
                        if (keyevent.getRepeatCount() != 0 || !handleDialerKeyDown(i, keyevent))
                            return super.onKeyDown(i, keyevent);
                        break label2;
                    }
                    if (keyevent.getRepeatCount() != 0)
                        break label1;
                    log(" onKeyDown() KEYCODE_CALL RepeatCount is 0 ...");
                    if (!handleCallKey())
                    {
                        Log.w("InCallScreen", "InCallScreen should always handle KEYCODE_CALL in onKeyDown");
                        return true;
                    }
                }
                return true;
            }
            log(" onKeyDown() KEYCODE_CALL long press");
            return true;
        }
        log("ignore KEYCODE_HOME");
        return true;
    }

    public boolean onKeyLongPress(int i, KeyEvent keyevent)
    {
        if (i == 4 && mRingingCall != null && !mRingingCall.isIdle() && (mForegroundCall == null || mForegroundCall.isIdle()) && (mBackgroundCall == null || mBackgroundCall.isIdle()))
        {
            log("onKeyLongPress(), hangupRingingCall");
            hangupRingingCall();
        }
        return true;
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        if ((mDialer == null || !mDialer.onDialerKeyUp(keyevent)) && i != 5)
            return super.onKeyUp(i, keyevent);
        else
            return true;
    }

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        return handleOnScreenMenuItemClick(menuitem);
    }

    public void onMuteClick()
    {
        boolean flag;
        if (!PhoneUtils.getMute())
            flag = true;
        else
            flag = false;
        log((new StringBuilder()).append("onMuteClick(): newMuteState = ").append(flag).toString());
        PhoneUtils.setMute(flag);
    }

    protected void onNewIntent(Intent intent)
    {
        log((new StringBuilder()).append("onNewIntent: intent = ").append(intent).append(", phone state = ").append(mCM.getState()).toString());
        setIntent(intent);
        internalResolveIntent(intent);
    }

    public void onOpenCloseDialpad()
    {
        log("onOpenCloseDialpad()...");
        if (mDialer.isOpened())
            closeDialpadInternal(true);
        else
            openDialpadInternal(true);
        mApp.updateProximitySensorMode(mCM.getState());
        restartLockScreenTimer();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (mVTInCallScreen.getVTScreenMode() != Constants.VTScreenMode.VT_SCREEN_OPEN)
        {
            if (mExtension.handleOnScreenMenuItemClick(menuitem))
                return true;
            else
                return handleOnScreenMenuItemClick(menuitem);
        } else
        {
            return mVTInCallScreen.handleOnScreenMenuItemClick(menuitem);
        }
    }

    protected void onPause()
    {
        log("onPause()...");
        super.onPause();
        if (mPowerManager.isScreenOn())
            mIsForegroundActivityForProximity = false;
        mIsForegroundActivity = false;
        mApp.notificationMgr.updateInCallNotification();
        log("- remove DELAY_TO_FINISH_INCALLSCREEN:");
        mHandler.removeMessages(203);
        mApp.inCallUiState.providerInfoVisible = false;
        mApp.inCallUiState.showAlreadyDisconnectedState = false;
        mApp.setBeginningCall(false);
        mManageConferenceUtils.stopConferenceTime();
        mDialer.onDialerKeyUp(null);
        mDialer.stopDialerSession();
        cancelLockScreenTimer();
        if ((mHandler.hasMessages(108) || mHandler.hasMessages(147)) && mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            log("DELAYED_CLEANUP_AFTER_DISCONNECT detected, moving UI to background.");
            endInCallScreenSession();
        }
        EventLog.writeEvent(0x1129e, new Object[0]);
        dismissAllDialogs();
        updateExpandedViewState();
        mApp.notificationMgr.statusBarHelper.enableSystemBarNavigation(true);
        mApp.updateWakeState();
        if (mCM.getState() != com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
        {
            Log.d("InCallScreen", "----------lijian-----------on pause");
            updateKeyguardPolicy(false);
        }
        if (mApp.getUpdateLock().isHeld() && mApp.getPhoneState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            log("Release UpdateLock on onPause() because there's no active phone call.");
            mApp.getUpdateLock().release();
        }
        if (mPopupMenu != null)
            mPopupMenu.dismiss();
        if (mInCallTouchUi != null)
            mInCallTouchUi.dismissAudioModePopup();
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        if (mVTInCallScreen.getVTScreenMode() == Constants.VTScreenMode.VT_SCREEN_OPEN && mVTInCallScreen.onPrepareOptionsMenu(menu))
            return false;
        if (ViewConfiguration.get(this).hasPermanentMenuKey())
        {
            for (int i = 0; i < menu.size(); i++)
                menu.getItem(i).setVisible(false);

            if (mVTInCallScreen.getVTScreenMode() != Constants.VTScreenMode.VT_SCREEN_OPEN)
            {
                setupMenuItems(menu);
                mExtension.setupMenuItems(menu, getUpdatedInCallControlState());
            } else
            {
                mVTInCallScreen.setupMenuItems(menu);
            }
        }
        return true;
    }

    protected void onResume()
    {
        log("onResume()...");
        super.onResume();
        dismissDialogs();
        restartLockScreenTimer();
        mIsForegroundActivity = true;
        mIsForegroundActivityForProximity = true;
        if (DualTalkUtils.isSupportDualTalk() && mDualTalk == null)
            mDualTalk = DualTalkUtils.getInstance();
        if (mCM.hasActiveFgCall() || mCM.hasActiveBgCall() || mCM.hasActiveRingingCall())
            mApp.inCallUiState.showAlreadyDisconnectedState = false;
        InCallUiState incalluistate = mApp.inCallUiState;
        if (mLocaleChanged)
        {
            mLocaleChanged = false;
            mCallCard.updateForLanguageChange();
            mVTInCallScreen.notifyLocaleChange();
            ManageConferenceUtils.sLocalChanged = true;
        }
        updateExpandedViewState();
        mApp.notificationMgr.updateInCallNotification();
        mDialer.startDialerSession();
        if (incalluistate.showDialpad)
            openDialpadInternal(false);
        else
            closeDialpadInternal(false);
        mDialer.setDialpadContext(incalluistate.dialpadContextText);
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
        {
            Call call;
            if (DualTalkUtils.isSupportDualTalk())
                call = mDualTalk.getActiveFgCall();
            else
                call = mCM.getActiveFgCall();
            android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
            Connection connection = call.getEarliestConnection();
            if (siminfo != null && connection != null && !PhoneUtils.isVoicemailNumber(connection.getAddress(), siminfo.mSlot, mCM.getFgPhone()))
                mDialer.setDialpadContext("");
        }
        mRespondViaSmsManager.dismissPopup();
        mShowStatusIndication = false;
        boolean flag = incalluistate.hasPendingCallStatusCode();
        boolean flag1 = false;
        if (flag)
        {
            log("- onResume: need to show status indication!");
            mShowStatusIndication = true;
            showStatusIndication(incalluistate.getPendingCallStatusCode());
            flag1 = true;
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.SUCCESS);
        }
        if (isBluetoothAudioConnected())
            setVolumeControlStream(6);
        else
            setVolumeControlStream(0);
        takeKeyEvents(true);
        boolean flag2 = TelephonyCapabilities.supportsOtasp(mPhone);
        boolean flag3 = false;
        if (flag2)
            flag3 = checkOtaspStateOnResume();
        if (!flag3)
            setInCallScreenMode(InCallUiState.InCallScreenMode.NORMAL);
        mCM.clearDisconnected();
        setOnAnswerAndEndFlag(false);
        SyncWithPhoneStateStatus syncwithphonestatestatus = syncWithPhoneState();
        if (syncwithphonestatestatus != SyncWithPhoneStateStatus.SUCCESS)
        {
            log((new StringBuilder()).append("- onResume: syncWithPhoneState failed! status = ").append(syncwithphonestatestatus).toString());
            if (flag1)
            {
                Log.i("InCallScreen", "  ==> syncWithPhoneState failed, but staying here anyway.");
            } else
            {
                Log.i("InCallScreen", "  ==> syncWithPhoneState failed; bailing out!");
                dismissAllDialogs();
                if (!InCallUiState.isNormalInCallScreenState())
                {
                    Log.d("InCallScreen", "  ==> syncWithPhoneState failed; not in normal status!");
                    endInCallScreenSession(true);
                    InCallUiState.sLastInCallScreenStatus = -1;
                } else
                {
                    mApp.inCallUiState.delayFinished = true;
                    mHandler.sendEmptyMessageDelayed(203, 2000L);
                }
                adjustProcessPriority();
                return;
            }
        } else
        if (TelephonyCapabilities.supportsOtasp(mPhone) && (incalluistate.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL || incalluistate.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_ENDED))
        {
            if (mCallCard != null)
                mCallCard.setVisibility(8);
            updateScreen();
            adjustProcessPriority();
            return;
        }
        mApp.inCallUiState.delayFinished = false;
        InCallUiState.sLastInCallScreenStatus = -1;
        EventLog.writeEvent(0x1129d, new Object[0]);
        mApp.updateWakeState();
        if (mApp.getRestoreMuteOnInCallResume())
        {
            PhoneUtils.restoreMuteState();
            mApp.setRestoreMuteOnInCallResume(false);
        }
        Profiler.profileViewCreate(getWindow(), com/android/phone/InCallScreen.getName());
        if (GeminiUtils.isGeminiSupport())
        {
            int i = -1;
            int j = -1;
            int ai[] = GeminiUtils.getSlots();
            int k = 0;
label0:
            do
            {
label1:
                {
                    if (k < ai.length)
                    {
                        if (((GeminiPhone)mPhone).getPendingMmiCodesGemini(ai[k]).isEmpty())
                            break label1;
                        i = ai[k];
                        j = PhoneGlobals.MMI_CANCEL_GEMINI[k];
                    }
                    if (-1 != i && mMmiStartedDialog == null)
                        mMmiStartedDialog = PhoneUtils.displayMMIInitiate(this, (MmiCode)((GeminiPhone)mPhone).getPendingMmiCodesGemini(i).get(0), Message.obtain(mHandler, j), mMmiStartedDialog);
                    break label0;
                }
                k++;
            } while (true);
        } else
        if (!mPhone.getPendingMmiCodes().isEmpty() && mMmiStartedDialog == null)
            mMmiStartedDialog = PhoneUtils.displayMMIInitiate(this, (MmiCode)mPhone.getPendingMmiCodes().get(0), Message.obtain(mHandler, 53), mMmiStartedDialog);
        if (mApp.inCallUiState.showAlreadyDisconnectedState)
        {
            log("onResume(): detected \"show already disconnected state\" situation. set up DELAYED_CLEANUP_AFTER_DISCONNECT message with 2000 msec delay.");
            mHandler.removeMessages(108);
            mHandler.sendEmptyMessageDelayed(108, 2000L);
        }
        mHandler.sendEmptyMessageDelayed(125, 2000L);
        initVTAutoAnswer();
        mIsForegroundActivity = true;
        if (mHandler != null)
            mHandler.sendEmptyMessageDelayed(130, 500L);
        Log.i("InCallScreen", (new StringBuilder()).append("[mtk performance result]:").append(System.currentTimeMillis()).toString());
        log("onResume() done.");
        adjustProcessPriority();
    }

    public void onShow(DialogInterface dialoginterface)
    {
        log("clear mShowStatusIndication remove DELAY_TO_FINISH_INCALLSCREEN");
        mHandler.removeMessages(203);
        mShowStatusIndication = false;
    }

    protected void onStart()
    {
        super.onStart();
    }

    protected void onStop()
    {
        log("onStop()...");
        super.onStop();
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        log((new StringBuilder()).append("onStop: state = ").append(state).toString());
        if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            if (mRespondViaSmsManager.isShowingPopup())
                mRespondViaSmsManager.dismissPopup();
            if (mApp.cdmaOtaProvisionData != null && mApp.cdmaOtaScreenState != null && mApp.cdmaOtaScreenState.otaScreenState != OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION && mApp.cdmaOtaScreenState.otaScreenState != OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_SUCCESS_FAILURE_DLG && !mApp.cdmaOtaProvisionData.inOtaSpcState)
            {
                log("- onStop: calling finish() to clear activity history...");
                moveTaskToBack(true);
                if (mApp.otaUtils != null)
                    mApp.otaUtils.cleanOtaScreen(true);
            }
            if (isBluetoothAvailable() && isBluetoothAudioConnected())
            {
                log("Call disconnectBluetoothAudio from onStop()");
                disconnectBluetoothAudio();
            }
        }
        mVTInCallScreen.onStop();
    }

    public void onStorageFull()
    {
        log("onStorageFull");
        handleStorageFull(false);
    }

    void onSuppCrssSuppServiceNotification(AsyncResult asyncresult)
    {
        SuppCrssNotification suppcrssnotification = (SuppCrssNotification)asyncresult.result;
        log((new StringBuilder()).append("SuppCrssNotification: ").append(suppcrssnotification).toString());
        switch (suppcrssnotification.code)
        {
        case 3: // '\003'
            doSuppCrssSuppServiceNotification(PhoneNumberUtils.stringFromStringAndTOA(suppcrssnotification.number, suppcrssnotification.type));
            return;

        case 2: // '\002'
            doSuppCrssSuppServiceNotificationforInComing();
            return;

        case 1: // '\001'
            doSuppCrssSuppServiceNotification(suppcrssnotification.number);
            return;

        case 0: // '\0'
        default:
            return;
        }
    }

    void onSuppServiceFailed(AsyncResult asyncresult)
    {
        com.android.internal.telephony.Phone.SuppService suppservice = (com.android.internal.telephony.Phone.SuppService)asyncresult.result;
        log((new StringBuilder()).append("onSuppServiceFailed: ").append(suppservice).toString());
        int i;
        switch (_cls33..SwitchMap.com.android.internal.telephony.Phone.SuppService[suppservice.ordinal()])
        {
        case 6: // '\006'
            i = 0x7f0d02e0;
            break;

        case 5: // '\005'
            i = 0x7f0d02df;
            break;

        case 4: // '\004'
            i = 0x7f0d02de;
            break;

        case 3: // '\003'
            i = 0x7f0d02dd;
            break;

        case 2: // '\002'
            i = 0x7f0d02dc;
            break;

        case 1: // '\001'
            if (PhoneUtils.getPhoneSwapStatus())
                PhoneUtils.setPhoneSwapStatus(false);
            i = 0x7f0d02db;
            if (DualTalkUtils.isSupportDualTalk() && mDualTalk != null && mDualTalk.isCdmaAndGsmActive())
            {
                log("onSuppServiceFailed: can't hold, so hangup!");
                PhoneUtils.hangup(mCM.getActiveFgCall());
                Toast.makeText(this, 0x7f0d0080, 1).show();
                return;
            }
            handleSwitchFailed();
            break;

        default:
            i = 0x7f0d02da;
            break;
        }
        if (mSuppServiceFailureDialog != null)
        {
            log("- DISMISSING mSuppServiceFailureDialog.");
            mSuppServiceFailureDialog.dismiss();
            mSuppServiceFailureDialog = null;
        }
        mSuppServiceFailureDialog = (new android.app.AlertDialog.Builder(this)).setMessage(i).setPositiveButton(0x7f0d0192, null).create();
        mSuppServiceFailureDialog.getWindow().addFlags(4);
        mSuppServiceFailureDialog.show();
        String s = SystemProperties.get("ro.build.characteristics");
        if (s != null && s.equals("tablet"))
            switch (_cls33..SwitchMap.com.android.internal.telephony.Phone.SuppService[suppservice.ordinal()])
            {
            case 1: // '\001'
                if (mInCallTouchUi != null)
                {
                    log((new StringBuilder()).append("onSuppServiceFailed: ").append(suppservice).append(" cancelIncomingCallActionTime").toString());
                    mInCallTouchUi.cancelIncomingCallActionTime();
                    return;
                }
                break;
            }
    }

    void onSuppServiceNotification(AsyncResult asyncresult)
    {
        SuppServiceNotification suppservicenotification = (SuppServiceNotification)asyncresult.result;
        log((new StringBuilder()).append("onSuppServiceNotification: ").append(suppservicenotification).toString());
        String s;
        if (suppservicenotification.notificationType == 0)
        {
            s = getSuppServiceMOStringId(suppservicenotification);
        } else
        {
            int i = suppservicenotification.notificationType;
            s = null;
            if (i == 1)
            {
                String s1 = "";
                String s2 = getSuppServiceMTStringId(suppservicenotification);
                if (suppservicenotification.type == 145 && suppservicenotification.number != null && suppservicenotification.number.length() != 0)
                    s1 = (new StringBuilder()).append(" +").append(suppservicenotification.number).toString();
                s = (new StringBuilder()).append(s2).append(s1).toString();
            }
        }
        Toast.makeText(this, s, 1).show();
    }

    public void onTickForCallTimeElapsed(long l)
    {
        if (!VTCallUtils.isVideoCall(mCM.getActiveFgCall()))
        {
            mCallCard.updateElapsedTimeWidget(l);
            return;
        } else
        {
            mVTInCallScreen.updateElapsedTime(l);
            return;
        }
    }

    void onVoiceRecordClick(MenuItem menuitem)
    {
        log("onVoiceRecordClick");
        String s = menuitem.getTitle().toString();
        if (s != null && okToRecordVoice())
        {
            if (!PhoneUtils.isExternalStorageMounted())
            {
                Toast.makeText(this, getResources().getString(0x7f0d000c), 1).show();
                return;
            }
            if (!PhoneUtils.diskSpaceAvailable(0x200000L))
            {
                handleStorageFull(true);
                return;
            }
            PhoneRecorder phonerecorder = PhoneRecorder.getInstance(getApplicationContext());
            if (s.equals(getString(0x7f0d0007)))
            {
                log("want to startRecord");
                if (!phonerecorder.ismFlagRecord())
                {
                    log("startRecord");
                    startRecord();
                    return;
                }
            } else
            if (s.equals(getString(0x7f0d0008)))
            {
                log("want to stopRecord");
                if (phonerecorder.ismFlagRecord())
                {
                    log("stopRecord");
                    stopRecord();
                    return;
                }
            }
        }
    }

    public void onWindowFocusChanged(boolean flag)
    {
        log((new StringBuilder()).append("onWindowFocusChanged(").append(flag).append(")...").toString());
        if (!flag && mDialer != null)
        {
            log("- onWindowFocusChanged: faking onDialerKeyUp()...");
            mDialer.onDialerKeyUp(null);
        }
    }

    public void rejectIncomingCallByVoiceCommand()
    {
        log("rejectIncomingCallByVoiceCommand");
        handleOnscreenButtonClick(0x7f080009);
    }

    void requestCloseOtaFailureNotice(long l)
    {
        log((new StringBuilder()).append("requestCloseOtaFailureNotice() with timeout: ").append(l).toString());
        mHandler.sendEmptyMessageDelayed(119, l);
    }

    void requestCloseSpcErrorNotice(long l)
    {
        log((new StringBuilder()).append("requestCloseSpcErrorNotice() with timeout: ").append(l).toString());
        mHandler.sendEmptyMessageDelayed(118, l);
    }

    void requestRemoveProviderInfoWithDelay()
    {
        mHandler.removeMessages(121);
        Message message = Message.obtain(mHandler, 121);
        mHandler.sendMessageDelayed(message, 5000L);
        log("Requested to remove provider info after 5000 msec.");
    }

    void requestUpdateBluetoothIndication()
    {
        log("requestUpdateBluetoothIndication()...");
        mHandler.removeMessages(114);
        mHandler.sendEmptyMessage(114);
    }

    void requestUpdateBluetoothIndication(int i)
    {
        log((new StringBuilder()).append("requestUpdateBluetoothIndication()... bluetoothHeadsetAudioState= ").append(i).toString());
        if (10 == i)
            mBluetoothConnectionPending = false;
        requestUpdateBluetoothIndication();
    }

    public void requestUpdateRecordState(int i, int j)
    {
        log((new StringBuilder()).append("phone record custom value is").append(j).toString());
        if (j == 0)
            updateVoiceCallRecordState(i);
        else
        if (1 == j)
        {
            mVTInCallScreen.updateVideoCallRecordState(i);
            return;
        }
    }

    public void requestUpdateScreen()
    {
        log("requestUpdateScreen()...");
        mHandler.removeMessages(122);
        if (ignoreUpdateScreen())
        {
            log("ignoreUpdateScreen");
            return;
        } else
        {
            mHandler.sendEmptyMessage(122);
            return;
        }
    }

    void requestUpdateScreenDelay(long l)
    {
        log("requestUpdateScreenDelay()...");
        mHandler.removeMessages(122);
        mHandler.removeMessages(204);
        if (ignoreUpdateScreen())
        {
            log("ignoreUpdateScreen");
            return;
        } else
        {
            mHandler.sendMessageDelayed(mHandler.obtainMessage(204), l);
            return;
        }
    }

    public void resetInCallScreenMode()
    {
        log("resetInCallScreenMode: setting mode to UNDEFINED...");
        setInCallScreenMode(InCallUiState.InCallScreenMode.UNDEFINED);
    }

    public void restartLockScreenTimer()
    {
        if (delayTime_disableTouch.booleanValue() && !isVTInCallScreenOn())
        {
            Log.d("lockNow", (new StringBuilder()).append("in restartLockScreenTimer mForegroundCall = !!!").append(CallManager.getInstance().getActiveFgCall().getState()).toString());
            if (CallManager.getInstance().getActiveFgCall().getState() == com.android.internal.telephony.Call.State.ACTIVE)
            {
                Log.d("lockNow", "reset lock time");
                cancelLockScreenTimer();
                delayStartLockScreen();
            }
        }
    }

    public void setInVoiceAnswerVideoCall(boolean flag)
    {
        log((new StringBuilder()).append("setInVoiceAnswerVideoCall() : ").append(flag).toString());
        if (flag)
        {
            VTInCallScreenFlags.getInstance().mVTVoiceAnswer = true;
            Connection connection = mRingingCall.getLatestConnection();
            VTInCallScreenFlags.getInstance().mVTVoiceAnswerPhoneNumber = connection.getAddress();
            mInVoiceAnswerVideoCall = true;
            mVTVoiceAnswerDialog = new ProgressDialog(this);
            mVTVoiceAnswerDialog.requestWindowFeature(1);
            mVTVoiceAnswerDialog.setMessage(getResources().getString(0x7f0d004a));
            mVTVoiceAnswerDialog.setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                final InCallScreen this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    delayedCleanupAfterDisconnect();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
);
            mVTVoiceAnswerDialog.show();
            mVTVoiceAnswerTimer = new Timer();
            mVTVoiceAnswerTimer.schedule(new TimerTask() {

                final InCallScreen this$0;

                public void run()
                {
                    mHandler.sendMessage(Message.obtain(mHandler, 161));
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
, 15000L);
        } else
        {
            mInVoiceAnswerVideoCall = false;
            if (mVTVoiceAnswerDialog != null)
            {
                mVTVoiceAnswerDialog.dismiss();
                mVTVoiceAnswerDialog = null;
            }
            if (mVTVoiceAnswerTimer != null)
            {
                mVTVoiceAnswerTimer.cancel();
                mVTVoiceAnswerTimer = null;
                return;
            }
        }
    }

    public void setOnAnswerAndEndFlag(boolean flag)
    {
        mOnAnswerandEndCall = flag;
    }

    void setPhone(Phone phone)
    {
        mPhone = phone;
        mForegroundCall = mCM.getActiveFgCall();
        mBackgroundCall = mCM.getFirstActiveBgCall();
        mRingingCall = mCM.getFirstActiveRingingCall();
    }

    void setSwappingCalls(boolean flag)
    {
        mSwappingCalls = flag;
    }

    public void showGenericErrorDialog(int i, boolean flag)
    {
        CharSequence charsequence = getResources().getText(i);
        log((new StringBuilder()).append("showGenericErrorDialog('").append(charsequence).append("')...").toString());
        if (mGenericErrorDialog != null && mGenericErrorDialog.isShowing())
        {
            log("already showing, skip...");
            return;
        }
        android.content.DialogInterface.OnClickListener onclicklistener;
        android.content.DialogInterface.OnCancelListener oncancellistener;
        android.content.DialogInterface.OnDismissListener ondismisslistener;
        if (flag)
        {
            onclicklistener = new android.content.DialogInterface.OnClickListener() {

                final InCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    bailOutAfterErrorDialog();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
            oncancellistener = new android.content.DialogInterface.OnCancelListener() {

                final InCallScreen this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    bailOutAfterErrorDialog();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
            ondismisslistener = new android.content.DialogInterface.OnDismissListener() {

                final InCallScreen this$0;

                public void onDismiss(DialogInterface dialoginterface)
                {
                    bailOutAfterErrorDialog();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
        } else
        {
            onclicklistener = new android.content.DialogInterface.OnClickListener() {

                final InCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    log("showGenericErrorDialog: receive click!");
                    dialoginterface.dismiss();
                    delayedCleanupAfterDisconnect();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
            oncancellistener = new android.content.DialogInterface.OnCancelListener() {

                final InCallScreen this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    log("showGenericErrorDialog: receive cancel!");
                    delayedCleanupAfterDisconnect();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
            ondismisslistener = new android.content.DialogInterface.OnDismissListener() {

                final InCallScreen this$0;

                public void onDismiss(DialogInterface dialoginterface)
                {
                    log("showGenericErrorDialog: dismiss!");
                    bailOutAfterErrorDialog();
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
        }
        mGenericErrorDialog = (new android.app.AlertDialog.Builder(this)).setMessage(charsequence).setPositiveButton(0x7f0d0192, onclicklistener).setOnCancelListener(oncancellistener).create();
        mGenericErrorDialog.setOnDismissListener(ondismisslistener);
        mGenericErrorDialog.setOnShowListener(this);
        mGenericErrorDialog.getWindow().addFlags(2);
        mGenericErrorDialog.show();
    }

    public void showStorageFullDialog(int i, boolean flag)
    {
        log("showStorageDialog... ");
        if (mStorageSpaceDialog != null && mStorageSpaceDialog.isShowing())
            return;
        CharSequence charsequence = getResources().getText(i);
        android.content.DialogInterface.OnCancelListener oncancellistener = new android.content.DialogInterface.OnCancelListener() {

            final InCallScreen this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
            }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
        }
;
        android.content.DialogInterface.OnClickListener onclicklistener = null;
        if (flag)
            onclicklistener = new android.content.DialogInterface.OnClickListener() {

                final InCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    log((new StringBuilder()).append("showStorageDialog... , on click, which=").append(j).toString());
                    if (mStorageSpaceDialog != null)
                        mStorageSpaceDialog.dismiss();
                    Intent intent = new Intent("android.settings.INTERNAL_STORAGE_SETTINGS");
                    startActivity(intent);
                }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
            }
;
        android.content.DialogInterface.OnClickListener onclicklistener1 = new android.content.DialogInterface.OnClickListener() {

            final InCallScreen this$0;

            public void onClick(DialogInterface dialoginterface, int j)
            {
                log((new StringBuilder()).append("showStorageDialog... , on click, which=").append(j).toString());
                if (mStorageSpaceDialog != null)
                    mStorageSpaceDialog.dismiss();
            }

            
            {
                this$0 = InCallScreen.this;
                super();
            }
        }
;
        CharSequence charsequence1;
        if (flag)
            charsequence1 = getResources().getText(0x7f0d0315);
        else
            charsequence1 = getResources().getText(0x7f0d0192);
        android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(this)).setMessage(charsequence).setIcon(0x1080027).setTitle(getResources().getText(0x7f0d0075)).setNegativeButton(charsequence1, onclicklistener1).setOnCancelListener(oncancellistener);
        if (flag)
            builder.setPositiveButton(getResources().getText(0x7f0d003a), onclicklistener);
        mStorageSpaceDialog = builder.create();
        mStorageSpaceDialog.getWindow().addFlags(2);
        mStorageSpaceDialog.setOnShowListener(this);
        mStorageSpaceDialog.show();
    }

    public void switchInCallAudio(InCallAudioMode incallaudiomode)
    {
        log((new StringBuilder()).append("switchInCallAudio: new mode = ").append(incallaudiomode).toString());
        switch (_cls33..SwitchMap.com.android.phone.InCallScreen.InCallAudioMode[incallaudiomode.ordinal()])
        {
        case 3: // '\003'
            if (isBluetoothAvailable() && isBluetoothAudioConnected())
                disconnectBluetoothAudio();
            if (PhoneUtils.isSpeakerOn(this))
                PhoneUtils.turnOnSpeaker(this, false, true);
            break;

        case 2: // '\002'
            if (isBluetoothAvailable() && !isBluetoothAudioConnected())
            {
                if (PhoneUtils.isSpeakerOn(this))
                    PhoneUtils.turnOnSpeaker(this, false, true);
                connectBluetoothAudio();
            }
            break;

        case 1: // '\001'
            if (!PhoneUtils.isSpeakerOn(this))
            {
                if (isBluetoothAvailable() && isBluetoothAudioConnected())
                    disconnectBluetoothAudio();
                PhoneUtils.turnOnSpeaker(this, true, true);
            }
            break;

        default:
            Log.wtf("InCallScreen", (new StringBuilder()).append("switchInCallAudio: unexpected mode ").append(incallaudiomode).toString());
            break;
        }
        if (mVTInCallScreen.getVTScreenMode() != Constants.VTScreenMode.VT_SCREEN_OPEN)
        {
            updateInCallTouchUi();
            return;
        } else
        {
            mVTInCallScreen.updateVTScreen(mVTInCallScreen.getVTScreenMode());
            return;
        }
    }

    public void toggleBluetooth()
    {
        log("toggleBluetooth()...");
        if (isBluetoothAvailable())
        {
            if (isBluetoothAudioConnected())
            {
                disconnectBluetoothAudio();
            } else
            {
                if (PhoneUtils.isSpeakerOn(this))
                    PhoneUtils.turnOnSpeaker(this, false, true);
                connectBluetoothAudio();
            }
        } else
        {
            Log.w("InCallScreen", "toggleBluetooth(): bluetooth is unavailable");
        }
        updateInCallTouchUi();
    }

    public void toggleSpeaker()
    {
        boolean flag;
        if (!PhoneUtils.isSpeakerOn(this))
            flag = true;
        else
            flag = false;
        log((new StringBuilder()).append("toggleSpeaker(): newSpeakerState = ").append(flag).toString());
        if (flag && isBluetoothAvailable() && isBluetoothAudioConnected())
            disconnectBluetoothAudio();
        PhoneUtils.turnOnSpeaker(this, flag, true);
        updateInCallTouchUi();
    }

    public void triggerTimerStartCount(Call call)
    {
        mCallTime.setActiveCallMode(call);
        mCallTime.reset();
        mCallTime.periodicUpdateTimer();
    }

    void tryToRestoreSlidingTab()
    {
        log("tryToRestoreSlidingTab");
        Call call = mCM.getActiveFgCall();
        Call call1 = mCM.getFirstActiveBgCall();
        Call call2 = mCM.getFirstActiveRingingCall();
        if (call != null)
            log((new StringBuilder()).append("fgCall : ").append(call.getState()).toString());
        if (call1 != null)
            log((new StringBuilder()).append("bgCall : ").append(call1.getState()).toString());
        if (call2 != null)
            log((new StringBuilder()).append("ringingCall : ").append(call2.getState()).toString());
        log((new StringBuilder()).append("mInCallTouchUi visibility = ").append(mInCallTouchUi.getVisibility()).toString());
        if (call != null && call1 != null && call2 != null && call.getState() != com.android.internal.telephony.Call.State.IDLE && call1.getState() == com.android.internal.telephony.Call.State.IDLE && call2.getState() == com.android.internal.telephony.Call.State.WAITING)
        {
            log("send FAKE_INCOMING_CALL_WIDGET message");
            Message message = mHandler.obtainMessage(160);
            mHandler.sendMessageDelayed(message, 600L);
        }
    }

    void updateAfterRadioTechnologyChange()
    {
        Log.d("InCallScreen", "updateAfterRadioTechnologyChange()...");
        resetInCallScreenMode();
        unregisterForPhoneStates();
        registerForPhoneStates();
        requestUpdateScreen();
    }

    void updateButtonStateOutsideInCallTouchUi()
    {
        if (mCallCard != null)
            mCallCard.setSecondaryCallClickable(mInCallControlState.canSwap);
    }

    public void updateCallTime()
    {
        log("updateCallTime()...");
        Call call = mCM.getActiveFgCall();
        if (mCM.hasActiveRingingCall())
            call = mCM.getFirstActiveRingingCall();
        com.android.internal.telephony.Call.State state = call.getState();
        switch (_cls33..SwitchMap.com.android.internal.telephony.Call.State[state.ordinal()])
        {
        case 3: // '\003'
        case 4: // '\004'
        case 5: // '\005'
        case 6: // '\006'
        case 7: // '\007'
        case 8: // '\b'
        case 9: // '\t'
            mCallTime.cancelTimer();
            return;

        case 1: // '\001'
            if (VTCallUtils.isVideoCall(call) && VTInCallScreenFlags.getInstance().mVTConnectionStarttime.mStarttime < 0L)
            {
                if (call.getLatestConnection() != null && call.getLatestConnection().isIncoming())
                {
                    mVTInCallScreen.onReceiveVTManagerStartCounter();
                    return;
                }
                break;
            }
            // fall through

        case 2: // '\002'
            log("updateCallTime: start periodicUpdateTimer");
            mCallTime.setActiveCallMode(call);
            mCallTime.reset();
            mCallTime.periodicUpdateTimer();
            return;

        default:
            Log.wtf("InCallScreen", (new StringBuilder()).append("updateCallTime: unexpected call state: ").append(state).toString());
            break;
        }
    }

    void updateIncomingCallWidgetHint(int i, int j)
    {
        log((new StringBuilder()).append("updateIncomingCallWidgetHint(").append(i).append(")...").toString());
        if (mCallCard != null)
        {
            mCallCard.setIncomingCallWidgetHint(i, j);
            mCallCard.updateState(mCM);
        }
    }

    void updateKeyguardPolicy(boolean flag)
    {
        log((new StringBuilder()).append("incallscreen: updateKeyguardPolicy() ,dismissKeyguard: ").append(flag).toString());
        if (flag)
        {
            log("updateKeyguardPolicy: set dismiss keyguard window flag ");
            getWindow().addFlags(0x400000);
            return;
        } else
        {
            log("updateKeyguardPolicy: clear dismiss keyguard window flag ");
            getWindow().clearFlags(0x400000);
            return;
        }
    }












/*
    static AlertDialog access$1602(InCallScreen incallscreen, AlertDialog alertdialog)
    {
        incallscreen.mPausePromptDialog = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$1802(InCallScreen incallscreen, AlertDialog alertdialog)
    {
        incallscreen.mSuppServiceFailureDialog = alertdialog;
        return alertdialog;
    }

*/





/*
    static boolean access$2102(InCallScreen incallscreen, boolean flag)
    {
        incallscreen.mSpeechEnabled = flag;
        return flag;
    }

*/






/*
    static boolean access$2602(boolean flag)
    {
        mLocaleChanged = flag;
        return flag;
    }

*/





/*
    static BluetoothHeadset access$2902(InCallScreen incallscreen, BluetoothHeadset bluetoothheadset)
    {
        incallscreen.mBluetoothHeadset = bluetoothheadset;
        return bluetoothheadset;
    }

*/




/*
    static EditText access$3002(InCallScreen incallscreen, EditText edittext)
    {
        incallscreen.mWildPromptText = edittext;
        return edittext;
    }

*/






/*
    static long access$3502(InCallScreen incallscreen, long l)
    {
        incallscreen.mLastClickActionTime = l;
        return l;
    }

*/





/*
    static int access$502(int i)
    {
        sPreHeadsetPlugState = i;
        return i;
    }

*/




}
