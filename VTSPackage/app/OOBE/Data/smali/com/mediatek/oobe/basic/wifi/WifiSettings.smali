.class public Lcom/mediatek/oobe/basic/wifi/WifiSettings;
.super Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;
.source "WifiSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;,
        Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap;
    }
.end annotation


# static fields
.field private static final EXTRA_AUTO_FINISH_ON_CONNECT:Ljava/lang/String; = "wifi_auto_finish_on_connect"

.field private static final EXTRA_ENABLE_NEXT_ON_CONNECT:Ljava/lang/String; = "wifi_enable_next_on_connect"

.field private static final EXTRA_IS_FIRST_RUN:Ljava/lang/String; = "firstRun"

.field protected static final EXTRA_SHOW_CUSTOM_BUTTON:Ljava/lang/String; = "wifi_show_custom_button"

.field protected static final EXTRA_SHOW_WIFI_REQUIRED_INFO:Ljava/lang/String; = "wifi_show_wifi_required_info"

.field private static final MENU_ID_ADD_NETWORK:I = 0x4

.field private static final MENU_ID_ADVANCED:I = 0x5

.field private static final MENU_ID_CONNECT:I = 0x7

.field private static final MENU_ID_FORGET:I = 0x8

.field private static final MENU_ID_MODIFY:I = 0x9

.field private static final MENU_ID_SCAN:I = 0x6

.field private static final SAVE_DIALOG_ACCESS_POINT_STATE:Ljava/lang/String; = "wifi_ap_state"

.field private static final SAVE_DIALOG_EDIT_MODE:Ljava/lang/String; = "edit_mode"

.field private static final TAG:Ljava/lang/String; = "WifiSettings"

.field private static final WIFI_AND_MOBILE_SKIPPED_DIALOG_ID:I = 0x5

.field private static final WIFI_DIALOG_ID:I = 0x1

.field private static final WIFI_RESCAN_INTERVAL_MS:I = 0x1770

.field private static final WIFI_SKIPPED_DIALOG_ID:I = 0x4

.field private static final WIFI_SWITCH_ENABLER:Ljava/lang/String; = "wifi_switch"


# instance fields
.field private mAccessPointSavedState:Landroid/os/Bundle;

.field private mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

.field mAddNetworkButtonCbk:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;

.field private mAutoFinishOnConnection:Z

.field private mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

.field private mDlgAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

.field private mDlgEdit:Z

.field private mEmptyView:Landroid/widget/TextView;

.field private mEnableNextOnConnection:Z

.field private mExt:Lcom/mediatek/oobe/ext/IWifiSettingsExt;

.field private final mFilter:Landroid/content/IntentFilter;

.field private mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private mKeyStoreNetworkId:I

.field private mLastInfo:Landroid/net/wifi/WifiInfo;

.field private mLastState:Landroid/net/NetworkInfo$DetailedState;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

.field private final mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

.field private mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

.field private mSetupWizardMode:Z

.field private mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

.field private mWifiApCategory:Landroid/preference/PreferenceCategory;

.field private mWifiEnabler:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

.field private mWifiEnablerPref:Landroid/preference/Preference;

.field private mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 220
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;-><init>()V

    .line 174
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 176
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mKeyStoreNetworkId:I

    .line 1114
    new-instance v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$11;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$11;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButtonCbk:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;

    .line 221
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    .line 222
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 223
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.SCAN_RESULTS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 224
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.NETWORK_IDS_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 225
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 226
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.CONFIGURED_NETWORKS_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 227
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.LINK_CONFIGURATION_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 228
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 229
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 231
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.NO_CERTIFICATION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 233
    new-instance v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 240
    new-instance v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    .line 241
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/basic/wifi/WifiSettings;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 131
    invoke-direct {p0, p1, p2}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->handleEvent(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 131
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 131
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->isPhone()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/mediatek/oobe/basic/wifi/WifiSettings;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 131
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/mediatek/oobe/basic/wifi/WifiSettings;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 131
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->showDialog(I)V

    return-void
.end method

.method private addMessagePreference(I)V
    .locals 1
    .parameter "messageId"

    .prologue
    .line 703
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 704
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 707
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v0}, Landroid/preference/PreferenceCategory;->removeAll()V

    .line 708
    return-void
.end method

.method private changeNextButtonState(Z)V
    .locals 1
    .parameter "connected"

    .prologue
    .line 988
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mEnableNextOnConnection:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->hasNextButton()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 989
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getNextButton()Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 991
    :cond_0
    return-void
.end method

.method private constructAccessPoints()Ljava/util/List;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/wifi/AccessPoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 712
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 717
    .local v3, accessPoints:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/oobe/basic/wifi/AccessPoint;>;"
    new-instance v4, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap;

    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v4, v0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;)V

    .line 719
    .local v4, apMap:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap;,"Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap<Ljava/lang/String;Lcom/mediatek/oobe/basic/wifi/AccessPoint;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v6

    .line 720
    .local v6, configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    if-eqz v6, :cond_9

    .line 721
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/WifiConfiguration;

    .line 723
    .local v5, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "\"none\""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_3

    .line 724
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "config.SSID "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 725
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "config.imsi "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 726
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "config.simSlot "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "config.networkId "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v5, Landroid/net/wifi/WifiConfiguration;->networkId:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    const/16 v16, 0x0

    .line 729
    .local v16, slot:I
    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "\"0\""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 730
    const/16 v16, 0x0

    .line 735
    :cond_0
    :goto_1
    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "\""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 736
    .local v15, simslots:[Ljava/lang/String;
    array-length v0, v15

    move/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_1

    .line 737
    const/16 v17, 0x1

    aget-object v17, v15, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 740
    :cond_1
    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "\"1232010000000000@wlan.mnc001.mcc232.3gppnetwork.org\""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_2

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "\"0232010000000000@wlan.mnc001.mcc232.3gppnetwork.org\""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 742
    :cond_2
    const-string v17, "WifiSettings"

    const-string v18, "in simulator mode, skip"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 784
    .end local v15           #simslots:[Ljava/lang/String;
    .end local v16           #slot:I
    :cond_3
    :goto_2
    new-instance v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v2, v0, v5}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/net/wifi/WifiConfiguration;)V

    .line 785
    .local v2, accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v2, v0, v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 786
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 787
    iget-object v0, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v2}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 731
    .end local v2           #accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    .restart local v16       #slot:I
    :cond_4
    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "\"1\""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_0

    .line 732
    const/16 v16, 0x1

    goto :goto_1

    .line 743
    .restart local v15       #simslots:[Ljava/lang/String;
    :cond_5
    invoke-virtual {v5}, Landroid/net/wifi/WifiConfiguration;->toString()Ljava/lang/String;

    move-result-object v17

    const-string v18, "eap: SIM"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_7

    .line 744
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "mTelephonyManagerEx.getSubscriberId() "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 745
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "makeNAI(mTelephonyManagerEx.getSubscriberId(), SIM); "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v19

    const-string v20, "SIM"

    invoke-static/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "SIM"

    invoke-static/range {v18 .. v19}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 748
    const-string v17, "WifiSettings"

    const-string v18, "user doesn\'t change or remove sim card"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 750
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mExt:Lcom/mediatek/oobe/ext/IWifiSettingsExt;

    move-object/from16 v17, v0

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->removeDoubleQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static {v5}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getSecurity(Landroid/net/wifi/WifiConfiguration;)I

    move-result v19

    invoke-interface/range {v17 .. v19}, Lcom/mediatek/oobe/ext/IWifiSettingsExt;->isTustAP(Ljava/lang/String;I)Z

    move-result v17

    if-nez v17, :cond_3

    .line 751
    const-string v17, "WifiSettings"

    const-string v18, "user change or remove sim card"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    const-string v17, "WifiSettings"

    const-string v18, " >>mWifiManager.removeNetwork(config.networkId);"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 753
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    iget v0, v5, Landroid/net/wifi/WifiConfiguration;->networkId:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/net/wifi/WifiManager;->removeNetwork(I)Z

    move-result v14

    .line 754
    .local v14, s:Z
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, " <<mWifiManager.removeNetwork(config.networkId); s: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 755
    const-string v17, "WifiSettings"

    const-string v18, "   >>saveNetworks();"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 756
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    move-result v14

    .line 757
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "saveNetworks(): "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 761
    .end local v14           #s:Z
    :cond_7
    invoke-virtual {v5}, Landroid/net/wifi/WifiConfiguration;->toString()Ljava/lang/String;

    move-result-object v17

    const-string v18, "eap: AKA"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 762
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "mTelephonyManagerEx.getSubscriberId() "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "makeNAI(mTelephonyManagerEx.getSubscriberId(), AKA); "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v19

    const-string v20, "AKA"

    invoke-static/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 765
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSubscriberId(I)Ljava/lang/String;

    move-result-object v17

    const-string v18, "AKA"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 766
    const-string v17, "WifiSettings"

    const-string v18, "user doesn\'t change or remove usim card"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 768
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mExt:Lcom/mediatek/oobe/ext/IWifiSettingsExt;

    move-object/from16 v17, v0

    iget-object v0, v5, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->removeDoubleQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static {v5}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getSecurity(Landroid/net/wifi/WifiConfiguration;)I

    move-result v19

    invoke-interface/range {v17 .. v19}, Lcom/mediatek/oobe/ext/IWifiSettingsExt;->isTustAP(Ljava/lang/String;I)Z

    move-result v17

    if-nez v17, :cond_3

    .line 769
    const-string v17, "WifiSettings"

    const-string v18, "user change or remove usim card"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 770
    const-string v17, "WifiSettings"

    const-string v18, " >> mWifiManager.removeNetwork(config.networkId);"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    iget v0, v5, Landroid/net/wifi/WifiConfiguration;->networkId:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/net/wifi/WifiManager;->removeNetwork(I)Z

    move-result v14

    .line 772
    .restart local v14       #s:Z
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, " << mWifiManager.removeNetwork(config.networkId); s: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    const-string v17, "WifiSettings"

    const-string v18, "   >>saveNetworks();"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 774
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    move-result v14

    .line 775
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "saveNetworks(): "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 776
    const-string v17, "WifiSettings"

    const-string v18, "   <<saveNetworks();"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 791
    .end local v5           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v14           #s:Z
    .end local v15           #simslots:[Ljava/lang/String;
    .end local v16           #slot:I
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v13

    .line 792
    .local v13, results:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    if-eqz v13, :cond_d

    .line 793
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_a
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/net/wifi/ScanResult;

    .line 795
    .local v12, result:Landroid/net/wifi/ScanResult;
    iget-object v0, v12, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    move-object/from16 v17, v0

    if-eqz v17, :cond_a

    iget-object v0, v12, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-eqz v17, :cond_a

    iget-object v0, v12, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "[IBSS]"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v17

    if-nez v17, :cond_a

    .line 799
    const/4 v8, 0x0

    .line 800
    .local v8, found:Z
    iget-object v0, v12, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap;->getAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_b
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_c

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 801
    .restart local v2       #accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    invoke-virtual {v2, v12}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->update(Landroid/net/wifi/ScanResult;)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 802
    const/4 v8, 0x1

    goto :goto_4

    .line 805
    .end local v2           #accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    :cond_c
    if-nez v8, :cond_a

    .line 806
    new-instance v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v2, v0, v12}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/net/wifi/ScanResult;)V

    .line 807
    .restart local v2       #accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 808
    iget-object v0, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v2}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3

    .line 814
    .end local v2           #accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    .end local v8           #found:Z
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v12           #result:Landroid/net/wifi/ScanResult;
    :cond_d
    new-instance v11, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-direct {v11, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 815
    .local v11, origAccessPoints:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/oobe/basic/wifi/AccessPoint;>;"
    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 817
    :try_start_0
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_1

    move-object v11, v3

    .line 825
    .end local v11           #origAccessPoints:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/oobe/basic/wifi/AccessPoint;>;"
    :goto_5
    return-object v11

    .line 818
    .restart local v11       #origAccessPoints:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/oobe/basic/wifi/AccessPoint;>;"
    :catch_0
    move-exception v7

    .line 819
    .local v7, e:Ljava/lang/ClassCastException;
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "collection.sort exception;origAccessPoints="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 821
    .end local v7           #e:Ljava/lang/ClassCastException;
    :catch_1
    move-exception v7

    .line 822
    .local v7, e:Ljava/lang/UnsupportedOperationException;
    const-string v17, "WifiSettings"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "collection.sort exception;origAccessPoints="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method

.method private handleEvent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 849
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 850
    .local v0, action:Ljava/lang/String;
    const-string v6, "WifiSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "action = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    const-string v6, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 852
    const-string v6, "wifi_state"

    const/4 v7, 0x4

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateWifiState(I)V

    .line 896
    :cond_0
    :goto_0
    return-void

    .line 854
    :cond_1
    const-string v6, "android.net.wifi.SCAN_RESULTS"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "android.net.wifi.CONFIGURED_NETWORKS_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "android.net.wifi.LINK_CONFIGURATION_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 857
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateAccessPoints()V

    goto :goto_0

    .line 858
    :cond_3
    const-string v6, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 865
    const-string v6, "newState"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/SupplicantState;

    .line 866
    .local v5, state:Landroid/net/wifi/SupplicantState;
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v6

    if-nez v6, :cond_0

    .line 867
    invoke-static {v5}, Landroid/net/wifi/WifiInfo;->getDetailedStateOf(Landroid/net/wifi/SupplicantState;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 869
    .end local v5           #state:Landroid/net/wifi/SupplicantState;
    :cond_4
    const-string v6, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 870
    const-string v6, "networkInfo"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/NetworkInfo;

    .line 871
    .local v3, info:Landroid/net/NetworkInfo;
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnected:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 872
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->changeNextButtonState(Z)V

    .line 873
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateAccessPoints()V

    .line 874
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    .line 875
    iget-boolean v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    if-eqz v6, :cond_0

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 876
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 877
    .local v1, activity:Landroid/app/Activity;
    if-eqz v1, :cond_0

    .line 878
    const/4 v6, -0x1

    invoke-virtual {v1, v6}, Landroid/app/Activity;->setResult(I)V

    .line 879
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 883
    .end local v1           #activity:Landroid/app/Activity;
    .end local v3           #info:Landroid/net/NetworkInfo;
    :cond_5
    const-string v6, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 884
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto/16 :goto_0

    .line 885
    :cond_6
    const-string v6, "android.net.wifi.NO_CERTIFICATION"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 887
    const-string v2, ""

    .line 888
    .local v2, apSSID:Ljava/lang/String;
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v6, :cond_7

    .line 889
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "] "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 891
    :cond_7
    const-string v6, "WifiSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Receive  no certification broadcast for AP "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 892
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f09011c

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 893
    .local v4, message:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const/4 v7, 0x1

    invoke-static {v6, v4, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0
.end method

.method private isPhone()Z
    .locals 2

    .prologue
    .line 624
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 626
    .local v0, telephonyManager:Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z
    .locals 2
    .parameter "config"

    .prologue
    .line 644
    invoke-static {p1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    invoke-virtual {v0}, Landroid/security/KeyStore;->state()Landroid/security/KeyStore$State;

    move-result-object v0

    sget-object v1, Landroid/security/KeyStore$State;->UNLOCKED:Landroid/security/KeyStore$State;

    if-eq v0, v1, :cond_0

    .line 645
    iget v0, p1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mKeyStoreNetworkId:I

    .line 646
    invoke-static {}, Landroid/security/Credentials;->getInstance()Landroid/security/Credentials;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/security/Credentials;->unlock(Landroid/content/Context;)V

    .line 647
    const/4 v0, 0x1

    .line 649
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private showDialog(Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V
    .locals 3
    .parameter "accessPoint"
    .parameter "edit"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 546
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    if-eqz v0, :cond_0

    .line 547
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->removeDialog(I)V

    .line 548
    iput-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    .line 549
    iput-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    .line 553
    :cond_0
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 554
    iput-boolean p2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgEdit:Z

    .line 556
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->showDialog(I)V

    .line 557
    return-void
.end method

.method private updateAccessPoints()V
    .locals 6

    .prologue
    .line 658
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    if-nez v4, :cond_0

    .line 700
    :goto_0
    return-void

    .line 662
    :cond_0
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v3

    .line 664
    .local v3, wifiState:I
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 687
    :pswitch_0
    const v4, 0x7f0900a1

    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->addMessagePreference(I)V

    .line 688
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 689
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 667
    :pswitch_1
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->constructAccessPoints()Ljava/util/List;

    move-result-object v1

    .line 669
    .local v1, accessPoints:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/mediatek/oobe/basic/wifi/AccessPoint;>;"
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4}, Landroid/preference/PreferenceCategory;->removeAll()V

    .line 670
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 671
    const v4, 0x7f090094

    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->addMessagePreference(I)V

    .line 673
    :cond_1
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 675
    .local v0, accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_1

    .line 677
    .end local v0           #accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 678
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 683
    .end local v1           #accessPoints:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/mediatek/oobe/basic/wifi/AccessPoint;>;"
    .end local v2           #i$:Ljava/util/Iterator;
    :pswitch_2
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4}, Landroid/preference/PreferenceCategory;->removeAll()V

    goto :goto_0

    .line 693
    :pswitch_3
    const v4, 0x7f090093

    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->addMessagePreference(I)V

    .line 694
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 695
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

    invoke-virtual {v4, v5}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 664
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V
    .locals 5
    .parameter "state"

    .prologue
    .line 900
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 901
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->pause()V

    .line 924
    :cond_0
    return-void

    .line 905
    :cond_1
    sget-object v3, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    if-ne p1, v3, :cond_4

    .line 906
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->pause()V

    .line 911
    :goto_0
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    .line 912
    if-eqz p1, :cond_2

    .line 913
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 916
    :cond_2
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3}, Landroid/preference/PreferenceCategory;->getPreferenceCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, i:I
    :goto_1
    if-ltz v1, :cond_0

    .line 918
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 919
    .local v2, preference:Landroid/preference/Preference;
    instance-of v3, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v3, :cond_3

    move-object v0, v2

    .line 920
    check-cast v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 921
    .local v0, accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v0, v3, v4}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 916
    .end local v0           #accessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 908
    .end local v1           #i:I
    .end local v2           #preference:Landroid/preference/Preference;
    :cond_4
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v3}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->resume()V

    goto :goto_0
.end method

.method private updateWifiState(I)V
    .locals 3
    .parameter "state"

    .prologue
    const/4 v2, 0x0

    .line 927
    packed-switch p1, :pswitch_data_0

    .line 944
    :goto_0
    iput-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    .line 945
    iput-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    .line 946
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->pause()V

    .line 947
    :goto_1
    return-void

    .line 929
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->resume()V

    goto :goto_1

    .line 933
    :pswitch_1
    const v0, 0x7f0900a0

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->addMessagePreference(I)V

    goto :goto_0

    .line 937
    :pswitch_2
    const v0, 0x7f090093

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->addMessagePreference(I)V

    .line 938
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 927
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method forget()V
    .locals 3

    .prologue
    .line 1087
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1089
    const-string v0, "WifiSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to forget invalid network "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1102
    :goto_0
    return-void

    .line 1093
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v1, v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 1095
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1096
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->resume()V

    .line 1098
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateAccessPoints()V

    .line 1101
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->changeNextButtonState(Z)V

    goto :goto_0
.end method

.method protected hasSimProblem()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 635
    const-string v2, "phone"

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 637
    .local v0, telephonyManager:Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCurrentPhoneType()I

    move-result v2

    if-ne v2, v1, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v2

    const/4 v3, 0x5

    if-eq v2, v3, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 13
    .parameter "savedInstanceState"

    .prologue
    const/16 v12, 0x10

    const/4 v11, 0x1

    const/4 v10, -0x2

    const/4 v9, 0x0

    .line 298
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 301
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/oobe/utils/Utils;->getWifiSettingsPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiSettingsExt;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mExt:Lcom/mediatek/oobe/ext/IWifiSettingsExt;

    .line 303
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 308
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 310
    new-instance v7, Lcom/mediatek/oobe/basic/wifi/WifiSettings$4;

    invoke-direct {v7, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$4;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 322
    new-instance v7, Lcom/mediatek/oobe/basic/wifi/WifiSettings$5;

    invoke-direct {v7, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$5;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 334
    new-instance v7, Lcom/mediatek/oobe/basic/wifi/WifiSettings$6;

    invoke-direct {v7, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$6;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    .line 346
    if-eqz p1, :cond_0

    const-string v7, "wifi_ap_state"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 347
    const-string v7, "edit_mode"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    iput-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgEdit:Z

    .line 348
    const-string v7, "wifi_ap_state"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    .line 351
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 352
    .local v1, activity:Landroid/app/Activity;
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 355
    .local v4, intent:Landroid/content/Intent;
    const-string v7, "wifi_auto_finish_on_connect"

    invoke-virtual {v4, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    iput-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    .line 357
    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAutoFinishOnConnection:Z

    if-eqz v7, :cond_3

    .line 359
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->hasNextButton()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 360
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getNextButton()Landroid/widget/Button;

    move-result-object v7

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 363
    :cond_1
    const-string v7, "connectivity"

    invoke-virtual {v1, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 365
    .local v2, connectivity:Landroid/net/ConnectivityManager;
    if-eqz v2, :cond_3

    invoke-virtual {v2, v11}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 366
    const/4 v7, -0x1

    invoke-virtual {v1, v7}, Landroid/app/Activity;->setResult(I)V

    .line 367
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 431
    .end local v2           #connectivity:Landroid/net/ConnectivityManager;
    :cond_2
    :goto_0
    return-void

    .line 374
    :cond_3
    const-string v7, "wifi_enable_next_on_connect"

    invoke-virtual {v4, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    iput-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mEnableNextOnConnection:Z

    .line 376
    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mEnableNextOnConnection:Z

    if-eqz v7, :cond_4

    .line 377
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->hasNextButton()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 378
    const-string v7, "connectivity"

    invoke-virtual {v1, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 380
    .restart local v2       #connectivity:Landroid/net/ConnectivityManager;
    if-eqz v2, :cond_4

    .line 381
    invoke-virtual {v2, v11}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 382
    .local v3, info:Landroid/net/NetworkInfo;
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    invoke-direct {p0, v7}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->changeNextButtonState(Z)V

    .line 387
    .end local v2           #connectivity:Landroid/net/ConnectivityManager;
    .end local v3           #info:Landroid/net/NetworkInfo;
    :cond_4
    const v7, 0x7f05000b

    invoke-virtual {p0, v7}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->addPreferencesFromResource(I)V

    .line 389
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v7

    const-string v8, "wifi_switch"

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiEnablerPref:Landroid/preference/Preference;

    .line 391
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v7

    const-string v8, "wifi_aplist"

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Landroid/preference/PreferenceCategory;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiApCategory:Landroid/preference/PreferenceCategory;

    .line 393
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v7

    const-string v8, "add_network_button"

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    check-cast v7, Lcom/mediatek/oobe/utils/ButtonPreference;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

    .line 394
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButtonCbk:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;

    invoke-virtual {v7, v8}, Lcom/mediatek/oobe/utils/ButtonPreference;->setPrefButtonCallback(Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;)V

    .line 395
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAddNetworkButton:Lcom/mediatek/oobe/utils/ButtonPreference;

    invoke-virtual {v7, v8}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 396
    new-instance v7, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiEnablerPref:Landroid/preference/Preference;

    invoke-direct {v7, v1, v8}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;-><init>(Landroid/content/Context;Landroid/preference/Preference;)V

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiEnabler:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    .line 399
    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v7, :cond_5

    .line 400
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getView()Landroid/view/View;

    move-result-object v7

    const/high16 v8, 0x1e4

    invoke-virtual {v7, v8}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 406
    :cond_5
    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSetupWizardMode:Z

    if-nez v7, :cond_7

    .line 407
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 409
    .local v0, actionBarSwitch:Landroid/widget/Switch;
    instance-of v7, v1, Landroid/preference/PreferenceActivity;

    if-eqz v7, :cond_7

    move-object v6, v1

    .line 410
    check-cast v6, Landroid/preference/PreferenceActivity;

    .line 411
    .local v6, preferenceActivity:Landroid/preference/PreferenceActivity;
    invoke-virtual {v6}, Landroid/preference/PreferenceActivity;->onIsHidingHeaders()Z

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v6}, Landroid/preference/PreferenceActivity;->onIsMultiPane()Z

    move-result v7

    if-nez v7, :cond_7

    .line 412
    :cond_6
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const/high16 v8, 0x7f08

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 413
    .local v5, padding:I
    invoke-virtual {v0, v9, v9, v5, v9}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 414
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v7

    invoke-virtual {v7, v12, v12}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 415
    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v7

    new-instance v8, Landroid/app/ActionBar$LayoutParams;

    const v9, 0x800015

    invoke-direct {v8, v10, v10, v9}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v7, v0, v8}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 425
    .end local v0           #actionBarSwitch:Landroid/widget/Switch;
    .end local v5           #padding:I
    .end local v6           #preferenceActivity:Landroid/preference/PreferenceActivity;
    :cond_7
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getView()Landroid/view/View;

    move-result-object v7

    const v8, 0x1020004

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    .line 426
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v7, v8}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 428
    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSetupWizardMode:Z

    if-nez v7, :cond_2

    .line 429
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->registerForContextMenu(Landroid/view/View;)V

    goto/16 :goto_0
.end method

.method onAddNetworkPressed()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1109
    iput-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 1110
    const/4 v0, 0x1

    invoke-direct {p0, v1, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->showDialog(Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V

    .line 1111
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialogInterface"
    .parameter "button"

    .prologue
    .line 995
    const/4 v0, -0x3

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v0, :cond_1

    .line 996
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->forget()V

    .line 1000
    :cond_0
    :goto_0
    return-void

    .line 997
    :cond_1
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 998
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->getController()Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->submit(Lcom/mediatek/oobe/basic/wifi/WifiConfigController;)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .parameter "newConfig"

    .prologue
    .line 1127
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1128
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    if-eqz v0, :cond_0

    .line 1129
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->closeSpinnerDialog()V

    .line 1131
    :cond_0
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    const/4 v0, 0x1

    .line 498
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-nez v1, :cond_1

    .line 499
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 524
    :cond_0
    :goto_0
    return v0

    .line 501
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 524
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    .line 503
    :pswitch_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v1, v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 504
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 505
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v2, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 507
    :cond_2
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v1, v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    if-nez v1, :cond_3

    .line 509
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->generateOpenNetworkConfig()V

    .line 510
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 512
    :cond_3
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->showDialog(Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 516
    :pswitch_1
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v2, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mForgetListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v1, v2, v3}, Landroid/net/wifi/WifiManager;->forget(ILandroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_0

    .line 519
    :pswitch_2
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-direct {p0, v1, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->showDialog(Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 501
    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "icicle"

    .prologue
    .line 246
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "firstRun"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSetupWizardMode:Z

    .line 248
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 249
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 5
    .parameter "menu"
    .parameter "view"
    .parameter "info"

    .prologue
    const/4 v3, -0x1

    const/4 v4, 0x0

    .line 476
    instance-of v1, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    if-eqz v1, :cond_2

    .line 477
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v1

    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .end local p3
    iget v2, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/Preference;

    .line 479
    .local v0, preference:Landroid/preference/Preference;
    instance-of v1, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v1, :cond_2

    .line 480
    check-cast v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .end local v0           #preference:Landroid/preference/Preference;
    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 481
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v1, v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 482
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getLevel()I

    move-result v1

    if-eq v1, v3, :cond_0

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    if-nez v1, :cond_0

    .line 483
    const/4 v1, 0x7

    const v2, 0x7f0900ac

    invoke-interface {p1, v4, v1, v4, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 485
    :cond_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v1, v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    if-eq v1, v3, :cond_2

    .line 487
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mExt:Lcom/mediatek/oobe/ext/IWifiSettingsExt;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v2, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v3, v3, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    invoke-interface {v1, v2, v3}, Lcom/mediatek/oobe/ext/IWifiSettingsExt;->shouldAddForgetMenu(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 488
    const/16 v1, 0x8

    const v2, 0x7f0900ad

    invoke-interface {p1, v4, v1, v4, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 490
    :cond_1
    const/16 v1, 0x9

    const v2, 0x7f0900ae

    invoke-interface {p1, v4, v1, v4, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 494
    :cond_2
    return-void
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 6
    .parameter "dialogId"

    .prologue
    const v5, 0x7f090097

    const v4, 0x7f090096

    const/4 v3, 0x0

    .line 561
    packed-switch p1, :pswitch_data_0

    .line 620
    :pswitch_0
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v1

    :goto_0
    return-object v1

    .line 563
    :pswitch_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 564
    .local v0, ap:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    if-nez v0, :cond_0

    .line 565
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    .line 566
    new-instance v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .end local v0           #ap:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-direct {v0, v1, v2}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 568
    .restart local v0       #ap:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 572
    :cond_0
    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 573
    new-instance v1, Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgEdit:Z

    invoke-direct {v1, v2, p0, v0, v3}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;-><init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V

    iput-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    .line 574
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    goto :goto_0

    .line 580
    .end local v0           #ap:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    :pswitch_2
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f090098

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/mediatek/oobe/basic/wifi/WifiSettings$8;

    invoke-direct {v2, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$8;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    invoke-virtual {v1, v4, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/mediatek/oobe/basic/wifi/WifiSettings$7;

    invoke-direct {v2, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$7;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    invoke-virtual {v1, v5, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto :goto_0

    .line 599
    :pswitch_3
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f090099

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/mediatek/oobe/basic/wifi/WifiSettings$10;

    invoke-direct {v2, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$10;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    invoke-virtual {v1, v4, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/mediatek/oobe/basic/wifi/WifiSettings$9;

    invoke-direct {v2, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$9;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    invoke-virtual {v1, v5, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto :goto_0

    .line 561
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x0

    .line 253
    iget-boolean v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSetupWizardMode:Z

    if-eqz v4, :cond_2

    .line 254
    const v4, 0x7f030018

    invoke-virtual {p1, v4, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 255
    .local v3, view:Landroid/view/View;
    const v4, 0x7f0b004f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 256
    .local v2, other:Landroid/view/View;
    new-instance v4, Lcom/mediatek/oobe/basic/wifi/WifiSettings$2;

    invoke-direct {v4, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$2;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 265
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 266
    .local v1, intent:Landroid/content/Intent;
    const-string v4, "wifi_show_custom_button"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 267
    const v4, 0x7f0b004a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 268
    const v4, 0x7f0b0052

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 269
    const v4, 0x7f0b0054

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 270
    const v4, 0x7f0b0055

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 272
    const v4, 0x7f0b0053

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 273
    .local v0, customButton:Landroid/widget/Button;
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    .line 274
    new-instance v4, Lcom/mediatek/oobe/basic/wifi/WifiSettings$3;

    invoke-direct {v4, p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$3;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    .end local v0           #customButton:Landroid/widget/Button;
    :cond_0
    const-string v4, "wifi_show_wifi_required_info"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 287
    const v4, 0x7f0b004d

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 292
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #other:Landroid/view/View;
    .end local v3           #view:Landroid/view/View;
    :cond_1
    :goto_0
    return-object v3

    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v3

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 451
    invoke-super {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onPause()V

    .line 452
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiEnabler:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 453
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiEnabler:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->pause()V

    .line 455
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 456
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->pause()V

    .line 457
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 3
    .parameter "screen"
    .parameter "preference"

    .prologue
    .line 529
    instance-of v0, p2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v0, :cond_1

    .line 530
    check-cast p2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .end local p2
    iput-object p2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 532
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 534
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->generateOpenNetworkConfig()V

    .line 535
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    .line 542
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 537
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->showDialog(Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V

    goto :goto_0

    .line 540
    .restart local p2
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    goto :goto_1
.end method

.method public onResume()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 435
    invoke-super {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onResume()V

    .line 436
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiEnabler:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiEnabler:Lcom/mediatek/oobe/basic/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiEnabler;->resume()V

    .line 440
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 441
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mKeyStoreNetworkId:I

    if-eq v0, v3, :cond_1

    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    invoke-virtual {v0}, Landroid/security/KeyStore;->state()Landroid/security/KeyStore$State;

    move-result-object v0

    sget-object v1, Landroid/security/KeyStore$State;->UNLOCKED:Landroid/security/KeyStore$State;

    if-ne v0, v1, :cond_1

    .line 442
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mKeyStoreNetworkId:I

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 444
    :cond_1
    iput v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mKeyStoreNetworkId:I

    .line 446
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateAccessPoints()V

    .line 447
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 461
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 464
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDialog:Lcom/mediatek/oobe/basic/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 465
    const-string v0, "edit_mode"

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgEdit:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 466
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v0, :cond_0

    .line 467
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    .line 468
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mDlgAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->saveWifiState(Landroid/os/Bundle;)V

    .line 469
    const-string v0, "wifi_ap_state"

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mAccessPointSavedState:Landroid/os/Bundle;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 472
    :cond_0
    return-void
.end method

.method submit(Lcom/mediatek/oobe/basic/wifi/WifiConfigController;)V
    .locals 13
    .parameter "configController"

    .prologue
    const v12, 0x7f09011f

    const/4 v11, 0x0

    const/4 v10, -0x1

    const/4 v9, 0x1

    .line 1004
    invoke-virtual {p1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 1008
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    if-eqz v0, :cond_2

    :try_start_0
    iget-object v6, v0, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    if-eqz v6, :cond_2

    .line 1009
    invoke-virtual {v0}, Landroid/net/wifi/WifiConfiguration;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "eap: SIM"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v0}, Landroid/net/wifi/WifiConfiguration;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "eap: AKA"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1011
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "airplane_mode_on"

    const/4 v8, 0x0

    invoke-static {v6, v7, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v9, :cond_1

    .line 1013
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const v7, 0x7f09011f

    const/4 v8, 0x1

    invoke-static {v6, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 1084
    :goto_0
    return-void

    .line 1017
    :cond_1
    iget-object v6, v0, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    const-string v7, "\"error\""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1018
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const v7, 0x7f090120

    const/4 v8, 0x1

    invoke-static {v6, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1029
    :catch_0
    move-exception v2

    .line 1030
    .local v2, e:Ljava/lang/Exception;
    const-string v6, "WifiSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "submit exception() "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1034
    .end local v2           #e:Ljava/lang/Exception;
    :cond_2
    if-nez v0, :cond_9

    .line 1038
    const-string v6, "WifiSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mSelectedAccessPoint "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1039
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v1

    .line 1040
    .local v1, configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    if-eqz v1, :cond_6

    .line 1041
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiConfiguration;

    .line 1042
    .local v4, mConfig:Landroid/net/wifi/WifiConfiguration;
    const-string v6, "WifiSettings"

    const-string v7, "onClick() >>if ((mConfig.SSID).equals(mSelectedAccessPoint.mSsid)) {"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1043
    const-string v6, "WifiSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onClick()"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1044
    const-string v6, "WifiSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onClick() "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v8, v8, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1045
    if-eqz v4, :cond_3

    iget-object v6, v4, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    if-eqz v6, :cond_3

    iget-object v6, v4, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-static {v7}, Lcom/mediatek/oobe/basic/wifi/WifiDialog;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "airplane_mode_on"

    invoke-static {v6, v7, v11}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v9, :cond_3

    invoke-virtual {v4}, Landroid/net/wifi/WifiConfiguration;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "eap: SIM"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_4

    invoke-virtual {v4}, Landroid/net/wifi/WifiConfiguration;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "eap: AKA"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1049
    :cond_4
    const-string v6, "WifiSettings"

    const-string v7, "remind user: cannot user eap-sim/aka under airplane mode"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1050
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6, v12, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 1022
    .end local v1           #configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #mConfig:Landroid/net/wifi/WifiConfiguration;
    :cond_5
    :try_start_1
    iget-object v6, v0, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    const-string v7, "\"none\""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1023
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const v7, 0x7f090121

    const/4 v8, 0x1

    invoke-static {v6, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 1058
    .restart local v1       #configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    :cond_6
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v6, :cond_7

    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v6

    if-nez v6, :cond_7

    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v6, v6, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    if-eq v6, v10, :cond_7

    .line 1062
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v5

    .line 1063
    .local v5, state:Landroid/net/NetworkInfo$DetailedState;
    if-nez v5, :cond_7

    .line 1065
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v6, v7, v8}, Landroid/net/wifi/WifiManager;->connect(ILandroid/net/wifi/WifiManager$ActionListener;)V

    .line 1080
    .end local v1           #configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    .end local v5           #state:Landroid/net/NetworkInfo$DetailedState;
    :cond_7
    :goto_1
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1081
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mScanner:Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->resume()V

    .line 1083
    :cond_8
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->updateAccessPoints()V

    goto/16 :goto_0

    .line 1068
    :cond_9
    iget v6, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-eq v6, v10, :cond_a

    .line 1069
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSelectedAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v6, :cond_7

    .line 1070
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v6, v0, v7}, Landroid/net/wifi/WifiManager;->save(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_1

    .line 1073
    :cond_a
    invoke-virtual {p1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->isEdit()Z

    move-result v6

    if-nez v6, :cond_b

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 1074
    :cond_b
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mSaveListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v6, v0, v7}, Landroid/net/wifi/WifiManager;->save(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_1

    .line 1076
    :cond_c
    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mConnectListener:Landroid/net/wifi/WifiManager$ActionListener;

    invoke-virtual {v6, v0, v7}, Landroid/net/wifi/WifiManager;->connect(Landroid/net/wifi/WifiConfiguration;Landroid/net/wifi/WifiManager$ActionListener;)V

    goto :goto_1
.end method
