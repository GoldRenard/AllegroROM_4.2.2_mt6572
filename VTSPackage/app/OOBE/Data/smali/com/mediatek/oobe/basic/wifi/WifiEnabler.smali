.class public Lcom/mediatek/oobe/basic/wifi/WifiEnabler;
.super Ljava/lang/Object;
.source "WifiEnabler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "OOBE"

.field private static final WIFI_SWITCH_ENABLER:Ljava/lang/String; = "wifi_switch"


# instance fields
.field private mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mContext:Landroid/content/Context;

.field mExt:Lcom/mediatek/oobe/ext/IWifiExt;

.field private final mIntentFilter:Landroid/content/IntentFilter;

.field mPreferenceChangeListener:Landroid/preference/Preference$OnPreferenceChangeListener;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mStateMachineEvent:Z

.field private mSwitchPre:Landroid/preference/SwitchPreference;

.field private final mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/preference/Preference;)V
    .locals 2
    .parameter "context"
    .parameter "switchPref"

    .prologue
    .line 118
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 94
    new-instance v0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$1;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 131
    new-instance v0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler$2;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mPreferenceChangeListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    .line 119
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;

    .line 120
    check-cast p2, Landroid/preference/SwitchPreference;

    .end local p2
    iput-object p2, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    .line 122
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 123
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    .line 125
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mediatek/oobe/utils/Utils;->getWifiPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiExt;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    .line 129
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->handleWifiStateChanged(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;Landroid/net/NetworkInfo$DetailedState;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->handleStateChanged(Landroid/net/NetworkInfo$DetailedState;)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mStateMachineEvent:Z

    return v0
.end method

.method static synthetic access$302(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mStateMachineEvent:Z

    return p1
.end method

.method static synthetic access$400(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/net/wifi/WifiManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/oobe/basic/wifi/WifiEnabler;)Landroid/preference/SwitchPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    return-object v0
.end method

.method private handleStateChanged(Landroid/net/NetworkInfo$DetailedState;)V
    .locals 0
    .parameter "state"

    .prologue
    .line 248
    return-void
.end method

.method private handleWifiStateChanged(I)V
    .locals 2
    .parameter "state"

    .prologue
    const/4 v1, 0x0

    .line 210
    packed-switch p1, :pswitch_data_0

    .line 226
    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->setSwitchChecked(Z)V

    .line 227
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    invoke-interface {v1}, Lcom/mediatek/oobe/ext/IWifiExt;->getSwitchState()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    .line 230
    :goto_0
    return-void

    .line 212
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    invoke-virtual {v0, v1}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    goto :goto_0

    .line 215
    :pswitch_1
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->setSwitchChecked(Z)V

    .line 216
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    invoke-interface {v1}, Lcom/mediatek/oobe/ext/IWifiExt;->getSwitchState()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    goto :goto_0

    .line 219
    :pswitch_2
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    invoke-virtual {v0, v1}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    goto :goto_0

    .line 222
    :pswitch_3
    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->setSwitchChecked(Z)V

    .line 223
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    invoke-interface {v1}, Lcom/mediatek/oobe/ext/IWifiExt;->getSwitchState()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/SwitchPreference;->setEnabled(Z)V

    goto :goto_0

    .line 210
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static isAirplaneModeOn(Landroid/content/Context;)Z
    .locals 3
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 256
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static isRadioAllowed(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .parameter "context"
    .parameter "type"

    .prologue
    const/4 v1, 0x1

    .line 266
    invoke-static {p0}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 272
    :cond_0
    :goto_0
    return v1

    .line 270
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_toggleable_radios"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 272
    .local v0, toggleable:Ljava/lang/String;
    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setSwitchChecked(Z)V
    .locals 1
    .parameter "checked"

    .prologue
    .line 233
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    invoke-virtual {v0}, Landroid/preference/SwitchPreference;->isChecked()Z

    move-result v0

    if-eq p1, v0, :cond_0

    .line 234
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mStateMachineEvent:Z

    .line 235
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    invoke-virtual {v0, p1}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 237
    :cond_0
    return-void
.end method


# virtual methods
.method public pause()V
    .locals 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 204
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 206
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    invoke-interface {v0}, Lcom/mediatek/oobe/ext/IWifiExt;->unRegisterAirplaneObserver()V

    .line 207
    return-void
.end method

.method public resume()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 183
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v0

    .line 184
    .local v0, wifiState:I
    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 185
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    invoke-virtual {v1, v2}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 191
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 192
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mPreferenceChangeListener:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {v1, v2}, Landroid/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 194
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    invoke-interface {v1, v2}, Lcom/mediatek/oobe/ext/IWifiExt;->registerAirplaneModeObserver(Landroid/preference/SwitchPreference;)V

    .line 195
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    invoke-interface {v1, v2}, Lcom/mediatek/oobe/ext/IWifiExt;->initSwitchState(Landroid/preference/SwitchPreference;)V

    .line 197
    return-void

    .line 186
    :cond_1
    if-ne v0, v2, :cond_0

    .line 187
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->mSwitchPre:Landroid/preference/SwitchPreference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    goto :goto_0
.end method
