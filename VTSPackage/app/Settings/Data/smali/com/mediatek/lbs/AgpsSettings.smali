.class public Lcom/mediatek/lbs/AgpsSettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "AgpsSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final ABOUT_AGPS_DIALOG_ID:I = 0x0

.field private static final DISABLE_ON_REBOOT:Ljava/lang/String; = "disable_agps_on_reboot"

.field private static final KEY_ABOUT_AGPS:Ljava/lang/String; = "about_agps"

.field public static final KEY_AGPS_SHARE:Ljava/lang/String; = "agps_share"

.field private static final KEY_MOBILE_DATACONN:Ljava/lang/String; = "mobile_dataConn"

.field private static final KEY_OPERATOR_CODE:Ljava/lang/String; = "saved_operator_code"

.field private static final KEY_PORT:Ljava/lang/String; = "port"

.field private static final KEY_SELECT_PROFILE:Ljava/lang/String; = "select_profile"

.field private static final KEY_SLP_ADDRESS:Ljava/lang/String; = "slp_address"

.field private static final KEY_TLS:Ljava/lang/String; = "tls"

.field private static final NETWORK_INITIATE:Ljava/lang/String; = "Network_Initiate"

.field private static final NETWORK_USED:Ljava/lang/String; = "Network_Used"

.field private static final ROAMING_ALERT_DIALOG_ID:I = 0x1

.field public static final SIM_STATUS:Ljava/lang/String; = "sim_status"

.field private static final XLOGTAG:Ljava/lang/String; = "Settings/Agps"


# instance fields
.field private mAboutPref:Landroid/preference/Preference;

.field private mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

.field private mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

.field private mConnMgr:Landroid/net/ConnectivityManager;

.field private mDataConnItemSummary:Ljava/lang/String;

.field private mDataConnItemTitle:Ljava/lang/String;

.field private mDataConnReceiver:Landroid/content/BroadcastReceiver;

.field private mDefaultProfile:Lcom/mediatek/common/agps/MtkAgpsProfile;

.field private mDisableOnRebootCB:Landroid/preference/CheckBoxPreference;

.field private mNetworkInitiateCB:Landroid/preference/CheckBoxPreference;

.field private mNetworkPref:Landroid/preference/Preference;

.field private mNetworkUsedListPref:Landroid/preference/ListPreference;

.field private mOperatorCode:Ljava/lang/String;

.field private mPortET:Landroid/preference/EditTextPreference;

.field private mSLPAddressET:Landroid/preference/EditTextPreference;

.field private mSelectProfileListPref:Landroid/preference/ListPreference;

.field private mTLSCB:Landroid/preference/CheckBoxPreference;

.field private mTelMgrEx:Lcom/mediatek/telephony/TelephonyManagerEx;

.field private mTelephonyMgr:Landroid/telephony/TelephonyManager;

.field private mWifiMgr:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 123
    new-instance v0, Lcom/mediatek/lbs/AgpsSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/lbs/AgpsSettings$1;-><init>(Lcom/mediatek/lbs/AgpsSettings;)V

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/lbs/AgpsSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->updateDataConnStatus()V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/lbs/AgpsSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->initSlpProfileList()V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/lbs/AgpsSettings;)Lcom/mediatek/common/agps/MtkAgpsManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/lbs/AgpsSettings;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/lbs/AgpsSettings;Lcom/mediatek/common/agps/MtkAgpsProfile;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/mediatek/lbs/AgpsSettings;->updateSlpProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V

    return-void
.end method

.method static synthetic access$500(Lcom/mediatek/lbs/AgpsSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->updatePage()V

    return-void
.end method

.method private getMobileConnectionInfo(ZI)Z
    .locals 6
    .parameter "isGemini"
    .parameter "simid"

    .prologue
    const v5, 0x7f0b006d

    const v4, 0x7f0b006c

    const/4 v3, 0x2

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 276
    if-eqz p1, :cond_0

    .line 277
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelMgrEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    invoke-virtual {v2, p2}, Lcom/mediatek/telephony/TelephonyManagerEx;->getSimOperator(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    .line 278
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelMgrEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    invoke-virtual {v2, p2}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDataState(I)I

    move-result v2

    if-ne v2, v3, :cond_1

    .line 279
    new-array v2, v0, [Ljava/lang/Object;

    add-int/lit8 v3, p2, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p0, v5, v2}, Lcom/mediatek/lbs/AgpsSettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemTitle:Ljava/lang/String;

    .line 280
    invoke-virtual {p0, v4}, Lcom/mediatek/lbs/AgpsSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemSummary:Ljava/lang/String;

    .line 291
    :goto_0
    return v0

    .line 284
    :cond_0
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelephonyMgr:Landroid/telephony/TelephonyManager;

    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    .line 285
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelephonyMgr:Landroid/telephony/TelephonyManager;

    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDataState()I

    move-result v2

    if-ne v2, v3, :cond_1

    .line 286
    new-array v2, v0, [Ljava/lang/Object;

    const-string v3, ""

    aput-object v3, v2, v1

    invoke-virtual {p0, v5, v2}, Lcom/mediatek/lbs/AgpsSettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemTitle:Ljava/lang/String;

    .line 287
    invoke-virtual {p0, v4}, Lcom/mediatek/lbs/AgpsSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemSummary:Ljava/lang/String;

    goto :goto_0

    :cond_1
    move v0, v1

    .line 291
    goto :goto_0
.end method

.method private initPreference()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 313
    const-string v2, "disable_agps_on_reboot"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mDisableOnRebootCB:Landroid/preference/CheckBoxPreference;

    .line 314
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "agps_disable"

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 315
    .local v1, prefs:Landroid/content/SharedPreferences;
    const/4 v0, 0x0

    .line 316
    .local v0, disableAfterReboot:Z
    const-string v2, "changed"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 317
    const-string v2, "status"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 319
    :cond_0
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mDisableOnRebootCB:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 321
    const-string v2, "Network_Initiate"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkInitiateCB:Landroid/preference/CheckBoxPreference;

    .line 323
    const-string v2, "Network_Used"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    .line 324
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 327
    const-string v2, "slp_address"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/EditTextPreference;

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mSLPAddressET:Landroid/preference/EditTextPreference;

    .line 328
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mSLPAddressET:Landroid/preference/EditTextPreference;

    invoke-virtual {v2, v4}, Landroid/preference/EditTextPreference;->setEnabled(Z)V

    .line 331
    const-string v2, "port"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/EditTextPreference;

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mPortET:Landroid/preference/EditTextPreference;

    .line 332
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mPortET:Landroid/preference/EditTextPreference;

    invoke-virtual {v2, v4}, Landroid/preference/EditTextPreference;->setEnabled(Z)V

    .line 335
    const-string v2, "tls"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mTLSCB:Landroid/preference/CheckBoxPreference;

    .line 336
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mTLSCB:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v4}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 339
    const-string v2, "mobile_dataConn"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkPref:Landroid/preference/Preference;

    .line 342
    const-string v2, "about_agps"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mAboutPref:Landroid/preference/Preference;

    .line 345
    const-string v2, "select_profile"

    invoke-virtual {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mSelectProfileListPref:Landroid/preference/ListPreference;

    .line 346
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mSelectProfileListPref:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 348
    return-void
.end method

.method private initSlpProfileList()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x0

    .line 351
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v10

    const-string v11, "omacp_profile"

    invoke-virtual {v10, v11, v13}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 352
    .local v5, prefs:Landroid/content/SharedPreferences;
    const-string v10, "changed"

    invoke-interface {v5, v10, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 353
    new-instance v6, Lcom/mediatek/common/agps/MtkAgpsProfile;

    invoke-direct {v6}, Lcom/mediatek/common/agps/MtkAgpsProfile;-><init>()V

    .line 354
    .local v6, profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    const-string v10, "name"

    invoke-interface {v5, v10, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->name:Ljava/lang/String;

    .line 355
    const-string v10, "addr"

    invoke-interface {v5, v10, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->addr:Ljava/lang/String;

    .line 356
    const-string v10, "backupSlpNameVar"

    invoke-interface {v5, v10, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->backupSlpNameVar:Ljava/lang/String;

    .line 357
    const-string v10, "port"

    invoke-interface {v5, v10, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    iput v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->port:I

    .line 358
    const-string v10, "tls"

    invoke-interface {v5, v10, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    iput v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->tls:I

    .line 359
    const-string v10, "showType"

    invoke-interface {v5, v10, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    iput v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->showType:I

    .line 360
    const-string v10, "code"

    invoke-interface {v5, v10, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    .line 361
    const-string v10, "addrType"

    invoke-interface {v5, v10, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->addrType:Ljava/lang/String;

    .line 362
    const-string v10, "defaultApn"

    invoke-interface {v5, v10, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->defaultApn:Ljava/lang/String;

    .line 363
    const-string v10, "providerId"

    invoke-interface {v5, v10, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->providerId:Ljava/lang/String;

    .line 364
    iget-object v10, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    invoke-virtual {v10, v6}, Lcom/mediatek/common/agps/MtkAgpsProfileManager;->insertProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V

    .line 367
    .end local v6           #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    :cond_0
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "opeator code "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 368
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 370
    .local v0, availableProfiles:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/common/agps/MtkAgpsProfile;>;"
    iget-object v10, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    invoke-virtual {v10}, Lcom/mediatek/common/agps/MtkAgpsProfileManager;->getAllProfile()Ljava/util/List;

    move-result-object v7

    .line 371
    .local v7, profiles:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/common/agps/MtkAgpsProfile;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/common/agps/MtkAgpsProfile;

    .line 372
    .restart local v6       #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    iget-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    iget-object v11, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    invoke-virtual {v11}, Lcom/mediatek/common/agps/MtkAgpsProfileManager;->getDefaultProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v11

    iget-object v11, v11, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 373
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "default profile code"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 374
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 375
    :cond_2
    iget v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->showType:I

    if-nez v10, :cond_3

    .line 376
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "showType == 0 profile code"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 377
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 378
    :cond_3
    iget v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->showType:I

    const/4 v11, 0x2

    if-ne v10, v11, :cond_1

    iget-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    iget-object v11, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 379
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "showType == 2 profile code"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 380
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 385
    .end local v6           #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v10

    new-array v1, v10, [Ljava/lang/String;

    .line 386
    .local v1, entries:[Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v10

    new-array v9, v10, [Ljava/lang/String;

    .line 387
    .local v9, values:[Ljava/lang/String;
    const/4 v4, 0x0

    .line 388
    .local v4, num:I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/common/agps/MtkAgpsProfile;

    .line 389
    .restart local v6       #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    iget-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->name:Ljava/lang/String;

    aput-object v10, v1, v4

    .line 390
    iget-object v10, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    aput-object v10, v9, v4

    .line 391
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 393
    .end local v6           #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    :cond_5
    iget-object v10, p0, Lcom/mediatek/lbs/AgpsSettings;->mSelectProfileListPref:Landroid/preference/ListPreference;

    invoke-virtual {v10, v1}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 394
    iget-object v10, p0, Lcom/mediatek/lbs/AgpsSettings;->mSelectProfileListPref:Landroid/preference/ListPreference;

    invoke-virtual {v10, v9}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 396
    const/4 v2, 0x0

    .line 397
    .local v2, flag:Z
    iget-object v10, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v10}, Lcom/mediatek/common/agps/MtkAgpsManager;->getProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v8

    .line 398
    .local v8, selectProfile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "select profile code"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v8, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 399
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/common/agps/MtkAgpsProfile;

    .line 400
    .restart local v6       #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    iget-object v10, v8, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    iget-object v11, v6, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 401
    const/4 v2, 0x1

    .line 406
    .end local v6           #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    :cond_7
    if-nez v2, :cond_8

    .line 407
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "set current profile code"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/mediatek/lbs/AgpsSettings;->mDefaultProfile:Lcom/mediatek/common/agps/MtkAgpsProfile;

    iget-object v11, v11, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 408
    iget-object v10, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    iget-object v11, p0, Lcom/mediatek/lbs/AgpsSettings;->mDefaultProfile:Lcom/mediatek/common/agps/MtkAgpsProfile;

    invoke-interface {v10, v11}, Lcom/mediatek/common/agps/MtkAgpsManager;->setProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V

    .line 411
    :cond_8
    return-void
.end method

.method private isMobileDataEnabled(I)Z
    .locals 4
    .parameter "slotId"

    .prologue
    .line 270
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-virtual {v1, p1}, Landroid/net/ConnectivityManager;->getMobileDataEnabledGemini(I)Z

    move-result v0

    .line 271
    .local v0, result:Z
    const-string v1, "Settings/Agps"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isMoblieDataEnabled for slotId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    return v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 500
    const-string v0, "Settings/Agps"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[AGPS Setting] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 501
    return-void
.end method

.method private updateDataConnStatus()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 222
    const/4 v3, -0x1

    .line 224
    .local v3, sim1Satus:I
    const v6, 0x7f0b0069

    invoke-virtual {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemTitle:Ljava/lang/String;

    .line 225
    const v6, 0x7f0b006a

    invoke-virtual {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemSummary:Ljava/lang/String;

    .line 227
    const/4 v2, -0x1

    .line 228
    .local v2, networkType:I
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-virtual {v6}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 229
    .local v1, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_3

    .line 230
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    .line 234
    :goto_0
    const-string v6, "updateDataConnStatus"

    invoke-direct {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 235
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    .line 236
    if-nez v2, :cond_4

    .line 238
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v5

    .line 239
    .local v5, siminfoList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/provider/Telephony$SIMInfo;

    .line 240
    .local v4, siminfo:Landroid/provider/Telephony$SIMInfo;
    iget v6, v4, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-direct {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->isMobileDataEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 241
    iget v3, v4, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    .line 245
    .end local v4           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    const-string v6, "Settings/Agps"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "under Gemini supoort sim1Satus="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    invoke-direct {p0, v9, v3}, Lcom/mediatek/lbs/AgpsSettings;->getMobileConnectionInfo(ZI)Z

    .line 260
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v5           #siminfoList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_2
    :goto_1
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkPref:Landroid/preference/Preference;

    iget-object v7, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemTitle:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 261
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkPref:Landroid/preference/Preference;

    iget-object v7, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemSummary:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 262
    return-void

    .line 232
    :cond_3
    const-string v6, "WARNING: no active network"

    invoke-direct {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 254
    :cond_4
    if-ne v2, v9, :cond_2

    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mWifiMgr:Landroid/net/wifi/WifiManager;

    if-eqz v6, :cond_2

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 256
    const v6, 0x7f0b006b

    invoke-virtual {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemTitle:Ljava/lang/String;

    .line 257
    const v6, 0x7f0b006c

    invoke-virtual {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnItemSummary:Ljava/lang/String;

    goto :goto_1
.end method

.method private updatePage()V
    .locals 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v0}, Lcom/mediatek/common/agps/MtkAgpsManager;->getRoamingStatus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    const v1, 0x7f0b0067

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(I)V

    .line 208
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 213
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updatePage "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v1}, Lcom/mediatek/common/agps/MtkAgpsManager;->getProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v1

    iget-object v1, v1, Lcom/mediatek/common/agps/MtkAgpsProfile;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 214
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v0}, Lcom/mediatek/common/agps/MtkAgpsManager;->getProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->updateSlpProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V

    .line 215
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkInitiateCB:Landroid/preference/CheckBoxPreference;

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v1}, Lcom/mediatek/common/agps/MtkAgpsManager;->getNiStatus()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 216
    return-void

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    const v1, 0x7f0b0068

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setSummary(I)V

    .line 211
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto :goto_0
.end method

.method private updateSlpProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V
    .locals 3
    .parameter "selectProfile"

    .prologue
    const/4 v0, 0x1

    .line 414
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mSelectProfileListPref:Landroid/preference/ListPreference;

    iget-object v2, p1, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 415
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mSelectProfileListPref:Landroid/preference/ListPreference;

    iget-object v2, p1, Lcom/mediatek/common/agps/MtkAgpsProfile;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 417
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mSLPAddressET:Landroid/preference/EditTextPreference;

    iget-object v2, p1, Lcom/mediatek/common/agps/MtkAgpsProfile;->addr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 418
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mSLPAddressET:Landroid/preference/EditTextPreference;

    iget-object v2, p1, Lcom/mediatek/common/agps/MtkAgpsProfile;->addr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 420
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mPortET:Landroid/preference/EditTextPreference;

    iget v2, p1, Lcom/mediatek/common/agps/MtkAgpsProfile;->port:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 421
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mPortET:Landroid/preference/EditTextPreference;

    iget v2, p1, Lcom/mediatek/common/agps/MtkAgpsProfile;->port:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 423
    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mTLSCB:Landroid/preference/CheckBoxPreference;

    iget v2, p1, Lcom/mediatek/common/agps/MtkAgpsProfile;->tls:I

    if-ne v0, v2, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 424
    return-void

    .line 423
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 140
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 142
    const-string v0, "onCreate"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 143
    new-instance v0, Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    invoke-direct {v0}, Lcom/mediatek/common/agps/MtkAgpsProfileManager;-><init>()V

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    .line 144
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    const-string v1, "/etc/agps_profiles_conf.xml"

    invoke-virtual {v0, v1}, Lcom/mediatek/common/agps/MtkAgpsProfileManager;->updateAgpsProfile(Ljava/lang/String;)V

    .line 145
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    invoke-virtual {v0}, Lcom/mediatek/common/agps/MtkAgpsProfileManager;->getDefaultProfile()Lcom/mediatek/common/agps/MtkAgpsProfile;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mDefaultProfile:Lcom/mediatek/common/agps/MtkAgpsProfile;

    .line 147
    const-string v0, "mtk-agps"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/agps/MtkAgpsManager;

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    .line 148
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mConnMgr:Landroid/net/ConnectivityManager;

    .line 150
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mWifiMgr:Landroid/net/wifi/WifiManager;

    .line 152
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelephonyMgr:Landroid/telephony/TelephonyManager;

    .line 153
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelMgrEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 155
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mConnMgr:Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mWifiMgr:Landroid/net/wifi/WifiManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelephonyMgr:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_1

    .line 156
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ERR: getSystemService failed mAgpsMgr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " mConnMgr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mConnMgr:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " mWifiMgr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mWifiMgr:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " mTelephonyMgr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsSettings;->mTelephonyMgr:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 164
    :goto_0
    return-void

    .line 161
    :cond_1
    const v0, 0x7f050004

    invoke-virtual {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->addPreferencesFromResource(I)V

    .line 162
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->initPreference()V

    goto :goto_0
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .parameter "id"

    .prologue
    const v3, 0x7f0b0020

    .line 473
    const/4 v0, 0x0

    .line 474
    .local v0, dialog:Landroid/app/Dialog;
    if-nez p1, :cond_0

    .line 475
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b005a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x108009b

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0b005b

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 496
    :goto_0
    return-object v0

    .line 478
    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 479
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0b006e

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0b006f

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/mediatek/lbs/AgpsSettings$3;

    invoke-direct {v2, p0}, Lcom/mediatek/lbs/AgpsSettings$3;-><init>(Lcom/mediatek/lbs/AgpsSettings;)V

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0b0044

    new-instance v3, Lcom/mediatek/lbs/AgpsSettings$2;

    invoke-direct {v3, p0}, Lcom/mediatek/lbs/AgpsSettings$2;-><init>(Lcom/mediatek/lbs/AgpsSettings;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 492
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->updatePage()V

    goto :goto_0

    .line 494
    :cond_1
    const-string v1, "WARNING: onCreateDialog unknown id recv"

    invoke-direct {p0, v1}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 201
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 202
    const-string v0, "^_^ onDestroy"

    invoke-direct {p0, v0}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method public onPause()V
    .locals 5

    .prologue
    .line 168
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onPause()V

    .line 169
    const-string v2, "^_^ onPause"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 172
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "agps_operator"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 173
    .local v1, sharedPref:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 174
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "save mOperatorCode to sharedpreference "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 175
    const-string v2, "saved_operator_code"

    iget-object v3, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 176
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 178
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 180
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 9
    .parameter "preference"
    .parameter "value"

    .prologue
    const/4 v8, 0x1

    .line 435
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    .line 437
    .local v3, key:Ljava/lang/String;
    const-string v6, "select_profile"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 438
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 439
    .local v0, code:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onPreferenceChange "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 440
    new-instance v5, Lcom/mediatek/common/agps/MtkAgpsProfile;

    invoke-direct {v5}, Lcom/mediatek/common/agps/MtkAgpsProfile;-><init>()V

    .line 441
    .local v5, selectProfile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsProfileManager:Lcom/mediatek/common/agps/MtkAgpsProfileManager;

    invoke-virtual {v6}, Lcom/mediatek/common/agps/MtkAgpsProfileManager;->getAllProfile()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mediatek/common/agps/MtkAgpsProfile;

    .line 442
    .local v4, profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    iget-object v6, v4, Lcom/mediatek/common/agps/MtkAgpsProfile;->code:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 443
    move-object v5, v4

    .line 447
    .end local v4           #profile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    :cond_1
    invoke-direct {p0, v5}, Lcom/mediatek/lbs/AgpsSettings;->updateSlpProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V

    .line 448
    const-string v6, "onPreferenceChange set profile to mAgpsMgr"

    invoke-direct {p0, v6}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 449
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v6, v5}, Lcom/mediatek/common/agps/MtkAgpsManager;->setProfile(Lcom/mediatek/common/agps/MtkAgpsProfile;)V

    .line 462
    .end local v0           #code:Ljava/lang/String;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v5           #selectProfile:Lcom/mediatek/common/agps/MtkAgpsProfile;
    :cond_2
    :goto_0
    return v8

    .line 450
    :cond_3
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    invoke-virtual {v6}, Landroid/preference/ListPreference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 451
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mNetworkUsedListPref:Landroid/preference/ListPreference;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v2

    .line 452
    .local v2, index:I
    if-nez v2, :cond_4

    .line 453
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Lcom/mediatek/common/agps/MtkAgpsManager;->setRoamingEnable(Z)V

    .line 454
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->updatePage()V

    goto :goto_0

    .line 455
    :cond_4
    if-ne v2, v8, :cond_2

    .line 456
    iget-object v6, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-interface {v6}, Lcom/mediatek/common/agps/MtkAgpsManager;->getRoamingStatus()Z

    move-result v6

    if-nez v6, :cond_2

    .line 457
    invoke-virtual {p0, v8}, Lcom/mediatek/lbs/AgpsSettings;->showDialog(I)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v4, 0x0

    .line 296
    invoke-super {p0, p1, p2}, Lcom/android/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    .line 298
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Network_Initiate"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v1, p2

    .line 299
    check-cast v1, Landroid/preference/CheckBoxPreference;

    .line 300
    .local v1, niCheckBox:Landroid/preference/CheckBoxPreference;
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    invoke-interface {v2, v3}, Lcom/mediatek/common/agps/MtkAgpsManager;->setNiEnable(Z)V

    .line 308
    .end local v1           #niCheckBox:Landroid/preference/CheckBoxPreference;
    :cond_0
    :goto_0
    return v4

    .line 301
    :cond_1
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    const-string v3, "disable_agps_on_reboot"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 302
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.mediatek.agps.DISABLE_UPDATED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 303
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "status"

    iget-object v3, p0, Lcom/mediatek/lbs/AgpsSettings;->mDisableOnRebootCB:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 304
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 305
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mAboutPref:Landroid/preference/Preference;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mAboutPref:Landroid/preference/Preference;

    invoke-virtual {v2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 306
    invoke-virtual {p0, v4}, Lcom/mediatek/lbs/AgpsSettings;->showDialog(I)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 5

    .prologue
    .line 184
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 185
    const-string v2, "onResume"

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 187
    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 188
    .local v0, intentFilter:Landroid/content/IntentFilter;
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/lbs/AgpsSettings;->mDataConnReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 190
    invoke-virtual {p0}, Lcom/mediatek/lbs/AgpsSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "agps_operator"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 191
    .local v1, sharedPref:Landroid/content/SharedPreferences;
    const-string v2, "saved_operator_code"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "restored mOperatorCode "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/lbs/AgpsSettings;->mOperatorCode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/lbs/AgpsSettings;->log(Ljava/lang/String;)V

    .line 194
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->updateDataConnStatus()V

    .line 195
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->initSlpProfileList()V

    .line 196
    invoke-direct {p0}, Lcom/mediatek/lbs/AgpsSettings;->updatePage()V

    .line 197
    return-void
.end method
