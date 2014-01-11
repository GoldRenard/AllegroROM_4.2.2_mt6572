.class public Lcom/mediatek/wifi/hotspot/TetherWifiSettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "TetherWifiSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Lcom/mediatek/wifi/hotspot/ButtonPreference$OnButtonClickCallback;


# static fields
.field private static final BANDWIDTH:Ljava/lang/String; = "bandwidth_usage"

.field private static final BLOCKED_CATEGORY:Ljava/lang/String; = "blocked_category"

.field private static final CONFIG_SUBTEXT:I = 0x7f0b04c1

.field private static final CONNECTED_CATEGORY:Ljava/lang/String; = "connected_category"

.field private static final DIALOG_AP_CLIENT_DETAIL:I = 0x3

.field private static final DIALOG_AP_SETTINGS:I = 0x2

.field private static final DIALOG_WPS_CONNECT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "TetherWifiSettings"

.field private static final WIFI_AP_AUTO_CHANNEL_TEXT:I = 0x7f0b013a

.field private static final WIFI_AP_AUTO_CHANNEL_WIDTH_TEXT:I = 0x7f0b013b

.field private static final WIFI_AP_FIX_CHANNEL_WIDTH_TEXT:I = 0x7f0b0139

.field private static final WIFI_AP_SSID_AND_SECURITY:Ljava/lang/String; = "wifi_ap_ssid_and_security"

.field private static final WIFI_AUTO_DISABLE:Ljava/lang/String; = "wifi_auto_disable"

.field private static final WPS_CONNECT:Ljava/lang/String; = "wps_connect"


# instance fields
.field private mBandwidth:Landroid/preference/Preference;

.field private mBlockedCategory:Landroid/preference/PreferenceCategory;

.field private mClientList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/HotspotClient;",
            ">;"
        }
    .end annotation
.end field

.field private mConnectedCategory:Landroid/preference/PreferenceCategory;

.field private mCreateNetwork:Landroid/preference/Preference;

.field private mDetailView:Landroid/view/View;

.field private mDialog:Lcom/android/settings/wifi/WifiApDialog;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSecurityType:[Ljava/lang/String;

.field private mWifiApEnabler:Lcom/android/settings/wifi/WifiApEnabler;

.field private mWifiAutoDisable:Landroid/preference/ListPreference;

.field private mWifiConfig:Landroid/net/wifi/WifiConfiguration;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private mWifiRegexs:[Ljava/lang/String;

.field private mWpsConnect:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    .line 100
    new-instance v0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings$1;-><init>(Lcom/mediatek/wifi/hotspot/TetherWifiSettings;)V

    iput-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/wifi/hotspot/TetherWifiSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->handleWifiApClientsChanged()V

    return-void
.end method

.method private static findIface([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "ifaces"
    .parameter "regexes"

    .prologue
    .line 287
    move-object v0, p0

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    move v3, v2

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v5           #len$:I
    .local v3, i$:I
    :goto_0
    if-ge v3, v5, :cond_2

    aget-object v4, v0, v3

    .line 288
    .local v4, iface:Ljava/lang/String;
    move-object v1, p1

    .local v1, arr$:[Ljava/lang/String;
    array-length v6, v1

    .local v6, len$:I
    const/4 v2, 0x0

    .end local v3           #i$:I
    .restart local v2       #i$:I
    :goto_1
    if-ge v2, v6, :cond_1

    aget-object v7, v1, v2

    .line 289
    .local v7, regex:Ljava/lang/String;
    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 294
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v4           #iface:Ljava/lang/String;
    .end local v6           #len$:I
    .end local v7           #regex:Ljava/lang/String;
    :goto_2
    return-object v4

    .line 288
    .restart local v1       #arr$:[Ljava/lang/String;
    .restart local v2       #i$:I
    .restart local v4       #iface:Ljava/lang/String;
    .restart local v6       #len$:I
    .restart local v7       #regex:Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 287
    .end local v7           #regex:Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2           #i$:I
    .restart local v3       #i$:I
    goto :goto_0

    .line 294
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v4           #iface:Ljava/lang/String;
    .end local v6           #len$:I
    :cond_2
    const/4 v4, 0x0

    goto :goto_2
.end method

.method private handleWifiApClientsChanged()V
    .locals 6

    .prologue
    .line 342
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mConnectedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3}, Landroid/preference/PreferenceCategory;->removeAll()V

    .line 343
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBlockedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3}, Landroid/preference/PreferenceCategory;->removeAll()V

    .line 344
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getHotspotClients()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mClientList:Ljava/util/List;

    .line 345
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mClientList:Ljava/util/List;

    if-eqz v3, :cond_3

    .line 346
    const-string v3, "TetherWifiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "client number is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mClientList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mClientList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/HotspotClient;

    .line 348
    .local v0, client:Landroid/net/wifi/HotspotClient;
    new-instance v2, Lcom/mediatek/wifi/hotspot/ButtonPreference;

    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, v0, p0}, Lcom/mediatek/wifi/hotspot/ButtonPreference;-><init>(Landroid/content/Context;Landroid/net/wifi/HotspotClient;Lcom/mediatek/wifi/hotspot/ButtonPreference$OnButtonClickCallback;)V

    .line 349
    .local v2, preference:Lcom/mediatek/wifi/hotspot/ButtonPreference;
    iget-object v3, v0, Landroid/net/wifi/HotspotClient;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/mediatek/wifi/hotspot/ButtonPreference;->setMacAddress(Ljava/lang/String;)V

    .line 350
    iget-boolean v3, v0, Landroid/net/wifi/HotspotClient;->isBlocked:Z

    if-eqz v3, :cond_0

    .line 351
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0168

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/wifi/hotspot/ButtonPreference;->setButtonText(Ljava/lang/String;)V

    .line 352
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBlockedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 353
    const-string v3, "TetherWifiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "blocked client MAC is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Landroid/net/wifi/HotspotClient;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 355
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0167

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/wifi/hotspot/ButtonPreference;->setButtonText(Ljava/lang/String;)V

    .line 356
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mConnectedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 357
    const-string v3, "TetherWifiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "connected client MAC is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Landroid/net/wifi/HotspotClient;->deviceAddress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 360
    .end local v0           #client:Landroid/net/wifi/HotspotClient;
    .end local v2           #preference:Lcom/mediatek/wifi/hotspot/ButtonPreference;
    :cond_1
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mConnectedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v3

    if-nez v3, :cond_2

    .line 361
    new-instance v2, Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 362
    .local v2, preference:Landroid/preference/Preference;
    const v3, 0x7f0b01c9

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(I)V

    .line 363
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mConnectedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 365
    .end local v2           #preference:Landroid/preference/Preference;
    :cond_2
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBlockedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v3

    if-nez v3, :cond_3

    .line 366
    new-instance v2, Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 367
    .restart local v2       #preference:Landroid/preference/Preference;
    const v3, 0x7f0b01ca

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(I)V

    .line 368
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBlockedCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 371
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #preference:Landroid/preference/Preference;
    :cond_3
    return-void
.end method

.method private initWifiTethering()V
    .locals 10

    .prologue
    const v9, 0x7f0b04c1

    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 164
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 166
    .local v0, activity:Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    iput-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 168
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    .line 169
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f070014

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mSecurityType:[Ljava/lang/String;

    .line 171
    const-string v3, "wifi_ap_ssid_and_security"

    invoke-virtual {p0, v3}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mCreateNetwork:Landroid/preference/Preference;

    .line 173
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    if-nez v3, :cond_0

    .line 174
    const-string v3, "wlan"

    const-string v4, "SSID"

    const v5, 0x104040c

    invoke-virtual {v0, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/mediatek/custom/CustomProperties;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 177
    .local v2, s:Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mCreateNetwork:Landroid/preference/Preference;

    invoke-virtual {v0, v9}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v2, v5, v7

    iget-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mSecurityType:[Ljava/lang/String;

    aget-object v6, v6, v7

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 186
    .end local v2           #s:Ljava/lang/String;
    :goto_0
    return-void

    .line 180
    :cond_0
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-static {v3}, Lcom/android/settings/wifi/WifiApDialog;->getSecurityTypeIndex(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    .line 181
    .local v1, index:I
    const-string v3, "TetherWifiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "index = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mCreateNetwork:Landroid/preference/Preference;

    invoke-virtual {v0, v9}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    iget-object v6, v6, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mSecurityType:[Ljava/lang/String;

    aget-object v6, v6, v1

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7
    .parameter "dialogInterface"
    .parameter "button"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 298
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    .line 299
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDialog:Lcom/android/settings/wifi/WifiApDialog;

    invoke-virtual {v1}, Lcom/android/settings/wifi/WifiApDialog;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    .line 300
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v1, :cond_1

    .line 306
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getWifiApState()I

    move-result v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_2

    .line 307
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v6}, Landroid/net/wifi/WifiManager;->setWifiApEnabled(Landroid/net/wifi/WifiConfiguration;Z)Z

    .line 308
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-virtual {v1, v2, v5}, Landroid/net/wifi/WifiManager;->setWifiApEnabled(Landroid/net/wifi/WifiConfiguration;Z)Z

    .line 312
    :goto_0
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-static {v1}, Lcom/android/settings/wifi/WifiApDialog;->getSecurityTypeIndex(Landroid/net/wifi/WifiConfiguration;)I

    move-result v0

    .line 313
    .local v0, index:I
    if-nez v0, :cond_0

    .line 314
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0b01c2

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 316
    :cond_0
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mCreateNetwork:Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0b04c1

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    iget-object v4, v4, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    aput-object v4, v3, v6

    iget-object v4, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mSecurityType:[Ljava/lang/String;

    aget-object v4, v4, v0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 321
    .end local v0           #index:I
    :cond_1
    return-void

    .line 310
    :cond_2
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-virtual {v1, v2}, Landroid/net/wifi/WifiManager;->setWifiApConfiguration(Landroid/net/wifi/WifiConfiguration;)Z

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;Landroid/net/wifi/HotspotClient;)V
    .locals 2
    .parameter "v"
    .parameter "client"

    .prologue
    .line 323
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0800ef

    if-ne v0, v1, :cond_0

    if-eqz p2, :cond_0

    .line 324
    iget-boolean v0, p2, Landroid/net/wifi/HotspotClient;->isBlocked:Z

    if-eqz v0, :cond_1

    .line 325
    const-string v0, "TetherWifiSettings"

    const-string v1, "onClick,client is blocked, unblock now"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p2}, Landroid/net/wifi/WifiManager;->unblockClient(Landroid/net/wifi/HotspotClient;)Z

    .line 331
    :goto_0
    invoke-direct {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->handleWifiApClientsChanged()V

    .line 333
    :cond_0
    return-void

    .line 328
    :cond_1
    const-string v0, "TetherWifiSettings"

    const-string v1, "onClick,client isn\'t blocked, block now"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p2}, Landroid/net/wifi/WifiManager;->blockClient(Landroid/net/wifi/HotspotClient;)Z

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .parameter "newConfig"

    .prologue
    .line 336
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 337
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDialog:Lcom/android/settings/wifi/WifiApDialog;

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDialog:Lcom/android/settings/wifi/WifiApDialog;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiApDialog;->closeSpinnerDialog()V

    .line 340
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "icicle"

    .prologue
    const/16 v10, 0x10

    const/4 v9, -0x2

    const/4 v8, 0x0

    .line 117
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 118
    const v6, 0x7f05003e

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->addPreferencesFromResource(I)V

    .line 120
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 122
    .local v1, activity:Landroid/app/Activity;
    const-string v6, "wifi_auto_disable"

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Landroid/preference/ListPreference;

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiAutoDisable:Landroid/preference/ListPreference;

    .line 123
    const-string v6, "wifi_ap_ssid_and_security"

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    .line 124
    .local v5, wifiApSettings:Landroid/preference/Preference;
    const-string v6, "wps_connect"

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWpsConnect:Landroid/preference/Preference;

    .line 125
    iget-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWpsConnect:Landroid/preference/Preference;

    invoke-virtual {v6, v8}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 126
    const-string v6, "bandwidth_usage"

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBandwidth:Landroid/preference/Preference;

    .line 127
    iget-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBandwidth:Landroid/preference/Preference;

    invoke-virtual {v6, v8}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 129
    const-string v6, "connectivity"

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 136
    .local v2, cm:Landroid/net/ConnectivityManager;
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 137
    .local v0, actionBarSwitch:Landroid/widget/Switch;
    instance-of v6, v1, Landroid/preference/PreferenceActivity;

    if-eqz v6, :cond_1

    move-object v4, v1

    .line 138
    check-cast v4, Landroid/preference/PreferenceActivity;

    .line 139
    .local v4, preferenceActivity:Landroid/preference/PreferenceActivity;
    invoke-virtual {v4}, Landroid/preference/PreferenceActivity;->onIsHidingHeaders()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v4}, Landroid/preference/PreferenceActivity;->onIsMultiPane()Z

    move-result v6

    if-nez v6, :cond_1

    .line 140
    :cond_0
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0d0002

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 142
    .local v3, padding:I
    invoke-virtual {v0, v8, v8, v3, v8}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 143
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6, v10, v10}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 145
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    new-instance v7, Landroid/app/ActionBar$LayoutParams;

    const/16 v8, 0x15

    invoke-direct {v7, v9, v9, v8}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v6, v0, v7}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 152
    .end local v3           #padding:I
    .end local v4           #preferenceActivity:Landroid/preference/PreferenceActivity;
    :cond_1
    new-instance v6, Lcom/android/settings/wifi/WifiApEnabler;

    iget-object v7, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWpsConnect:Landroid/preference/Preference;

    iget-object v8, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBandwidth:Landroid/preference/Preference;

    invoke-direct {v6, v1, v0, v7, v8}, Lcom/android/settings/wifi/WifiApEnabler;-><init>(Landroid/content/Context;Landroid/widget/Switch;Landroid/preference/Preference;Landroid/preference/Preference;)V

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiApEnabler:Lcom/android/settings/wifi/WifiApEnabler;

    .line 153
    invoke-direct {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->initWifiTethering()V

    .line 155
    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "android.net.wifi.WIFI_HOTSPOT_CLIENTS_CHANGED"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mIntentFilter:Landroid/content/IntentFilter;

    .line 156
    iget-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.net.wifi.WIFI_WPS_CHECK_PIN_FAIL"

    invoke-virtual {v6, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 157
    iget-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.net.wifi.WIFI_HOTSPOT_OVERLAP"

    invoke-virtual {v6, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 158
    const-string v6, "connected_category"

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Landroid/preference/PreferenceCategory;

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mConnectedCategory:Landroid/preference/PreferenceCategory;

    .line 159
    const-string v6, "blocked_category"

    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Landroid/preference/PreferenceCategory;

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mBlockedCategory:Landroid/preference/PreferenceCategory;

    .line 160
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v6

    const v7, 0x7f0400a4

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    .line 161
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 7
    .parameter "id"

    .prologue
    .line 218
    const/4 v4, 0x2

    if-ne p1, v4, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 220
    .local v0, activity:Landroid/app/Activity;
    new-instance v4, Lcom/android/settings/wifi/WifiApDialog;

    iget-object v5, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v4, v0, p0, v5}, Lcom/android/settings/wifi/WifiApDialog;-><init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/net/wifi/WifiConfiguration;)V

    iput-object v4, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDialog:Lcom/android/settings/wifi/WifiApDialog;

    .line 221
    iget-object v4, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDialog:Lcom/android/settings/wifi/WifiApDialog;

    invoke-virtual {v4}, Lcom/android/settings/wifi/WifiApDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x14

    invoke-virtual {v4, v5}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 223
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDialog:Lcom/android/settings/wifi/WifiApDialog;

    .line 244
    .end local v0           #activity:Landroid/app/Activity;
    :goto_0
    return-object v1

    .line 224
    :cond_0
    const/4 v4, 0x1

    if-ne p1, v4, :cond_1

    .line 225
    new-instance v1, Lcom/mediatek/wifi/hotspot/WifiApWpsDialog;

    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/mediatek/wifi/hotspot/WifiApWpsDialog;-><init>(Landroid/content/Context;)V

    .line 226
    .local v1, d:Landroid/app/Dialog;
    const-string v4, "mydialog"

    const-string v5, "onCreateDialog, return dialog"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 228
    .end local v1           #d:Landroid/app/Dialog;
    :cond_1
    const/4 v4, 0x3

    if-ne p1, v4, :cond_3

    .line 229
    iget-object v4, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 230
    .local v3, parent:Landroid/view/ViewParent;
    if-eqz v3, :cond_2

    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2

    .line 231
    check-cast v3, Landroid/view/ViewGroup;

    .end local v3           #parent:Landroid/view/ViewParent;
    iget-object v4, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 233
    :cond_2
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f0b0169

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/high16 v5, 0x104

    new-instance v6, Lcom/mediatek/wifi/hotspot/TetherWifiSettings$2;

    invoke-direct {v6, p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings$2;-><init>(Lcom/mediatek/wifi/hotspot/TetherWifiSettings;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .local v2, dialog:Landroid/app/AlertDialog;
    move-object v1, v2

    .line 241
    goto :goto_0

    .line 244
    .end local v2           #dialog:Landroid/app/AlertDialog;
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 207
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onPause()V

    .line 208
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 209
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiApEnabler:Lcom/android/settings/wifi/WifiApEnabler;

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiApEnabler:Lcom/android/settings/wifi/WifiApEnabler;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiApEnabler;->pause()V

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiAutoDisable:Landroid/preference/ListPreference;

    if-eqz v0, :cond_1

    .line 213
    iget-object v0, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiAutoDisable:Landroid/preference/ListPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 215
    :cond_1
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 4
    .parameter "preference"
    .parameter "value"

    .prologue
    .line 248
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, key:Ljava/lang/String;
    const-string v1, "TetherWifiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPreferenceChange key="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    const-string v1, "wifi_auto_disable"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 251
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "wifi_hotspot_auto_disable"

    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 253
    const-string v1, "TetherWifiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPreferenceChange auto disable value="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 7
    .parameter "screen"
    .parameter "preference"

    .prologue
    const v5, 0x7f0801d4

    const/4 v6, 0x3

    .line 260
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 263
    .local v1, cm:Landroid/net/ConnectivityManager;
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mCreateNetwork:Landroid/preference/Preference;

    if-ne p2, v3, :cond_2

    .line 264
    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->showDialog(I)V

    .line 268
    :cond_0
    :goto_0
    instance-of v3, p2, Lcom/mediatek/wifi/hotspot/ButtonPreference;

    if-eqz v3, :cond_1

    .line 269
    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->removeDialog(I)V

    move-object v0, p2

    .line 270
    check-cast v0, Lcom/mediatek/wifi/hotspot/ButtonPreference;

    .line 272
    .local v0, client:Lcom/mediatek/wifi/hotspot/ButtonPreference;
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    const v4, 0x7f0801d3

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/mediatek/wifi/hotspot/ButtonPreference;->getMacAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    invoke-virtual {v0}, Lcom/mediatek/wifi/hotspot/ButtonPreference;->isBlocked()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 274
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 281
    :goto_1
    invoke-virtual {p0, v6}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->showDialog(I)V

    .line 283
    .end local v0           #client:Lcom/mediatek/wifi/hotspot/ButtonPreference;
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v3

    return v3

    .line 265
    :cond_2
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWpsConnect:Landroid/preference/Preference;

    if-ne p2, v3, :cond_0

    .line 266
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->showDialog(I)V

    goto :goto_0

    .line 276
    .restart local v0       #client:Lcom/mediatek/wifi/hotspot/ButtonPreference;
    :cond_3
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 277
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Lcom/mediatek/wifi/hotspot/ButtonPreference;->getMacAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/net/wifi/WifiManager;->getClientIp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 278
    .local v2, ipAddr:Ljava/lang/String;
    const-string v3, "TetherWifiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "connected client ip address is:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mDetailView:Landroid/view/View;

    const v4, 0x7f0801d5

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 190
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 192
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiApEnabler:Lcom/android/settings/wifi/WifiApEnabler;

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiApEnabler:Lcom/android/settings/wifi/WifiApEnabler;

    invoke-virtual {v1}, Lcom/android/settings/wifi/WifiApEnabler;->resume()V

    .line 195
    :cond_0
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiAutoDisable:Landroid/preference/ListPreference;

    if-eqz v1, :cond_1

    .line 196
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiAutoDisable:Landroid/preference/ListPreference;

    invoke-virtual {v1, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 197
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wifi_hotspot_auto_disable"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 199
    .local v0, value:I
    iget-object v1, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mWifiAutoDisable:Landroid/preference/ListPreference;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 202
    .end local v0           #value:I
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v3, p0, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 203
    invoke-direct {p0}, Lcom/mediatek/wifi/hotspot/TetherWifiSettings;->handleWifiApClientsChanged()V

    .line 204
    return-void
.end method
