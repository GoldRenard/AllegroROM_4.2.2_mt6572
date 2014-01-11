.class public Lcom/android/phone/NetworkSetting;
.super Landroid/preference/PreferenceActivity;
.source "NetworkSetting.java"


# static fields
.field private static final BUTTON_AUTO_SELECT_KEY:Ljava/lang/String; = "button_auto_select_key"

.field private static final BUTTON_SELECT_MANUAL:Ljava/lang/String; = "button_manual_select_key"

.field private static final DBG:Z = true

.field private static final DIALOG_DISCONNECT_DATA_CONNECTION:I = 0x1f4

.field private static final DIALOG_NETWORK_AUTO_SELECT:I = 0x12c

.field private static final DIALOG_NETWORK_MENU_SELECT:I = 0xc8

.field private static final EVENT_AUTO_SELECT_DONE:I = 0x12c

.field private static final EVENT_SERVICE_STATE_CHANGED:I = 0x190

.field private static final LOG_TAG:Ljava/lang/String; = "phone"

.field private static final MENU_CANCEL:I = 0x64

.field private static final SIM_CARD_UNDEFINED:I = -0x1


# instance fields
.field private mAirplaneModeEnabled:Z

.field private mAutoSelect:Landroid/preference/Preference;

.field private mDualSimMode:I

.field private mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

.field private final mHandler:Landroid/os/Handler;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field protected mIsForeground:Z

.field protected mIsResignSuccess:Z

.field private mManuSelect:Landroid/preference/Preference;

.field mNetworkSelectMsg:Ljava/lang/String;

.field private mNoServiceMsg:Landroid/widget/TextView;

.field mPhone:Lcom/android/internal/telephony/Phone;

.field private mPhoneStateReceiver:Lcom/android/internal/telephony/PhoneStateIntentReceiver;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mShowAlwaysCheck:Landroid/widget/CheckBox;

.field private mShowAlwaysTitle:Landroid/widget/TextView;

.field private mSimId:I

.field private mTitleName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 121
    iput-boolean v1, p0, Lcom/android/phone/NetworkSetting;->mIsForeground:Z

    .line 135
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/NetworkSetting;->mTitleName:Ljava/lang/String;

    .line 136
    iput-boolean v1, p0, Lcom/android/phone/NetworkSetting;->mIsResignSuccess:Z

    .line 138
    iput v1, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    .line 142
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/phone/NetworkSetting;->mDualSimMode:I

    .line 146
    new-instance v0, Lcom/android/phone/NetworkSetting$1;

    invoke-direct {v0, p0}, Lcom/android/phone/NetworkSetting$1;-><init>(Lcom/android/phone/NetworkSetting;)V

    iput-object v0, p0, Lcom/android/phone/NetworkSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 176
    new-instance v0, Lcom/android/phone/NetworkSetting$2;

    invoke-direct {v0, p0}, Lcom/android/phone/NetworkSetting$2;-><init>(Lcom/android/phone/NetworkSetting;)V

    iput-object v0, p0, Lcom/android/phone/NetworkSetting;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/phone/NetworkSetting;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/android/phone/NetworkSetting;->mAirplaneModeEnabled:Z

    return v0
.end method

.method static synthetic access$002(Lcom/android/phone/NetworkSetting;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 102
    iput-boolean p1, p0, Lcom/android/phone/NetworkSetting;->mAirplaneModeEnabled:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/phone/NetworkSetting;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lcom/android/phone/NetworkSetting;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/phone/NetworkSetting;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lcom/android/phone/NetworkSetting;->setScreenEnabled(Z)V

    return-void
.end method

.method static synthetic access$302(Lcom/android/phone/NetworkSetting;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 102
    iput p1, p0, Lcom/android/phone/NetworkSetting;->mDualSimMode:I

    return p1
.end method

.method static synthetic access$400(Lcom/android/phone/NetworkSetting;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 102
    iget v0, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    return v0
.end method

.method static synthetic access$500(Lcom/android/phone/NetworkSetting;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lcom/android/phone/NetworkSetting;->displayNetworkSelectionFailed(Ljava/lang/Throwable;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/phone/NetworkSetting;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/android/phone/NetworkSetting;->displayNetworkSelectionSucceeded()V

    return-void
.end method

.method private displayNetworkSelectionFailed(Ljava/lang/Throwable;)V
    .locals 4
    .parameter "ex"

    .prologue
    .line 391
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/phone/NetworkSetting;->mIsResignSuccess:Z

    .line 392
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/android/phone/NetworkSetting;->setScreenEnabled(Z)V

    .line 396
    if-eqz p1, :cond_0

    instance-of v2, p1, Lcom/android/internal/telephony/CommandException;

    if-eqz v2, :cond_0

    check-cast p1, Lcom/android/internal/telephony/CommandException;

    .end local p1
    invoke-virtual {p1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/CommandException$Error;->ILLEGAL_SIM_OR_ME:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v2, v3, :cond_0

    .line 398
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d01f8

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 403
    .local v1, status:Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    .line 404
    .local v0, app:Lcom/android/phone/PhoneGlobals;
    iget-object v2, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    const/4 v3, 0x4

    invoke-virtual {v2, v3, v1}, Lcom/android/phone/NotificationMgr;->postTransientNotification(ILjava/lang/CharSequence;)V

    .line 406
    return-void

    .line 400
    .end local v0           #app:Lcom/android/phone/PhoneGlobals;
    .end local v1           #status:Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d01f9

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #status:Ljava/lang/String;
    goto :goto_0
.end method

.method private displayNetworkSelectionSucceeded()V
    .locals 6

    .prologue
    .line 410
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/phone/NetworkSetting;->mIsResignSuccess:Z

    .line 411
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/android/phone/NetworkSetting;->setScreenEnabled(Z)V

    .line 414
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d01fa

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 416
    .local v1, status:Ljava/lang/String;
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    .line 417
    .local v0, app:Lcom/android/phone/PhoneGlobals;
    iget-object v2, v0, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    const/4 v3, 0x4

    invoke-virtual {v2, v3, v1}, Lcom/android/phone/NotificationMgr;->postTransientNotification(ILjava/lang/CharSequence;)V

    .line 420
    iget-object v2, p0, Lcom/android/phone/NetworkSetting;->mHandler:Landroid/os/Handler;

    new-instance v3, Lcom/android/phone/NetworkSetting$6;

    invoke-direct {v3, p0}, Lcom/android/phone/NetworkSetting$6;-><init>(Lcom/android/phone/NetworkSetting;)V

    const-wide/16 v4, 0xbb8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 425
    return-void
.end method

.method private geminiPhoneInit()V
    .locals 3

    .prologue
    .line 489
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 490
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 491
    .local v0, it:Landroid/content/Intent;
    const-string v1, "simId"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    .line 492
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iput-object v1, p0, Lcom/android/phone/NetworkSetting;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 494
    .end local v0           #it:Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private isNoService()Z
    .locals 3

    .prologue
    .line 497
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "no_service"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private isRadioPoweroff()Z
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 502
    const/4 v0, 0x0

    .line 503
    .local v0, isPoweroff:Z
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 504
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mPhoneStateReceiver:Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    iget v5, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->getServiceStateGemini(I)Landroid/telephony/ServiceState;

    move-result-object v1

    .line 505
    .local v1, serviceState:Landroid/telephony/ServiceState;
    invoke-virtual {v1}, Landroid/telephony/ServiceState;->getState()I

    move-result v4

    if-ne v4, v6, :cond_0

    move v0, v2

    .line 510
    :goto_0
    const-string v2, "phone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isRadioPoweroff="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    return v0

    :cond_0
    move v0, v3

    .line 505
    goto :goto_0

    .line 507
    .end local v1           #serviceState:Landroid/telephony/ServiceState;
    :cond_1
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mPhoneStateReceiver:Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v1

    .line 508
    .restart local v1       #serviceState:Landroid/telephony/ServiceState;
    invoke-virtual {v1}, Landroid/telephony/ServiceState;->getState()I

    move-result v4

    if-ne v4, v6, :cond_2

    move v0, v2

    :goto_1
    goto :goto_0

    :cond_2
    move v0, v3

    goto :goto_1
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 515
    const-string v0, "phone"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[NetworksList] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    return-void
.end method

.method private selectNetworkAutomatic()V
    .locals 3

    .prologue
    const/16 v2, 0x12c

    .line 429
    const-string v1, "select network automatically..."

    invoke-direct {p0, v1}, Lcom/android/phone/NetworkSetting;->log(Ljava/lang/String;)V

    .line 431
    iget-boolean v1, p0, Lcom/android/phone/NetworkSetting;->mIsForeground:Z

    if-eqz v1, :cond_0

    .line 432
    invoke-virtual {p0, v2}, Lcom/android/phone/NetworkSetting;->showDialog(I)V

    .line 435
    :cond_0
    iget-object v1, p0, Lcom/android/phone/NetworkSetting;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 437
    .local v0, msg:Landroid/os/Message;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-nez v1, :cond_1

    .line 438
    iget-object v1, p0, Lcom/android/phone/NetworkSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1, v0}, Lcom/android/internal/telephony/Phone;->setNetworkSelectionModeAutomatic(Landroid/os/Message;)V

    .line 443
    :goto_0
    return-void

    .line 440
    :cond_1
    iget-object v1, p0, Lcom/android/phone/NetworkSetting;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    invoke-virtual {v1, v0, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setNetworkSelectionModeAutomaticGemini(Landroid/os/Message;I)V

    goto :goto_0
.end method

.method private setScreenEnabled(Z)V
    .locals 6
    .parameter "flag"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 474
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 477
    .local v1, telephonyManager:Landroid/telephony/TelephonyManager;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->isDualTalkMode()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 478
    iget v4, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    invoke-virtual {v1, v4}, Landroid/telephony/TelephonyManager;->getCallStateGemini(I)I

    move-result v4

    if-nez v4, :cond_0

    move v0, v2

    .line 483
    .local v0, isCallStateIdle:Z
    :goto_0
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    if-eqz p1, :cond_3

    iget-boolean v5, p0, Lcom/android/phone/NetworkSetting;->mIsResignSuccess:Z

    if-nez v5, :cond_3

    invoke-direct {p0}, Lcom/android/phone/NetworkSetting;->isRadioPoweroff()Z

    move-result v5

    if-nez v5, :cond_3

    if-eqz v0, :cond_3

    iget-boolean v5, p0, Lcom/android/phone/NetworkSetting;->mAirplaneModeEnabled:Z

    if-nez v5, :cond_3

    iget v5, p0, Lcom/android/phone/NetworkSetting;->mDualSimMode:I

    if-eqz v5, :cond_3

    :goto_1
    invoke-virtual {v4, v2}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 485
    return-void

    .end local v0           #isCallStateIdle:Z
    :cond_0
    move v0, v3

    .line 478
    goto :goto_0

    .line 480
    :cond_1
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v4

    if-nez v4, :cond_2

    move v0, v2

    .restart local v0       #isCallStateIdle:Z
    :goto_2
    goto :goto_0

    .end local v0           #isCallStateIdle:Z
    :cond_2
    move v0, v3

    goto :goto_2

    .restart local v0       #isCallStateIdle:Z
    :cond_3
    move v2, v3

    .line 483
    goto :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "icicle"

    .prologue
    const/16 v6, 0x8

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 241
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 243
    const v4, 0x7f040028

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->setContentView(I)V

    .line 244
    const v4, 0x7f060004

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->addPreferencesFromResource(I)V

    .line 245
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v4

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 247
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    const-string v5, "button_manual_select_key"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mManuSelect:Landroid/preference/Preference;

    .line 248
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    const-string v5, "button_auto_select_key"

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mAutoSelect:Landroid/preference/Preference;

    .line 249
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "sub_title_name"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mTitleName:Ljava/lang/String;

    .line 250
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mTitleName:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 251
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mTitleName:Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->setTitle(Ljava/lang/CharSequence;)V

    .line 254
    :cond_0
    const v4, 0x7f0800ae

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mNoServiceMsg:Landroid/widget/TextView;

    .line 255
    const v4, 0x7f0800af

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mShowAlwaysCheck:Landroid/widget/CheckBox;

    .line 256
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mShowAlwaysCheck:Landroid/widget/CheckBox;

    if-eqz v4, :cond_1

    .line 257
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 258
    .local v3, sp:Landroid/content/SharedPreferences;
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mShowAlwaysCheck:Landroid/widget/CheckBox;

    const-string v5, "no_service_key"

    invoke-interface {v3, v5, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 259
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mShowAlwaysCheck:Landroid/widget/CheckBox;

    new-instance v5, Lcom/android/phone/NetworkSetting$3;

    invoke-direct {v5, p0, v3}, Lcom/android/phone/NetworkSetting$3;-><init>(Lcom/android/phone/NetworkSetting;Landroid/content/SharedPreferences;)V

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 268
    .end local v3           #sp:Landroid/content/SharedPreferences;
    :cond_1
    const v4, 0x7f0800b0

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mShowAlwaysTitle:Landroid/widget/TextView;

    .line 270
    invoke-direct {p0}, Lcom/android/phone/NetworkSetting;->geminiPhoneInit()V

    .line 272
    invoke-direct {p0}, Lcom/android/phone/NetworkSetting;->isNoService()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 273
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 274
    invoke-static {}, Lcom/mediatek/phone/SIMInfoWrapper;->getDefault()Lcom/mediatek/phone/SIMInfoWrapper;

    move-result-object v2

    .line 275
    .local v2, simInfoWrapper:Lcom/mediatek/phone/SIMInfoWrapper;
    if-eqz v2, :cond_2

    .line 276
    iget v4, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    invoke-virtual {v2, v4}, Lcom/mediatek/phone/SIMInfoWrapper;->getSimInfoBySlot(I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 277
    .local v1, simInfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_2

    .line 278
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d011c

    new-array v6, v10, [Ljava/lang/Object;

    iget-object v7, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    aput-object v7, v6, v9

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->setTitle(Ljava/lang/CharSequence;)V

    .line 279
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mNoServiceMsg:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0d0119

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 294
    .end local v1           #simInfo:Landroid/provider/Telephony$SIMInfo;
    .end local v2           #simInfoWrapper:Lcom/mediatek/phone/SIMInfoWrapper;
    :cond_2
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "It\'s a GeminiPhone ? = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "SIM_ID = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/phone/NetworkSetting;->log(Ljava/lang/String;)V

    .line 297
    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mIntentFilter:Landroid/content/IntentFilter;

    .line 298
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 299
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v5, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v4, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 301
    :cond_3
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v5, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v4, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 302
    new-instance v4, Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    iget-object v5, p0, Lcom/android/phone/NetworkSetting;->mHandler:Landroid/os/Handler;

    invoke-direct {v4, p0, v5}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    iput-object v4, p0, Lcom/android/phone/NetworkSetting;->mPhoneStateReceiver:Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    .line 303
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mPhoneStateReceiver:Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    const/16 v5, 0x190

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->notifyServiceState(I)V

    .line 305
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 306
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_4

    .line 308
    invoke-virtual {v0, v10}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 310
    :cond_4
    return-void

    .line 284
    .end local v0           #actionBar:Landroid/app/ActionBar;
    :cond_5
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d011d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/phone/NetworkSetting;->setTitle(Ljava/lang/CharSequence;)V

    .line 285
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mNoServiceMsg:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0d011a

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 288
    :cond_6
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mNoServiceMsg:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 289
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mShowAlwaysCheck:Landroid/widget/CheckBox;

    invoke-virtual {v4, v6}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 290
    iget-object v4, p0, Lcom/android/phone/NetworkSetting;->mShowAlwaysTitle:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 6
    .parameter "id"

    .prologue
    const/4 v5, 0x0

    const v4, 0x1080027

    const v3, 0x1040014

    .line 314
    const/4 v0, 0x0

    .line 315
    .local v0, dialog:Landroid/app/Dialog;
    sparse-switch p1, :sswitch_data_0

    .line 361
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[onCreateDialog] create dialog id is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/NetworkSetting;->log(Ljava/lang/String;)V

    .line 362
    return-object v0

    .line 317
    :sswitch_0
    new-instance v0, Landroid/app/ProgressDialog;

    .end local v0           #dialog:Landroid/app/Dialog;
    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .restart local v0       #dialog:Landroid/app/Dialog;
    move-object v1, v0

    .line 318
    check-cast v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d01ff

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    move-object v1, v0

    .line 319
    check-cast v1, Landroid/app/ProgressDialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    move-object v1, v0

    .line 320
    check-cast v1, Landroid/app/ProgressDialog;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_0

    .line 323
    :sswitch_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0118

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    new-instance v3, Lcom/android/phone/NetworkSetting$4;

    invoke-direct {v3, p0}, Lcom/android/phone/NetworkSetting$4;-><init>(Lcom/android/phone/NetworkSetting;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x104

    invoke-virtual {v1, v2, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 337
    goto :goto_0

    .line 339
    :sswitch_2
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0d013a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040013

    new-instance v3, Lcom/android/phone/NetworkSetting$5;

    invoke-direct {v3, p0}, Lcom/android/phone/NetworkSetting$5;-><init>(Lcom/android/phone/NetworkSetting;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1040009

    invoke-virtual {v1, v2, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 356
    goto/16 :goto_0

    .line 315
    nop

    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_1
        0x12c -> :sswitch_0
        0x1f4 -> :sswitch_2
    .end sparse-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    const/4 v2, 0x0

    .line 367
    invoke-direct {p0}, Lcom/android/phone/NetworkSetting;->isNoService()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 368
    const/16 v0, 0x64

    const v1, 0x7f0d0196

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 371
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 376
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 386
    :goto_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_1
    return v0

    .line 378
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->finish()V

    goto :goto_0

    .line 381
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->finish()V

    .line 382
    const/4 v0, 0x1

    goto :goto_1

    .line 376
    nop

    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0x102002c -> :sswitch_1
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 464
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 465
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/NetworkSetting;->mIsForeground:Z

    .line 467
    iget-object v0, p0, Lcom/android/phone/NetworkSetting;->mPhoneStateReceiver:Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->unregisterIntent()V

    .line 468
    iget-object v0, p0, Lcom/android/phone/NetworkSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/phone/NetworkSetting;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 470
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 8
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v7, 0x1

    .line 217
    iget-object v3, p0, Lcom/android/phone/NetworkSetting;->mAutoSelect:Landroid/preference/Preference;

    if-ne p2, v3, :cond_1

    .line 218
    invoke-direct {p0}, Lcom/android/phone/NetworkSetting;->selectNetworkAutomatic()V

    .line 236
    :cond_0
    :goto_0
    return v7

    .line 219
    :cond_1
    iget-object v3, p0, Lcom/android/phone/NetworkSetting;->mManuSelect:Landroid/preference/Preference;

    if-ne p2, v3, :cond_0

    .line 220
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->isDualTalkMode()Z

    move-result v3

    if-nez v3, :cond_2

    .line 221
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "gprs_connection_sim_setting"

    const-wide/16 v5, -0x5

    invoke-static {v3, v4, v5, v6}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 223
    .local v0, dataConnectionId:J
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dataConnectionId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/NetworkSetting;->log(Ljava/lang/String;)V

    .line 224
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-eqz v3, :cond_2

    .line 225
    invoke-static {p0, v0, v1}, Landroid/provider/Telephony$SIMInfo;->getSlotById(Landroid/content/Context;J)I

    move-result v2

    .line 226
    .local v2, slot:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "slot = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/phone/NetworkSetting;->log(Ljava/lang/String;)V

    .line 227
    iget v3, p0, Lcom/android/phone/NetworkSetting;->mSimId:I

    if-eq v2, v3, :cond_2

    .line 229
    const/16 v3, 0x1f4

    invoke-virtual {p0, v3}, Lcom/android/phone/NetworkSetting;->showDialog(I)V

    goto :goto_0

    .line 234
    .end local v0           #dataConnectionId:J
    .end local v2           #slot:I
    :cond_2
    const/16 v3, 0xc8

    invoke-virtual {p0, v3}, Lcom/android/phone/NetworkSetting;->showDialog(I)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v1, 0x1

    .line 447
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 448
    iput-boolean v1, p0, Lcom/android/phone/NetworkSetting;->mIsForeground:Z

    .line 450
    iget-object v0, p0, Lcom/android/phone/NetworkSetting;->mPhoneStateReceiver:Lcom/android/internal/telephony/PhoneStateIntentReceiver;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->registerIntent()V

    .line 451
    iget-object v0, p0, Lcom/android/phone/NetworkSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/android/phone/NetworkSetting;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v2}, Lcom/android/phone/NetworkSetting;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 452
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "airplane_mode_on"

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v1, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/android/phone/NetworkSetting;->mAirplaneModeEnabled:Z

    .line 453
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 454
    invoke-virtual {p0}, Lcom/android/phone/NetworkSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/NetworkSetting;->mDualSimMode:I

    .line 456
    const-string v0, "phone"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "NetworkSettings.onResume(), mDualSimMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/phone/NetworkSetting;->mDualSimMode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    :cond_0
    invoke-direct {p0, v1}, Lcom/android/phone/NetworkSetting;->setScreenEnabled(Z)V

    .line 460
    return-void

    .line 452
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
