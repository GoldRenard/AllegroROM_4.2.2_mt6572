.class public Lcom/android/phone/InCallScreen;
.super Landroid/app/Activity;
.source "InCallScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/phone/CallTime$OnTickListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;
.implements Landroid/content/DialogInterface$OnShowListener;
.implements Lcom/mediatek/phone/ext/IInCallScreen;
.implements Lcom/mediatek/phone/VoiceCommandHandler$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/InCallScreen$33;,
        Lcom/android/phone/InCallScreen$InCallAudioMode;,
        Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    }
.end annotation


# static fields
.field private static ACTION_LOCKED:Ljava/lang/String; = null

.field public static final ACTION_UNDEFINED:Ljava/lang/String; = "com.android.phone.InCallScreen.UNDEFINED"

.field private static ACTION_UNLOCK:Ljava/lang/String; = null

.field private static final ADD_VOICEMAIL_NUMBER:I = 0x6a

.field static final AUTO_RETRY_OFF:I = 0x0

.field static final AUTO_RETRY_ON:I = 0x1

.field private static final CALL_ENDED_EXTRA_LONG_DELAY:I = 0x1388

.field private static final CALL_ENDED_LONG_DELAY:I = 0x7d0

.field private static final CALL_ENDED_SHORT_DELAY:I = 0x0

.field private static final CRSS_SUPP_SERVICE:I = 0x8d

.field private static final DBG:Z = true

.field public static final DELAYED_CLEANUP_AFTER_DISCONNECT:I = 0x6c

.field public static final DELAYED_CLEANUP_AFTER_DISCONNECT2:I = 0x93

.field public static final DELAYED_CLEANUP_AFTER_DISCONNECT3:I = 0xf7

.field public static final DELAYED_CLEANUP_AFTER_DISCONNECT4:I = 0x15b

.field public static final DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I = null

.field private static final DELAY_AUTO_ANSWER:I = 0x7d

.field private static final DELAY_TO_FINISH_INCALLSCREEN:I = 0xcb

.field private static final DONT_ADD_VOICEMAIL_NUMBER:I = 0x6b

.field private static final EVENT_HEADSET_PLUG_STATE_CHANGED:I = 0x67

.field private static final EVENT_HIDE_PROVIDER_INFO:I = 0x79

.field private static final EVENT_PAUSE_DIALOG_COMPLETE:I = 0x78

.field static final EXTRA_FORCE_SPEAKER_ON:Ljava/lang/String; = "com.android.phone.extra.FORCE_SPEAKER_ON"

.field static final EXTRA_GATEWAY_PROVIDER_PACKAGE:Ljava/lang/String; = "com.android.phone.extra.GATEWAY_PROVIDER_PACKAGE"

.field static final EXTRA_GATEWAY_URI:Ljava/lang/String; = "com.android.phone.extra.GATEWAY_URI"

.field public static final EXTRA_SEND_EMPTY_FLASH:Ljava/lang/String; = "com.android.phone.extra.SEND_EMPTY_FLASH"

.field private static final FAKE_INCOMING_CALL_WIDGET:I = 0xa0

.field static final KEY_EMERGENCY_DIALER:Ljava/lang/String; = "com.android.phone.EmergencyDialer"

.field private static final LOG_TAG:Ljava/lang/String; = "InCallScreen"

.field private static final PAUSE_PROMPT_DIALOG_TIMEOUT:I = 0x7d0

.field private static final PHONE_CDMA_CALL_WAITING:I = 0x73

.field private static final PHONE_DISCONNECT:I = 0x66

.field private static final PHONE_DISCONNECT2:I = 0x90

.field private static final PHONE_DISCONNECT3:I = 0xf4

.field private static final PHONE_DISCONNECT4:I = 0x158

.field private static final PHONE_DISCONNECT_GEMINI:[I = null

.field private static final PHONE_INCOMING_RING:I = 0x7b

.field private static final PHONE_NEW_RINGING_CONNECTION:I = 0x7c

.field private static final PHONE_RECORD_STATE_UPDATE:I = 0x82

.field private static final PHONE_STATE_CHANGED:I = 0x65

.field private static final PIN_REQUIRED:Ljava/lang/String; = "PIN_REQUIRED"

.field private static final POST_ON_DIAL_CHARS:I = 0x68

.field private static final PROVIDER_INFO_TIMEOUT:I = 0x1388

.field private static final PUK_REQUIRED:Ljava/lang/String; = "PUK_REQUIRED"

.field private static final REQUEST_CLOSE_OTA_FAILURE_NOTICE:I = 0x77

.field private static final REQUEST_CLOSE_SPC_ERROR_NOTICE:I = 0x76

.field private static final REQUEST_UPDATE_BLUETOOTH_INDICATION:I = 0x72

.field private static final REQUEST_UPDATE_SCREEN:I = 0x7a

.field private static final REQUEST_UPDATE_SCREEN_EXT:I = 0xcc

.field private static final SEND_MESSAGE:I = 0x1

.field private static final SET_IGNORE_USER_ACTIVITY:I = 0x7e

.field static final SHOW_DIALPAD_EXTRA:Ljava/lang/String; = "com.android.phone.ShowDialpad"

.field private static final SUPP_SERVICE_FAILED:I = 0x6e

.field private static final SUPP_SERVICE_NOTIFICATION:I = 0x8c

.field static final SUP_TYPE:I = 0x91

.field private static final VDBG:Z = true

.field private static final VT_EM_AUTO_ANSWER:I = 0xca

.field private static final VT_VOICE_ANSWER_OVER:I = 0xa1

.field private static final WILD_PROMPT_CHAR_ENTERED:I = 0x69

.field private static mLocaleChanged:Z

.field private static prevPhonenums:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/Connection;",
            ">;"
        }
    .end annotation
.end field

.field private static sPreHeadsetPlugState:I


# instance fields
.field private componentName:Landroid/content/ComponentName;

.field private delayTime_disableTouch:Ljava/lang/Boolean;

.field private lock_screen_time:I

.field private mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mApp:Lcom/android/phone/PhoneGlobals;

.field private mBackgroundCall:Lcom/android/internal/telephony/Call;

.field private mBackgroundLastState:Lcom/android/internal/telephony/Call$State;

.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBluetoothConnectionPending:Z

.field private mBluetoothConnectionRequestTime:J

.field private mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

.field private mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

.field private mCM:Lcom/android/internal/telephony/CallManager;

.field private mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

.field private mCallCard:Lcom/android/phone/CallCard;

.field private mCallLostDialog:Landroid/app/AlertDialog;

.field private mCallSelectDialog:Landroid/app/AlertDialog;

.field private mCallTime:Lcom/android/phone/CallTime;

.field private mCanDismissDialog:Landroid/app/AlertDialog;

.field private final mDMLockReceiver:Landroid/content/BroadcastReceiver;

.field private mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

.field private mDialogClickListener:Landroid/content/DialogInterface$OnClickListener;

.field mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

.field private mExitingECMDialog:Landroid/app/AlertDialog;

.field mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

.field private mForegroundCall:Lcom/android/internal/telephony/Call;

.field private mForegroundLastState:Lcom/android/internal/telephony/Call$State;

.field private mGenericErrorDialog:Landroid/app/AlertDialog;

.field private mHandler:Landroid/os/Handler;

.field private mInCallControlState:Lcom/android/phone/InCallControlState;

.field private mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

.field private mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

.field private mInVoiceAnswerVideoCall:Z

.field private mIsDestroyed:Z

.field private mIsForegroundActivity:Z

.field private mIsForegroundActivityForProximity:Z

.field private mLastClickActionTime:J

.field private final mLocaleChangeReceiver:Landroid/content/BroadcastReceiver;

.field private mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

.field private mMissingVoicemailDialog:Landroid/app/AlertDialog;

.field private mMmiStartedDialog:Landroid/app/Dialog;

.field private mOnAnswerandEndCall:Z

.field private mPauseInProgress:Z

.field private mPausePromptDialog:Landroid/app/AlertDialog;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPopupMenu:Landroid/widget/PopupMenu;

.field private mPostDialStrAfterPause:Ljava/lang/String;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRegisteredForPhoneStates:Z

.field private mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

.field private mRingingCall:Lcom/android/internal/telephony/Call;

.field private mRingingLastState:Lcom/android/internal/telephony/Call$State;

.field private mSecCallInfo:Landroid/view/ViewStub;

.field private mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

.field private mShowStatusIndication:Z

.field private mSimCollisionDialog:Landroid/app/AlertDialog;

.field private mSpeechEnabled:Z

.field private mStorageSpaceDialog:Landroid/app/AlertDialog;

.field private mSuppServiceFailureDialog:Landroid/app/AlertDialog;

.field private mSwappingCalls:Z

.field private mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

.field private mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

.field private mVTVoiceAnswerTimer:Ljava/util/Timer;

.field private mVoiceCommandHandler:Lcom/mediatek/phone/VoiceCommandHandler;

.field private mVoiceRecorderIcon:Landroid/widget/ImageView;

.field private mWaitPromptDialog:Landroid/app/AlertDialog;

.field private mWildPromptDialog:Landroid/app/AlertDialog;

.field private mWildPromptText:Landroid/widget/EditText;

.field private policyManager:Landroid/app/admin/DevicePolicyManager;

.field private sScreenSize:Landroid/graphics/Point;

.field private timer:Ljava/util/Timer;

.field private timerTask:Ljava/util/TimerTask;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 282
    const/4 v0, -0x1

    sput v0, Lcom/android/phone/InCallScreen;->sPreHeadsetPlugState:I

    .line 810
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/phone/InCallScreen;->mLocaleChanged:Z

    .line 821
    const-string v0, "com.mediatek.dm.LAWMO_LOCK"

    sput-object v0, Lcom/android/phone/InCallScreen;->ACTION_LOCKED:Ljava/lang/String;

    .line 822
    const-string v0, "com.mediatek.dm.LAWMO_UNLOCK"

    sput-object v0, Lcom/android/phone/InCallScreen;->ACTION_UNLOCK:Ljava/lang/String;

    .line 6956
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    .line 8234
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/phone/InCallScreen;->PHONE_DISCONNECT_GEMINI:[I

    .line 8241
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/phone/InCallScreen;->DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I

    return-void

    .line 8234
    nop

    :array_0
    .array-data 0x4
        0x66t 0x0t 0x0t 0x0t
        0x90t 0x0t 0x0t 0x0t
        0xf4t 0x0t 0x0t 0x0t
        0x58t 0x1t 0x0t 0x0t
    .end array-data

    .line 8241
    :array_1
    .array-data 0x4
        0x6ct 0x0t 0x0t 0x0t
        0x93t 0x0t 0x0t 0x0t
        0xf7t 0x0t 0x0t 0x0t
        0x5bt 0x1t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 167
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 284
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mSpeechEnabled:Z

    .line 285
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    .line 287
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/phone/InCallScreen;->mLastClickActionTime:J

    .line 321
    sget-object v0, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mForegroundLastState:Lcom/android/internal/telephony/Call$State;

    .line 322
    sget-object v0, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mBackgroundLastState:Lcom/android/internal/telephony/Call$State;

    .line 323
    sget-object v0, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mRingingLastState:Lcom/android/internal/telephony/Call$State;

    .line 387
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->delayTime_disableTouch:Ljava/lang/Boolean;

    .line 388
    const/16 v0, 0x1f40

    iput v0, p0, Lcom/android/phone/InCallScreen;->lock_screen_time:I

    .line 398
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mIsDestroyed:Z

    .line 399
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    .line 400
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivityForProximity:Z

    .line 405
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mPauseInProgress:Z

    .line 409
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 410
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mOnAnswerandEndCall:Z

    .line 413
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mInVoiceAnswerVideoCall:Z

    .line 414
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    .line 415
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerTimer:Ljava/util/Timer;

    .line 452
    new-instance v0, Lcom/android/phone/InCallScreen$1;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$1;-><init>(Lcom/android/phone/InCallScreen;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    .line 790
    new-instance v0, Lcom/android/phone/InCallScreen$2;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$2;-><init>(Lcom/android/phone/InCallScreen;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 811
    new-instance v0, Lcom/android/phone/InCallScreen$3;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$3;-><init>(Lcom/android/phone/InCallScreen;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mLocaleChangeReceiver:Landroid/content/BroadcastReceiver;

    .line 824
    new-instance v0, Lcom/android/phone/InCallScreen$4;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$4;-><init>(Lcom/android/phone/InCallScreen;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mDMLockReceiver:Landroid/content/BroadcastReceiver;

    .line 994
    new-instance v0, Lcom/android/phone/InCallScreen$5;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$5;-><init>(Lcom/android/phone/InCallScreen;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    .line 4468
    new-instance v0, Lcom/android/phone/InCallScreen$13;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$13;-><init>(Lcom/android/phone/InCallScreen;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mDialogClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/phone/InCallScreen;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsDestroyed:Z

    return v0
.end method

.method static synthetic access$100(Lcom/android/phone/InCallScreen;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/MmiCode;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->onMMIComplete(Lcom/android/internal/telephony/MmiCode;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/phone/InCallScreen;Landroid/os/AsyncResult;C)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 167
    invoke-direct {p0, p1, p2}, Lcom/android/phone/InCallScreen;->handlePostOnDialChars(Landroid/os/AsyncResult;C)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->addVoiceMailNumberPanel()V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dontAddVoiceMailNumber()V

    return-void
.end method

.method static synthetic access$1400(Lcom/android/phone/InCallScreen;)Lcom/android/phone/PhoneGlobals;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/phone/InCallScreen;)Lcom/android/internal/telephony/CallManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/phone/InCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/android/phone/InCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/android/phone/InCallScreen;)Lcom/android/phone/CallCard;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/android/phone/InCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1802(Lcom/android/phone/InCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->onIncomingRing()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/phone/InCallScreen;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->onNewRingingConnection()V

    return-void
.end method

.method static synthetic access$2102(Lcom/android/phone/InCallScreen;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    iput-boolean p1, p0, Lcom/android/phone/InCallScreen;->mSpeechEnabled:Z

    return p1
.end method

.method static synthetic access$2200(Lcom/android/phone/InCallScreen;)Lcom/android/phone/InCallControlState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallControlState:Lcom/android/phone/InCallControlState;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    return-void
.end method

.method static synthetic access$2400(Lcom/android/phone/InCallScreen;Lcom/android/phone/Constants$CallStatusCode;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->showStatusIndication(Lcom/android/phone/Constants$CallStatusCode;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/android/phone/InCallScreen;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2602(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    sput-boolean p0, Lcom/android/phone/InCallScreen;->mLocaleChanged:Z

    return p0
.end method

.method static synthetic access$2700()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    sget-object v0, Lcom/android/phone/InCallScreen;->ACTION_LOCKED:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2800()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    sget-object v0, Lcom/android/phone/InCallScreen;->ACTION_UNLOCK:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/android/phone/InCallScreen;)Landroid/bluetooth/BluetoothHeadset;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object v0
.end method

.method static synthetic access$2902(Lcom/android/phone/InCallScreen;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object p1
.end method

.method static synthetic access$300(Lcom/android/phone/InCallScreen;Landroid/os/AsyncResult;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->onPhoneStateChanged(Landroid/os/AsyncResult;)V

    return-void
.end method

.method static synthetic access$3000(Lcom/android/phone/InCallScreen;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$3002(Lcom/android/phone/InCallScreen;Landroid/widget/EditText;)Landroid/widget/EditText;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    return-object p1
.end method

.method static synthetic access$3100(Lcom/android/phone/InCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mSimCollisionDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->bailOutAfterErrorDialog()V

    return-void
.end method

.method static synthetic access$3300(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->bailOutAfterCanDismissDialog()V

    return-void
.end method

.method static synthetic access$3400(Lcom/android/phone/InCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$3502(Lcom/android/phone/InCallScreen;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    iput-wide p1, p0, Lcom/android/phone/InCallScreen;->mLastClickActionTime:J

    return-wide p1
.end method

.method static synthetic access$3600(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->lockscreen()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/phone/InCallScreen;Landroid/os/AsyncResult;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 167
    invoke-direct {p0, p1, p2}, Lcom/android/phone/InCallScreen;->onDisconnect(Landroid/os/AsyncResult;I)V

    return-void
.end method

.method static synthetic access$500()I
    .locals 1

    .prologue
    .line 167
    sget v0, Lcom/android/phone/InCallScreen;->sPreHeadsetPlugState:I

    return v0
.end method

.method static synthetic access$502(I)I
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    sput p0, Lcom/android/phone/InCallScreen;->sPreHeadsetPlugState:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/phone/InCallScreen;)Lcom/android/phone/InCallTouchUi;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/phone/InCallScreen;)Lcom/mediatek/phone/vt/IVTInCallScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/phone/InCallScreen;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->onMMICancel(I)V

    return-void
.end method

.method private activeManage()V
    .locals 3

    .prologue
    .line 8421
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 8422
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.app.extra.DEVICE_ADMIN"

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 8423
    const-string v1, "android.app.extra.ADD_EXPLANATION"

    const-string v2, "------------"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8424
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/phone/InCallScreen;->startActivityForResult(Landroid/content/Intent;I)V

    .line 8425
    return-void
.end method

.method private addVoiceMailNumberPanel()V
    .locals 2

    .prologue
    .line 4045
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 4046
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 4047
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    .line 4049
    :cond_0
    const-string v1, "addVoiceMailNumberPanel: finishing InCallScreen..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4050
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 4052
    const-string v1, "show vm setting"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4055
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4056
    .local v0, intent:Landroid/content/Intent;
    const-class v1, Lcom/android/phone/CallFeaturesSetting;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 4057
    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->startActivity(Landroid/content/Intent;)V

    .line 4058
    return-void
.end method

.method private amendLayoutForDifferentScreen()V
    .locals 4

    .prologue
    .line 8377
    sget-boolean v1, Lcom/android/phone/PhoneGlobals;->sHasNavigationBar:Z

    if-eqz v1, :cond_0

    .line 8380
    const v1, 0x7f08000f

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    .line 8381
    .local v0, view:Landroid/view/ViewStub;
    invoke-virtual {v0}, Landroid/view/ViewStub;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0049

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8384
    .end local v0           #view:Landroid/view/ViewStub;
    :cond_0
    return-void
.end method

.method private bailOutAfterCanDismissDialog()V
    .locals 2

    .prologue
    .line 5278
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 5279
    const-string v1, "bailOutAfterCanDismissDialog: DISMISSING mCanDismissDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5280
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5281
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    .line 5283
    :cond_0
    const-string v1, "bailOutAfterCanDismissDialog(): end InCallScreen session..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5297
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    .line 5298
    .local v0, inCallUiState:Lcom/android/phone/InCallUiState;
    invoke-virtual {v0}, Lcom/android/phone/InCallUiState;->clearPendingCallStatusCode()V

    .line 5306
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v1

    if-nez v1, :cond_1

    .line 5307
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->endInCallScreenSession(Z)V

    .line 5309
    :cond_1
    return-void
.end method

.method private bailOutAfterErrorDialog()V
    .locals 2

    .prologue
    .line 5244
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 5245
    const-string v1, "bailOutAfterErrorDialog: DISMISSING mGenericErrorDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5246
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5247
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    .line 5249
    :cond_0
    const-string v1, "bailOutAfterErrorDialog(): end InCallScreen session..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5263
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    .line 5264
    .local v0, inCallUiState:Lcom/android/phone/InCallUiState;
    invoke-virtual {v0}, Lcom/android/phone/InCallUiState;->clearPendingCallStatusCode()V

    .line 5272
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v1

    if-nez v1, :cond_1

    .line 5273
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->endInCallScreenSession(Z)V

    .line 5275
    :cond_1
    return-void
.end method

.method private canHangupAll()Z
    .locals 5

    .prologue
    .line 4499
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 4500
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 4501
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    const/4 v2, 0x0

    .line 4502
    .local v2, retval:Z
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_0

    .line 4503
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_1

    .line 4504
    const/4 v2, 0x1

    .line 4509
    :cond_0
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "canHangupAll = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4510
    return v2

    .line 4505
    :cond_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->hasActivefgEccCall(Lcom/android/internal/telephony/CallManager;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 4506
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private checkOtaspStateOnResume()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 6741
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-nez v3, :cond_1

    .line 6742
    const-string v3, "checkOtaspStateOnResume: no OtaUtils instance; nothing to do."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    move v1, v2

    .line 6846
    :cond_0
    :goto_0
    return v1

    .line 6746
    :cond_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    if-nez v3, :cond_3

    .line 6750
    :cond_2
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "checkOtaspStateOnResume: app.cdmaOta* objects(s) not initialized"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 6758
    :cond_3
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v3}, Lcom/android/phone/OtaUtils;->getCdmaOtaInCallScreenUiState()Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;

    move-result-object v0

    .line 6765
    .local v0, cdmaOtaInCallScreenState:Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;
    sget-object v3, Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;->NORMAL:Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;

    if-eq v0, v3, :cond_4

    sget-object v3, Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;->ENDED:Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;

    if-ne v0, v3, :cond_5

    :cond_4
    const/4 v1, 0x1

    .line 6769
    .local v1, otaspUiActive:Z
    :goto_1
    if-eqz v1, :cond_7

    .line 6776
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v2, p0, v3, v4}, Lcom/android/phone/OtaUtils;->updateUiWidgets(Lcom/android/phone/InCallScreen;Landroid/view/ViewGroup;Lcom/android/phone/CallCard;)V

    .line 6780
    sget-object v2, Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;->NORMAL:Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;

    if-ne v0, v2, :cond_6

    .line 6781
    const-string v2, "checkOtaspStateOnResume - in OTA Normal mode"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6782
    sget-object v2, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    goto :goto_0

    .end local v1           #otaspUiActive:Z
    :cond_5
    move v1, v2

    .line 6765
    goto :goto_1

    .line 6783
    .restart local v1       #otaspUiActive:Z
    :cond_6
    sget-object v2, Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;->ENDED:Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;

    if-ne v0, v2, :cond_0

    .line 6785
    const-string v2, "checkOtaspStateOnResume - in OTA END mode"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6786
    sget-object v2, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    goto :goto_0

    .line 6801
    :cond_7
    const-string v3, "checkOtaspStateOnResume - Set OTA NORMAL Mode"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6802
    sget-object v3, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 6804
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v3, :cond_0

    .line 6805
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v3, v2}, Lcom/android/phone/OtaUtils;->cleanOtaScreen(Z)V

    goto :goto_0
.end method

.method private cleanupAfterDisconnect(I)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 4070
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->clearDisconnected()V

    .line 4071
    return-void
.end method

.method private closeDialpadInternal(Z)V
    .locals 2
    .parameter "animate"

    .prologue
    .line 4670
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, p1}, Lcom/android/phone/DTMFTwelveKeyDialer;->closeDialer(Z)V

    .line 4673
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/phone/InCallUiState;->showDialpad:Z

    .line 4674
    return-void
.end method

.method private comparePhoneNumbers()Z
    .locals 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 6963
    sget-object v2, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move v2, v4

    .line 6982
    :goto_0
    return v2

    .line 6969
    :cond_1
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v0

    .line 6971
    .local v0, fgCalls:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    sget-object v2, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-eq v2, v5, :cond_2

    move v2, v3

    .line 6972
    goto :goto_0

    .line 6975
    :cond_2
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 6976
    sget-object v2, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    move v2, v3

    .line 6977
    goto :goto_0

    .line 6978
    :cond_3
    sget-object v2, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v4, :cond_4

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/Connection;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->isAlive()Z

    move-result v2

    if-nez v2, :cond_4

    move v2, v3

    .line 6979
    goto :goto_0

    .line 6975
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    move v2, v4

    .line 6982
    goto :goto_0
.end method

.method private constructPopupMenu(Landroid/view/View;)Landroid/widget/PopupMenu;
    .locals 3
    .parameter "anchorView"

    .prologue
    .line 7243
    new-instance v1, Landroid/widget/PopupMenu;

    invoke-direct {v1, p0, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 7244
    .local v1, popupMenu:Landroid/widget/PopupMenu;
    invoke-virtual {v1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 7245
    .local v0, menu:Landroid/view/Menu;
    const v2, 0x7f100003

    invoke-virtual {v1, v2}, Landroid/widget/PopupMenu;->inflate(I)V

    .line 7246
    invoke-virtual {v1, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 7247
    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->setupMenuItems(Landroid/view/Menu;)V

    .line 7248
    return-object v1
.end method

.method private createWildPromptView()Landroid/view/View;
    .locals 10

    .prologue
    const/4 v9, -0x2

    const/high16 v8, 0x4160

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v4, 0x5

    .line 3643
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 3644
    .local v3, result:Landroid/widget/LinearLayout;
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3645
    invoke-virtual {v3, v4, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 3647
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v0, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 3651
    .local v0, lp:Landroid/widget/LinearLayout$LayoutParams;
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 3652
    .local v2, promptMsg:Landroid/widget/TextView;
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 3653
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 3654
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d01a1

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3656
    invoke-virtual {v3, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 3658
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    .line 3659
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    invoke-static {}, Landroid/text/method/DialerKeyListener;->getInstance()Landroid/text/method/DialerKeyListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 3660
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 3661
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    invoke-virtual {v4, v8}, Landroid/widget/EditText;->setTextSize(F)V

    .line 3662
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    invoke-virtual {v4, v7}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 3663
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    invoke-virtual {v4, v7}, Landroid/widget/EditText;->setHorizontallyScrolling(Z)V

    .line 3664
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    const v5, 0x1080018

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 3666
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v1, v4, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 3669
    .local v1, lp2:Landroid/widget/LinearLayout$LayoutParams;
    const/4 v4, 0x3

    invoke-virtual {v1, v6, v4, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 3671
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    invoke-virtual {v3, v4, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 3673
    return-object v3
.end method

.method private dismissAllDialogs()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 5318
    const-string v0, "dismissAllDialogs()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5325
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 5326
    const-string v0, "- DISMISSING mGenericErrorDialog."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5327
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 5328
    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    .line 5331
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 5332
    const-string v0, "- DISMISSING mStorageSpaceDialog."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5333
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 5334
    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    .line 5337
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 5338
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 5339
    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    .line 5342
    :cond_2
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    .line 5343
    const-string v0, "- DISMISSING mSuppServiceFailureDialog."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5344
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 5345
    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    .line 5348
    :cond_3
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissDialogs()V

    .line 5349
    return-void
.end method

.method private dismissDialogs()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 5352
    const-string v1, "dismissDialogs()..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5359
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {v1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->dismissDialogs()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5426
    :goto_0
    return-void

    .line 5363
    :cond_0
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_1

    .line 5364
    const-string v1, "- DISMISSING mMissingVoicemailDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5365
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5366
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    .line 5368
    :cond_1
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_2

    .line 5369
    const-string v1, "- DISMISSING mMmiStartedDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5370
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 5371
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    .line 5373
    :cond_2
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_3

    .line 5374
    const-string v1, "- DISMISSING mGenericErrorDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5375
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5376
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    .line 5379
    :cond_3
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_4

    .line 5380
    const-string v1, "- DISMISSING mWaitPromptDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5381
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5382
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    .line 5385
    :cond_4
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_5

    .line 5386
    const-string v1, "- DISMISSING mWildPromptDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5387
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5388
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    .line 5390
    :cond_5
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCallLostDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_6

    .line 5391
    const-string v1, "- DISMISSING mCallLostDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5392
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCallLostDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5393
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mCallLostDialog:Landroid/app/AlertDialog;

    .line 5395
    :cond_6
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_8

    .line 5396
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    .line 5397
    .local v0, app:Lcom/android/phone/PhoneGlobals;
    iget-object v1, v0, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->setPhone(Lcom/android/internal/telephony/Phone;)V

    .line 5398
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mBackgroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 5399
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 5401
    :cond_7
    const-string v1, "- DISMISSING mCanDismissDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5402
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5403
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    .line 5405
    .end local v0           #app:Lcom/android/phone/PhoneGlobals;
    :cond_8
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v1, v1, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v2, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v1, v2, :cond_9

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v1, v1, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v2, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v1, v2, :cond_a

    :cond_9
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v1, :cond_a

    .line 5408
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v1}, Lcom/android/phone/OtaUtils;->dismissAllOtaDialogs()V

    .line 5410
    :cond_a
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_b

    .line 5411
    const-string v1, "- DISMISSING mPausePromptDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5412
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5413
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    .line 5416
    :cond_b
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mSimCollisionDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_c

    .line 5417
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mSimCollisionDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5418
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mSimCollisionDialog:Landroid/app/AlertDialog;

    .line 5420
    :cond_c
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_d

    .line 5421
    const-string v1, "- DISMISSING mExitingECMDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5422
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 5423
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    .line 5425
    :cond_d
    const-string v1, "dismissDialogs() done"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private dismissProgressIndication()V
    .locals 1

    .prologue
    .line 5508
    const-string v0, "dismissProgressIndication()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5509
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 5510
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 5511
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 5513
    :cond_0
    return-void
.end method

.method private dontAddVoiceMailNumber()V
    .locals 1

    .prologue
    .line 4061
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 4062
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 4063
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    .line 4065
    :cond_0
    const-string v0, "dontAddVoiceMailNumber: finishing InCallScreen..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4066
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 4067
    return-void
.end method

.method private dumpBluetoothState()V
    .locals 4

    .prologue
    .line 6616
    const-string v2, "============== dumpBluetoothState() ============="

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6617
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "= isBluetoothAvailable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6618
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "= isBluetoothAudioConnected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6619
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "= isBluetoothAudioConnectedOrPending: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnectedOrPending()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6620
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "= PhoneGlobals.showBluetoothIndication: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->showBluetoothIndication()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6622
    const-string v2, "="

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6623
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v2, :cond_2

    .line 6624
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v2, :cond_1

    .line 6625
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothHeadset;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    .line 6627
    .local v1, deviceList:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 6628
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 6629
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "= BluetoothHeadset.getCurrentDevice: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6630
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "= BluetoothHeadset.State: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothHeadset;->getConnectionState(Landroid/bluetooth/BluetoothDevice;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6632
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "= BluetoothHeadset audio connected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothHeadset;->isAudioConnected(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6641
    .end local v0           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v1           #deviceList:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_0
    :goto_0
    return-void

    .line 6636
    :cond_1
    const-string v2, "= mBluetoothHeadset is null"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 6639
    :cond_2
    const-string v2, "= mBluetoothAdapter is null; device is not BT capable"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private endInCallScreenSession(Z)V
    .locals 2
    .parameter "forceFinish"

    .prologue
    .line 1675
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "endInCallScreenSession("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")...  phone state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1683
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->handleRecordProc()V

    .line 1687
    if-eqz p1, :cond_0

    .line 1688
    const-string v0, "InCallScreen"

    const-string v1, "endInCallScreenSession(): FORCING a call to super.finish()!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1689
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 1694
    :goto_0
    sget-object v0, Lcom/android/phone/InCallUiState$InCallScreenMode;->UNDEFINED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 1695
    return-void

    .line 1692
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->moveTaskToBack(Z)Z

    goto :goto_0
.end method

.method private finishIfNecessory()V
    .locals 7

    .prologue
    .line 4222
    const-string v5, "gsm.sim.state"

    invoke-static {v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 4223
    .local v4, simState:Ljava/lang/String;
    const-string v5, "PIN_REQUIRED"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "PUK_REQUIRED"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 4225
    :cond_0
    const-string v5, "PIN or PUK Locked, need finish InCallScreen."

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4227
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 4243
    :cond_1
    :goto_0
    return-void

    .line 4231
    :cond_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "activity"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 4232
    .local v0, am:Landroid/app/ActivityManager;
    const/4 v5, 0x5

    invoke-virtual {v0, v5}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v3

    .line 4233
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 4235
    .local v2, info:Landroid/app/ActivityManager$RunningTaskInfo;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info.baseActivity.getPackageName() "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v2, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4237
    if-eqz v2, :cond_3

    iget-object v5, v2, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "com.mediatek.oobe"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 4238
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method private getSuppServiceMOStringId(Lcom/android/internal/telephony/gsm/SuppServiceNotification;)Ljava/lang/String;
    .locals 3
    .parameter "notification"

    .prologue
    .line 2551
    const-string v0, ""

    .line 2552
    .local v0, retStr:Ljava/lang/String;
    iget v1, p1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->code:I

    packed-switch v1, :pswitch_data_0

    .line 2584
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d02da

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2587
    :goto_0
    return-object v0

    .line 2554
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00f9

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2555
    goto :goto_0

    .line 2557
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00fa

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2558
    goto :goto_0

    .line 2560
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00fb

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2561
    goto :goto_0

    .line 2563
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00fc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2564
    goto :goto_0

    .line 2566
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00fd

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2567
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->index:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2568
    goto :goto_0

    .line 2570
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00fe

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2571
    goto :goto_0

    .line 2573
    :pswitch_6
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00ff

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2574
    goto :goto_0

    .line 2576
    :pswitch_7
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0100

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2577
    goto :goto_0

    .line 2579
    :pswitch_8
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0101

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2580
    goto/16 :goto_0

    .line 2552
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method private getSuppServiceMTStringId(Lcom/android/internal/telephony/gsm/SuppServiceNotification;)Ljava/lang/String;
    .locals 4
    .parameter "notification"

    .prologue
    const v3, 0x7f0d0102

    .line 2592
    const-string v0, ""

    .line 2593
    .local v0, retStr:Ljava/lang/String;
    iget v1, p1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->code:I

    packed-switch v1, :pswitch_data_0

    .line 2655
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d02da

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2658
    :goto_0
    return-object v0

    .line 2595
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2596
    goto :goto_0

    .line 2598
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0103

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2599
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->index:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2600
    goto :goto_0

    .line 2602
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0104

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2603
    goto :goto_0

    .line 2605
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0105

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2606
    goto :goto_0

    .line 2608
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0106

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2609
    goto :goto_0

    .line 2611
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0107

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2612
    goto :goto_0

    .line 2614
    :pswitch_6
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0108

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2615
    goto :goto_0

    .line 2617
    :pswitch_7
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0109

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2618
    goto :goto_0

    .line 2620
    :pswitch_8
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d010a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2621
    goto/16 :goto_0

    .line 2623
    :pswitch_9
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d010b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2624
    goto/16 :goto_0

    .line 2626
    :pswitch_a
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d010c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2627
    goto/16 :goto_0

    .line 2629
    :pswitch_b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d010d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2631
    goto/16 :goto_0

    .line 2633
    :pswitch_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d010e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2635
    goto/16 :goto_0

    .line 2637
    :pswitch_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d010f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2639
    goto/16 :goto_0

    .line 2641
    :pswitch_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0110

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2643
    goto/16 :goto_0

    .line 2645
    :pswitch_f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0111

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2647
    goto/16 :goto_0

    .line 2649
    :pswitch_10
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0112

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2651
    goto/16 :goto_0

    .line 2593
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
    .end packed-switch
.end method

.method public static getmLocaleChangedOnlyForTest()Z
    .locals 1

    .prologue
    .line 6348
    sget-boolean v0, Lcom/android/phone/InCallScreen;->mLocaleChanged:Z

    return v0
.end method

.method private handleCallKey()Z
    .locals 10

    .prologue
    const/4 v7, 0x1

    .line 2231
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v3

    .line 2232
    .local v3, hasRingingCall:Z
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v1

    .line 2233
    .local v1, hasActiveCall:Z
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v2

    .line 2235
    .local v2, hasHoldingCall:Z
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2236
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2237
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->handleCallKeyForDualTalk()Z

    move-result v7

    .line 2358
    :cond_0
    :goto_0
    return v7

    .line 2241
    :cond_1
    const/4 v6, 0x1

    .line 2242
    .local v6, phoneType:I
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v8, :cond_3

    .line 2243
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->getFirstPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    .line 2244
    .local v5, phone:Lcom/android/internal/telephony/Phone;
    if-eqz v5, :cond_2

    .line 2245
    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v6

    .line 2251
    .end local v5           #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    :goto_1
    const/4 v8, 0x2

    if-ne v6, v8, :cond_7

    .line 2255
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    invoke-virtual {v8}, Lcom/android/phone/CdmaPhoneCallState;->getCurrentCallState()Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    move-result-object v0

    .line 2257
    .local v0, currCallState:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;
    if-eqz v3, :cond_4

    .line 2260
    const-string v8, "answerCall: First Incoming and Call Waiting scenario"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2262
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->internalAnswerCall()V

    goto :goto_0

    .line 2248
    .end local v0           #currCallState:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;
    :cond_3
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v6

    goto :goto_1

    .line 2264
    .restart local v0       #currCallState:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;
    :cond_4
    sget-object v8, Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;->THRWAY_ACTIVE:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    if-ne v0, v8, :cond_5

    if-eqz v1, :cond_5

    .line 2268
    const-string v8, "answerCall: Merge 3-way call scenario"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2271
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v8}, Lcom/android/phone/PhoneUtils;->mergeCalls(Lcom/android/internal/telephony/CallManager;)V

    goto :goto_0

    .line 2272
    :cond_5
    sget-object v8, Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;->CONF_CALL:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    if-ne v0, v8, :cond_6

    .line 2276
    const-string v8, "answerCall: Switch btwn 2 calls scenario"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2278
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSwapCalls()V

    goto :goto_0

    .line 2279
    :cond_6
    sget-object v8, Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;->SINGLE_ACTIVE:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    if-ne v0, v8, :cond_0

    if-eqz v1, :cond_0

    .line 2282
    const-string v8, "handleCallKey: hold/unhold cdma case."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2284
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSwapCalls()V

    goto :goto_0

    .line 2286
    .end local v0           #currCallState:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;
    :cond_7
    if-eq v6, v7, :cond_8

    const/4 v8, 0x3

    if-ne v6, v8, :cond_c

    .line 2288
    :cond_8
    if-eqz v3, :cond_9

    .line 2299
    const-string v8, "InCallScreen"

    const-string v9, "handleCallKey: incoming call is ringing! (PhoneWindowManager should have handled this key.)"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2310
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->internalAnswerCall()V

    goto :goto_0

    .line 2311
    :cond_9
    if-eqz v1, :cond_a

    if-eqz v2, :cond_a

    .line 2313
    const-string v8, "handleCallKey: both lines in use "

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2314
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 2316
    const-string v8, "handleCallKey: ==> swap calls."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2318
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSwapCalls()V

    goto/16 :goto_0

    .line 2320
    :cond_a
    if-eqz v2, :cond_b

    .line 2323
    const-string v8, "handleCallKey: call on hold ==> unhold."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2324
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-static {v8}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_0

    .line 2333
    :cond_b
    const-string v8, "handleCallKey: call in foregound ==> ignoring."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2336
    const/4 v4, 0x0

    .line 2345
    .local v4, ignoreThisCallKey:Z
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "handleCallKey: ignoreThisCallKey = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2347
    if-nez v4, :cond_0

    .line 2349
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-static {v8}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_0

    .line 2353
    .end local v4           #ignoreThisCallKey:Z
    :cond_c
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected phone type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private handleCallKeyForDualTalk()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 7986
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_0

    .line 7989
    const-string v0, "handleCallKeyForDualTalk: rev call-key when ringing!"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7994
    :cond_0
    return v2
.end method

.method private handleDialerKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 2134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleDialerKeyDown: keyCode "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", event "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2140
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->okToDialDTMFTones()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2141
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, p2}, Lcom/android/phone/DTMFTwelveKeyDialer;->onDialerKeyDown(Landroid/view/KeyEvent;)Z

    move-result v0

    .line 2151
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private handleMissingVoiceMailNumber()V
    .locals 5

    .prologue
    .line 4005
    const-string v2, "handleMissingVoiceMailNumber"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4007
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v0

    .line 4008
    .local v0, msg:Landroid/os/Message;
    const/16 v2, 0x6b

    iput v2, v0, Landroid/os/Message;->what:I

    .line 4010
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v1

    .line 4011
    .local v1, msg2:Landroid/os/Message;
    const/16 v2, 0x6a

    iput v2, v1, Landroid/os/Message;->what:I

    .line 4013
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0d01a2

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0d01a3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0d0192

    new-instance v4, Lcom/android/phone/InCallScreen$12;

    invoke-direct {v4, p0, v0}, Lcom/android/phone/InCallScreen$12;-><init>(Lcom/android/phone/InCallScreen;Landroid/os/Message;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0d01a4

    new-instance v4, Lcom/android/phone/InCallScreen$11;

    invoke-direct {v4, p0, v1}, Lcom/android/phone/InCallScreen$11;-><init>(Lcom/android/phone/InCallScreen;Landroid/os/Message;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/android/phone/InCallScreen$10;

    invoke-direct {v3, p0, v0}, Lcom/android/phone/InCallScreen$10;-><init>(Lcom/android/phone/InCallScreen;Landroid/os/Message;)V

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    .line 4039
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 4040
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2, p0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 4041
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mMissingVoicemailDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 4042
    return-void
.end method

.method private handlePostOnDialChars(Landroid/os/AsyncResult;C)V
    .locals 5
    .parameter "r"
    .parameter "ch"

    .prologue
    .line 3510
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 3512
    .local v0, c:Lcom/android/internal/telephony/Connection;
    if-eqz v0, :cond_0

    .line 3513
    iget-object v2, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/Connection$PostDialState;

    .line 3516
    .local v2, state:Lcom/android/internal/telephony/Connection$PostDialState;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handlePostOnDialChar: state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", ch = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3519
    sget-object v3, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$internal$telephony$Connection$PostDialState:[I

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection$PostDialState;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 3568
    .end local v2           #state:Lcom/android/internal/telephony/Connection$PostDialState;
    :cond_0
    :goto_0
    return-void

    .line 3521
    .restart local v2       #state:Lcom/android/internal/telephony/Connection$PostDialState;
    :pswitch_0
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->stopLocalToneIfNeeded()V

    .line 3522
    iget-boolean v3, p0, Lcom/android/phone/InCallScreen;->mPauseInProgress:Z

    if-eqz v3, :cond_1

    .line 3527
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPostDialStrAfterPause:Ljava/lang/String;

    invoke-direct {p0, v0, v3}, Lcom/android/phone/InCallScreen;->showPausePromptDialog(Lcom/android/internal/telephony/Connection;Ljava/lang/String;)V

    .line 3529
    :cond_1
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/phone/InCallScreen;->mPauseInProgress:Z

    .line 3530
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3, p2}, Lcom/android/phone/DTMFTwelveKeyDialer;->startLocalToneIfNeeded(C)V

    goto :goto_0

    .line 3541
    :pswitch_1
    const-string v3, "handlePostOnDialChars: show WAIT prompt..."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3542
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->stopLocalToneIfNeeded()V

    .line 3543
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getRemainingPostDialString()Ljava/lang/String;

    move-result-object v1

    .line 3544
    .local v1, postDialStr:Ljava/lang/String;
    invoke-direct {p0, v0, v1}, Lcom/android/phone/InCallScreen;->showWaitPromptDialog(Lcom/android/internal/telephony/Connection;Ljava/lang/String;)V

    goto :goto_0

    .line 3548
    .end local v1           #postDialStr:Ljava/lang/String;
    :pswitch_2
    const-string v3, "handlePostOnDialChars: show WILD prompt"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3549
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->stopLocalToneIfNeeded()V

    .line 3550
    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->showWildPromptDialog(Lcom/android/internal/telephony/Connection;)V

    goto :goto_0

    .line 3554
    :pswitch_3
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->stopLocalToneIfNeeded()V

    goto :goto_0

    .line 3559
    :pswitch_4
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->stopLocalToneIfNeeded()V

    .line 3560
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getRemainingPostDialString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mPostDialStrAfterPause:Ljava/lang/String;

    .line 3561
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/phone/InCallScreen;->mPauseInProgress:Z

    goto :goto_0

    .line 3519
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private handleRecordProc()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 7008
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/phone/recording/PhoneRecorder;->getInstance(Landroid/content/Context;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v1

    .line 7009
    .local v1, phoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    sget-object v4, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    if-eqz v4, :cond_0

    sget-object v4, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_3

    .line 7010
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "the record custom value is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getCustomValue()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7011
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getCustomValue()I

    move-result v4

    if-nez v4, :cond_2

    .line 7013
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorder;->isRecording()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 7014
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->stopRecord()V

    .line 7020
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updatePrevPhonenums()V

    .line 7046
    :goto_1
    return-void

    .line 7016
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getCustomValue()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 7018
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v3}, Lcom/mediatek/phone/vt/IVTInCallScreen;->stopRecord()V

    goto :goto_0

    .line 7023
    :cond_3
    const/4 v2, 0x0

    .line 7024
    .local v2, recordFlag:Z
    invoke-virtual {v1}, Lcom/mediatek/phone/recording/PhoneRecorder;->ismFlagRecord()Z

    move-result v2

    .line 7025
    const/4 v0, 0x0

    .line 7026
    .local v0, isDifferent:Z
    if-eqz v2, :cond_4

    .line 7027
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->comparePhoneNumbers()Z

    move-result v4

    if-nez v4, :cond_5

    move v0, v3

    .line 7028
    :goto_2
    if-eqz v0, :cond_4

    .line 7029
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getCustomValue()I

    move-result v4

    if-nez v4, :cond_6

    .line 7031
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorder;->isRecording()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 7032
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->stopRecord()V

    .line 7040
    :cond_4
    :goto_3
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updatePrevPhonenums()V

    .line 7044
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getPhoneRecorderState()I

    move-result v3

    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getCustomValue()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/android/phone/InCallScreen;->requestUpdateRecordState(II)V

    goto :goto_1

    .line 7027
    :cond_5
    const/4 v0, 0x0

    goto :goto_2

    .line 7034
    :cond_6
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getCustomValue()I

    move-result v4

    if-ne v3, v4, :cond_4

    .line 7036
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v3}, Lcom/mediatek/phone/vt/IVTInCallScreen;->stopRecord()V

    goto :goto_3
.end method

.method private handleSwapCdmaAndGsm()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 7923
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 7924
    .local v3, fgCall:Lcom/android/internal/telephony/Call;
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 7926
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    .line 7927
    .local v4, fgCallPhoneType:I
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    .line 7930
    .local v1, bgCallPhoneType:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleSwapCdmaAndGsm fgCall = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7931
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleSwapCdmaAndGsm bgCall = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7935
    if-ne v4, v7, :cond_1

    if-ne v1, v7, :cond_1

    .line 7937
    const-string v5, "handleSwapCdmaAndGsm: switch between two GSM calls."

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7939
    :try_start_0
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7982
    :cond_0
    :goto_0
    return-void

    .line 7940
    :catch_0
    move-exception v2

    .line 7941
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7944
    .end local v2           #e:Ljava/lang/Exception;
    :cond_1
    const/4 v5, 0x2

    if-ne v4, v5, :cond_3

    .line 7945
    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->hasMultipleConnections(Lcom/android/internal/telephony/Call;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 7946
    const-string v5, "handleSwapCdmaAndGsm: cdma has multiple calls and in foreground, only switch the audio."

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7949
    :try_start_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 7950
    :catch_1
    move-exception v2

    .line 7951
    .restart local v2       #e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7954
    .end local v2           #e:Ljava/lang/Exception;
    :cond_2
    const-string v5, "handleSwapCdmaAndGsm: cdma has single call and in foreground, switch by phone"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7956
    :try_start_2
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V

    .line 7957
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 7958
    :catch_2
    move-exception v2

    .line 7959
    .restart local v2       #e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7963
    .end local v2           #e:Ljava/lang/Exception;
    :cond_3
    if-ne v4, v7, :cond_0

    .line 7964
    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->hasMultipleConnections(Lcom/android/internal/telephony/Call;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 7965
    const-string v5, "handleSwapCdmaAndGsm: cdma has multiple calls and in background, only switch the audio"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7968
    :try_start_3
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_0

    .line 7969
    :catch_3
    move-exception v2

    .line 7970
    .restart local v2       #e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7973
    .end local v2           #e:Ljava/lang/Exception;
    :cond_4
    const-string v5, "handleSwapCdmaAndGsm: cdma has single call and in background, switch by phone"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7975
    :try_start_4
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V

    .line 7976
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_0

    .line 7977
    :catch_4
    move-exception v2

    .line 7978
    .restart local v2       #e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private initInCallScreen()V
    .locals 3

    .prologue
    .line 2083
    const-string v1, "initInCallScreen()..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2086
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x8000

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 2089
    new-instance v1, Lcom/android/phone/CallTime;

    invoke-direct {v1, p0}, Lcom/android/phone/CallTime;-><init>(Lcom/android/phone/CallTime$OnTickListener;)V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    .line 2092
    const v1, 0x7f08006e

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/phone/CallCard;

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    .line 2093
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  - mCallCard = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2096
    const v1, 0x7f08000f

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mSecCallInfo:Landroid/view/ViewStub;

    .line 2099
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v1, p0}, Lcom/android/phone/CallCard;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 2101
    const v1, 0x7f0800f3

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mVoiceRecorderIcon:Landroid/widget/ImageView;

    .line 2102
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVoiceRecorderIcon:Landroid/widget/ImageView;

    const v2, 0x7f0200b2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 2103
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVoiceRecorderIcon:Landroid/widget/ImageView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2106
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->initInCallTouchUi()V

    .line 2109
    new-instance v1, Lcom/android/phone/InCallControlState;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-direct {v1, p0, v2}, Lcom/android/phone/InCallControlState;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/CallManager;)V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mInCallControlState:Lcom/android/phone/InCallControlState;

    .line 2110
    new-instance v1, Lcom/mediatek/phone/InCallMenuState;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-direct {v1, p0, v2}, Lcom/mediatek/phone/InCallMenuState;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/CallManager;)V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    .line 2113
    new-instance v1, Lcom/android/phone/ManageConferenceUtils;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-direct {v1, p0, v2}, Lcom/android/phone/ManageConferenceUtils;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/CallManager;)V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    .line 2116
    const v1, 0x7f080073

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    .line 2117
    .local v0, stub:Landroid/view/ViewStub;
    new-instance v1, Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-direct {v1, p0, v0}, Lcom/android/phone/DTMFTwelveKeyDialer;-><init>(Lcom/android/phone/InCallScreen;Landroid/view/ViewStub;)V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    .line 2118
    const-string v1, "power"

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mPowerManager:Landroid/os/PowerManager;

    .line 2121
    new-instance v1, Lcom/mediatek/phone/vt/VTInCallScreenProxy;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-direct {v1, p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreenProxy;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/phone/DTMFTwelveKeyDialer;)V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    .line 2122
    return-void
.end method

.method private initInCallTouchUi()V
    .locals 1

    .prologue
    .line 6244
    const-string v0, "initInCallTouchUi()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6249
    const v0, 0x7f08006f

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/phone/InCallTouchUi;

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    .line 6250
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    invoke-virtual {v0, p0}, Lcom/android/phone/InCallTouchUi;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 6254
    new-instance v0, Lcom/android/phone/RespondViaSmsManager;

    invoke-direct {v0}, Lcom/android/phone/RespondViaSmsManager;-><init>()V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    .line 6255
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v0, p0}, Lcom/android/phone/RespondViaSmsManager;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 6256
    return-void
.end method

.method private initPolicyManager()V
    .locals 2

    .prologue
    .line 8388
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a000f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->delayTime_disableTouch:Ljava/lang/Boolean;

    .line 8389
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0006

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/InCallScreen;->lock_screen_time:I

    .line 8390
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->delayTime_disableTouch:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 8391
    const-string v0, "device_policy"

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManager;

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->policyManager:Landroid/app/admin/DevicePolicyManager;

    .line 8392
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/android/phone/AdminReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->componentName:Landroid/content/ComponentName;

    .line 8394
    :cond_0
    return-void
.end method

.method private initVTAutoAnswer()V
    .locals 0

    .prologue
    .line 7599
    return-void
.end method

.method private internalAnswerAndEnd()V
    .locals 2

    .prologue
    .line 5672
    const-string v0, "internalAnswerAndEnd()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5673
    invoke-static {}, Lcom/android/phone/PhoneUtils;->dumpCallManager()V

    .line 5676
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/phone/PhoneUtils;->answerAndEndActive(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)Z

    .line 5677
    return-void
.end method

.method private internalHangup()V
    .locals 3

    .prologue
    .line 5751
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    .line 5752
    .local v0, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "internalHangup()...  phone state = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5757
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->hangup(Lcom/android/internal/telephony/CallManager;)Z

    .line 5772
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_1

    .line 5774
    const-string v1, "InCallScreen"

    const-string v2, "internalHangup(): phone is already IDLE!"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 5797
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v1}, Lcom/android/phone/CallCard;->getVisibility()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v1}, Lcom/android/phone/CallCard;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_1

    .line 5798
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 5799
    const-string v1, "InCallScreen"

    const-string v2, "internalHangup(): phone is already IDLE, end ourself!"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 5802
    :cond_1
    return-void
.end method

.method private internalResolveIntent(Landroid/content/Intent;)V
    .locals 7
    .parameter "intent"

    .prologue
    const/4 v6, 0x0

    .line 1886
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 2074
    :cond_0
    :goto_0
    return-void

    .line 1889
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1890
    .local v0, action:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "internalResolveIntent: action="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1910
    const-string v4, "android.intent.action.MAIN"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1921
    const-string v4, "com.android.phone.ShowDialpad"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1926
    const-string v4, "com.android.phone.ShowDialpad"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    .line 1927
    .local v3, showDialpad:Z
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "- internalResolveIntent: SHOW_DIALPAD_EXTRA: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1931
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iput-boolean v3, v4, Lcom/android/phone/InCallUiState;->showDialpad:Z

    .line 1933
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v1

    .line 1934
    .local v1, hasActiveCall:Z
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v2

    .line 1938
    .local v2, hasHoldingCall:Z
    if-eqz v3, :cond_2

    if-nez v1, :cond_2

    if-eqz v2, :cond_2

    .line 1939
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    .line 1943
    .end local v1           #hasActiveCall:Z
    .end local v2           #hasHoldingCall:Z
    .end local v3           #showDialpad:Z
    :cond_2
    const-string v4, "isForPlaceCall"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1944
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4, v5}, Lcom/android/phone/CallCard;->hideCallStates(Lcom/android/internal/telephony/CallManager;)V

    goto :goto_0

    .line 2017
    :cond_3
    const-string v4, "android.intent.action.ANSWER"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 2023
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->internalAnswerCall()V

    .line 2025
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4, v6}, Lcom/android/phone/PhoneGlobals;->setRestoreMuteOnInCallResume(Z)V

    goto/16 :goto_0

    .line 2028
    :cond_4
    const-string v4, "com.android.phone.DISPLAY_ACTIVATION_SCREEN"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 2034
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v4}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsOtasp(Lcom/android/internal/telephony/Phone;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 2035
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Received ACTION_DISPLAY_ACTIVATION_SCREEN intent on non-OTASP-capable device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2040
    :cond_5
    sget-object v4, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 2041
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    iget-boolean v4, v4, Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;->isOtaCallIntentProcessed:Z

    if-nez v4, :cond_0

    .line 2043
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;->isOtaCallIntentProcessed:Z

    .line 2044
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    sget-object v5, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_ACTIVATION:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    iput-object v5, v4, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    goto/16 :goto_0

    .line 2051
    :cond_6
    const-string v4, "com.android.phone.PERFORM_CDMA_PROVISIONING"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 2055
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected ACTION_PERFORM_CDMA_PROVISIONING received by InCallScreen: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2058
    :cond_7
    const-string v4, "android.intent.action.CALL"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    const-string v4, "android.intent.action.CALL_EMERGENCY"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 2063
    :cond_8
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected CALL action received by InCallScreen: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2065
    :cond_9
    const-string v4, "com.android.phone.InCallScreen.UNDEFINED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 2068
    const-string v4, "InCallScreen"

    const-string v5, "internalResolveIntent: got launched with ACTION_UNDEFINED"

    invoke-static {v4, v5}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2071
    :cond_a
    const-string v4, "InCallScreen"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "internalResolveIntent: unexpected intent action: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private internalRespondViaSms()V
    .locals 2

    .prologue
    .line 5727
    const-string v1, "internalRespondViaSms()..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5728
    invoke-static {}, Lcom/android/phone/PhoneUtils;->dumpCallManager()V

    .line 5732
    const/4 v0, 0x0

    .line 5733
    .local v0, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5734
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 5739
    :goto_0
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v1, v0}, Lcom/android/phone/RespondViaSmsManager;->showRespondViaSmsPopup(Lcom/android/internal/telephony/Call;)V

    .line 5744
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSilenceRinger()V

    .line 5745
    return-void

    .line 5736
    :cond_0
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    goto :goto_0
.end method

.method private internalSilenceRinger()V
    .locals 2

    .prologue
    .line 5703
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 5704
    const-string v1, "internalSilenceRinger()..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5705
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v1, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    .line 5706
    .local v0, notifier:Lcom/android/phone/CallNotifier;
    invoke-virtual {v0}, Lcom/android/phone/CallNotifier;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5708
    invoke-virtual {v0}, Lcom/android/phone/CallNotifier;->silenceRinger()V

    .line 5710
    :cond_0
    return-void
.end method

.method private internalSwapCalls()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 5808
    const-string v5, "internalSwapCalls()..."

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5809
    iput-boolean v6, p0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 5813
    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->closeDialpadInternal(Z)V

    .line 5820
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v5}, Lcom/android/phone/DTMFTwelveKeyDialer;->clearDigits()V

    .line 5825
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 5826
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->handleSwapCdmaAndGsm()V

    .line 5866
    :goto_0
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->getBgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    .line 5867
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v5}, Lcom/android/phone/PhoneGlobals;->getBluetoothPhoneService()Landroid/bluetooth/IBluetoothHeadsetPhone;

    move-result-object v1

    .line 5868
    .local v1, btPhone:Landroid/bluetooth/IBluetoothHeadsetPhone;
    if-eqz v1, :cond_0

    .line 5870
    :try_start_0
    invoke-interface {v1}, Landroid/bluetooth/IBluetoothHeadsetPhone;->cdmaSwapSecondCallState()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_2

    .line 5877
    .end local v1           #btPhone:Landroid/bluetooth/IBluetoothHeadsetPhone;
    :cond_0
    :goto_1
    return-void

    .line 5827
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->hasDualHoldCallsOnly()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 5831
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 5833
    .local v0, bgHoldCall:Lcom/android/internal/telephony/Call;
    :try_start_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_1
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 5834
    :catch_0
    move-exception v2

    .line 5835
    .local v2, e:Lcom/android/internal/telephony/CallStateException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "internalSwapCalls exception = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 5840
    .end local v0           #bgHoldCall:Lcom/android/internal/telephony/Call;
    .end local v2           #e:Lcom/android/internal/telephony/CallStateException;
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v5

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->isDualTalkMultipleHoldCase()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 5841
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 5842
    .local v3, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    .line 5843
    .local v4, fgPhone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 5845
    const-string v5, "Cal foreground phone\'s switchHoldingAndActive"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5848
    :try_start_2
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_2
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 5849
    :catch_1
    move-exception v2

    .line 5850
    .restart local v2       #e:Lcom/android/internal/telephony/CallStateException;
    invoke-virtual {v2}, Lcom/android/internal/telephony/CallStateException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 5854
    .end local v2           #e:Lcom/android/internal/telephony/CallStateException;
    :cond_3
    const-string v5, "PhoneUtils.switchHoldingAndActive"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5856
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_0

    .line 5860
    .end local v3           #fgCall:Lcom/android/internal/telephony/Call;
    .end local v4           #fgPhone:Lcom/android/internal/telephony/Phone;
    :cond_4
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_0

    .line 5871
    .restart local v1       #btPhone:Landroid/bluetooth/IBluetoothHeadsetPhone;
    :catch_2
    move-exception v2

    .line 5872
    .local v2, e:Landroid/os/RemoteException;
    const-string v5, "InCallScreen"

    new-instance v6, Ljava/lang/Throwable;

    invoke-direct {v6}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v6}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method

.method private lockscreen()V
    .locals 4

    .prologue
    .line 8396
    const-string v1, "lockNow"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mDialer.isOpened() --> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " lock_screen_time "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/phone/InCallScreen;->lock_screen_time:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8397
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v1

    if-nez v1, :cond_0

    .line 8398
    const-string v1, "lockNow"

    const-string v2, "run lock now"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8399
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isVTInCallScreenOn()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 8401
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->restartLockScreenTimer()V

    .line 8402
    const-string v1, "lockNow----lijian---111----"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mDialer.isOpened() --> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " lock_screen_time "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/phone/InCallScreen;->lock_screen_time:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8419
    :cond_0
    :goto_0
    return-void

    .line 8407
    :cond_1
    const-string v1, "lockNow-----lijian---222222--"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mDialer.isOpened() --> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v3}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " lock_screen_time "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/phone/InCallScreen;->lock_screen_time:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8409
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->policyManager:Landroid/app/admin/DevicePolicyManager;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v1, v2}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v0

    .line 8410
    .local v0, active:Z
    if-nez v0, :cond_2

    .line 8411
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->policyManager:Landroid/app/admin/DevicePolicyManager;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->componentName:Landroid/content/ComponentName;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/admin/DevicePolicyManager;->setActiveAdmin(Landroid/content/ComponentName;Z)V

    .line 8412
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->policyManager:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v1}, Landroid/app/admin/DevicePolicyManager;->lockNow()V

    .line 8414
    :cond_2
    if-eqz v0, :cond_0

    .line 8415
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->policyManager:Landroid/app/admin/DevicePolicyManager;

    invoke-virtual {v1}, Landroid/app/admin/DevicePolicyManager;->lockNow()V

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 7239
    const-string v0, "InCallScreen"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 7240
    return-void
.end method

.method private muteIncomingCall(Z)V
    .locals 2
    .parameter "mute"

    .prologue
    .line 4518
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v0, v1, Lcom/android/phone/PhoneGlobals;->ringer:Lcom/android/phone/Ringer;

    .line 4519
    .local v0, ringer:Lcom/android/phone/Ringer;
    if-eqz p1, :cond_0

    invoke-virtual {v0}, Lcom/android/phone/Ringer;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4520
    invoke-virtual {v0}, Lcom/android/phone/Ringer;->stopRing()V

    .line 4522
    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/phone/Ringer;->setMute(Z)V

    .line 4523
    return-void
.end method

.method private okToRecordVoice()Z
    .locals 5

    .prologue
    .line 7427
    const/4 v1, 0x0

    .line 7433
    .local v1, retval:Z
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 7435
    .local v2, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_0

    .line 7436
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fgCall state:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7437
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "phoneType"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7438
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 7439
    .local v0, fgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_0

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_0

    .line 7440
    const/4 v1, 0x1

    .line 7444
    .end local v0           #fgCall:Lcom/android/internal/telephony/Call;
    :cond_0
    return v1
.end method

.method private onAddCallClick()V
    .locals 1

    .prologue
    .line 4514
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->startNewCall(Lcom/android/internal/telephony/CallManager;)Z

    .line 4515
    return-void
.end method

.method private onDisconnect(Landroid/os/AsyncResult;I)V
    .locals 23
    .parameter "r"
    .parameter "msg"

    .prologue
    .line 2990
    const-string v19, "onDisconnect: start..."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2993
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 2996
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v18

    .line 2998
    .local v18, state:Lcom/android/internal/telephony/PhoneConstants$State;
    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v5, Lcom/android/internal/telephony/Connection;

    .line 2999
    .local v5, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v5}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v9

    .line 3000
    .local v9, cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "onDisconnect: connection \'"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\', cause = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ", showing screen: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/phone/PhoneGlobals;->isShowingCallScreen()Z

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3003
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    if-eqz v19, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v19

    if-eqz v19, :cond_0

    .line 3004
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/app/AlertDialog;->dismiss()V

    .line 3005
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    .line 3008
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onDisconnect(Lcom/android/internal/telephony/Connection;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 3382
    :cond_1
    :goto_0
    return-void

    .line 3019
    :cond_2
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->phoneIsInUse()Z

    move-result v19

    if-nez v19, :cond_4

    const/4 v12, 0x1

    .line 3020
    .local v12, currentlyIdle:Z
    :goto_1
    const/4 v3, 0x0

    .line 3021
    .local v3, autoretrySetting:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_5

    const/16 v16, 0x1

    .line 3022
    .local v16, phoneIsCdma:Z
    :goto_2
    if-eqz v16, :cond_3

    .line 3025
    if-eqz v12, :cond_3

    .line 3026
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v19

    const-string v20, "call_auto_retry"

    const/16 v21, 0x0

    invoke-static/range {v19 .. v21}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .line 3032
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v19, v0

    sget-object v20, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    move-object/from16 v19, v0

    if-eqz v19, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;->inOtaSpcState:Z

    move/from16 v19, v0

    if-nez v19, :cond_6

    .line 3035
    sget-object v19, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 3036
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    goto :goto_0

    .line 3019
    .end local v3           #autoretrySetting:I
    .end local v12           #currentlyIdle:Z
    .end local v16           #phoneIsCdma:Z
    :cond_4
    const/4 v12, 0x0

    goto :goto_1

    .line 3021
    .restart local v3       #autoretrySetting:I
    .restart local v12       #currentlyIdle:Z
    :cond_5
    const/16 v16, 0x0

    goto :goto_2

    .line 3038
    .restart local v16       #phoneIsCdma:Z
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v19, v0

    sget-object v20, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    move-object/from16 v19, v0

    if-eqz v19, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;->inOtaSpcState:Z

    move/from16 v19, v0

    if-eqz v19, :cond_8

    .line 3041
    :cond_7
    const-string v19, "onDisconnect: OTA Call end already handled"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 3048
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/phone/DTMFTwelveKeyDialer;->clearDigits()V

    .line 3060
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->CALL_BARRED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-ne v9, v0, :cond_9

    .line 3061
    const v19, 0x7f0d0189

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 3063
    :cond_9
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->FDN_BLOCKED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-ne v9, v0, :cond_a

    sget-object v19, Lcom/android/phone/Constants$CallStatusCode;->FDN_BLOCKED:Lcom/android/phone/Constants$CallStatusCode;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/android/phone/InCallUiState;->getPendingCallStatusCode()Lcom/android/phone/Constants$CallStatusCode;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_a

    .line 3065
    const v19, 0x7f0d0188

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 3067
    :cond_a
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->CS_RESTRICTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-ne v9, v0, :cond_b

    .line 3068
    const v19, 0x7f0d018a

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 3070
    :cond_b
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->CS_RESTRICTED_EMERGENCY:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-ne v9, v0, :cond_c

    .line 3071
    const v19, 0x7f0d018b

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 3073
    :cond_c
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->CS_RESTRICTED_NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-ne v9, v0, :cond_d

    .line 3074
    const v19, 0x7f0d018c

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 3097
    :cond_d
    if-eqz v16, :cond_e

    .line 3098
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/phone/CallNotifier;->getPreviousCdmaCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    .line 3099
    .local v8, callState:Lcom/android/internal/telephony/Call$State;
    sget-object v19, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v19

    if-ne v8, v0, :cond_13

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_MISSED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_13

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_13

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_13

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_13

    .line 3104
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->showCallLostDialog()V

    .line 3138
    .end local v8           #callState:Lcom/android/internal/telephony/Call$State;
    :cond_e
    :goto_3
    invoke-virtual {v5}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v6

    .line 3139
    .local v6, call:Lcom/android/internal/telephony/Call;
    if-eqz v6, :cond_10

    .line 3148
    invoke-virtual {v6}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v11

    .line 3149
    .local v11, connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    if-eqz v11, :cond_10

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_10

    .line 3150
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, i$:Ljava/util/Iterator;
    :cond_f
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_10

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/internal/telephony/Connection;

    .line 3151
    .local v10, conn:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v10}, Lcom/android/internal/telephony/Connection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v19

    sget-object v20, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_f

    .line 3160
    const-string v19, "- Still-active conf call; clearing DISCONNECTED..."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/phone/PhoneGlobals;->updateWakeState()V

    .line 3162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/CallManager;->clearDisconnected()V

    .line 3185
    .end local v10           #conn:Lcom/android/internal/telephony/Connection;
    .end local v11           #connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    .end local v14           #i$:Ljava/util/Iterator;
    :cond_10
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_MISSED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_11

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-ne v9, v0, :cond_17

    :cond_11
    if-eqz v12, :cond_17

    const/4 v4, 0x1

    .line 3192
    .local v4, bailOutImmediately:Z
    :goto_4
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-ne v9, v0, :cond_18

    invoke-static {v5}, Lcom/android/phone/PhoneUtils;->getShouldSendToVoiceMailFlag(Lcom/android/internal/telephony/Connection;)Z

    move-result v19

    if-eqz v19, :cond_18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v19

    sget-object v20, Lcom/android/internal/telephony/Call$State;->DISCONNECTING:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v19

    sget-object v20, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v19

    sget-object v20, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_18

    .line 3198
    :cond_12
    sget-object v19, Lcom/android/phone/InCallScreen;->PHONE_DISCONNECT_GEMINI:[I

    move/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v15

    .line 3199
    .local v15, index:I
    sget-object v19, Lcom/android/phone/InCallScreen;->DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I

    aget v19, v19, v15

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->delayedCleanupAfterDisconnect(I)V

    .line 3202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lcom/android/internal/telephony/Phone;->clearDisconnected()V

    goto/16 :goto_0

    .line 3105
    .end local v4           #bailOutImmediately:Z
    .end local v6           #call:Lcom/android/internal/telephony/Call;
    .end local v15           #index:I
    .restart local v8       #callState:Lcom/android/internal/telephony/Call$State;
    :cond_13
    sget-object v19, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v19

    if-eq v8, v0, :cond_14

    sget-object v19, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v19

    if-ne v8, v0, :cond_e

    :cond_14
    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_MISSED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_e

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_e

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_e

    sget-object v19, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v19

    if-eq v9, v0, :cond_e

    .line 3111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/android/phone/InCallUiState;->needToShowCallLostDialog:Z

    move/from16 v19, v0

    if-eqz v19, :cond_15

    .line 3113
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->showCallLostDialog()V

    .line 3114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/android/phone/InCallUiState;->needToShowCallLostDialog:Z

    goto/16 :goto_3

    .line 3116
    :cond_15
    if-nez v3, :cond_16

    .line 3118
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->showCallLostDialog()V

    .line 3119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/android/phone/InCallUiState;->needToShowCallLostDialog:Z

    goto/16 :goto_3

    .line 3123
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/android/phone/InCallUiState;->needToShowCallLostDialog:Z

    goto/16 :goto_3

    .line 3185
    .end local v8           #callState:Lcom/android/internal/telephony/Call$State;
    .restart local v6       #call:Lcom/android/internal/telephony/Call;
    :cond_17
    const/4 v4, 0x0

    goto/16 :goto_4

    .line 3206
    .restart local v4       #bailOutImmediately:Z
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    move-object/from16 v19, v0

    if-eqz v19, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/phone/RespondViaSmsManager;->isShowingPopup()Z

    move-result v19

    if-eqz v19, :cond_19

    const/16 v17, 0x1

    .line 3214
    .local v17, showingQuickResponseDialog:Z
    :goto_5
    if-eqz v4, :cond_1a

    if-eqz v17, :cond_1a

    .line 3215
    const-string v19, "- onDisconnect: Respond-via-SMS dialog is still being displayed..."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3217
    const/16 v19, 0x0

    sput v19, Lcom/android/phone/InCallUiState;->sLastInCallScreenStatus:I

    goto/16 :goto_0

    .line 3206
    .end local v17           #showingQuickResponseDialog:Z
    :cond_19
    const/16 v17, 0x0

    goto :goto_5

    .line 3228
    .restart local v17       #showingQuickResponseDialog:Z
    :cond_1a
    if-eqz v4, :cond_1b

    .line 3229
    const-string v19, "- onDisconnect: bailOutImmediately..."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3236
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    .line 3237
    sget-object v19, Lcom/android/phone/InCallScreen;->PHONE_DISCONNECT_GEMINI:[I

    move/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v15

    .line 3238
    .restart local v15       #index:I
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "- onDisconnect: bailOutImmediately...index="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " msg="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3239
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v15, v0, :cond_1

    .line 3240
    sget-object v19, Lcom/android/phone/InCallScreen;->DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I

    aget v19, v19, v15

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->delayedCleanupAfterDisconnect(I)V

    goto/16 :goto_0

    .line 3243
    .end local v15           #index:I
    :cond_1b
    const-string v19, "- onDisconnect: delayed bailout..."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3250
    if-eqz v12, :cond_1d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/CallManager;->hasDisconnectedFgCall()Z

    move-result v19

    if-nez v19, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/CallManager;->hasDisconnectedBgCall()Z

    move-result v19

    if-eqz v19, :cond_1d

    .line 3252
    :cond_1c
    const-string v19, "- onDisconnect: switching to \'Call ended\' state..."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3253
    sget-object v19, Lcom/android/phone/InCallUiState$InCallScreenMode;->CALL_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 3259
    :cond_1d
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    .line 3263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v13

    .line 3264
    .local v13, hasActiveCall:Z
    if-nez v13, :cond_20

    .line 3265
    const-string v19, "- onDisconnect: cleaning up after FG call disconnect..."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3269
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1e

    .line 3270
    const-string v19, "- DISMISSING mWaitPromptDialog."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/app/AlertDialog;->dismiss()V

    .line 3272
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    .line 3274
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1f

    .line 3275
    const-string v19, "- DISMISSING mWildPromptDialog."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/app/AlertDialog;->dismiss()V

    .line 3277
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    .line 3279
    :cond_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    if-eqz v19, :cond_20

    .line 3280
    const-string v19, "- DISMISSING mPausePromptDialog."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/app/AlertDialog;->dismiss()V

    .line 3282
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    .line 3296
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_21

    .line 3297
    if-nez v12, :cond_21

    .line 3301
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/CallManager;->clearDisconnected()V

    .line 3305
    const-string v19, "onDisconnect: Call Collision case - staying on InCallScreen."

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3306
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/android/phone/PhoneUtils;->dumpCallState(Lcom/android/internal/telephony/Phone;)V

    goto/16 :goto_0

    .line 3324
    :cond_21
    if-eqz v12, :cond_23

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->isForegroundActivity()Z

    move-result v19

    if-nez v19, :cond_23

    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->isForegroundActivityForProximity()Z

    move-result v19

    if-eqz v19, :cond_23

    .line 3325
    const-string v19, "Force waking up the screen to let users see \"disconnected\" state"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3326
    if-eqz v6, :cond_22

    .line 3327
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/android/phone/CallCard;->updateElapsedTimeWidget(Lcom/android/internal/telephony/Call;)V

    .line 3332
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/android/phone/InCallUiState;->showAlreadyDisconnectedState:Z

    .line 3335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/android/phone/PhoneGlobals;->wakeUpScreen()V

    goto/16 :goto_0

    .line 3347
    :cond_23
    sget-object v19, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$internal$telephony$Connection$DisconnectCause:[I

    invoke-virtual {v9}, Lcom/android/internal/telephony/Connection$DisconnectCause;->ordinal()I

    move-result v20

    aget v19, v19, v20

    packed-switch v19, :pswitch_data_0

    .line 3366
    const/16 v7, 0x1388

    .line 3370
    .local v7, callEndedDisplayDelay:I
    :goto_6
    sget-object v19, Lcom/android/phone/InCallScreen;->PHONE_DISCONNECT_GEMINI:[I

    move/from16 v0, p2

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v15

    .line 3371
    .restart local v15       #index:I
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "onDisconnect() PHONE_DISCONNECT : index="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3372
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v15, v0, :cond_1

    .line 3373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    move-object/from16 v19, v0

    sget-object v20, Lcom/android/phone/InCallScreen;->DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I

    aget v20, v20, v15

    invoke-virtual/range {v19 .. v20}, Landroid/os/Handler;->removeMessages(I)V

    .line 3374
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    move-object/from16 v19, v0

    sget-object v20, Lcom/android/phone/InCallScreen;->DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I

    aget v20, v20, v15

    int-to-long v0, v7

    move-wide/from16 v21, v0

    invoke-virtual/range {v19 .. v22}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 3359
    .end local v7           #callEndedDisplayDelay:I
    .end local v15           #index:I
    :pswitch_0
    const/4 v7, 0x0

    .line 3360
    .restart local v7       #callEndedDisplayDelay:I
    goto :goto_6

    .line 3363
    .end local v7           #callEndedDisplayDelay:I
    :pswitch_1
    const/16 v7, 0x7d0

    .line 3364
    .restart local v7       #callEndedDisplayDelay:I
    goto :goto_6

    .line 3347
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private onHoldClick()V
    .locals 11

    .prologue
    const/4 v8, 0x1

    .line 4370
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v3

    .line 4371
    .local v3, hasActiveCall:Z
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v4

    .line 4372
    .local v4, hasHoldingCall:Z
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v9, :cond_0

    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v9}, Lcom/mediatek/phone/DualTalkUtils;->hasDualHoldCallsOnly()Z

    move-result v9

    if-eqz v9, :cond_0

    move v5, v8

    .line 4374
    .local v5, haveMultipleHoldingCall:Z
    :goto_0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onHoldClick: hasActiveCall = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", hasHoldingCall = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4378
    if-eqz v3, :cond_1

    if-nez v4, :cond_1

    .line 4380
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    .line 4382
    const/4 v7, 0x1

    .line 4383
    .local v7, newHoldState:Z
    const/4 v6, 0x1

    .line 4423
    .local v6, holdButtonEnabled:Z
    :goto_1
    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->closeDialpadInternal(Z)V

    .line 4424
    return-void

    .line 4372
    .end local v5           #haveMultipleHoldingCall:Z
    .end local v6           #holdButtonEnabled:Z
    .end local v7           #newHoldState:Z
    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 4384
    .restart local v5       #haveMultipleHoldingCall:Z
    :cond_1
    if-nez v3, :cond_2

    if-eqz v4, :cond_2

    if-nez v5, :cond_2

    .line 4386
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v9

    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->switchHoldingAndActive(Lcom/android/internal/telephony/Call;)V

    .line 4388
    const/4 v7, 0x0

    .line 4389
    .restart local v7       #newHoldState:Z
    const/4 v6, 0x1

    .restart local v6       #holdButtonEnabled:Z
    goto :goto_1

    .line 4394
    .end local v6           #holdButtonEnabled:Z
    .end local v7           #newHoldState:Z
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v9

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v9}, Lcom/mediatek/phone/DualTalkUtils;->isMultiplePhoneActive()Z

    move-result v9

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v9}, Lcom/mediatek/phone/DualTalkUtils;->hasActiveCdmaPhone()Z

    move-result v9

    if-nez v9, :cond_3

    .line 4397
    if-eqz v3, :cond_4

    .line 4398
    const-string v9, "onHoldClick: has active call."

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4399
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v9}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 4401
    .local v2, fgCall:Lcom/android/internal/telephony/Call;
    :try_start_0
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4415
    .end local v2           #fgCall:Lcom/android/internal/telephony/Call;
    :cond_3
    :goto_2
    const/4 v7, 0x0

    .line 4416
    .restart local v7       #newHoldState:Z
    const/4 v6, 0x0

    .restart local v6       #holdButtonEnabled:Z
    goto :goto_1

    .line 4402
    .end local v6           #holdButtonEnabled:Z
    .end local v7           #newHoldState:Z
    .restart local v2       #fgCall:Lcom/android/internal/telephony/Call;
    :catch_0
    move-exception v1

    .line 4403
    .local v1, e:Lcom/android/internal/telephony/CallStateException;
    const-string v9, "onHoldClick: CallStateException."

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 4406
    .end local v1           #e:Lcom/android/internal/telephony/CallStateException;
    .end local v2           #fgCall:Lcom/android/internal/telephony/Call;
    :cond_4
    const-string v9, "onHoldClick: has two background calls"

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4407
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v9}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 4409
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    :try_start_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_1
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 4410
    :catch_1
    move-exception v1

    .line 4411
    .restart local v1       #e:Lcom/android/internal/telephony/CallStateException;
    const-string v9, "onHoldClick: CallStateException."

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private onIncomingRing()V
    .locals 1

    .prologue
    .line 7138
    const-string v0, "onIncomingRing()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7142
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    if-eqz v0, :cond_0

    .line 7143
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    invoke-virtual {v0}, Lcom/android/phone/InCallTouchUi;->onIncomingRing()V

    .line 7145
    :cond_0
    return-void
.end method

.method private onMMICancel(I)V
    .locals 2
    .parameter "simId"

    .prologue
    .line 3432
    const-string v0, "onMMICancel()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3435
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v0, p1}, Lcom/android/phone/PhoneUtils;->cancelMmiCodeExt(Lcom/android/internal/telephony/Phone;I)Z

    .line 3446
    const-string v0, "onMMICancel: finishing InCallScreen..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3447
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissAllDialogs()V

    .line 3448
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_1

    .line 3449
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 3453
    :goto_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 3454
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 3455
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    .line 3456
    const-string v0, "Got MMI_COMPLETE, Phone isn\'t in idle, dismiss the start progress dialog..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3458
    :cond_0
    return-void

    .line 3451
    :cond_1
    const-string v0, "Got MMI_COMPLETE, Phone isn\'t in idle, don\'t finishing InCallScreen..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private onMMIComplete(Lcom/android/internal/telephony/MmiCode;)V
    .locals 4
    .parameter "mmiCode"

    .prologue
    const/4 v3, 0x0

    .line 3472
    const/4 v0, 0x1

    .line 3473
    .local v0, phoneType:I
    instance-of v1, p1, Lcom/android/internal/telephony/gsm/GsmMmiCode;

    if-eqz v1, :cond_1

    .line 3474
    const/4 v0, 0x1

    .line 3480
    :goto_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 3481
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-static {v1, v2, p1, v3, v3}, Lcom/android/phone/PhoneUtils;->displayMMIComplete(Lcom/android/internal/telephony/Phone;Landroid/content/Context;Lcom/android/internal/telephony/MmiCode;Landroid/os/Message;Landroid/app/AlertDialog;)V

    .line 3498
    :cond_0
    :goto_1
    return-void

    .line 3475
    :cond_1
    instance-of v1, p1, Lcom/android/internal/telephony/cdma/CdmaMmiCode;

    if-eqz v1, :cond_2

    .line 3476
    const/4 v0, 0x2

    goto :goto_0

    .line 3478
    :cond_2
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    goto :goto_0

    .line 3482
    :cond_3
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 3483
    invoke-interface {p1}, Lcom/android/internal/telephony/MmiCode;->getState()Lcom/android/internal/telephony/MmiCode$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->PENDING:Lcom/android/internal/telephony/MmiCode$State;

    if-eq v1, v2, :cond_0

    .line 3484
    const-string v1, "Got MMI_COMPLETE, finishing InCallScreen..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3485
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_4

    .line 3486
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 3491
    :goto_2
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_0

    .line 3492
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 3493
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    .line 3494
    const-string v1, "Got MMI_COMPLETE, Phone isn\'t in idle, dismiss the start progress dialog..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 3488
    :cond_4
    const-string v1, "Got MMI_COMPLETE, Phone isn\'t in idle, don\'t finishing InCallScreen..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private onNewRingingConnection()V
    .locals 1

    .prologue
    .line 7158
    const-string v0, "onNewRingingConnection()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7175
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v0}, Lcom/android/phone/RespondViaSmsManager;->dismissPopup()V

    .line 7176
    return-void
.end method

.method private onPhoneStateChanged(Landroid/os/AsyncResult;)V
    .locals 4
    .parameter "r"

    .prologue
    const/4 v3, 0x0

    .line 2904
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    .line 2905
    .local v0, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPhoneStateChanged: current state = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2907
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, v2}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onPhoneStateChanged(Lcom/android/internal/telephony/CallManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2970
    :goto_0
    return-void

    .line 2911
    :cond_0
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v0, v1, :cond_1

    .line 2913
    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->muteIncomingCall(Z)V

    .line 2926
    :cond_1
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->enableHomeKeyDispatched(Z)V

    .line 2932
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->restartLockScreenTimer()V

    .line 2934
    iget-boolean v1, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    if-nez v1, :cond_2

    .line 2935
    const-string v1, "onPhoneStateChanged: Activity not in foreground! Bailing out..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 2938
    :cond_2
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateLocalCache()V

    .line 2941
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fgCall state : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2942
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bgCall state : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mBackgroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2943
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ringingCall state : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2946
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getPhoneSwapStatus()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2947
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_3

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mBackgroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_3

    .line 2949
    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->setPhoneSwapStatus(Z)V

    .line 2953
    :cond_3
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateExpandedViewState()V

    .line 2961
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    .line 2965
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->updateWakeState()V

    .line 2968
    const-string v1, "onPhoneStateChanged() end"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private onVTVoiceAnswer()V
    .locals 3

    .prologue
    .line 7544
    const-string v1, "onVTVoiceAnswer() ! "

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7546
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->setInVoiceAnswerVideoCall(Z)V

    .line 7550
    :try_start_0
    const-string v1, "onVTVoiceAnswer() : call CallManager.voiceAccept() start "

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7552
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/CallManager;->voiceAccept(Lcom/android/internal/telephony/Call;)V

    .line 7554
    const-string v1, "onVTVoiceAnswer() : call CallManager.voiceAccept() end "

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7559
    :goto_0
    return-void

    .line 7556
    :catch_0
    move-exception v0

    .line 7557
    .local v0, e:Lcom/android/internal/telephony/CallStateException;
    invoke-virtual {v0}, Lcom/android/internal/telephony/CallStateException;->printStackTrace()V

    goto :goto_0
.end method

.method private openDialpadInternal(Z)V
    .locals 2
    .parameter "animate"

    .prologue
    .line 4662
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, p1}, Lcom/android/phone/DTMFTwelveKeyDialer;->openDialer(Z)V

    .line 4665
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/phone/InCallUiState;->showDialpad:Z

    .line 4666
    return-void
.end method

.method private phoneIsInUse()Z
    .locals 2

    .prologue
    .line 2130
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private registerForPhoneStates()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 1732
    iget-boolean v2, p0, Lcom/android/phone/InCallScreen;->mRegisteredForPhoneStates:Z

    if-nez v2, :cond_0

    .line 1755
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 1757
    .local v0, callManager:Ljava/lang/Object;
    :goto_0
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x65

    invoke-static {v0, v2, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1758
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    sget-object v3, Lcom/android/phone/InCallScreen;->PHONE_DISCONNECT_GEMINI:[I

    invoke-static {v0, v2, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForDisconnect(Ljava/lang/Object;Landroid/os/Handler;[I)V

    .line 1768
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    .line 1769
    .local v1, phoneType:I
    if-ne v1, v6, :cond_2

    .line 1770
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    sget-object v3, Lcom/android/phone/PhoneGlobals;->MMI_COMPLETE_GEMINI:[I

    invoke-static {v0, v2, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForMmiComplete(Ljava/lang/Object;Landroid/os/Handler;[I)V

    .line 1779
    :goto_1
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x68

    invoke-static {v0, v2, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForPostDialCharacter(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1780
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x6e

    invoke-static {v0, v2, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForSuppServiceFailed(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1781
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x7b

    invoke-static {v0, v2, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForIncomingRing(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1782
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x7c

    invoke-static {v0, v2, v3}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForNewRingingConnection(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1789
    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->registerForPhoneStatesMTK(Ljava/lang/Object;)V

    .line 1791
    iput-boolean v6, p0, Lcom/android/phone/InCallScreen;->mRegisteredForPhoneStates:Z

    .line 1793
    .end local v0           #callManager:Ljava/lang/Object;
    .end local v1           #phoneType:I
    :cond_0
    return-void

    .line 1755
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_0

    .line 1771
    .restart local v0       #callManager:Ljava/lang/Object;
    .restart local v1       #phoneType:I
    :cond_2
    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 1773
    const-string v2, "Registering for Call Waiting."

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1775
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x73

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/internal/telephony/CallManager;->registerForCallWaiting(Landroid/os/Handler;ILjava/lang/Object;)V

    goto :goto_1

    .line 1777
    :cond_3
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected phone type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private registerForPhoneStatesMTK(Ljava/lang/Object;)V
    .locals 2
    .parameter "callManager"

    .prologue
    .line 8339
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x8d

    invoke-static {p1, v0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForCrssSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 8340
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    sget-object v1, Lcom/android/phone/PhoneUtils;->PHONE_SPEECH_INFO_GEMINI:[I

    invoke-static {p1, v0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForSpeechInfo(Ljava/lang/Object;Landroid/os/Handler;[I)V

    .line 8341
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x8c

    invoke-static {p1, v0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 8342
    return-void
.end method

.method private selectWhichCallActive(Ljava/util/List;)V
    .locals 11
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/Call;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 8165
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 8167
    .local v3, holdList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    const-string v5, "+selectWhichCallActive"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8169
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Call;

    .line 8170
    .local v1, call:Lcom/android/internal/telephony/Call;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v5, v6, :cond_0

    .line 8171
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 8175
    .end local v1           #call:Lcom/android/internal/telephony/Call;
    :cond_1
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v5

    if-nez v5, :cond_3

    .line 8176
    :cond_2
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v7, 0x104

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v5, 0x0

    check-cast v5, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v6, v7, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 8180
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    new-instance v2, Lcom/mediatek/phone/CallPickerAdapter;

    invoke-direct {v2, p0, v3}, Lcom/mediatek/phone/CallPickerAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 8181
    .local v2, callPickerAdapter:Lcom/mediatek/phone/CallPickerAdapter;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ne v10, v5, :cond_3

    .line 8182
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/Call;

    invoke-virtual {v6, v5}, Lcom/android/phone/CallCard;->getOperatorNameByCall(Lcom/android/internal/telephony/Call;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/Call;

    invoke-virtual {v7, v5}, Lcom/android/phone/CallCard;->getOperatorNameByCall(Lcom/android/internal/telephony/Call;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v6, v5}, Lcom/mediatek/phone/CallPickerAdapter;->setOperatorName(Ljava/lang/String;Ljava/lang/String;)V

    .line 8184
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/Call;

    invoke-virtual {v6, v5}, Lcom/android/phone/CallCard;->getOperatorColorByCall(Lcom/android/internal/telephony/Call;)I

    move-result v6

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/Call;

    invoke-virtual {v7, v5}, Lcom/android/phone/CallCard;->getOperatorColorByCall(Lcom/android/internal/telephony/Call;)I

    move-result v5

    invoke-virtual {v2, v6, v5}, Lcom/mediatek/phone/CallPickerAdapter;->setOperatorColor(II)V

    .line 8186
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v5, v8}, Lcom/android/phone/CallCard;->getCallInfoName(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v6, v10}, Lcom/android/phone/CallCard;->getCallInfoName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/mediatek/phone/CallPickerAdapter;->setCallerInfoName(Ljava/lang/String;Ljava/lang/String;)V

    .line 8189
    const/4 v5, -0x1

    new-instance v6, Lcom/android/phone/InCallScreen$31;

    invoke-direct {v6, p0}, Lcom/android/phone/InCallScreen$31;-><init>(Lcom/android/phone/InCallScreen;)V

    invoke-virtual {v0, v2, v5, v6}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/high16 v7, 0x7f0d

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 8217
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    iput-object v5, p0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    .line 8218
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mCallSelectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5}, Landroid/app/AlertDialog;->show()V

    .line 8222
    .end local v0           #builder:Landroid/app/AlertDialog$Builder;
    .end local v2           #callPickerAdapter:Lcom/mediatek/phone/CallPickerAdapter;
    :cond_3
    const-string v5, "-selectWhichCallActive"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8224
    return-void
.end method

.method private setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V
    .locals 8
    .parameter "newMode"

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 5891
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setInCallScreenMode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5892
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iput-object p1, v3, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    .line 5894
    sget-object v3, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$phone$InCallUiState$InCallScreenMode:[I

    invoke-virtual {p1}, Lcom/android/phone/InCallUiState$InCallScreenMode;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 6017
    :goto_0
    return-void

    .line 5896
    :pswitch_0
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->isConferenceCall(Lcom/android/internal/telephony/Call;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 5897
    const-string v3, "InCallScreen"

    const-string v4, "MANAGE_CONFERENCE: no active conference call!"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 5899
    sget-object v3, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    goto :goto_0

    .line 5902
    :cond_0
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getFgCallConnections()Ljava/util/List;

    move-result-object v2

    .line 5905
    .local v2, connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-gt v3, v6, :cond_2

    .line 5906
    :cond_1
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MANAGE_CONFERENCE: Bogus TRUE from isConferenceCall(); connections = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 5910
    sget-object v3, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    goto :goto_0

    .line 5919
    :cond_2
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3}, Lcom/android/phone/ManageConferenceUtils;->initManageConferencePanel()V

    .line 5921
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3, v2}, Lcom/android/phone/ManageConferenceUtils;->updateManageConferencePanel(Ljava/util/List;)V

    .line 5925
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3, v6}, Lcom/android/phone/ManageConferenceUtils;->setPanelVisible(Z)V

    .line 5934
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Connection;->getDurationMillis()J

    move-result-wide v0

    .line 5936
    .local v0, callDuration:J
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Lcom/android/phone/ManageConferenceUtils;->startConferenceTime(J)V

    goto :goto_0

    .line 5945
    .end local v0           #callDuration:J
    .end local v2           #connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    :pswitch_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3, v5}, Lcom/android/phone/ManageConferenceUtils;->setPanelVisible(Z)V

    .line 5946
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3}, Lcom/android/phone/ManageConferenceUtils;->stopConferenceTime()V

    .line 5948
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v3, v5}, Lcom/android/phone/CallCard;->setVisibility(I)V

    .line 5949
    const-string v3, "setInCallScreenMode(CALL_ENDED): Set mCallCard VISIBLE"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 5953
    :pswitch_2
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3, v5}, Lcom/android/phone/ManageConferenceUtils;->setPanelVisible(Z)V

    .line 5954
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3}, Lcom/android/phone/ManageConferenceUtils;->stopConferenceTime()V

    .line 5955
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v3, v4, :cond_3

    .line 5956
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v3, v7}, Lcom/android/phone/CallCard;->setVisibility(I)V

    .line 5960
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setInCallScreenMode: (NORMAL) Set mCallCard VISIBLE +"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v4}, Lcom/android/phone/CallCard;->getVisibility()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 5958
    :cond_3
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v3, v5}, Lcom/android/phone/CallCard;->setVisibility(I)V

    goto :goto_1

    .line 5965
    :pswitch_3
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    sget-object v4, Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;->NORMAL:Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;

    invoke-virtual {v3, v4}, Lcom/android/phone/OtaUtils;->setCdmaOtaInCallScreenUiState(Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;)V

    .line 5967
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v3, v7}, Lcom/android/phone/CallCard;->setVisibility(I)V

    goto/16 :goto_0

    .line 5971
    :pswitch_4
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    sget-object v4, Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;->ENDED:Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;

    invoke-virtual {v3, v4}, Lcom/android/phone/OtaUtils;->setCdmaOtaInCallScreenUiState(Lcom/android/phone/OtaUtils$CdmaOtaInCallScreenUiState$State;)V

    .line 5973
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v3, v7}, Lcom/android/phone/CallCard;->setVisibility(I)V

    goto/16 :goto_0

    .line 6001
    :pswitch_5
    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.android.phone.InCallScreen.UNDEFINED"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lcom/android/phone/InCallScreen;->setIntent(Landroid/content/Intent;)V

    .line 6005
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v3, v4, :cond_5

    .line 6006
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v3, :cond_4

    .line 6007
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v3, v6}, Lcom/android/phone/OtaUtils;->cleanOtaScreen(Z)V

    .line 6013
    :cond_4
    :goto_2
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v3, v5}, Lcom/android/phone/CallCard;->setVisibility(I)V

    .line 6014
    const-string v3, "setInCallScreenMode: (UNDEFINED): Set mCallCard VISIBLE"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 6010
    :cond_5
    const-string v3, "WARNING: Setting mode to UNDEFINED but phone is OFFHOOK, skip cleanOtaScreen."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 5894
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private setupMenuItems(Landroid/view/Menu;)V
    .locals 18
    .parameter "menu"

    .prologue
    .line 7252
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v13

    .line 7253
    .local v13, ringingCall:Lcom/android/internal/telephony/Call;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 7254
    .local v2, bgCall:Lcom/android/internal/telephony/Call;
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v8

    .line 7257
    .local v8, inCallControlState:Lcom/android/phone/InCallControlState;
    const v15, 0x7f08013a

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 7258
    .local v1, addMenu:Landroid/view/MenuItem;
    const v15, 0x7f08013b

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v9

    .line 7259
    .local v9, mergeMenu:Landroid/view/MenuItem;
    const v15, 0x7f080140

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v12

    .line 7260
    .local v12, recordMenu:Landroid/view/MenuItem;
    const v15, 0x7f080139

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v14

    .line 7262
    .local v14, voiceAnswerMenu:Landroid/view/MenuItem;
    const v15, 0x7f080142

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    .line 7263
    .local v5, hangupAllMenu:Landroid/view/MenuItem;
    const v15, 0x7f080143

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 7264
    .local v6, hangupHoldingMenu:Landroid/view/MenuItem;
    const v15, 0x7f080144

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 7265
    .local v4, hangupActiveAndAnswerWaitingMenu:Landroid/view/MenuItem;
    const v15, 0x7f080145

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 7267
    .local v3, ectMenu:Landroid/view/MenuItem;
    const v15, 0x7f080138

    move-object/from16 v0, p1

    invoke-interface {v0, v15}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    .line 7269
    .local v7, holdMenu:Landroid/view/MenuItem;
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v15

    if-eqz v15, :cond_5

    .line 7270
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v15}, Lcom/mediatek/phone/DualTalkUtils;->isSupportHoldAndUnhold()Z

    move-result v15

    if-eqz v15, :cond_4

    .line 7271
    const/4 v15, 0x1

    invoke-interface {v7, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7272
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v15}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v15

    sget-object v16, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_2

    .line 7273
    const v15, 0x7f0d02e8

    invoke-interface {v7, v15}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 7288
    :goto_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v15

    invoke-interface {v15}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v11

    .line 7291
    .local v11, phoneType:I
    if-eqz v1, :cond_0

    .line 7292
    const/4 v15, 0x0

    invoke-interface {v1, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7294
    :cond_0
    if-eqz v9, :cond_1

    .line 7295
    const/4 v15, 0x0

    invoke-interface {v9, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7297
    :cond_1
    const/4 v15, 0x0

    invoke-interface {v12, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7298
    const/4 v15, 0x0

    invoke-interface {v14, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7300
    const/4 v15, 0x0

    invoke-interface {v5, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7301
    const/4 v15, 0x0

    invoke-interface {v6, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7302
    const/4 v15, 0x0

    invoke-interface {v4, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7303
    const/4 v15, 0x0

    invoke-interface {v3, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7305
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v15

    if-eqz v15, :cond_6

    .line 7367
    :goto_1
    return-void

    .line 7274
    .end local v11           #phoneType:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v15}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v15

    sget-object v16, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 7275
    const v15, 0x7f0d0079

    invoke-interface {v7, v15}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0

    .line 7278
    :cond_3
    const/4 v15, 0x0

    invoke-interface {v7, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7279
    const-string v15, "some thing is wrong!!"

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7282
    :cond_4
    const/4 v15, 0x0

    invoke-interface {v7, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    .line 7285
    :cond_5
    const/4 v15, 0x0

    invoke-interface {v7, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    .line 7309
    .restart local v11       #phoneType:I
    :cond_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    invoke-virtual {v15}, Lcom/mediatek/phone/InCallMenuState;->update()V

    .line 7313
    invoke-virtual {v13}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v15

    sget-object v16, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_7

    invoke-virtual {v13}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v15

    sget-object v16, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_f

    if-eqz v2, :cond_f

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v15

    sget-object v16, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_f

    .line 7316
    :cond_7
    invoke-static/range {p0 .. p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v15

    invoke-virtual {v15}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v15

    if-nez v15, :cond_8

    .line 7317
    iget-boolean v15, v8, Lcom/android/phone/InCallControlState;->canAddCall:Z

    if-eqz v15, :cond_a

    .line 7318
    if-eqz v1, :cond_8

    .line 7319
    const/4 v15, 0x1

    invoke-interface {v1, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7345
    :cond_8
    :goto_2
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->okToRecordVoice()Z

    move-result v15

    if-eqz v15, :cond_9

    .line 7346
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v15

    invoke-static {v15}, Lcom/mediatek/phone/recording/PhoneRecorder;->getInstance(Landroid/content/Context;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v10

    .line 7347
    .local v10, phoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    const/4 v15, 0x1

    invoke-interface {v12, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7349
    const/4 v15, 0x1

    invoke-interface {v12, v15}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 7350
    invoke-virtual {v10}, Lcom/mediatek/phone/recording/PhoneRecorder;->ismFlagRecord()Z

    move-result v15

    if-nez v15, :cond_e

    .line 7351
    const v15, 0x7f0d0007

    invoke-interface {v12, v15}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 7357
    .end local v10           #phoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    :cond_9
    :goto_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    iget-boolean v15, v15, Lcom/mediatek/phone/InCallMenuState;->canHangupAll:Z

    invoke-interface {v5, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7358
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    iget-boolean v15, v15, Lcom/mediatek/phone/InCallMenuState;->canHangupHolding:Z

    invoke-interface {v6, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7365
    :goto_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    iget-boolean v15, v15, Lcom/mediatek/phone/InCallMenuState;->canHangupActiveAndAnswerWaiting:Z

    invoke-interface {v4, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7366
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    iget-boolean v15, v15, Lcom/mediatek/phone/InCallMenuState;->canECT:Z

    invoke-interface {v3, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_1

    .line 7321
    :cond_a
    iget-boolean v15, v8, Lcom/android/phone/InCallControlState;->canMerge:Z

    if-eqz v15, :cond_d

    .line 7322
    const/4 v15, 0x1

    if-eq v11, v15, :cond_b

    const/4 v15, 0x3

    if-ne v11, v15, :cond_c

    .line 7324
    :cond_b
    if-eqz v9, :cond_8

    .line 7325
    const/4 v15, 0x1

    invoke-interface {v9, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_2

    .line 7328
    :cond_c
    new-instance v15, Ljava/lang/IllegalStateException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unexpected phone type: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 7338
    :cond_d
    if-eqz v1, :cond_8

    .line 7339
    const/4 v15, 0x1

    invoke-interface {v1, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7340
    const/4 v15, 0x0

    invoke-interface {v1, v15}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_2

    .line 7353
    .restart local v10       #phoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    :cond_e
    const v15, 0x7f0d0008

    invoke-interface {v12, v15}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_3

    .line 7361
    .end local v10           #phoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    :cond_f
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    iget-boolean v15, v15, Lcom/mediatek/phone/InCallMenuState;->canVTVoiceAnswer:Z

    invoke-interface {v14, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4
.end method

.method private showCallLostDialog()V
    .locals 2

    .prologue
    .line 5096
    const-string v0, "showCallLostDialog()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5099
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    if-nez v0, :cond_0

    .line 5100
    const-string v0, "showCallLostDialog: not the foreground Activity! Bailing out..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5115
    :goto_0
    return-void

    .line 5105
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallLostDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 5106
    const-string v0, "showCallLostDialog: There is a mCallLostDialog already."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 5110
    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0d0191

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mCallLostDialog:Landroid/app/AlertDialog;

    .line 5114
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallLostDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showCanDismissDialog(IZ)V
    .locals 3
    .parameter "resid"
    .parameter "isStartupError"

    .prologue
    .line 5187
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showCanDismissDialog...isStartupError = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5189
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 5190
    .local v0, msg:Ljava/lang/CharSequence;
    invoke-direct {p0, v0, p2}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(Ljava/lang/CharSequence;Z)V

    .line 5191
    return-void
.end method

.method private showCanDismissDialog(Ljava/lang/CharSequence;Z)V
    .locals 4
    .parameter "message"
    .parameter "isStartupError"

    .prologue
    .line 5196
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "showCanDismissDialog...message = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5202
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5204
    const-string v2, "already showing, skip..."

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5241
    :goto_0
    return-void

    .line 5213
    :cond_0
    if-eqz p2, :cond_1

    .line 5214
    new-instance v1, Lcom/android/phone/InCallScreen$22;

    invoke-direct {v1, p0}, Lcom/android/phone/InCallScreen$22;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5219
    .local v1, clickListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Lcom/android/phone/InCallScreen$23;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$23;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5237
    .local v0, cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    :goto_1
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0d0192

    invoke-virtual {v2, v3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    .line 5238
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 5239
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2, p0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 5240
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCanDismissDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 5225
    .end local v0           #cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    .end local v1           #clickListener:Landroid/content/DialogInterface$OnClickListener;
    :cond_1
    new-instance v1, Lcom/android/phone/InCallScreen$24;

    invoke-direct {v1, p0}, Lcom/android/phone/InCallScreen$24;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5230
    .restart local v1       #clickListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Lcom/android/phone/InCallScreen$25;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$25;-><init>(Lcom/android/phone/InCallScreen;)V

    .restart local v0       #cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    goto :goto_1
.end method

.method private showExitingECMDialog()V
    .locals 5

    .prologue
    .line 5150
    const-string v3, "InCallScreen"

    const-string v4, "showExitingECMDialog()..."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 5152
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_0

    .line 5153
    const-string v3, "- DISMISSING mExitingECMDialog."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5154
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->dismiss()V

    .line 5155
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    .line 5162
    :cond_0
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v2, v3, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    .line 5163
    .local v2, inCallUiState:Lcom/android/phone/InCallUiState;
    new-instance v1, Lcom/android/phone/InCallScreen$20;

    invoke-direct {v1, p0, v2}, Lcom/android/phone/InCallScreen$20;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/phone/InCallUiState;)V

    .line 5167
    .local v1, clickListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Lcom/android/phone/InCallScreen$21;

    invoke-direct {v0, p0, v2}, Lcom/android/phone/InCallScreen$21;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/phone/InCallUiState;)V

    .line 5173
    .local v0, cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f0d0312

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0d0192

    invoke-virtual {v3, v4, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    .line 5178
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 5180
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3, p0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 5181
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mExitingECMDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 5182
    return-void
.end method

.method private showPausePromptDialog(Lcom/android/internal/telephony/Connection;Ljava/lang/String;)V
    .locals 6
    .parameter "c"
    .parameter "postDialStrAfterPause"

    .prologue
    .line 3622
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 3623
    .local v2, r:Landroid/content/res/Resources;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3624
    .local v0, buf:Ljava/lang/StringBuilder;
    const v3, 0x7f0d019d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 3625
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3627
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_0

    .line 3628
    const-string v3, "- DISMISSING mPausePromptDialog."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3629
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->dismiss()V

    .line 3630
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    .line 3633
    :cond_0
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    .line 3636
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPausePromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 3638
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x78

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 3639
    .local v1, msg:Landroid/os/Message;
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x7d0

    invoke-virtual {v3, v1, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 3640
    return-void
.end method

.method private showProgressIndication(II)V
    .locals 2
    .parameter "titleResId"
    .parameter "messageResId"

    .prologue
    .line 5488
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showProgressIndication(message "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5493
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissProgressIndication()V

    .line 5494
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 5495
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0, p1}, Lcom/android/phone/InCallScreen;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 5496
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0, p2}, Lcom/android/phone/InCallScreen;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 5497
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 5498
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 5500
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 5501
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 5502
    return-void
.end method

.method private showStatusIndication(Lcom/android/phone/Constants$CallStatusCode;)V
    .locals 18
    .parameter "status"

    .prologue
    .line 4814
    sget-object v13, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$phone$Constants$CallStatusCode:[I

    invoke-virtual/range {p1 .. p1}, Lcom/android/phone/Constants$CallStatusCode;->ordinal()I

    move-result v14

    aget v13, v13, v14

    packed-switch v13, :pswitch_data_0

    .line 4998
    const v13, 0x7f0d02d8

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(IZ)V

    .line 4999
    new-instance v13, Ljava/lang/IllegalStateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "showStatusIndication: unexpected status code: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 4818
    :pswitch_0
    const-string v13, "InCallScreen"

    const-string v14, "showStatusIndication: nothing to display"

    invoke-static {v13, v14}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 5018
    :cond_0
    :goto_0
    return-void

    .line 4830
    :pswitch_1
    const-string v13, "InCallScreen"

    const-string v14, "handleStartupError: POWER_OFF"

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4831
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v13

    iget-object v13, v13, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    if-eqz v13, :cond_6

    .line 4832
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    .line 4833
    .local v2, geminiSlots:[I
    const/4 v4, 0x0

    .line 4834
    .local v4, hasInsertSim:Z
    const/4 v9, 0x0

    .line 4835
    .local v9, sb:Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .local v5, i:I
    :goto_1
    array-length v13, v2

    if-ge v5, v13, :cond_3

    .line 4836
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v13

    iget-object v13, v13, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    aget v14, v2, v5

    invoke-virtual {v13, v14}, Lcom/android/phone/PhoneInterfaceManager;->isSimInsert(I)Z

    move-result v13

    if-nez v13, :cond_2

    .line 4837
    if-nez v9, :cond_1

    .line 4838
    new-instance v9, Ljava/lang/StringBuffer;

    .end local v9           #sb:Ljava/lang/StringBuffer;
    aget v13, v2, v5

    add-int/lit8 v13, v13, 0x1

    invoke-direct {v9, v13}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 4835
    .restart local v9       #sb:Ljava/lang/StringBuffer;
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 4840
    :cond_1
    const-string v13, ", "

    invoke-virtual {v9, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    aget v14, v2, v5

    add-int/lit8 v14, v14, 0x1

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 4843
    :cond_2
    const/4 v4, 0x1

    goto :goto_2

    .line 4847
    :cond_3
    if-nez v4, :cond_5

    .line 4849
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

    invoke-interface {v13}, Lcom/mediatek/common/telephony/IServiceStateExt;->isImeiLocked()Z

    move-result v13

    if-eqz v13, :cond_4

    const v13, 0x7f0d018e

    :goto_3
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(IZ)V

    goto :goto_0

    :cond_4
    const v13, 0x7f0d0186

    goto :goto_3

    .line 4854
    :cond_5
    if-eqz v9, :cond_6

    .line 4855
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f0d014b

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v13, v14, v15}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 4857
    .local v12, text:Ljava/lang/CharSequence;
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(Ljava/lang/CharSequence;Z)V

    goto :goto_0

    .line 4861
    .end local v2           #geminiSlots:[I
    .end local v4           #hasInsertSim:Z
    .end local v5           #i:I
    .end local v9           #sb:Ljava/lang/StringBuffer;
    .end local v12           #text:Ljava/lang/CharSequence;
    :cond_6
    const v13, 0x7f0d02d4

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(IZ)V

    goto/16 :goto_0

    .line 4870
    :pswitch_2
    const v13, 0x7f0d02d5

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 4878
    :pswitch_3
    const/4 v4, 0x1

    .line 4879
    .restart local v4       #hasInsertSim:Z
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v13

    iget-object v13, v13, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    if-eqz v13, :cond_7

    .line 4880
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    .line 4881
    .restart local v2       #geminiSlots:[I
    const/4 v4, 0x0

    .line 4882
    move-object v1, v2

    .local v1, arr$:[I
    array-length v7, v1

    .local v7, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_4
    if-ge v6, v7, :cond_7

    aget v3, v1, v6

    .line 4883
    .local v3, gs:I
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v13

    iget-object v13, v13, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v13, v3}, Lcom/android/phone/PhoneInterfaceManager;->isSimInsert(I)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 4884
    const/4 v4, 0x1

    .line 4889
    .end local v1           #arr$:[I
    .end local v2           #geminiSlots:[I
    .end local v3           #gs:I
    .end local v6           #i$:I
    .end local v7           #len$:I
    :cond_7
    if-nez v4, :cond_a

    .line 4891
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

    invoke-interface {v13}, Lcom/mediatek/common/telephony/IServiceStateExt;->isImeiLocked()Z

    move-result v13

    if-eqz v13, :cond_9

    const v13, 0x7f0d018e

    :goto_5
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(IZ)V

    goto/16 :goto_0

    .line 4882
    .restart local v1       #arr$:[I
    .restart local v2       #geminiSlots:[I
    .restart local v3       #gs:I
    .restart local v6       #i$:I
    .restart local v7       #len$:I
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 4891
    .end local v1           #arr$:[I
    .end local v2           #geminiSlots:[I
    .end local v3           #gs:I
    .end local v6           #i$:I
    .end local v7           #len$:I
    :cond_9
    const v13, 0x7f0d0186

    goto :goto_5

    .line 4894
    :cond_a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v13}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 4895
    const v13, 0x7f0d02d6

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(IZ)V

    goto/16 :goto_0

    .line 4903
    .end local v4           #hasInsertSim:Z
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v13}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 4904
    const v13, 0x7f0d02d7

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 4918
    :pswitch_5
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 4920
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v13

    if-eqz v13, :cond_c

    .line 4921
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v13, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v13}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v11

    .line 4926
    .local v11, state:Lcom/android/internal/telephony/PhoneConstants$State;
    :goto_6
    sget-object v13, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v11, v13, :cond_b

    .line 4927
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    const v14, 0x7f0d02d9

    const/4 v15, 0x0

    invoke-static {v13, v14, v15}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v13

    invoke-virtual {v13}, Landroid/widget/Toast;->show()V

    .line 4929
    :cond_b
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    goto/16 :goto_0

    .line 4923
    .end local v11           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v13}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v11

    .restart local v11       #state:Lcom/android/internal/telephony/PhoneConstants$State;
    goto :goto_6

    .line 4939
    .end local v11           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v13}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v13

    if-eqz v13, :cond_d

    .line 4940
    const v13, 0x7f0d02d8

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showCanDismissDialog(IZ)V

    goto/16 :goto_0

    .line 4942
    :cond_d
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    goto/16 :goto_0

    .line 4949
    :pswitch_7
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v13}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v13

    if-eqz v13, :cond_e

    .line 4950
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->handleMissingVoiceMailNumber()V

    goto/16 :goto_0

    .line 4952
    :cond_e
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    goto/16 :goto_0

    .line 4963
    :pswitch_8
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    goto/16 :goto_0

    .line 4969
    :pswitch_9
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->showExitingECMDialog()V

    goto/16 :goto_0

    .line 4975
    :pswitch_a
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    goto/16 :goto_0

    .line 4983
    :pswitch_b
    const-string v13, "showGenericErrorDialog, fdn_only"

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4984
    const v13, 0x7f0d0188

    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    goto/16 :goto_0

    .line 4991
    :pswitch_c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v13, v13, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v13}, Lcom/android/phone/InCallUiState;->getSlot()I

    move-result v10

    .line 4992
    .local v10, slot:I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v13, v13, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v13}, Lcom/android/phone/InCallUiState;->getNumber()Ljava/lang/String;

    move-result-object v8

    .line 4993
    .local v8, number:Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "DROP_VOICECALL number:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4994
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    const v14, 0x7f0d0018

    invoke-interface {v13, v14, v8, v10}, Lcom/mediatek/phone/vt/IVTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    goto/16 :goto_0

    .line 4814
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method

.method private showWaitPromptDialog(Lcom/android/internal/telephony/Connection;Ljava/lang/String;)V
    .locals 5
    .parameter "c"
    .parameter "postDialStr"

    .prologue
    .line 3575
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "showWaitPromptDialogChoice: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3577
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 3578
    .local v1, r:Landroid/content/res/Resources;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3579
    .local v0, buf:Ljava/lang/StringBuilder;
    const v2, 0x7f0d019c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 3580
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3583
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    if-eqz v2, :cond_0

    .line 3584
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3586
    const-string v2, "mWaitPromptDialog already show"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3615
    :goto_0
    return-void

    .line 3592
    :cond_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0d019f

    new-instance v4, Lcom/android/phone/InCallScreen$7;

    invoke-direct {v4, p0, p1}, Lcom/android/phone/InCallScreen$7;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/Connection;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0d01a0

    new-instance v4, Lcom/android/phone/InCallScreen$6;

    invoke-direct {v4, p0, p1}, Lcom/android/phone/InCallScreen$6;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/Connection;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    .line 3611
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 3614
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mWaitPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showWildPromptDialog(Lcom/android/internal/telephony/Connection;)V
    .locals 4
    .parameter "c"

    .prologue
    .line 3677
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->createWildPromptView()Landroid/view/View;

    move-result-object v0

    .line 3679
    .local v0, v:Landroid/view/View;
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 3680
    const-string v1, "- DISMISSING mWildPromptDialog."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3681
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 3682
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    .line 3685
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0d019e

    new-instance v3, Lcom/android/phone/InCallScreen$9;

    invoke-direct {v3, p0, p1}, Lcom/android/phone/InCallScreen$9;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/Connection;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/android/phone/InCallScreen$8;

    invoke-direct {v2, p0, p1}, Lcom/android/phone/InCallScreen$8;-><init>(Lcom/android/phone/InCallScreen;Lcom/android/internal/telephony/Connection;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    .line 3712
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 3714
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 3716
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mWildPromptText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 3717
    return-void
.end method

.method private startRecord()V
    .locals 2

    .prologue
    .line 4250
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->startVoiceRecord(I)V

    .line 4252
    return-void
.end method

.method private stopRecord()V
    .locals 1

    .prologue
    .line 4258
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVoiceRecord()V

    .line 4259
    return-void
.end method

.method private syncWithPhoneState()Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    .locals 6

    .prologue
    .line 3961
    const/4 v3, 0x0

    .line 3962
    .local v3, updateSuccessful:Z
    const-string v4, "syncWithPhoneState()..."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3963
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->dumpCallState(Lcom/android/internal/telephony/Phone;)V

    .line 3964
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dumpBluetoothState()V

    .line 3970
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsOtasp(Lcom/android/internal/telephony/Phone;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v5, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v4, v5, :cond_0

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v5, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v4, v5, :cond_1

    .line 3975
    :cond_0
    sget-object v4, Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;->SUCCESS:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    .line 4001
    :goto_0
    return-object v4

    .line 3984
    :cond_1
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v4}, Lcom/mediatek/phone/gemini/GeminiUtils;->hasPendingMmi(Lcom/android/internal/telephony/Phone;)Z

    move-result v0

    .line 3989
    .local v0, hasPendingMmi:Z
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v4}, Lcom/android/phone/InCallUiState;->isProgressIndicationActive()Z

    move-result v1

    .line 3991
    .local v1, showProgressIndication:Z
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-boolean v2, v4, Lcom/android/phone/InCallUiState;->showAlreadyDisconnectedState:Z

    .line 3993
    .local v2, showScreenEvenAfterDisconnect:Z
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v4

    if-nez v4, :cond_2

    if-nez v0, :cond_2

    if-nez v1, :cond_2

    if-eqz v2, :cond_3

    .line 3995
    :cond_2
    const-string v4, "syncWithPhoneState: it\'s ok to be here; update the screen..."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3996
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    .line 3997
    sget-object v4, Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;->SUCCESS:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    goto :goto_0

    .line 4000
    :cond_3
    const-string v4, "InCallScreen"

    const-string v5, "syncWithPhoneState: phone is idle (shouldn\'t be here)"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4001
    sget-object v4, Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;->PHONE_NOT_IN_USE:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    goto :goto_0
.end method

.method private unregisterForPhoneStates()V
    .locals 4

    .prologue
    .line 1808
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 1810
    .local v0, callManager:Ljava/lang/Object;
    :goto_0
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1811
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1814
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    .line 1815
    .local v1, phoneType:I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 1816
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForMmiComplete(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1817
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForMmiInitiate(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1829
    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForPostDialCharacter(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1830
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForSuppServiceFailed(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1831
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForIncomingRing(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1832
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v2}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForNewRingingConnection(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1839
    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->unregisterForPhoneStatesMTK(Ljava/lang/Object;)V

    .line 1842
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mRegisteredForPhoneStates:Z

    .line 1843
    return-void

    .line 1808
    .end local v0           #callManager:Ljava/lang/Object;
    .end local v1           #phoneType:I
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_0

    .line 1818
    .restart local v0       #callManager:Ljava/lang/Object;
    .restart local v1       #phoneType:I
    :cond_2
    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 1820
    const-string v2, "Registering for Call Waiting."

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1822
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/CallManager;->unregisterForCallWaiting(Landroid/os/Handler;)V

    goto :goto_1
.end method

.method private unregisterForPhoneStatesMTK(Ljava/lang/Object;)V
    .locals 1
    .parameter "callManager"

    .prologue
    .line 8345
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {p1, v0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForSpeechInfo(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 8346
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {p1, v0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForCrssSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 8347
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {p1, v0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForSuppServiceNotification(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 8348
    return-void
.end method

.method private updateCallCardVisibilityPerDialerState(Z)V
    .locals 3
    .parameter "animate"

    .prologue
    const/16 v2, 0x8

    .line 6093
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isDialerOpened()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->isLandscape(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 6096
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- updateCallCardVisibilityPerDialerState(animate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): dialpad open, hide mCallCard..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6099
    if-eqz p1, :cond_1

    .line 6100
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-static {v0, v2}, Lcom/android/phone/AnimationUtils$Fade;->hide(Landroid/view/View;I)V

    .line 6119
    :cond_0
    :goto_0
    return-void

    .line 6102
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v0, v2}, Lcom/android/phone/CallCard;->setVisibility(I)V

    goto :goto_0

    .line 6106
    :cond_2
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->CALL_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v0, v1, :cond_0

    .line 6109
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- updateCallCardVisibilityPerDialerState(animate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): dialpad dismissed, show mCallCard..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6112
    if-eqz p1, :cond_4

    .line 6113
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-static {v0}, Lcom/android/phone/AnimationUtils$Fade;->show(Landroid/view/View;)V

    goto :goto_0

    .line 6115
    :cond_4
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/phone/CallCard;->setVisibility(I)V

    goto :goto_0
.end method

.method private updateExpandedViewState()V
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 8104
    iget-boolean v2, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    if-eqz v2, :cond_2

    .line 8105
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v2}, Lcom/android/phone/PhoneGlobals;->proximitySensorModeEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 8107
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v2, v2, Lcom/android/phone/NotificationMgr;->statusBarHelper:Lcom/android/phone/NotificationMgr$StatusBarHelper;

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v3, v4, :cond_0

    :goto_0
    invoke-virtual {v2, v0}, Lcom/android/phone/NotificationMgr$StatusBarHelper;->enableExpandedView(Z)V

    .line 8117
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 8107
    goto :goto_0

    .line 8112
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v0, v0, Lcom/android/phone/NotificationMgr;->statusBarHelper:Lcom/android/phone/NotificationMgr$StatusBarHelper;

    invoke-virtual {v0, v1}, Lcom/android/phone/NotificationMgr$StatusBarHelper;->enableExpandedView(Z)V

    goto :goto_1

    .line 8115
    :cond_2
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v1, v1, Lcom/android/phone/NotificationMgr;->statusBarHelper:Lcom/android/phone/NotificationMgr$StatusBarHelper;

    invoke-virtual {v1, v0}, Lcom/android/phone/NotificationMgr$StatusBarHelper;->enableExpandedView(Z)V

    goto :goto_1
.end method

.method private updateInCallTouchUi()V
    .locals 2

    .prologue
    .line 6262
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    if-eqz v0, :cond_0

    .line 6263
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallTouchUi;->updateState(Lcom/android/internal/telephony/CallManager;)V

    .line 6265
    :cond_0
    return-void
.end method

.method private updateLocalCache()V
    .locals 1

    .prologue
    .line 2895
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    .line 2896
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mBackgroundCall:Lcom/android/internal/telephony/Call;

    .line 2897
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    .line 2898
    return-void
.end method

.method private updateManageConferencePanelIfNecessary()V
    .locals 6

    .prologue
    .line 6035
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateManageConferencePanelIfNecessary: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6037
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getFgCallConnections()Ljava/util/List;

    move-result-object v0

    .line 6038
    .local v0, connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    if-nez v0, :cond_1

    .line 6039
    const-string v3, "==> no connections on foreground call!"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6041
    sget-object v3, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 6042
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->syncWithPhoneState()Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    move-result-object v2

    .line 6043
    .local v2, status:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    sget-object v3, Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;->SUCCESS:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    if-eq v2, v3, :cond_0

    .line 6044
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "- syncWithPhoneState failed! status = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6047
    const-string v3, "updateManageConferencePanelIfNecessary: endInCallScreenSession... 1"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6048
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 6077
    .end local v2           #status:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    :cond_0
    :goto_0
    return-void

    .line 6054
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 6055
    .local v1, numConnections:I
    const/4 v3, 0x1

    if-gt v1, v3, :cond_2

    .line 6056
    const-string v3, "==> foreground call no longer a conference!"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6058
    sget-object v3, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 6059
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->syncWithPhoneState()Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    move-result-object v2

    .line 6060
    .restart local v2       #status:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    sget-object v3, Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;->SUCCESS:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    if-eq v2, v3, :cond_0

    .line 6061
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "- syncWithPhoneState failed! status = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6064
    const-string v3, "updateManageConferencePanelIfNecessary: endInCallScreenSession... 2"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6065
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    goto :goto_0

    .line 6073
    .end local v2           #status:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    :cond_2
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3}, Lcom/android/phone/ManageConferenceUtils;->getNumCallersInConference()I

    move-result v3

    if-eq v1, v3, :cond_0

    .line 6074
    const-string v3, "==> Conference size has changed; need to rebuild UI!"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6075
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v3, v0}, Lcom/android/phone/ManageConferenceUtils;->updateManageConferencePanel(Ljava/util/List;)V

    goto :goto_0
.end method

.method private updatePrevPhonenums()V
    .locals 4

    .prologue
    .line 6991
    const-string v2, "-updatePrevPhonenums:update the previous phone number list."

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6996
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v0

    .line 6998
    .local v0, fgCalls:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    sget-object v2, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 6999
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 7000
    sget-object v2, Lcom/android/phone/InCallScreen;->prevPhonenums:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6999
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 7002
    :cond_0
    return-void
.end method

.method private updateProgressIndication()V
    .locals 4

    .prologue
    const v3, 0x7f0d02e2

    .line 5450
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5451
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissProgressIndication()V

    .line 5482
    :goto_0
    return-void

    .line 5457
    :cond_0
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v1, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    .line 5458
    .local v0, inCallUiState:Lcom/android/phone/InCallUiState;
    sget-object v1, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$phone$InCallUiState$ProgressIndicationType:[I

    invoke-virtual {v0}, Lcom/android/phone/InCallUiState;->getProgressIndication()Lcom/android/phone/InCallUiState$ProgressIndicationType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/phone/InCallUiState$ProgressIndicationType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 5477
    const-string v1, "InCallScreen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateProgressIndication: unexpected value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/android/phone/InCallUiState;->getProgressIndication()Lcom/android/phone/InCallUiState$ProgressIndicationType;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 5479
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissProgressIndication()V

    goto :goto_0

    .line 5461
    :pswitch_0
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissProgressIndication()V

    goto :goto_0

    .line 5465
    :pswitch_1
    const v1, 0x7f0d02e3

    invoke-direct {p0, v3, v1}, Lcom/android/phone/InCallScreen;->showProgressIndication(II)V

    goto :goto_0

    .line 5471
    :pswitch_2
    const v1, 0x7f0d02e4

    invoke-direct {p0, v3, v1}, Lcom/android/phone/InCallScreen;->showProgressIndication(II)V

    goto :goto_0

    .line 5458
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private updateScreen()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/16 v11, 0x8

    .line 3734
    const-string v8, "updateScreen()..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3735
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v8, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    .line 3737
    .local v4, inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v7

    .line 3738
    .local v7, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "  - phone state = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3739
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "  - inCallScreenMode = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3742
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    iget-boolean v10, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    invoke-virtual {v8, v9, v10}, Lcom/mediatek/phone/ext/InCallScreenExtension;->updateScreen(Lcom/android/internal/telephony/CallManager;Z)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 3944
    :cond_0
    :goto_0
    return-void

    .line 3749
    :cond_1
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v8

    if-nez v8, :cond_2

    .line 3750
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    if-eqz v8, :cond_2

    .line 3751
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v8}, Lcom/android/phone/RespondViaSmsManager;->dismissPopup()V

    .line 3757
    :cond_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->updateCallTime()V

    .line 3780
    iget-boolean v8, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    if-nez v8, :cond_3

    .line 3781
    const-string v8, "- updateScreen: not the foreground Activity! Bailing out..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 3785
    :cond_3
    sget-object v8, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v4, v8, :cond_5

    .line 3786
    const-string v8, "- updateScreen: OTA call state NORMAL (NOT updating in-call UI)..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3787
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v8, v11}, Lcom/android/phone/CallCard;->setVisibility(I)V

    .line 3788
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v8, :cond_4

    .line 3789
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v8}, Lcom/android/phone/OtaUtils;->otaShowProperScreen()V

    goto :goto_0

    .line 3791
    :cond_4
    const-string v8, "InCallScreen"

    const-string v9, "OtaUtils object is null, not showing any screen for that."

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 3794
    :cond_5
    sget-object v8, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v4, v8, :cond_7

    .line 3795
    const-string v8, "- updateScreen: OTA call ended state (NOT updating in-call UI)..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3796
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v8, v11}, Lcom/android/phone/CallCard;->setVisibility(I)V

    .line 3798
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->wakeUpScreen()V

    .line 3799
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v8, v8, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v9, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_ACTIVATION:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-ne v8, v9, :cond_6

    .line 3801
    const-string v8, "- updateScreen: OTA_STATUS_ACTIVATION"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3802
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v8, :cond_0

    .line 3803
    const-string v8, "- updateScreen: mApp.otaUtils is not null, call otaShowActivationScreen"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3805
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v8}, Lcom/android/phone/OtaUtils;->otaShowActivateScreen()V

    goto :goto_0

    .line 3808
    :cond_6
    const-string v8, "- updateScreen: OTA Call end state for Dialogs"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3809
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v8, :cond_0

    .line 3810
    const-string v8, "- updateScreen: Show OTA Success Failure dialog"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3811
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v8}, Lcom/android/phone/OtaUtils;->otaShowSuccessFailure()V

    goto/16 :goto_0

    .line 3815
    :cond_7
    sget-object v8, Lcom/android/phone/InCallUiState$InCallScreenMode;->MANAGE_CONFERENCE:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v4, v8, :cond_9

    .line 3816
    const-string v8, "- updateScreen: manage conference mode (NOT updating in-call UI)..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3819
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->isLandscape(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 3821
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mSecCallInfo:Landroid/view/ViewStub;

    invoke-virtual {v8, v11}, Landroid/view/ViewStub;->setVisibility(I)V

    .line 3830
    :goto_1
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateManageConferencePanelIfNecessary()V

    goto/16 :goto_0

    .line 3825
    :cond_8
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v8, v11}, Lcom/android/phone/CallCard;->setVisibility(I)V

    goto :goto_1

    .line 3832
    :cond_9
    sget-object v8, Lcom/android/phone/InCallUiState$InCallScreenMode;->CALL_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v4, v8, :cond_a

    .line 3833
    const-string v8, "- updateScreen: call ended state..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3839
    :cond_a
    const-string v8, "- updateScreen: updating the in-call UI..."

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3843
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    .line 3847
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8, v9}, Lcom/android/phone/CallCard;->updateState(Lcom/android/internal/telephony/CallManager;)V

    .line 3855
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->handleRecordProc()V

    .line 3862
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v8, v9, :cond_c

    .line 3863
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v8}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v8

    if-eqz v8, :cond_b

    .line 3864
    const-string v8, "InCallScreen"

    const-string v9, "During RINGING state we force hiding dialpad."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3865
    invoke-direct {p0, v12}, Lcom/android/phone/InCallScreen;->closeDialpadInternal(Z)V

    .line 3883
    :cond_b
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v8}, Lcom/android/phone/DTMFTwelveKeyDialer;->clearDigits()V

    .line 3889
    :cond_c
    invoke-direct {p0, v12}, Lcom/android/phone/InCallScreen;->updateCallCardVisibilityPerDialerState(Z)V

    .line 3891
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateProgressIndication()V

    .line 3894
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 3895
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissAllDialogs()V

    goto/16 :goto_0

    .line 3913
    :cond_d
    const/4 v6, 0x0

    .line 3914
    .local v6, postDialStr:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getFgCallConnections()Ljava/util/List;

    move-result-object v1

    .line 3915
    .local v1, fgConnections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v5

    .line 3916
    .local v5, phoneType:I
    const/4 v8, 0x2

    if-ne v5, v8, :cond_10

    .line 3917
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getFgCallLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    .line 3918
    .local v2, fgLatestConnection:Lcom/android/internal/telephony/Connection;
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    invoke-virtual {v8}, Lcom/android/phone/CdmaPhoneCallState;->getCurrentCallState()Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    move-result-object v8

    sget-object v9, Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;->CONF_CALL:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    if-ne v8, v9, :cond_f

    .line 3920
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_e
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 3921
    .local v0, cn:Lcom/android/internal/telephony/Connection;
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getPostDialState()Lcom/android/internal/telephony/Connection$PostDialState;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/Connection$PostDialState;->WAIT:Lcom/android/internal/telephony/Connection$PostDialState;

    if-ne v8, v9, :cond_e

    .line 3923
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->cancelPostDial()V

    goto :goto_2

    .line 3926
    .end local v0           #cn:Lcom/android/internal/telephony/Connection;
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_f
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->getPostDialState()Lcom/android/internal/telephony/Connection$PostDialState;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/Connection$PostDialState;->WAIT:Lcom/android/internal/telephony/Connection$PostDialState;

    if-ne v8, v9, :cond_0

    .line 3928
    const-string v8, "show the Wait dialog for CDMA"

    invoke-direct {p0, v8}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 3929
    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->getRemainingPostDialString()Ljava/lang/String;

    move-result-object v6

    .line 3930
    invoke-direct {p0, v2, v6}, Lcom/android/phone/InCallScreen;->showWaitPromptDialog(Lcom/android/internal/telephony/Connection;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 3932
    .end local v2           #fgLatestConnection:Lcom/android/internal/telephony/Connection;
    :cond_10
    const/4 v8, 0x1

    if-eq v5, v8, :cond_11

    const/4 v8, 0x3

    if-ne v5, v8, :cond_13

    .line 3934
    :cond_11
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3       #i$:Ljava/util/Iterator;
    :cond_12
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 3935
    .restart local v0       #cn:Lcom/android/internal/telephony/Connection;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getPostDialState()Lcom/android/internal/telephony/Connection$PostDialState;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/Connection$PostDialState;->WAIT:Lcom/android/internal/telephony/Connection$PostDialState;

    if-ne v8, v9, :cond_12

    .line 3936
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getRemainingPostDialString()Ljava/lang/String;

    move-result-object v6

    .line 3937
    invoke-direct {p0, v0, v6}, Lcom/android/phone/InCallScreen;->showWaitPromptDialog(Lcom/android/internal/telephony/Connection;Ljava/lang/String;)V

    goto :goto_3

    .line 3941
    .end local v0           #cn:Lcom/android/internal/telephony/Connection;
    .end local v3           #i$:Ljava/util/Iterator;
    :cond_13
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unexpected phone type: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method private updateVoiceCallRecordState(I)V
    .locals 4
    .parameter "state"

    .prologue
    .line 4278
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateVoiceCallRecordState... state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4279
    const/4 v0, 0x0

    .line 4280
    .local v0, ringCall:Lcom/android/internal/telephony/Call;
    const/4 v1, 0x0

    .line 4281
    .local v1, ringCallState:Lcom/android/internal/telephony/Call$State;
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    if-eqz v2, :cond_0

    .line 4282
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 4283
    if-eqz v0, :cond_0

    .line 4284
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    .line 4288
    :cond_0
    const/4 v2, 0x1

    if-ne v2, p1, :cond_2

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v2

    if-nez v2, :cond_2

    .line 4290
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mVoiceRecorderIcon:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4297
    :cond_1
    :goto_0
    return-void

    .line 4292
    :cond_2
    if-eqz p1, :cond_3

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 4295
    :cond_3
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mVoiceRecorderIcon:Landroid/widget/ImageView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public acceptIncomingCallByVoiceCommand()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 8277
    const-string v0, "acceptIncomingCallByVoiceCommand"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8278
    const v0, 0x7f080008

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->handleOnscreenButtonClick(I)V

    .line 8279
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->isBluetoothHeadsetAudioOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 8280
    const-string v0, "acceptIncomingCallByVoiceCommand(), turn on speaker"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8281
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-static {v0, v1, v1, v1}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZZ)V

    .line 8283
    :cond_0
    return-void
.end method

.method adjustProcessPriority()V
    .locals 2

    .prologue
    .line 7610
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    .line 7611
    .local v0, myId:I
    invoke-static {v0}, Landroid/os/Process;->getThreadPriority(I)I

    move-result v1

    if-eqz v1, :cond_0

    .line 7612
    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/Process;->setThreadPriority(II)V

    .line 7614
    :cond_0
    return-void
.end method

.method public cancelLockScreenTimer()V
    .locals 1

    .prologue
    .line 8445
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->delayTime_disableTouch:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isVTInCallScreenOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 8446
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 8447
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 8450
    :cond_0
    return-void
.end method

.method connectBluetoothAudio()V
    .locals 2

    .prologue
    .line 6644
    const-string v0, "connectBluetoothAudio()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6645
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v0, :cond_0

    .line 6647
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothHeadset;->connectAudio()Z

    .line 6655
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothConnectionPending:Z

    .line 6656
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothConnectionRequestTime:J

    .line 6657
    return-void
.end method

.method public delayStartLockScreen()V
    .locals 6

    .prologue
    .line 8427
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->timer:Ljava/util/Timer;

    .line 8428
    new-instance v0, Lcom/android/phone/InCallScreen$32;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$32;-><init>(Lcom/android/phone/InCallScreen;)V

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->timerTask:Ljava/util/TimerTask;

    .line 8442
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->timer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->timerTask:Ljava/util/TimerTask;

    iget v2, p0, Lcom/android/phone/InCallScreen;->lock_screen_time:I

    int-to-long v2, v2

    iget v4, p0, Lcom/android/phone/InCallScreen;->lock_screen_time:I

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 8443
    return-void
.end method

.method public delayedCleanupAfterDisconnect()V
    .locals 3

    .prologue
    .line 8248
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v0

    .line 8249
    .local v0, geminiSlots:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 8250
    sget-object v2, Lcom/android/phone/InCallScreen;->DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I

    aget v2, v2, v1

    invoke-virtual {p0, v2}, Lcom/android/phone/InCallScreen;->delayedCleanupAfterDisconnect(I)V

    .line 8249
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 8252
    :cond_0
    return-void
.end method

.method public delayedCleanupAfterDisconnect(I)V
    .locals 10
    .parameter "msg"

    .prologue
    const/4 v7, 0x0

    const/4 v9, -0x1

    .line 4089
    const/4 v4, 0x0

    .line 4090
    .local v4, slot:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 4092
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "delayedCleanupAfterDisconnect()...  GeminiPhone state = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v6, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4110
    :goto_0
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CallManager;->clearDisconnected()V

    .line 4118
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->phoneIsInUse()Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v6, v6, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    invoke-virtual {v6}, Lcom/android/phone/InCallUiState;->isProgressIndicationActive()Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_0
    const/4 v5, 0x1

    .line 4120
    .local v5, stayHere:Z
    :goto_1
    if-eqz v5, :cond_3

    .line 4121
    const-string v6, "- delayedCleanupAfterDisconnect: staying on the InCallScreen..."

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4219
    :goto_2
    return-void

    .line 4096
    .end local v5           #stayHere:Z
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "delayedCleanupAfterDisconnect()...  Phone state = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move v5, v7

    .line 4118
    goto :goto_1

    .line 4124
    .restart local v5       #stayHere:Z
    :cond_3
    const-string v6, "- delayedCleanupAfterDisconnect: phone is idle..."

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4128
    iget-boolean v6, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    if-eqz v6, :cond_5

    .line 4129
    const-string v6, "- delayedCleanupAfterDisconnect: finishing InCallScreen..."

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4130
    sput v9, Lcom/android/phone/InCallUiState;->sLastInCallScreenStatus:I

    .line 4148
    const-string v6, "- Post-call behavior:"

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4151
    const/4 v2, 0x0

    .line 4152
    .local v2, isPhoneStateRestricted:Z
    sget-object v6, Lcom/android/phone/InCallScreen;->DELAYED_CLEANUP_AFTER_DISCONNECT_GEMINI:[I

    invoke-static {p1, v6}, Lcom/mediatek/phone/gemini/GeminiRegister;->getSlotIdByRegisterEvent(I[I)I

    move-result v4

    .line 4153
    invoke-virtual {p0, v4}, Lcom/android/phone/InCallScreen;->isPhoneStateRestricted(I)Z

    move-result v2

    .line 4155
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " - isPhoneStateRestricted slot="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", isPhoneStateRestricted = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4168
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isPhoneStateRestricted()Z

    move-result v6

    if-eqz v6, :cond_4

    sget-boolean v6, Lcom/android/phone/PhoneGlobals;->sVoiceCapable:Z

    if-eqz v6, :cond_4

    .line 4169
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v6}, Lcom/android/phone/PhoneGlobals;->createPhoneEndIntent()Landroid/content/Intent;

    move-result-object v1

    .line 4170
    .local v1, intent:Landroid/content/Intent;
    const/high16 v6, 0x7f05

    const v7, 0x7f050001

    invoke-static {p0, v6, v7}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    move-result-object v3

    .line 4173
    .local v3, opts:Landroid/app/ActivityOptions;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "- Show Call Log (or Dialtacts) after disconnect. Current intent: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4176
    if-eqz v1, :cond_4

    .line 4178
    const/high16 v6, 0x1

    :try_start_0
    invoke-virtual {v1, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 4179
    invoke-virtual {v3}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v6

    invoke-virtual {p0, v1, v6}, Lcom/android/phone/InCallScreen;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4197
    .end local v1           #intent:Landroid/content/Intent;
    .end local v3           #opts:Landroid/app/ActivityOptions;
    :cond_4
    :goto_3
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 4198
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->finishIfNecessory()V

    .line 4208
    .end local v2           #isPhoneStateRestricted:Z
    :goto_4
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 4209
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->finishIfNecessory()V

    .line 4213
    const-wide/16 v6, 0xc8

    invoke-virtual {p0, v6, v7}, Lcom/android/phone/InCallScreen;->requestUpdateScreenDelay(J)V

    .line 4217
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/android/phone/PhoneGlobals;->setLatestActiveCallOrigin(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 4180
    .restart local v1       #intent:Landroid/content/Intent;
    .restart local v2       #isPhoneStateRestricted:Z
    .restart local v3       #opts:Landroid/app/ActivityOptions;
    :catch_0
    move-exception v0

    .line 4187
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const-string v6, "InCallScreen"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "delayedCleanupAfterDisconnect: transition to call log failed; intent = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 4201
    .end local v0           #e:Landroid/content/ActivityNotFoundException;
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #isPhoneStateRestricted:Z
    .end local v3           #opts:Landroid/app/ActivityOptions;
    :cond_5
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->phoneIsInUse()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 4202
    sput v9, Lcom/android/phone/InCallUiState;->sLastInCallScreenStatus:I

    goto :goto_4

    .line 4204
    :cond_6
    sput v7, Lcom/android/phone/InCallUiState;->sLastInCallScreenStatus:I

    goto :goto_4
.end method

.method disconnectBluetoothAudio()V
    .locals 1

    .prologue
    .line 6660
    const-string v0, "disconnectBluetoothAudio()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6661
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v0, :cond_0

    .line 6662
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothHeadset;->disconnectAudio()Z

    .line 6664
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothConnectionPending:Z

    .line 6665
    return-void
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 6908
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 6909
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v0, p1}, Lcom/android/phone/CallCard;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 6910
    const/4 v0, 0x1

    return v0
.end method

.method doSuppCrssSuppServiceNotification(Ljava/lang/String;)V
    .locals 7
    .parameter "number"

    .prologue
    .line 2662
    const/4 v1, 0x0

    .line 2663
    .local v1, conn:Lcom/android/internal/telephony/Connection;
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    if-eqz v4, :cond_0

    .line 2664
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v3

    .line 2665
    .local v3, phoneType:I
    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 2666
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    .line 2674
    .end local v3           #phoneType:I
    :cond_0
    :goto_0
    if-nez v1, :cond_3

    .line 2677
    const-string v4, " Connnection is null"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2700
    :goto_1
    return-void

    .line 2667
    .restart local v3       #phoneType:I
    :cond_1
    const/4 v4, 0x1

    if-ne v3, v4, :cond_2

    .line 2668
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    goto :goto_0

    .line 2670
    :cond_2
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected phone type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2681
    .end local v3           #phoneType:I
    :cond_3
    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v2

    .line 2682
    .local v2, o:Ljava/lang/Object;
    instance-of v4, v2, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v4, :cond_5

    move-object v0, v2

    .line 2683
    check-cast v0, Lcom/android/internal/telephony/CallerInfo;

    .line 2686
    .local v0, ci:Lcom/android/internal/telephony/CallerInfo;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SuppCrssSuppService ci.phoneNumber:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2688
    invoke-virtual {v0}, Lcom/android/internal/telephony/CallerInfo;->isVoiceMailNumber()Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallerInfo;->isEmergencyNumber()Z

    move-result v4

    if-nez v4, :cond_4

    .line 2689
    iput-object p1, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 2697
    .end local v0           #ci:Lcom/android/internal/telephony/CallerInfo;
    :cond_4
    :goto_2
    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/Connection;->setUserData(Ljava/lang/Object;)V

    .line 2698
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    goto :goto_1

    .line 2691
    :cond_5
    instance-of v4, v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v4, :cond_4

    move-object v4, v2

    .line 2692
    check-cast v4, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    iget-object v0, v4, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 2693
    .restart local v0       #ci:Lcom/android/internal/telephony/CallerInfo;
    invoke-virtual {v0}, Lcom/android/internal/telephony/CallerInfo;->isVoiceMailNumber()Z

    move-result v4

    if-nez v4, :cond_4

    .line 2694
    iput-object p1, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    goto :goto_2
.end method

.method doSuppCrssSuppServiceNotificationforInComing()V
    .locals 5

    .prologue
    .line 2707
    const-string v4, "doSuppCrssSuppServiceNotificationforInComing..."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2710
    const/4 v1, 0x0

    .line 2711
    .local v1, conn:Lcom/android/internal/telephony/Connection;
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 2712
    .local v3, ringingCall:Lcom/android/internal/telephony/Call;
    if-eqz v3, :cond_0

    .line 2713
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    .line 2716
    :cond_0
    if-eqz v1, :cond_1

    .line 2717
    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v2

    .line 2718
    .local v2, o:Ljava/lang/Object;
    instance-of v4, v2, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v4, :cond_2

    move-object v0, v2

    .line 2719
    check-cast v0, Lcom/android/internal/telephony/CallerInfo;

    .line 2720
    .local v0, ci:Lcom/android/internal/telephony/CallerInfo;
    iget-boolean v4, v0, Lcom/android/internal/telephony/CallerInfo;->shouldSendToVoicemail:Z

    if-eqz v4, :cond_2

    .line 2721
    const-string v4, "should not update Screen and Notification."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2729
    .end local v0           #ci:Lcom/android/internal/telephony/CallerInfo;
    .end local v2           #o:Ljava/lang/Object;
    :cond_1
    :goto_0
    return-void

    .line 2725
    .restart local v2       #o:Ljava/lang/Object;
    :cond_2
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    .line 2726
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v4}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    goto :goto_0
.end method

.method enableHomeKeyDispatched(Z)V
    .locals 4
    .parameter "enable"

    .prologue
    .line 7483
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "enableHomeKeyDispatched, enable = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7485
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 7486
    .local v1, window:Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 7487
    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    if-eqz p1, :cond_0

    .line 7488
    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v3, -0x8000

    or-int/2addr v2, v3

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 7492
    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 7493
    return-void

    .line 7490
    :cond_0
    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v3, 0x7fffffff

    and-int/2addr v2, v3

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_0
.end method

.method public endInCallScreenSession()V
    .locals 2

    .prologue
    .line 1662
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "endInCallScreenSession()... phone state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1663
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession(Z)V

    .line 1664
    return-void
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 1649
    const-string v0, "finish()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1650
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissDialogs()V

    .line 1651
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->moveTaskToBack(Z)Z

    .line 1652
    return-void
.end method

.method finishForTest()V
    .locals 0

    .prologue
    .line 7496
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 7497
    return-void
.end method

.method getCallCardOnlyForTest()Lcom/android/phone/CallCard;
    .locals 1

    .prologue
    .line 6278
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    return-object v0
.end method

.method getCallTimeOnlyForTest()Lcom/android/phone/CallTime;
    .locals 1

    .prologue
    .line 6285
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    return-object v0
.end method

.method getInCallControlStateOnlyForTest()Lcom/android/phone/InCallControlState;
    .locals 1

    .prologue
    .line 6306
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallControlState:Lcom/android/phone/InCallControlState;

    return-object v0
.end method

.method getInCallMenuStateOnlyForTest()Lcom/mediatek/phone/InCallMenuState;
    .locals 1

    .prologue
    .line 6313
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallMenuState:Lcom/mediatek/phone/InCallMenuState;

    return-object v0
.end method

.method getInCallTouchUi()Lcom/android/phone/InCallTouchUi;
    .locals 1

    .prologue
    .line 6271
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    return-object v0
.end method

.method public getInVoiceAnswerVideoCall()Z
    .locals 1

    .prologue
    .line 7539
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mInVoiceAnswerVideoCall:Z

    return v0
.end method

.method getManageConferenceUtilsOnlyForTest()Lcom/android/phone/ManageConferenceUtils;
    .locals 1

    .prologue
    .line 6320
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    return-object v0
.end method

.method public getOnAnswerAndEndFlag()Z
    .locals 1

    .prologue
    .line 5429
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mOnAnswerandEndCall:Z

    return v0
.end method

.method getRespondViaSmsManagerOnlyForTest()Lcom/android/phone/RespondViaSmsManager;
    .locals 1

    .prologue
    .line 6299
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    return-object v0
.end method

.method public getScreenSize()Landroid/graphics/Point;
    .locals 2

    .prologue
    .line 8361
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->sScreenSize:Landroid/graphics/Point;

    if-nez v1, :cond_0

    .line 8362
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 8363
    .local v0, outSize:Landroid/graphics/Point;
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 8364
    iput-object v0, p0, Lcom/android/phone/InCallScreen;->sScreenSize:Landroid/graphics/Point;

    .line 8367
    .end local v0           #outSize:Landroid/graphics/Point;
    :cond_0
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->sScreenSize:Landroid/graphics/Point;

    return-object v1
.end method

.method getSwappingCalls()Z
    .locals 1

    .prologue
    .line 7049
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    return v0
.end method

.method public getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;
    .locals 1

    .prologue
    .line 6853
    const-string v0, "getUpdatedInCallControlState()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6854
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallControlState:Lcom/android/phone/InCallControlState;

    invoke-virtual {v0}, Lcom/android/phone/InCallControlState;->update()V

    .line 6855
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallControlState:Lcom/android/phone/InCallControlState;

    return-object v0
.end method

.method public getVTInCallScreenInstance()Lcom/mediatek/phone/vt/IVTInCallScreen;
    .locals 1

    .prologue
    .line 7562
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    return-object v0
.end method

.method getVoiceRecorderIconOnlyForTest()Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 6292
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVoiceRecorderIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method getmAppOnlyForTest()Lcom/android/phone/PhoneGlobals;
    .locals 1

    .prologue
    .line 6355
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    return-object v0
.end method

.method getmCMOnlyForTest()Lcom/android/internal/telephony/CallManager;
    .locals 1

    .prologue
    .line 6397
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    return-object v0
.end method

.method getmDMLockReceiverOnlyForTest()Landroid/content/BroadcastReceiver;
    .locals 1

    .prologue
    .line 6341
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDMLockReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method getmDialerOnlyForTest()Lcom/android/phone/DTMFTwelveKeyDialer;
    .locals 1

    .prologue
    .line 6383
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    return-object v0
.end method

.method getmIsForegroundActivityForProximityOnlyForTest()Z
    .locals 1

    .prologue
    .line 6369
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivityForProximity:Z

    return v0
.end method

.method getmIsForegroundActivityOnlyForTest()Z
    .locals 1

    .prologue
    .line 6362
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    return v0
.end method

.method getmPopupMenuOnlyForTest()Landroid/widget/PopupMenu;
    .locals 1

    .prologue
    .line 6390
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    return-object v0
.end method

.method getmPowerManagerOnlyForTest()Landroid/os/PowerManager;
    .locals 1

    .prologue
    .line 6376
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPowerManager:Landroid/os/PowerManager;

    return-object v0
.end method

.method getmReceiverOnlyForTest()Landroid/content/BroadcastReceiver;
    .locals 1

    .prologue
    .line 6327
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method handleAnswerAndEnd(Lcom/android/internal/telephony/Call;)V
    .locals 7
    .parameter "call"

    .prologue
    .line 7774
    const-string v5, "+handleAnswerAndEnd"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7775
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v1

    .line 7776
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    .line 7778
    .local v4, size:I
    :try_start_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 7779
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    .line 7782
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v5, v6, :cond_2

    .line 7783
    const-string v5, "+handleAnswerAndEnd: hangup Call.State.ACTIVE"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7784
    instance-of v5, v2, Lcom/android/internal/telephony/sip/SipPhone;

    if-eqz v5, :cond_1

    .line 7785
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->hangup()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7799
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 7800
    .local v3, ringCall:Lcom/android/internal/telephony/Call;
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->hasActiveCdmaPhone()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v5

    const/4 v6, 0x2

    if-eq v5, v6, :cond_3

    .line 7802
    const-string v5, "handleAnswerAndEnd: cdma phone has acttive call, don\'t switch it and answer the ringing only"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7805
    :try_start_1
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->acceptCall()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 7813
    :goto_1
    const-string v5, "-handleAnswerAndEnd"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7814
    return-void

    .line 7787
    .end local v3           #ringCall:Lcom/android/internal/telephony/Call;
    .restart local v2       #phone:Lcom/android/internal/telephony/Phone;
    :cond_1
    :try_start_2
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->hangupActiveCall()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 7795
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :catch_0
    move-exception v0

    .line 7796
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7789
    .end local v0           #e:Ljava/lang/Exception;
    .restart local v2       #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    :try_start_3
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v5, v6, :cond_0

    .line 7790
    const-string v5, "+handleAnswerAndEnd: hangup Call.State.HOLDING and switch H&A"

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7791
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->hangup()V

    .line 7792
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 7806
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    .restart local v3       #ringCall:Lcom/android/internal/telephony/Call;
    :catch_1
    move-exception v0

    .line 7807
    .restart local v0       #e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 7810
    .end local v0           #e:Ljava/lang/Exception;
    :cond_3
    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto :goto_1
.end method

.method handleHoldAndUnhold()V
    .locals 5

    .prologue
    .line 7849
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v3

    if-nez v3, :cond_1

    .line 7863
    :cond_0
    :goto_0
    return-void

    .line 7852
    :cond_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v3}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 7853
    .local v2, fgCall:Lcom/android/internal/telephony/Call;
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v3}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 7855
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    :try_start_0
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 7856
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 7860
    :catch_0
    move-exception v1

    .line 7861
    .local v1, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleHoldAndUnhold: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7857
    .end local v1           #e:Ljava/lang/Exception;
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 7858
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 5
    .parameter "menuItem"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 7370
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 7419
    :goto_0
    :pswitch_0
    return v2

    .line 7376
    :pswitch_1
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->onHoldClick()V

    goto :goto_0

    .line 7379
    :pswitch_2
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->onAddCallClick()V

    .line 7380
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    move v2, v3

    .line 7381
    goto :goto_0

    .line 7383
    :pswitch_3
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 7384
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->mergeCalls(Lcom/android/internal/telephony/CallManager;)V

    move v2, v3

    .line 7385
    goto :goto_0

    .line 7387
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/android/phone/InCallScreen;->onVoiceRecordClick(Landroid/view/MenuItem;)V

    move v2, v3

    .line 7388
    goto :goto_0

    .line 7390
    :pswitch_5
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->onVTVoiceAnswer()V

    move v2, v3

    .line 7391
    goto :goto_0

    .line 7393
    :pswitch_6
    invoke-static {}, Lcom/android/phone/PhoneUtils;->hangupAllCalls()V

    move v2, v3

    .line 7394
    goto :goto_0

    .line 7396
    :pswitch_7
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->hangupHoldingCall(Lcom/android/internal/telephony/Call;)Z

    move v2, v3

    .line 7397
    goto :goto_0

    .line 7399
    :pswitch_8
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->hangup(Lcom/android/internal/telephony/Call;)Z

    move v2, v3

    .line 7400
    goto :goto_0

    .line 7404
    :pswitch_9
    :try_start_0
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 7405
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlotNotIdle(Lcom/android/internal/telephony/Phone;)I

    move-result v1

    .line 7406
    .local v1, slotId:I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 7407
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v2, v1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->explicitCallTransferGemini(I)V

    .end local v1           #slotId:I
    :cond_0
    :goto_1
    move v2, v3

    .line 7415
    goto :goto_0

    .line 7410
    :cond_1
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->explicitCallTransfer()V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 7412
    :catch_0
    move-exception v0

    .line 7413
    .local v0, e:Lcom/android/internal/telephony/CallStateException;
    invoke-virtual {v0}, Lcom/android/internal/telephony/CallStateException;->printStackTrace()V

    goto :goto_1

    .line 7370
    nop

    :pswitch_data_0
    .packed-switch 0x7f080138
        :pswitch_1
        :pswitch_5
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public handleOnscreenButtonClick(I)V
    .locals 7
    .parameter "id"

    .prologue
    .line 4680
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleOnscreenButtonClick(id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4683
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->pokeUserActivity()V

    .line 4685
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {v3, p1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->handleOnscreenButtonClick(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 4686
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->pokeUserActivity()V

    .line 4807
    :goto_0
    return-void

    .line 4690
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 4773
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleOnscreenButtonClick: unexpected ID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 4778
    :cond_1
    :goto_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->pokeUserActivity()V

    .line 4796
    const v3, 0x7f080085

    if-ne p1, v3, :cond_5

    .line 4797
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleOnscreenButtonClick: id == R.id.swapButton "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 4693
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->internalAnswerCall()V

    goto :goto_1

    .line 4704
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->hangupRingingCall()V

    goto :goto_1

    .line 4707
    :sswitch_2
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalRespondViaSms()V

    goto :goto_1

    .line 4712
    :sswitch_3
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->onHoldClick()V

    goto :goto_1

    .line 4715
    :sswitch_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 4716
    .local v0, currentTime:J
    iget-wide v3, p0, Lcom/android/phone/InCallScreen;->mLastClickActionTime:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0x3e8

    cmp-long v3, v3, v5

    if-lez v3, :cond_1

    .line 4717
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v3}, Lcom/mediatek/phone/DualTalkUtils;->isDualTalkMultipleHoldCase()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 4718
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v3}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v2

    .line 4719
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->selectWhichCallActive(Ljava/util/List;)V

    .line 4723
    .end local v2           #list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    :goto_2
    iput-wide v0, p0, Lcom/android/phone/InCallScreen;->mLastClickActionTime:J

    goto :goto_1

    .line 4721
    :cond_2
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSwapCalls()V

    goto :goto_2

    .line 4727
    .end local v0           #currentTime:J
    :sswitch_5
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalHangup()V

    goto :goto_1

    .line 4730
    :sswitch_6
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->onOpenCloseDialpad()V

    goto :goto_1

    .line 4733
    :sswitch_7
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->onMuteClick()V

    goto :goto_1

    .line 4741
    :sswitch_8
    iget-boolean v3, p0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    if-eqz v3, :cond_3

    .line 4743
    const-string v3, "ignore addButton click event"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 4747
    :cond_3
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->onAddCallClick()V

    goto :goto_1

    .line 4751
    :sswitch_9
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 4752
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->mergeCalls(Lcom/android/internal/telephony/CallManager;)V

    goto/16 :goto_1

    .line 4757
    :sswitch_a
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v3, :cond_4

    .line 4758
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->dismiss()V

    .line 4760
    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/phone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->constructPopupMenu(Landroid/view/View;)Landroid/widget/PopupMenu;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 4761
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/Menu;->hasVisibleItems()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 4762
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_1

    .line 4768
    :sswitch_b
    sget-object v3, Lcom/android/phone/InCallUiState$InCallScreenMode;->MANAGE_CONFERENCE:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 4769
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    goto/16 :goto_1

    .line 4801
    :cond_5
    const v3, 0x7f080088

    if-ne p1, v3, :cond_6

    .line 4802
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleOnscreenButtonClick: id == R.id.mergeButton "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 4806
    :cond_6
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    goto/16 :goto_0

    .line 4690
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f080008 -> :sswitch_0
        0x7f080009 -> :sswitch_1
        0x7f08000a -> :sswitch_2
        0x7f080062 -> :sswitch_b
        0x7f080065 -> :sswitch_9
        0x7f080079 -> :sswitch_5
        0x7f08007d -> :sswitch_6
        0x7f08007f -> :sswitch_7
        0x7f080084 -> :sswitch_3
        0x7f080085 -> :sswitch_4
        0x7f080087 -> :sswitch_8
        0x7f080088 -> :sswitch_9
        0x7f080089 -> :sswitch_a
        0x7f08008b -> :sswitch_a
    .end sparse-switch
.end method

.method public handleOtaCallEnd()V
    .locals 2

    .prologue
    .line 6711
    const-string v0, "handleOtaCallEnd entering"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6712
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v0, v0, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v1, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_UNDEFINED:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-eq v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    iget-boolean v0, v0, Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;->inOtaSpcState:Z

    if-nez v0, :cond_1

    .line 6718
    const-string v0, "handleOtaCallEnd - Set OTA Call End stater"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6719
    sget-object v0, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 6720
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    .line 6722
    :cond_1
    return-void
.end method

.method public handleStorageFull(Z)V
    .locals 4
    .parameter "isForCheckingOrRecording"

    .prologue
    const/4 v3, 0x1

    .line 7999
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getMountedStorageCount()I

    move-result v1

    if-le v1, v3, :cond_3

    .line 8001
    const-string v1, "handleStorageFull(), mounted storage count > 1"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8002
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getDefaultStorageType()I

    move-result v1

    if-ne v3, v1, :cond_1

    .line 8003
    const-string v1, "handleStorageFull(), SD card is using"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8004
    const v1, 0x20500e9

    invoke-virtual {p0, v1, v3}, Lcom/android/phone/InCallScreen;->showStorageFullDialog(IZ)V

    .line 8028
    :cond_0
    :goto_0
    return-void

    .line 8005
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getDefaultStorageType()I

    move-result v1

    if-nez v1, :cond_2

    .line 8006
    const-string v1, "handleStorageFull(), phone storage is using"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8007
    const v1, 0x20500e7

    invoke-virtual {p0, v1, v3}, Lcom/android/phone/InCallScreen;->showStorageFullDialog(IZ)V

    goto :goto_0

    .line 8010
    :cond_2
    const-string v1, "handleStorageFull(), never happen here"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 8012
    :cond_3
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getMountedStorageCount()I

    move-result v1

    if-ne v3, v1, :cond_0

    .line 8013
    const-string v1, "handleStorageFull(), mounted storage count == 1"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8014
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getDefaultStorageType()I

    move-result v1

    if-ne v3, v1, :cond_6

    .line 8015
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleStorageFull(), SD card is using, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p1, :cond_4

    const-string v1, "checking case"

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8016
    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0034

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 8018
    .local v0, toast:Ljava/lang/String;
    :goto_2
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-static {v1, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 8015
    .end local v0           #toast:Ljava/lang/String;
    :cond_4
    const-string v1, "recording case"

    goto :goto_1

    .line 8016
    :cond_5
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d006c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 8019
    :cond_6
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getDefaultStorageType()I

    move-result v1

    if-nez v1, :cond_7

    .line 8021
    const-string v1, "handleStorageFull(), phone storage is using"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8022
    const v1, 0x20500e8

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/android/phone/InCallScreen;->showStorageFullDialog(IZ)V

    goto :goto_0

    .line 8025
    :cond_7
    const-string v1, "handleStorageFull(), never happen here"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method handleSwitchFailed()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 8291
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v9

    sget-object v10, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v9, v10, :cond_0

    .line 8294
    const-string v9, "send message to update screen after 500ms"

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8295
    const-wide/16 v9, 0x1f4

    invoke-virtual {p0, v9, v10}, Lcom/android/phone/InCallScreen;->requestUpdateScreenDelay(J)V

    .line 8296
    const v9, 0x7f0d02db

    invoke-static {p0, v9, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    .line 8335
    :goto_0
    return-void

    .line 8299
    :cond_0
    const/4 v0, 0x0

    .line 8300
    .local v0, activeCalls:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v9

    if-eqz v9, :cond_3

    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v9, :cond_3

    .line 8301
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v9}, Lcom/mediatek/phone/DualTalkUtils;->getAllActiveCalls()Ljava/util/List;

    move-result-object v0

    .line 8320
    :cond_1
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    const/4 v10, 0x2

    if-ge v9, v10, :cond_5

    .line 8321
    :cond_2
    const-string v9, "This is only one ACTIVE call, so do nothing."

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 8303
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    .end local v0           #activeCalls:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8304
    .restart local v0       #activeCalls:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    iget-object v9, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->getAllPhones()Ljava/util/List;

    move-result-object v6

    .line 8305
    .local v6, phoneList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/Phone;

    .line 8307
    .local v5, phone:Lcom/android/internal/telephony/Phone;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "active phone = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " phone state = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8309
    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v9

    sget-object v10, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v9, v10, :cond_4

    .line 8310
    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 8312
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "active call = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " state = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8314
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 8315
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 8323
    .end local v1           #fgCall:Lcom/android/internal/telephony/Call;
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #phone:Lcom/android/internal/telephony/Phone;
    .end local v6           #phoneList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    :cond_5
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/Call;

    invoke-static {v9}, Lcom/android/phone/CallTime;->getCallDuration(Lcom/android/internal/telephony/Call;)J

    move-result-wide v2

    .line 8324
    .local v2, firstDuration:J
    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/Call;

    invoke-static {v9}, Lcom/android/phone/CallTime;->getCallDuration(Lcom/android/internal/telephony/Call;)J

    move-result-wide v7

    .line 8325
    .local v7, secondDuration:J
    const-string v9, "More than one ACTIVE calls, hangup the latest."

    invoke-direct {p0, v9}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8327
    cmp-long v9, v2, v7

    if-lez v9, :cond_6

    .line 8328
    const/4 v9, 0x1

    :try_start_0
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/Call;

    invoke-virtual {v9}, Lcom/android/internal/telephony/Call;->hangup()V

    goto/16 :goto_0

    .line 8332
    :catch_0
    move-exception v9

    goto/16 :goto_0

    .line 8330
    :cond_6
    const/4 v9, 0x0

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/Call;

    invoke-virtual {v9}, Lcom/android/internal/telephony/Call;->hangup()V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method handleUnholdAndEnd(Lcom/android/internal/telephony/Call;)V
    .locals 6
    .parameter "call"

    .prologue
    .line 7817
    const-string v4, "+handleUnholdAndEnd"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7818
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v4}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v1

    .line 7819
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    .line 7821
    .local v3, size:I
    :try_start_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 7822
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    .line 7825
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_2

    .line 7826
    const-string v4, "+handleUnholdAndEnd: hangup Call.State.ACTIVE"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7827
    instance-of v4, v2, Lcom/android/internal/telephony/sip/SipPhone;

    if-eqz v4, :cond_1

    .line 7828
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->hangup()V

    .line 7839
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v4}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7845
    :goto_1
    const-string v4, "-handleUnholdAndEnd"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7846
    return-void

    .line 7830
    .restart local v2       #phone:Lcom/android/internal/telephony/Phone;
    :cond_1
    :try_start_1
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->hangupActiveCall()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 7841
    .end local v2           #phone:Lcom/android/internal/telephony/Phone;
    :catch_0
    move-exception v0

    .line 7842
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 7832
    .end local v0           #e:Ljava/lang/Exception;
    .restart local v2       #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    :try_start_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_0

    .line 7833
    const-string v4, "+handleUnholdAndEnd: hangup Call.State.HOLDING and switch H&A"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7834
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->hangup()V

    .line 7835
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0
.end method

.method handleVideoAndVoiceIncoming(Lcom/mediatek/phone/DualTalkUtils;)V
    .locals 4
    .parameter "dt"

    .prologue
    .line 7890
    if-eqz p1, :cond_0

    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v3

    if-nez v3, :cond_1

    .line 7913
    :cond_0
    :goto_0
    return-void

    .line 7894
    :cond_1
    invoke-virtual {p1}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 7898
    invoke-virtual {p1}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 7899
    .local v1, firstRinging:Lcom/android/internal/telephony/Call;
    invoke-virtual {p1}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveRingCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 7902
    .local v2, secondRinging:Lcom/android/internal/telephony/Call;
    invoke-static {v1}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 7906
    :cond_2
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 7908
    :try_start_0
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->hangup()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 7909
    :catch_0
    move-exception v0

    .line 7910
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method hangupRingingCall()V
    .locals 2

    .prologue
    .line 5683
    const-string v0, "hangupRingingCall()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5684
    invoke-static {}, Lcom/android/phone/PhoneUtils;->dumpCallManager()V

    .line 5687
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v0}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5688
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v0}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->hangupForDualTalk(Lcom/android/internal/telephony/Call;)V

    .line 5689
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveRingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/phone/CallNotifier;->switchRingToneByNeeded(Lcom/android/internal/telephony/Call;)V

    .line 5697
    :goto_0
    return-void

    .line 5691
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->hangupRingingCall(Lcom/android/internal/telephony/Call;)Z

    .line 5695
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSilenceRinger()V

    goto :goto_0
.end method

.method ignoreUpdateScreen()Z
    .locals 3

    .prologue
    .line 7581
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v1

    .line 7582
    .local v1, hasActiveFgCall:Z
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v0

    .line 7583
    .local v0, hasActiveBgCall:Z
    if-nez v1, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->notifier:Lcom/android/phone/CallNotifier;

    invoke-virtual {v2}, Lcom/android/phone/CallNotifier;->hasPendingCallerInfoQuery()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public internalAnswerCall()V
    .locals 11

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x1

    const/4 v8, 0x2

    .line 5525
    const-string v7, "internalAnswerCall()..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5527
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v3

    .line 5531
    .local v3, hasRingingCall:Z
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 5532
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v7

    if-nez v7, :cond_0

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->isDualTalkAnswerCase()Z

    move-result v7

    if-nez v7, :cond_0

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v7}, Lcom/mediatek/phone/DualTalkUtils;->isRingingWhenOutgoing()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 5535
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->internalAnswerCallForDualTalk()V

    .line 5666
    :cond_1
    :goto_0
    return-void

    .line 5540
    :cond_2
    if-eqz v3, :cond_1

    .line 5541
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getRingingPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    .line 5542
    .local v4, phone:Lcom/android/internal/telephony/Phone;
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v6

    .line 5543
    .local v6, ringing:Lcom/android/internal/telephony/Call;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v5

    .line 5544
    .local v5, phoneType:I
    if-ne v5, v8, :cond_4

    .line 5545
    const-string v7, "internalAnswerCall: answering (CDMA)..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5546
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v7

    if-ne v7, v10, :cond_3

    .line 5555
    const-string v7, "internalAnswerCall: answer CDMA incoming and end SIP ongoing"

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5557
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v7, v6}, Lcom/android/phone/PhoneUtils;->answerAndEndActive(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)Z

    .line 5664
    :goto_1
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/android/phone/PhoneGlobals;->setLatestActiveCallOrigin(Ljava/lang/String;)V

    goto :goto_0

    .line 5559
    :cond_3
    invoke-static {v6}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto :goto_1

    .line 5561
    :cond_4
    if-ne v5, v10, :cond_8

    .line 5562
    const-string v7, "internalAnswerCall: answering (SIP)..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5563
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v7

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v7

    if-ne v7, v8, :cond_5

    .line 5573
    const-string v7, "internalAnswerCall: answer SIP incoming and end CDMA ongoing"

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5575
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v7, v6}, Lcom/android/phone/PhoneUtils;->answerAndEndActive(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)Z

    goto :goto_1

    .line 5576
    :cond_5
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v7

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v7

    if-eq v7, v8, :cond_6

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 5579
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v7, v6}, Lcom/android/phone/PhoneUtils;->answerAndEndActive(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)Z

    goto :goto_1

    .line 5581
    :cond_6
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v7

    if-eqz v7, :cond_7

    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 5583
    :try_start_0
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/internal/telephony/Phone;->hangupActiveCall()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5588
    :cond_7
    :goto_2
    invoke-static {v6}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto :goto_1

    .line 5584
    :catch_0
    move-exception v0

    .line 5585
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 5590
    .end local v0           #e:Ljava/lang/Exception;
    :cond_8
    if-ne v5, v9, :cond_a

    .line 5591
    const-string v7, "internalAnswerCall: answering (GSM)..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5596
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v1

    .line 5597
    .local v1, hasActiveCall:Z
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v2

    .line 5642
    .local v2, hasHoldingCall:Z
    if-eqz v1, :cond_9

    if-eqz v2, :cond_9

    .line 5643
    const-string v7, "internalAnswerCall: answering (both lines in use!)..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5647
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/phone/PhoneUtils;->answerAndEndActive(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)Z

    .line 5649
    invoke-virtual {p0, v9}, Lcom/android/phone/InCallScreen;->setOnAnswerAndEndFlag(Z)V

    goto/16 :goto_1

    .line 5655
    :cond_9
    const-string v7, "internalAnswerCall: answering..."

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5656
    invoke-static {v6}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto/16 :goto_1

    .line 5660
    .end local v1           #hasActiveCall:Z
    .end local v2           #hasHoldingCall:Z
    :cond_a
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected phone type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method internalAnswerCallForDualTalk()V
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x2

    .line 7621
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v9

    .line 7624
    .local v9, ringing:Lcom/android/internal/telephony/Call;
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->isRingingWhenOutgoing()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 7626
    const-string v11, "internalAnswerCallForDualTalk: ringing when dialing"

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7628
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActivieFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 7629
    .local v1, call:Lcom/android/internal/telephony/Call;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 7631
    :try_start_0
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    .line 7632
    .local v8, phone:Lcom/android/internal/telephony/Phone;
    instance-of v11, v8, Lcom/android/internal/telephony/sip/SipPhone;

    if-eqz v11, :cond_2

    .line 7633
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->hangup()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7648
    .end local v1           #call:Lcom/android/internal/telephony/Call;
    .end local v8           #phone:Lcom/android/internal/telephony/Phone;
    :cond_0
    :goto_0
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->getAllNoIdleCalls()Ljava/util/List;

    move-result-object v7

    .line 7649
    .local v7, list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v2

    .line 7652
    .local v2, callCount:I
    if-le v2, v12, :cond_4

    .line 7654
    :try_start_1
    const-string v11, "internalAnswerCallForDualTalk: has more than two calls exist."

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7659
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->hasActiveCdmaPhone()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 7661
    invoke-virtual {v9}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/phone/InCallScreen;->handleAnswerAndEnd(Lcom/android/internal/telephony/Call;)V

    .line 7663
    const-string v11, "internalAnswerCallForDualTalk (C+G): hangup the gsm active call!"

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 7770
    :cond_1
    :goto_1
    return-void

    .line 7640
    .end local v2           #callCount:I
    .end local v7           #list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    .restart local v1       #call:Lcom/android/internal/telephony/Call;
    .restart local v8       #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    :try_start_2
    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->hangupActiveCall()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 7642
    .end local v8           #phone:Lcom/android/internal/telephony/Phone;
    :catch_0
    move-exception v4

    .line 7643
    .local v4, e:Ljava/lang/Exception;
    const-string v11, "internalAnswerCallForDualTalk:Exception "

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 7666
    .end local v1           #call:Lcom/android/internal/telephony/Call;
    .end local v4           #e:Ljava/lang/Exception;
    .restart local v2       #callCount:I
    .restart local v7       #list:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Call;>;"
    :cond_3
    :try_start_3
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v11}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/phone/InCallScreen;->handleAnswerAndEnd(Lcom/android/internal/telephony/Call;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 7767
    :catch_1
    move-exception v4

    .line 7768
    .restart local v4       #e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 7669
    .end local v4           #e:Ljava/lang/Exception;
    :cond_4
    if-ne v2, v12, :cond_c

    .line 7671
    :try_start_4
    const-string v11, "internalAnswerCallForDualTalk: has two calls exist."

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7673
    const/4 v11, 0x0

    invoke-interface {v7, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/internal/telephony/Call;

    invoke-virtual {v11}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v12

    const/4 v11, 0x1

    invoke-interface {v7, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/internal/telephony/Call;

    invoke-virtual {v11}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v11

    if-ne v12, v11, :cond_5

    .line 7675
    const-string v11, "internalAnswerCallForDualTalk: two calls exist in the same phone."

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7677
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v11}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/android/phone/InCallScreen;->handleAnswerAndEnd(Lcom/android/internal/telephony/Call;)V

    goto :goto_1

    .line 7681
    :cond_5
    const-string v11, "internalAnswerCallForDualTalk: two calls exist in diffrent phone."

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7683
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->hasActiveOrHoldBothCdmaAndGsm()Z

    move-result v11

    if-eqz v11, :cond_8

    .line 7686
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->getActiveGsmPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    .line 7687
    .local v5, gsmPhone:Lcom/android/internal/telephony/Phone;
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v11}, Lcom/mediatek/phone/DualTalkUtils;->getActiveCdmaPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    .line 7689
    .local v3, cdmaPhone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 7690
    .local v0, cCall:Lcom/android/internal/telephony/Call;
    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->hasMultipleConnections(Lcom/android/internal/telephony/Call;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 7691
    const-string v11, "internalAnswerCallForDualTalk: cdma has multiple connections, disconneted it!"

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7692
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->hangup()V

    .line 7693
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto :goto_1

    .line 7696
    :cond_6
    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 7698
    invoke-virtual {v9}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/internal/telephony/Phone;->acceptCall()V

    .line 7700
    const-string v11, "internalAnswerCallForDualTalk: cdma hold + gsm active + gsm ringing"

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 7705
    :cond_7
    const-string v11, "internalAnswerCallForDualTalk: cdma active + gsm holding + cdma ringing/gsm ringing"

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7707
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto/16 :goto_1

    .line 7711
    .end local v0           #cCall:Lcom/android/internal/telephony/Call;
    .end local v3           #cdmaPhone:Lcom/android/internal/telephony/Phone;
    .end local v5           #gsmPhone:Lcom/android/internal/telephony/Phone;
    :cond_8
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :cond_9
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Call;

    .line 7712
    .restart local v1       #call:Lcom/android/internal/telephony/Call;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v10

    .line 7713
    .local v10, state:Lcom/android/internal/telephony/Call$State;
    sget-object v11, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v10, v11, :cond_b

    .line 7714
    invoke-virtual {v9}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v11

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v12

    if-eq v11, v12, :cond_a

    .line 7715
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V

    .line 7717
    :cond_a
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto/16 :goto_1

    .line 7719
    :cond_b
    sget-object v11, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v10, v11, :cond_9

    .line 7721
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto :goto_2

    .line 7726
    .end local v1           #call:Lcom/android/internal/telephony/Call;
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v10           #state:Lcom/android/internal/telephony/Call$State;
    :cond_c
    if-ne v2, v13, :cond_13

    .line 7728
    const-string v11, "internalAnswerCallForDualTalk: there is one call exist."

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7730
    const/4 v11, 0x0

    invoke-interface {v7, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Call;

    .line 7732
    .restart local v1       #call:Lcom/android/internal/telephony/Call;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v11

    if-ne v11, v12, :cond_d

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->hasMultipleConnections(Lcom/android/internal/telephony/Call;)Z

    move-result v11

    if-eqz v11, :cond_d

    .line 7735
    const-string v11, "internalAnswerCallForDualTalk: hangup the cdma multiple call and answer the gsm call!"

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7736
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->hangup()V

    .line 7737
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto/16 :goto_1

    .line 7739
    :cond_d
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v11

    invoke-virtual {v9}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v12

    if-ne v11, v12, :cond_e

    .line 7740
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto/16 :goto_1

    .line 7741
    :cond_e
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v11

    sget-object v12, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v11, v12, :cond_12

    .line 7742
    invoke-static {v1}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v11

    if-nez v11, :cond_f

    invoke-static {v9}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v11

    if-eqz v11, :cond_10

    .line 7744
    :cond_f
    const-string v11, "internalAnswerCallForDualTalk: there is one video call, hangup current call!"

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7746
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v8

    .line 7747
    .restart local v8       #phone:Lcom/android/internal/telephony/Phone;
    instance-of v11, v8, Lcom/android/internal/telephony/sip/SipPhone;

    if-eqz v11, :cond_11

    .line 7748
    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->hangup()V

    .line 7756
    .end local v8           #phone:Lcom/android/internal/telephony/Phone;
    :cond_10
    :goto_3
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto/16 :goto_1

    .line 7750
    .restart local v8       #phone:Lcom/android/internal/telephony/Phone;
    :cond_11
    invoke-interface {v8}, Lcom/android/internal/telephony/Phone;->hangupActiveCall()V

    goto :goto_3

    .line 7758
    .end local v8           #phone:Lcom/android/internal/telephony/Phone;
    :cond_12
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto/16 :goto_1

    .line 7760
    .end local v1           #call:Lcom/android/internal/telephony/Call;
    :cond_13
    if-nez v2, :cond_1

    .line 7762
    const-string v11, "internalAnswerCallForDualTalk: there is no call exist."

    invoke-direct {p0, v11}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7764
    iget-object v11, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {p0, v11}, Lcom/android/phone/InCallScreen;->handleVideoAndVoiceIncoming(Lcom/mediatek/phone/DualTalkUtils;)V

    .line 7765
    invoke-static {v9}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_1
.end method

.method public internalHangupAll()V
    .locals 1

    .prologue
    .line 5717
    const-string v0, "internalHangupAll()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5719
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v0}, Lcom/mediatek/phone/gemini/GeminiUtils;->hangupAll(Lcom/android/internal/telephony/Phone;)V

    .line 5720
    return-void
.end method

.method internalHangupAllCalls(Lcom/android/internal/telephony/CallManager;)V
    .locals 9
    .parameter "cm"

    .prologue
    .line 7100
    const-string v6, "internalHangupAllCalls"

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7101
    invoke-virtual {p1}, Lcom/android/internal/telephony/CallManager;->getAllPhones()Ljava/util/List;

    move-result-object v5

    .line 7103
    .local v5, phones:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Phone;>;"
    :try_start_0
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/Phone;

    .line 7104
    .local v4, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    .line 7105
    .local v2, fg:Lcom/android/internal/telephony/Call;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 7106
    .local v0, bg:Lcom/android/internal/telephony/Call;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    sget-object v7, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v6, v7, :cond_6

    .line 7107
    instance-of v6, v4, Lcom/android/internal/telephony/sip/SipPhone;

    if-nez v6, :cond_4

    .line 7108
    const-string v6, "InCallScreen"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "   "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 7109
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v6

    if-eqz v6, :cond_2

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 7110
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->hangupAll()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 7129
    .end local v0           #bg:Lcom/android/internal/telephony/Call;
    .end local v2           #fg:Lcom/android/internal/telephony/Call;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #phone:Lcom/android/internal/telephony/Phone;
    :catch_0
    move-exception v1

    .line 7130
    .local v1, e:Ljava/lang/Exception;
    const-string v6, "InCallScreen"

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 7132
    .end local v1           #e:Ljava/lang/Exception;
    :cond_1
    return-void

    .line 7111
    .restart local v0       #bg:Lcom/android/internal/telephony/Call;
    .restart local v2       #fg:Lcom/android/internal/telephony/Call;
    .restart local v3       #i$:Ljava/util/Iterator;
    .restart local v4       #phone:Lcom/android/internal/telephony/Phone;
    :cond_2
    if-eqz v2, :cond_3

    :try_start_1
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 7112
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->hangup()V

    goto :goto_0

    .line 7113
    :cond_3
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 7114
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->hangup()V

    goto/16 :goto_0

    .line 7117
    :cond_4
    const-string v6, "InCallScreen"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "   "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 7118
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 7119
    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->hangup()V

    .line 7121
    :cond_5
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 7122
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->hangup()V

    goto/16 :goto_0

    .line 7126
    :cond_6
    const-string v6, "InCallScreen"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Phone is idle  "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "   "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method isBluetoothAudioConnected()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 6549
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-nez v3, :cond_1

    .line 6550
    const-string v3, "isBluetoothAudioConnected: ==> FALSE (null mBluetoothHeadset)"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6561
    :cond_0
    :goto_0
    return v2

    .line 6553
    :cond_1
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothHeadset;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    .line 6555
    .local v1, deviceList:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 6558
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 6559
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothHeadset;->isAudioConnected(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v2

    .line 6560
    .local v2, isAudioOn:Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isBluetoothAudioConnected: ==> isAudioOn = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method isBluetoothAudioConnectedOrPending()Z
    .locals 8

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 6575
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 6576
    const-string v3, "isBluetoothAudioConnectedOrPending: ==> TRUE (really connected)"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6599
    :goto_0
    return v2

    .line 6583
    :cond_0
    iget-boolean v4, p0, Lcom/android/phone/InCallScreen;->mBluetoothConnectionPending:Z

    if-eqz v4, :cond_2

    .line 6584
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/phone/InCallScreen;->mBluetoothConnectionRequestTime:J

    sub-long v0, v4, v6

    .line 6586
    .local v0, timeSinceRequest:J
    const-wide/16 v4, 0x1388

    cmp-long v4, v0, v4

    if-gez v4, :cond_1

    .line 6587
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isBluetoothAudioConnectedOrPending: ==> TRUE (requested "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " msec ago)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 6591
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isBluetoothAudioConnectedOrPending: ==> FALSE (request too old: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " msec ago)"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6593
    iput-boolean v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothConnectionPending:Z

    move v2, v3

    .line 6594
    goto :goto_0

    .line 6598
    .end local v0           #timeSinceRequest:J
    :cond_2
    const-string v2, "isBluetoothAudioConnectedOrPending: ==> FALSE"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    move v2, v3

    .line 6599
    goto :goto_0
.end method

.method public isBluetoothAvailable()Z
    .locals 5

    .prologue
    .line 6509
    const-string v3, "isBluetoothAvailable()..."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6526
    const/4 v2, 0x0

    .line 6527
    .local v2, isConnected:Z
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v3, :cond_0

    .line 6528
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothHeadset;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    .line 6530
    .local v1, deviceList:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 6531
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 6532
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    const/4 v2, 0x1

    .line 6534
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  - headset state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v4, v0}, Landroid/bluetooth/BluetoothHeadset;->getConnectionState(Landroid/bluetooth/BluetoothDevice;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6536
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  - headset address: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6537
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  - isConnected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6541
    .end local v0           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v1           #deviceList:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  ==> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6542
    return v2
.end method

.method isDialerOpened()Z
    .locals 1

    .prologue
    .line 6125
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isForegroundActivity()Z
    .locals 1

    .prologue
    .line 1701
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    return v0
.end method

.method isForegroundActivityForProximity()Z
    .locals 1

    .prologue
    .line 1711
    iget-boolean v0, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivityForProximity:Z

    return v0
.end method

.method isKeyEventAcceptableDTMF(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 2362
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, p1}, Lcom/android/phone/DTMFTwelveKeyDialer;->isKeyEventAcceptable(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isManageConferenceMode()Z
    .locals 2

    .prologue
    .line 6023
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->MANAGE_CONFERENCE:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isNeedToUpdateInCallNotification()Z
    .locals 9

    .prologue
    const/4 v6, 0x1

    .line 8143
    const/4 v5, 0x0

    .line 8144
    .local v5, result:Z
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "activity"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 8145
    .local v0, am:Landroid/app/ActivityManager;
    invoke-virtual {v0, v6}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v3

    .line 8146
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningTaskInfo;

    .line 8147
    .local v2, info:Landroid/app/ActivityManager$RunningTaskInfo;
    iget-object v7, v2, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    invoke-virtual {v7}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    .line 8149
    .local v4, name:Ljava/lang/String;
    const-string v7, "start dump"

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8150
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "info.baseActivity.getPackageName() "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v2, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8151
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "info.topActivity.getClassName() "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8152
    const-string v7, "stop dump"

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8155
    const-string v7, "com.android.phone.InCallScreen"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 8156
    const/4 v5, 0x1

    .line 8161
    .end local v2           #info:Landroid/app/ActivityManager$RunningTaskInfo;
    .end local v4           #name:Ljava/lang/String;
    :cond_1
    if-nez v5, :cond_2

    :goto_0
    return v6

    :cond_2
    const/4 v6, 0x0

    goto :goto_0
.end method

.method public isOtaCallInActiveState()Z
    .locals 2

    .prologue
    .line 6695
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v0, v0, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v1, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_ACTIVATION:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-ne v0, v1, :cond_1

    .line 6699
    :cond_0
    const/4 v0, 0x1

    .line 6701
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOtaCallInEndState()Z
    .locals 2

    .prologue
    .line 6725
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPhoneStateRestricted()Z
    .locals 12

    .prologue
    const/4 v11, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    .line 6444
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 6445
    const/4 v4, 0x0

    .line 6446
    .local v4, is_ecc_only:Z
    const/4 v5, 0x0

    .line 6448
    .local v5, is_out_of_service:Z
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 6449
    .local v1, geminiSlots:[I
    move-object v0, v1

    .local v0, arr$:[I
    array-length v6, v0

    .local v6, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v6, :cond_2

    aget v2, v0, v3

    .line 6450
    .local v2, gs:I
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v8, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v8, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getServiceStateGemini(I)Landroid/telephony/ServiceState;

    move-result-object v8

    invoke-virtual {v8}, Landroid/telephony/ServiceState;->getState()I

    move-result v7

    .line 6451
    .local v7, serviceState:I
    if-ne v7, v11, :cond_0

    .line 6452
    const/4 v4, 0x1

    .line 6454
    :cond_0
    if-ne v7, v10, :cond_1

    .line 6455
    const/4 v5, 0x1

    .line 6457
    :cond_1
    if-eqz v4, :cond_4

    if-eqz v5, :cond_4

    .line 6462
    .end local v2           #gs:I
    .end local v7           #serviceState:I
    :cond_2
    if-nez v4, :cond_3

    if-nez v5, :cond_3

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->getKeyguardManager()Landroid/app/KeyguardManager;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v8

    if-eqz v8, :cond_5

    :cond_3
    move v8, v10

    .line 6467
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v3           #i$:I
    .end local v4           #is_ecc_only:Z
    .end local v5           #is_out_of_service:Z
    .end local v6           #len$:I
    :goto_1
    return v8

    .line 6449
    .restart local v0       #arr$:[I
    .restart local v1       #geminiSlots:[I
    .restart local v2       #gs:I
    .restart local v3       #i$:I
    .restart local v4       #is_ecc_only:Z
    .restart local v5       #is_out_of_service:Z
    .restart local v6       #len$:I
    .restart local v7       #serviceState:I
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .end local v2           #gs:I
    .end local v7           #serviceState:I
    :cond_5
    move v8, v9

    .line 6462
    goto :goto_1

    .line 6466
    .end local v0           #arr$:[I
    .end local v1           #geminiSlots:[I
    .end local v3           #i$:I
    .end local v4           #is_ecc_only:Z
    .end local v5           #is_out_of_service:Z
    .end local v6           #len$:I
    :cond_6
    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getServiceState()I

    move-result v7

    .line 6467
    .restart local v7       #serviceState:I
    if-eq v7, v11, :cond_7

    if-eq v7, v10, :cond_7

    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->getKeyguardManager()Landroid/app/KeyguardManager;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v8

    if-eqz v8, :cond_8

    :cond_7
    move v9, v10

    :cond_8
    move v8, v9

    goto :goto_1
.end method

.method public isPhoneStateRestricted(I)Z
    .locals 7
    .parameter "simId"

    .prologue
    const/4 v6, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 6473
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 6474
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v2, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getServiceStateGemini(I)Landroid/telephony/ServiceState;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getState()I

    move-result v1

    .line 6476
    .local v1, serviceStateGemini:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "isPhoneStateRestricted - sim : "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, " state: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6478
    if-eq v1, v6, :cond_0

    if-eq v1, v4, :cond_0

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/phone/PhoneGlobals;->getKeyguardManager()Landroid/app/KeyguardManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v2, v4

    .line 6483
    .end local v1           #serviceStateGemini:I
    :goto_0
    return v2

    .restart local v1       #serviceStateGemini:I
    :cond_1
    move v2, v3

    .line 6478
    goto :goto_0

    .line 6482
    .end local v1           #serviceStateGemini:I
    :cond_2
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getServiceState()I

    move-result v0

    .line 6483
    .local v0, serviceState:I
    if-eq v0, v6, :cond_3

    if-eq v0, v4, :cond_3

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/phone/PhoneGlobals;->getKeyguardManager()Landroid/app/KeyguardManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    move v3, v4

    :cond_4
    move v2, v3

    goto :goto_0
.end method

.method public isQuickResponseDialogShowing()Z
    .locals 1

    .prologue
    .line 8138
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v0}, Lcom/android/phone/RespondViaSmsManager;->isShowingPopup()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isVTInCallScreenOn()Z
    .locals 1

    .prologue
    .line 8354
    const/4 v0, 0x0

    return v0
.end method

.method mLocaleChangeReceiverOnlyForTest()Landroid/content/BroadcastReceiver;
    .locals 1

    .prologue
    .line 6334
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mLocaleChangeReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method okToDialDTMFTones()Z
    .locals 9

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 6198
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v3

    .line 6199
    .local v3, hasRingingCall:Z
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    .line 6200
    .local v2, fgCallState:Lcom/android/internal/telephony/Call$State;
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    .line 6211
    .local v0, bgCallState:Lcom/android/internal/telephony/Call$State;
    iget-object v7, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v7, v7, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v7, v7, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v8, Lcom/android/phone/InCallUiState$InCallScreenMode;->MANAGE_CONFERENCE:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v7, v8, :cond_2

    move v4, v5

    .line 6212
    .local v4, noConference:Z
    :goto_0
    sget-object v7, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-eq v2, v7, :cond_0

    sget-object v7, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-eq v2, v7, :cond_0

    sget-object v7, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v7, :cond_3

    :cond_0
    if-nez v3, :cond_3

    if-eqz v4, :cond_3

    move v1, v5

    .line 6217
    .local v1, canDial:Z
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[okToDialDTMFTones] foreground state: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", background state: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", ringing state: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", call screen mode: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v8, v8, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", result: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6223
    if-eqz v1, :cond_4

    :cond_1
    :goto_2
    return v5

    .end local v1           #canDial:Z
    .end local v4           #noConference:Z
    :cond_2
    move v4, v6

    .line 6211
    goto :goto_0

    .restart local v4       #noConference:Z
    :cond_3
    move v1, v6

    .line 6212
    goto :goto_1

    .line 6223
    .restart local v1       #canDial:Z
    :cond_4
    iget-boolean v7, p0, Lcom/android/phone/InCallScreen;->mSpeechEnabled:Z

    if-eqz v7, :cond_5

    if-eqz v4, :cond_5

    if-eqz v3, :cond_1

    :cond_5
    move v5, v6

    goto :goto_2
.end method

.method okToShowDialpad()Z
    .locals 2

    .prologue
    .line 6236
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    .line 6237
    .local v0, fgCallState:Lcom/android/internal/telephony/Call$State;
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->okToDialDTMFTones()Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method okToShowFTAMenu()Z
    .locals 4

    .prologue
    .line 4482
    const-string v2, "okToAcceptWaitingAndHangupActive"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4483
    const/4 v0, 0x0

    .line 4484
    .local v0, retval:Z
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 4486
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    invoke-static {v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlotNotIdle(Lcom/android/internal/telephony/Phone;)I

    move-result v1

    .line 4487
    .local v1, slot:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "slot = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4488
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 4489
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v2, v1}, Lcom/android/phone/PhoneInterfaceManager;->isTestIccCardGemini(I)Z

    move-result v0

    .line 4494
    .end local v1           #slot:I
    :cond_0
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "retval = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4495
    return v0

    .line 4492
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v2}, Lcom/android/phone/PhoneInterfaceManager;->isTestIccCard()Z

    move-result v0

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 2185
    const-string v0, "onBackPressed()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2192
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2197
    const-string v0, "BACK key while ringing: ignored"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2220
    :goto_0
    return-void

    .line 2206
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2207
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->closeDialpadInternal(Z)V

    goto :goto_0

    .line 2211
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->MANAGE_CONFERENCE:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v0, v1, :cond_2

    .line 2213
    sget-object v0, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 2214
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    goto :goto_0

    .line 2219
    :cond_2
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "view"

    .prologue
    .line 4315
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    .line 4316
    .local v2, id:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onClick(View "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4318
    sparse-switch v2, :sswitch_data_0

    .line 4347
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v3, v3, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v4, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v3, v4, :cond_0

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v3, v3, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v4, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v3, v4, :cond_2

    :cond_0
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v3, :cond_2

    .line 4350
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v3, v2}, Lcom/android/phone/OtaUtils;->onClickHandler(I)V

    .line 4362
    :goto_0
    const v4, 0x1129f

    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    instance-of v3, p1, Landroid/widget/TextView;

    if-eqz v3, :cond_3

    check-cast p1, Landroid/widget/TextView;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    :goto_1
    aput-object v3, v5, v6

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 4366
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->pokeUserActivity()V

    .line 4367
    return-void

    .line 4320
    .restart local p1
    :sswitch_0
    const-string v3, "onClick: mButtonManageConferenceDone..."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4322
    sget-object v3, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 4323
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    goto :goto_0

    .line 4327
    :sswitch_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 4328
    .local v0, currentTime:J
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mInCallControlState:Lcom/android/phone/InCallControlState;

    iget-boolean v3, v3, Lcom/android/phone/InCallControlState;->canSwap:Z

    if-eqz v3, :cond_1

    iget-wide v3, p0, Lcom/android/phone/InCallScreen;->mLastClickActionTime:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0x3e8

    cmp-long v3, v3, v5

    if-lez v3, :cond_1

    .line 4329
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSwapCalls()V

    .line 4330
    iput-wide v0, p0, Lcom/android/phone/InCallScreen;->mLastClickActionTime:J

    .line 4332
    const-string v3, "Respond the swap click action."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 4336
    :cond_1
    const-string v3, "Ignore the swap click action."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 4356
    .end local v0           #currentTime:J
    :cond_2
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onClick: unexpected click from ID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " (View = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 4362
    :cond_3
    const-string v3, ""

    goto :goto_1

    .line 4318
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0800ad -> :sswitch_0
        0x7f0800f6 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "icicle"

    .prologue
    const/4 v6, 0x1

    .line 861
    const-string v3, "InCallScreen"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onCreate()...  this = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 863
    const-class v3, Lcom/mediatek/common/telephony/IServiceStateExt;

    new-array v4, v6, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-static {v3, v4}, Lcom/mediatek/common/MediatekClassFactory;->createInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/common/telephony/IServiceStateExt;

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mServiceStateExt:Lcom/mediatek/common/telephony/IServiceStateExt;

    .line 865
    invoke-static {}, Lcom/android/phone/Profiler;->callScreenOnCreate()V

    .line 866
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 869
    sget-boolean v3, Lcom/android/phone/PhoneGlobals;->sVoiceCapable:Z

    if-nez v3, :cond_0

    .line 875
    const-string v3, "InCallScreen"

    const-string v4, "onCreate() reached on non-voice-capable device"

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 876
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->finish()V

    .line 992
    :goto_0
    return-void

    .line 880
    :cond_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    .line 881
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v3, p0}, Lcom/android/phone/PhoneGlobals;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 884
    const/high16 v1, 0x28

    .line 886
    .local v1, flags:I
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->getPhoneState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v3, v4, :cond_1

    .line 893
    const-string v3, "onCreate: set window FLAG_DISMISS_KEYGUARD flag "

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 895
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v3

    if-nez v3, :cond_1

    .line 896
    const/high16 v3, 0x40

    or-int/2addr v1, v3

    .line 900
    :cond_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 901
    .local v2, lp:Landroid/view/WindowManager$LayoutParams;
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/2addr v3, v1

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 902
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->proximitySensorModeEnabled()Z

    move-result v3

    if-nez v3, :cond_2

    .line 906
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->inputFeatures:I

    or-int/lit8 v3, v3, 0x4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->inputFeatures:I

    .line 908
    :cond_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 910
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 911
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 912
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "- onCreate: phone state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 914
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    invoke-virtual {p0, v3}, Lcom/android/phone/InCallScreen;->setPhone(Lcom/android/internal/telephony/Phone;)V

    .line 916
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 917
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v3, :cond_3

    .line 920
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    invoke-virtual {v3, p0, v4, v6}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    .line 924
    :cond_3
    invoke-virtual {p0, v6}, Lcom/android/phone/InCallScreen;->requestWindowFeature(I)Z

    .line 926
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/ext/ExtensionManager;->getInCallScreenExtension()Lcom/mediatek/phone/ext/InCallScreenExtension;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    .line 927
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p1, p0, p0, v4}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onCreate(Landroid/os/Bundle;Landroid/app/Activity;Lcom/mediatek/phone/ext/IInCallScreen;Lcom/android/internal/telephony/CallManager;)V

    .line 929
    const v3, 0x7f04001c

    invoke-virtual {p0, v3}, Lcom/android/phone/InCallScreen;->setContentView(I)V

    .line 940
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->initInCallScreen()V

    .line 942
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->initPolicyManager()V

    .line 944
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->registerForPhoneStates()V

    .line 954
    if-nez p1, :cond_4

    .line 955
    const-string v3, "onCreate(): this is our very first launch, checking intent..."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 956
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->internalResolveIntent(Landroid/content/Intent;)V

    .line 959
    :cond_4
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iget-boolean v3, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTIsInflate:Z

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    if-eqz v3, :cond_5

    .line 962
    const-string v3, "onCreate(): VTInCallScreen already inflated before destroy, inflate again"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 964
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v3}, Lcom/mediatek/phone/vt/IVTInCallScreen;->initVTInCallScreen()V

    .line 967
    :cond_5
    invoke-static {}, Lcom/android/phone/Profiler;->callScreenCreated()V

    .line 968
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mLocaleChangeReceiver:Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "android.intent.action.LOCALE_CHANGED"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3, v4}, Lcom/android/phone/InCallScreen;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 970
    new-instance v0, Landroid/content/IntentFilter;

    sget-object v3, Lcom/android/phone/InCallScreen;->ACTION_LOCKED:Ljava/lang/String;

    invoke-direct {v0, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 971
    .local v0, dmLockFilter:Landroid/content/IntentFilter;
    sget-object v3, Lcom/android/phone/InCallScreen;->ACTION_UNLOCK:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 973
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDMLockReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v0}, Lcom/android/phone/InCallScreen;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 975
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x7d

    const-wide/16 v5, 0x7d0

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 976
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3, v4}, Lcom/android/phone/InCallScreen;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 978
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->setListener(Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;)V

    .line 988
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->amendLayoutForDifferentScreen()V

    .line 991
    const-string v3, "onCreate(): exit"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 7058
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 7059
    new-instance v0, Landroid/view/MenuInflater;

    invoke-direct {v0, p0}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    .line 7060
    .local v0, inflate:Landroid/view/MenuInflater;
    const v1, 0x7f100002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 7062
    .end local v0           #inflate:Landroid/view/MenuInflater;
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method protected onDestroy()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1565
    const-string v0, "InCallScreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDestroy()...  this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1566
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1570
    iput-boolean v4, p0, Lcom/android/phone/InCallScreen;->mIsDestroyed:Z

    .line 1572
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mLocaleChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1573
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDMLockReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1575
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0, p0}, Lcom/android/phone/PhoneGlobals;->clearInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 1577
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->clearListener(Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;)V

    .line 1587
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    if-eqz v0, :cond_0

    .line 1588
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v0, v3}, Lcom/android/phone/CallCard;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 1590
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    if-eqz v0, :cond_1

    .line 1591
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    invoke-virtual {v0, v3}, Lcom/android/phone/InCallTouchUi;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 1593
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v0, v3}, Lcom/android/phone/RespondViaSmsManager;->setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V

    .line 1595
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    if-eqz v0, :cond_2

    .line 1596
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v0}, Lcom/android/phone/CallTime;->cancelTimer()V

    .line 1597
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v0, v3}, Lcom/android/phone/CallTime;->setCallTimeListener(Lcom/android/phone/CallTime$OnTickListener;)V

    .line 1600
    :cond_2
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->clearInCallScreenReference()V

    .line 1601
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    .line 1603
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->unregisterForPhoneStates()V

    .line 1607
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v0, :cond_3

    .line 1608
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v0, v4, v1}, Landroid/bluetooth/BluetoothAdapter;->closeProfileProxy(ILandroid/bluetooth/BluetoothProfile;)V

    .line 1609
    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    .line 1614
    :cond_3
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1615
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissAllDialogs()V

    .line 1622
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v0, :cond_4

    .line 1623
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v0}, Lcom/android/phone/OtaUtils;->clearUiWidgets()V

    .line 1626
    :cond_4
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {v0, p0}, Lcom/mediatek/phone/ext/InCallScreenExtension;->onDestroy(Landroid/app/Activity;)V

    .line 1627
    return-void
.end method

.method onDialerClose(Z)V
    .locals 2
    .parameter "animate"

    .prologue
    .line 6164
    const-string v0, "onDialerClose()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6173
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v0, v0, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v1, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_ACTIVATION:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-ne v0, v1, :cond_1

    .line 6178
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v0, :cond_1

    .line 6179
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v0}, Lcom/android/phone/OtaUtils;->otaShowProperScreen()V

    .line 6184
    :cond_1
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    .line 6187
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->updateCallCardVisibilityPerDialerState(Z)V

    .line 6190
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->pokeUserActivity()V

    .line 6191
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    .line 6192
    return-void
.end method

.method onDialerOpen(Z)V
    .locals 2
    .parameter "animate"

    .prologue
    .line 6133
    const-string v0, "onDialerOpen()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6136
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    .line 6139
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->updateCallCardVisibilityPerDialerState(Z)V

    .line 6142
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->pokeUserActivity()V

    .line 6147
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v1, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v0, :cond_1

    .line 6150
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v0}, Lcom/android/phone/OtaUtils;->hideOtaScreen()V

    .line 6157
    :cond_1
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 6
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v3, 0x1

    .line 2400
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onKeyDown(keycode "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2403
    sget-object v4, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v5}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v5

    if-ne v4, v5, :cond_1

    .line 2404
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v4, p1, p2}, Lcom/mediatek/phone/vt/IVTInCallScreen;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2518
    :cond_0
    :goto_0
    :sswitch_0
    return v3

    .line 2409
    :cond_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->restartLockScreenTimer()V

    .line 2411
    sparse-switch p1, :sswitch_data_0

    .line 2514
    :cond_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v4

    if-nez v4, :cond_3

    invoke-direct {p0, p1, p2}, Lcom/android/phone/InCallScreen;->handleDialerKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2518
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0

    .line 2414
    :sswitch_1
    const-string v4, "ignore KEYCODE_HOME"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 2418
    :sswitch_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v4

    if-nez v4, :cond_4

    .line 2420
    const-string v4, " onKeyDown() KEYCODE_CALL RepeatCount is 0 ..."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2422
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->handleCallKey()Z

    move-result v1

    .line 2423
    .local v1, handled:Z
    if-nez v1, :cond_0

    .line 2424
    const-string v4, "InCallScreen"

    const-string v5, "InCallScreen should always handle KEYCODE_CALL in onKeyDown"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2428
    .end local v1           #handled:Z
    :cond_4
    const-string v4, " onKeyDown() KEYCODE_CALL long press"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 2449
    :sswitch_3
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v4, v5, :cond_2

    .line 2460
    const-string v4, "InCallScreen"

    const-string v5, "VOLUME key: incoming call is ringing! (PhoneWindowManager should have handled this key.)"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2464
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->internalSilenceRinger()V

    goto :goto_0

    .line 2473
    :sswitch_4
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v4}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2475
    const-string v4, "mDialer.isOpened(): DTMFTwelveKeyDialer is opened"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2477
    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->closeDialpadInternal(Z)V

    goto :goto_0

    .line 2483
    :sswitch_5
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->onMuteClick()V

    goto :goto_0

    .line 2489
    :sswitch_6
    const-string v4, "----------- InCallScreen View dump --------------"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2491
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v2

    .line 2492
    .local v2, w:Landroid/view/Window;
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 2493
    .local v0, decorView:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->debug()V

    goto :goto_0

    .line 2499
    .end local v0           #decorView:Landroid/view/View;
    .end local v2           #w:Landroid/view/Window;
    :sswitch_7
    const-string v4, "----------- InCallScreen call state dump --------------"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2500
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->dumpCallState(Lcom/android/internal/telephony/Phone;)V

    .line 2501
    invoke-static {}, Lcom/android/phone/PhoneUtils;->dumpCallManager()V

    goto/16 :goto_0

    .line 2508
    :sswitch_8
    const-string v4, "------------ Temp testing -----------------"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2411
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_1
        0x4 -> :sswitch_4
        0x5 -> :sswitch_2
        0x18 -> :sswitch_3
        0x19 -> :sswitch_3
        0x1b -> :sswitch_0
        0x44 -> :sswitch_8
        0x46 -> :sswitch_7
        0x4c -> :sswitch_6
        0x5b -> :sswitch_5
        0xa4 -> :sswitch_3
    .end sparse-switch
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 2160
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    .line 2161
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2162
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2163
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBackgroundCall:Lcom/android/internal/telephony/Call;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mBackgroundCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2165
    :cond_1
    const-string v0, "onKeyLongPress(), hangupRingingCall"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2174
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->hangupRingingCall()V

    .line 2180
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    .line 2389
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v1, p2}, Lcom/android/phone/DTMFTwelveKeyDialer;->onDialerKeyUp(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2395
    :cond_0
    :goto_0
    return v0

    .line 2391
    :cond_1
    const/4 v1, 0x5

    if-eq p1, v1, :cond_0

    .line 2395
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "arg0"

    .prologue
    .line 7423
    invoke-virtual {p0, p1}, Lcom/android/phone/InCallScreen;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onMuteClick()V
    .locals 3

    .prologue
    .line 4458
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getMute()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 4459
    .local v0, newMuteState:Z
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onMuteClick(): newMuteState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4460
    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->setMute(Z)V

    .line 4466
    return-void

    .line 4458
    .end local v0           #newMuteState:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .parameter "intent"

    .prologue
    .line 1866
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onNewIntent: intent = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", phone state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1876
    invoke-virtual {p0, p1}, Lcom/android/phone/InCallScreen;->setIntent(Landroid/content/Intent;)V

    .line 1882
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->internalResolveIntent(Landroid/content/Intent;)V

    .line 1883
    return-void
.end method

.method public onOpenCloseDialpad()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 4648
    const-string v0, "onOpenCloseDialpad()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4649
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4650
    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->closeDialpadInternal(Z)V

    .line 4654
    :goto_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/phone/PhoneGlobals;->updateProximitySensorMode(Lcom/android/internal/telephony/PhoneConstants$State;)V

    .line 4656
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->restartLockScreenTimer()V

    .line 4658
    return-void

    .line 4652
    :cond_0
    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->openDialpadInternal(Z)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 7087
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v0}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    if-eq v0, v1, :cond_1

    .line 7088
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/InCallScreenExtension;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7089
    const/4 v0, 0x1

    .line 7094
    :goto_0
    return v0

    .line 7091
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/phone/InCallScreen;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    .line 7094
    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v0, p1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1357
    const-string v0, "onPause()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1358
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 1360
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1363
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivityForProximity:Z

    .line 1365
    :cond_0
    iput-boolean v2, p0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    .line 1368
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v0}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    .line 1371
    const-string v0, "- remove DELAY_TO_FINISH_INCALLSCREEN:"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1373
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0xcb

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1377
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iput-boolean v2, v0, Lcom/android/phone/InCallUiState;->providerInfoVisible:Z

    .line 1381
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iput-boolean v2, v0, Lcom/android/phone/InCallUiState;->showAlreadyDisconnectedState:Z

    .line 1385
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0, v2}, Lcom/android/phone/PhoneGlobals;->setBeginningCall(Z)V

    .line 1389
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mManageConferenceUtils:Lcom/android/phone/ManageConferenceUtils;

    invoke-virtual {v0}, Lcom/android/phone/ManageConferenceUtils;->stopConferenceTime()V

    .line 1393
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->onDialerKeyUp(Landroid/view/KeyEvent;)Z

    .line 1397
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->stopDialerSession()V

    .line 1399
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->cancelLockScreenTimer()V

    .line 1425
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x6c

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x93

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_2

    .line 1428
    const-string v0, "DELAYED_CLEANUP_AFTER_DISCONNECT detected, moving UI to background."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1429
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 1432
    :cond_2
    const v0, 0x1129e

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 1436
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->dismissAllDialogs()V

    .line 1448
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateExpandedViewState()V

    .line 1456
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v0, v0, Lcom/android/phone/NotificationMgr;->statusBarHelper:Lcom/android/phone/NotificationMgr$StatusBarHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/phone/NotificationMgr$StatusBarHelper;->enableSystemBarNavigation(Z)V

    .line 1465
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->updateWakeState()V

    .line 1470
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v0, v1, :cond_3

    .line 1471
    const-string v0, "InCallScreen"

    const-string v1, "----------lijian-----------on pause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1472
    invoke-virtual {p0, v2}, Lcom/android/phone/InCallScreen;->updateKeyguardPolicy(Z)V

    .line 1476
    :cond_3
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->getUpdateLock()Landroid/os/UpdateLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/UpdateLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->getPhoneState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_4

    .line 1478
    const-string v0, "Release UpdateLock on onPause() because there\'s no active phone call."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1480
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->getUpdateLock()Landroid/os/UpdateLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/UpdateLock;->release()V

    .line 1486
    :cond_4
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_5

    .line 1487
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 1491
    :cond_5
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    if-eqz v0, :cond_6

    .line 1492
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    invoke-virtual {v0}, Lcom/android/phone/InCallTouchUi;->dismissAudioModePopup()V

    .line 1494
    :cond_6
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v1, 0x0

    .line 7067
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v2}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v2

    sget-object v3, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v2, p1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7082
    :goto_0
    return v1

    .line 7071
    :cond_0
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 7072
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 7073
    invoke-interface {p1, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 7072
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 7075
    :cond_1
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    sget-object v2, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    if-eq v1, v2, :cond_3

    .line 7076
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->setupMenuItems(Landroid/view/Menu;)V

    .line 7077
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mExtension:Lcom/mediatek/phone/ext/InCallScreenExtension;

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/mediatek/phone/ext/InCallScreenExtension;->setupMenuItems(Landroid/view/Menu;Lcom/mediatek/phone/ext/IInCallControlState;)V

    .line 7082
    .end local v0           #i:I
    :cond_2
    :goto_2
    const/4 v1, 0x1

    goto :goto_0

    .line 7079
    .restart local v0       #i:I
    :cond_3
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v1, p1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->setupMenuItems(Landroid/view/Menu;)V

    goto :goto_2
.end method

.method protected onResume()V
    .locals 19

    .prologue
    .line 1029
    const-string v15, "onResume()..."

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1030
    invoke-super/range {p0 .. p0}, Landroid/app/Activity;->onResume()V

    .line 1031
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->dismissDialogs()V

    .line 1033
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->restartLockScreenTimer()V

    .line 1035
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    .line 1036
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/android/phone/InCallScreen;->mIsForegroundActivityForProximity:Z

    .line 1038
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v15

    if-eqz v15, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-nez v15, :cond_0

    .line 1039
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    .line 1043
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v15

    if-nez v15, :cond_1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v15

    if-nez v15, :cond_1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 1044
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v15, v15, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    const/16 v16, 0x0

    move/from16 v0, v16

    iput-boolean v0, v15, Lcom/android/phone/InCallUiState;->showAlreadyDisconnectedState:Z

    .line 1047
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v7, v15, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    .line 1050
    .local v7, inCallUiState:Lcom/android/phone/InCallUiState;
    sget-boolean v15, Lcom/android/phone/InCallScreen;->mLocaleChanged:Z

    if-eqz v15, :cond_3

    .line 1051
    const/4 v15, 0x0

    sput-boolean v15, Lcom/android/phone/InCallScreen;->mLocaleChanged:Z

    .line 1052
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v15}, Lcom/android/phone/CallCard;->updateForLanguageChange()V

    .line 1053
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v15}, Lcom/mediatek/phone/vt/IVTInCallScreen;->notifyLocaleChange()V

    .line 1054
    const/4 v15, 0x1

    sput-boolean v15, Lcom/android/phone/ManageConferenceUtils;->sLocalChanged:Z

    .line 1062
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->updateExpandedViewState()V

    .line 1066
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v15, v15, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v15}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    .line 1073
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v15}, Lcom/android/phone/DTMFTwelveKeyDialer;->startDialerSession()V

    .line 1078
    iget-boolean v15, v7, Lcom/android/phone/InCallUiState;->showDialpad:Z

    if-eqz v15, :cond_e

    .line 1079
    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->openDialpadInternal(Z)V

    .line 1086
    :goto_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    iget-object v0, v7, Lcom/android/phone/InCallUiState;->dialpadContextText:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lcom/android/phone/DTMFTwelveKeyDialer;->setDialpadContext(Ljava/lang/String;)V

    .line 1090
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v15

    sget-object v16, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_4

    .line 1091
    const/4 v3, 0x0

    .line 1092
    .local v3, fgCall:Lcom/android/internal/telephony/Call;
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v15

    if-eqz v15, :cond_f

    .line 1093
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v15}, Lcom/mediatek/phone/DualTalkUtils;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 1098
    :goto_1
    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v9

    .line 1099
    .local v9, info:Landroid/provider/Telephony$SIMInfo;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    .line 1100
    .local v2, connection:Lcom/android/internal/telephony/Connection;
    if-eqz v9, :cond_4

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v15

    iget v0, v9, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v17

    invoke-static/range {v15 .. v17}, Lcom/android/phone/PhoneUtils;->isVoicemailNumber(Ljava/lang/String;ILcom/android/internal/telephony/Phone;)Z

    move-result v15

    if-nez v15, :cond_4

    .line 1102
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Lcom/android/phone/DTMFTwelveKeyDialer;->setDialpadContext(Ljava/lang/String;)V

    .line 1113
    .end local v2           #connection:Lcom/android/internal/telephony/Connection;
    .end local v3           #fgCall:Lcom/android/internal/telephony/Call;
    .end local v9           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v15}, Lcom/android/phone/RespondViaSmsManager;->dismissPopup()V

    .line 1129
    const/4 v5, 0x0

    .line 1130
    .local v5, handledStartupError:Z
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    .line 1131
    invoke-virtual {v7}, Lcom/android/phone/InCallUiState;->hasPendingCallStatusCode()Z

    move-result v15

    if-eqz v15, :cond_5

    .line 1132
    const-string v15, "- onResume: need to show status indication!"

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1133
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    .line 1134
    invoke-virtual {v7}, Lcom/android/phone/InCallUiState;->getPendingCallStatusCode()Lcom/android/phone/Constants$CallStatusCode;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->showStatusIndication(Lcom/android/phone/Constants$CallStatusCode;)V

    .line 1139
    const/4 v5, 0x1

    .line 1142
    sget-object v15, Lcom/android/phone/Constants$CallStatusCode;->SUCCESS:Lcom/android/phone/Constants$CallStatusCode;

    invoke-virtual {v7, v15}, Lcom/android/phone/InCallUiState;->setPendingCallStatusCode(Lcom/android/phone/Constants$CallStatusCode;)V

    .line 1146
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v1

    .line 1148
    .local v1, bluetoothConnected:Z
    if-eqz v1, :cond_10

    .line 1149
    const/4 v15, 0x6

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/phone/InCallScreen;->setVolumeControlStream(I)V

    .line 1154
    :goto_2
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/phone/InCallScreen;->takeKeyEvents(Z)V

    .line 1157
    const/4 v8, 0x0

    .line 1158
    .local v8, inOtaCall:Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v15}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsOtasp(Lcom/android/internal/telephony/Phone;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 1159
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->checkOtaspStateOnResume()Z

    move-result v8

    .line 1161
    :cond_6
    if-nez v8, :cond_7

    .line 1163
    sget-object v15, Lcom/android/phone/InCallUiState$InCallScreenMode;->NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 1170
    :cond_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->clearDisconnected()V

    .line 1173
    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/phone/InCallScreen;->setOnAnswerAndEndFlag(Z)V

    .line 1176
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->syncWithPhoneState()Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    move-result-object v14

    .line 1181
    .local v14, status:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    sget-object v15, Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;->SUCCESS:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;

    if-eq v14, v15, :cond_13

    .line 1182
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "- onResume: syncWithPhoneState failed! status = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1190
    if-eqz v5, :cond_11

    .line 1195
    const-string v15, "InCallScreen"

    const-string v16, "  ==> syncWithPhoneState failed, but staying here anyway."

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1248
    :cond_8
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v15, v15, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    const/16 v16, 0x0

    move/from16 v0, v16

    iput-boolean v0, v15, Lcom/android/phone/InCallUiState;->delayFinished:Z

    .line 1251
    const/4 v15, -0x1

    sput v15, Lcom/android/phone/InCallUiState;->sLastInCallScreenStatus:I

    .line 1254
    const v15, 0x1129d

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 1258
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v15}, Lcom/android/phone/PhoneGlobals;->updateWakeState()V

    .line 1262
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v15}, Lcom/android/phone/PhoneGlobals;->getRestoreMuteOnInCallResume()Z

    move-result v15

    if-eqz v15, :cond_9

    .line 1264
    invoke-static {}, Lcom/android/phone/PhoneUtils;->restoreMuteState()Ljava/lang/Boolean;

    .line 1265
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/android/phone/PhoneGlobals;->setRestoreMuteOnInCallResume(Z)V

    .line 1268
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v15

    const-class v16, Lcom/android/phone/InCallScreen;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/android/phone/Profiler;->profileViewCreate(Landroid/view/Window;Ljava/lang/String;)V

    .line 1287
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v15

    if-eqz v15, :cond_17

    .line 1288
    const/4 v13, -0x1

    .line 1289
    .local v13, simid:I
    const/4 v11, -0x1

    .line 1291
    .local v11, messageid:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v4

    .line 1292
    .local v4, geminiSlots:[I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_3
    array-length v15, v4

    if-ge v6, v15, :cond_a

    .line 1293
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v15, Lcom/android/internal/telephony/gemini/GeminiPhone;

    aget v16, v4, v6

    invoke-virtual/range {v15 .. v16}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPendingMmiCodesGemini(I)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_16

    .line 1294
    aget v13, v4, v6

    .line 1295
    sget-object v15, Lcom/android/phone/PhoneGlobals;->MMI_CANCEL_GEMINI:[I

    aget v11, v15, v6

    .line 1300
    :cond_a
    const/4 v15, -0x1

    if-eq v15, v13, :cond_b

    .line 1301
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    if-nez v15, :cond_b

    .line 1302
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v15, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v15, v13}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPendingMmiCodesGemini(I)Ljava/util/List;

    move-result-object v15

    const/16 v16, 0x0

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/internal/telephony/MmiCode;

    .line 1303
    .local v12, mmiCode:Lcom/android/internal/telephony/MmiCode;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v15, v11}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v10

    .line 1304
    .local v10, message:Landroid/os/Message;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    move-object/from16 v0, p0

    invoke-static {v0, v12, v10, v15}, Lcom/android/phone/PhoneUtils;->displayMMIInitiate(Landroid/content/Context;Lcom/android/internal/telephony/MmiCode;Landroid/os/Message;Landroid/app/Dialog;)Landroid/app/Dialog;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    .line 1327
    .end local v4           #geminiSlots:[I
    .end local v6           #i:I
    .end local v10           #message:Landroid/os/Message;
    .end local v11           #messageid:I
    .end local v12           #mmiCode:Lcom/android/internal/telephony/MmiCode;
    .end local v13           #simid:I
    :cond_b
    :goto_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v15, v15, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-boolean v15, v15, Lcom/android/phone/InCallUiState;->showAlreadyDisconnectedState:Z

    if-eqz v15, :cond_c

    .line 1329
    const-string v15, "onResume(): detected \"show already disconnected state\" situation. set up DELAYED_CLEANUP_AFTER_DISCONNECT message with 2000 msec delay."

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1333
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v16, 0x6c

    invoke-virtual/range {v15 .. v16}, Landroid/os/Handler;->removeMessages(I)V

    .line 1334
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v16, 0x6c

    const-wide/16 v17, 0x7d0

    invoke-virtual/range {v15 .. v18}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1338
    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v16, 0x7d

    const-wide/16 v17, 0x7d0

    invoke-virtual/range {v15 .. v18}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1339
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->initVTAutoAnswer()V

    .line 1341
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/android/phone/InCallScreen;->mIsForegroundActivity:Z

    .line 1343
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    if-eqz v15, :cond_d

    .line 1344
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v16, 0x82

    const-wide/16 v17, 0x1f4

    invoke-virtual/range {v15 .. v18}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1347
    :cond_d
    const-string v15, "InCallScreen"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "[mtk performance result]:"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    invoke-virtual/range {v16 .. v18}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1348
    const-string v15, "onResume() done."

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1350
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->adjustProcessPriority()V

    .line 1351
    :goto_5
    return-void

    .line 1081
    .end local v1           #bluetoothConnected:Z
    .end local v5           #handledStartupError:Z
    .end local v8           #inOtaCall:Z
    .end local v14           #status:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    :cond_e
    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->closeDialpadInternal(Z)V

    goto/16 :goto_0

    .line 1095
    .restart local v3       #fgCall:Lcom/android/internal/telephony/Call;
    :cond_f
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    goto/16 :goto_1

    .line 1151
    .end local v3           #fgCall:Lcom/android/internal/telephony/Call;
    .restart local v1       #bluetoothConnected:Z
    .restart local v5       #handledStartupError:Z
    :cond_10
    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/phone/InCallScreen;->setVolumeControlStream(I)V

    goto/16 :goto_2

    .line 1210
    .restart local v8       #inOtaCall:Z
    .restart local v14       #status:Lcom/android/phone/InCallScreen$SyncWithPhoneStateStatus;
    :cond_11
    const-string v15, "InCallScreen"

    const-string v16, "  ==> syncWithPhoneState failed; bailing out!"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1211
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->dismissAllDialogs()V

    .line 1226
    invoke-static {}, Lcom/android/phone/InCallUiState;->isNormalInCallScreenState()Z

    move-result v15

    if-nez v15, :cond_12

    .line 1227
    const-string v15, "InCallScreen"

    const-string v16, "  ==> syncWithPhoneState failed; not in normal status!"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1228
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/android/phone/InCallScreen;->endInCallScreenSession(Z)V

    .line 1229
    const/4 v15, -0x1

    sput v15, Lcom/android/phone/InCallUiState;->sLastInCallScreenStatus:I

    .line 1234
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->adjustProcessPriority()V

    goto :goto_5

    .line 1231
    :cond_12
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v15, v15, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    const/16 v16, 0x1

    move/from16 v0, v16

    iput-boolean v0, v15, Lcom/android/phone/InCallUiState;->delayFinished:Z

    .line 1232
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v16, 0xcb

    const-wide/16 v17, 0x7d0

    invoke-virtual/range {v15 .. v18}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_6

    .line 1237
    :cond_13
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-static {v15}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsOtasp(Lcom/android/internal/telephony/Phone;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 1238
    iget-object v15, v7, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v16, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_NORMAL:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_14

    iget-object v15, v7, Lcom/android/phone/InCallUiState;->inCallScreenMode:Lcom/android/phone/InCallUiState$InCallScreenMode;

    sget-object v16, Lcom/android/phone/InCallUiState$InCallScreenMode;->OTA_ENDED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_8

    .line 1240
    :cond_14
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    if-eqz v15, :cond_15

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    const/16 v16, 0x8

    invoke-virtual/range {v15 .. v16}, Lcom/android/phone/CallCard;->setVisibility(I)V

    .line 1241
    :cond_15
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->updateScreen()V

    .line 1242
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/InCallScreen;->adjustProcessPriority()V

    goto/16 :goto_5

    .line 1292
    .restart local v4       #geminiSlots:[I
    .restart local v6       #i:I
    .restart local v11       #messageid:I
    .restart local v13       #simid:I
    :cond_16
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_3

    .line 1311
    .end local v4           #geminiSlots:[I
    .end local v6           #i:I
    .end local v11           #messageid:I
    .end local v13           #simid:I
    :cond_17
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v15}, Lcom/android/internal/telephony/Phone;->getPendingMmiCodes()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_b

    .line 1312
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    if-nez v15, :cond_b

    .line 1313
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v15}, Lcom/android/internal/telephony/Phone;->getPendingMmiCodes()Ljava/util/List;

    move-result-object v15

    const/16 v16, 0x0

    invoke-interface/range {v15 .. v16}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/internal/telephony/MmiCode;

    .line 1314
    .restart local v12       #mmiCode:Lcom/android/internal/telephony/MmiCode;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v16, 0x35

    invoke-static/range {v15 .. v16}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v10

    .line 1315
    .restart local v10       #message:Landroid/os/Message;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    move-object/from16 v0, p0

    invoke-static {v0, v12, v10, v15}, Lcom/android/phone/PhoneUtils;->displayMMIInitiate(Landroid/content/Context;Lcom/android/internal/telephony/MmiCode;Landroid/os/Message;Landroid/app/Dialog;)Landroid/app/Dialog;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/phone/InCallScreen;->mMmiStartedDialog:Landroid/app/Dialog;

    goto/16 :goto_4
.end method

.method public onShow(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 7603
    const-string v0, "clear mShowStatusIndication remove DELAY_TO_FINISH_INCALLSCREEN"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7605
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0xcb

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 7606
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallScreen;->mShowStatusIndication:Z

    .line 7607
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 1498
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 1507
    return-void
.end method

.method protected onStop()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1511
    const-string v1, "onStop()..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1512
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 1514
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    .line 1515
    .local v0, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onStop: state = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1517
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_2

    .line 1518
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v1}, Lcom/android/phone/RespondViaSmsManager;->isShowingPopup()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1522
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mRespondViaSmsManager:Lcom/android/phone/RespondViaSmsManager;

    invoke-virtual {v1}, Lcom/android/phone/RespondViaSmsManager;->dismissPopup()V

    .line 1528
    :cond_0
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v1, v1, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v2, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_ACTIVATION:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v1, v1, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v2, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_SUCCESS_FAILURE_DLG:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    iget-boolean v1, v1, Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;->inOtaSpcState:Z

    if-nez v1, :cond_1

    .line 1537
    const-string v1, "- onStop: calling finish() to clear activity history..."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1539
    invoke-virtual {p0, v3}, Lcom/android/phone/InCallScreen;->moveTaskToBack(Z)Z

    .line 1540
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    if-eqz v1, :cond_1

    .line 1541
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mApp:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->otaUtils:Lcom/android/phone/OtaUtils;

    invoke-virtual {v1, v3}, Lcom/android/phone/OtaUtils;->cleanOtaScreen(Z)V

    .line 1548
    :cond_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1549
    const-string v1, "Call disconnectBluetoothAudio from onStop()"

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1550
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->disconnectBluetoothAudio()V

    .line 1554
    :cond_2
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->onStop()V

    .line 1561
    return-void
.end method

.method public onStorageFull()V
    .locals 1

    .prologue
    .line 4273
    const-string v0, "onStorageFull"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4274
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->handleStorageFull(Z)V

    .line 4275
    return-void
.end method

.method onSuppCrssSuppServiceNotification(Landroid/os/AsyncResult;)V
    .locals 3
    .parameter "r"

    .prologue
    .line 2733
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/gsm/SuppCrssNotification;

    .line 2735
    .local v0, notification:Lcom/android/internal/telephony/gsm/SuppCrssNotification;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SuppCrssNotification: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2737
    iget v1, v0, Lcom/android/internal/telephony/gsm/SuppCrssNotification;->code:I

    packed-switch v1, :pswitch_data_0

    .line 2754
    :goto_0
    :pswitch_0
    return-void

    .line 2741
    :pswitch_1
    iget-object v1, v0, Lcom/android/internal/telephony/gsm/SuppCrssNotification;->number:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->doSuppCrssSuppServiceNotification(Ljava/lang/String;)V

    goto :goto_0

    .line 2745
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->doSuppCrssSuppServiceNotificationforInComing()V

    goto :goto_0

    .line 2748
    :pswitch_3
    iget-object v1, v0, Lcom/android/internal/telephony/gsm/SuppCrssNotification;->number:Ljava/lang/String;

    iget v2, v0, Lcom/android/internal/telephony/gsm/SuppCrssNotification;->type:I

    invoke-static {v1, v2}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/phone/InCallScreen;->doSuppCrssSuppServiceNotification(Ljava/lang/String;)V

    goto :goto_0

    .line 2737
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method onSuppServiceFailed(Landroid/os/AsyncResult;)V
    .locals 6
    .parameter "r"

    .prologue
    const/4 v5, 0x0

    .line 2794
    iget-object v2, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/Phone$SuppService;

    .line 2795
    .local v2, service:Lcom/android/internal/telephony/Phone$SuppService;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onSuppServiceFailed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2798
    sget-object v3, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$internal$telephony$Phone$SuppService:[I

    invoke-virtual {v2}, Lcom/android/internal/telephony/Phone$SuppService;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 2853
    const v1, 0x7f0d02da

    .line 2861
    .local v1, errorMessageResId:I
    :goto_0
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_0

    .line 2862
    const-string v3, "- DISMISSING mSuppServiceFailureDialog."

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2863
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->dismiss()V

    .line 2865
    iput-object v5, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    .line 2868
    :cond_0
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0d0192

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    .line 2872
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 2874
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mSuppServiceFailureDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 2876
    const-string v3, "ro.build.characteristics"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2878
    .local v0, ProductCharacteristic:Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v3, "tablet"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2879
    sget-object v3, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$internal$telephony$Phone$SuppService:[I

    invoke-virtual {v2}, Lcom/android/internal/telephony/Phone$SuppService;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_1

    .line 2892
    .end local v0           #ProductCharacteristic:Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 2803
    .end local v1           #errorMessageResId:I
    :pswitch_0
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getPhoneSwapStatus()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2804
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->setPhoneSwapStatus(Z)V

    .line 2807
    :cond_2
    const v1, 0x7f0d02db

    .line 2808
    .restart local v1       #errorMessageResId:I
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-eqz v3, :cond_3

    .line 2809
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v3}, Lcom/mediatek/phone/DualTalkUtils;->isCdmaAndGsmActive()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2810
    const-string v3, "onSuppServiceFailed: can\'t hold, so hangup!"

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2811
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->hangup(Lcom/android/internal/telephony/Call;)Z

    .line 2812
    const v3, 0x7f0d0080

    const/4 v4, 0x1

    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 2816
    :cond_3
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->handleSwitchFailed()V

    goto/16 :goto_0

    .line 2822
    .end local v1           #errorMessageResId:I
    :pswitch_1
    const v1, 0x7f0d02dc

    .line 2823
    .restart local v1       #errorMessageResId:I
    goto/16 :goto_0

    .line 2829
    .end local v1           #errorMessageResId:I
    :pswitch_2
    const v1, 0x7f0d02dd

    .line 2830
    .restart local v1       #errorMessageResId:I
    goto/16 :goto_0

    .line 2835
    .end local v1           #errorMessageResId:I
    :pswitch_3
    const v1, 0x7f0d02de

    .line 2836
    .restart local v1       #errorMessageResId:I
    goto/16 :goto_0

    .line 2841
    .end local v1           #errorMessageResId:I
    :pswitch_4
    const v1, 0x7f0d02df

    .line 2842
    .restart local v1       #errorMessageResId:I
    goto/16 :goto_0

    .line 2846
    .end local v1           #errorMessageResId:I
    :pswitch_5
    const v1, 0x7f0d02e0

    .line 2847
    .restart local v1       #errorMessageResId:I
    goto/16 :goto_0

    .line 2881
    .restart local v0       #ProductCharacteristic:Ljava/lang/String;
    :pswitch_6
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    if-eqz v3, :cond_1

    .line 2883
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onSuppServiceFailed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " cancelIncomingCallActionTime"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2885
    iget-object v3, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    invoke-virtual {v3}, Lcom/android/phone/InCallTouchUi;->cancelIncomingCallActionTime()V

    goto :goto_1

    .line 2798
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 2879
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method onSuppServiceNotification(Landroid/os/AsyncResult;)V
    .locals 6
    .parameter "r"

    .prologue
    const/4 v5, 0x1

    .line 2524
    iget-object v1, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;

    .line 2526
    .local v1, notification:Lcom/android/internal/telephony/gsm/SuppServiceNotification;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onSuppServiceNotification: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2529
    const/4 v0, 0x0

    .line 2531
    .local v0, msg:Ljava/lang/String;
    iget v3, v1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->notificationType:I

    if-nez v3, :cond_1

    .line 2532
    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->getSuppServiceMOStringId(Lcom/android/internal/telephony/gsm/SuppServiceNotification;)Ljava/lang/String;

    move-result-object v0

    .line 2546
    :cond_0
    :goto_0
    invoke-static {p0, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 2547
    return-void

    .line 2533
    :cond_1
    iget v3, v1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->notificationType:I

    if-ne v3, v5, :cond_0

    .line 2535
    const-string v2, ""

    .line 2536
    .local v2, str:Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->getSuppServiceMTStringId(Lcom/android/internal/telephony/gsm/SuppServiceNotification;)Ljava/lang/String;

    move-result-object v0

    .line 2538
    iget v3, v1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->type:I

    const/16 v4, 0x91

    if-ne v3, v4, :cond_2

    .line 2539
    iget-object v3, v1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->number:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, v1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->number:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    .line 2540
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " +"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->number:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2543
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onTickForCallTimeElapsed(J)V
    .locals 1
    .parameter "timeElapsed"

    .prologue
    .line 7181
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 7182
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v0, p1, p2}, Lcom/android/phone/CallCard;->updateElapsedTimeWidget(J)V

    .line 7186
    :goto_0
    return-void

    .line 7184
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v0, p1, p2}, Lcom/mediatek/phone/vt/IVTInCallScreen;->updateElapsedTime(J)V

    goto :goto_0
.end method

.method onVoiceRecordClick(Landroid/view/MenuItem;)V
    .locals 5
    .parameter "menuItem"

    .prologue
    const/4 v4, 0x1

    .line 7448
    const-string v2, "onVoiceRecordClick"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7449
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 7450
    .local v1, title:Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->okToRecordVoice()Z

    move-result v2

    if-nez v2, :cond_1

    .line 7479
    :cond_0
    :goto_0
    return-void

    .line 7453
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isExternalStorageMounted()Z

    move-result v2

    if-nez v2, :cond_2

    .line 7454
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d000c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 7457
    :cond_2
    const-wide/32 v2, 0x200000

    invoke-static {v2, v3}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(J)Z

    move-result v2

    if-nez v2, :cond_3

    .line 7458
    invoke-virtual {p0, v4}, Lcom/android/phone/InCallScreen;->handleStorageFull(Z)V

    goto :goto_0

    .line 7463
    :cond_3
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorder;->getInstance(Landroid/content/Context;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v0

    .line 7464
    .local v0, phoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    const v2, 0x7f0d0007

    invoke-virtual {p0, v2}, Lcom/android/phone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 7465
    const-string v2, "want to startRecord"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7466
    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorder;->ismFlagRecord()Z

    move-result v2

    if-nez v2, :cond_0

    .line 7467
    const-string v2, "startRecord"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7469
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->startRecord()V

    goto :goto_0

    .line 7471
    :cond_4
    const v2, 0x7f0d0008

    invoke-virtual {p0, v2}, Lcom/android/phone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7472
    const-string v2, "want to stopRecord"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7473
    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorder;->ismFlagRecord()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7474
    const-string v2, "stopRecord"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7476
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->stopRecord()V

    goto :goto_0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .parameter "hasFocus"

    .prologue
    .line 2377
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onWindowFocusChanged("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2378
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    if-eqz v0, :cond_0

    .line 2379
    const-string v0, "- onWindowFocusChanged: faking onDialerKeyUp()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2380
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->onDialerKeyUp(Landroid/view/KeyEvent;)Z

    .line 2382
    :cond_0
    return-void
.end method

.method public rejectIncomingCallByVoiceCommand()V
    .locals 1

    .prologue
    .line 8286
    const-string v0, "rejectIncomingCallByVoiceCommand"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8287
    const v0, 0x7f080009

    invoke-virtual {p0, v0}, Lcom/android/phone/InCallScreen;->handleOnscreenButtonClick(I)V

    .line 8288
    return-void
.end method

.method requestCloseOtaFailureNotice(J)V
    .locals 2
    .parameter "timeout"

    .prologue
    .line 6673
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "requestCloseOtaFailureNotice() with timeout: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6674
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x77

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 6682
    return-void
.end method

.method requestCloseSpcErrorNotice(J)V
    .locals 2
    .parameter "timeout"

    .prologue
    .line 6690
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "requestCloseSpcErrorNotice() with timeout: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6691
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x76

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 6692
    return-void
.end method

.method requestRemoveProviderInfoWithDelay()V
    .locals 4

    .prologue
    const/16 v2, 0x79

    .line 8126
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 8127
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 8128
    .local v0, msg:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x1388

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 8130
    const-string v1, "Requested to remove provider info after 5000 msec."

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8132
    return-void
.end method

.method requestUpdateBluetoothIndication()V
    .locals 2

    .prologue
    const/16 v1, 0x72

    .line 6607
    const-string v0, "requestUpdateBluetoothIndication()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6611
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6612
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 6613
    return-void
.end method

.method requestUpdateBluetoothIndication(I)V
    .locals 2
    .parameter "bluetoothHeadsetAudioState"

    .prologue
    .line 8264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "requestUpdateBluetoothIndication()... bluetoothHeadsetAudioState= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8268
    const/16 v0, 0xa

    if-ne v0, p1, :cond_0

    .line 8269
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/InCallScreen;->mBluetoothConnectionPending:Z

    .line 8272
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->requestUpdateBluetoothIndication()V

    .line 8273
    return-void
.end method

.method public requestUpdateRecordState(II)V
    .locals 2
    .parameter "state"
    .parameter "customValue"

    .prologue
    .line 4263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "phone record custom value is"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4264
    if-nez p2, :cond_1

    .line 4265
    invoke-direct {p0, p1}, Lcom/android/phone/InCallScreen;->updateVoiceCallRecordState(I)V

    .line 4270
    :cond_0
    :goto_0
    return-void

    .line 4266
    :cond_1
    const/4 v0, 0x1

    if-ne v0, p2, :cond_0

    .line 4267
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v0, p1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->updateVideoCallRecordState(I)V

    goto :goto_0
.end method

.method public requestUpdateScreen()V
    .locals 2

    .prologue
    const/16 v1, 0x7a

    .line 6412
    const-string v0, "requestUpdateScreen()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6413
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6420
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->ignoreUpdateScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 6422
    const-string v0, "ignoreUpdateScreen"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6430
    :goto_0
    return-void

    .line 6429
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method requestUpdateScreenDelay(J)V
    .locals 3
    .parameter "ms"

    .prologue
    const/16 v2, 0xcc

    .line 7867
    const-string v0, "requestUpdateScreenDelay()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7869
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x7a

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 7870
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 7877
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->ignoreUpdateScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7879
    const-string v0, "ignoreUpdateScreen"

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7887
    :goto_0
    return-void

    .line 7886
    :cond_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0
.end method

.method public resetInCallScreenMode()V
    .locals 1

    .prologue
    .line 6859
    const-string v0, "resetInCallScreenMode: setting mode to UNDEFINED..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6860
    sget-object v0, Lcom/android/phone/InCallUiState$InCallScreenMode;->UNDEFINED:Lcom/android/phone/InCallUiState$InCallScreenMode;

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->setInCallScreenMode(Lcom/android/phone/InCallUiState$InCallScreenMode;)V

    .line 6861
    return-void
.end method

.method public restartLockScreenTimer()V
    .locals 3

    .prologue
    .line 8453
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->delayTime_disableTouch:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isVTInCallScreenOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 8454
    const-string v0, "lockNow"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "in restartLockScreenTimer mForegroundCall = !!!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/android/internal/telephony/CallManager;->getInstance()Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8455
    invoke-static {}, Lcom/android/internal/telephony/CallManager;->getInstance()Lcom/android/internal/telephony/CallManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v1, :cond_0

    .line 8456
    const-string v0, "lockNow"

    const-string v1, "reset lock time"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8457
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->cancelLockScreenTimer()V

    .line 8458
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->delayStartLockScreen()V

    .line 8461
    :cond_0
    return-void
.end method

.method public setInVoiceAnswerVideoCall(Z)V
    .locals 5
    .parameter "value"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 7501
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInVoiceAnswerVideoCall() : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7503
    if-eqz p1, :cond_1

    .line 7504
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    iput-boolean v3, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVoiceAnswer:Z

    .line 7505
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    .line 7506
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVoiceAnswerPhoneNumber:Ljava/lang/String;

    .line 7507
    iput-boolean v3, p0, Lcom/android/phone/InCallScreen;->mInVoiceAnswerVideoCall:Z

    .line 7508
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    .line 7509
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 7510
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d004a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 7511
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    new-instance v2, Lcom/android/phone/InCallScreen$26;

    invoke-direct {v2, p0}, Lcom/android/phone/InCallScreen$26;-><init>(Lcom/android/phone/InCallScreen;)V

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 7517
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 7519
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerTimer:Ljava/util/Timer;

    .line 7520
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerTimer:Ljava/util/Timer;

    new-instance v2, Lcom/android/phone/InCallScreen$27;

    invoke-direct {v2, p0}, Lcom/android/phone/InCallScreen$27;-><init>(Lcom/android/phone/InCallScreen;)V

    const-wide/16 v3, 0x3a98

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 7536
    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    :cond_0
    :goto_0
    return-void

    .line 7526
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/phone/InCallScreen;->mInVoiceAnswerVideoCall:Z

    .line 7527
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_2

    .line 7528
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 7529
    iput-object v4, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerDialog:Landroid/app/ProgressDialog;

    .line 7531
    :cond_2
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerTimer:Ljava/util/Timer;

    if-eqz v1, :cond_0

    .line 7532
    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 7533
    iput-object v4, p0, Lcom/android/phone/InCallScreen;->mVTVoiceAnswerTimer:Ljava/util/Timer;

    goto :goto_0
.end method

.method public setOnAnswerAndEndFlag(Z)V
    .locals 0
    .parameter "flag"

    .prologue
    .line 5433
    iput-boolean p1, p0, Lcom/android/phone/InCallScreen;->mOnAnswerandEndCall:Z

    .line 5434
    return-void
.end method

.method setPhone(Lcom/android/internal/telephony/Phone;)V
    .locals 1
    .parameter "phone"

    .prologue
    .line 1017
    iput-object p1, p0, Lcom/android/phone/InCallScreen;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 1020
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mForegroundCall:Lcom/android/internal/telephony/Call;

    .line 1021
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mBackgroundCall:Lcom/android/internal/telephony/Call;

    .line 1022
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/InCallScreen;->mRingingCall:Lcom/android/internal/telephony/Call;

    .line 1023
    return-void
.end method

.method setSwappingCalls(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 7053
    iput-boolean p1, p0, Lcom/android/phone/InCallScreen;->mSwappingCalls:Z

    .line 7054
    return-void
.end method

.method public showGenericErrorDialog(IZ)V
    .locals 6
    .parameter "resid"
    .parameter "isStartupError"

    .prologue
    .line 5025
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 5026
    .local v3, msg:Ljava/lang/CharSequence;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "showGenericErrorDialog(\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\')..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5031
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 5033
    const-string v4, "already showing, skip..."

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 5093
    :goto_0
    return-void

    .line 5043
    :cond_0
    if-eqz p2, :cond_1

    .line 5044
    new-instance v1, Lcom/android/phone/InCallScreen$14;

    invoke-direct {v1, p0}, Lcom/android/phone/InCallScreen$14;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5048
    .local v1, clickListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Lcom/android/phone/InCallScreen$15;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$15;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5052
    .local v0, cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    new-instance v2, Lcom/android/phone/InCallScreen$16;

    invoke-direct {v2, p0}, Lcom/android/phone/InCallScreen$16;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5079
    .local v2, dismissListener:Landroid/content/DialogInterface$OnDismissListener;
    :goto_1
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f0d0192

    invoke-virtual {v4, v5, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    .line 5085
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4, v2}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 5086
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4, p0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 5089
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 5092
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mGenericErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 5058
    .end local v0           #cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    .end local v1           #clickListener:Landroid/content/DialogInterface$OnClickListener;
    .end local v2           #dismissListener:Landroid/content/DialogInterface$OnDismissListener;
    :cond_1
    new-instance v1, Lcom/android/phone/InCallScreen$17;

    invoke-direct {v1, p0}, Lcom/android/phone/InCallScreen$17;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5064
    .restart local v1       #clickListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Lcom/android/phone/InCallScreen$18;

    invoke-direct {v0, p0}, Lcom/android/phone/InCallScreen$18;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 5069
    .restart local v0       #cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    new-instance v2, Lcom/android/phone/InCallScreen$19;

    invoke-direct {v2, p0}, Lcom/android/phone/InCallScreen$19;-><init>(Lcom/android/phone/InCallScreen;)V

    .restart local v2       #dismissListener:Landroid/content/DialogInterface$OnDismissListener;
    goto :goto_1
.end method

.method public showStorageFullDialog(IZ)V
    .locals 9
    .parameter "resid"
    .parameter "isSDCardExist"

    .prologue
    .line 8032
    const-string v6, "showStorageDialog... "

    invoke-direct {p0, v6}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 8035
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    if-eqz v6, :cond_0

    .line 8036
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v6}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 8093
    :goto_0
    return-void

    .line 8040
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    .line 8043
    .local v4, msg:Ljava/lang/CharSequence;
    const/4 v5, 0x0

    .line 8044
    .local v5, oKClickListener:Landroid/content/DialogInterface$OnClickListener;
    const/4 v1, 0x0

    .line 8045
    .local v1, cancelClickListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v2, Lcom/android/phone/InCallScreen$28;

    invoke-direct {v2, p0}, Lcom/android/phone/InCallScreen$28;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 8050
    .local v2, cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    if-eqz p2, :cond_1

    .line 8051
    new-instance v5, Lcom/android/phone/InCallScreen$29;

    .end local v5           #oKClickListener:Landroid/content/DialogInterface$OnClickListener;
    invoke-direct {v5, p0}, Lcom/android/phone/InCallScreen$29;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 8066
    .restart local v5       #oKClickListener:Landroid/content/DialogInterface$OnClickListener;
    :cond_1
    new-instance v1, Lcom/android/phone/InCallScreen$30;

    .end local v1           #cancelClickListener:Landroid/content/DialogInterface$OnClickListener;
    invoke-direct {v1, p0}, Lcom/android/phone/InCallScreen$30;-><init>(Lcom/android/phone/InCallScreen;)V

    .line 8077
    .restart local v1       #cancelClickListener:Landroid/content/DialogInterface$OnClickListener;
    if-eqz p2, :cond_3

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0d0315

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 8079
    .local v0, cancelButtonText:Ljava/lang/CharSequence;
    :goto_1
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x1080027

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0d0075

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 8084
    .local v3, dialogBuilder:Landroid/app/AlertDialog$Builder;
    if-eqz p2, :cond_2

    .line 8085
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0d003a

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v3, v6, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 8089
    :cond_2
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    iput-object v6, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    .line 8090
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v6}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v6

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Landroid/view/Window;->addFlags(I)V

    .line 8091
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v6, p0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 8092
    iget-object v6, p0, Lcom/android/phone/InCallScreen;->mStorageSpaceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v6}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 8077
    .end local v0           #cancelButtonText:Ljava/lang/CharSequence;
    .end local v3           #dialogBuilder:Landroid/app/AlertDialog$Builder;
    :cond_3
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0d0192

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_1
.end method

.method public switchInCallAudio(Lcom/android/phone/InCallScreen$InCallAudioMode;)V
    .locals 4
    .parameter "newMode"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 4586
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "switchInCallAudio: new mode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4587
    sget-object v0, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$phone$InCallScreen$InCallAudioMode:[I

    invoke-virtual {p1}, Lcom/android/phone/InCallScreen$InCallAudioMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 4627
    const-string v0, "InCallScreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "switchInCallAudio: unexpected mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 4634
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v0}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    if-eq v0, v1, :cond_4

    .line 4635
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    .line 4639
    :goto_1
    return-void

    .line 4589
    :pswitch_0
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->isSpeakerOn(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4591
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4592
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->disconnectBluetoothAudio()V

    .line 4594
    :cond_1
    invoke-static {p0, v2, v2}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    goto :goto_0

    .line 4600
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4608
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->isSpeakerOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4609
    invoke-static {p0, v3, v2}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 4611
    :cond_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->connectBluetoothAudio()V

    goto :goto_0

    .line 4618
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4619
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->disconnectBluetoothAudio()V

    .line 4621
    :cond_3
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->isSpeakerOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4622
    invoke-static {p0, v3, v2}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    goto :goto_0

    .line 4637
    :cond_4
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/mediatek/phone/vt/IVTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_1

    .line 4587
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public toggleBluetooth()V
    .locals 2

    .prologue
    .line 4536
    const-string v0, "toggleBluetooth()..."

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4538
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4540
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4541
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->disconnectBluetoothAudio()V

    .line 4570
    :goto_0
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    .line 4571
    return-void

    .line 4555
    :cond_0
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->isSpeakerOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4556
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 4559
    :cond_1
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->connectBluetoothAudio()V

    goto :goto_0

    .line 4564
    :cond_2
    const-string v0, "InCallScreen"

    const-string v1, "toggleBluetooth(): bluetooth is unavailable"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public toggleSpeaker()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 4435
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->isSpeakerOn(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    .line 4436
    .local v0, newSpeakerState:Z
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "toggleSpeaker(): newSpeakerState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 4438
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->isBluetoothAudioConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 4439
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->disconnectBluetoothAudio()V

    .line 4441
    :cond_0
    invoke-static {p0, v0, v1}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 4446
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->updateInCallTouchUi()V

    .line 4452
    return-void

    .line 4435
    .end local v0           #newSpeakerState:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public triggerTimerStartCount(Lcom/android/internal/telephony/Call;)V
    .locals 1
    .parameter "call"

    .prologue
    .line 7575
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v0, p1}, Lcom/android/phone/CallTime;->setActiveCallMode(Lcom/android/internal/telephony/Call;)V

    .line 7576
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v0}, Lcom/android/phone/CallTime;->reset()V

    .line 7577
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v0}, Lcom/android/phone/CallTime;->periodicUpdateTimer()V

    .line 7578
    return-void
.end method

.method tryToRestoreSlidingTab()V
    .locals 7

    .prologue
    .line 2760
    const-string v4, "tryToRestoreSlidingTab"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2762
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 2763
    .local v1, fgCall:Lcom/android/internal/telephony/Call;
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 2764
    .local v0, bgCall:Lcom/android/internal/telephony/Call;
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 2765
    .local v3, ringingCall:Lcom/android/internal/telephony/Call;
    if-eqz v1, :cond_0

    .line 2766
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fgCall : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2768
    :cond_0
    if-eqz v0, :cond_1

    .line 2769
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bgCall : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2771
    :cond_1
    if-eqz v3, :cond_2

    .line 2772
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ringingCall : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2775
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mInCallTouchUi visibility = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/phone/InCallScreen;->mInCallTouchUi:Lcom/android/phone/InCallTouchUi;

    invoke-virtual {v5}, Lcom/android/phone/InCallTouchUi;->getVisibility()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2777
    if-eqz v1, :cond_3

    if-eqz v0, :cond_3

    if-eqz v3, :cond_3

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v4, v5, :cond_3

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_3

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->WAITING:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v5, :cond_3

    .line 2782
    const-string v4, "send FAKE_INCOMING_CALL_WIDGET message"

    invoke-direct {p0, v4}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 2784
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/16 v5, 0xa0

    invoke-virtual {v4, v5}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 2785
    .local v2, message:Landroid/os/Message;
    iget-object v4, p0, Lcom/android/phone/InCallScreen;->mHandler:Landroid/os/Handler;

    const-wide/16 v5, 0x258

    invoke-virtual {v4, v2, v5, v6}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 2787
    .end local v2           #message:Landroid/os/Message;
    :cond_3
    return-void
.end method

.method updateAfterRadioTechnologyChange()V
    .locals 2

    .prologue
    .line 1846
    const-string v0, "InCallScreen"

    const-string v1, "updateAfterRadioTechnologyChange()..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1850
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->resetInCallScreenMode()V

    .line 1853
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->unregisterForPhoneStates()V

    .line 1856
    invoke-direct {p0}, Lcom/android/phone/InCallScreen;->registerForPhoneStates()V

    .line 1861
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    .line 1862
    return-void
.end method

.method updateButtonStateOutsideInCallTouchUi()V
    .locals 2

    .prologue
    .line 6901
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    if-eqz v0, :cond_0

    .line 6902
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mInCallControlState:Lcom/android/phone/InCallControlState;

    iget-boolean v1, v1, Lcom/android/phone/InCallControlState;->canSwap:Z

    invoke-virtual {v0, v1}, Lcom/android/phone/CallCard;->setSecondaryCallClickable(Z)V

    .line 6904
    :cond_0
    return-void
.end method

.method public updateCallTime()V
    .locals 6

    .prologue
    .line 7190
    const-string v2, "updateCallTime()..."

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7193
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 7194
    .local v0, fgCall:Lcom/android/internal/telephony/Call;
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 7195
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 7198
    :cond_0
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    .line 7199
    .local v1, state:Lcom/android/internal/telephony/Call$State;
    sget-object v2, Lcom/android/phone/InCallScreen$33;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 7233
    const-string v2, "InCallScreen"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateCallTime: unexpected call state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 7236
    :cond_1
    :goto_0
    return-void

    .line 7204
    :pswitch_0
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-object v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTConnectionStarttime:Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;

    iget-wide v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;->mStarttime:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    .line 7206
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 7207
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mVTInCallScreen:Lcom/mediatek/phone/vt/IVTInCallScreen;

    invoke-interface {v2}, Lcom/mediatek/phone/vt/IVTInCallScreen;->onReceiveVTManagerStartCounter()V

    goto :goto_0

    .line 7214
    :cond_2
    :pswitch_1
    const-string v2, "updateCallTime: start periodicUpdateTimer"

    invoke-direct {p0, v2}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 7216
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v2, v0}, Lcom/android/phone/CallTime;->setActiveCallMode(Lcom/android/internal/telephony/Call;)V

    .line 7217
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v2}, Lcom/android/phone/CallTime;->reset()V

    .line 7218
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v2}, Lcom/android/phone/CallTime;->periodicUpdateTimer()V

    goto :goto_0

    .line 7229
    :pswitch_2
    iget-object v2, p0, Lcom/android/phone/InCallScreen;->mCallTime:Lcom/android/phone/CallTime;

    invoke-virtual {v2}, Lcom/android/phone/CallTime;->cancelTimer()V

    goto :goto_0

    .line 7199
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method updateIncomingCallWidgetHint(II)V
    .locals 2
    .parameter "hintTextResId"
    .parameter "hintColorResId"

    .prologue
    .line 6873
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateIncomingCallWidgetHint("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 6874
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    if-eqz v0, :cond_0

    .line 6875
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    invoke-virtual {v0, p1, p2}, Lcom/android/phone/CallCard;->setIncomingCallWidgetHint(II)V

    .line 6876
    iget-object v0, p0, Lcom/android/phone/InCallScreen;->mCallCard:Lcom/android/phone/CallCard;

    iget-object v1, p0, Lcom/android/phone/InCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0, v1}, Lcom/android/phone/CallCard;->updateState(Lcom/android/internal/telephony/CallManager;)V

    .line 6886
    :cond_0
    return-void
.end method

.method updateKeyguardPolicy(Z)V
    .locals 3
    .parameter "dismissKeyguard"

    .prologue
    const/high16 v2, 0x40

    .line 1716
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "incallscreen: updateKeyguardPolicy() ,dismissKeyguard: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1718
    if-eqz p1, :cond_0

    .line 1720
    const-string v0, "updateKeyguardPolicy: set dismiss keyguard window flag "

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1722
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    .line 1729
    :goto_0
    return-void

    .line 1725
    :cond_0
    const-string v0, "updateKeyguardPolicy: clear dismiss keyguard window flag "

    invoke-direct {p0, v0}, Lcom/android/phone/InCallScreen;->log(Ljava/lang/String;)V

    .line 1727
    invoke-virtual {p0}, Lcom/android/phone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0
.end method
