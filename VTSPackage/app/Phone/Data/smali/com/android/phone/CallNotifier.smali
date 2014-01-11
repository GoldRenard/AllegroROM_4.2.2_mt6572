.class public Lcom/android/phone/CallNotifier;
.super Landroid/os/Handler;
.source "CallNotifier.java"

# interfaces
.implements Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;,
        Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;,
        Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;,
        Lcom/android/phone/CallNotifier$InCallTonePlayer;,
        Lcom/android/phone/CallNotifier$CustomInfo;
    }
.end annotation


# static fields
.field private static final CALLERINFO_QUERYING:I = -0x1

.field private static final CALLERINFO_QUERY_READY:I = 0x0

.field private static final CALLWAITING_ADDCALL_DISABLE_TIME:I = 0x7530

.field private static final CALLWAITING_ADDCALL_DISABLE_TIMEOUT:I = 0x17

.field private static final CALLWAITING_CALLERINFO_DISPLAY_DONE:I = 0x16

.field private static final CALLWAITING_CALLERINFO_DISPLAY_TIME:I = 0x4e20

.field private static final CALL_DURATION_THRESHOLD_FOR_CALL_HISTORY:I = 0x2710

.field public static final CALL_TYPE_NONE:I = 0x0

.field public static final CALL_TYPE_SIP:I = -0x2

.field private static final CDMA_CALL_WAITING_REJECT:I = 0x1a

.field private static final DBG:Z = true

.field private static final DISPLAYINFO_NOTIFICATION_DONE:I = 0x18

.field private static final DISPLAYINFO_NOTIFICATION_TIME:I = 0x7d0

.field private static final DISPLAY_BUSY_MESSAGE:I = 0x32

.field private static final EMERGENCY_TONE_ALERT:I = 0x1

.field private static final EMERGENCY_TONE_OFF:I = 0x0

.field private static final EMERGENCY_TONE_VIBRATE:I = 0x2

.field private static final EVENT_OTA_PROVISION_CHANGE:I = 0x19

.field private static final EVENT_SIMINFO_CHANGED:I = 0x7d1

.field private static final FAKE_SIP_PHONE_INCOMING_RING:I = 0x2a

.field private static final FAKE_SIP_PHONE_INCOMING_RING_DELAY:I = 0x7d0

.field private static final LOG_TAG:Ljava/lang/String; = "CallNotifier"

.field private static final PHONE_CDMA_CALL_WAITING:I = 0x8

.field private static final PHONE_DISCONNECT:I = 0x3

.field private static final PHONE_DISCONNECT2:I = 0x67

.field private static final PHONE_DISCONNECT3:I = 0xcb

.field private static final PHONE_DISCONNECT4:I = 0x12f

.field private static final PHONE_DISCONNECT_GEMINI:[I = null

.field private static final PHONE_ENHANCED_VP_OFF:I = 0xa

.field private static final PHONE_ENHANCED_VP_ON:I = 0x9

.field private static final PHONE_INCOMING_RING:I = 0x5

.field private static final PHONE_MWI_CHANGED:I = 0x15

.field private static final PHONE_MWI_CHANGED2:I = 0x79

.field private static final PHONE_MWI_CHANGED3:I = 0xdd

.field private static final PHONE_MWI_CHANGED4:I = 0x141

.field private static final PHONE_MWI_CHANGED_GEMINI:[I = null

.field private static final PHONE_NEW_RINGING_CONNECTION:I = 0x2

.field private static final PHONE_RESEND_MUTE:I = 0xc

.field private static final PHONE_RINGBACK_TONE:I = 0xb

.field private static final PHONE_STATE_CHANGED:I = 0x1

.field private static final PHONE_STATE_DISPLAYINFO:I = 0x6

.field private static final PHONE_STATE_LISTENER_EVENT:I = 0xd

.field private static final PHONE_STATE_SIGNALINFO:I = 0x7

.field private static final PHONE_UNKNOWN_CONNECTION_APPEARED:I = 0x4

.field private static final PHONE_VT_RING_INFO:I = 0xd

.field private static final PHONE_WAITING_DISCONNECT:I = 0xf

.field private static final PHONE_WAITING_DISCONNECT_STOP_TONE_PLAYER:I = 0x12

.field private static final RINGER_CUSTOM_RINGTONE_QUERY_TIMEOUT:I = 0x64

.field private static final RINGTONE_QUERY_WAIT_TIME:I = 0x1f4

.field private static final TONE_RELATIVE_VOLUME_SIGNALINFO:I = 0x50

.field private static final UPDATE_IN_CALL_NOTIFICATION:I = 0x1b

.field private static final VDBG:Z = true

.field public static mIsWaitingQueryComplete:Z

.field private static sInstance:Lcom/android/phone/CallNotifier;


# instance fields
.field private mApplication:Lcom/android/phone/PhoneGlobals;

.field private mAudioManager:Landroid/media/AudioManager;

.field mBlackListManager:Lcom/mediatek/phone/BlackListManager;

.field private mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

.field private mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

.field private mCM:Lcom/android/internal/telephony/CallManager;

.field private mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

.field private mCallLog:Lcom/android/phone/CallLogAsync;

.field private mCallWaitingTimeOut:Z

.field private mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

.field private mCallerInfoQueryState:I

.field private mCallerInfoQueryStateGuard:Ljava/lang/Object;

.field private mCfiStatus:[Z

.field private mCurrentEmergencyToneState:I

.field mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

.field private mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

.field private mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

.field private mIsCdmaRedialCall:Z

.field private mIsEmergencyToneOn:I

.field private mLastState:Lcom/android/internal/telephony/PhoneConstants$State;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

.field private mPreviousCallState:Lcom/android/internal/telephony/Call$State;

.field private mPreviousCdmaCallState:Lcom/android/internal/telephony/Call$State;

.field private mRinger:Lcom/android/phone/Ringer;

.field private mSignalInfoToneGenerator:Landroid/media/ToneGenerator;

.field private mSilentRingerRequested:Z

.field mToneThread:Lcom/android/phone/CallNotifier$InCallTonePlayer;

.field private mVibrator:Landroid/os/Vibrator;

.field private mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

.field private mVoicePrivacyState:Z

.field private ok2Ring:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 245
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/phone/CallNotifier;->mIsWaitingQueryComplete:Z

    .line 3335
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/phone/CallNotifier;->PHONE_DISCONNECT_GEMINI:[I

    .line 3341
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/phone/CallNotifier;->PHONE_MWI_CHANGED_GEMINI:[I

    return-void

    .line 3335
    nop

    :array_0
    .array-data 0x4
        0x3t 0x0t 0x0t 0x0t
        0x67t 0x0t 0x0t 0x0t
        0xcbt 0x0t 0x0t 0x0t
        0x2ft 0x1t 0x0t 0x0t
    .end array-data

    .line 3341
    :array_1
    .array-data 0x4
        0x15t 0x0t 0x0t 0x0t
        0x79t 0x0t 0x0t 0x0t
        0xddt 0x0t 0x0t 0x0t
        0x41t 0x1t 0x0t 0x0t
    .end array-data
.end method

.method private constructor <init>(Lcom/android/phone/PhoneGlobals;Lcom/android/internal/telephony/Phone;Lcom/android/phone/Ringer;Lcom/android/phone/CallLogAsync;)V
    .locals 7
    .parameter "app"
    .parameter "phone"
    .parameter "ringer"
    .parameter "callLog"

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 268
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 150
    iput-boolean v3, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTimeOut:Z

    .line 160
    new-instance v2, Ljava/lang/Object;

    invoke-direct/range {v2 .. v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryStateGuard:Ljava/lang/Object;

    .line 212
    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mLastState:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 221
    iput-boolean v3, p0, Lcom/android/phone/CallNotifier;->mVoicePrivacyState:Z

    .line 222
    iput-boolean v3, p0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    .line 226
    iput v3, p0, Lcom/android/phone/CallNotifier;->mCurrentEmergencyToneState:I

    .line 230
    sget-object v2, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    .line 238
    iput-object v5, p0, Lcom/android/phone/CallNotifier;->mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 241
    iput-boolean v6, p0, Lcom/android/phone/CallNotifier;->ok2Ring:Z

    .line 248
    iput-object v5, p0, Lcom/android/phone/CallNotifier;->mToneThread:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 2917
    new-instance v2, Lcom/android/phone/CallNotifier$1;

    invoke-direct {v2, p0}, Lcom/android/phone/CallNotifier$1;-><init>(Lcom/android/phone/CallNotifier;)V

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    .line 3346
    iput-object v5, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    .line 3348
    iput-object v5, p0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    .line 269
    iput-object p1, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    .line 270
    iput-object p2, p0, Lcom/android/phone/CallNotifier;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 271
    iget-object v2, p1, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 272
    iget-object v2, p1, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 273
    iput-object p4, p0, Lcom/android/phone/CallNotifier;->mCallLog:Lcom/android/phone/CallLogAsync;

    .line 275
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 276
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v2

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    .line 279
    :cond_0
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const-string v3, "audio"

    invoke-virtual {v2, v3}, Lcom/android/phone/PhoneGlobals;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mAudioManager:Landroid/media/AudioManager;

    .line 281
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->registerForNotifications()V

    .line 283
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 289
    :try_start_0
    new-instance v2, Landroid/media/ToneGenerator;

    const/4 v3, 0x0

    const/16 v4, 0x50

    invoke-direct {v2, v3, v4}, Landroid/media/ToneGenerator;-><init>(II)V

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mSignalInfoToneGenerator:Landroid/media/ToneGenerator;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    :cond_1
    :goto_0
    iput-object p3, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    .line 299
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 300
    .local v0, adapter:Landroid/bluetooth/BluetoothAdapter;
    if-eqz v0, :cond_2

    .line 301
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v2}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mBluetoothProfileServiceListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    invoke-virtual {v0, v2, v3, v6}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    .line 307
    :cond_2
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->listenPhoneState()V

    .line 312
    new-instance v2, Lcom/mediatek/phone/BlackListManager;

    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-direct {v2, v3}, Lcom/mediatek/phone/BlackListManager;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/android/phone/CallNotifier;->mBlackListManager:Lcom/mediatek/phone/BlackListManager;

    .line 313
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v2

    const/16 v3, 0x7d1

    invoke-virtual {v2, p0, v3, v5}, Lcom/mediatek/phone/SIMInfoWrapper;->registerForSimInfoUpdate(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 317
    return-void

    .line 291
    .end local v0           #adapter:Landroid/bluetooth/BluetoothAdapter;
    :catch_0
    move-exception v1

    .line 292
    .local v1, e:Ljava/lang/RuntimeException;
    const-string v2, "CallNotifier"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CallNotifier: Exception caught while creating mSignalInfoToneGenerator: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    iput-object v5, p0, Lcom/android/phone/CallNotifier;->mSignalInfoToneGenerator:Landroid/media/ToneGenerator;

    goto :goto_0
.end method

.method static synthetic access$1000(Lcom/android/phone/CallNotifier;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget v0, p0, Lcom/android/phone/CallNotifier;->mIsEmergencyToneOn:I

    return v0
.end method

.method static synthetic access$1100(Lcom/android/phone/CallNotifier;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget v0, p0, Lcom/android/phone/CallNotifier;->mCurrentEmergencyToneState:I

    return v0
.end method

.method static synthetic access$1102(Lcom/android/phone/CallNotifier;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 93
    iput p1, p0, Lcom/android/phone/CallNotifier;->mCurrentEmergencyToneState:I

    return p1
.end method

.method static synthetic access$1200(Lcom/android/phone/CallNotifier;ZI)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 93
    invoke-direct {p0, p1, p2}, Lcom/android/phone/CallNotifier;->onMwiChanged(ZI)V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/phone/CallNotifier;)[Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/phone/CallNotifier;ZI)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 93
    invoke-direct {p0, p1, p2}, Lcom/android/phone/CallNotifier;->onCfiChanged(ZI)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/phone/CallNotifier;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/phone/CallNotifier;)Lcom/android/internal/telephony/CallManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/phone/CallNotifier;)Lcom/android/phone/PhoneGlobals;
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/phone/CallNotifier;)Landroid/bluetooth/BluetoothHeadset;
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/phone/CallNotifier;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 93
    iput-object p1, p0, Lcom/android/phone/CallNotifier;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object p1
.end method

.method static synthetic access$600(Lcom/android/phone/CallNotifier;)Landroid/media/AudioManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/phone/CallNotifier;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 93
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->resetAudioStateAfterDisconnect()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/phone/CallNotifier;)Landroid/media/ToneGenerator;
    .locals 1
    .parameter "x0"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mSignalInfoToneGenerator:Landroid/media/ToneGenerator;

    return-object v0
.end method

.method private checkAndTriggerRingTone()V
    .locals 6

    .prologue
    .line 3300
    const-string v4, "checkAndTriggerRingTone"

    invoke-direct {p0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3301
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v4}, Lcom/android/phone/Ringer;->isRinging()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 3302
    :cond_0
    const-string v4, "checkAndTriggerRingTone:  return directly"

    invoke-direct {p0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3329
    :cond_1
    :goto_0
    return-void

    .line 3305
    :cond_2
    const-string v4, "trigger the ringtone!"

    invoke-direct {p0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3306
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 3307
    .local v3, ringCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_1

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->isRealIncomingCall(Lcom/android/internal/telephony/Call$State;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 3309
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    .line 3310
    .local v0, c:Lcom/android/internal/telephony/Connection;
    if-eqz v0, :cond_1

    .line 3313
    const/4 v1, 0x0

    .line 3314
    .local v1, info:Lcom/android/internal/telephony/CallerInfo;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v2

    .line 3315
    .local v2, obj:Ljava/lang/Object;
    instance-of v4, v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    if-eqz v4, :cond_4

    .line 3316
    check-cast v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    .end local v2           #obj:Ljava/lang/Object;
    iget-object v1, v2, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 3321
    :cond_3
    :goto_1
    if-eqz v1, :cond_5

    iget-object v4, v1, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    if-eqz v4, :cond_5

    .line 3322
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    iget-object v5, v1, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    .line 3327
    :goto_2
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v4}, Lcom/android/phone/Ringer;->ring()V

    goto :goto_0

    .line 3317
    .restart local v2       #obj:Ljava/lang/Object;
    :cond_4
    instance-of v4, v2, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v4, :cond_3

    move-object v1, v2

    .line 3318
    check-cast v1, Lcom/android/internal/telephony/CallerInfo;

    goto :goto_1

    .line 3324
    .end local v2           #obj:Ljava/lang/Object;
    :cond_5
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    sget-object v5, Landroid/provider/Settings$System;->DEFAULT_RINGTONE_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    goto :goto_2
.end method

.method private closeVTManager()V
    .locals 3

    .prologue
    .line 3172
    const-string v0, "closeVTManager()!"

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3173
    const-string v0, "- call VTManager onDisconnected ! "

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3176
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->onDisconnected()V

    .line 3178
    const-string v0, "- finish call VTManager onDisconnected ! "

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3182
    const-string v0, "- set VTManager close ! "

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3184
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->setVTClose()V

    .line 3186
    const-string v0, "- finish set VTManager close ! "

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3189
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInControlRes:Z

    if-eqz v0, :cond_0

    .line 3190
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.phone.extra.VT_CALL_END"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/android/phone/PhoneGlobals;->sendBroadcast(Landroid/content/Intent;)V

    .line 3191
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInControlRes:Z

    .line 3193
    :cond_0
    return-void
.end method

.method private formatDuration(J)Ljava/lang/String;
    .locals 10
    .parameter "elapsedSeconds"

    .prologue
    const-wide/16 v5, 0x3c

    .line 3200
    const-wide/16 v0, 0x0

    .line 3201
    .local v0, minutes:J
    const-wide/16 v2, 0x0

    .line 3203
    .local v2, seconds:J
    cmp-long v4, p1, v5

    if-ltz v4, :cond_0

    .line 3204
    div-long v0, p1, v5

    .line 3205
    mul-long v4, v0, v5

    sub-long/2addr p1, v4

    .line 3207
    :cond_0
    move-wide v2, p1

    .line 3209
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const v6, 0x7f0d02be

    invoke-virtual {v5, v6}, Lcom/android/phone/PhoneGlobals;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const v6, 0x7f0d0074

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Lcom/android/phone/PhoneGlobals;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private getLogNumber(Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfo;)Ljava/lang/String;
    .locals 4
    .parameter "conn"
    .parameter "callerInfo"

    .prologue
    .line 2974
    const/4 v0, 0x0

    .line 2976
    .local v0, number:Ljava/lang/String;
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2977
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 2997
    :goto_0
    if-nez v0, :cond_4

    .line 2998
    const/4 v2, 0x0

    .line 3009
    :goto_1
    return-object v2

    .line 2984
    :cond_0
    if-eqz p2, :cond_1

    iget-object v2, p2, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p2}, Lcom/android/internal/telephony/CallerInfo;->isEmergencyNumber()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p2}, Lcom/android/internal/telephony/CallerInfo;->isVoiceMailNumber()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2986
    :cond_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 2988
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getOrigDialString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2990
    :cond_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2993
    :cond_3
    iget-object v0, p2, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    goto :goto_0

    .line 3000
    :cond_4
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v1

    .line 3003
    .local v1, presentation:I
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-static {v2, p2, v0, v1}, Lcom/android/phone/PhoneUtils;->modifyForSpecialCnapCases(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 3005
    invoke-static {v0}, Landroid/telephony/PhoneNumberUtils;->isUriNumber(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 3006
    invoke-static {v0}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3008
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getLogNumber: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    move-object v2, v0

    .line 3009
    goto :goto_1
.end method

.method private ignoreAllIncomingCalls(Lcom/android/internal/telephony/Phone;)Z
    .locals 14
    .parameter "phone"

    .prologue
    .line 756
    sget-boolean v11, Lcom/android/phone/PhoneGlobals;->sVoiceCapable:Z

    if-nez v11, :cond_0

    .line 760
    const-string v11, "CallNotifier"

    const-string v12, "Got onNewRingingConnection() on non-voice-capable device! Ignoring..."

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 761
    const/4 v11, 0x1

    .line 833
    :goto_0
    return v11

    .line 767
    :cond_0
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->isPhoneInEcm(Lcom/android/internal/telephony/Phone;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 768
    const-string v11, "Incoming call while in ECM: always allow..."

    invoke-direct {p0, v11}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 769
    const/4 v11, 0x0

    goto :goto_0

    .line 773
    :cond_1
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v11}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "device_provisioned"

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    if-eqz v11, :cond_2

    const/4 v9, 0x1

    .line 775
    .local v9, provisioned:Z
    :goto_1
    if-nez v9, :cond_3

    .line 776
    const-string v11, "CallNotifier"

    const-string v12, "Ignoring incoming call: not provisioned"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 777
    const/4 v11, 0x1

    goto :goto_0

    .line 773
    .end local v9           #provisioned:Z
    :cond_2
    const/4 v9, 0x0

    goto :goto_1

    .line 781
    .restart local v9       #provisioned:Z
    :cond_3
    invoke-static {p1}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsOtasp(Lcom/android/internal/telephony/Phone;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 782
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v11, v11, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v11, v11, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v12, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_ACTIVATION:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-ne v11, v12, :cond_4

    const/4 v0, 0x1

    .line 784
    .local v0, activateState:Z
    :goto_2
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v11, v11, Lcom/android/phone/PhoneGlobals;->cdmaOtaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState;

    iget-object v11, v11, Lcom/android/phone/OtaUtils$CdmaOtaScreenState;->otaScreenState:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    sget-object v12, Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;->OTA_STATUS_SUCCESS_FAILURE_DLG:Lcom/android/phone/OtaUtils$CdmaOtaScreenState$OtaScreenState;

    if-ne v11, v12, :cond_5

    const/4 v5, 0x1

    .line 786
    .local v5, dialogState:Z
    :goto_3
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v11, v11, Lcom/android/phone/PhoneGlobals;->cdmaOtaProvisionData:Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;

    iget-boolean v10, v11, Lcom/android/phone/OtaUtils$CdmaOtaProvisionData;->inOtaSpcState:Z

    .line 788
    .local v10, spcState:Z
    if-eqz v10, :cond_6

    .line 789
    const-string v11, "CallNotifier"

    const-string v12, "Ignoring incoming call: OTA call is active"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 790
    const/4 v11, 0x1

    goto :goto_0

    .line 782
    .end local v0           #activateState:Z
    .end local v5           #dialogState:Z
    .end local v10           #spcState:Z
    :cond_4
    const/4 v0, 0x0

    goto :goto_2

    .line 784
    .restart local v0       #activateState:Z
    :cond_5
    const/4 v5, 0x0

    goto :goto_3

    .line 791
    .restart local v5       #dialogState:Z
    .restart local v10       #spcState:Z
    :cond_6
    if-nez v0, :cond_7

    if-eqz v5, :cond_9

    .line 796
    :cond_7
    if-eqz v5, :cond_8

    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v11}, Lcom/android/phone/PhoneGlobals;->dismissOtaDialogs()V

    .line 797
    :cond_8
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v11}, Lcom/android/phone/PhoneGlobals;->clearOtaState()V

    .line 798
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v11}, Lcom/android/phone/PhoneGlobals;->clearInCallScreenMode()V

    .line 799
    const/4 v11, 0x0

    goto :goto_0

    .line 805
    .end local v0           #activateState:Z
    .end local v5           #dialogState:Z
    .end local v10           #spcState:Z
    :cond_9
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v11}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 806
    .local v3, call:Lcom/android/internal/telephony/Call;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    .line 807
    .local v2, c:Lcom/android/internal/telephony/Connection;
    if-eqz v2, :cond_d

    .line 808
    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v1

    .line 809
    .local v1, address:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_d

    .line 811
    iget-object v12, p0, Lcom/android/phone/CallNotifier;->mBlackListManager:Lcom/mediatek/phone/BlackListManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->isVideo()Z

    move-result v11

    if-eqz v11, :cond_c

    const/4 v11, 0x1

    :goto_4
    invoke-virtual {v12, v1, v11}, Lcom/mediatek/phone/BlackListManager;->shouldBlock(Ljava/lang/String;I)Z

    move-result v8

    .line 816
    .local v8, isInBlackList:Z
    const/4 v7, 0x0

    .line 817
    .local v7, isAutoReject:Z
    iget-object v11, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v11, v11, Lcom/android/phone/PhoneGlobals;->callerInfoCache:Lcom/android/phone/CallerInfoCache;

    invoke-virtual {v11, v1}, Lcom/android/phone/CallerInfoCache;->getCacheEntry(Ljava/lang/String;)Lcom/android/phone/CallerInfoCache$CacheEntry;

    move-result-object v6

    .line 818
    .local v6, entry:Lcom/android/phone/CallerInfoCache$CacheEntry;
    if-eqz v6, :cond_a

    .line 819
    iget-boolean v7, v6, Lcom/android/phone/CallerInfoCache$CacheEntry;->sendToVoicemail:Z

    .line 821
    :cond_a
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "the call should be rejected by black list or auto reject: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " / "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 822
    if-nez v8, :cond_b

    if-eqz v7, :cond_d

    .line 823
    :cond_b
    new-instance v4, Lcom/android/internal/telephony/CallerInfo;

    invoke-direct {v4}, Lcom/android/internal/telephony/CallerInfo;-><init>()V

    .line 824
    .local v4, callerInfo:Lcom/android/internal/telephony/CallerInfo;
    const/4 v11, 0x1

    iput-boolean v11, v4, Lcom/android/internal/telephony/CallerInfo;->shouldSendToVoicemail:Z

    .line 825
    invoke-virtual {v2, v4}, Lcom/android/internal/telephony/Connection;->setUserData(Ljava/lang/Object;)V

    .line 826
    const/4 v11, 0x1

    goto/16 :goto_0

    .line 811
    .end local v4           #callerInfo:Lcom/android/internal/telephony/CallerInfo;
    .end local v6           #entry:Lcom/android/phone/CallerInfoCache$CacheEntry;
    .end local v7           #isAutoReject:Z
    .end local v8           #isInBlackList:Z
    :cond_c
    const/4 v11, 0x0

    goto :goto_4

    .line 833
    .end local v1           #address:Ljava/lang/String;
    :cond_d
    const/4 v11, 0x0

    goto/16 :goto_0
.end method

.method static init(Lcom/android/phone/PhoneGlobals;Lcom/android/internal/telephony/Phone;Lcom/android/phone/Ringer;Lcom/android/phone/CallLogAsync;)Lcom/android/phone/CallNotifier;
    .locals 4
    .parameter "app"
    .parameter "phone"
    .parameter "ringer"
    .parameter "callLog"

    .prologue
    .line 256
    const-class v1, Lcom/android/phone/CallNotifier;

    monitor-enter v1

    .line 257
    :try_start_0
    sget-object v0, Lcom/android/phone/CallNotifier;->sInstance:Lcom/android/phone/CallNotifier;

    if-nez v0, :cond_0

    .line 258
    new-instance v0, Lcom/android/phone/CallNotifier;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/phone/CallNotifier;-><init>(Lcom/android/phone/PhoneGlobals;Lcom/android/internal/telephony/Phone;Lcom/android/phone/Ringer;Lcom/android/phone/CallLogAsync;)V

    sput-object v0, Lcom/android/phone/CallNotifier;->sInstance:Lcom/android/phone/CallNotifier;

    .line 262
    :goto_0
    sget-object v0, Lcom/android/phone/CallNotifier;->sInstance:Lcom/android/phone/CallNotifier;

    monitor-exit v1

    return-object v0

    .line 260
    :cond_0
    const-string v0, "CallNotifier"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init() called multiple times!  sInstance = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/android/phone/CallNotifier;->sInstance:Lcom/android/phone/CallNotifier;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 263
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private initFakeCall(Lcom/android/internal/telephony/Connection;I)V
    .locals 2
    .parameter "c"
    .parameter "simId"

    .prologue
    .line 3275
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    new-instance v1, Lcom/android/phone/InCallUiState$FakeCall;

    invoke-direct {v1}, Lcom/android/phone/InCallUiState$FakeCall;-><init>()V

    iput-object v1, v0, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    .line 3276
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v1

    iput-object v1, v0, Lcom/android/phone/InCallUiState$FakeCall;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    .line 3277
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3278
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    iput p2, v0, Lcom/android/phone/InCallUiState$FakeCall;->slotId:I

    .line 3282
    :goto_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/phone/InCallUiState$FakeCall;->number:Ljava/lang/String;

    .line 3283
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    iput v1, v0, Lcom/android/phone/InCallUiState$FakeCall;->phoneType:I

    .line 3284
    return-void

    .line 3280
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v0, v0, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    const/4 v1, 0x0

    iput v1, v0, Lcom/android/phone/InCallUiState$FakeCall;->slotId:I

    goto :goto_0
.end method

.method private listenPhoneState()V
    .locals 9

    .prologue
    const/16 v8, 0xd

    const/4 v7, 0x0

    .line 3351
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 3352
    .local v1, geminiSlots:[I
    array-length v0, v1

    .line 3353
    .local v0, count:I
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    if-nez v4, :cond_0

    .line 3354
    new-array v4, v0, [Z

    iput-object v4, p0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    .line 3357
    :cond_0
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const-string v5, "phone"

    invoke-virtual {v4, v5}, Lcom/android/phone/PhoneGlobals;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 3358
    .local v3, telephonyManager:Landroid/telephony/TelephonyManager;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3359
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    if-nez v4, :cond_1

    .line 3360
    new-array v4, v0, [Landroid/telephony/PhoneStateListener;

    iput-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    .line 3362
    :cond_1
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v0, :cond_5

    .line 3363
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    aget-object v4, v4, v2

    if-nez v4, :cond_2

    .line 3364
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    new-instance v5, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;

    aget v6, v1, v2

    invoke-direct {v5, p0, v6}, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;-><init>(Lcom/android/phone/CallNotifier;I)V

    aput-object v5, v4, v2

    .line 3366
    :cond_2
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    aput-boolean v7, v4, v2

    .line 3367
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    aget-object v4, v4, v2

    aget v5, v1, v2

    invoke-virtual {v3, v4, v8, v5}, Landroid/telephony/TelephonyManager;->listenGemini(Landroid/telephony/PhoneStateListener;II)V

    .line 3362
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3370
    .end local v2           #i:I
    :cond_3
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    aput-boolean v7, v4, v7

    .line 3371
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    if-nez v4, :cond_4

    .line 3372
    const/4 v4, 0x1

    new-array v4, v4, [Landroid/telephony/PhoneStateListener;

    iput-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    .line 3373
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    new-instance v5, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;

    aget v6, v1, v7

    invoke-direct {v5, p0, v6}, Lcom/android/phone/CallNotifier$GeminiPhoneStateListener;-><init>(Lcom/android/phone/CallNotifier;I)V

    aput-object v5, v4, v7

    .line 3375
    :cond_4
    iget-object v4, p0, Lcom/android/phone/CallNotifier;->mPhoneStateListeners:[Landroid/telephony/PhoneStateListener;

    aget-object v4, v4, v7

    invoke-virtual {v3, v4, v8}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 3377
    :cond_5
    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 3056
    const-string v0, "CallNotifier"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3057
    return-void
.end method

.method private onCdmaCallWaiting(Landroid/os/AsyncResult;)V
    .locals 11
    .parameter "r"

    .prologue
    const/16 v10, 0x17

    const/16 v9, 0x16

    const/4 v8, 0x0

    .line 2622
    invoke-virtual {p0, v9}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 2623
    invoke-virtual {p0, v10}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 2627
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v6, v6, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    sget-object v7, Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;->SINGLE_ACTIVE:Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;

    invoke-virtual {v6, v7}, Lcom/android/phone/CdmaPhoneCallState;->setCurrentCallState(Lcom/android/phone/CdmaPhoneCallState$PhoneCallState;)V

    .line 2632
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v6}, Lcom/android/phone/PhoneGlobals;->isShowingCallScreen()Z

    move-result v6

    if-nez v6, :cond_1

    .line 2633
    const-string v6, "- showing incoming call (CDMA call waiting)..."

    invoke-direct {p0, v6}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2634
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->showIncomingCall()V

    .line 2640
    :goto_0
    iput-boolean v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTimeOut:Z

    .line 2641
    const-wide/16 v6, 0x4e20

    invoke-virtual {p0, v9, v6, v7}, Lcom/android/phone/CallNotifier;->sendEmptyMessageDelayed(IJ)Z

    .line 2645
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v6, v6, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    invoke-virtual {v6, v8}, Lcom/android/phone/CdmaPhoneCallState;->setAddCallMenuStateAfterCallWaiting(Z)V

    .line 2648
    const-wide/16 v6, 0x7530

    invoke-virtual {p0, v10, v6, v7}, Lcom/android/phone/CallNotifier;->sendEmptyMessageDelayed(IJ)Z

    .line 2652
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;

    .line 2653
    .local v0, infoCW:Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;
    iget v1, v0, Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;->isPresent:I

    .line 2654
    .local v1, isPresent:I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onCdmaCallWaiting: isPresent="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2655
    const/4 v6, 0x1

    if-ne v1, v6, :cond_0

    .line 2656
    iget v5, v0, Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;->signalType:I

    .line 2657
    .local v5, uSignalType:I
    iget v3, v0, Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;->alertPitch:I

    .line 2658
    .local v3, uAlertPitch:I
    iget v4, v0, Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;->signal:I

    .line 2659
    .local v4, uSignal:I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onCdmaCallWaiting: uSignalType="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uAlertPitch="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uSignal="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2662
    invoke-static {v5, v3, v4}, Lcom/android/internal/telephony/cdma/SignalToneUtil;->getAudioToneFromSignalInfo(III)I

    move-result v2

    .line 2666
    .local v2, toneID:I
    new-instance v6, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;

    invoke-direct {v6, p0, v2}, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    invoke-virtual {v6}, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;->start()V

    .line 2668
    .end local v2           #toneID:I
    .end local v3           #uAlertPitch:I
    .end local v4           #uSignal:I
    .end local v5           #uSignalType:I
    :cond_0
    return-void

    .line 2636
    .end local v0           #infoCW:Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;
    .end local v1           #isPresent:I
    :cond_1
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v6}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/phone/InCallScreen;->requestUpdateScreen()V

    goto :goto_0
.end method

.method private onCdmaCallWaitingReject()V
    .locals 23

    .prologue
    .line 2689
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v19

    .line 2692
    .local v19, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v21, Lcom/android/internal/telephony/Call$State;->WAITING:Lcom/android/internal/telephony/Call$State;

    move-object/from16 v0, v21

    if-ne v3, v0, :cond_3

    .line 2694
    invoke-virtual/range {v19 .. v19}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v13

    .line 2696
    .local v13, c:Lcom/android/internal/telephony/Connection;
    if-eqz v13, :cond_2

    .line 2697
    invoke-virtual {v13}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v17

    .line 2698
    .local v17, number:Ljava/lang/String;
    invoke-virtual {v13}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v6

    .line 2699
    .local v6, presentation:I
    invoke-virtual {v13}, Lcom/android/internal/telephony/Connection;->getCreateTime()J

    move-result-wide v8

    .line 2700
    .local v8, date:J
    invoke-virtual {v13}, Lcom/android/internal/telephony/Connection;->getDurationMillis()J

    move-result-wide v10

    .line 2701
    .local v10, duration:J
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/phone/CallNotifier;->mCallWaitingTimeOut:Z

    if-eqz v3, :cond_4

    const/4 v7, 0x3

    .line 2705
    .local v7, callLogType:I
    :goto_0
    invoke-virtual {v13}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v18

    .line 2707
    .local v18, o:Ljava/lang/Object;
    if-eqz v18, :cond_0

    move-object/from16 v0, v18

    instance-of v3, v0, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v3, :cond_5

    :cond_0
    move-object/from16 v4, v18

    .line 2708
    check-cast v4, Lcom/android/internal/telephony/CallerInfo;

    .line 2715
    .end local v18           #o:Ljava/lang/Object;
    .local v4, ci:Lcom/android/internal/telephony/CallerInfo;
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v0, v17

    invoke-static {v3, v4, v0, v6}, Lcom/android/phone/PhoneUtils;->modifyForSpecialCnapCases(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    .line 2717
    .local v5, logNumber:Ljava/lang/String;
    if-eqz v4, :cond_6

    iget v0, v4, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    move/from16 v16, v0

    .line 2718
    .local v16, newPresentation:I
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "- onCdmaCallWaitingReject(): logNumber set to: "

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v21, ", newPresentation value is: "

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2721
    const/4 v2, 0x0

    .line 2722
    .local v2, args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 2723
    const/4 v12, 0x1

    .line 2724
    .local v12, cdmaSimId:I
    const/4 v3, 0x2

    invoke-static {v3}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlotByPhoneType(I)I

    move-result v14

    .line 2725
    .local v14, cdmaSlot:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v3, v14}, Lcom/android/phone/PhoneInterfaceManager;->hasIccCardGemini(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2726
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    invoke-static {v3, v14}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v20

    .line 2727
    .local v20, si:Landroid/provider/Telephony$SIMInfo;
    if-eqz v20, :cond_1

    .line 2728
    move-object/from16 v0, v20

    iget-wide v0, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v21, v0

    move-wide/from16 v0, v21

    long-to-int v12, v0

    .line 2732
    .end local v20           #si:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    new-instance v2, Lcom/android/phone/CallLogAsync$AddCallArgs;

    .end local v2           #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-direct/range {v2 .. v12}, Lcom/android/phone/CallLogAsync$AddCallArgs;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;IIJJI)V

    .line 2741
    .end local v12           #cdmaSimId:I
    .end local v14           #cdmaSlot:I
    .restart local v2       #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    :goto_3
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallNotifier;->mCallLog:Lcom/android/phone/CallLogAsync;

    invoke-virtual {v3, v2}, Lcom/android/phone/CallLogAsync;->addCall(Lcom/android/phone/CallLogAsync$AddCallArgs;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2748
    :goto_4
    const/4 v3, 0x3

    if-ne v7, v3, :cond_8

    .line 2750
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v8, v9}, Lcom/android/phone/CallNotifier;->showMissedCallNotification(Lcom/android/internal/telephony/Connection;J)V

    .line 2757
    :goto_5
    invoke-static {v13}, Lcom/android/phone/PhoneUtils;->hangup(Lcom/android/internal/telephony/Connection;)V

    .line 2761
    .end local v2           #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    .end local v4           #ci:Lcom/android/internal/telephony/CallerInfo;
    .end local v5           #logNumber:Ljava/lang/String;
    .end local v6           #presentation:I
    .end local v7           #callLogType:I
    .end local v8           #date:J
    .end local v10           #duration:J
    .end local v16           #newPresentation:I
    .end local v17           #number:Ljava/lang/String;
    :cond_2
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/phone/CallNotifier;->mCallWaitingTimeOut:Z

    .line 2763
    .end local v13           #c:Lcom/android/internal/telephony/Connection;
    :cond_3
    return-void

    .line 2701
    .restart local v6       #presentation:I
    .restart local v8       #date:J
    .restart local v10       #duration:J
    .restart local v13       #c:Lcom/android/internal/telephony/Connection;
    .restart local v17       #number:Ljava/lang/String;
    :cond_4
    const/4 v7, 0x1

    goto/16 :goto_0

    .line 2710
    .restart local v7       #callLogType:I
    .restart local v18       #o:Ljava/lang/Object;
    :cond_5
    check-cast v18, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    .end local v18           #o:Ljava/lang/Object;
    move-object/from16 v0, v18

    iget-object v4, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .restart local v4       #ci:Lcom/android/internal/telephony/CallerInfo;
    goto/16 :goto_1

    .restart local v5       #logNumber:Ljava/lang/String;
    :cond_6
    move/from16 v16, v6

    .line 2717
    goto/16 :goto_2

    .line 2735
    .restart local v2       #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    .restart local v16       #newPresentation:I
    :cond_7
    new-instance v2, Lcom/android/phone/CallLogAsync$AddCallArgs;

    .end local v2           #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-direct/range {v2 .. v11}, Lcom/android/phone/CallLogAsync$AddCallArgs;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;IIJJ)V

    .restart local v2       #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    goto :goto_3

    .line 2742
    :catch_0
    move-exception v15

    .line 2744
    .local v15, e:Landroid/database/sqlite/SQLiteDiskIOException;
    const-string v3, "CallNotifier"

    const-string v21, "Error!! - onDisconnect() Disk Full!"

    move-object/from16 v0, v21

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2745
    invoke-virtual {v15}, Landroid/database/sqlite/SQLiteDiskIOException;->printStackTrace()V

    goto :goto_4

    .line 2753
    .end local v15           #e:Landroid/database/sqlite/SQLiteDiskIOException;
    :cond_8
    const/16 v3, 0x16

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    goto :goto_5
.end method

.method private onCfiChanged(ZI)V
    .locals 2
    .parameter "visible"
    .parameter "simId"

    .prologue
    .line 2170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCfiChanged(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "simId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2171
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v0, p1, p2}, Lcom/android/phone/NotificationMgr;->updateCfi(ZI)V

    .line 2172
    return-void
.end method

.method private onCustomRingQueryComplete()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 938
    const/4 v0, 0x0

    .line 939
    .local v0, isQueryExecutionTimeExpired:Z
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryStateGuard:Ljava/lang/Object;

    monitor-enter v2

    .line 940
    :try_start_0
    iget v1, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryState:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    .line 941
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryState:I

    .line 942
    const/4 v0, 0x1

    .line 944
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 945
    if-eqz v0, :cond_1

    .line 948
    const-string v1, "CallNotifier"

    const-string v2, "CallerInfo query took too long; falling back to default ringtone"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 949
    const v1, 0x112a0

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v1, v2}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 964
    :cond_1
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v1, v2, :cond_2

    .line 965
    const-string v1, "CallNotifier"

    const-string v2, "onCustomRingQueryComplete: No incoming call! Bailing out..."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 991
    :goto_0
    return-void

    .line 944
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 973
    :cond_2
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getRingingPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_3

    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getRingingPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    .line 975
    :cond_3
    const-string v1, "RINGING... (onCustomRingQueryComplete)"

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 976
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v1}, Lcom/android/phone/Ringer;->ring()V

    .line 980
    :cond_4
    const-string v1, "- showing incoming call (custom ring query complete)..."

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 989
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->showIncomingCall()V

    goto :goto_0
.end method

.method private onCustomRingtoneQueryTimeout(Ljava/lang/String;)V
    .locals 3
    .parameter "number"

    .prologue
    .line 1549
    const-string v1, "CallNotifier"

    const-string v2, "CallerInfo query took too long; look up local fallback cache."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1554
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->callerInfoCache:Lcom/android/phone/CallerInfoCache;

    invoke-virtual {v1, p1}, Lcom/android/phone/CallerInfoCache;->getCacheEntry(Ljava/lang/String;)Lcom/android/phone/CallerInfoCache$CacheEntry;

    move-result-object v0

    .line 1556
    .local v0, entry:Lcom/android/phone/CallerInfoCache$CacheEntry;
    if-eqz v0, :cond_2

    .line 1557
    iget-boolean v1, v0, Lcom/android/phone/CallerInfoCache$CacheEntry;->sendToVoicemail:Z

    if-eqz v1, :cond_0

    .line 1558
    const-string v1, "send to voicemail flag detected (in fallback cache). hanging up."

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1559
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->hangupRingingCall(Lcom/android/internal/telephony/Call;)Z

    .line 1577
    :goto_0
    return-void

    .line 1563
    :cond_0
    iget-object v1, v0, Lcom/android/phone/CallerInfoCache$CacheEntry;->customRingtone:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 1564
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "custom ringtone found (in fallback cache), setting up ringer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/android/phone/CallerInfoCache$CacheEntry;->customRingtone:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1566
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    iget-object v2, v0, Lcom/android/phone/CallerInfoCache$CacheEntry;->customRingtone:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    .line 1576
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->onCustomRingQueryComplete()V

    goto :goto_0

    .line 1573
    :cond_2
    const-string v1, "Failed to find fallback cache. Use default ringer tone."

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private onDisconnect(Landroid/os/AsyncResult;I)V
    .locals 49
    .parameter "r"
    .parameter "simId"

    .prologue
    .line 1589
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "onDisconnect()...  CallManager state: "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v14}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v14, ", sim id "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1591
    const/16 v37, 0x0

    .line 1592
    .local v37, isSipCall:Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v46

    .line 1594
    .local v46, state:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    move-object/from16 v0, v46

    if-ne v0, v4, :cond_19

    .line 1595
    const/4 v4, 0x0

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->setAudioControlState(I)V

    .line 1602
    :cond_0
    :goto_0
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/phone/CallNotifier;->ok2Ring:Z

    .line 1604
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/phone/CallNotifier;->mVoicePrivacyState:Z

    .line 1605
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v28, v0

    check-cast v28, Lcom/android/internal/telephony/Connection;

    .line 1606
    .local v28, c:Lcom/android/internal/telephony/Connection;
    if-eqz v28, :cond_1a

    .line 1607
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "onDisconnect: cause = "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v14, ", incoming = "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v14, ", date = "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCreateTime()J

    move-result-wide v14

    invoke-virtual {v4, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v14, ", number = "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1614
    :goto_1
    const/16 v24, 0x0

    .line 1615
    .local v24, autoretrySetting:I
    if-eqz v28, :cond_1

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    const/4 v14, 0x2

    if-ne v4, v14, :cond_1

    .line 1616
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v14, "call_auto_retry"

    const/4 v15, 0x0

    invoke-static {v4, v14, v15}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v24

    .line 1621
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/CallNotifier;->stopSignalInfoTone()V

    .line 1623
    if-eqz v28, :cond_2

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    const/4 v14, 0x2

    if-ne v4, v14, :cond_2

    .line 1625
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    invoke-virtual {v4}, Lcom/android/phone/CdmaPhoneCallState;->resetCdmaPhoneCallState()V

    .line 1628
    const/16 v4, 0x16

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1629
    const/16 v4, 0x17

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1633
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-boolean v4, v4, Lcom/android/phone/InCallUiState;->delayFinished:Z

    if-eqz v4, :cond_1c

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    move-object/from16 v0, v46

    if-ne v0, v4, :cond_1c

    .line 1634
    const-string v4, "Meet the case to cache the disconnect call information!!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1635
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    const/4 v14, 0x0

    iput-boolean v14, v4, Lcom/android/phone/InCallUiState;->delayFinished:Z

    .line 1636
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    new-instance v14, Lcom/android/phone/InCallUiState$FakeCall;

    invoke-direct {v14}, Lcom/android/phone/InCallUiState$FakeCall;-><init>()V

    iput-object v14, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    .line 1637
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v14

    iput-object v14, v4, Lcom/android/phone/InCallUiState$FakeCall;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    .line 1638
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 1639
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    move/from16 v0, p2

    iput v0, v4, Lcom/android/phone/InCallUiState$FakeCall;->slotId:I

    .line 1643
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    move-object/from16 v0, v28

    iput-object v0, v4, Lcom/android/phone/InCallUiState$FakeCall;->conn:Lcom/android/internal/telephony/Connection;

    .line 1644
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v4, Lcom/android/phone/InCallUiState$FakeCall;->number:Ljava/lang/String;

    .line 1645
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v14

    invoke-virtual {v14}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v14

    invoke-interface {v14}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v14

    iput v14, v4, Lcom/android/phone/InCallUiState$FakeCall;->phoneType:I

    .line 1652
    :goto_3
    if-eqz v28, :cond_3

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    const/4 v14, 0x3

    if-ne v4, v14, :cond_3

    .line 1653
    const/16 v37, 0x1

    .line 1700
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v44

    .line 1701
    .local v44, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-virtual/range {v44 .. v44}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    const/4 v14, 0x2

    if-ne v4, v14, :cond_1e

    .line 1702
    invoke-virtual/range {v44 .. v44}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->isRealIncomingCall(Lcom/android/internal/telephony/Call$State;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 1705
    const-string v4, "cancelCallInProgressNotifications()... (onDisconnect)"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1706
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v4}, Lcom/android/phone/NotificationMgr;->cancelCallInProgressNotifications()V

    .line 1721
    :cond_4
    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-eqz v4, :cond_5

    .line 1722
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v4}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->stopTone()V

    .line 1723
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 1727
    :cond_5
    if-eqz v28, :cond_6

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsOtasp(Lcom/android/internal/telephony/Phone;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1728
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v39

    .line 1729
    .local v39, number:Ljava/lang/String;
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    move-object/from16 v0, v39

    invoke-interface {v4, v0}, Lcom/android/internal/telephony/Phone;->isOtaSpNumber(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1730
    const-string v4, "onDisconnect: this was an OTASP call!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1731
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->handleOtaspDisconnect()V

    .line 1737
    .end local v39           #number:Ljava/lang/String;
    :cond_6
    const/16 v47, 0x0

    .line 1740
    .local v47, toneToPlay:I
    if-eqz v28, :cond_7

    .line 1741
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v30

    .line 1742
    .local v30, cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->BUSY:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_1f

    .line 1743
    const-string v4, "- need to play BUSY tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1744
    const/16 v47, 0x2

    .line 1818
    .end local v30           #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    :cond_7
    :goto_5
    if-nez v47, :cond_9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v14, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v4, v14, :cond_9

    if-eqz v28, :cond_9

    .line 1821
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v30

    .line 1822
    .restart local v30       #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_8

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_8

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL_UNSPECIFIED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_9

    .line 1829
    :cond_8
    const-string v4, "- need to play CALL_ENDED tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1830
    const/16 v47, 0x4

    .line 1831
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    .line 1836
    .end local v30           #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    :cond_9
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v32

    .line 1837
    .local v32, fg:Lcom/android/internal/telephony/Call;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v27

    .line 1838
    .local v27, bg:Lcom/android/internal/telephony/Call;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getBgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v26

    .line 1839
    .local v26, bFg:Lcom/android/internal/telephony/Call;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getBgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v25

    .line 1840
    .local v25, bBg:Lcom/android/internal/telephony/Call;
    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    move-object/from16 v0, v46

    if-ne v0, v4, :cond_a

    invoke-virtual/range {v32 .. v32}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-virtual/range {v27 .. v27}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-virtual/range {v26 .. v26}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-virtual/range {v25 .. v25}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1845
    const/4 v4, 0x1

    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->setAudioControlState(I)V

    .line 1853
    :cond_a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v4

    sget-object v14, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v4, v14, :cond_c

    .line 1856
    if-nez v47, :cond_b

    .line 1857
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallNotifier;->resetAudioStateAfterDisconnect()V

    .line 1860
    :cond_b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v4}, Lcom/android/phone/NotificationMgr;->cancelCallInProgressNotifications()V

    .line 1876
    :cond_c
    if-eqz v28, :cond_18

    .line 1877
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v39

    .line 1878
    .restart local v39       #number:Ljava/lang/String;
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCreateTime()J

    move-result-wide v9

    .line 1887
    .local v9, date:J
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getDurationMillis()J

    move-result-wide v11

    .line 1888
    .local v11, duration:J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "onDisconnect: number = "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v14, ", duration = "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1895
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->isMultiparty()Z

    move-result v4

    if-nez v4, :cond_d

    const-wide/16 v14, 0x0

    const-wide/16 v18, 0x3e8

    div-long v18, v11, v18

    cmp-long v4, v14, v18

    if-eqz v4, :cond_d

    .line 1896
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-wide/16 v14, 0x3e8

    div-long v14, v11, v14

    long-to-int v14, v14

    int-to-long v14, v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/android/phone/CallNotifier;->formatDuration(J)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    invoke-static {v4, v14, v15}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 1903
    :cond_d
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v30

    .line 1904
    .restart local v30       #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v42

    .line 1905
    .local v42, phone:Lcom/android/internal/telephony/Phone;
    const/16 v48, 0x0

    .line 1913
    .local v48, vtCall:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v0, v39

    invoke-static {v0, v4}, Landroid/telephony/PhoneNumberUtils;->isLocalEmergencyNumber(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v35

    .line 1916
    .local v35, isEmergencyNumber:Z
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "onDisconnect isShouldSendtoVoicemail flag:"

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {v28 .. v28}, Lcom/android/phone/PhoneUtils;->getShouldSendToVoiceMailFlag(Lcom/android/internal/telephony/Connection;)Z

    move-result v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1921
    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 1922
    invoke-static/range {v28 .. v28}, Lcom/android/phone/PhoneUtils;->getShouldSendToVoiceMailFlag(Lcom/android/internal/telephony/Connection;)Z

    move-result v4

    if-eqz v4, :cond_2e

    const/4 v8, 0x5

    .line 1928
    .local v8, callLogType:I
    :goto_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "onDisconnect callLogType:"

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1930
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "- callLogType: "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v14, ", UserData: "

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1934
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/android/phone/CallNotifier;->getCallerInfoFromConnection(Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v5

    .line 1935
    .local v5, ci:Lcom/android/internal/telephony/CallerInfo;
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v5}, Lcom/android/phone/CallNotifier;->getLogNumber(Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfo;)Ljava/lang/String;

    move-result-object v6

    .line 1937
    .local v6, logNumber:Ljava/lang/String;
    const-string v4, "- onDisconnect(): logNumber set to: xxxxxxx"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1944
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v5}, Lcom/android/phone/CallNotifier;->getPresentation(Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfo;)I

    move-result v7

    .line 1946
    .local v7, presentation:I
    invoke-interface/range {v42 .. v42}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    const/4 v14, 0x2

    if-ne v4, v14, :cond_e

    .line 1947
    if-eqz v35, :cond_e

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/phone/CallNotifier;->mCurrentEmergencyToneState:I

    if-eqz v4, :cond_e

    .line 1949
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    if-eqz v4, :cond_e

    .line 1950
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    #calls: Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;->stop()V
    invoke-static {v4}, Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;->access$100(Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;)V

    .line 1959
    :cond_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v14, 0x7f0a000c

    invoke-virtual {v4, v14}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v40

    .line 1964
    .local v40, okToLogEmergencyNumber:Z
    invoke-static/range {v42 .. v42}, Lcom/android/internal/telephony/TelephonyCapabilities;->supportsOtasp(Lcom/android/internal/telephony/Phone;)Z

    move-result v4

    if-eqz v4, :cond_31

    move-object/from16 v0, v42

    move-object/from16 v1, v39

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/Phone;->isOtaSpNumber(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_31

    const/16 v36, 0x1

    .line 1969
    .local v36, isOtaspNumber:Z
    :goto_7
    if-eqz v35, :cond_f

    if-eqz v40, :cond_32

    :cond_f
    if-nez v36, :cond_32

    const/16 v41, 0x1

    .line 1973
    .local v41, okToLogThisCall:Z
    :goto_8
    if-eqz v41, :cond_14

    .line 1975
    const/4 v13, 0x0

    .line 1977
    .local v13, simIdEx:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v4

    if-eqz v4, :cond_10

    if-eqz v37, :cond_35

    .line 1978
    :cond_10
    if-eqz v37, :cond_33

    .line 1979
    const/4 v13, -0x2

    .line 1997
    :cond_11
    :goto_9
    new-instance v3, Lcom/android/phone/CallLogAsync$AddCallArgs;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-direct/range {v3 .. v13}, Lcom/android/phone/CallLogAsync$AddCallArgs;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;IIJJI)V

    .line 2023
    .local v3, args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    :goto_a
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCallLog:Lcom/android/phone/CallLogAsync;

    invoke-virtual {v4, v3}, Lcom/android/phone/CallLogAsync;->addCall(Lcom/android/phone/CallLogAsync$AddCallArgs;)Landroid/os/AsyncTask;

    .line 2025
    const/16 v4, 0x384

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/phone/CallNotifier;->readNVData(I)I

    move-result v43

    .line 2026
    .local v43, registerflag:I
    if-nez v43, :cond_13

    .line 2027
    const/16 v4, 0x385

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/phone/CallNotifier;->readNVData(I)I

    move-result v29

    .line 2028
    .local v29, callP1:I
    const/16 v4, 0x3c

    move/from16 v0, v29

    if-ge v0, v4, :cond_13

    .line 2029
    iget v0, v3, Lcom/android/phone/CallLogAsync$AddCallArgs;->durationInSec:I

    move/from16 v33, v0

    .line 2030
    .local v33, iduration:I
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "OTA phone -iduration="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move/from16 v0, v33

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 2031
    rem-int/lit8 v4, v33, 0x3c

    if-lez v4, :cond_37

    .line 2032
    div-int/lit8 v4, v33, 0x3c

    add-int/lit8 v33, v4, 0x1

    .line 2035
    :goto_b
    add-int v38, v33, v29

    .line 2036
    .local v38, nTol:I
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "OTA phone nTol="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move/from16 v0, v38

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 2037
    const/16 v4, 0x3c

    move/from16 v0, v38

    if-lt v0, v4, :cond_12

    const/16 v38, 0x3c

    .line 2038
    :cond_12
    const/16 v4, 0x385

    move-object/from16 v0, p0

    move/from16 v1, v38

    invoke-virtual {v0, v4, v1}, Lcom/android/phone/CallNotifier;->writeNVData(II)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2053
    .end local v29           #callP1:I
    .end local v33           #iduration:I
    .end local v38           #nTol:I
    .end local v43           #registerflag:I
    :cond_13
    :goto_c
    if-nez v35, :cond_14

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v4

    if-nez v4, :cond_14

    invoke-virtual/range {v28 .. v28}, Lcom/android/internal/telephony/Connection;->isVideo()Z

    move-result v4

    if-nez v4, :cond_14

    if-nez v37, :cond_14

    const-wide/16 v14, 0x2710

    cmp-long v4, v11, v14

    if-ltz v4, :cond_14

    .line 2055
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/calloption/CallOptionUtils;->getCurrentCountryISO(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v17

    .line 2057
    .local v17, countryISO:Ljava/lang/String;
    :try_start_1
    new-instance v4, Lcom/mediatek/phone/provider/CallHistoryAsync;

    invoke-direct {v4}, Lcom/mediatek/phone/provider/CallHistoryAsync;-><init>()V

    new-instance v14, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v15

    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v21

    move-object/from16 v16, v6

    move-wide/from16 v18, v9

    move/from16 v20, p2

    invoke-direct/range {v14 .. v21}, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JIZ)V

    invoke-virtual {v4, v14}, Lcom/mediatek/phone/provider/CallHistoryAsync;->addCall(Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;)Landroid/os/AsyncTask;
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2068
    .end local v3           #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    .end local v13           #simIdEx:I
    .end local v17           #countryISO:Ljava/lang/String;
    :cond_14
    :goto_d
    const/4 v4, 0x3

    if-ne v8, v4, :cond_15

    .line 2072
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v9, v10}, Lcom/android/phone/CallNotifier;->showMissedCallNotification(Lcom/android/internal/telephony/Connection;J)V

    .line 2079
    :cond_15
    if-eqz v47, :cond_16

    .line 2080
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "- starting post-disconnect tone ("

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v47

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v14, ")..."

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2081
    new-instance v4, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    move-object/from16 v0, p0

    move/from16 v1, v47

    invoke-direct {v4, v0, v1}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/android/phone/CallNotifier;->mToneThread:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 2082
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mToneThread:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v4}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 2094
    :cond_16
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mPreviousCdmaCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v14, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    if-eq v4, v14, :cond_17

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mPreviousCdmaCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v14, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-ne v4, v14, :cond_18

    :cond_17
    if-nez v35, :cond_18

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_MISSED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_18

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_18

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_18

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_18

    .line 2101
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    if-nez v4, :cond_39

    .line 2102
    const/4 v4, 0x1

    move/from16 v0, v24

    if-ne v0, v4, :cond_38

    .line 2105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v18, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v19, v42

    move-object/from16 v20, v39

    invoke-static/range {v18 .. v23}, Lcom/android/phone/PhoneUtils;->placeCall(Landroid/content/Context;Lcom/android/internal/telephony/Phone;Ljava/lang/String;Landroid/net/Uri;ZLandroid/net/Uri;)I

    .line 2106
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    .line 2115
    .end local v5           #ci:Lcom/android/internal/telephony/CallerInfo;
    .end local v6           #logNumber:Ljava/lang/String;
    .end local v7           #presentation:I
    .end local v8           #callLogType:I
    .end local v9           #date:J
    .end local v11           #duration:J
    .end local v30           #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    .end local v35           #isEmergencyNumber:Z
    .end local v36           #isOtaspNumber:Z
    .end local v39           #number:Ljava/lang/String;
    .end local v40           #okToLogEmergencyNumber:Z
    .end local v41           #okToLogThisCall:Z
    .end local v42           #phone:Lcom/android/internal/telephony/Phone;
    .end local v48           #vtCall:I
    :cond_18
    :goto_e
    return-void

    .line 1596
    .end local v24           #autoretrySetting:I
    .end local v25           #bBg:Lcom/android/internal/telephony/Call;
    .end local v26           #bFg:Lcom/android/internal/telephony/Call;
    .end local v27           #bg:Lcom/android/internal/telephony/Call;
    .end local v28           #c:Lcom/android/internal/telephony/Connection;
    .end local v32           #fg:Lcom/android/internal/telephony/Call;
    .end local v44           #ringingCall:Lcom/android/internal/telephony/Call;
    .end local v47           #toneToPlay:I
    :cond_19
    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    move-object/from16 v0, v46

    if-ne v0, v4, :cond_0

    .line 1597
    const-string v4, "state == PhoneConstants.State.RINGING"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1598
    const/16 v4, 0x2a

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1599
    const/16 v4, 0x2a

    const-wide/16 v14, 0x7d0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v14, v15}, Lcom/android/phone/CallNotifier;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 1611
    .restart local v28       #c:Lcom/android/internal/telephony/Connection;
    :cond_1a
    const-string v4, "CallNotifier"

    const-string v14, "onDisconnect: null connection"

    invoke-static {v4, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1641
    .restart local v24       #autoretrySetting:I
    :cond_1b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    iget-object v4, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    const/4 v14, 0x0

    iput v14, v4, Lcom/android/phone/InCallUiState$FakeCall;->slotId:I

    goto/16 :goto_2

    .line 1647
    :cond_1c
    const-string v4, "Don\'t meet the case clear disconnect call information!!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1648
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    const/4 v14, 0x0

    iput-object v14, v4, Lcom/android/phone/InCallUiState;->latestDisconnectCall:Lcom/android/phone/InCallUiState$FakeCall;

    goto/16 :goto_3

    .line 1708
    .restart local v44       #ringingCall:Lcom/android/internal/telephony/Call;
    :cond_1d
    const-string v4, "stopRing()... (onDisconnect)"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1709
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v4}, Lcom/android/phone/Ringer;->stopRing()V

    goto/16 :goto_4

    .line 1712
    :cond_1e
    const-string v4, "stopRing()... (onDisconnect)"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1713
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v4}, Lcom/android/phone/Ringer;->stopRing()V

    .line 1714
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v4

    if-eqz v4, :cond_4

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    move-object/from16 v0, v46

    if-ne v0, v4, :cond_4

    .line 1716
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v4}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/phone/CallNotifier;->switchRingToneByNeeded(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_4

    .line 1745
    .restart local v30       #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    .restart local v47       #toneToPlay:I
    :cond_1f
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->CONGESTION:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_20

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->BEARER_NOT_AVAIL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_20

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->NO_CIRCUIT_AVAIL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_21

    .line 1748
    :cond_20
    const-string v4, "- need to play CONGESTION tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1749
    const/16 v47, 0x3

    goto/16 :goto_5

    .line 1750
    :cond_21
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_22

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_23

    :cond_22
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->isOtaCallInActiveState()Z

    move-result v4

    if-eqz v4, :cond_23

    .line 1753
    const-string v4, "- need to play OTA_CALL_END tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1754
    const/16 v47, 0xb

    goto/16 :goto_5

    .line 1755
    :cond_23
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->CDMA_REORDER:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_24

    .line 1756
    const-string v4, "- need to play CDMA_REORDER tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1757
    const/16 v47, 0x6

    goto/16 :goto_5

    .line 1758
    :cond_24
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->CDMA_INTERCEPT:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_25

    .line 1759
    const-string v4, "- need to play CDMA_INTERCEPT tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1760
    const/16 v47, 0x7

    goto/16 :goto_5

    .line 1761
    :cond_25
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->CDMA_DROP:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_26

    .line 1762
    const-string v4, "- need to play CDMA_DROP tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1763
    const/16 v47, 0x8

    goto/16 :goto_5

    .line 1764
    :cond_26
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->OUT_OF_SERVICE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_27

    .line 1765
    const-string v4, "- need to play OUT OF SERVICE tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1766
    const/16 v47, 0x9

    goto/16 :goto_5

    .line 1767
    :cond_27
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->UNOBTAINABLE_NUMBER:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_28

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->INVALID_NUMBER_FORMAT:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-eq v0, v4, :cond_28

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->INVALID_NUMBER:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_2a

    .line 1771
    :cond_28
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v4

    if-eqz v4, :cond_29

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/phone/InCallScreen;->isFinishing()Z

    move-result v4

    if-eqz v4, :cond_29

    .line 1774
    const-string v4, "display incallscreen again!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1775
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lcom/android/phone/CallNotifier;->initFakeCall(Lcom/android/internal/telephony/Connection;I)V

    .line 1776
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v14, 0x1

    invoke-virtual {v4, v14}, Lcom/android/phone/PhoneGlobals;->displayCallScreen(Z)V

    .line 1779
    :cond_29
    const-string v4, "- need to play TONE_UNOBTAINABLE_NUMBER tone!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1780
    const/16 v47, 0xd

    goto/16 :goto_5

    .line 1781
    :cond_2a
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_2b

    .line 1782
    const-string v4, "- DisconnectCause is ERROR_UNSPECIFIED: play TONE_CALL_ENDED!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1783
    const/16 v47, 0x4

    goto/16 :goto_5

    .line 1784
    :cond_2b
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->FDN_BLOCKED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_7

    .line 1791
    const-string v4, "cause is FDN_BLOCKED"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1793
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->inCallUiState:Lcom/android/phone/InCallUiState;

    sget-object v14, Lcom/android/phone/Constants$CallStatusCode;->FDN_BLOCKED:Lcom/android/phone/Constants$CallStatusCode;

    invoke-virtual {v4, v14}, Lcom/android/phone/InCallUiState;->setPendingCallStatusCode(Lcom/android/phone/Constants$CallStatusCode;)V

    .line 1795
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v4

    if-eqz v4, :cond_2c

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/phone/InCallScreen;->isFinishing()Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 1798
    const-string v4, "display incallscreen again!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1799
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lcom/android/phone/CallNotifier;->initFakeCall(Lcom/android/internal/telephony/Connection;I)V

    .line 1800
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v14, 0x1

    invoke-virtual {v4, v14}, Lcom/android/phone/PhoneGlobals;->displayCallScreen(Z)V

    goto/16 :goto_5

    .line 1801
    :cond_2c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v4

    if-eqz v4, :cond_2d

    .line 1803
    const-string v4, "incall screen not null, do nothing.!"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 1806
    :cond_2d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v14, 0x1

    invoke-virtual {v4, v14}, Lcom/android/phone/PhoneGlobals;->displayCallScreen(Z)V

    goto/16 :goto_5

    .line 1922
    .restart local v9       #date:J
    .restart local v11       #duration:J
    .restart local v25       #bBg:Lcom/android/internal/telephony/Call;
    .restart local v26       #bFg:Lcom/android/internal/telephony/Call;
    .restart local v27       #bg:Lcom/android/internal/telephony/Call;
    .restart local v32       #fg:Lcom/android/internal/telephony/Call;
    .restart local v35       #isEmergencyNumber:Z
    .restart local v39       #number:Ljava/lang/String;
    .restart local v42       #phone:Lcom/android/internal/telephony/Phone;
    .restart local v48       #vtCall:I
    :cond_2e
    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_MISSED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-object/from16 v0, v30

    if-ne v0, v4, :cond_2f

    const/4 v8, 0x3

    goto/16 :goto_6

    :cond_2f
    const/4 v8, 0x1

    goto/16 :goto_6

    .line 1926
    :cond_30
    const/4 v8, 0x2

    .restart local v8       #callLogType:I
    goto/16 :goto_6

    .line 1964
    .restart local v5       #ci:Lcom/android/internal/telephony/CallerInfo;
    .restart local v6       #logNumber:Ljava/lang/String;
    .restart local v7       #presentation:I
    .restart local v40       #okToLogEmergencyNumber:Z
    :cond_31
    const/16 v36, 0x0

    goto/16 :goto_7

    .line 1969
    .restart local v36       #isOtaspNumber:Z
    :cond_32
    const/16 v41, 0x0

    goto/16 :goto_8

    .line 1981
    .restart local v13       #simIdEx:I
    .restart local v41       #okToLogThisCall:Z
    :cond_33
    const/4 v13, 0x0

    .line 1982
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v4}, Lcom/android/phone/PhoneInterfaceManager;->hasIccCard()Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1983
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v4

    const/4 v14, 0x0

    invoke-virtual {v4, v14}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoBySlot(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v34

    .line 1984
    .local v34, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v34, :cond_34

    .line 1985
    move-object/from16 v0, v34

    iget-wide v14, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    long-to-int v13, v14

    goto/16 :goto_9

    .line 1988
    :cond_34
    const/4 v13, 0x1

    goto/16 :goto_9

    .line 2004
    .end local v34           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_35
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    iget-object v4, v4, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/android/phone/PhoneInterfaceManager;->hasIccCardGemini(I)Z

    move-result v4

    if-eqz v4, :cond_36

    .line 2005
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    move/from16 v0, p2

    invoke-static {v4, v0}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v45

    .line 2006
    .local v45, si:Landroid/provider/Telephony$SIMInfo;
    if-eqz v45, :cond_36

    .line 2007
    move-object/from16 v0, v45

    iget-wide v14, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    long-to-int v13, v14

    .line 2016
    .end local v45           #si:Landroid/provider/Telephony$SIMInfo;
    :cond_36
    new-instance v3, Lcom/android/phone/CallLogAsync$AddCallArgs;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-direct/range {v3 .. v13}, Lcom/android/phone/CallLogAsync$AddCallArgs;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;IIJJI)V

    .restart local v3       #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    goto/16 :goto_a

    .line 2034
    .restart local v29       #callP1:I
    .restart local v33       #iduration:I
    .restart local v43       #registerflag:I
    :cond_37
    :try_start_2
    div-int/lit8 v33, v33, 0x3c
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_b

    .line 2045
    .end local v29           #callP1:I
    .end local v33           #iduration:I
    .end local v43           #registerflag:I
    :catch_0
    move-exception v31

    .line 2047
    .local v31, e:Landroid/database/sqlite/SQLiteDiskIOException;
    const-string v4, "CallNotifier"

    const-string v14, "Error!! - onDisconnect() Disk Full!"

    invoke-static {v4, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2048
    invoke-virtual/range {v31 .. v31}, Landroid/database/sqlite/SQLiteDiskIOException;->printStackTrace()V

    goto/16 :goto_c

    .line 2059
    .end local v31           #e:Landroid/database/sqlite/SQLiteDiskIOException;
    .restart local v17       #countryISO:Ljava/lang/String;
    :catch_1
    move-exception v31

    .line 2061
    .restart local v31       #e:Landroid/database/sqlite/SQLiteDiskIOException;
    const-string v4, "CallNotifier"

    const-string v14, "Error!! - onDisconnect() Disk Full!"

    invoke-static {v4, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2062
    invoke-virtual/range {v31 .. v31}, Landroid/database/sqlite/SQLiteDiskIOException;->printStackTrace()V

    goto/16 :goto_d

    .line 2108
    .end local v3           #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    .end local v13           #simIdEx:I
    .end local v17           #countryISO:Ljava/lang/String;
    .end local v31           #e:Landroid/database/sqlite/SQLiteDiskIOException;
    :cond_38
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    goto/16 :goto_e

    .line 2111
    :cond_39
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    goto/16 :goto_e
.end method

.method private onDisconnectForVTWaiting(Landroid/os/AsyncResult;I)V
    .locals 29
    .parameter "r"
    .parameter "simId"

    .prologue
    .line 3078
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onDisconnectForVTWaiting()... , sim id : "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3080
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, Lcom/android/internal/telephony/Connection;

    .line 3082
    .local v16, c:Lcom/android/internal/telephony/Connection;
    if-eqz v16, :cond_4

    .line 3084
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v24

    .line 3085
    .local v24, number:Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->getCreateTime()J

    move-result-wide v10

    .line 3086
    .local v10, date:J
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->getDurationMillis()J

    move-result-wide v12

    .line 3087
    .local v12, duration:J
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v18

    .line 3088
    .local v18, cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v25

    .line 3090
    .local v25, phone:Lcom/android/internal/telephony/Phone;
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v5

    const/4 v9, 0x3

    if-ne v5, v9, :cond_5

    const/16 v22, 0x1

    .line 3093
    .local v22, isSipCall:Z
    :goto_0
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->isVideo()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 3094
    const/4 v15, 0x1

    .line 3099
    .local v15, vtCall:I
    :goto_1
    const/16 v17, 0x3

    .line 3101
    .local v17, callLogType:I
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/phone/CallNotifier;->getCallerInfoFromConnection(Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v6

    .line 3102
    .local v6, ci:Lcom/android/internal/telephony/CallerInfo;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v6}, Lcom/android/phone/CallNotifier;->getLogNumber(Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfo;)Ljava/lang/String;

    move-result-object v7

    .line 3103
    .local v7, logNumber:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v6}, Lcom/android/phone/CallNotifier;->getPresentation(Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfo;)I

    move-result v8

    .line 3106
    .local v8, presentation:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v22, :cond_8

    .line 3108
    :cond_0
    if-eqz v22, :cond_7

    .line 3109
    const/4 v14, -0x2

    .line 3117
    .local v14, simIdEx:I
    :cond_1
    :goto_2
    new-instance v4, Lcom/android/phone/CallLogAsync$AddCallArgs;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v9, 0x3

    invoke-direct/range {v4 .. v15}, Lcom/android/phone/CallLogAsync$AddCallArgs;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;IIJJII)V

    .line 3137
    .local v4, args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    :goto_3
    if-nez v22, :cond_3

    .line 3138
    const-wide/16 v19, 0xbb8

    .line 3139
    .local v19, delayMillis:J
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v23

    .line 3140
    .local v23, message:Landroid/os/Message;
    const/16 v5, 0x12

    move-object/from16 v0, v23

    iput v5, v0, Landroid/os/Message;->what:I

    .line 3141
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallNotifier;->mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-nez v5, :cond_2

    .line 3142
    new-instance v5, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    const/4 v9, 0x1

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v9}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/phone/CallNotifier;->mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 3143
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallNotifier;->mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v5}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 3146
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-wide/from16 v2, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/phone/CallNotifier;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 3147
    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/Connection;->isVideo()Z

    move-result v5

    if-eqz v5, :cond_a

    .line 3148
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v9, 0x7f0d0072

    const/16 v27, 0x1

    move/from16 v0, v27

    invoke-static {v5, v9, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 3158
    .end local v19           #delayMillis:J
    .end local v23           #message:Landroid/os/Message;
    :cond_3
    :goto_4
    :try_start_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallNotifier;->mCallLog:Lcom/android/phone/CallLogAsync;

    invoke-virtual {v5, v4}, Lcom/android/phone/CallLogAsync;->addCall(Lcom/android/phone/CallLogAsync$AddCallArgs;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3164
    :goto_5
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v10, v11}, Lcom/android/phone/CallNotifier;->showMissedCallNotification(Lcom/android/internal/telephony/Connection;J)V

    .line 3167
    .end local v4           #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    .end local v6           #ci:Lcom/android/internal/telephony/CallerInfo;
    .end local v7           #logNumber:Ljava/lang/String;
    .end local v8           #presentation:I
    .end local v10           #date:J
    .end local v12           #duration:J
    .end local v14           #simIdEx:I
    .end local v15           #vtCall:I
    .end local v17           #callLogType:I
    .end local v18           #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    .end local v22           #isSipCall:Z
    .end local v24           #number:Ljava/lang/String;
    .end local v25           #phone:Lcom/android/internal/telephony/Phone;
    :cond_4
    return-void

    .line 3090
    .restart local v10       #date:J
    .restart local v12       #duration:J
    .restart local v18       #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    .restart local v24       #number:Ljava/lang/String;
    .restart local v25       #phone:Lcom/android/internal/telephony/Phone;
    :cond_5
    const/16 v22, 0x0

    goto/16 :goto_0

    .line 3096
    .restart local v22       #isSipCall:Z
    :cond_6
    const/4 v15, 0x0

    .restart local v15       #vtCall:I
    goto/16 :goto_1

    .line 3111
    .restart local v6       #ci:Lcom/android/internal/telephony/CallerInfo;
    .restart local v7       #logNumber:Ljava/lang/String;
    .restart local v8       #presentation:I
    .restart local v17       #callLogType:I
    :cond_7
    const/4 v14, 0x0

    .line 3112
    .restart local v14       #simIdEx:I
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    iget-object v5, v5, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v5}, Lcom/android/phone/PhoneInterfaceManager;->hasIccCard()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3113
    const/4 v14, 0x1

    goto :goto_2

    .line 3123
    .end local v14           #simIdEx:I
    :cond_8
    const/4 v14, 0x0

    .line 3124
    .restart local v14       #simIdEx:I
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    iget-object v5, v5, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    move/from16 v0, p2

    invoke-virtual {v5, v0}, Lcom/android/phone/PhoneInterfaceManager;->hasIccCardGemini(I)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 3125
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    move/from16 v0, p2

    invoke-static {v5, v0}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v26

    .line 3127
    .local v26, si:Landroid/provider/Telephony$SIMInfo;
    if-eqz v26, :cond_9

    .line 3128
    move-object/from16 v0, v26

    iget-wide v0, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v27, v0

    move-wide/from16 v0, v27

    long-to-int v14, v0

    .line 3132
    .end local v26           #si:Landroid/provider/Telephony$SIMInfo;
    :cond_9
    new-instance v4, Lcom/android/phone/CallLogAsync$AddCallArgs;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v9, 0x3

    invoke-direct/range {v4 .. v15}, Lcom/android/phone/CallLogAsync$AddCallArgs;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;IIJJII)V

    .restart local v4       #args:Lcom/android/phone/CallLogAsync$AddCallArgs;
    goto/16 :goto_3

    .line 3151
    .restart local v19       #delayMillis:J
    .restart local v23       #message:Landroid/os/Message;
    :cond_a
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v9, 0x7f0d0073

    const/16 v27, 0x1

    move/from16 v0, v27

    invoke-static {v5, v9, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_4

    .line 3159
    .end local v19           #delayMillis:J
    .end local v23           #message:Landroid/os/Message;
    :catch_0
    move-exception v21

    .line 3161
    .local v21, e:Landroid/database/sqlite/SQLiteDiskIOException;
    const-string v5, "CallNotifier"

    const-string v9, "Error!! - onDisconnect() Disk Full!"

    invoke-static {v5, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3162
    invoke-virtual/range {v21 .. v21}, Landroid/database/sqlite/SQLiteDiskIOException;->printStackTrace()V

    goto :goto_5
.end method

.method private onDisplayInfo(Landroid/os/AsyncResult;)V
    .locals 5
    .parameter "r"

    .prologue
    .line 2525
    iget-object v2, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaDisplayInfoRec;

    move-object v1, v2

    check-cast v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaDisplayInfoRec;

    .line 2527
    .local v1, displayInfoRec:Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaDisplayInfoRec;
    if-eqz v1, :cond_0

    .line 2528
    iget-object v0, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaDisplayInfoRec;->alpha:Ljava/lang/String;

    .line 2529
    .local v0, displayInfo:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDisplayInfo: displayInfo="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2530
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-static {v2, v0}, Lcom/android/phone/CdmaDisplayInfo;->displayInfoRecord(Landroid/content/Context;Ljava/lang/String;)V

    .line 2533
    const/16 v2, 0x18

    const-wide/16 v3, 0x7d0

    invoke-virtual {p0, v2, v3, v4}, Lcom/android/phone/CallNotifier;->sendEmptyMessageDelayed(IJ)Z

    .line 2536
    .end local v0           #displayInfo:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private onMwiChanged(ZI)V
    .locals 2
    .parameter "visible"
    .parameter "simId"

    .prologue
    .line 2135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onMwiChanged(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "simid:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2139
    sget-boolean v0, Lcom/android/phone/PhoneGlobals;->sVoiceCapable:Z

    if-nez v0, :cond_0

    .line 2145
    const-string v0, "CallNotifier"

    const-string v1, "Got onMwiChanged() on non-voice-capable device! Ignoring..."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2150
    :goto_0
    return-void

    .line 2149
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v0, p1, p2}, Lcom/android/phone/NotificationMgr;->updateMwi(ZI)V

    goto :goto_0
.end method

.method private onNewRingingConnection(Landroid/os/AsyncResult;)V
    .locals 9
    .parameter "r"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 530
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 531
    .local v0, c:Lcom/android/internal/telephony/Connection;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onNewRingingConnection(): state = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", conn = { "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " }"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 532
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v3

    .line 533
    .local v3, ringing:Lcom/android/internal/telephony/Call;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    .line 535
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    iput-boolean v7, p0, Lcom/android/phone/CallNotifier;->ok2Ring:Z

    .line 537
    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->ignoreAllIncomingCalls(Lcom/android/internal/telephony/Phone;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 542
    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->hangupRingingCall(Lcom/android/internal/telephony/Call;)Z

    .line 543
    iput-boolean v8, p0, Lcom/android/phone/CallNotifier;->ok2Ring:Z

    .line 684
    :goto_0
    return-void

    .line 547
    :cond_0
    if-nez v0, :cond_1

    .line 548
    const-string v5, "CallNotifier"

    const-string v6, "CallNotifier.onNewRingingConnection(): null connection!"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 553
    :cond_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->isRinging()Z

    move-result v5

    if-nez v5, :cond_2

    .line 554
    const-string v5, "CallNotifier"

    const-string v6, "CallNotifier.onNewRingingConnection(): connection not ringing!"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 563
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 564
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-nez v5, :cond_3

    .line 565
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v5

    iput-object v5, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    .line 569
    :cond_3
    if-eqz v3, :cond_5

    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v5, v3}, Lcom/mediatek/phone/DualTalkUtils;->isAllowedIncomingCall(Lcom/android/internal/telephony/Call;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 570
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/mediatek/phone/DualTalkUtils;->switchPhoneByNeededForRing(Lcom/android/internal/telephony/Phone;)V

    .line 582
    :cond_4
    invoke-virtual {p0}, Lcom/android/phone/CallNotifier;->stopSignalInfoTone()V

    .line 584
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    .line 586
    .local v4, state:Lcom/android/internal/telephony/Call$State;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "- connection is ringing!  state = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 620
    invoke-static {v4}, Lcom/android/phone/PhoneUtils;->isRealIncomingCall(Lcom/android/internal/telephony/Call$State;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 621
    invoke-static {v7}, Lcom/android/phone/PhoneUtils;->setAudioControlState(I)V

    .line 622
    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->startIncomingCallQuery(Lcom/android/internal/telephony/Connection;)V

    .line 628
    invoke-static {}, Lcom/android/phone/PhoneUtils;->setAudioMode()V

    .line 683
    :goto_1
    const-string v5, "- onNewRingingConnection() done."

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 573
    .end local v4           #state:Lcom/android/internal/telephony/Call$State;
    :cond_5
    :try_start_0
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->hangup()V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 574
    :catch_0
    move-exception v1

    .line 575
    .local v1, e:Lcom/android/internal/telephony/CallStateException;
    invoke-virtual {v1}, Lcom/android/internal/telephony/CallStateException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 632
    .end local v1           #e:Lcom/android/internal/telephony/CallStateException;
    .restart local v4       #state:Lcom/android/internal/telephony/Call$State;
    :cond_6
    const-string v5, "- starting call waiting tone..."

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 633
    sput-boolean v8, Lcom/android/phone/CallNotifier;->mIsWaitingQueryComplete:Z

    .line 634
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-nez v5, :cond_7

    .line 635
    new-instance v5, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-direct {v5, p0, v7}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    iput-object v5, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 636
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v5}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 638
    :cond_7
    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->startIncomingCallQuery(Lcom/android/internal/telephony/Connection;)V

    goto :goto_1
.end method

.method private onPhoneStateChanged(Landroid/os/AsyncResult;)V
    .locals 11
    .parameter "r"

    .prologue
    .line 1066
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v6

    .line 1067
    .local v6, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onPhoneStateChanged: state = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1069
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1070
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    if-nez v8, :cond_0

    .line 1071
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v8

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    .line 1073
    :cond_0
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v8}, Lcom/mediatek/phone/DualTalkUtils;->updateState()V

    .line 1076
    :cond_1
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mVibrator:Landroid/os/Vibrator;

    if-nez v8, :cond_2

    .line 1077
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "vibrator"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/Vibrator;

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mVibrator:Landroid/os/Vibrator;

    .line 1085
    :cond_2
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v8, v8, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v9, v8, Lcom/android/phone/NotificationMgr;->statusBarHelper:Lcom/android/phone/NotificationMgr$StatusBarHelper;

    sget-object v8, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v6, v8, :cond_11

    const/4 v8, 0x1

    :goto_0
    invoke-virtual {v9, v8}, Lcom/android/phone/NotificationMgr$StatusBarHelper;->enableNotificationAlerts(Z)V

    .line 1088
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    .line 1089
    .local v4, fgPhone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_6

    .line 1090
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v8, v9, :cond_5

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCdmaCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v9, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_3

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCdmaCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v9, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-ne v8, v9, :cond_5

    .line 1093
    :cond_3
    iget-boolean v8, p0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    if-eqz v8, :cond_4

    .line 1094
    const/16 v7, 0xa

    .line 1095
    .local v7, toneToPlay:I
    new-instance v8, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-direct {v8, p0, v7}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    invoke-virtual {v8}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 1098
    .end local v7           #toneToPlay:I
    :cond_4
    invoke-virtual {p0}, Lcom/android/phone/CallNotifier;->stopSignalInfoTone()V

    .line 1100
    :cond_5
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCdmaCallState:Lcom/android/internal/telephony/Call$State;

    .line 1107
    :cond_6
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v8, v6}, Lcom/android/phone/PhoneGlobals;->updatePhoneState(Lcom/android/internal/telephony/PhoneConstants$State;)V

    .line 1114
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/android/phone/PhoneGlobals;->updateBluetoothIndication(Z)V

    .line 1116
    sget-object v8, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v6, v8, :cond_13

    .line 1118
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-eqz v8, :cond_7

    .line 1119
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v8}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->stopTone()V

    .line 1120
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 1123
    :cond_7
    const/4 v8, 0x2

    invoke-static {v8}, Lcom/android/phone/PhoneUtils;->setAudioControlState(I)V

    .line 1124
    const-string v8, "onPhoneStateChanged: OFF HOOK"

    invoke-direct {p0, v8}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1131
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    .line 1135
    .local v3, callState:Lcom/android/internal/telephony/Call$State;
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v8}, Landroid/media/AudioManager;->getMode()I

    move-result v8

    const/4 v9, 0x2

    if-eq v8, v9, :cond_12

    .line 1136
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v8}, Lcom/android/phone/PhoneUtils;->setAudioMode(Lcom/android/internal/telephony/CallManager;)V

    .line 1143
    :cond_8
    :goto_1
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->isShowingCallScreen()Z

    move-result v8

    if-nez v8, :cond_9

    .line 1144
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    sget-object v9, Lcom/android/phone/PhoneGlobals$WakeState;->SLEEP:Lcom/android/phone/PhoneGlobals$WakeState;

    invoke-virtual {v8, v9}, Lcom/android/phone/PhoneGlobals;->requestWakeState(Lcom/android/phone/PhoneGlobals$WakeState;)V

    .line 1153
    :cond_9
    const-string v8, "stopRing()... (OFFHOOK state)"

    invoke-direct {p0, v8}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1154
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v8}, Lcom/android/phone/Ringer;->stopRing()V

    .line 1169
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "power"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/PowerManager;

    .line 1170
    .local v5, pm:Landroid/os/PowerManager;
    invoke-virtual {v5}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v8

    if-eqz v8, :cond_a

    .line 1171
    const-string v8, "- posting UPDATE_IN_CALL_NOTIFICATION request..."

    invoke-direct {p0, v8}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1173
    const/16 v8, 0x1b

    invoke-virtual {p0, v8}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1174
    const/16 v0, 0x3e8

    .line 1175
    .local v0, IN_CALL_NOTIFICATION_UPDATE_DELAY:I
    const/16 v8, 0x1b

    const-wide/16 v9, 0x3e8

    invoke-virtual {p0, v8, v9, v10}, Lcom/android/phone/CallNotifier;->sendEmptyMessageDelayed(IJ)Z

    .line 1189
    .end local v0           #IN_CALL_NOTIFICATION_UPDATE_DELAY:I
    .end local v3           #callState:Lcom/android/internal/telephony/Call$State;
    .end local v5           #pm:Landroid/os/PowerManager;
    :cond_a
    :goto_2
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_d

    .line 1190
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    .line 1191
    .local v2, c:Lcom/android/internal/telephony/Connection;
    if-eqz v2, :cond_d

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-static {v8, v9}, Landroid/telephony/PhoneNumberUtils;->isLocalEmergencyNumber(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 1193
    const-string v8, "onPhoneStateChanged: it is an emergency call."

    invoke-direct {p0, v8}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1194
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    .line 1195
    .restart local v3       #callState:Lcom/android/internal/telephony/Call$State;
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    if-nez v8, :cond_b

    .line 1196
    new-instance v8, Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    invoke-direct {v8, p0}, Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;-><init>(Lcom/android/phone/CallNotifier;)V

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    .line 1199
    :cond_b
    sget-object v8, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    if-eq v3, v8, :cond_c

    sget-object v8, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v8, :cond_15

    .line 1200
    :cond_c
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "emergency_tone"

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v8

    iput v8, p0, Lcom/android/phone/CallNotifier;->mIsEmergencyToneOn:I

    .line 1203
    iget v8, p0, Lcom/android/phone/CallNotifier;->mIsEmergencyToneOn:I

    if-eqz v8, :cond_d

    iget v8, p0, Lcom/android/phone/CallNotifier;->mCurrentEmergencyToneState:I

    if-nez v8, :cond_d

    .line 1205
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    if-eqz v8, :cond_d

    .line 1206
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    #calls: Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;->start()V
    invoke-static {v8}, Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;->access$000(Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;)V

    .line 1219
    .end local v2           #c:Lcom/android/internal/telephony/Connection;
    .end local v3           #callState:Lcom/android/internal/telephony/Call$State;
    :cond_d
    :goto_3
    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v8

    const/4 v9, 0x1

    if-eq v8, v9, :cond_e

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v8

    const/4 v9, 0x3

    if-ne v8, v9, :cond_f

    .line 1221
    :cond_e
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    .line 1222
    .restart local v3       #callState:Lcom/android/internal/telephony/Call$State;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v8

    if-nez v8, :cond_f

    .line 1225
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-eqz v8, :cond_f

    .line 1226
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v8}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->stopTone()V

    .line 1227
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 1233
    .end local v3           #callState:Lcom/android/internal/telephony/Call$State;
    :cond_f
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v8, v9, :cond_10

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v9, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_10

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v9, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_10

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v9, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_10

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v9, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_10

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    sget-object v9, Lcom/android/internal/telephony/Call$State;->DISCONNECTING:Lcom/android/internal/telephony/Call$State;

    if-eq v8, v9, :cond_10

    .line 1239
    const-string v8, "CallNotifier"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onPhoneStateChanged mCM.getActiveFgCallState()= "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v10}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1240
    const-string v8, "CallNotifier"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onPhoneStateChanged mPreviousCallState= "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1241
    const/16 v1, 0x12c

    .line 1242
    .local v1, MO_CALL_VIBRATE_TIME:I
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mVibrator:Landroid/os/Vibrator;

    const-wide/16 v9, 0x12c

    invoke-virtual {v8, v9, v10}, Landroid/os/Vibrator;->vibrate(J)V

    .line 1244
    .end local v1           #MO_CALL_VIBRATE_TIME:I
    :cond_10
    const-string v8, "CallNotifier"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "before set value, mPreviousCallState= "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1245
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    .line 1246
    const-string v8, "CallNotifier"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "end after set value, mPreviousCallState= "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/phone/CallNotifier;->mPreviousCallState:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1248
    return-void

    .line 1085
    .end local v4           #fgPhone:Lcom/android/internal/telephony/Phone;
    :cond_11
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 1137
    .restart local v3       #callState:Lcom/android/internal/telephony/Call$State;
    .restart local v4       #fgPhone:Lcom/android/internal/telephony/Phone;
    :cond_12
    sget-object v8, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v8, :cond_8

    const-string v8, "TTY"

    invoke-static {v8}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1138
    invoke-static {}, Lcom/android/phone/PhoneUtils;->openTTY()V

    goto/16 :goto_1

    .line 1178
    .end local v3           #callState:Lcom/android/internal/telephony/Call$State;
    :cond_13
    sget-object v8, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v6, v8, :cond_a

    .line 1180
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_a

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v8

    if-nez v8, :cond_14

    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v8

    if-eqz v8, :cond_a

    .line 1181
    :cond_14
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-nez v8, :cond_a

    .line 1182
    new-instance v8, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    const/4 v9, 0x1

    invoke-direct {v8, p0, v9}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 1183
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v8}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 1184
    const-string v8, "Start waiting tone."

    invoke-direct {p0, v8}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1209
    .restart local v2       #c:Lcom/android/internal/telephony/Connection;
    .restart local v3       #callState:Lcom/android/internal/telephony/Call$State;
    :cond_15
    sget-object v8, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v8, :cond_d

    .line 1210
    iget v8, p0, Lcom/android/phone/CallNotifier;->mCurrentEmergencyToneState:I

    if-eqz v8, :cond_d

    .line 1211
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    if-eqz v8, :cond_d

    .line 1212
    iget-object v8, p0, Lcom/android/phone/CallNotifier;->mEmergencyTonePlayerVibrator:Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;

    #calls: Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;->stop()V
    invoke-static {v8}, Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;->access$100(Lcom/android/phone/CallNotifier$EmergencyTonePlayerVibrator;)V

    goto/16 :goto_3
.end method

.method private onResendMute()V
    .locals 2

    .prologue
    .line 2954
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getMute()Z

    move-result v0

    .line 2955
    .local v0, muteState:Z
    if-nez v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->setMute(Z)V

    .line 2956
    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->setMute(Z)V

    .line 2957
    return-void

    .line 2955
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private onRingbackTone(Landroid/os/AsyncResult;)V
    .locals 3
    .parameter "r"

    .prologue
    .line 2930
    iget-object v1, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 2932
    .local v0, playTone:Z
    if-eqz v0, :cond_1

    .line 2937
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-nez v1, :cond_0

    .line 2939
    new-instance v1, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    iput-object v1, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 2940
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v1}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 2948
    :cond_0
    :goto_0
    return-void

    .line 2943
    :cond_1
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-eqz v1, :cond_0

    .line 2944
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v1}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->stopTone()V

    .line 2945
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    goto :goto_0
.end method

.method private onSignalInfo(Landroid/os/AsyncResult;)V
    .locals 8
    .parameter "r"

    .prologue
    .line 2572
    sget-boolean v6, Lcom/android/phone/PhoneGlobals;->sVoiceCapable:Z

    if-nez v6, :cond_1

    .line 2573
    const-string v6, "CallNotifier"

    const-string v7, "Got onSignalInfo() on non-voice-capable device! Ignoring..."

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2604
    :cond_0
    :goto_0
    return-void

    .line 2577
    :cond_1
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-static {v6}, Lcom/android/phone/PhoneUtils;->isRealIncomingCall(Lcom/android/internal/telephony/Call$State;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2580
    invoke-virtual {p0}, Lcom/android/phone/CallNotifier;->stopSignalInfoTone()V

    goto :goto_0

    .line 2583
    :cond_2
    iget-object v6, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v6, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    move-object v1, v6

    check-cast v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    .line 2585
    .local v1, signalInfoRec:Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;
    if-eqz v1, :cond_0

    .line 2586
    iget-boolean v0, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->isPresent:Z

    .line 2587
    .local v0, isPresent:Z
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onSignalInfo: isPresent="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2588
    if-eqz v0, :cond_0

    .line 2589
    iget v5, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signalType:I

    .line 2590
    .local v5, uSignalType:I
    iget v3, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->alertPitch:I

    .line 2591
    .local v3, uAlertPitch:I
    iget v4, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signal:I

    .line 2593
    .local v4, uSignal:I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onSignalInfo: uSignalType="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uAlertPitch="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uSignal="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2596
    invoke-static {v5, v3, v4}, Lcom/android/internal/telephony/cdma/SignalToneUtil;->getAudioToneFromSignalInfo(III)I

    move-result v2

    .line 2600
    .local v2, toneID:I
    new-instance v6, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;

    invoke-direct {v6, p0, v2}, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    invoke-virtual {v6}, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;->start()V

    goto :goto_0
.end method

.method private onUnknownConnectionAppeared(Landroid/os/AsyncResult;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 994
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    .line 996
    .local v0, state:Lcom/android/internal/telephony/PhoneConstants$State;
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_0

    .line 998
    invoke-direct {p0, p1}, Lcom/android/phone/CallNotifier;->onPhoneStateChanged(Landroid/os/AsyncResult;)V

    .line 999
    const-string v1, "- showing incoming call (unknown connection appeared)..."

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1008
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->showIncomingCall()V

    .line 1011
    :cond_0
    return-void
.end method

.method private registerForNotifications()V
    .locals 8

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x7

    const/4 v5, 0x6

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1360
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 1362
    .local v0, callManager:Ljava/lang/Object;
    :goto_0
    invoke-static {v0, p0, v4}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1363
    const/4 v1, 0x2

    invoke-static {v0, p0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForNewRingingConnection(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1364
    sget-object v1, Lcom/android/phone/CallNotifier;->PHONE_DISCONNECT_GEMINI:[I

    invoke-static {v0, p0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForDisconnect(Ljava/lang/Object;Landroid/os/Handler;[I)V

    .line 1365
    const/4 v1, 0x4

    invoke-static {v0, p0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForUnknownConnection(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1366
    const/4 v1, 0x5

    invoke-static {v0, p0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForIncomingRing(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1369
    const/16 v1, 0xd

    invoke-static {v0, p0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForVtRingInfo(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1370
    const/16 v1, 0xf

    invoke-static {v0, p0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForVtReplaceDisconnect(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1372
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1375
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    const/16 v2, 0x19

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallManager;->registerForCdmaOtaStatusChange2(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1376
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, p0, v7, v3}, Lcom/android/internal/telephony/CallManager;->registerForCallWaiting2(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1377
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, p0, v5, v3}, Lcom/android/internal/telephony/CallManager;->registerForDisplayInfo2(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1378
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, p0, v6, v3}, Lcom/android/internal/telephony/CallManager;->registerForSignalInfo2(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1379
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    const/16 v2, 0x9

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallManager;->registerForInCallVoicePrivacyOn2(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1380
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    const/16 v2, 0xa

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallManager;->registerForInCallVoicePrivacyOff2(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1383
    :cond_0
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFgPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    if-ne v1, v4, :cond_3

    .line 1384
    const/16 v1, 0xb

    invoke-static {v0, p0, v1}, Lcom/mediatek/phone/gemini/GeminiRegister;->registerForRingbackTone(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 1385
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1386
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    const/16 v2, 0xc

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallManager;->registerForResendIncallMute(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1396
    :cond_1
    :goto_1
    return-void

    .line 1360
    .end local v0           #callManager:Ljava/lang/Object;
    :cond_2
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_0

    .line 1389
    .restart local v0       #callManager:Ljava/lang/Object;
    :cond_3
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    const/16 v2, 0x19

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallManager;->registerForCdmaOtaStatusChange(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1390
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, p0, v7, v3}, Lcom/android/internal/telephony/CallManager;->registerForCallWaiting(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1391
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, p0, v5, v3}, Lcom/android/internal/telephony/CallManager;->registerForDisplayInfo(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1392
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, p0, v6, v3}, Lcom/android/internal/telephony/CallManager;->registerForSignalInfo(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1393
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    const/16 v2, 0x9

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallManager;->registerForInCallVoicePrivacyOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1394
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    const/16 v2, 0xa

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/CallManager;->registerForInCallVoicePrivacyOff(Landroid/os/Handler;ILjava/lang/Object;)V

    goto :goto_1
.end method

.method private resetAudioStateAfterDisconnect()V
    .locals 3

    .prologue
    .line 2121
    const-string v0, "resetAudioStateAfterDisconnect()..."

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2123
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v0, :cond_0

    .line 2124
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothHeadset;->disconnectAudio()Z

    .line 2129
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 2131
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->setAudioMode(Lcom/android/internal/telephony/CallManager;)V

    .line 2132
    return-void
.end method

.method private setDefaultRingtoneUri(Lcom/android/internal/telephony/Connection;)V
    .locals 3
    .parameter "c"

    .prologue
    .line 3430
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->callerInfoCache:Lcom/android/phone/CallerInfoCache;

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/phone/CallerInfoCache;->getCacheEntry(Ljava/lang/String;)Lcom/android/phone/CallerInfoCache$CacheEntry;

    move-result-object v0

    .line 3431
    .local v0, entry:Lcom/android/phone/CallerInfoCache$CacheEntry;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/android/phone/CallerInfoCache$CacheEntry;->customRingtone:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 3432
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Before query; custom ringtone found in CallerInfoCache for call( "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ), setting up ringer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lcom/android/phone/CallerInfoCache$CacheEntry;->customRingtone:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3434
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    iget-object v2, v0, Lcom/android/phone/CallerInfoCache$CacheEntry;->customRingtone:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    .line 3443
    :goto_0
    return-void

    .line 3436
    :cond_0
    const-string v1, "Before query; custom ringtone not found in CallerInfoCache. Use default ringer tone."

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3440
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    sget-object v2, Landroid/provider/Settings$System;->DEFAULT_RINGTONE_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    goto :goto_0
.end method

.method private showIncomingCall()V
    .locals 2

    .prologue
    .line 1033
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showIncomingCall()...  phone state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1038
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    const-string v1, "call"

    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->closeSystemDialogs(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1045
    :goto_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    sget-object v1, Lcom/android/phone/PhoneGlobals$WakeState;->FULL:Lcom/android/phone/PhoneGlobals$WakeState;

    invoke-virtual {v0, v1}, Lcom/android/phone/PhoneGlobals;->requestWakeState(Lcom/android/phone/PhoneGlobals$WakeState;)V

    .line 1053
    const-string v0, "- updating notification from showIncomingCall()..."

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1054
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v0}, Lcom/android/phone/NotificationMgr;->updateNotificationAndLaunchIncomingCallUi()V

    .line 1055
    return-void

    .line 1039
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private startIncomingCallQuery(Lcom/android/internal/telephony/Connection;)V
    .locals 5
    .parameter "c"

    .prologue
    const/4 v4, 0x0

    .line 851
    const/4 v1, 0x0

    .line 852
    .local v1, shouldStartQuery:Z
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryStateGuard:Ljava/lang/Object;

    monitor-enter v3

    .line 853
    :try_start_0
    iget v2, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryState:I

    if-nez v2, :cond_0

    .line 854
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryState:I

    .line 855
    const/4 v1, 0x1

    .line 857
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 858
    if-eqz v1, :cond_2

    .line 868
    invoke-direct {p0, p1}, Lcom/android/phone/CallNotifier;->setDefaultRingtoneUri(Lcom/android/internal/telephony/Connection;)V

    .line 872
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-static {v2, p1, p0, p0}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v0

    .line 877
    .local v0, cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    iget-boolean v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-eqz v2, :cond_1

    .line 878
    const-string v2, "- CallerInfo already up to date, using available data"

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 879
    iget-object v2, v0, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    invoke-virtual {p0, v4, p0, v2}, Lcom/android/phone/CallNotifier;->onQueryComplete(ILjava/lang/Object;Lcom/android/internal/telephony/CallerInfo;)V

    .line 918
    .end local v0           #cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :goto_0
    return-void

    .line 857
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 881
    .restart local v0       #cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :cond_1
    const-string v2, "- Starting query, posting timeout message."

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 885
    const/16 v2, 0x64

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x1f4

    invoke-virtual {p0, v2, v3, v4}, Lcom/android/phone/CallNotifier;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 895
    .end local v0           #cit:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :cond_2
    const v2, 0x112a1

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 899
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getRingingPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3

    .line 900
    const-string v2, "RINGING... (request to ring arrived while query is running)"

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 901
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v2}, Lcom/android/phone/Ringer;->ring()V

    .line 906
    :cond_3
    const-string v2, "- showing incoming call (couldn\'t start query)..."

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 915
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->showIncomingCall()V

    goto :goto_0
.end method


# virtual methods
.method public autoVTVoiceAnswerCall(Lcom/android/internal/telephony/Call;)V
    .locals 8
    .parameter "ringing"

    .prologue
    const/4 v7, 0x1

    .line 691
    const-string v5, "autointernalAnswerCall()..."

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 692
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v2

    .line 694
    .local v2, hasRingingCall:Z
    if-eqz v2, :cond_0

    .line 695
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->getRingingPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    .line 696
    .local v3, phone:Lcom/android/internal/telephony/Phone;
    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v4

    .line 697
    .local v4, phoneType:I
    if-ne v4, v7, :cond_2

    .line 702
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->hasActiveFgCall()Z

    move-result v0

    .line 703
    .local v0, hasActiveCall:Z
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CallManager;->hasActiveBgCall()Z

    move-result v1

    .line 713
    .local v1, hasHoldingCall:Z
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 714
    const-string v5, "autointernalAnswerCall: answering (both lines in use!)..."

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 718
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/phone/PhoneUtils;->answerAndEndActive(Lcom/android/internal/telephony/CallManager;Lcom/android/internal/telephony/Call;)Z

    .line 720
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v5}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v5

    invoke-virtual {v5, v7}, Lcom/android/phone/InCallScreen;->setOnAnswerAndEndFlag(Z)V

    .line 734
    .end local v0           #hasActiveCall:Z
    .end local v1           #hasHoldingCall:Z
    :goto_0
    iget-object v5, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/android/phone/PhoneGlobals;->setLatestActiveCallOrigin(Ljava/lang/String;)V

    .line 736
    .end local v3           #phone:Lcom/android/internal/telephony/Phone;
    .end local v4           #phoneType:I
    :cond_0
    return-void

    .line 726
    .restart local v0       #hasActiveCall:Z
    .restart local v1       #hasHoldingCall:Z
    .restart local v3       #phone:Lcom/android/internal/telephony/Phone;
    .restart local v4       #phoneType:I
    :cond_1
    const-string v5, "autointernalAnswerCall: answering..."

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 727
    invoke-static {p1}, Lcom/android/phone/PhoneUtils;->answerCall(Lcom/android/internal/telephony/Call;)Z

    goto :goto_0

    .line 731
    .end local v0           #hasActiveCall:Z
    .end local v1           #hasHoldingCall:Z
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "phone type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method getCallerInfoFromConnection(Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;
    .locals 3
    .parameter "conn"

    .prologue
    .line 3020
    const/4 v0, 0x0

    .line 3021
    .local v0, ci:Lcom/android/internal/telephony/CallerInfo;
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v1

    .line 3023
    .local v1, o:Ljava/lang/Object;
    if-eqz v1, :cond_0

    instance-of v2, v1, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v2, :cond_1

    :cond_0
    move-object v0, v1

    .line 3024
    check-cast v0, Lcom/android/internal/telephony/CallerInfo;

    .line 3030
    .end local v1           #o:Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 3025
    .restart local v1       #o:Ljava/lang/Object;
    :cond_1
    instance-of v2, v1, Landroid/net/Uri;

    if-eqz v2, :cond_2

    .line 3026
    const/4 v0, 0x0

    goto :goto_0

    .line 3028
    :cond_2
    check-cast v1, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    .end local v1           #o:Ljava/lang/Object;
    iget-object v0, v1, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    goto :goto_0
.end method

.method public getIsCdmaRedialCall()Z
    .locals 1

    .prologue
    .line 2783
    iget-boolean v0, p0, Lcom/android/phone/CallNotifier;->mIsCdmaRedialCall:Z

    return v0
.end method

.method getPresentation(Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfo;)I
    .locals 3
    .parameter "conn"
    .parameter "callerInfo"

    .prologue
    .line 3044
    if-nez p2, :cond_0

    .line 3045
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v0

    .line 3051
    .local v0, presentation:I
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "- getPresentation: presentation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3052
    return v0

    .line 3047
    .end local v0           #presentation:I
    :cond_0
    iget v0, p2, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    .line 3048
    .restart local v0       #presentation:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "- getPresentation(): ignoring connection\'s presentation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getNumberPresentation()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method getPreviousCdmaCallState()Lcom/android/internal/telephony/Call$State;
    .locals 1

    .prologue
    .line 2769
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mPreviousCdmaCallState:Lcom/android/internal/telephony/Call$State;

    return-object v0
.end method

.method getVoicePrivacyState()Z
    .locals 1

    .prologue
    .line 2776
    iget-boolean v0, p0, Lcom/android/phone/CallNotifier;->mVoicePrivacyState:Z

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 17
    .parameter "msg"

    .prologue
    .line 321
    move-object/from16 v0, p1

    iget v14, v0, Landroid/os/Message;->what:I

    sparse-switch v14, :sswitch_data_0

    .line 524
    :cond_0
    :goto_0
    :sswitch_0
    return-void

    .line 323
    :sswitch_1
    const-string v14, "RINGING... (new)"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 324
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onNewRingingConnection(Landroid/os/AsyncResult;)V

    .line 325
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/android/phone/CallNotifier;->mSilentRingerRequested:Z

    goto :goto_0

    .line 329
    :sswitch_2
    const-string v14, "PHONE_INCOMING_RING ! "

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 332
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v14, :cond_0

    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    iget-object v14, v14, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v14, :cond_0

    .line 333
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    iget-object v6, v14, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v6, Lcom/android/internal/telephony/PhoneBase;

    .line 334
    .local v6, pb:Lcom/android/internal/telephony/PhoneBase;
    instance-of v2, v6, Lcom/android/internal/telephony/sip/SipPhone;

    .line 335
    .local v2, bSipRing:Z
    const/4 v1, 0x0

    .line 336
    .local v1, bIsRejected:Z
    invoke-virtual {v6}, Lcom/android/internal/telephony/PhoneBase;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v10

    .line 337
    .local v10, ringCall:Lcom/android/internal/telephony/Call;
    if-eqz v10, :cond_1

    .line 338
    invoke-virtual {v10}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v14

    invoke-static {v14}, Lcom/android/phone/PhoneUtils;->getShouldSendToVoiceMailFlag(Lcom/android/internal/telephony/Connection;)Z

    move-result v1

    .line 340
    :cond_1
    invoke-virtual {v6}, Lcom/android/internal/telephony/PhoneBase;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v14

    sget-object v15, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v14, v15, :cond_3

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/phone/CallNotifier;->mSilentRingerRequested:Z

    if-nez v14, :cond_3

    if-nez v1, :cond_3

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/phone/CallNotifier;->ok2Ring:Z

    if-eqz v14, :cond_3

    .line 344
    const-string v14, "RINGING... (PHONE_INCOMING_RING event)"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 345
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v14}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    const-string v15, "device_provisioned"

    const/16 v16, 0x0

    invoke-static/range {v14 .. v16}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v14

    if-eqz v14, :cond_2

    const/4 v7, 0x1

    .line 348
    .local v7, provisioned:Z
    :goto_1
    if-eqz v7, :cond_0

    if-nez v2, :cond_0

    .line 349
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v14}, Lcom/android/phone/Ringer;->ring()V

    goto/16 :goto_0

    .line 345
    .end local v7           #provisioned:Z
    :cond_2
    const/4 v7, 0x0

    goto :goto_1

    .line 352
    :cond_3
    const-string v14, "RING before NEW_RING, skipping"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 358
    .end local v1           #bIsRejected:Z
    .end local v2           #bSipRing:Z
    .end local v6           #pb:Lcom/android/internal/telephony/PhoneBase;
    .end local v10           #ringCall:Lcom/android/internal/telephony/Call;
    :sswitch_3
    const-string v14, " - handleMessage : RING INFO for video call ! "

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 359
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTRinging()Z

    move-result v14

    if-eqz v14, :cond_5

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/phone/CallNotifier;->mSilentRingerRequested:Z

    if-nez v14, :cond_5

    .line 360
    const-string v14, "RINGING... (PHONE_VT_RING_INFO event)"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 361
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v14}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    const-string v15, "device_provisioned"

    const/16 v16, 0x0

    invoke-static/range {v14 .. v16}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v14

    if-eqz v14, :cond_4

    const/4 v8, 0x1

    .line 363
    .local v8, provisioned2:Z
    :goto_2
    if-eqz v8, :cond_0

    .line 364
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v14}, Lcom/android/phone/Ringer;->ring()V

    goto/16 :goto_0

    .line 361
    .end local v8           #provisioned2:Z
    :cond_4
    const/4 v8, 0x0

    goto :goto_2

    .line 367
    :cond_5
    const-string v14, "RING before NEW_RING, skipping"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 373
    :sswitch_4
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->get3GCapabilitySIM()I

    move-result v11

    .line 374
    .local v11, simId:I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " - handleMessage : PHONE_WAITING_DISCONNECT ! simId="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 375
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v11}, Lcom/android/phone/CallNotifier;->onDisconnectForVTWaiting(Landroid/os/AsyncResult;I)V

    goto/16 :goto_0

    .line 379
    .end local v11           #simId:I
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-eqz v14, :cond_0

    .line 380
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v14}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->stopTone()V

    .line 381
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/android/phone/CallNotifier;->mVideoOrVoiceCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    goto/16 :goto_0

    .line 386
    :sswitch_6
    const-string v14, "CallNotifier Phone state change"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 387
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onPhoneStateChanged(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 393
    :sswitch_7
    const-string v14, "DISCONNECT"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 394
    move-object/from16 v0, p1

    iget-object v9, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, Landroid/os/AsyncResult;

    .line 395
    .local v9, r:Landroid/os/AsyncResult;
    iget-object v3, v9, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/telephony/Connection;

    .line 396
    .local v3, connection:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v3}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->getShouldSendToVoiceMailFlag(Lcom/android/internal/telephony/Connection;)Z

    move-result v14

    if-nez v14, :cond_7

    :cond_6
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/phone/CallNotifier;->ok2Ring:Z

    if-eqz v14, :cond_7

    .line 399
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v14}, Lcom/android/phone/PhoneGlobals;->wakeUpScreen()V

    .line 401
    :cond_7
    move-object/from16 v0, p1

    iget v14, v0, Landroid/os/Message;->what:I

    sget-object v15, Lcom/android/phone/CallNotifier;->PHONE_DISCONNECT_GEMINI:[I

    invoke-static {v14, v15}, Lcom/mediatek/phone/gemini/GeminiRegister;->getSlotIdByRegisterEvent(I[I)I

    move-result v4

    .line 402
    .local v4, disconnectSlotId:I
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v4}, Lcom/android/phone/CallNotifier;->onDisconnect(Landroid/os/AsyncResult;I)V

    goto/16 :goto_0

    .line 406
    .end local v3           #connection:Lcom/android/internal/telephony/Connection;
    .end local v4           #disconnectSlotId:I
    .end local v9           #r:Landroid/os/AsyncResult;
    :sswitch_8
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onUnknownConnectionAppeared(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 410
    :sswitch_9
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onCustomRingtoneQueryTimeout(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 417
    :sswitch_a
    move-object/from16 v0, p1

    iget v14, v0, Landroid/os/Message;->what:I

    sget-object v15, Lcom/android/phone/CallNotifier;->PHONE_MWI_CHANGED_GEMINI:[I

    invoke-static {v14, v15}, Lcom/mediatek/phone/gemini/GeminiRegister;->getSlotIdByRegisterEvent(I[I)I

    move-result v5

    .line 418
    .local v5, mwiSlotId:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v14, v14, Lcom/android/phone/PhoneGlobals;->phone:Lcom/android/internal/telephony/Phone;

    invoke-static {v14, v5}, Lcom/mediatek/phone/gemini/GeminiUtils;->getMessageWaitingIndicator(Lcom/android/internal/telephony/Phone;I)Z

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v5}, Lcom/android/phone/CallNotifier;->onMwiChanged(ZI)V

    goto/16 :goto_0

    .line 422
    .end local v5           #mwiSlotId:I
    :sswitch_b
    const-string v14, "Received PHONE_CDMA_CALL_WAITING event"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 423
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onCdmaCallWaiting(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 427
    :sswitch_c
    const-string v14, "CallNotifier"

    const-string v15, "Received CDMA_CALL_WAITING_REJECT event"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallNotifier;->onCdmaCallWaitingReject()V

    goto/16 :goto_0

    .line 432
    :sswitch_d
    const-string v14, "CallNotifier"

    const-string v15, "Received CALLWAITING_CALLERINFO_DISPLAY_DONE event"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/android/phone/CallNotifier;->mCallWaitingTimeOut:Z

    .line 434
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallNotifier;->onCdmaCallWaitingReject()V

    goto/16 :goto_0

    .line 438
    :sswitch_e
    const-string v14, "Received CALLWAITING_ADDCALL_DISABLE_TIMEOUT event ..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 440
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v14, v14, Lcom/android/phone/PhoneGlobals;->cdmaPhoneCallState:Lcom/android/phone/CdmaPhoneCallState;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Lcom/android/phone/CdmaPhoneCallState;->setAddCallMenuStateAfterCallWaiting(Z)V

    .line 441
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-virtual {v14}, Lcom/android/phone/PhoneGlobals;->updateInCallScreen()V

    goto/16 :goto_0

    .line 445
    :sswitch_f
    const-string v14, "Received PHONE_STATE_DISPLAYINFO event"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 446
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onDisplayInfo(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 450
    :sswitch_10
    const-string v14, "Received PHONE_STATE_SIGNALINFO event"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 451
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onSignalInfo(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 455
    :sswitch_11
    const-string v14, "Received Display Info notification done event ..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 456
    invoke-static {}, Lcom/android/phone/CdmaDisplayInfo;->dismissDisplayInfoRecord()V

    goto/16 :goto_0

    .line 460
    :sswitch_12
    const-string v14, "EVENT_OTA_PROVISION_CHANGE..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 461
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Lcom/android/phone/PhoneGlobals;->handleOtaspEvent(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 465
    :sswitch_13
    const-string v14, "PHONE_ENHANCED_VP_ON..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 466
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/phone/CallNotifier;->mVoicePrivacyState:Z

    if-nez v14, :cond_0

    .line 467
    const/4 v13, 0x5

    .line 468
    .local v13, toneToPlay:I
    new-instance v14, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v13}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    invoke-virtual {v14}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 469
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/android/phone/CallNotifier;->mVoicePrivacyState:Z

    .line 471
    const-string v14, "- updating notification for VP state..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 472
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v14, v14, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v14}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    goto/16 :goto_0

    .line 477
    .end local v13           #toneToPlay:I
    :sswitch_14
    const-string v14, "PHONE_ENHANCED_VP_OFF..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 478
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/phone/CallNotifier;->mVoicePrivacyState:Z

    if-eqz v14, :cond_0

    .line 479
    const/4 v13, 0x5

    .line 480
    .restart local v13       #toneToPlay:I
    new-instance v14, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v13}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    invoke-virtual {v14}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 481
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/android/phone/CallNotifier;->mVoicePrivacyState:Z

    .line 483
    const-string v14, "- updating notification for VP state..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 484
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v14, v14, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v14}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    goto/16 :goto_0

    .line 489
    .end local v13           #toneToPlay:I
    :sswitch_15
    const-string v14, "- receive the ring back..."

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 490
    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v14, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/android/phone/CallNotifier;->onRingbackTone(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 494
    :sswitch_16
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallNotifier;->onResendMute()V

    goto/16 :goto_0

    .line 506
    :sswitch_17
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v14, v14, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v14}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    goto/16 :goto_0

    .line 510
    :sswitch_18
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallNotifier;->checkAndTriggerRingTone()V

    goto/16 :goto_0

    .line 514
    :sswitch_19
    const/4 v12, 0x0

    .local v12, slot:I
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    array-length v14, v14

    if-ge v12, v14, :cond_0

    .line 515
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/CallNotifier;->mCfiStatus:[Z

    aget-boolean v14, v14, v12

    if-eqz v14, :cond_8

    .line 516
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v12}, Lcom/android/phone/CallNotifier;->onCfiChanged(ZI)V

    .line 514
    :cond_8
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 321
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_6
        0x2 -> :sswitch_1
        0x3 -> :sswitch_7
        0x4 -> :sswitch_8
        0x5 -> :sswitch_2
        0x6 -> :sswitch_f
        0x7 -> :sswitch_10
        0x8 -> :sswitch_b
        0x9 -> :sswitch_13
        0xa -> :sswitch_14
        0xb -> :sswitch_15
        0xc -> :sswitch_16
        0xd -> :sswitch_3
        0xf -> :sswitch_4
        0x12 -> :sswitch_5
        0x15 -> :sswitch_a
        0x16 -> :sswitch_d
        0x17 -> :sswitch_e
        0x18 -> :sswitch_11
        0x19 -> :sswitch_12
        0x1a -> :sswitch_c
        0x1b -> :sswitch_17
        0x2a -> :sswitch_18
        0x32 -> :sswitch_0
        0x64 -> :sswitch_9
        0x67 -> :sswitch_7
        0x79 -> :sswitch_a
        0xcb -> :sswitch_7
        0xdd -> :sswitch_a
        0x12f -> :sswitch_7
        0x141 -> :sswitch_a
        0x7d1 -> :sswitch_19
    .end sparse-switch
.end method

.method hasPendingCallerInfoQuery()Z
    .locals 2

    .prologue
    .line 3214
    iget v0, p0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isRinging()Z
    .locals 1

    .prologue
    .line 2178
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v0}, Lcom/android/phone/Ringer;->isRinging()Z

    move-result v0

    return v0
.end method

.method public onQueryComplete(ILjava/lang/Object;Lcom/android/internal/telephony/CallerInfo;)V
    .locals 18
    .parameter "token"
    .parameter "cookie"
    .parameter "ci"

    .prologue
    .line 1406
    move-object/from16 v0, p2

    instance-of v1, v0, Lcom/android/phone/CallNotifier$CustomInfo;

    if-eqz v1, :cond_1

    .line 1407
    const-string v1, "CallerInfo query complete, posting missed call notification"

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1409
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p3

    iget-object v3, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    move-object/from16 v0, p3

    iget-object v4, v0, Lcom/android/internal/telephony/CallerInfo;->phoneLabel:Ljava/lang/String;

    move-object/from16 v0, p3

    iget-object v5, v0, Lcom/android/internal/telephony/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p3

    iget-object v6, v0, Lcom/android/internal/telephony/CallerInfo;->cachedPhotoIcon:Landroid/graphics/Bitmap;

    move-object/from16 v7, p2

    check-cast v7, Lcom/android/phone/CallNotifier$CustomInfo;

    iget-wide v7, v7, Lcom/android/phone/CallNotifier$CustomInfo;->date:J

    check-cast p2, Lcom/android/phone/CallNotifier$CustomInfo;

    .end local p2
    move-object/from16 v0, p2

    iget v9, v0, Lcom/android/phone/CallNotifier$CustomInfo;->callVideo:I

    invoke-virtual/range {v1 .. v9}, Lcom/android/phone/NotificationMgr;->notifyMissedCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;JI)V

    .line 1532
    :cond_0
    :goto_0
    return-void

    .line 1412
    .restart local p2
    :cond_1
    move-object/from16 v0, p2

    instance-of v1, v0, Lcom/android/phone/CallNotifier;

    if-eqz v1, :cond_0

    .line 1413
    const-string v1, "CallerInfo query complete (for CallNotifier), updating state for incoming call.."

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1417
    const/16 v1, 0x64

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1419
    const/16 v16, 0x0

    .line 1420
    .local v16, isQueryExecutionTimeOK:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryStateGuard:Ljava/lang/Object;

    monitor-enter v2

    .line 1421
    :try_start_0
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryState:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_2

    .line 1422
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Lcom/android/phone/CallNotifier;->mCallerInfoQueryState:I

    .line 1423
    const/16 v16, 0x1

    .line 1425
    :cond_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1426
    const/4 v1, 0x1

    sput-boolean v1, Lcom/android/phone/CallNotifier;->mIsWaitingQueryComplete:Z

    .line 1428
    if-eqz v16, :cond_0

    .line 1451
    move-object/from16 v0, p3

    iget-boolean v1, v0, Lcom/android/internal/telephony/CallerInfo;->shouldSendToVoicemail:Z

    if-eqz v1, :cond_3

    .line 1452
    const-string v1, "send to voicemail flag detected. hanging up."

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1453
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->hangupRingingCall(Lcom/android/internal/telephony/Call;)Z

    .line 1454
    const/4 v1, 0x1

    move-object/from16 v0, p3

    iput-boolean v1, v0, Lcom/android/internal/telephony/CallerInfo;->shouldSendToVoicemail:Z

    goto :goto_0

    .line 1425
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 1459
    :cond_3
    move-object/from16 v0, p3

    iget-object v1, v0, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    if-eqz v1, :cond_a

    .line 1460
    const-string v1, "custom ringtone found, setting up ringer."

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1461
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "contactRingtoneUri = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    move-object/from16 v1, p2

    .line 1462
    check-cast v1, Lcom/android/phone/CallNotifier;

    iget-object v0, v1, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    move-object/from16 v17, v0

    .line 1463
    .local v17, r:Lcom/android/phone/Ringer;
    move-object/from16 v0, p3

    iget-object v1, v0, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    .line 1471
    .end local v17           #r:Lcom/android/phone/Ringer;
    :cond_4
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v1

    if-eqz v1, :cond_9

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1473
    check-cast p2, Lcom/android/phone/CallNotifier;

    .end local p2
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    move-object/from16 v17, v0

    .line 1474
    .restart local v17       #r:Lcom/android/phone/Ringer;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v14

    .line 1475
    .local v14, foregroundRingCall:Lcom/android/internal/telephony/Call;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/phone/CallNotifier;->mDualTalk:Lcom/mediatek/phone/DualTalkUtils;

    invoke-virtual {v1}, Lcom/mediatek/phone/DualTalkUtils;->getSecondActiveRingCall()Lcom/android/internal/telephony/Call;

    move-result-object v11

    .line 1476
    .local v11, backgroundRingCall:Lcom/android/internal/telephony/Call;
    invoke-virtual {v14}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/phone/CallNotifier;->getCallerInfoFromConnection(Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v13

    .line 1477
    .local v13, foregroundInfo:Lcom/android/internal/telephony/CallerInfo;
    invoke-virtual {v11}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/phone/CallNotifier;->getCallerInfoFromConnection(Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v10

    .line 1479
    .local v10, backgroundInfo:Lcom/android/internal/telephony/CallerInfo;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "foregorund calller info = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1480
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "background calller info = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1482
    const/4 v15, 0x0

    .line 1483
    .local v15, foregroundUri:Landroid/net/Uri;
    const/4 v12, 0x0

    .line 1487
    .local v12, backgroundUri:Landroid/net/Uri;
    if-eqz v13, :cond_5

    .line 1488
    iget-object v15, v13, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    .line 1490
    :cond_5
    if-nez v15, :cond_6

    .line 1491
    invoke-static {v14}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 1492
    sget-object v15, Landroid/provider/Settings$System;->DEFAULT_VIDEO_CALL_URI:Landroid/net/Uri;

    .line 1497
    :cond_6
    :goto_2
    if-eqz v10, :cond_7

    .line 1498
    iget-object v12, v10, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    .line 1500
    :cond_7
    if-nez v12, :cond_8

    .line 1501
    invoke-static {v11}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 1502
    sget-object v12, Landroid/provider/Settings$System;->DEFAULT_VIDEO_CALL_URI:Landroid/net/Uri;

    .line 1508
    :cond_8
    :goto_3
    invoke-virtual/range {v17 .. v17}, Lcom/android/phone/Ringer;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v15, v12}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 1509
    invoke-virtual/range {v17 .. v17}, Lcom/android/phone/Ringer;->stopRing()V

    .line 1510
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    .line 1512
    invoke-virtual/range {v17 .. v17}, Lcom/android/phone/Ringer;->ring()V

    .line 1529
    .end local v10           #backgroundInfo:Lcom/android/internal/telephony/CallerInfo;
    .end local v11           #backgroundRingCall:Lcom/android/internal/telephony/Call;
    .end local v12           #backgroundUri:Landroid/net/Uri;
    .end local v13           #foregroundInfo:Lcom/android/internal/telephony/CallerInfo;
    .end local v14           #foregroundRingCall:Lcom/android/internal/telephony/Call;
    .end local v15           #foregroundUri:Landroid/net/Uri;
    .end local v17           #r:Lcom/android/phone/Ringer;
    :cond_9
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/CallNotifier;->onCustomRingQueryComplete()V

    goto/16 :goto_0

    .line 1464
    .restart local p2
    :cond_a
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v1

    if-eqz v1, :cond_4

    move-object/from16 v1, p2

    .line 1466
    check-cast v1, Lcom/android/phone/CallNotifier;

    iget-object v0, v1, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    move-object/from16 v17, v0

    .line 1467
    .restart local v17       #r:Lcom/android/phone/Ringer;
    invoke-virtual/range {v17 .. v17}, Lcom/android/phone/Ringer;->getCustomRingToneUri()Landroid/net/Uri;

    move-result-object v1

    move-object/from16 v0, p3

    iput-object v1, v0, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    .line 1468
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "set call\'s uri = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {v17 .. v17}, Lcom/android/phone/Ringer;->getCustomRingToneUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1494
    .end local p2
    .restart local v10       #backgroundInfo:Lcom/android/internal/telephony/CallerInfo;
    .restart local v11       #backgroundRingCall:Lcom/android/internal/telephony/Call;
    .restart local v12       #backgroundUri:Landroid/net/Uri;
    .restart local v13       #foregroundInfo:Lcom/android/internal/telephony/CallerInfo;
    .restart local v14       #foregroundRingCall:Lcom/android/internal/telephony/Call;
    .restart local v15       #foregroundUri:Landroid/net/Uri;
    :cond_b
    sget-object v15, Landroid/provider/Settings$System;->DEFAULT_RINGTONE_URI:Landroid/net/Uri;

    goto :goto_2

    .line 1504
    :cond_c
    sget-object v12, Landroid/provider/Settings$System;->DEFAULT_RINGTONE_URI:Landroid/net/Uri;

    goto :goto_3
.end method

.method public onTimeToReminder()V
    .locals 2

    .prologue
    .line 1581
    const/16 v0, 0xf

    .line 1583
    .local v0, toneToPlay:I
    const-string v1, "- onTimeToReminder ..."

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 1585
    new-instance v1, Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-direct {v1, p0, v0}, Lcom/android/phone/CallNotifier$InCallTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    invoke-virtual {v1}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->start()V

    .line 1586
    return-void
.end method

.method public readNVData(I)I
    .locals 8
    .parameter "flag"

    .prologue
    .line 3447
    const-string v5, "NvRAMAgent"

    invoke-static {v5}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    .line 3448
    .local v2, binder:Landroid/os/IBinder;
    invoke-static {v2}, Lcom/android/phone/NvRAMAgent$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/phone/NvRAMAgent;

    move-result-object v0

    .line 3449
    .local v0, agent:Lcom/android/phone/NvRAMAgent;
    const/4 v3, 0x0

    .line 3451
    .local v3, buff:[B
    const/16 v5, 0x23

    :try_start_0
    invoke-interface {v0, v5}, Lcom/android/phone/NvRAMAgent;->readFile(I)[B
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 3461
    :goto_0
    aget-byte v1, v3, p1

    .line 3462
    .local v1, b:I
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "b:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 3463
    return v1

    .line 3452
    .end local v1           #b:I
    :catch_0
    move-exception v4

    .line 3454
    .local v4, e:Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method resetAudioState()V
    .locals 3

    .prologue
    .line 3261
    const-string v0, "resetAudioState()..."

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3264
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v0, :cond_0

    .line 3265
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothHeadset;->disconnectAudio()Z

    .line 3270
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 3271
    return-void
.end method

.method public resetBeforeCall()V
    .locals 1

    .prologue
    .line 3287
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mToneThread:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mToneThread:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v0}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3288
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mToneThread:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    invoke-virtual {v0}, Lcom/android/phone/CallNotifier$InCallTonePlayer;->stopTone()V

    .line 3290
    const-string v0, "resetBeforeCall: notify the tone thread to exit."

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3297
    :goto_0
    return-void

    .line 3294
    :cond_0
    const-string v0, "resetBeforeCall: do nothing."

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method restartRinger()V
    .locals 3

    .prologue
    .line 2198
    const-string v1, "restartRinger()..."

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2199
    invoke-virtual {p0}, Lcom/android/phone/CallNotifier;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2209
    :cond_0
    :goto_0
    return-void

    .line 2201
    :cond_1
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 2205
    .local v0, ringingCall:Lcom/android/internal/telephony/Call;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "- ringingCall state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2206
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->INCOMING:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_0

    .line 2207
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v1}, Lcom/android/phone/Ringer;->ring()V

    goto :goto_0
.end method

.method sendCdmaCallWaitingReject()V
    .locals 1

    .prologue
    .line 2678
    const/16 v0, 0x1a

    invoke-virtual {p0, v0}, Lcom/android/phone/CallNotifier;->sendEmptyMessage(I)Z

    .line 2679
    return-void
.end method

.method sendMwiChangedDelayed(JI)V
    .locals 4
    .parameter "delayMillis"
    .parameter "slotId"

    .prologue
    .line 2157
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 2159
    .local v1, message:Landroid/os/Message;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    invoke-static {p3, v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v0

    .line 2160
    .local v0, index:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendMwiChangedDelayed, error slot(): slotId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " index:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2161
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 2162
    sget-object v2, Lcom/android/phone/CallNotifier;->PHONE_MWI_CHANGED_GEMINI:[I

    aget v2, v2, v0

    iput v2, v1, Landroid/os/Message;->what:I

    .line 2163
    invoke-virtual {p0, v1, p1, p2}, Lcom/android/phone/CallNotifier;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 2167
    :goto_0
    return-void

    .line 2165
    :cond_0
    const-string v2, "sendMwiChangedDelayed, error slot"

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method showMissedCallNotification(Lcom/android/internal/telephony/Connection;J)V
    .locals 12
    .parameter "c"
    .parameter "date"

    .prologue
    const/4 v0, 0x0

    .line 2790
    new-instance v10, Lcom/android/phone/CallNotifier$CustomInfo;

    const/4 v3, 0x0

    invoke-direct {v10, p0, v3}, Lcom/android/phone/CallNotifier$CustomInfo;-><init>(Lcom/android/phone/CallNotifier;Lcom/android/phone/CallNotifier$1;)V

    .line 2791
    .local v10, customInfo:Lcom/android/phone/CallNotifier$CustomInfo;
    iput-wide p2, v10, Lcom/android/phone/CallNotifier$CustomInfo;->date:J

    .line 2792
    if-eqz p1, :cond_4

    .line 2793
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->isVideo()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput v0, v10, Lcom/android/phone/CallNotifier$CustomInfo;->callVideo:I

    .line 2797
    :goto_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    invoke-static {v0, p1, p0, v10}, Lcom/android/phone/PhoneUtils;->startGetCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/Connection;Lcom/android/internal/telephony/CallerInfoAsyncQuery$OnQueryCompleteListener;Ljava/lang/Object;)Lcom/android/phone/PhoneUtils$CallerInfoToken;

    move-result-object v11

    .line 2799
    .local v11, info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    if-eqz v11, :cond_7

    .line 2802
    const-string v0, "showMissedCallNotification: Querying for CallerInfo on missed call..."

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2803
    iget-boolean v0, v11, Lcom/android/phone/PhoneUtils$CallerInfoToken;->isFinal:Z

    if-eqz v0, :cond_3

    .line 2806
    iget-object v9, v11, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    .line 2811
    .local v9, ci:Lcom/android/internal/telephony/CallerInfo;
    iget-object v1, v9, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    .line 2812
    .local v1, name:Ljava/lang/String;
    iget-object v2, v9, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 2815
    .local v2, number:Ljava/lang/String;
    invoke-virtual {v9}, Lcom/android/internal/telephony/CallerInfo;->isVoiceMailNumber()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2816
    if-nez v1, :cond_1

    .line 2818
    iget-object v1, v9, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    .line 2820
    :cond_1
    if-eqz p1, :cond_2

    .line 2821
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    .line 2826
    :cond_2
    iget v0, v9, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    sget v3, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_RESTRICTED:I

    if-ne v0, v3, :cond_5

    .line 2827
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const v3, 0x7f0d0177

    invoke-virtual {v0, v3}, Lcom/android/phone/PhoneGlobals;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 2834
    :goto_1
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    iget-object v3, v9, Lcom/android/internal/telephony/CallerInfo;->phoneLabel:Ljava/lang/String;

    iget-object v4, v9, Lcom/android/internal/telephony/CallerInfo;->cachedPhoto:Landroid/graphics/drawable/Drawable;

    iget-object v5, v9, Lcom/android/internal/telephony/CallerInfo;->cachedPhotoIcon:Landroid/graphics/Bitmap;

    iget v8, v10, Lcom/android/phone/CallNotifier$CustomInfo;->callVideo:I

    move-wide v6, p2

    invoke-virtual/range {v0 .. v8}, Lcom/android/phone/NotificationMgr;->notifyMissedCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;JI)V

    .line 2842
    .end local v1           #name:Ljava/lang/String;
    .end local v2           #number:Ljava/lang/String;
    .end local v9           #ci:Lcom/android/internal/telephony/CallerInfo;
    :cond_3
    :goto_2
    return-void

    .line 2795
    .end local v11           #info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :cond_4
    iput v0, v10, Lcom/android/phone/CallNotifier$CustomInfo;->callVideo:I

    goto :goto_0

    .line 2828
    .restart local v1       #name:Ljava/lang/String;
    .restart local v2       #number:Ljava/lang/String;
    .restart local v9       #ci:Lcom/android/internal/telephony/CallerInfo;
    .restart local v11       #info:Lcom/android/phone/PhoneUtils$CallerInfoToken;
    :cond_5
    iget v0, v9, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    sget v3, Lcom/android/internal/telephony/PhoneConstants;->PRESENTATION_ALLOWED:I

    if-eq v0, v3, :cond_6

    .line 2829
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    const v3, 0x7f0d0176

    invoke-virtual {v0, v3}, Lcom/android/phone/PhoneGlobals;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 2831
    :cond_6
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mApplication:Lcom/android/phone/PhoneGlobals;

    iget v3, v9, Lcom/android/internal/telephony/CallerInfo;->numberPresentation:I

    invoke-static {v0, v9, v2, v3}, Lcom/android/phone/PhoneUtils;->modifyForSpecialCnapCases(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 2840
    .end local v1           #name:Ljava/lang/String;
    .end local v2           #number:Ljava/lang/String;
    .end local v9           #ci:Lcom/android/internal/telephony/CallerInfo;
    :cond_7
    const-string v0, "CallNotifier"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "showMissedCallNotification: got null CallerInfo for Connection "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method silenceRinger()V
    .locals 1

    .prologue
    .line 2186
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/phone/CallNotifier;->mSilentRingerRequested:Z

    .line 2187
    const-string v0, "stopRing()... (silenceRinger)"

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2188
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v0}, Lcom/android/phone/Ringer;->stopRing()V

    .line 2189
    return-void
.end method

.method stopSignalInfoTone()V
    .locals 2

    .prologue
    .line 2613
    const-string v0, "stopSignalInfoTone: Stopping SignalInfo tone player"

    invoke-direct {p0, v0}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 2614
    new-instance v0, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;

    const/16 v1, 0x62

    invoke-direct {v0, p0, v1}, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;-><init>(Lcom/android/phone/CallNotifier;I)V

    invoke-virtual {v0}, Lcom/android/phone/CallNotifier$SignalInfoTonePlayer;->start()V

    .line 2615
    return-void
.end method

.method switchRingToneByNeeded(Lcom/android/internal/telephony/Call;)V
    .locals 4
    .parameter "ring"

    .prologue
    .line 3224
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->isRealIncomingCall(Lcom/android/internal/telephony/Call$State;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3225
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/phone/CallNotifier;->getCallerInfoFromConnection(Lcom/android/internal/telephony/Connection;)Lcom/android/internal/telephony/CallerInfo;

    move-result-object v0

    .line 3226
    .local v0, ci:Lcom/android/internal/telephony/CallerInfo;
    if-nez v0, :cond_1

    .line 3253
    .end local v0           #ci:Lcom/android/internal/telephony/CallerInfo;
    :cond_0
    :goto_0
    return-void

    .line 3230
    .restart local v0       #ci:Lcom/android/internal/telephony/CallerInfo;
    :cond_1
    iget-object v1, v0, Lcom/android/internal/telephony/CallerInfo;->contactRingtoneUri:Landroid/net/Uri;

    .line 3232
    .local v1, custUri:Landroid/net/Uri;
    if-nez v1, :cond_2

    .line 3233
    const-string v2, "switchRingToneByNeeded: custUri == null"

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3234
    invoke-static {p1}, Lcom/mediatek/phone/vt/VTCallUtils;->isVideoCall(Lcom/android/internal/telephony/Call;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 3235
    sget-object v1, Landroid/provider/Settings$System;->DEFAULT_VIDEO_CALL_URI:Landroid/net/Uri;

    .line 3240
    :cond_2
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "switchRingToneByNeeded: ring call = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3241
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "switchRingToneByNeeded: new ringUri = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3242
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "switchRingToneByNeeded: old ringUri = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v3}, Lcom/android/phone/Ringer;->getCustomRingToneUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    .line 3244
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v2}, Lcom/android/phone/Ringer;->getCustomRingToneUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3245
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v2}, Lcom/android/phone/Ringer;->stopRing()V

    .line 3246
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v2, v1}, Lcom/android/phone/Ringer;->setCustomRingtoneUri(Landroid/net/Uri;)V

    .line 3248
    iget-object v2, p0, Lcom/android/phone/CallNotifier;->mRinger:Lcom/android/phone/Ringer;

    invoke-virtual {v2}, Lcom/android/phone/Ringer;->ring()V

    .line 3250
    const-string v2, "switchRingToneByNeeded: stop and start new ring!"

    invoke-direct {p0, v2}, Lcom/android/phone/CallNotifier;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 3237
    :cond_3
    sget-object v1, Landroid/provider/Settings$System;->DEFAULT_RINGTONE_URI:Landroid/net/Uri;

    goto :goto_1
.end method

.method unregisterCallNotifierRegistrations()V
    .locals 5

    .prologue
    .line 1251
    const-string v3, "CallNotifier"

    const-string v4, "unregisterCallNotifierRegistrations..."

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1253
    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1254
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1255
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1256
    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Lcom/android/phone/CallNotifier;->removeMessages(I)V

    .line 1262
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 1264
    .local v0, callManager:Ljava/lang/Object;
    :goto_0
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1265
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForIncomingRing(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1266
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1267
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForUnknownConnection(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1268
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForNewRingingConnection(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1269
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForRingbackTone(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1272
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForVtRingInfo(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1273
    invoke-static {v0, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForVtReplaceDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1275
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1276
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v1

    .line 1277
    .local v1, geminiSlots:[I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 1278
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    aget v4, v1, v2

    invoke-virtual {v3, p0, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForCallWaitingGemini(Landroid/os/Handler;I)V

    .line 1279
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    aget v4, v1, v2

    invoke-virtual {v3, p0, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForDisplayInfoGemini(Landroid/os/Handler;I)V

    .line 1280
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    aget v4, v1, v2

    invoke-virtual {v3, p0, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForSignalInfoGemini(Landroid/os/Handler;I)V

    .line 1281
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    aget v4, v1, v2

    invoke-virtual {v3, p0, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForCdmaOtaStatusChangeGemini(Landroid/os/Handler;I)V

    .line 1277
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1262
    .end local v0           #callManager:Ljava/lang/Object;
    .end local v1           #geminiSlots:[I
    .end local v2           #i:I
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_0

    .line 1285
    .restart local v0       #callManager:Ljava/lang/Object;
    .restart local v1       #geminiSlots:[I
    .restart local v2       #i:I
    :cond_1
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCdmaOtaStatusChange2(Landroid/os/Handler;)V

    .line 1286
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCallWaiting2(Landroid/os/Handler;)V

    .line 1287
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForDisplayInfo2(Landroid/os/Handler;)V

    .line 1288
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForSignalInfo2(Landroid/os/Handler;)V

    .line 1289
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForInCallVoicePrivacyOn2(Landroid/os/Handler;)V

    .line 1290
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForInCallVoicePrivacyOff2(Landroid/os/Handler;)V

    .line 1299
    .end local v1           #geminiSlots:[I
    .end local v2           #i:I
    :goto_2
    return-void

    .line 1292
    :cond_2
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCallWaiting(Landroid/os/Handler;)V

    .line 1293
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForDisplayInfo(Landroid/os/Handler;)V

    .line 1294
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForSignalInfo(Landroid/os/Handler;)V

    .line 1295
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCdmaOtaStatusChange(Landroid/os/Handler;)V

    .line 1297
    iget-object v3, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForResendIncallMute(Landroid/os/Handler;)V

    goto :goto_2
.end method

.method updateCallNotifierRegistrationsAfterRadioTechnologyChange()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 1302
    const-string v6, "CallNotifier"

    const-string v7, "updateCallNotifierRegistrationsAfterRadioTechnologyChange..."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1304
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 1306
    .local v1, callManager:Ljava/lang/Object;
    :goto_0
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1307
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForIncomingRing(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1308
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForPreciseCallStateChanged(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1309
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForUnknownConnection(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1310
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForNewRingingConnection(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1311
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForRingbackTone(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1314
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForVtRingInfo(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1315
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForVtReplaceDisconnect(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1318
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1319
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v2

    .line 1320
    .local v2, geminiSlots:[I
    move-object v0, v2

    .local v0, arr$:[I
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_1

    aget v5, v0, v3

    .line 1321
    .local v5, slotId:I
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    invoke-virtual {v6, p0, v5}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForCallWaitingGemini(Landroid/os/Handler;I)V

    .line 1322
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    invoke-virtual {v6, p0, v5}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForDisplayInfoGemini(Landroid/os/Handler;I)V

    .line 1323
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    invoke-virtual {v6, p0, v5}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForSignalInfoGemini(Landroid/os/Handler;I)V

    .line 1324
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    invoke-virtual {v6, p0, v5}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForCdmaOtaStatusChangeGemini(Landroid/os/Handler;I)V

    .line 1320
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1304
    .end local v0           #arr$:[I
    .end local v1           #callManager:Ljava/lang/Object;
    .end local v2           #geminiSlots:[I
    .end local v3           #i$:I
    .end local v4           #len$:I
    .end local v5           #slotId:I
    :cond_0
    iget-object v1, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_0

    .line 1326
    .restart local v0       #arr$:[I
    .restart local v1       #callManager:Ljava/lang/Object;
    .restart local v2       #geminiSlots:[I
    .restart local v3       #i$:I
    .restart local v4       #len$:I
    :cond_1
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCdmaOtaStatusChange2(Landroid/os/Handler;)V

    .line 1327
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCallWaiting2(Landroid/os/Handler;)V

    .line 1328
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForDisplayInfo2(Landroid/os/Handler;)V

    .line 1329
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForSignalInfo2(Landroid/os/Handler;)V

    .line 1330
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForInCallVoicePrivacyOn2(Landroid/os/Handler;)V

    .line 1331
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForInCallVoicePrivacyOff2(Landroid/os/Handler;)V

    .line 1342
    .end local v0           #arr$:[I
    .end local v2           #geminiSlots:[I
    .end local v3           #i$:I
    .end local v4           #len$:I
    :goto_2
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mSignalInfoToneGenerator:Landroid/media/ToneGenerator;

    if-eqz v6, :cond_2

    .line 1343
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mSignalInfoToneGenerator:Landroid/media/ToneGenerator;

    invoke-virtual {v6}, Landroid/media/ToneGenerator;->release()V

    .line 1347
    :cond_2
    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mInCallRingbackTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 1350
    iput-object v8, p0, Lcom/android/phone/CallNotifier;->mCallWaitingTonePlayer:Lcom/android/phone/CallNotifier$InCallTonePlayer;

    .line 1352
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForInCallVoicePrivacyOn(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1353
    invoke-static {v1, p0}, Lcom/mediatek/phone/gemini/GeminiRegister;->unregisterForInCallVoicePrivacyOff(Ljava/lang/Object;Landroid/os/Handler;)V

    .line 1356
    invoke-direct {p0}, Lcom/android/phone/CallNotifier;->registerForNotifications()V

    .line 1357
    return-void

    .line 1333
    :cond_3
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCallWaiting(Landroid/os/Handler;)V

    .line 1334
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForDisplayInfo(Landroid/os/Handler;)V

    .line 1335
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForSignalInfo(Landroid/os/Handler;)V

    .line 1336
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForCdmaOtaStatusChange(Landroid/os/Handler;)V

    .line 1338
    iget-object v6, p0, Lcom/android/phone/CallNotifier;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v6, p0}, Lcom/android/internal/telephony/CallManager;->unregisterForResendIncallMute(Landroid/os/Handler;)V

    goto :goto_2
.end method

.method public writeNVData(II)I
    .locals 8
    .parameter "indexNum"
    .parameter "indexValue"

    .prologue
    .line 3468
    const-string v5, "NvRAMAgent"

    invoke-static {v5}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 3469
    .local v1, binder:Landroid/os/IBinder;
    invoke-static {v1}, Lcom/android/phone/NvRAMAgent$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/phone/NvRAMAgent;

    move-result-object v0

    .line 3470
    .local v0, agent:Lcom/android/phone/NvRAMAgent;
    const/4 v2, 0x0

    .line 3472
    .local v2, buff:[B
    const/16 v5, 0x23

    :try_start_0
    invoke-interface {v0, v5}, Lcom/android/phone/NvRAMAgent;->readFile(I)[B
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 3477
    :goto_0
    int-to-byte v5, p2

    aput-byte v5, v2, p1

    .line 3483
    const/4 v4, 0x0

    .line 3485
    .local v4, flag:I
    const/16 v5, 0x23

    :try_start_1
    invoke-interface {v0, v5, v2}, Lcom/android/phone/NvRAMAgent;->writeFile(I[B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v4

    .line 3489
    :goto_1
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "flag="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 3490
    return v4

    .line 3473
    .end local v4           #flag:I
    :catch_0
    move-exception v3

    .line 3475
    .local v3, e:Landroid/os/RemoteException;
    invoke-virtual {v3}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 3486
    .end local v3           #e:Landroid/os/RemoteException;
    .restart local v4       #flag:I
    :catch_1
    move-exception v3

    .line 3487
    .local v3, e:Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
