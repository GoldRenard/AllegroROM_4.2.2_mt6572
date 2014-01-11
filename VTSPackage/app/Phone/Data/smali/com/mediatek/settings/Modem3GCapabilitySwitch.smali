.class public Lcom/mediatek/settings/Modem3GCapabilitySwitch;
.super Landroid/preference/PreferenceActivity;
.source "Modem3GCapabilitySwitch.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;,
        Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field public static final NETWORK_MODE_KEY:Ljava/lang/String; = "preferred_network_mode_key"

.field public static final SERVICE_LIST_KEY:Ljava/lang/String; = "preferred_3g_service_key"

.field private static final SIMID_3G_SERVICE_NOT_SET:I = -0x2

.field private static final SIMID_3G_SERVICE_OFF:I = -0x1

.field private static final SWITCH_3G_TIME_OUT_MSG:I = 0x3e8

.field private static final SWITCH_3G_TIME_OUT_VALUE:I = 0xea60

.field private static final TAG:Ljava/lang/String; = "Settings/Modem3GCapabilitySwitch"

.field private static sInstanceFlag:I


# instance fields
.field private mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

.field private mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

.field mHandler:Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;

.field private mInstanceIndex:I

.field private mNetworkMode:Landroid/preference/ListPreference;

.field private mPD:Landroid/app/ProgressDialog;

.field private mPDSwitching:Landroid/app/ProgressDialog;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

.field private mServiceList:Lcom/mediatek/settings/ServiceSelectList;

.field private mSlr:Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;

.field private mStatusBarManager:Landroid/app/StatusBarManager;

.field private mTimerHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    sput v0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->sInstanceFlag:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 83
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 43
    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    .line 44
    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    .line 48
    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    .line 52
    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 53
    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    .line 56
    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mInstanceIndex:I

    .line 72
    new-instance v0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;-><init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mTimerHandler:Landroid/os/Handler;

    .line 84
    sget v0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->sInstanceFlag:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->sInstanceFlag:I

    iput v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mInstanceIndex:I

    .line 85
    const-string v0, "Settings/Modem3GCapabilitySwitch"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Modem3GCapabilitySwitch(), instanceIndex="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mInstanceIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->disSwitchProgressDialog()V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->setStatusBarEnableStatus(Z)V

    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mTimerHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateNetworkMode()V

    return-void
.end method

.method static synthetic access$1200(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->update3GService()V

    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/mediatek/settings/ServiceSelectList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateSummarys(J)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/Phone;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/preference/ListPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/Modem3GCapabilitySwitch;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updatePreferredNetworkModeSummary(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/android/internal/telephony/gemini/GeminiPhone;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateItemStatus()V

    return-void
.end method

.method static synthetic access$900(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->showInstanceIndex(Ljava/lang/String;)V

    return-void
.end method

.method private disSwitchProgressDialog()V
    .locals 3

    .prologue
    .line 336
    const-string v0, "Settings/Modem3GCapabilitySwitch"

    const-string v1, "disSwitchProgressDialog()"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    const-string v0, "Settings/Modem3GCapabilitySwitch"

    const-string v1, "disSwitchProgressDialog(), take effect"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 340
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    .line 344
    :goto_0
    return-void

    .line 342
    :cond_0
    const-string v1, "Settings/Modem3GCapabilitySwitch"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pdSwitching != null?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private handleServiceSwitch(J)V
    .locals 5
    .parameter "simId"

    .prologue
    .line 347
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v2}, Lcom/android/phone/PhoneInterfaceManager;->is3GSwitchLocked()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 348
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    const-string v3, "Switch has been locked, return"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    :goto_0
    return-void

    .line 351
    :cond_0
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleServiceSwitch("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "), show switching dialog first"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    invoke-virtual {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->showSwitchProgress()V

    .line 353
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->setStatusBarEnableStatus(Z)V

    .line 354
    const/4 v1, -0x1

    .line 355
    .local v1, slotId:I
    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-eqz v2, :cond_1

    .line 356
    invoke-static {p0, p1, p2}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 357
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-nez v0, :cond_2

    const/4 v1, -0x1

    .line 359
    .end local v0           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v2, v1}, Lcom/android/phone/PhoneInterfaceManager;->set3GCapabilitySIM(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 360
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    const-string v3, "Receive ok for the switch, and starting the waiting..."

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 357
    .restart local v0       #info:Landroid/provider/Telephony$SIMInfo;
    :cond_2
    iget v1, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    goto :goto_1

    .line 362
    .end local v0           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_3
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    const-string v3, "Receive error for the switch & Dismiss switching didalog"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->disSwitchProgressDialog()V

    .line 364
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->setStatusBarEnableStatus(Z)V

    goto :goto_0
.end method

.method private setStatusBarEnableStatus(Z)V
    .locals 3
    .parameter "enabled"

    .prologue
    .line 592
    const-string v0, "Settings/Modem3GCapabilitySwitch"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setStatusBarEnableStatus("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-nez v0, :cond_0

    .line 594
    const-string v0, "statusbar"

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatusBarManager;

    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 596
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v0, :cond_2

    .line 597
    if-eqz p1, :cond_1

    .line 598
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mStatusBarManager:Landroid/app/StatusBarManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/StatusBarManager;->disable(I)V

    .line 607
    :goto_0
    return-void

    .line 600
    :cond_1
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mStatusBarManager:Landroid/app/StatusBarManager;

    const/high16 v1, 0x121

    invoke-virtual {v0, v1}, Landroid/app/StatusBarManager;->disable(I)V

    goto :goto_0

    .line 605
    :cond_2
    const-string v0, "Settings/Modem3GCapabilitySwitch"

    const-string v1, "Fail to get status bar instance"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private showInstanceIndex(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 663
    const-string v0, "Settings/Modem3GCapabilitySwitch"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Instance["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mInstanceIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    return-void
.end method

.method private showProgressDialog()V
    .locals 2

    .prologue
    .line 540
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    .line 541
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    const v1, 0x7f0d01df

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 542
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 543
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 544
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 545
    return-void
.end method

.method private update3GService()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 178
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v4}, Lcom/android/phone/PhoneInterfaceManager;->is3GSwitchLocked()Z

    move-result v0

    .line 179
    .local v0, enabled:Z
    if-eqz v0, :cond_1

    .line 190
    :cond_0
    :goto_0
    return-void

    .line 182
    :cond_1
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "airplane_mode_on"

    const/4 v6, -0x1

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_2

    move v1, v2

    .line 185
    .local v1, isAirMode:Z
    :goto_1
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    if-nez v1, :cond_3

    :goto_2
    invoke-virtual {v4, v2}, Lcom/mediatek/settings/ServiceSelectList;->setEnabled(Z)V

    .line 186
    if-eqz v1, :cond_0

    .line 187
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    invoke-virtual {v2}, Lcom/mediatek/settings/ServiceSelectList;->dismissDialogs()V

    goto :goto_0

    .end local v1           #isAirMode:Z
    :cond_2
    move v1, v3

    .line 183
    goto :goto_1

    .restart local v1       #isAirMode:Z
    :cond_3
    move v2, v3

    .line 185
    goto :goto_2
.end method

.method private updateItemStatus()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 548
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v3}, Lcom/android/phone/PhoneInterfaceManager;->is3GSwitchLocked()Z

    move-result v1

    .line 549
    .local v1, enabled:Z
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateItemStatus(), is3GSwitchLocked()?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    if-eqz v3, :cond_0

    .line 551
    iget-object v6, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    if-nez v1, :cond_2

    move v3, v4

    :goto_0
    invoke-virtual {v6, v3}, Lcom/mediatek/settings/ServiceSelectList;->setEnabled(Z)V

    .line 554
    :cond_0
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    if-eqz v3, :cond_1

    .line 558
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v3}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v0

    .line 559
    .local v0, cardSlot:I
    invoke-static {p0, v0}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    .line 560
    .local v2, info:Landroid/provider/Telephony$SIMInfo;
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    if-nez v1, :cond_3

    if-eqz v2, :cond_3

    invoke-static {v0}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v6

    if-eqz v6, :cond_3

    :goto_1
    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 561
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v3}, Landroid/preference/ListPreference;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 562
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 565
    .end local v0           #cardSlot:I
    .end local v2           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    return-void

    :cond_2
    move v3, v5

    .line 551
    goto :goto_0

    .restart local v0       #cardSlot:I
    .restart local v2       #info:Landroid/provider/Telephony$SIMInfo;
    :cond_3
    move v4, v5

    .line 560
    goto :goto_1
.end method

.method private updateNetworkMode()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 160
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    if-nez v2, :cond_0

    .line 175
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v2}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v1

    .line 164
    .local v1, slot:I
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v2}, Lcom/android/phone/PhoneInterfaceManager;->is3GSwitchLocked()Z

    move-result v0

    .line 165
    .local v0, enabled:Z
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateNetworkMode(), 3G capability slot="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    if-nez v0, :cond_1

    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    invoke-static {v1}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 167
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 168
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Try to get preferred network mode for slot "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mHandler:Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;

    invoke-virtual {v3, v5}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPreferredNetworkTypeGemini(Landroid/os/Message;I)V

    goto :goto_0

    .line 172
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2, v5}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 173
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private updatePreferredNetworkModeSummary(I)V
    .locals 3
    .parameter "networkMode"

    .prologue
    .line 505
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, value:Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 534
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v2, "Global"

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 536
    :goto_0
    return-void

    .line 509
    :pswitch_0
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 514
    :pswitch_1
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 518
    :pswitch_2
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 521
    :pswitch_3
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v2, "GSM/WCDMA"

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 524
    :pswitch_4
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v2, "CDMA / EvDo"

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 527
    :pswitch_5
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v2, "CDMA only"

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 530
    :pswitch_6
    iget-object v1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v2, "EvDo only"

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 506
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
    .end packed-switch
.end method

.method private updateSummarys(J)V
    .locals 6
    .parameter "simId"

    .prologue
    const/4 v5, 0x0

    .line 193
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    if-nez v2, :cond_1

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 196
    :cond_1
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateSummarys(), simId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-nez v2, :cond_2

    .line 199
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    const v3, 0x7f0d00a0

    invoke-virtual {v2, v3}, Lcom/mediatek/settings/ServiceSelectList;->setSummary(I)V

    .line 200
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    if-eqz v2, :cond_0

    .line 201
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2, v5}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 202
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 204
    :cond_2
    const-wide/16 v2, -0x2

    cmp-long v2, p1, v2

    if-nez v2, :cond_3

    .line 206
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    const-string v3, ""

    invoke-virtual {v2, v3}, Lcom/mediatek/settings/ServiceSelectList;->setSummary(Ljava/lang/CharSequence;)V

    .line 207
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2, v5}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 208
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 210
    :cond_3
    invoke-static {p0, p1, p2}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 211
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_0

    .line 212
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    iget-object v3, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/mediatek/settings/ServiceSelectList;->setSummary(Ljava/lang/CharSequence;)V

    .line 214
    iget v2, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v1

    .line 215
    .local v1, isPowerOn:Z
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateSummarys(), SIM "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " power status is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2, v1}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 217
    if-nez v1, :cond_0

    .line 218
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public changeForNetworkMode(Ljava/lang/Object;)V
    .locals 8
    .parameter "objValue"

    .prologue
    const/4 v7, 0x1

    .line 225
    iget-object v5, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 227
    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 228
    .local v0, buttonNetworkMode:I
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "preferred_network_mode"

    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 231
    .local v2, settingsNetworkMode:I
    if-eq v0, v2, :cond_0

    .line 232
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->showProgressDialog()V

    .line 234
    packed-switch v0, :pswitch_data_0

    .line 260
    const/4 v1, 0x3

    .line 264
    .local v1, modemNetworkMode:I
    :goto_0
    invoke-direct {p0, v0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updatePreferredNetworkModeSummary(I)V

    .line 266
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "preferred_network_mode"

    invoke-static {v4, v5, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 270
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v4}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v3

    .line 271
    .local v3, slot:I
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 272
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v5, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mHandler:Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;

    invoke-virtual {v5, v7}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v4, v1, v5, v3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setPreferredNetworkTypeGemini(ILandroid/os/Message;I)V

    .line 279
    .end local v1           #modemNetworkMode:I
    .end local v3           #slot:I
    :cond_0
    :goto_1
    return-void

    .line 236
    :pswitch_0
    const/4 v1, 0x7

    .line 237
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 239
    .end local v1           #modemNetworkMode:I
    :pswitch_1
    const/4 v1, 0x6

    .line 240
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 242
    .end local v1           #modemNetworkMode:I
    :pswitch_2
    const/4 v1, 0x5

    .line 243
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 245
    .end local v1           #modemNetworkMode:I
    :pswitch_3
    const/4 v1, 0x4

    .line 246
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 248
    .end local v1           #modemNetworkMode:I
    :pswitch_4
    const/4 v1, 0x3

    .line 249
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 251
    .end local v1           #modemNetworkMode:I
    :pswitch_5
    const/4 v1, 0x2

    .line 252
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 254
    .end local v1           #modemNetworkMode:I
    :pswitch_6
    const/4 v1, 0x1

    .line 255
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 257
    .end local v1           #modemNetworkMode:I
    :pswitch_7
    const/4 v1, 0x0

    .line 258
    .restart local v1       #modemNetworkMode:I
    goto :goto_0

    .line 275
    .restart local v3       #slot:I
    :cond_1
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v5, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mHandler:Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;

    invoke-virtual {v5, v7}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-interface {v4, v1, v5}, Lcom/android/internal/telephony/Phone;->setPreferredNetworkType(ILandroid/os/Message;)V

    goto :goto_1

    .line 234
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method clearAfterSwitch(Landroid/content/Intent;)V
    .locals 6
    .parameter "it"

    .prologue
    .line 314
    const-wide/16 v1, -0x2

    .line 315
    .local v1, simId3G:J
    const-string v4, "Settings/Modem3GCapabilitySwitch"

    const-string v5, "clearAfterSwitch(), remove switching dialog"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->disSwitchProgressDialog()V

    .line 317
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->setStatusBarEnableStatus(Z)V

    .line 320
    sget-object v4, Lcom/android/internal/telephony/gemini/GeminiPhone;->EXTRA_3G_SIM:Ljava/lang/String;

    const/4 v5, -0x2

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 321
    .local v3, slot3G:I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 322
    const-wide/16 v1, -0x1

    .line 330
    :cond_0
    :goto_0
    invoke-direct {p0, v1, v2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateSummarys(J)V

    .line 331
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateNetworkMode()V

    .line 332
    return-void

    .line 324
    :cond_1
    invoke-static {p0, v3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 325
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_0

    .line 326
    iget-wide v1, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "icicle"

    .prologue
    .line 89
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 90
    const-string v3, "Settings/Modem3GCapabilitySwitch"

    const-string v4, "onCreate()"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    const v3, 0x7f06001b

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->addPreferencesFromResource(I)V

    .line 92
    const-string v3, "preferred_3g_service_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/mediatek/settings/ServiceSelectList;

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    .line 93
    const-string v3, "preferred_network_mode_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/ListPreference;

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    .line 94
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    invoke-virtual {v3, p0}, Lcom/mediatek/settings/ServiceSelectList;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 95
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v3, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 96
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 97
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 98
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v3, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 100
    :cond_0
    new-instance v3, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;-><init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Lcom/mediatek/settings/Modem3GCapabilitySwitch$1;)V

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mHandler:Lcom/mediatek/settings/Modem3GCapabilitySwitch$MyHandler;

    .line 101
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    iget-object v3, v3, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    .line 103
    new-instance v3, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;

    invoke-direct {v3, p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;-><init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mSlr:Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;

    .line 104
    new-instance v1, Landroid/content/IntentFilter;

    sget-object v3, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_3G_SWITCH_LOCK_CHANGED:Ljava/lang/String;

    invoke-direct {v1, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 105
    .local v1, intentFilter:Landroid/content/IntentFilter;
    sget-object v3, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_PRE_3G_SWITCH:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 106
    sget-object v3, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_3G_SWITCH_DONE:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 107
    const-string v3, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 108
    const-string v3, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 109
    const-string v3, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 110
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mSlr:Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;

    invoke-virtual {p0, v3, v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 113
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v3}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v2

    .line 114
    .local v2, slot:I
    if-ltz v2, :cond_1

    invoke-static {v2}, Lcom/mediatek/settings/CallSettings;->getBaseband(I)I

    move-result v3

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_1

    .line 115
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070024

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 120
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/ext/ExtensionManager;->getSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    .line 121
    iget-object v3, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    invoke-virtual {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v3, v4, v5}, Lcom/mediatek/phone/ext/SettingsExtension;->removeNMOpFor3GSwitch(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)V

    .line 122
    invoke-virtual {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 123
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_2

    .line 125
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 127
    :cond_2
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 568
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 569
    const-string v0, "Settings/Modem3GCapabilitySwitch"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Instance["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mInstanceIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "onDestroy()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 572
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 574
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 575
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPD:Landroid/app/ProgressDialog;

    .line 577
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->disSwitchProgressDialog()V

    .line 579
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mSlr:Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;

    if-eqz v0, :cond_2

    .line 580
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mSlr:Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 583
    :cond_2
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->setStatusBarEnableStatus(Z)V

    .line 584
    iget-object v0, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mTimerHandler:Landroid/os/Handler;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 585
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 148
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 149
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 156
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 151
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->finish()V

    .line 152
    const/4 v1, 0x1

    goto :goto_0

    .line 149
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .parameter "preference"
    .parameter "objValue"

    .prologue
    .line 282
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;

    if-ne p1, v2, :cond_1

    .line 283
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 286
    .local v0, simId:J
    invoke-direct {p0, v0, v1}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->handleServiceSwitch(J)V

    .line 290
    .end local v0           #simId:J
    :cond_0
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 287
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;

    if-ne p1, v2, :cond_0

    .line 288
    invoke-virtual {p0, p2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->changeForNetworkMode(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 5

    .prologue
    .line 130
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 131
    const-wide/16 v1, -0x2

    .line 132
    .local v1, simId:J
    iget-object v4, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v4}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v3

    .line 133
    .local v3, slot:I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 134
    int-to-long v1, v3

    .line 140
    :goto_0
    invoke-direct {p0, v1, v2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateSummarys(J)V

    .line 141
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateNetworkMode()V

    .line 142
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateItemStatus()V

    .line 143
    invoke-direct {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->update3GService()V

    .line 144
    return-void

    .line 136
    :cond_0
    invoke-static {p0, v3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v0

    .line 137
    .local v0, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_1

    iget-wide v1, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    :goto_1
    goto :goto_0

    :cond_1
    const-wide/16 v1, -0x2

    goto :goto_1
.end method

.method showSwitchProgress()V
    .locals 5

    .prologue
    .line 294
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    if-eqz v2, :cond_0

    .line 295
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    const-string v3, "The progress dialog already exist, so exit!"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    :goto_0
    return-void

    .line 299
    :cond_0
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-direct {v2, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    .line 300
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    if-eqz v2, :cond_1

    .line 301
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d009e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 303
    :cond_1
    const-string v2, "Settings/Modem3GCapabilitySwitch"

    const-string v3, "Create and show the progress dialog..."

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 306
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 307
    .local v1, win:Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 308
    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v3, -0x8000

    or-int/2addr v2, v3

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 309
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 310
    iget-object v2, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPDSwitching:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V

    goto :goto_0
.end method
