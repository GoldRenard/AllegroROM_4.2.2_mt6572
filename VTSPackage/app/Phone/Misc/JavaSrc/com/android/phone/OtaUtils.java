// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.net.Uri;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.*;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, InCallScreen, DTMFTwelveKeyDialerView, DTMFTwelveKeyDialer, 
//            PhoneUtils, CallController, CallCard, InCallUiState

public class OtaUtils
{
    public static class CdmaOtaConfigData
    {

        public boolean configComplete;
        public int otaPlaySuccessFailureTone;
        public int otaShowActivateFailTimes;
        public int otaShowActivationScreen;
        public int otaShowListeningScreen;

        public CdmaOtaConfigData()
        {
            OtaUtils.log("CdmaOtaConfigData constructor!");
            otaShowActivationScreen = 0;
            otaShowListeningScreen = 0;
            otaShowActivateFailTimes = 0;
            otaPlaySuccessFailureTone = 0;
        }
    }

    public static class CdmaOtaInCallScreenUiState
    {

        public State state;

        public CdmaOtaInCallScreenUiState()
        {
            OtaUtils.log("CdmaOtaInCallScreenState: constructor init to UNDEFINED");
            state = State.UNDEFINED;
        }
    }

    public static final class CdmaOtaInCallScreenUiState.State extends Enum
    {

        private static final CdmaOtaInCallScreenUiState.State $VALUES[];
        public static final CdmaOtaInCallScreenUiState.State ENDED;
        public static final CdmaOtaInCallScreenUiState.State NORMAL;
        public static final CdmaOtaInCallScreenUiState.State UNDEFINED;

        public static CdmaOtaInCallScreenUiState.State valueOf(String s)
        {
            return (CdmaOtaInCallScreenUiState.State)Enum.valueOf(com/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State, s);
        }

        public static CdmaOtaInCallScreenUiState.State[] values()
        {
            return (CdmaOtaInCallScreenUiState.State[])$VALUES.clone();
        }

        static 
        {
            UNDEFINED = new CdmaOtaInCallScreenUiState.State("UNDEFINED", 0);
            NORMAL = new CdmaOtaInCallScreenUiState.State("NORMAL", 1);
            ENDED = new CdmaOtaInCallScreenUiState.State("ENDED", 2);
            CdmaOtaInCallScreenUiState.State astate[] = new CdmaOtaInCallScreenUiState.State[3];
            astate[0] = UNDEFINED;
            astate[1] = NORMAL;
            astate[2] = ENDED;
            $VALUES = astate;
        }

        private CdmaOtaInCallScreenUiState.State(String s, int i)
        {
            super(s, i);
        }
    }

    public static class CdmaOtaProvisionData
    {

        public int activationCount;
        public boolean inOtaSpcState;
        public boolean isOtaCallCommitted;
        public boolean isOtaCallIntentProcessed;
        public long otaSpcUptime;

    }

    public static class CdmaOtaScreenState
    {

        public OtaScreenState otaScreenState;
        public PendingIntent otaspResultCodePendingIntent;

        public CdmaOtaScreenState()
        {
            otaScreenState = OtaScreenState.OTA_STATUS_UNDEFINED;
        }
    }

    public static final class CdmaOtaScreenState.OtaScreenState extends Enum
    {

        private static final CdmaOtaScreenState.OtaScreenState $VALUES[];
        public static final CdmaOtaScreenState.OtaScreenState OTA_STATUS_ACTIVATION;
        public static final CdmaOtaScreenState.OtaScreenState OTA_STATUS_LISTENING;
        public static final CdmaOtaScreenState.OtaScreenState OTA_STATUS_PROGRESS;
        public static final CdmaOtaScreenState.OtaScreenState OTA_STATUS_SUCCESS_FAILURE_DLG;
        public static final CdmaOtaScreenState.OtaScreenState OTA_STATUS_UNDEFINED;

        public static CdmaOtaScreenState.OtaScreenState valueOf(String s)
        {
            return (CdmaOtaScreenState.OtaScreenState)Enum.valueOf(com/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState, s);
        }

        public static CdmaOtaScreenState.OtaScreenState[] values()
        {
            return (CdmaOtaScreenState.OtaScreenState[])$VALUES.clone();
        }

        static 
        {
            OTA_STATUS_UNDEFINED = new CdmaOtaScreenState.OtaScreenState("OTA_STATUS_UNDEFINED", 0);
            OTA_STATUS_ACTIVATION = new CdmaOtaScreenState.OtaScreenState("OTA_STATUS_ACTIVATION", 1);
            OTA_STATUS_LISTENING = new CdmaOtaScreenState.OtaScreenState("OTA_STATUS_LISTENING", 2);
            OTA_STATUS_PROGRESS = new CdmaOtaScreenState.OtaScreenState("OTA_STATUS_PROGRESS", 3);
            OTA_STATUS_SUCCESS_FAILURE_DLG = new CdmaOtaScreenState.OtaScreenState("OTA_STATUS_SUCCESS_FAILURE_DLG", 4);
            CdmaOtaScreenState.OtaScreenState aotascreenstate[] = new CdmaOtaScreenState.OtaScreenState[5];
            aotascreenstate[0] = OTA_STATUS_UNDEFINED;
            aotascreenstate[1] = OTA_STATUS_ACTIVATION;
            aotascreenstate[2] = OTA_STATUS_LISTENING;
            aotascreenstate[3] = OTA_STATUS_PROGRESS;
            aotascreenstate[4] = OTA_STATUS_SUCCESS_FAILURE_DLG;
            $VALUES = aotascreenstate;
        }

        private CdmaOtaScreenState.OtaScreenState(String s, int i)
        {
            super(s, i);
        }
    }

    private class OtaWidgetData
    {

        public View callCardOtaButtonsActivate;
        public View callCardOtaButtonsFailSuccess;
        public View callCardOtaButtonsListenProgress;
        public Button otaActivateButton;
        public DTMFTwelveKeyDialerView otaDtmfDialerView;
        public Button otaEndButton;
        public AlertDialog otaFailureDialog;
        public Button otaNextButton;
        public Button otaSkipButton;
        public AlertDialog otaSkipConfirmationDialog;
        public ToggleButton otaSpeakerButton;
        public TextView otaTextActivate;
        public TextView otaTextListenProgress;
        public ProgressBar otaTextProgressBar;
        public TextView otaTextSuccessFail;
        public TextView otaTitle;
        public Button otaTryAgainButton;
        public ViewGroup otaUpperWidgets;
        public AlertDialog spcErrorDialog;
        final OtaUtils this$0;

        private OtaWidgetData()
        {
            this$0 = OtaUtils.this;
            super();
        }

    }


    public static final String ACTION_DISPLAY_ACTIVATION_SCREEN = "com.android.phone.DISPLAY_ACTIVATION_SCREEN";
    public static final String ACTION_PERFORM_CDMA_PROVISIONING = "com.android.phone.PERFORM_CDMA_PROVISIONING";
    public static final String ACTION_PERFORM_VOICELESS_CDMA_PROVISIONING = "com.android.phone.PERFORM_VOICELESS_CDMA_PROVISIONING";
    private static final boolean DBG = true;
    public static final String EXTRA_OTASP_RESULT_CODE = "otasp_result_code";
    public static final String EXTRA_OTASP_RESULT_CODE_PENDING_INTENT = "otasp_result_code_pending_intent";
    public static final String EXTRA_OVERRIDE_INTERACTIVE_MODE = "ota_override_interactive_mode";
    public static final String EXTRA_VOICELESS_PROVISIONING_OFFER_DONTSHOW = "com.android.phone.VOICELESS_PROVISIONING_OFFER_DONTSHOW";
    private static final String LOG_TAG = "OtaUtils";
    public static final int OTASP_FAILURE = 3;
    public static final int OTASP_FAILURE_SPC_RETRIES = 4;
    private static final String OTASP_NUMBER = "*228";
    private static final String OTASP_NUMBER_NON_INTERACTIVE = "*22899";
    public static final int OTASP_SUCCESS = 2;
    public static final int OTASP_UNKNOWN = 0;
    public static final int OTASP_USER_SKIPPED = 1;
    private static final int OTA_CALL_LTE_RETRIES_MAX = 5;
    private static final int OTA_CALL_LTE_RETRY_PERIOD = 3000;
    public static final int OTA_PLAY_SUCCESS_FAILURE_TONE_OFF = 0;
    public static final int OTA_PLAY_SUCCESS_FAILURE_TONE_ON = 1;
    public static final int OTA_SHOW_ACTIVATE_FAIL_COUNT_OFF = 0;
    public static final int OTA_SHOW_ACTIVATE_FAIL_COUNT_THREE = 3;
    public static final int OTA_SHOW_ACTIVATION_SCREEN_OFF = 0;
    public static final int OTA_SHOW_ACTIVATION_SCREEN_ON = 1;
    public static final int OTA_SHOW_LISTENING_SCREEN_OFF = 0;
    public static final int OTA_SHOW_LISTENING_SCREEN_ON = 1;
    public static final int RESULT_INTERACTIVE_OTASP_STARTED = 1;
    public static final int RESULT_NONINTERACTIVE_OTASP_FAILED = 3;
    public static final int RESULT_NONINTERACTIVE_OTASP_STARTED = 2;
    private static boolean sIsWizardMode = true;
    private static int sOtaCallLteRetries = 0;
    public final int OTA_FAILURE_DIALOG_TIMEOUT = 2;
    public final int OTA_SPC_TIMEOUT = 60;
    private PhoneGlobals mApplication;
    private CallCard mCallCard;
    private Context mContext;
    private InCallScreen mInCallScreen;
    private ViewGroup mInCallTouchUi;
    private boolean mInteractive;
    private DTMFTwelveKeyDialer mOtaCallCardDtmfDialer;
    private OtaWidgetData mOtaWidgetData;

    public OtaUtils(Context context, boolean flag)
    {
        mInteractive = true;
        log("OtaUtils constructor...");
        mApplication = PhoneGlobals.getInstance();
        mContext = context;
        mInteractive = flag;
    }

    private static int getLteOnCdmaMode(Context context)
    {
        TelephonyManager telephonymanager = (TelephonyManager)context.getSystemService("phone");
        if (telephonymanager != null && telephonymanager.getLteOnCdmaMode() != -1)
            return telephonymanager.getLteOnCdmaMode();
        else
            return SystemProperties.getInt("telephony.lteOnCdmaDevice", -1);
    }

    private int getOtaSpcDisplayTime()
    {
        log("getOtaSpcDisplayTime()...");
        int i = 1;
        if (mApplication.cdmaOtaProvisionData.inOtaSpcState)
        {
            long l = SystemClock.elapsedRealtime() - mApplication.cdmaOtaProvisionData.otaSpcUptime;
            if (l >= 60000L)
                i = 1;
            else
                i = 60 - (int)l / 1000;
        }
        log((new StringBuilder()).append("getOtaSpcDisplayTime(), time for SPC error notice: ").append(i).toString());
        return i;
    }

    private void initOtaInCallScreen()
    {
        log("initOtaInCallScreen()...");
        mOtaWidgetData.otaTitle = (TextView)mInCallScreen.findViewById(0x7f0800b9);
        mOtaWidgetData.otaTextActivate = (TextView)mInCallScreen.findViewById(0x7f0800ba);
        mOtaWidgetData.otaTextActivate.setVisibility(8);
        mOtaWidgetData.otaTextListenProgress = (TextView)mInCallScreen.findViewById(0x7f0800bb);
        mOtaWidgetData.otaTextProgressBar = (ProgressBar)mInCallScreen.findViewById(0x1010004);
        mOtaWidgetData.otaTextProgressBar.setIndeterminate(true);
        mOtaWidgetData.otaTextSuccessFail = (TextView)mInCallScreen.findViewById(0x7f0800bc);
        mOtaWidgetData.otaUpperWidgets = (ViewGroup)mInCallScreen.findViewById(0x7f0800b8);
        mOtaWidgetData.callCardOtaButtonsListenProgress = mInCallScreen.findViewById(0x7f0800c3);
        mOtaWidgetData.callCardOtaButtonsActivate = mInCallScreen.findViewById(0x7f0800c0);
        mOtaWidgetData.callCardOtaButtonsFailSuccess = mInCallScreen.findViewById(0x7f0800c5);
        mOtaWidgetData.otaEndButton = (Button)mInCallScreen.findViewById(0x7f0800c4);
        mOtaWidgetData.otaEndButton.setOnClickListener(mInCallScreen);
        mOtaWidgetData.otaSpeakerButton = (ToggleButton)mInCallScreen.findViewById(0x7f0800bf);
        mOtaWidgetData.otaSpeakerButton.setOnClickListener(mInCallScreen);
        mOtaWidgetData.otaActivateButton = (Button)mInCallScreen.findViewById(0x7f0800c1);
        mOtaWidgetData.otaActivateButton.setOnClickListener(mInCallScreen);
        mOtaWidgetData.otaSkipButton = (Button)mInCallScreen.findViewById(0x7f0800c2);
        mOtaWidgetData.otaSkipButton.setOnClickListener(mInCallScreen);
        mOtaWidgetData.otaNextButton = (Button)mInCallScreen.findViewById(0x7f0800c6);
        mOtaWidgetData.otaNextButton.setOnClickListener(mInCallScreen);
        mOtaWidgetData.otaTryAgainButton = (Button)mInCallScreen.findViewById(0x7f0800c7);
        mOtaWidgetData.otaTryAgainButton.setOnClickListener(mInCallScreen);
        mOtaWidgetData.otaDtmfDialerView = (DTMFTwelveKeyDialerView)mInCallScreen.findViewById(0x7f0800bd);
        if (mOtaWidgetData.otaDtmfDialerView == null)
        {
            throw new IllegalStateException("initOtaInCallScreen: couldn't find otaDtmfDialerView");
        } else
        {
            mOtaCallCardDtmfDialer = new DTMFTwelveKeyDialer(mInCallScreen, mOtaWidgetData.otaDtmfDialerView);
            mOtaCallCardDtmfDialer.startDialerSession();
            mOtaWidgetData.otaDtmfDialerView.setDialer(mOtaCallCardDtmfDialer);
            return;
        }
    }

    public static boolean isOtaspCallIntent(Intent intent)
    {
        PhoneGlobals phoneglobals;
        Phone phone;
        log((new StringBuilder()).append("isOtaspCallIntent(").append(intent).append(")...").toString());
        phoneglobals = PhoneGlobals.getInstance();
        phone = phoneglobals.mCM.getDefaultPhone();
        break MISSING_BLOCK_LABEL_41;
        if (intent != null && TelephonyCapabilities.supportsOtasp(phone))
        {
            String s = intent.getAction();
            if (s != null)
            {
                if (!s.equals("android.intent.action.CALL"))
                {
                    log((new StringBuilder()).append("isOtaspCallIntent: not a CALL action: '").append(s).append("' ==> not OTASP").toString());
                    return false;
                }
                if (phoneglobals.cdmaOtaScreenState == null || phoneglobals.cdmaOtaProvisionData == null)
                    throw new IllegalStateException("isOtaspCallIntent: app.cdmaOta* objects(s) not initialized");
                String s1;
                try
                {
                    s1 = PhoneUtils.getInitialNumber(intent);
                }
                catch (PhoneUtils.VoiceMailNumberMissingException voicemailnumbermissingexception)
                {
                    log("isOtaspCallIntent: VoiceMailNumberMissingException => not OTASP");
                    return false;
                }
                if (phone.isOtaSpNumber(s1))
                {
                    log((new StringBuilder()).append("isOtaSpNumber: ACTION_CALL to '").append(s1).append("' ==> OTASP call!").toString());
                    return true;
                }
            }
        }
        return false;
    }

    private static void log(String s)
    {
        Log.d("OtaUtils", s);
    }

    private static void loge(String s)
    {
        Log.e("OtaUtils", s);
    }

    public static boolean maybeDoOtaCall(Context context, Handler handler, int i)
    {
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        Phone phone = phoneglobals.phone;
        if (ActivityManager.isRunningInTestHarness())
        {
            Log.i("OtaUtils", "Don't run provisioning when in test harness");
            return true;
        }
        if (!TelephonyCapabilities.supportsOtasp(phone))
        {
            log("maybeDoOtaCall: OTASP not supported on this device");
            return true;
        }
        if (!phone.isMinInfoReady())
        {
            log("MIN is not ready. Registering to receive notification.");
            phone.registerForSubscriptionInfoReady(handler, i, null);
            return false;
        }
        phone.unregisterForSubscriptionInfoReady(handler);
        if (getLteOnCdmaMode(context) == -1)
            if (sOtaCallLteRetries < 5)
            {
                log("maybeDoOtaCall: LTE state still unknown: retrying");
                handler.sendEmptyMessageDelayed(i, 3000L);
                sOtaCallLteRetries = 1 + sOtaCallLteRetries;
                return false;
            } else
            {
                Log.w("OtaUtils", "maybeDoOtaCall: LTE state still unknown: giving up");
                return true;
            }
        boolean flag = phone.needsOtaServiceProvisioning();
        log((new StringBuilder()).append("phoneNeedsActivation is set to ").append(flag).toString());
        int j = context.getResources().getInteger(0x7f0b0000);
        log((new StringBuilder()).append("otaShowActivationScreen: ").append(j).toString());
        if (PhoneGlobals.sVoiceCapable && getLteOnCdmaMode(context) == 0)
            if (flag && j == 1)
            {
                phoneglobals.cdmaOtaProvisionData.isOtaCallIntentProcessed = false;
                sIsWizardMode = false;
                Log.d("OtaUtils", "==> Starting interactive CDMA provisioning...");
                startInteractiveOtasp(context);
                log("maybeDoOtaCall: voice capable; activation started.");
                return true;
            } else
            {
                log("maybeDoOtaCall: voice capable; activation NOT started.");
                return true;
            }
        if (flag)
        {
            phoneglobals.cdmaOtaProvisionData.isOtaCallIntentProcessed = false;
            Intent intent = new Intent("com.android.phone.PERFORM_VOICELESS_CDMA_PROVISIONING");
            intent.setFlags(0x10000000);
            intent.putExtra("com.android.phone.VOICELESS_PROVISIONING_OFFER_DONTSHOW", true);
            try
            {
                context.startActivity(intent);
            }
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                loge("No activity Handling PERFORM_VOICELESS_CDMA_PROVISIONING!");
                return false;
            }
            log("maybeDoOtaCall: non-interactive; activation intent sent.");
            return true;
        } else
        {
            log("maybeDoOtaCall: non-interactive, no need for OTASP.");
            return true;
        }
    }

    private void onClickOtaActivateButton()
    {
        log("Call Activation Clicked!");
        otaPerformActivation();
    }

    private void onClickOtaActivateNextButton()
    {
        log("Dialog Next Clicked!");
        if (!mApplication.cdmaOtaProvisionData.inOtaSpcState)
        {
            mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_UNDEFINED;
            otaShowHome();
        }
    }

    private void onClickOtaActivateSkipButton()
    {
        log("Activation Skip Clicked!");
        android.content.DialogInterface.OnKeyListener onkeylistener = new android.content.DialogInterface.OnKeyListener() {

            final OtaUtils this$0;

            public boolean onKey(DialogInterface dialoginterface, int i, KeyEvent keyevent)
            {
                OtaUtils.log("Ignoring key events...");
                return true;
            }

            
            {
                this$0 = OtaUtils.this;
                super();
            }
        }
;
        mOtaWidgetData.otaSkipConfirmationDialog = (new android.app.AlertDialog.Builder(mInCallScreen)).setTitle(0x7f0d02fd).setMessage(0x7f0d02fe).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final OtaUtils this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                otaSkipActivation();
            }

            
            {
                this$0 = OtaUtils.this;
                super();
            }
        }
).setNegativeButton(0x1040000, null).setOnKeyListener(onkeylistener).create();
        mOtaWidgetData.otaSkipConfirmationDialog.show();
    }

    private void onClickOtaEndButton()
    {
        log("Activation End Call Button Clicked!");
        if (!mApplication.cdmaOtaProvisionData.inOtaSpcState && !PhoneUtils.hangup(mApplication.mCM))
        {
            setSpeaker(false);
            mInCallScreen.handleOtaCallEnd();
        }
    }

    private void onClickOtaSpeakerButton()
    {
        log("OTA Speaker button Clicked!");
        if (!mApplication.cdmaOtaProvisionData.inOtaSpcState)
        {
            boolean flag;
            if (!PhoneUtils.isSpeakerOn(mContext))
                flag = true;
            else
                flag = false;
            setSpeaker(flag);
        }
    }

    private void onClickOtaTryAgainButton()
    {
        log("Activation Try Again Clicked!");
        if (!mApplication.cdmaOtaProvisionData.inOtaSpcState)
            otaShowActivateScreen();
    }

    private void otaPerformActivation()
    {
        log("otaPerformActivation()...");
        if (!mInteractive)
            Log.w("OtaUtils", "otaPerformActivation: not interactive!");
        else
        if (!mApplication.cdmaOtaProvisionData.inOtaSpcState)
        {
            Intent intent = new Intent("android.intent.action.CALL");
            intent.setData(Uri.fromParts("tel", "*228", null));
            mApplication.callController.placeCall(intent);
            otaShowListeningScreen();
            mInCallScreen.requestUpdateScreen();
            return;
        }
    }

    private static String otaProvisionStatusToString(int i)
    {
        switch (i)
        {
        case 11: // '\013'
            return "OTAPA_ABORTED";

        case 10: // '\n'
            return "OTAPA_STOPPED";

        case 9: // '\t'
            return "OTAPA_STARTED";

        case 8: // '\b'
            return "COMMITTED";

        case 7: // '\007'
            return "PRL_DOWNLOADED";

        case 6: // '\006'
            return "IMSI_DOWNLOADED";

        case 5: // '\005'
            return "MDN_DOWNLOADED";

        case 4: // '\004'
            return "NAM_DOWNLOADED";

        case 3: // '\003'
            return "SSD_UPDATED";

        case 2: // '\002'
            return "A_KEY_EXCHANGED";

        case 1: // '\001'
            return "SPC_RETRIES_EXCEEDED";

        case 0: // '\0'
            return "SPL_UNLOCKED";
        }
        return (new StringBuilder()).append("<unknown status").append(i).append(">").toString();
    }

    private void otaScreenInitialize()
    {
        log("otaScreenInitialize()...");
        if (!mInteractive)
        {
            Log.w("OtaUtils", "otaScreenInitialize: not interactive!");
            return;
        }
        if (mInCallTouchUi != null)
            mInCallTouchUi.setVisibility(8);
        if (mCallCard != null)
        {
            mCallCard.setVisibility(8);
            mCallCard.hideCallCardElements();
        }
        mOtaWidgetData.otaTitle.setText(0x7f0d02fb);
        mOtaWidgetData.otaTextActivate.setVisibility(8);
        mOtaWidgetData.otaTextListenProgress.setVisibility(8);
        mOtaWidgetData.otaTextProgressBar.setVisibility(8);
        mOtaWidgetData.otaTextSuccessFail.setVisibility(8);
        mOtaWidgetData.callCardOtaButtonsActivate.setVisibility(8);
        mOtaWidgetData.callCardOtaButtonsListenProgress.setVisibility(8);
        mOtaWidgetData.callCardOtaButtonsFailSuccess.setVisibility(8);
        mOtaWidgetData.otaDtmfDialerView.setVisibility(8);
        mOtaWidgetData.otaSpeakerButton.setVisibility(8);
        mOtaWidgetData.otaTryAgainButton.setVisibility(8);
        mOtaWidgetData.otaNextButton.setVisibility(8);
        mOtaWidgetData.otaUpperWidgets.setVisibility(0);
        mOtaWidgetData.otaSkipButton.setVisibility(0);
    }

    private void otaShowHome()
    {
        log("otaShowHome()...");
        mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_UNDEFINED;
        mInCallScreen.endInCallScreenSession();
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        intent.setFlags(0x10000000);
        mContext.startActivityAsUser(intent, UserHandle.CURRENT);
    }

    private void otaShowInProgressScreen()
    {
label0:
        {
            log("otaShowInProgressScreen()...");
            if (!mInteractive)
            {
                Log.w("OtaUtils", "otaShowInProgressScreen: not interactive!");
            } else
            {
                mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_PROGRESS;
                if (mOtaWidgetData == null || mInCallScreen == null)
                    break label0;
                if (!isDialerOpened())
                {
                    otaScreenInitialize();
                    mOtaWidgetData.otaTextListenProgress.setVisibility(0);
                    mOtaWidgetData.otaTextListenProgress.setText(0x7f0d0305);
                    mOtaWidgetData.otaTextProgressBar.setVisibility(0);
                    mOtaWidgetData.callCardOtaButtonsListenProgress.setVisibility(0);
                    mOtaWidgetData.otaSpeakerButton.setVisibility(0);
                    boolean flag = PhoneUtils.isSpeakerOn(mContext);
                    mOtaWidgetData.otaSpeakerButton.setChecked(flag);
                    return;
                }
            }
            return;
        }
        Log.w("OtaUtils", "otaShowInProgressScreen: UI widgets not set up yet!");
    }

    private void otaShowListeningScreen()
    {
        log("otaShowListeningScreen()...");
        if (!mInteractive)
        {
            Log.w("OtaUtils", "otaShowListeningScreen: not interactive!");
            return;
        }
        if (mApplication.cdmaOtaConfigData.otaShowListeningScreen == 1)
        {
            log("otaShowListeningScreen(): show listening screen");
            if (!isDialerOpened())
            {
                otaScreenInitialize();
                mOtaWidgetData.otaTextListenProgress.setVisibility(0);
                mOtaWidgetData.otaTextListenProgress.setText(0x7f0d0303);
                mOtaWidgetData.otaDtmfDialerView.setVisibility(0);
                mOtaWidgetData.callCardOtaButtonsListenProgress.setVisibility(0);
                mOtaWidgetData.otaSpeakerButton.setVisibility(0);
                boolean flag = PhoneUtils.isSpeakerOn(mContext);
                mOtaWidgetData.otaSpeakerButton.setChecked(flag);
            }
            mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_LISTENING;
            return;
        } else
        {
            log("otaShowListeningScreen(): show progress screen");
            otaShowInProgressScreen();
            return;
        }
    }

    private void otaShowProgramFailure(int i)
    {
        log("otaShowProgramFailure()...");
        CdmaOtaProvisionData cdmaotaprovisiondata = mApplication.cdmaOtaProvisionData;
        cdmaotaprovisiondata.activationCount = 1 + cdmaotaprovisiondata.activationCount;
        if (mApplication.cdmaOtaProvisionData.activationCount < mApplication.cdmaOtaConfigData.otaShowActivateFailTimes && mApplication.cdmaOtaConfigData.otaShowActivationScreen == 1)
        {
            log((new StringBuilder()).append("otaShowProgramFailure(): activationCount").append(mApplication.cdmaOtaProvisionData.activationCount).toString());
            log("otaShowProgramFailure(): show failure notice");
            otaShowProgramFailureNotice(i);
            return;
        } else
        {
            log("otaShowProgramFailure(): show failure dialog");
            otaShowProgramFailureDialog();
            return;
        }
    }

    private void otaShowProgramFailureDialog()
    {
        log("otaShowProgramFailureDialog()...");
        mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_SUCCESS_FAILURE_DLG;
        mOtaWidgetData.otaTitle.setText(0x7f0d0302);
        mOtaWidgetData.otaTextSuccessFail.setVisibility(0);
        mOtaWidgetData.otaTextSuccessFail.setText(0x7f0d0308);
        mOtaWidgetData.callCardOtaButtonsFailSuccess.setVisibility(0);
        mOtaWidgetData.otaTryAgainButton.setVisibility(0);
        if (isDialerOpened())
            mOtaCallCardDtmfDialer.closeDialer(false);
    }

    private void otaShowProgramFailureNotice(int i)
    {
        log("otaShowProgramFailureNotice()...");
        if (mOtaWidgetData.otaFailureDialog == null)
        {
            mOtaWidgetData.otaFailureDialog = (new android.app.AlertDialog.Builder(mInCallScreen)).setMessage(0x7f0d0306).create();
            mOtaWidgetData.otaFailureDialog.getWindow().addFlags(144);
            mOtaWidgetData.otaFailureDialog.show();
            long l = i * 1000;
            mInCallScreen.requestCloseOtaFailureNotice(l);
        }
    }

    private void otaShowProgramSuccessDialog()
    {
        log("otaShowProgramSuccessDialog()...");
        mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_SUCCESS_FAILURE_DLG;
        mOtaWidgetData.otaTitle.setText(0x7f0d0301);
        mOtaWidgetData.otaTextSuccessFail.setVisibility(0);
        mOtaWidgetData.otaTextSuccessFail.setText(0x7f0d0307);
        mOtaWidgetData.callCardOtaButtonsFailSuccess.setVisibility(0);
        mOtaWidgetData.otaNextButton.setVisibility(0);
        if (isDialerOpened())
            mOtaCallCardDtmfDialer.closeDialer(false);
    }

    private void otaShowSpcErrorNotice(int i)
    {
        log("otaShowSpcErrorNotice()...");
        if (mOtaWidgetData.spcErrorDialog == null)
        {
            mApplication.cdmaOtaProvisionData.inOtaSpcState = true;
            android.content.DialogInterface.OnKeyListener onkeylistener = new android.content.DialogInterface.OnKeyListener() {

                final OtaUtils this$0;

                public boolean onKey(DialogInterface dialoginterface, int j, KeyEvent keyevent)
                {
                    OtaUtils.log("Ignoring key events...");
                    return true;
                }

            
            {
                this$0 = OtaUtils.this;
                super();
            }
            }
;
            mOtaWidgetData.spcErrorDialog = (new android.app.AlertDialog.Builder(mInCallScreen)).setMessage(0x7f0d0309).setOnKeyListener(onkeylistener).create();
            mOtaWidgetData.spcErrorDialog.getWindow().addFlags(144);
            mOtaWidgetData.spcErrorDialog.show();
            if (isDialerOpened())
                mOtaCallCardDtmfDialer.closeDialer(false);
            long l = i * 1000;
            log((new StringBuilder()).append("otaShowSpcErrorNotice(), remaining SPC noticeTime").append(l).toString());
            mInCallScreen.requestCloseSpcErrorNotice(l);
        }
    }

    private void otaSkipActivation()
    {
        log("otaSkipActivation()...");
        sendOtaspResult(1);
        if (mInteractive)
            mInCallScreen.finish();
    }

    private void readXmlSettings()
    {
        log("readXmlSettings()...");
        if (mApplication.cdmaOtaConfigData.configComplete)
        {
            return;
        } else
        {
            mApplication.cdmaOtaConfigData.configComplete = true;
            int i = mContext.getResources().getInteger(0x7f0b0000);
            mApplication.cdmaOtaConfigData.otaShowActivationScreen = i;
            log((new StringBuilder()).append("readXmlSettings(), otaShowActivationScreen = ").append(mApplication.cdmaOtaConfigData.otaShowActivationScreen).toString());
            int j = mContext.getResources().getInteger(0x7f0b0001);
            mApplication.cdmaOtaConfigData.otaShowListeningScreen = j;
            log((new StringBuilder()).append("readXmlSettings(), otaShowListeningScreen = ").append(mApplication.cdmaOtaConfigData.otaShowListeningScreen).toString());
            int k = mContext.getResources().getInteger(0x7f0b0002);
            mApplication.cdmaOtaConfigData.otaShowActivateFailTimes = k;
            log((new StringBuilder()).append("readXmlSettings(), otaShowActivateFailTimes = ").append(mApplication.cdmaOtaConfigData.otaShowActivateFailTimes).toString());
            int l = mContext.getResources().getInteger(0x7f0b0003);
            mApplication.cdmaOtaConfigData.otaPlaySuccessFailureTone = l;
            log((new StringBuilder()).append("readXmlSettings(), otaPlaySuccessFailureTone = ").append(mApplication.cdmaOtaConfigData.otaPlaySuccessFailureTone).toString());
            return;
        }
    }

    private void sendOtaspResult(int i)
    {
        log((new StringBuilder()).append("sendOtaspResult: resultCode = ").append(i).toString());
        Intent intent = new Intent();
        intent.putExtra("otasp_result_code", i);
        if (mApplication.cdmaOtaScreenState == null)
        {
            Log.e("OtaUtils", "updateNonInteractiveOtaSuccessFailure: no cdmaOtaScreenState object!");
            return;
        }
        if (mApplication.cdmaOtaScreenState.otaspResultCodePendingIntent == null)
        {
            Log.w("OtaUtils", "updateNonInteractiveOtaSuccessFailure: null otaspResultCodePendingIntent!");
            return;
        }
        try
        {
            log((new StringBuilder()).append("- sendOtaspResult:  SENDING PENDING INTENT: ").append(mApplication.cdmaOtaScreenState.otaspResultCodePendingIntent).toString());
            mApplication.cdmaOtaScreenState.otaspResultCodePendingIntent.send(mContext, 0, intent);
            return;
        }
        catch (android.app.PendingIntent.CanceledException canceledexception)
        {
            Log.e("OtaUtils", (new StringBuilder()).append("PendingIntent send() failed: ").append(canceledexception).toString());
        }
    }

    private void setSpeaker(boolean flag)
    {
        log((new StringBuilder()).append("setSpeaker : ").append(flag).toString());
        if (!mInteractive)
        {
            log("non-interactive mode, ignoring setSpeaker.");
            return;
        }
        if (flag == PhoneUtils.isSpeakerOn(mContext))
        {
            log("no change. returning");
            return;
        }
        if (flag && mInCallScreen.isBluetoothAvailable() && mInCallScreen.isBluetoothAudioConnected())
            mInCallScreen.disconnectBluetoothAudio();
        PhoneUtils.turnOnSpeaker(mContext, flag, true);
    }

    public static void setupOtaspCall(Intent intent)
    {
        log((new StringBuilder()).append("setupOtaspCall(): preparing for OTASP call to ").append(intent).toString());
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (phoneglobals.otaUtils != null)
            Log.i("OtaUtils", "setupOtaspCall: OtaUtils already exists; replacing with new instance...");
        phoneglobals.otaUtils = new OtaUtils(phoneglobals.getApplicationContext(), true);
        log((new StringBuilder()).append("- created OtaUtils: ").append(phoneglobals.otaUtils).toString());
        phoneglobals.otaUtils.setCdmaOtaInCallScreenUiState(CdmaOtaInCallScreenUiState.State.NORMAL);
        phoneglobals.inCallUiState.inCallScreenMode = InCallUiState.InCallScreenMode.OTA_NORMAL;
        if (phoneglobals.cdmaOtaProvisionData != null)
            phoneglobals.cdmaOtaProvisionData.isOtaCallCommitted = false;
    }

    public static void startInteractiveOtasp(Context context)
    {
        log("startInteractiveOtasp()...");
        PhoneGlobals.getInstance();
        Intent intent = (new Intent()).setClass(context, com/android/phone/InCallScreen).setAction("com.android.phone.DISPLAY_ACTIVATION_SCREEN");
        intent.setFlags(0x10000000);
        setupOtaspCall(intent);
        Log.i("OtaUtils", (new StringBuilder()).append("startInteractiveOtasp: launching InCallScreen in 'activate' state: ").append(intent).toString());
        context.startActivity(intent);
    }

    public static int startNonInteractiveOtasp(Context context)
    {
        log("startNonInteractiveOtasp()...");
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (phoneglobals.otaUtils != null)
            Log.i("OtaUtils", "startNonInteractiveOtasp: OtaUtils already exists; nuking the old one and starting again...");
        phoneglobals.otaUtils = new OtaUtils(context, false);
        log((new StringBuilder()).append("- created OtaUtils: ").append(phoneglobals.otaUtils).toString());
        Phone phone = PhoneGlobals.getPhone();
        Log.i("OtaUtils", (new StringBuilder()).append("startNonInteractiveOtasp: placing call to '").append("*22899").append("'...").toString());
        int i = PhoneUtils.placeCall(context, phone, "*22899", null, false, null);
        if (i == 0)
        {
            log((new StringBuilder()).append("  ==> successful return from placeCall(): callStatus = ").append(i).toString());
            return i;
        } else
        {
            Log.w("OtaUtils", (new StringBuilder()).append("Failure from placeCall() for OTA number '").append("*22899").append("': code ").append(i).toString());
            return i;
        }
    }

    private void updateNonInteractiveOtaSuccessFailure()
    {
        log((new StringBuilder()).append("updateNonInteractiveOtaSuccessFailure(): isOtaCallCommitted = ").append(mApplication.cdmaOtaProvisionData.isOtaCallCommitted).toString());
        byte byte0;
        if (mApplication.cdmaOtaProvisionData.isOtaCallCommitted)
            byte0 = 2;
        else
            byte0 = 3;
        sendOtaspResult(byte0);
    }

    private void updateOtaspProgress()
    {
        log((new StringBuilder()).append("updateOtaspProgress()...  mInteractive = ").append(mInteractive).toString());
        if (mInteractive)
            otaShowInProgressScreen();
    }

    public void cleanOtaScreen(boolean flag)
    {
        log("OTA ends, cleanOtaScreen!");
        mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_UNDEFINED;
        mApplication.cdmaOtaProvisionData.isOtaCallCommitted = false;
        mApplication.cdmaOtaProvisionData.isOtaCallIntentProcessed = false;
        mApplication.cdmaOtaProvisionData.inOtaSpcState = false;
        mApplication.cdmaOtaProvisionData.activationCount = 0;
        mApplication.cdmaOtaProvisionData.otaSpcUptime = 0L;
        mApplication.cdmaOtaInCallScreenUiState.state = CdmaOtaInCallScreenUiState.State.UNDEFINED;
        if (mInteractive && mOtaWidgetData != null)
        {
            if (mInCallTouchUi != null)
                mInCallTouchUi.setVisibility(0);
            if (mCallCard != null)
            {
                mCallCard.setVisibility(0);
                mCallCard.hideCallCardElements();
            }
            if (mOtaCallCardDtmfDialer != null)
                mOtaCallCardDtmfDialer.stopDialerSession();
            mOtaWidgetData.otaTextActivate.setVisibility(8);
            mOtaWidgetData.otaTextListenProgress.setVisibility(8);
            mOtaWidgetData.otaTextProgressBar.setVisibility(8);
            mOtaWidgetData.otaTextSuccessFail.setVisibility(8);
            mOtaWidgetData.callCardOtaButtonsActivate.setVisibility(8);
            mOtaWidgetData.callCardOtaButtonsListenProgress.setVisibility(8);
            mOtaWidgetData.callCardOtaButtonsFailSuccess.setVisibility(8);
            mOtaWidgetData.otaUpperWidgets.setVisibility(8);
            mOtaWidgetData.otaDtmfDialerView.setVisibility(8);
            mOtaWidgetData.otaNextButton.setVisibility(8);
            mOtaWidgetData.otaTryAgainButton.setVisibility(8);
        }
        if (flag)
            setSpeaker(false);
    }

    public void clearUiWidgets()
    {
        mInCallScreen = null;
        mInCallTouchUi = null;
        mCallCard = null;
        mOtaWidgetData = null;
    }

    public void dismissAllOtaDialogs()
    {
        if (mOtaWidgetData != null)
        {
            if (mOtaWidgetData.spcErrorDialog != null)
            {
                log("- DISMISSING mSpcErrorDialog.");
                mOtaWidgetData.spcErrorDialog.dismiss();
                mOtaWidgetData.spcErrorDialog = null;
            }
            if (mOtaWidgetData.otaFailureDialog != null)
            {
                log("- DISMISSING mOtaFailureDialog.");
                mOtaWidgetData.otaFailureDialog.dismiss();
                mOtaWidgetData.otaFailureDialog = null;
            }
        }
    }

    public CdmaOtaInCallScreenUiState.State getCdmaOtaInCallScreenUiState()
    {
        log((new StringBuilder()).append("getCdmaOtaInCallScreenState: ").append(mApplication.cdmaOtaInCallScreenUiState.state).toString());
        return mApplication.cdmaOtaInCallScreenUiState.state;
    }

    public void hideOtaScreen()
    {
        log("hideOtaScreen()...");
        mOtaWidgetData.callCardOtaButtonsActivate.setVisibility(8);
        mOtaWidgetData.callCardOtaButtonsListenProgress.setVisibility(8);
        mOtaWidgetData.callCardOtaButtonsFailSuccess.setVisibility(8);
        mOtaWidgetData.otaUpperWidgets.setVisibility(8);
    }

    public boolean isDialerOpened()
    {
        boolean flag;
        if (mOtaCallCardDtmfDialer != null && mOtaCallCardDtmfDialer.isOpened())
            flag = true;
        else
            flag = false;
        log((new StringBuilder()).append("- isDialerOpened() ==> ").append(flag).toString());
        return flag;
    }

    public void onClickHandler(int i)
    {
        switch (i)
        {
        case 2131230919: 
            onClickOtaTryAgainButton();
            return;

        case 2131230918: 
            onClickOtaActivateNextButton();
            return;

        case 2131230914: 
            onClickOtaActivateSkipButton();
            return;

        case 2131230913: 
            onClickOtaActivateButton();
            return;

        case 2131230911: 
            onClickOtaSpeakerButton();
            return;

        case 2131230916: 
            onClickOtaEndButton();
            return;

        case 2131230912: 
        case 2131230915: 
        case 2131230917: 
        default:
            log("onClickHandler: received a click event for unrecognized id");
            return;
        }
    }

    public void onOtaCloseFailureNotice()
    {
        log("onOtaCloseFailureNotice()...");
        if (mOtaWidgetData.otaFailureDialog != null)
        {
            mOtaWidgetData.otaFailureDialog.dismiss();
            mOtaWidgetData.otaFailureDialog = null;
        }
        otaShowActivateScreen();
    }

    public void onOtaCloseSpcNotice()
    {
        log("onOtaCloseSpcNotice(), send shutdown intent");
        Intent intent = new Intent("android.intent.action.ACTION_REQUEST_SHUTDOWN");
        intent.putExtra("android.intent.extra.KEY_CONFIRM", false);
        intent.setFlags(0x10000000);
        mContext.startActivity(intent);
    }

    public void onOtaProvisionStatusChanged(AsyncResult asyncresult)
    {
        int ai[] = (int[])(int[])asyncresult.result;
        log("Provision status event!");
        log((new StringBuilder()).append("onOtaProvisionStatusChanged(): status = ").append(ai[0]).append(" ==> ").append(otaProvisionStatusToString(ai[0])).toString());
        switch (ai[0])
        {
        case 0: // '\0'
        case 2: // '\002'
        case 3: // '\003'
        case 4: // '\004'
        case 5: // '\005'
        case 6: // '\006'
        case 7: // '\007'
        case 9: // '\t'
        case 10: // '\n'
        case 11: // '\013'
            if (getCdmaOtaInCallScreenUiState() == CdmaOtaInCallScreenUiState.State.NORMAL)
            {
                log("onOtaProvisionStatusChanged(): change to ProgressScreen");
                updateOtaspProgress();
                return;
            }
            break;

        case 8: // '\b'
            log("onOtaProvisionStatusChanged(): DONE, isOtaCallCommitted set to true");
            mApplication.cdmaOtaProvisionData.isOtaCallCommitted = true;
            if (mApplication.cdmaOtaScreenState.otaScreenState != CdmaOtaScreenState.OtaScreenState.OTA_STATUS_UNDEFINED)
            {
                updateOtaspProgress();
                return;
            }
            break;

        case 1: // '\001'
            log("onOtaProvisionStatusChanged(): RETRIES EXCEEDED");
            updateOtaspProgress();
            mApplication.cdmaOtaProvisionData.otaSpcUptime = SystemClock.elapsedRealtime();
            if (mInteractive)
            {
                otaShowSpcErrorNotice(60);
                return;
            } else
            {
                sendOtaspResult(4);
                return;
            }

        default:
            log((new StringBuilder()).append("onOtaProvisionStatusChanged(): Ignoring OtaStatus ").append(ai[0]).toString());
            break;
        }
    }

    public void onOtaspDisconnect()
    {
        log("onOtaspDisconnect()...");
        if (!mInteractive)
            updateNonInteractiveOtaSuccessFailure();
    }

    public void otaShowActivateScreen()
    {
        log("otaShowActivateScreen()...");
        if (mApplication.cdmaOtaConfigData.otaShowActivationScreen == 1)
        {
            log("otaShowActivateScreen(): show activation screen");
            if (!isDialerOpened())
            {
                otaScreenInitialize();
                Button button = mOtaWidgetData.otaSkipButton;
                byte byte0;
                if (sIsWizardMode)
                    byte0 = 0;
                else
                    byte0 = 4;
                button.setVisibility(byte0);
                mOtaWidgetData.otaTextActivate.setVisibility(0);
                mOtaWidgetData.callCardOtaButtonsActivate.setVisibility(0);
            }
            mApplication.cdmaOtaScreenState.otaScreenState = CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION;
            return;
        } else
        {
            log("otaShowActivateScreen(): show home screen");
            otaShowHome();
            return;
        }
    }

    public void otaShowProperScreen()
    {
        log("otaShowProperScreen()...");
        if (!mInteractive)
            Log.w("OtaUtils", "otaShowProperScreen: not interactive!");
        else
        if (mInCallScreen != null && mInCallScreen.isForegroundActivity())
        {
            log((new StringBuilder()).append("otaShowProperScreen(): InCallScreen in foreground, currentstate = ").append(mApplication.cdmaOtaScreenState.otaScreenState).toString());
            if (mInCallTouchUi != null)
                mInCallTouchUi.setVisibility(8);
            if (mCallCard != null)
                mCallCard.setVisibility(8);
            if (mApplication.cdmaOtaScreenState.otaScreenState == CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION)
                otaShowActivateScreen();
            else
            if (mApplication.cdmaOtaScreenState.otaScreenState == CdmaOtaScreenState.OtaScreenState.OTA_STATUS_LISTENING)
                otaShowListeningScreen();
            else
            if (mApplication.cdmaOtaScreenState.otaScreenState == CdmaOtaScreenState.OtaScreenState.OTA_STATUS_PROGRESS)
                otaShowInProgressScreen();
            if (mApplication.cdmaOtaProvisionData.inOtaSpcState)
            {
                otaShowSpcErrorNotice(getOtaSpcDisplayTime());
                return;
            }
        }
    }

    public void otaShowSuccessFailure()
    {
        log("otaShowSuccessFailure()...");
        if (!mInteractive)
        {
            Log.w("OtaUtils", "otaShowSuccessFailure: not interactive!");
            return;
        }
        otaScreenInitialize();
        log((new StringBuilder()).append("otaShowSuccessFailure(): isOtaCallCommitted").append(mApplication.cdmaOtaProvisionData.isOtaCallCommitted).toString());
        if (mApplication.cdmaOtaProvisionData.isOtaCallCommitted)
        {
            log("otaShowSuccessFailure(), show success dialog");
            otaShowProgramSuccessDialog();
            return;
        } else
        {
            log("otaShowSuccessFailure(), show failure dialog");
            otaShowProgramFailure(2);
            return;
        }
    }

    public void setCdmaOtaInCallScreenUiState(CdmaOtaInCallScreenUiState.State state)
    {
        log((new StringBuilder()).append("setCdmaOtaInCallScreenState: ").append(state).toString());
        mApplication.cdmaOtaInCallScreenUiState.state = state;
    }

    public void updateUiWidgets(InCallScreen incallscreen, ViewGroup viewgroup, CallCard callcard)
    {
        log((new StringBuilder()).append("updateUiWidgets()...  mInCallScreen = ").append(mInCallScreen).toString());
        if (!mInteractive)
            throw new IllegalStateException("updateUiWidgets() called in non-interactive mode");
        if (mInCallScreen != null)
        {
            log("updateUiWidgets(): widgets already set up, nothing to do...");
            return;
        }
        mInCallScreen = incallscreen;
        mInCallTouchUi = viewgroup;
        mCallCard = callcard;
        mOtaWidgetData = new OtaWidgetData();
        ViewStub viewstub = (ViewStub)mInCallScreen.findViewById(0x7f080070);
        if (viewstub != null)
            viewstub.inflate();
        readXmlSettings();
        initOtaInCallScreen();
    }



}
