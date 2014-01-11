.class public Lcom/android/settings/wifi/WifiApEnabler;
.super Landroid/app/Fragment;
.source "WifiApEnabler.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final INVALID:I = -0x1

.field private static final PROVISION_REQUEST:I = 0x0

.field static final TAG:Ljava/lang/String; = "WifiApEnabler"

.field private static final WIFI_IPV4:I = 0xf

.field private static final WIFI_IPV6:I = 0xf0

.field private static final WIFI_SWITCH_SETTINGS:Ljava/lang/String; = "wifi_tether_settings"

.field private static final WIFI_TETHERING:I


# instance fields
.field private mBandwidthPre:Landroid/preference/Preference;

.field mCm:Landroid/net/ConnectivityManager;

.field private final mContext:Landroid/content/Context;

.field mExt:Lcom/mediatek/settings/ext/IWifiExt;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mOriginalSummary:Ljava/lang/CharSequence;

.field private mProvisionApp:[Ljava/lang/String;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mStateMachineEvent:Z

.field private mSwitch:Landroid/widget/Switch;

.field private mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

.field private mTetherChoice:I

.field private mTetherSettings:Lcom/android/settings/TetherSettings;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private mWifiRegexs:[Ljava/lang/String;

.field private mWpsConnectPre:Landroid/preference/Preference;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/Switch;Landroid/preference/Preference;Landroid/preference/Preference;)V
    .locals 1
    .parameter "context"
    .parameter "switch_"
    .parameter "wps"
    .parameter "bandwith"

    .prologue
    .line 104
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mTetherChoice:I

    .line 76
    new-instance v0, Lcom/android/settings/wifi/WifiApEnabler$1;

    invoke-direct {v0, p0}, Lcom/android/settings/wifi/WifiApEnabler$1;-><init>(Lcom/android/settings/wifi/WifiApEnabler;)V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 105
    iput-object p1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    .line 106
    iput-object p2, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    .line 107
    iput-object p3, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWpsConnectPre:Landroid/preference/Preference;

    .line 108
    iput-object p4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mBandwidthPre:Landroid/preference/Preference;

    .line 109
    invoke-virtual {p0, p1}, Lcom/android/settings/wifi/WifiApEnabler;->init(Landroid/content/Context;)V

    .line 110
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;)V
    .locals 1
    .parameter "context"
    .parameter "preference"

    .prologue
    .line 112
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mTetherChoice:I

    .line 76
    new-instance v0, Lcom/android/settings/wifi/WifiApEnabler$1;

    invoke-direct {v0, p0}, Lcom/android/settings/wifi/WifiApEnabler$1;-><init>(Lcom/android/settings/wifi/WifiApEnabler;)V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 113
    iput-object p1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    .line 114
    iput-object p2, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    .line 115
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    invoke-virtual {v0}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mOriginalSummary:Ljava/lang/CharSequence;

    .line 116
    invoke-virtual {p0, p1}, Lcom/android/settings/wifi/WifiApEnabler;->init(Landroid/content/Context;)V

    .line 117
    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/wifi/WifiApEnabler;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/android/settings/wifi/WifiApEnabler;->handleWifiApStateChanged(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/settings/wifi/WifiApEnabler;[Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/android/settings/wifi/WifiApEnabler;->updateTetherStateForIpv6([Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/settings/wifi/WifiApEnabler;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApEnabler;->enableWifiCheckBox()V

    return-void
.end method

.method private enableWifiCheckBox()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 159
    iget-object v3, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "airplane_mode_on"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_0

    move v0, v1

    .line 161
    .local v0, isAirplaneMode:Z
    :goto_0
    if-nez v0, :cond_1

    .line 162
    invoke-direct {p0, v1}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchEnabled(Z)V

    .line 169
    :goto_1
    return-void

    .end local v0           #isAirplaneMode:Z
    :cond_0
    move v0, v2

    .line 159
    goto :goto_0

    .line 164
    .restart local v0       #isAirplaneMode:Z
    :cond_1
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-nez v1, :cond_2

    .line 165
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    iget-object v3, p0, Lcom/android/settings/wifi/WifiApEnabler;->mOriginalSummary:Ljava/lang/CharSequence;

    invoke-virtual {v1, v3}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 167
    :cond_2
    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchEnabled(Z)V

    goto :goto_1
.end method

.method private handleWifiApStateChanged(I)V
    .locals 2
    .parameter "state"

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 324
    packed-switch p1, :pswitch_data_0

    .line 361
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApEnabler;->enableWifiCheckBox()V

    .line 364
    :cond_0
    :goto_0
    return-void

    .line 326
    :pswitch_0
    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchEnabled(Z)V

    .line 327
    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setPreferenceState(Z)V

    .line 328
    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setStartTime(Z)V

    .line 329
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-nez v0, :cond_0

    .line 330
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    const v1, 0x7f0b04bc

    invoke-virtual {v0, v1}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(I)V

    goto :goto_0

    .line 338
    :pswitch_1
    invoke-direct {p0, v1}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchChecked(Z)V

    .line 339
    invoke-direct {p0, v1}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchEnabled(Z)V

    .line 340
    invoke-direct {p0, v1}, Lcom/android/settings/wifi/WifiApEnabler;->setPreferenceState(Z)V

    .line 341
    invoke-direct {p0, v1}, Lcom/android/settings/wifi/WifiApEnabler;->setStartTime(Z)V

    goto :goto_0

    .line 344
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchEnabled(Z)V

    .line 345
    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setPreferenceState(Z)V

    .line 346
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-nez v0, :cond_0

    .line 347
    const-string v0, "WifiApEnabler"

    const-string v1, "wifi_stopping"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    const v1, 0x7f0b04bd

    invoke-virtual {v0, v1}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(I)V

    goto :goto_0

    .line 352
    :pswitch_3
    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchChecked(Z)V

    .line 353
    invoke-direct {p0, v1}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchEnabled(Z)V

    .line 354
    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setPreferenceState(Z)V

    .line 355
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-nez v0, :cond_1

    .line 356
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mOriginalSummary:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 358
    :cond_1
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApEnabler;->enableWifiCheckBox()V

    goto :goto_0

    .line 324
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private setPreferenceState(Z)V
    .locals 3
    .parameter "enabled"

    .prologue
    .line 382
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-eqz v1, :cond_1

    .line 383
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mBandwidthPre:Landroid/preference/Preference;

    invoke-virtual {v1, p1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 384
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 385
    .local v0, wifiConfig:Landroid/net/wifi/WifiConfiguration;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/android/settings/wifi/WifiApDialog;->getSecurityTypeIndex(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 386
    const-string v1, "WifiApEnabler"

    const-string v2, "security is wpa psk, disable wps connect preference"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    const/4 p1, 0x0

    .line 389
    :cond_0
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWpsConnectPre:Landroid/preference/Preference;

    invoke-virtual {v1, p1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 391
    .end local v0           #wifiConfig:Landroid/net/wifi/WifiConfiguration;
    :cond_1
    return-void
.end method

.method private setStartTime(Z)V
    .locals 8
    .parameter "enable"

    .prologue
    const-wide/16 v6, 0x0

    .line 446
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "wifi_hotspot_start_time"

    invoke-static {v4, v5, v6, v7}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v2

    .line 448
    .local v2, startTime:J
    if-eqz p1, :cond_1

    .line 449
    cmp-long v4, v2, v6

    if-nez v4, :cond_0

    .line 450
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "wifi_hotspot_start_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 452
    const-string v4, "WifiApEnabler"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "enable value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    :cond_0
    :goto_0
    return-void

    .line 455
    :cond_1
    const-wide/16 v0, 0x0

    .line 456
    .local v0, newValue:J
    const-string v4, "WifiApEnabler"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "disable value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "wifi_hotspot_start_time"

    invoke-static {v4, v5, v0, v1}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    goto :goto_0
.end method

.method private setSwitchChecked(Z)V
    .locals 1
    .parameter "checked"

    .prologue
    .line 366
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mStateMachineEvent:Z

    .line 367
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-eqz v0, :cond_0

    .line 368
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 372
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mStateMachineEvent:Z

    .line 373
    return-void

    .line 370
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    invoke-virtual {v0, p1}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setChecked(Z)V

    goto :goto_0
.end method

.method private setSwitchEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 375
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p1}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 380
    :goto_0
    return-void

    .line 378
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    invoke-virtual {v0, p1}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setEnabled(Z)V

    goto :goto_0
.end method

.method private startProvisioningIfNecessary(I)V
    .locals 5
    .parameter "choice"

    .prologue
    const/4 v4, 0x0

    .line 421
    iput p1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mTetherChoice:I

    .line 422
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiApEnabler;->isProvisioningNeeded()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 423
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 424
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mProvisionApp:[Ljava/lang/String;

    aget-object v1, v1, v4

    iget-object v2, p0, Lcom/android/settings/wifi/WifiApEnabler;->mProvisionApp:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 425
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiApEnabler;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 426
    const-string v1, "WifiApEnabler"

    const-string v2, "startProvisioningIfNecessary, startActivityForResult"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 428
    :cond_0
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApEnabler;->startTethering()V

    goto :goto_0
.end method

.method private startTethering()V
    .locals 2

    .prologue
    .line 440
    iget v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mTetherChoice:I

    if-nez v0, :cond_0

    .line 441
    const-string v0, "WifiApEnabler"

    const-string v1, "startTethering, setSoftapEnabled"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/settings/wifi/WifiApEnabler;->setSoftapEnabled(Z)V

    .line 444
    :cond_0
    return-void
.end method

.method private updateTetherState([Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 14
    .parameter "available"
    .parameter "tethered"
    .parameter "errored"

    .prologue
    .line 293
    const/4 v11, 0x0

    .line 294
    .local v11, wifiTethered:Z
    const/4 v10, 0x0

    .line 296
    .local v10, wifiErrored:Z
    move-object/from16 v0, p2

    .local v0, arr$:[Ljava/lang/Object;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    move v3, v2

    .end local v0           #arr$:[Ljava/lang/Object;
    .end local v2           #i$:I
    .end local v4           #len$:I
    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v6, v0, v3

    .local v6, o:Ljava/lang/Object;
    move-object v8, v6

    .line 297
    check-cast v8, Ljava/lang/String;

    .line 298
    .local v8, s:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiRegexs:[Ljava/lang/String;

    .local v1, arr$:[Ljava/lang/String;
    array-length v5, v1

    .local v5, len$:I
    const/4 v2, 0x0

    .end local v3           #i$:I
    .restart local v2       #i$:I
    :goto_1
    if-ge v2, v5, :cond_1

    aget-object v7, v1, v2

    .line 299
    .local v7, regex:Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 300
    const/4 v11, 0x1

    .line 298
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 296
    .end local v7           #regex:Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2           #i$:I
    .restart local v3       #i$:I
    goto :goto_0

    .line 304
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v5           #len$:I
    .end local v6           #o:Ljava/lang/Object;
    .end local v8           #s:Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p3

    .restart local v0       #arr$:[Ljava/lang/Object;
    array-length v4, v0

    .restart local v4       #len$:I
    const/4 v2, 0x0

    .end local v3           #i$:I
    .restart local v2       #i$:I
    move v3, v2

    .end local v0           #arr$:[Ljava/lang/Object;
    .end local v2           #i$:I
    .end local v4           #len$:I
    .restart local v3       #i$:I
    :goto_2
    if-ge v3, v4, :cond_5

    aget-object v6, v0, v3

    .restart local v6       #o:Ljava/lang/Object;
    move-object v8, v6

    .line 305
    check-cast v8, Ljava/lang/String;

    .line 306
    .restart local v8       #s:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiRegexs:[Ljava/lang/String;

    .restart local v1       #arr$:[Ljava/lang/String;
    array-length v5, v1

    .restart local v5       #len$:I
    const/4 v2, 0x0

    .end local v3           #i$:I
    .restart local v2       #i$:I
    :goto_3
    if-ge v2, v5, :cond_4

    aget-object v7, v1, v2

    .line 307
    .restart local v7       #regex:Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 308
    const/4 v10, 0x1

    .line 306
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 304
    .end local v7           #regex:Ljava/lang/String;
    :cond_4
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2           #i$:I
    .restart local v3       #i$:I
    goto :goto_2

    .line 313
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v5           #len$:I
    .end local v6           #o:Ljava/lang/Object;
    .end local v8           #s:Ljava/lang/String;
    :cond_5
    if-eqz v11, :cond_7

    .line 314
    iget-object v12, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v12}, Landroid/net/wifi/WifiManager;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v9

    .line 315
    .local v9, wifiConfig:Landroid/net/wifi/WifiConfiguration;
    invoke-virtual {p0, v9}, Lcom/android/settings/wifi/WifiApEnabler;->updateConfigSummary(Landroid/net/wifi/WifiConfiguration;)V

    .line 321
    .end local v9           #wifiConfig:Landroid/net/wifi/WifiConfiguration;
    :cond_6
    :goto_4
    return-void

    .line 316
    :cond_7
    if-eqz v10, :cond_6

    .line 317
    iget-object v12, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-nez v12, :cond_6

    .line 318
    iget-object v12, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    const v13, 0x7f0b0439

    invoke-virtual {v12, v13}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(I)V

    goto :goto_4
.end method

.method private updateTetherStateForIpv6([Ljava/lang/Object;[Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 19
    .parameter "available"
    .parameter "tethered"
    .parameter "errored"

    .prologue
    .line 220
    const/4 v15, 0x0

    .line 221
    .local v15, wifiTethered:Z
    const/4 v14, 0x0

    .line 223
    .local v14, wifiErrored:Z
    const/4 v12, 0x0

    .line 224
    .local v12, wifiErrorIpv4:I
    const/16 v13, 0x10

    .line 225
    .local v13, wifiErrorIpv6:I
    move-object/from16 v1, p1

    .local v1, arr$:[Ljava/lang/Object;
    array-length v5, v1

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    move v4, v3

    .end local v1           #arr$:[Ljava/lang/Object;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_3

    aget-object v7, v1, v4

    .local v7, o:Ljava/lang/Object;
    move-object v9, v7

    .line 226
    check-cast v9, Ljava/lang/String;

    .line 227
    .local v9, s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiRegexs:[Ljava/lang/String;

    .local v2, arr$:[Ljava/lang/String;
    array-length v6, v2

    .local v6, len$:I
    const/4 v3, 0x0

    .end local v4           #i$:I
    .restart local v3       #i$:I
    :goto_1
    if-ge v3, v6, :cond_2

    aget-object v8, v2, v3

    .line 228
    .local v8, regex:Ljava/lang/String;
    invoke-virtual {v9, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_1

    .line 229
    if-nez v12, :cond_0

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mCm:Landroid/net/ConnectivityManager;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Landroid/net/ConnectivityManager;->getLastTetherError(Ljava/lang/String;)I

    move-result v16

    and-int/lit8 v12, v16, 0xf

    .line 232
    :cond_0
    const/16 v16, 0x10

    move/from16 v0, v16

    if-ne v13, v0, :cond_1

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mCm:Landroid/net/ConnectivityManager;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Landroid/net/ConnectivityManager;->getLastTetherError(Ljava/lang/String;)I

    move-result v16

    move/from16 v0, v16

    and-int/lit16 v13, v0, 0xf0

    .line 227
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 225
    .end local v8           #regex:Ljava/lang/String;
    :cond_2
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3           #i$:I
    .restart local v4       #i$:I
    goto :goto_0

    .line 239
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v6           #len$:I
    .end local v7           #o:Ljava/lang/Object;
    .end local v9           #s:Ljava/lang/String;
    :cond_3
    move-object/from16 v1, p2

    .restart local v1       #arr$:[Ljava/lang/Object;
    array-length v5, v1

    .restart local v5       #len$:I
    const/4 v3, 0x0

    .end local v4           #i$:I
    .restart local v3       #i$:I
    move v4, v3

    .end local v1           #arr$:[Ljava/lang/Object;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .restart local v4       #i$:I
    :goto_2
    if-ge v4, v5, :cond_6

    aget-object v7, v1, v4

    .restart local v7       #o:Ljava/lang/Object;
    move-object v9, v7

    .line 240
    check-cast v9, Ljava/lang/String;

    .line 241
    .restart local v9       #s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiRegexs:[Ljava/lang/String;

    .restart local v2       #arr$:[Ljava/lang/String;
    array-length v6, v2

    .restart local v6       #len$:I
    const/4 v3, 0x0

    .end local v4           #i$:I
    .restart local v3       #i$:I
    :goto_3
    if-ge v3, v6, :cond_5

    aget-object v8, v2, v3

    .line 242
    .restart local v8       #regex:Ljava/lang/String;
    invoke-virtual {v9, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 243
    const/4 v15, 0x1

    .line 245
    const/16 v16, 0x10

    move/from16 v0, v16

    if-ne v13, v0, :cond_4

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mCm:Landroid/net/ConnectivityManager;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Landroid/net/ConnectivityManager;->getLastTetherError(Ljava/lang/String;)I

    move-result v16

    move/from16 v0, v16

    and-int/lit16 v13, v0, 0xf0

    .line 241
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 239
    .end local v8           #regex:Ljava/lang/String;
    :cond_5
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3           #i$:I
    .restart local v4       #i$:I
    goto :goto_2

    .line 253
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v6           #len$:I
    .end local v7           #o:Ljava/lang/Object;
    .end local v9           #s:Ljava/lang/String;
    :cond_6
    move-object/from16 v1, p3

    .restart local v1       #arr$:[Ljava/lang/Object;
    array-length v5, v1

    .restart local v5       #len$:I
    const/4 v3, 0x0

    .end local v4           #i$:I
    .restart local v3       #i$:I
    move v4, v3

    .end local v1           #arr$:[Ljava/lang/Object;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .restart local v4       #i$:I
    :goto_4
    if-ge v4, v5, :cond_9

    aget-object v7, v1, v4

    .restart local v7       #o:Ljava/lang/Object;
    move-object v9, v7

    .line 254
    check-cast v9, Ljava/lang/String;

    .line 255
    .restart local v9       #s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiRegexs:[Ljava/lang/String;

    .restart local v2       #arr$:[Ljava/lang/String;
    array-length v6, v2

    .restart local v6       #len$:I
    const/4 v3, 0x0

    .end local v4           #i$:I
    .restart local v3       #i$:I
    :goto_5
    if-ge v3, v6, :cond_8

    aget-object v8, v2, v3

    .line 256
    .restart local v8       #regex:Ljava/lang/String;
    invoke-virtual {v9, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_7

    .line 257
    const/4 v14, 0x1

    .line 255
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 253
    .end local v8           #regex:Ljava/lang/String;
    :cond_8
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3           #i$:I
    .restart local v4       #i$:I
    goto :goto_4

    .line 262
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v6           #len$:I
    .end local v7           #o:Ljava/lang/Object;
    .end local v9           #s:Ljava/lang/String;
    :cond_9
    if-eqz v15, :cond_c

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/net/wifi/WifiManager;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v11

    .line 264
    .local v11, wifiConfig:Landroid/net/wifi/WifiConfiguration;
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/settings/wifi/WifiApEnabler;->updateConfigSummary(Landroid/net/wifi/WifiConfiguration;)V

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    const v17, 0x104040c

    invoke-virtual/range {v16 .. v17}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 267
    .restart local v9       #s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    const v17, 0x7f0b04be

    invoke-virtual/range {v16 .. v17}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    if-nez v11, :cond_b

    .end local v9           #s:Ljava/lang/String;
    :goto_6
    aput-object v9, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 271
    .local v10, tetheringActive:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mTetherSettings:Lcom/android/settings/TetherSettings;

    move-object/from16 v16, v0

    if-eqz v16, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    move-object/from16 v16, v0

    if-nez v16, :cond_a

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mTetherSettings:Lcom/android/settings/TetherSettings;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12, v13}, Lcom/android/settings/TetherSettings;->getIPV6String(II)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 280
    .end local v10           #tetheringActive:Ljava/lang/String;
    .end local v11           #wifiConfig:Landroid/net/wifi/WifiConfiguration;
    :cond_a
    :goto_7
    return-void

    .line 267
    .restart local v9       #s:Ljava/lang/String;
    .restart local v11       #wifiConfig:Landroid/net/wifi/WifiConfiguration;
    :cond_b
    iget-object v9, v11, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    goto :goto_6

    .line 275
    .end local v9           #s:Ljava/lang/String;
    .end local v11           #wifiConfig:Landroid/net/wifi/WifiConfiguration;
    :cond_c
    if-eqz v14, :cond_a

    .line 276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    move-object/from16 v16, v0

    if-nez v16, :cond_a

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    move-object/from16 v16, v0

    const v17, 0x7f0b0439

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(I)V

    goto :goto_7
.end method


# virtual methods
.method public init(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 122
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 124
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mCm:Landroid/net/ConnectivityManager;

    .line 126
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mCm:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getTetherableWifiRegexs()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiRegexs:[Ljava/lang/String;

    .line 128
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.WIFI_AP_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    .line 129
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x107001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mProvisionApp:[Ljava/lang/String;

    .line 134
    return-void
.end method

.method isProvisioningNeeded()Z
    .locals 2

    .prologue
    .line 418
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mProvisionApp:[Ljava/lang/String;

    array-length v0, v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    .line 432
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 433
    if-nez p1, :cond_0

    .line 434
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 435
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApEnabler;->startTethering()V

    .line 438
    :cond_0
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    const/4 v3, 0x0

    .line 407
    iget-boolean v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mStateMachineEvent:Z

    if-eqz v0, :cond_0

    .line 416
    :goto_0
    return-void

    .line 410
    :cond_0
    const-string v0, "WifiApEnabler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCheckedChanged, isChecked:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    if-eqz p2, :cond_1

    .line 412
    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiApEnabler;->startProvisioningIfNecessary(I)V

    goto :goto_0

    .line 414
    :cond_1
    invoke-virtual {p0, v3}, Lcom/android/settings/wifi/WifiApEnabler;->setSoftapEnabled(Z)V

    goto :goto_0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .parameter "preference"
    .parameter "value"

    .prologue
    const/4 v4, 0x0

    .line 393
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "wifi_tether_settings"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 394
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 395
    .local v0, isChecked:Z
    const-string v1, "WifiApEnabler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPreferenceChange, isChecked:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    if-eqz v0, :cond_1

    .line 397
    invoke-direct {p0, v4}, Lcom/android/settings/wifi/WifiApEnabler;->startProvisioningIfNecessary(I)V

    .line 402
    .end local v0           #isChecked:Z
    :cond_0
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 399
    .restart local v0       #isChecked:Z
    :cond_1
    invoke-virtual {p0, v4}, Lcom/android/settings/wifi/WifiApEnabler;->setSoftapEnabled(Z)V

    goto :goto_0
.end method

.method public pause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 149
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 151
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 156
    :goto_0
    return-void

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    invoke-virtual {v0, v2}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_0
.end method

.method public resume()V
    .locals 3

    .prologue
    .line 137
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/android/settings/wifi/WifiApEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 139
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 145
    :goto_0
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiApEnabler;->enableWifiCheckBox()V

    .line 146
    return-void

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    invoke-virtual {v0, p0}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_0
.end method

.method public setSoftapEnabled(Z)V
    .locals 8
    .parameter "enable"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 172
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 176
    .local v0, cr:Landroid/content/ContentResolver;
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v3

    .line 177
    .local v3, wifiState:I
    if-eqz p1, :cond_1

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_1

    .line 179
    :cond_0
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4, v6}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 180
    const-string v4, "wifi_saved_state"

    invoke-static {v0, v4, v7}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 183
    :cond_1
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, p1}, Landroid/net/wifi/WifiManager;->setWifiApEnabled(Landroid/net/wifi/WifiConfiguration;Z)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 185
    invoke-direct {p0, v6}, Lcom/android/settings/wifi/WifiApEnabler;->setSwitchEnabled(Z)V

    .line 195
    :cond_2
    :goto_0
    if-nez p1, :cond_3

    .line 196
    const/4 v2, 0x0

    .line 198
    .local v2, wifiSavedState:I
    :try_start_0
    const-string v4, "wifi_saved_state"

    invoke-static {v0, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 202
    :goto_1
    if-ne v2, v7, :cond_3

    .line 203
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4, v7}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 204
    const-string v4, "wifi_saved_state"

    invoke-static {v0, v4, v6}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 207
    .end local v2           #wifiSavedState:I
    :cond_3
    return-void

    .line 187
    :cond_4
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-nez v4, :cond_2

    .line 188
    iget-object v4, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    const v5, 0x7f0b0439

    invoke-virtual {v4, v5}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(I)V

    goto :goto_0

    .line 199
    .restart local v2       #wifiSavedState:I
    :catch_0
    move-exception v1

    .line 200
    .local v1, e:Landroid/provider/Settings$SettingNotFoundException;
    const-string v4, "WifiApEnabler"

    const-string v5, "SettingNotFoundException"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public setTetherSettings(Lcom/android/settings/TetherSettings;)V
    .locals 0
    .parameter "tetherSettings"

    .prologue
    .line 289
    iput-object p1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mTetherSettings:Lcom/android/settings/TetherSettings;

    .line 290
    return-void
.end method

.method public updateConfigSummary(Landroid/net/wifi/WifiConfiguration;)V
    .locals 5
    .parameter "wifiConfig"

    .prologue
    .line 210
    const-string v1, "wlan"

    const-string v2, "SSID"

    iget-object v3, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    const v4, 0x104040c

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/mediatek/custom/CustomProperties;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    .local v0, s:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitch:Landroid/widget/Switch;

    if-nez v1, :cond_0

    .line 214
    iget-object v1, p0, Lcom/android/settings/wifi/WifiApEnabler;->mSwitchPreference:Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;

    iget-object v2, p0, Lcom/android/settings/wifi/WifiApEnabler;->mContext:Landroid/content/Context;

    const v3, 0x7f0b04be

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    if-nez p1, :cond_1

    .end local v0           #s:Ljava/lang/String;
    :goto_0
    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/wifi/hotspot/HotspotSwitchPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 217
    :cond_0
    return-void

    .line 214
    .restart local v0       #s:Ljava/lang/String;
    :cond_1
    iget-object v0, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    goto :goto_0
.end method
