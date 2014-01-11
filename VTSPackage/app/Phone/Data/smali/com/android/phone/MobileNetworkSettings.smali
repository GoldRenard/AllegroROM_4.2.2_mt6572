.class public Lcom/android/phone/MobileNetworkSettings;
.super Landroid/preference/PreferenceActivity;
.source "MobileNetworkSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/MobileNetworkSettings$MyHandler;
    }
.end annotation


# static fields
.field private static final ACTION_DATA_USAGE_DISABLED_DIALOG_OK:Ljava/lang/String; = "com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK"

.field private static final BUTTON_2G_ONLY:Ljava/lang/String; = "button_prefer_2g_key"

.field private static final BUTTON_3G_SERVICE:Ljava/lang/String; = "button_3g_service_key"

.field private static final BUTTON_APN:Ljava/lang/String; = "button_apn_key"

.field private static final BUTTON_CARRIER_SEL:Ljava/lang/String; = "button_carrier_sel_key"

.field private static final BUTTON_CDMA_LTE_DATA_SERVICE_KEY:Ljava/lang/String; = "cdma_lte_data_service_key"

.field private static final BUTTON_CDMA_OPTIONS:Ljava/lang/String; = "cdma_options_key"

.field private static final BUTTON_DATA_ENABLED_KEY:Ljava/lang/String; = "button_data_enabled_key"

.field private static final BUTTON_DATA_USAGE_KEY:Ljava/lang/String; = "button_data_usage_key"

.field private static final BUTTON_GSM_UMTS_OPTIONS:Ljava/lang/String; = "gsm_umts_options_key"

.field private static final BUTTON_NETWORK_MODE_EX_KEY:Ljava/lang/String; = "button_network_mode_ex_key"

.field private static final BUTTON_NETWORK_MODE_KEY:Ljava/lang/String; = "gsm_umts_preferred_network_mode_key"

.field private static final BUTTON_PLMN_LIST:Ljava/lang/String; = "button_plmn_key"

.field private static final BUTTON_PREFERED_NETWORK_MODE:Ljava/lang/String; = "preferred_network_mode_key"

.field private static final BUTTON_ROAMING_KEY:Ljava/lang/String; = "button_roaming_key"

.field private static final DATA_DISABLE_ALERT_DIALOG:I = 0xc8

.field private static final DATA_ENABLE_ALERT_DIALOG:I = 0x64

.field public static final DATA_STATE_CHANGE_TIMEOUT:I = 0x7d1

.field private static final DBG:Z = true

.field private static final DIALOG_GPRS_SWITCH_CONFIRM:I = 0x1

.field private static final IFACE:Ljava/lang/String; = "rmnet0"

.field private static final KEY_DATA_CONN:Ljava/lang/String; = "data_connection_setting"

.field private static final LOG_TAG:Ljava/lang/String; = "NetworkSettings"

.field private static final MODEM_MASK_EDGE:I = 0x2

.field private static final MODEM_MASK_GPRS:I = 0x1

.field private static final MODEM_MASK_HSDPA:I = 0x10

.field private static final MODEM_MASK_HSUPA:I = 0x20

.field private static final MODEM_MASK_TDSCDMA:I = 0x8

.field private static final MODEM_MASK_WCDMA:I = 0x4

.field private static final PIN1_REQUEST_CODE:I = 0x12e

.field private static final PREFERRED_NETWORK_MODE:I = 0x0

.field private static final PROGRESS_DIALOG:I = 0x190

.field public static final REQUEST_CODE_EXIT_ECM:I = 0x11

.field private static final ROAMING_DIALOG:I = 0x12c

.field private static final TRANSACTION_START:Ljava/lang/String; = "com.android.mms.transaction.START"

.field private static final TRANSACTION_STOP:Ljava/lang/String; = "com.android.mms.transaction.STOP"

.field private static final UP_ACTIVITY_CLASS:Ljava/lang/String; = "com.android.settings.Settings$WirelessSettingsActivity"

.field private static final UP_ACTIVITY_PACKAGE:Ljava/lang/String; = "com.android.settings"


# instance fields
.field private mAirplaneModeEnabled:Z

.field private mApnPref:Landroid/preference/PreferenceScreen;

.field private mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

.field private mButtonDataRoam:Landroid/preference/CheckBoxPreference;

.field private mButtonDataUsage:Landroid/preference/Preference;

.field private mButtonPreferredGSMOnly:Landroid/preference/CheckBoxPreference;

.field private mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

.field private mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

.field private mCarrierSelPref:Landroid/preference/PreferenceScreen;

.field mCdmaOptions:Lcom/android/phone/CdmaOptions;

.field private mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

.field private mClickedPreference:Landroid/preference/Preference;

.field private mConnService:Landroid/net/ConnectivityManager;

.field private mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

.field private mDataSwitchMsgIndex:I

.field private mDataUsageListener:Lcom/android/phone/DataUsageListener;

.field private mDualSimMode:I

.field private mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

.field private mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

.field private mGprsDefaultSIMObserver:Landroid/database/ContentObserver;

.field mGsmUmtsOptions:Lcom/android/phone/GsmUmtsOptions;

.field mH:Landroid/os/Handler;

.field private mHandler:Lcom/android/phone/MobileNetworkSettings$MyHandler;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mIsChangeData:Z

.field private mLteDataServicePref:Landroid/preference/Preference;

.field private mOkClicked:Z

.field private mPLMNPreference:Landroid/preference/Preference;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

.field private mPreference3GSwitch:Landroid/preference/Preference;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSelectGprsIndex:J

.field private mSimId:I

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 122
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    .line 209
    iput v2, p0, Lcom/android/phone/MobileNetworkSettings;->mDataSwitchMsgIndex:I

    .line 210
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/phone/MobileNetworkSettings;->mSelectGprsIndex:J

    .line 213
    new-instance v0, Lcom/android/phone/MobileNetworkSettings$1;

    invoke-direct {v0, p0}, Lcom/android/phone/MobileNetworkSettings$1;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 228
    new-instance v0, Lcom/android/phone/MobileNetworkSettings$2;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/phone/MobileNetworkSettings$2;-><init>(Lcom/android/phone/MobileNetworkSettings;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    .line 237
    iput-boolean v3, p0, Lcom/android/phone/MobileNetworkSettings;->mAirplaneModeEnabled:Z

    .line 238
    iput v2, p0, Lcom/android/phone/MobileNetworkSettings;->mDualSimMode:I

    .line 240
    new-instance v0, Lcom/android/phone/MobileNetworkSettings$3;

    invoke-direct {v0, p0}, Lcom/android/phone/MobileNetworkSettings$3;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 322
    iput-boolean v3, p0, Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z

    .line 323
    new-instance v0, Lcom/android/phone/MobileNetworkSettings$4;

    invoke-direct {v0, p0}, Lcom/android/phone/MobileNetworkSettings$4;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    .line 1185
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 122
    invoke-static {p0}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/phone/MobileNetworkSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->setScreenEnabled()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/phone/MobileNetworkSettings;)Landroid/preference/CheckBoxPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/phone/MobileNetworkSettings;)Landroid/net/ConnectivityManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/phone/MobileNetworkSettings;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 122
    iget-wide v0, p0, Lcom/android/phone/MobileNetworkSettings;->mSelectGprsIndex:J

    return-wide v0
.end method

.method static synthetic access$1302(Lcom/android/phone/MobileNetworkSettings;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 122
    iput-wide p1, p0, Lcom/android/phone/MobileNetworkSettings;->mSelectGprsIndex:J

    return-wide p1
.end method

.method static synthetic access$1400(Lcom/android/phone/MobileNetworkSettings;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataSwitchMsgIndex:I

    return v0
.end method

.method static synthetic access$1500(Lcom/android/phone/MobileNetworkSettings;J)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lcom/android/phone/MobileNetworkSettings;->enableDataRoaming(J)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1600(Lcom/android/phone/MobileNetworkSettings;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lcom/android/phone/MobileNetworkSettings;->switchGprsDefautlSIM(J)V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/phone/MobileNetworkSettings;)Landroid/preference/ListPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/android/phone/MobileNetworkSettings;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget v0, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    return v0
.end method

.method static synthetic access$1900(Lcom/android/phone/MobileNetworkSettings;)Lcom/android/internal/telephony/gemini/GeminiPhone;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/phone/MobileNetworkSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->setDataConnPref()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/phone/MobileNetworkSettings;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 122
    iput-boolean p1, p0, Lcom/android/phone/MobileNetworkSettings;->mAirplaneModeEnabled:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/phone/MobileNetworkSettings;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget-boolean v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z

    return v0
.end method

.method static synthetic access$402(Lcom/android/phone/MobileNetworkSettings;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 122
    iput-boolean p1, p0, Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z

    return p1
.end method

.method static synthetic access$500(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    invoke-static {p0}, Lcom/android/phone/MobileNetworkSettings;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$602(Lcom/android/phone/MobileNetworkSettings;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 122
    iput p1, p0, Lcom/android/phone/MobileNetworkSettings;->mDualSimMode:I

    return p1
.end method

.method static synthetic access$700(Lcom/android/phone/MobileNetworkSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->setNetworkOperator()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/phone/MobileNetworkSettings;)Lcom/android/internal/telephony/Phone;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/phone/MobileNetworkSettings;)Lcom/mediatek/settings/DefaultSimPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    return-object v0
.end method

.method private dealWithDataConn(J)V
    .locals 3
    .parameter "simid"

    .prologue
    .line 1140
    const/4 v0, 0x0

    .line 1142
    .local v0, isDataEnabled:Z
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-eqz v1, :cond_0

    .line 1143
    const/4 v0, 0x1

    .line 1145
    :cond_0
    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    invoke-virtual {v1, v0, p0}, Lcom/mediatek/phone/ext/SettingsExtension;->dataEnableReminder(ZLandroid/preference/PreferenceActivity;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1146
    const-string v1, "NetworkSettings"

    const-string v2, "onPreferenceTreeClick: preference == mButtonDataEnabled."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1147
    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    if-nez v1, :cond_2

    .line 1148
    const-string v1, "NetworkSettings"

    const-string v2, "mConnService is null"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1157
    :cond_1
    :goto_0
    return-void

    .line 1151
    :cond_2
    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    invoke-virtual {v1, v0}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 1152
    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->isNeedtoShowRoamingMsg()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1154
    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    const v2, 0x7f0d011e

    invoke-virtual {v1, p0, v2}, Lcom/mediatek/phone/ext/SettingsExtension;->showWarningDlg(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method private enableDataRoaming(J)Z
    .locals 7
    .parameter "simId"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1471
    invoke-static {p0, p1, p2}, Landroid/provider/Telephony$SIMInfo;->getSlotById(Landroid/content/Context;J)I

    move-result v2

    .line 1472
    .local v2, slotId:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "enableDataRoaming with SimId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", slotId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1473
    invoke-static {v2}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1475
    :try_start_0
    const-string v5, "phone"

    invoke-static {v5}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 1477
    .local v1, iTelephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 1478
    const/4 v5, 0x1

    invoke-interface {v1, v5, v2}, Lcom/android/internal/telephony/ITelephony;->setDataRoamingEnabledGemini(ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1484
    :cond_0
    invoke-static {p0, v3, p1, p2}, Landroid/provider/Telephony$SIMInfo;->setDataRoaming(Landroid/content/Context;IJ)I

    .line 1488
    .end local v1           #iTelephony:Lcom/android/internal/telephony/ITelephony;
    :goto_0
    return v3

    .line 1480
    :catch_0
    move-exception v0

    .line 1481
    .local v0, e:Landroid/os/RemoteException;
    const-string v3, "iTelephony exception"

    invoke-static {v3}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    move v3, v4

    .line 1482
    goto :goto_0

    .line 1487
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_1
    const-string v3, "enableDataRoaming error: slotId is not valid, the SIM card may be pulled out."

    invoke-static {v3}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    move v3, v4

    .line 1488
    goto :goto_0
.end method

.method private getBaseBand(I)I
    .locals 7
    .parameter "slot"

    .prologue
    .line 1371
    const/4 v3, 0x0

    .line 1372
    .local v3, value:I
    const-string v2, "gsm.baseband.capability"

    .line 1373
    .local v2, propertyKey:Ljava/lang/String;
    const/4 v0, 0x0

    .line 1374
    .local v0, capability:Ljava/lang/String;
    const/4 v5, 0x1

    if-ne p1, v5, :cond_0

    .line 1375
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "2"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1377
    :cond_0
    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1378
    if-eqz v0, :cond_1

    const-string v5, ""

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    move v4, v3

    .line 1387
    .end local v3           #value:I
    .local v4, value:I
    :goto_0
    return v4

    .line 1383
    .end local v4           #value:I
    .restart local v3       #value:I
    :cond_2
    const/16 v5, 0x10

    :try_start_0
    invoke-static {v0, v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    :goto_1
    move v4, v3

    .line 1387
    .end local v3           #value:I
    .restart local v4       #value:I
    goto :goto_0

    .line 1384
    .end local v4           #value:I
    .restart local v3       #value:I
    :catch_0
    move-exception v1

    .line 1385
    .local v1, ne:Ljava/lang/NumberFormatException;
    const-string v5, "parse value of basband error"

    invoke-static {v5}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private static getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 2
    .parameter "intent"

    .prologue
    .line 1391
    const-string v1, "state"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1392
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1393
    const-class v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    invoke-static {v1, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    .line 1395
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    goto :goto_0
.end method

.method private getSimInfoById(J)Landroid/provider/Telephony$SIMInfo;
    .locals 5
    .parameter "simId"

    .prologue
    .line 1457
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 1458
    .local v2, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/provider/Telephony$SIMInfo;

    .line 1459
    .local v1, simInfo:Landroid/provider/Telephony$SIMInfo;
    iget-wide v3, v1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    cmp-long v3, p1, v3

    if-nez v3, :cond_0

    .line 1463
    .end local v1           #simInfo:Landroid/provider/Telephony$SIMInfo;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isNeedtoShowRoamingMsg()Z
    .locals 6

    .prologue
    .line 1321
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Lcom/android/phone/MobileNetworkSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 1322
    .local v2, telMgr:Landroid/telephony/TelephonyManager;
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->isNetworkRoaming()Z

    move-result v0

    .line 1323
    .local v0, isInRoaming:Z
    iget-object v3, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v3}, Lcom/android/internal/telephony/Phone;->getDataRoamingEnabled()Z

    move-result v1

    .line 1324
    .local v1, isRoamingEnabled:Z
    const-string v3, "NetworkSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "***isInRoaming="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " isRoamingEnabled="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1325
    if-eqz v0, :cond_0

    if-nez v1, :cond_0

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private isRadioOff()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v3, -0x1

    .line 871
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eq v1, v0, :cond_0

    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_1

    .line 875
    .local v0, isAllRadioOff:Z
    :cond_0
    :goto_0
    const-string v1, "NetworkSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isAllRadioOff="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 876
    return v0

    .line 871
    .end local v0           #isAllRadioOff:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isSimLocked()Z
    .locals 6

    .prologue
    .line 518
    const/4 v2, 0x0

    .line 520
    .local v2, isLocked:Z
    :try_start_0
    const-string v3, "phone"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 521
    .local v1, iTelephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 522
    invoke-interface {v1}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorState()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    const/4 v2, 0x1

    .line 528
    .end local v1           #iTelephony:Lcom/android/internal/telephony/ITelephony;
    :cond_0
    :goto_0
    return v2

    .line 522
    .restart local v1       #iTelephony:Lcom/android/internal/telephony/ITelephony;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 524
    .end local v1           #iTelephony:Lcom/android/internal/telephony/ITelephony;
    :catch_0
    move-exception v0

    .line 525
    .local v0, e:Landroid/os/RemoteException;
    const-string v3, "NetworkSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[e = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 1346
    const-string v0, "NetworkSettings"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1347
    return-void
.end method

.method private setDataConnPref()V
    .locals 18

    .prologue
    .line 793
    const-string v14, "NetworkSettings"

    const-string v15, "setDataConnPref"

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 794
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    if-eqz v14, :cond_7

    .line 795
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/phone/MobileNetworkSettings;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v14, v15}, Lcom/mediatek/settings/DefaultSimPreference;->setCellConnMgr(Lcom/mediatek/CellConnService/CellConnMgr;)V

    .line 796
    const/4 v6, 0x0

    .line 797
    .local v6, isEnabled:Z
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    if-eqz v14, :cond_3

    .line 798
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    invoke-virtual {v14}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v6

    .line 802
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    const-string v15, "gprs_connection_sim_setting"

    const-wide/16 v16, -0x5

    invoke-static/range {v14 .. v17}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v1

    .line 805
    .local v1, dataconnectionID:J
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 806
    .local v8, mSimItemListGprs:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/settings/SimItem;>;"
    invoke-static/range {p0 .. p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v10

    .line 807
    .local v10, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    new-instance v14, Lcom/mediatek/settings/CallSettings$SIMInfoComparable;

    invoke-direct {v14}, Lcom/mediatek/settings/CallSettings$SIMInfoComparable;-><init>()V

    invoke-static {v10, v14}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 808
    invoke-interface {v8}, Ljava/util/List;->clear()V

    .line 810
    const/4 v13, 0x0

    .line 811
    .local v13, state:I
    const/4 v7, 0x0

    .line 812
    .local v7, k:I
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v9

    .line 813
    .local v9, mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/provider/Telephony$SIMInfo;

    .line 814
    .local v11, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v11, :cond_2

    .line 815
    new-instance v12, Lcom/mediatek/settings/SimItem;

    invoke-direct {v12, v11}, Lcom/mediatek/settings/SimItem;-><init>(Landroid/provider/Telephony$SIMInfo;)V

    .line 818
    .local v12, simitem:Lcom/mediatek/settings/SimItem;
    :try_start_0
    const-string v14, "phone"

    invoke-static {v14}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v14

    invoke-static {v14}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v5

    .line 820
    .local v5, iTelephony:Lcom/android/internal/telephony/ITelephony;
    if-eqz v5, :cond_0

    .line 822
    iget v14, v11, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-interface {v5, v14}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v13

    .line 831
    .end local v5           #iTelephony:Lcom/android/internal/telephony/ITelephony;
    :cond_0
    :goto_2
    iput v13, v12, Lcom/mediatek/settings/SimItem;->mState:I

    .line 832
    const-string v14, "NetworkSettings"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "state="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    iget v0, v12, Lcom/mediatek/settings/SimItem;->mState:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    iget-wide v14, v11, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    cmp-long v14, v14, v1

    if-nez v14, :cond_1

    .line 835
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    invoke-virtual {v14, v7}, Lcom/mediatek/settings/DefaultSimPreference;->setInitValue(I)V

    .line 836
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    iget-object v15, v11, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v14, v15}, Lcom/mediatek/settings/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 846
    :cond_1
    invoke-interface {v8, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 848
    .end local v12           #simitem:Lcom/mediatek/settings/SimItem;
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 800
    .end local v1           #dataconnectionID:J
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v7           #k:I
    .end local v8           #mSimItemListGprs:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/settings/SimItem;>;"
    .end local v9           #mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    .end local v10           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v11           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v13           #state:I
    :cond_3
    const-string v14, "NetworkSettings"

    const-string v15, "mConnService is null"

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 827
    .restart local v1       #dataconnectionID:J
    .restart local v4       #i$:Ljava/util/Iterator;
    .restart local v7       #k:I
    .restart local v8       #mSimItemListGprs:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/settings/SimItem;>;"
    .restart local v9       #mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    .restart local v10       #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .restart local v11       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v12       #simitem:Lcom/mediatek/settings/SimItem;
    .restart local v13       #state:I
    :catch_0
    move-exception v3

    .line 828
    .local v3, e:Landroid/os/RemoteException;
    const-string v14, "NetworkSettings"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "[e = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "]"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 851
    .end local v3           #e:Landroid/os/RemoteException;
    .end local v11           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v12           #simitem:Lcom/mediatek/settings/SimItem;
    :cond_4
    const-wide/16 v14, 0x0

    cmp-long v14, v1, v14

    if-nez v14, :cond_5

    .line 852
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v15

    invoke-virtual {v14, v15}, Lcom/mediatek/settings/DefaultSimPreference;->setInitValue(I)V

    .line 853
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    const v15, 0x7f0d00a0

    invoke-virtual {v14, v15}, Lcom/mediatek/settings/DefaultSimPreference;->setSummary(I)V

    .line 861
    :cond_5
    new-instance v12, Lcom/mediatek/settings/SimItem;

    const/4 v14, 0x0

    invoke-direct {v12, v14}, Lcom/mediatek/settings/SimItem;-><init>(Landroid/provider/Telephony$SIMInfo;)V

    .line 862
    .restart local v12       #simitem:Lcom/mediatek/settings/SimItem;
    invoke-direct/range {p0 .. p0}, Lcom/android/phone/MobileNetworkSettings;->isRadioOff()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 863
    const/4 v14, 0x1

    iput v14, v12, Lcom/mediatek/settings/SimItem;->mState:I

    .line 865
    :cond_6
    invoke-interface {v8, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 866
    const-string v14, "NetworkSettings"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "mSimItemListGprs="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 867
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    invoke-virtual {v14, v8}, Lcom/mediatek/settings/DefaultSimPreference;->setInitData(Ljava/util/List;)V

    .line 869
    .end local v1           #dataconnectionID:J
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v6           #isEnabled:Z
    .end local v7           #k:I
    .end local v8           #mSimItemListGprs:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/settings/SimItem;>;"
    .end local v9           #mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;
    .end local v10           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v12           #simitem:Lcom/mediatek/settings/SimItem;
    .end local v13           #state:I
    :cond_7
    return-void
.end method

.method private setNetworkOperator()V
    .locals 7

    .prologue
    .line 725
    const/4 v1, 0x0

    .line 726
    .local v1, isShowPlmn:Z
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 727
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 728
    .local v3, sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    .line 729
    .local v2, sim:Landroid/provider/Telephony$SIMInfo;
    iget-object v4, p0, Lcom/android/phone/MobileNetworkSettings;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v5, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->isCspPlmnEnabled(I)Z

    move-result v4

    or-int/2addr v1, v4

    goto :goto_0

    .line 732
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v2           #sim:Landroid/provider/Telephony$SIMInfo;
    .end local v3           #sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_0
    iget-object v4, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v4}, Lcom/android/internal/telephony/Phone;->isCspPlmnEnabled()Z

    move-result v1

    .line 734
    :cond_1
    iget-object v4, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v5

    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings;->mCarrierSelPref:Landroid/preference/PreferenceScreen;

    invoke-virtual {v4, v5, v6, v1}, Lcom/mediatek/phone/ext/SettingsExtension;->removeNMOp(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;Z)V

    .line 735
    return-void
.end method

.method private setScreenEnabled()V
    .locals 15

    .prologue
    .line 1399
    const/4 v6, 0x0

    .line 1400
    .local v6, isShouldEnabled:Z
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v12}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v12

    if-nez v12, :cond_3

    const/4 v4, 0x1

    .line 1402
    .local v4, isIdle:Z
    :goto_0
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v9

    .line 1403
    .local v9, sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    if-eqz v9, :cond_4

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v12

    if-lez v12, :cond_4

    const/4 v3, 0x1

    .line 1404
    .local v3, isHasSimCard:Z
    :goto_1
    if-eqz v4, :cond_5

    iget-boolean v12, p0, Lcom/android/phone/MobileNetworkSettings;->mAirplaneModeEnabled:Z

    if-nez v12, :cond_5

    iget v12, p0, Lcom/android/phone/MobileNetworkSettings;->mDualSimMode:I

    if-eqz v12, :cond_5

    if-eqz v3, :cond_5

    const/4 v6, 0x1

    .line 1406
    :goto_2
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v12

    invoke-virtual {v12, v6}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 1407
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    iget-object v13, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    iget-object v14, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v14}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v14

    invoke-virtual {v12, v13, v14}, Lcom/mediatek/phone/ext/SettingsExtension;->disableDataRoaming(Landroid/preference/CheckBoxPreference;Z)V

    .line 1408
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    .line 1409
    .local v2, isGeminiMode:Z
    const-string v12, "3G_SWITCH"

    invoke-static {v12}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v7

    .line 1410
    .local v7, isSupport3GSwitch:Z
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    if-eqz v12, :cond_0

    .line 1411
    iget-object v13, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    if-eqz v3, :cond_6

    if-eqz v6, :cond_6

    const/4 v12, 0x1

    :goto_3
    invoke-virtual {v13, v12}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 1413
    :cond_0
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    if-eqz v12, :cond_1

    .line 1414
    if-eqz v6, :cond_7

    const/4 v12, 0x0

    invoke-static {v12}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v12

    if-eqz v12, :cond_7

    const/4 v5, 0x1

    .line 1415
    .local v5, isNWModeEnabled:Z
    :goto_4
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v12, v5}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 1416
    if-nez v5, :cond_1

    .line 1417
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v12}, Landroid/preference/ListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 1418
    .local v0, dialog:Landroid/app/Dialog;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 1419
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 1424
    .end local v0           #dialog:Landroid/app/Dialog;
    .end local v5           #isNWModeEnabled:Z
    :cond_1
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    if-eqz v12, :cond_9

    .line 1425
    const/4 v5, 0x0

    .line 1426
    .restart local v5       #isNWModeEnabled:Z
    invoke-static {p0}, Lcom/mediatek/settings/CallSettings;->get3GSimCardSlots(Landroid/app/Activity;)[I

    move-result-object v10

    .line 1427
    .local v10, slot3G:[I
    if-eqz v10, :cond_8

    .line 1428
    const/4 v1, 0x0

    .local v1, i:I
    :goto_5
    array-length v12, v10

    if-ge v1, v12, :cond_8

    .line 1429
    aget v12, v10, v1

    invoke-static {v12}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 1430
    const/4 v5, 0x1

    .line 1431
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "slot "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    aget v13, v10, v1

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " radio state is = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1428
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1400
    .end local v1           #i:I
    .end local v2           #isGeminiMode:Z
    .end local v3           #isHasSimCard:Z
    .end local v4           #isIdle:Z
    .end local v5           #isNWModeEnabled:Z
    .end local v7           #isSupport3GSwitch:Z
    .end local v9           #sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v10           #slot3G:[I
    :cond_3
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 1403
    .restart local v4       #isIdle:Z
    .restart local v9       #sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_4
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 1404
    .restart local v3       #isHasSimCard:Z
    :cond_5
    const/4 v6, 0x0

    goto/16 :goto_2

    .line 1411
    .restart local v2       #isGeminiMode:Z
    .restart local v7       #isSupport3GSwitch:Z
    :cond_6
    const/4 v12, 0x0

    goto :goto_3

    .line 1414
    :cond_7
    const/4 v5, 0x0

    goto :goto_4

    .line 1435
    .restart local v5       #isNWModeEnabled:Z
    .restart local v10       #slot3G:[I
    :cond_8
    if-eqz v6, :cond_b

    if-eqz v5, :cond_b

    const/4 v5, 0x1

    .line 1436
    :goto_6
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "isNWModeEnabled = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1437
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    invoke-virtual {v12, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 1439
    .end local v5           #isNWModeEnabled:Z
    .end local v10           #slot3G:[I
    :cond_9
    if-eqz v6, :cond_a

    .line 1440
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    if-eqz v12, :cond_a

    .line 1441
    iget-object v12, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    const/4 v13, 0x2

    invoke-virtual {v12, v13}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v8

    .line 1442
    .local v8, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v8, :cond_a

    .line 1443
    invoke-virtual {v8}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v11

    .line 1444
    .local v11, state:Landroid/net/NetworkInfo$State;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "mms state = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1445
    iget-object v13, p0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    sget-object v12, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    if-eq v11, v12, :cond_c

    sget-object v12, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-eq v11, v12, :cond_c

    const/4 v12, 0x1

    :goto_7
    invoke-virtual {v13, v12}, Lcom/mediatek/settings/DefaultSimPreference;->setEnabled(Z)V

    .line 1450
    .end local v8           #networkInfo:Landroid/net/NetworkInfo;
    .end local v11           #state:Landroid/net/NetworkInfo$State;
    :cond_a
    return-void

    .line 1435
    .restart local v5       #isNWModeEnabled:Z
    .restart local v10       #slot3G:[I
    :cond_b
    const/4 v5, 0x0

    goto :goto_6

    .line 1445
    .end local v5           #isNWModeEnabled:Z
    .end local v10           #slot3G:[I
    .restart local v8       #networkInfo:Landroid/net/NetworkInfo;
    .restart local v11       #state:Landroid/net/NetworkInfo$State;
    :cond_c
    const/4 v12, 0x0

    goto :goto_7
.end method

.method private switchGprsDefautlSIM(J)V
    .locals 9
    .parameter "simid"

    .prologue
    const-wide/16 v6, 0x0

    const/4 v4, 0x1

    .line 1163
    cmp-long v5, p1, v6

    if-gez v5, :cond_1

    .line 1164
    const-string v4, "NetworkSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "value="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is an exceptions"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1184
    :cond_0
    :goto_0
    return-void

    .line 1167
    :cond_1
    cmp-long v5, p1, v6

    if-lez v5, :cond_2

    move v3, v4

    .line 1169
    .local v3, isConnect:Z
    :goto_1
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "gprs_connection_sim_setting"

    const-wide/16 v7, -0x5

    invoke-static {v5, v6, v7, v8}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 1171
    .local v0, gprsValue:J
    const-string v5, "NetworkSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Current gprsValue="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " and target value="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1172
    cmp-long v5, p1, v0

    if-eqz v5, :cond_0

    .line 1175
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.DATA_DEFAULT_SIM"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1176
    .local v2, intent:Landroid/content/Intent;
    const-string v5, "simid"

    invoke-virtual {v2, v5, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1177
    invoke-virtual {p0, v2}, Lcom/android/phone/MobileNetworkSettings;->sendBroadcast(Landroid/content/Intent;)V

    .line 1181
    const/16 v5, 0x190

    invoke-virtual {p0, v5}, Lcom/android/phone/MobileNetworkSettings;->showDialog(I)V

    .line 1182
    iget-object v5, p0, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    const/16 v7, 0x7d1

    invoke-virtual {v6, v7}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    const-wide/16 v7, 0x7530

    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1183
    iput-boolean v4, p0, Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z

    goto :goto_0

    .line 1167
    .end local v0           #gprsValue:J
    .end local v2           #intent:Landroid/content/Intent;
    .end local v3           #isConnect:Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 1330
    packed-switch p1, :pswitch_data_0

    .line 1343
    :cond_0
    :goto_0
    return-void

    .line 1332
    :pswitch_0
    const-string v1, "exit_ecm_result"

    const/4 v2, 0x0

    invoke-virtual {p3, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 1334
    .local v0, isChoiceYes:Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1336
    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings;->mCdmaOptions:Lcom/android/phone/CdmaOptions;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mClickedPreference:Landroid/preference/Preference;

    invoke-virtual {v1, v2}, Lcom/android/phone/CdmaOptions;->showDialog(Landroid/preference/Preference;)V

    goto :goto_0

    .line 1330
    nop

    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v1, 0x1

    .line 336
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 337
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/Phone;->setDataRoamingEnabled(Z)V

    .line 338
    iput-boolean v1, p0, Lcom/android/phone/MobileNetworkSettings;->mOkClicked:Z

    .line 343
    :goto_0
    return-void

    .line 341
    :cond_0
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "icicle"

    .prologue
    .line 533
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 535
    const v0, 0x7f060016

    invoke-virtual {p0, v0}, Lcom/android/phone/MobileNetworkSettings;->addPreferencesFromResource(I)V

    .line 537
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->getSettingsExtension()Lcom/mediatek/phone/ext/SettingsExtension;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    .line 539
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 541
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 542
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 544
    :cond_0
    new-instance v0, Lcom/android/phone/MobileNetworkSettings$MyHandler;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/android/phone/MobileNetworkSettings$MyHandler;-><init>(Lcom/android/phone/MobileNetworkSettings;Lcom/android/phone/MobileNetworkSettings$1;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mHandler:Lcom/android/phone/MobileNetworkSettings$MyHandler;

    .line 546
    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    .line 547
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 548
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 550
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 554
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 555
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 556
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 557
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "com.android.mms.transaction.START"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 558
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "com.android.mms.transaction.STOP"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 559
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v2, "com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 561
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Lcom/android/phone/MobileNetworkSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 562
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v3, 0x20

    invoke-virtual {v0, v2, v3}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 564
    new-instance v0, Lcom/mediatek/settings/PreCheckForRunning;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/PreCheckForRunning;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    .line 565
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v8

    .line 566
    .local v8, list:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_4

    .line 567
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/mediatek/settings/PreCheckForRunning;->mByPass:Z

    .line 568
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/provider/Telephony$SIMInfo;

    iget v0, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iput v0, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    .line 574
    :goto_0
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 576
    .local v1, prefSet:Landroid/preference/PreferenceScreen;
    const-string v0, "data_connection_setting"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/DefaultSimPreference;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    .line 577
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    invoke-virtual {v0, p0}, Lcom/mediatek/settings/DefaultSimPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 578
    const-string v0, "button_data_enabled_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    .line 579
    const-string v0, "button_roaming_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    .line 580
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    const v3, 0x7f0d0210

    invoke-virtual {v2, p0, v3}, Lcom/mediatek/phone/ext/SettingsExtension;->getRoamingSummary(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setSummaryOn(Ljava/lang/CharSequence;)V

    .line 581
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    const v3, 0x7f0d0211

    invoke-virtual {v2, p0, v3}, Lcom/mediatek/phone/ext/SettingsExtension;->getRoamingSummary(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setSummaryOff(Ljava/lang/CharSequence;)V

    .line 582
    const-string v0, "preferred_network_mode_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    .line 584
    const-string v0, "button_data_usage_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataUsage:Landroid/preference/Preference;

    .line 589
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 590
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 591
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 594
    :cond_1
    const-string v0, "button_3g_service_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    .line 595
    const-string v0, "button_plmn_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPLMNPreference:Landroid/preference/Preference;

    .line 597
    const-string v0, "cdma_lte_data_service_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mLteDataServicePref:Landroid/preference/Preference;

    .line 598
    const-string v0, "button_network_mode_ex_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    .line 600
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getLteOnCdmaMode()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_5

    const/4 v7, 0x1

    .line 601
    .local v7, isLteOnCdma:Z
    :goto_1
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0a0002

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 604
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 607
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "preferred_network_mode"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    .line 610
    .local v11, settingsNetworkMode:I
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 611
    new-instance v0, Lcom/android/phone/CdmaOptions;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-direct {v0, p0, v1, v2}, Lcom/android/phone/CdmaOptions;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceScreen;Lcom/android/internal/telephony/Phone;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mCdmaOptions:Lcom/android/phone/CdmaOptions;

    .line 612
    new-instance v0, Lcom/android/phone/GsmUmtsOptions;

    invoke-direct {v0, p0, v1}, Lcom/android/phone/GsmUmtsOptions;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceScreen;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mGsmUmtsOptions:Lcom/android/phone/GsmUmtsOptions;

    .line 696
    .end local v11           #settingsNetworkMode:I
    :goto_2
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "setup_prepaid_data_service_url"

    invoke-static {v0, v2}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    .line 699
    .local v9, missingDataServiceUrl:Z
    if-eqz v7, :cond_2

    if-eqz v9, :cond_11

    .line 700
    :cond_2
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mLteDataServicePref:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 705
    :goto_3
    const-string v0, "throttle"

    invoke-virtual {p0, v0}, Lcom/android/phone/MobileNetworkSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/net/ThrottleManager;

    .line 706
    .local v12, tm:Landroid/net/ThrottleManager;
    new-instance v0, Lcom/android/phone/DataUsageListener;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataUsage:Landroid/preference/Preference;

    invoke-direct {v0, p0, v2, v1}, Lcom/android/phone/DataUsageListener;-><init>(Landroid/content/Context;Landroid/preference/Preference;Landroid/preference/PreferenceScreen;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataUsageListener:Lcom/android/phone/DataUsageListener;

    .line 708
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v2}, Lcom/android/phone/MobileNetworkSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 710
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    .line 711
    .local v6, actionBar:Landroid/app/ActionBar;
    if-eqz v6, :cond_3

    .line 713
    const/4 v0, 0x1

    invoke-virtual {v6, v0}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 716
    :cond_3
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredGSMOnly:Landroid/preference/CheckBoxPreference;

    iget-object v4, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/mediatek/phone/ext/SettingsExtension;->removeNMMode(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;Landroid/preference/Preference;Landroid/preference/Preference;)V

    .line 718
    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->setNetworkOperator()V

    .line 720
    new-instance v0, Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-direct {v0}, Lcom/mediatek/CellConnService/CellConnMgr;-><init>()V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    .line 721
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v0, p0}, Lcom/mediatek/CellConnService/CellConnMgr;->register(Landroid/content/Context;)V

    .line 722
    return-void

    .line 570
    .end local v1           #prefSet:Landroid/preference/PreferenceScreen;
    .end local v6           #actionBar:Landroid/app/ActionBar;
    .end local v7           #isLteOnCdma:Z
    .end local v9           #missingDataServiceUrl:Z
    .end local v12           #tm:Landroid/net/ThrottleManager;
    :cond_4
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/mediatek/settings/PreCheckForRunning;->mByPass:Z

    goto/16 :goto_0

    .line 600
    .restart local v1       #prefSet:Landroid/preference/PreferenceScreen;
    :cond_5
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 614
    .restart local v7       #isLteOnCdma:Z
    :cond_6
    if-nez v7, :cond_7

    .line 615
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 617
    :cond_7
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v10

    .line 618
    .local v10, phoneType:I
    const/4 v0, 0x2

    if-ne v10, v0, :cond_a

    .line 619
    new-instance v0, Lcom/android/phone/CdmaOptions;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-direct {v0, p0, v1, v2}, Lcom/android/phone/CdmaOptions;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceScreen;Lcom/android/internal/telephony/Phone;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mCdmaOptions:Lcom/android/phone/CdmaOptions;

    .line 620
    if-eqz v7, :cond_8

    .line 621
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 622
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    const v2, 0x7f07002e

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setEntries(I)V

    .line 624
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    const v2, 0x7f07002f

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setEntryValues(I)V

    .line 626
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "preferred_network_mode"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    .line 630
    .restart local v11       #settingsNetworkMode:I
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 634
    .end local v11           #settingsNetworkMode:I
    :cond_8
    const-string v0, "3G_SWITCH"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 635
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    if-eqz v0, :cond_9

    .line 636
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 637
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    .line 640
    :cond_9
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 641
    const-string v0, "button_apn_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mApnPref:Landroid/preference/PreferenceScreen;

    .line 642
    const-string v0, "button_carrier_sel_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mCarrierSelPref:Landroid/preference/PreferenceScreen;

    goto/16 :goto_2

    .line 644
    :cond_a
    const/4 v0, 0x1

    if-ne v10, v0, :cond_10

    .line 645
    new-instance v0, Lcom/android/phone/GsmUmtsOptions;

    invoke-direct {v0, p0, v1}, Lcom/android/phone/GsmUmtsOptions;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceScreen;)V

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mGsmUmtsOptions:Lcom/android/phone/GsmUmtsOptions;

    .line 647
    const-string v0, "button_apn_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mApnPref:Landroid/preference/PreferenceScreen;

    .line 648
    const-string v0, "button_prefer_2g_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredGSMOnly:Landroid/preference/CheckBoxPreference;

    .line 649
    const-string v0, "gsm_umts_preferred_network_mode_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    .line 652
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "preferred_network_mode"

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    .line 655
    .restart local v11       #settingsNetworkMode:I
    const/4 v0, 0x2

    if-le v11, v0, :cond_b

    .line 656
    const/4 v11, 0x0

    .line 657
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "preferred_network_mode"

    invoke-static {v0, v2, v11}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 661
    :cond_b
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 663
    const-string v0, "3G_SWITCH"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 664
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 665
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/phone/MobileNetworkSettings;->getBaseBand(I)I

    move-result v0

    const/4 v2, 0x2

    if-le v0, v2, :cond_c

    .line 666
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 667
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 677
    :cond_c
    :goto_4
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    iget-object v3, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    iget-object v4, p0, Lcom/android/phone/MobileNetworkSettings;->mPreference3GSwitch:Landroid/preference/Preference;

    iget-object v5, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredGSMOnly:Landroid/preference/CheckBoxPreference;

    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/phone/ext/SettingsExtension;->customizeFeatureForOperator(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;Landroid/preference/Preference;Landroid/preference/Preference;Landroid/preference/Preference;)V

    .line 680
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    if-eqz v0, :cond_d

    .line 681
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 682
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/phone/MobileNetworkSettings;->getBaseBand(I)I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_d

    .line 683
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070020

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 685
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070021

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 689
    :cond_d
    const-string v0, "button_carrier_sel_key"

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mCarrierSelPref:Landroid/preference/PreferenceScreen;

    goto/16 :goto_2

    .line 669
    :cond_e
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_4

    .line 673
    :cond_f
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 674
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_4

    .line 692
    .end local v11           #settingsNetworkMode:I
    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected phone type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 702
    .end local v10           #phoneType:I
    .restart local v9       #missingDataServiceUrl:Z
    :cond_11
    const-string v0, "NetworkSettings"

    const-string v2, "keep ltePref"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 8
    .parameter "id"

    .prologue
    const v4, 0x1080027

    const/16 v3, 0x64

    const v7, 0x1040014

    const v6, 0x1040013

    const v5, 0x1040009

    .line 881
    const/4 v0, 0x0

    .line 882
    .local v0, dialog:Landroid/app/Dialog;
    const/16 v2, 0x190

    if-ne p1, v2, :cond_1

    .line 883
    new-instance v0, Landroid/app/ProgressDialog;

    .end local v0           #dialog:Landroid/app/Dialog;
    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .restart local v0       #dialog:Landroid/app/Dialog;
    move-object v2, v0

    .line 884
    check-cast v2, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d01df

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 885
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 973
    :cond_0
    :goto_0
    return-object v0

    .line 886
    :cond_1
    if-eq p1, v3, :cond_2

    const/16 v2, 0xc8

    if-ne p1, v2, :cond_4

    .line 888
    :cond_2
    if-ne p1, v3, :cond_3

    const v1, 0x7f0d0113

    .line 891
    .local v1, message:I
    :goto_1
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1}, Lcom/android/phone/MobileNetworkSettings;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/android/phone/MobileNetworkSettings$7;

    invoke-direct {v3, p0}, Lcom/android/phone/MobileNetworkSettings$7;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    invoke-virtual {v2, v6, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/android/phone/MobileNetworkSettings$6;

    invoke-direct {v3, p0}, Lcom/android/phone/MobileNetworkSettings$6;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    invoke-virtual {v2, v5, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/android/phone/MobileNetworkSettings$5;

    invoke-direct {v3, p0}, Lcom/android/phone/MobileNetworkSettings$5;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 933
    goto :goto_0

    .line 888
    .end local v1           #message:I
    :cond_3
    const v1, 0x7f0d0114

    goto :goto_1

    .line 933
    :cond_4
    const/16 v2, 0x12c

    if-ne p1, v2, :cond_5

    .line 934
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    const v4, 0x7f0d0213

    invoke-virtual {v3, p0, v4}, Lcom/mediatek/phone/ext/SettingsExtension;->getRoamingSummary(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x1010355

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v6, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v5, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 940
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    goto :goto_0

    .line 941
    :cond_5
    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    .line 942
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, p0, Lcom/android/phone/MobileNetworkSettings;->mDataSwitchMsgIndex:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/android/phone/MobileNetworkSettings$10;

    invoke-direct {v3, p0}, Lcom/android/phone/MobileNetworkSettings$10;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    invoke-virtual {v2, v6, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/android/phone/MobileNetworkSettings$9;

    invoke-direct {v3, p0}, Lcom/android/phone/MobileNetworkSettings$9;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    invoke-virtual {v2, v5, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/android/phone/MobileNetworkSettings$8;

    invoke-direct {v3, p0}, Lcom/android/phone/MobileNetworkSettings$8;-><init>(Lcom/android/phone/MobileNetworkSettings;)V

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 986
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 987
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/phone/MobileNetworkSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 988
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->unregister()V

    .line 989
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    if-eqz v0, :cond_0

    .line 990
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    invoke-virtual {v0}, Lcom/mediatek/settings/PreCheckForRunning;->deRegister()V

    .line 992
    :cond_0
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_1

    .line 993
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 996
    :cond_1
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 347
    iget-boolean v0, p0, Lcom/android/phone/MobileNetworkSettings;->mOkClicked:Z

    if-nez v0, :cond_0

    .line 348
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 350
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 1351
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 1352
    .local v0, itemId:I
    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 1364
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->finish()V

    .line 1365
    const/4 v1, 0x1

    .line 1367
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 978
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 979
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataUsageListener:Lcom/android/phone/DataUsageListener;

    invoke-virtual {v0}, Lcom/android/phone/DataUsageListener;->pause()V

    .line 981
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings;->mGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 982
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 13
    .parameter "preference"
    .parameter "objValue"

    .prologue
    .line 1007
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    if-ne p1, v10, :cond_3

    .line 1010
    iget-object v11, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    move-object v10, p2

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v11, v10}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 1012
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1013
    .local v0, buttonNetworkMode:I
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v10}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "preferred_network_mode"

    const/4 v12, 0x0

    invoke-static {v10, v11, v12}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    .line 1016
    .local v5, settingsNetworkMode:I
    if-eq v0, v5, :cond_1

    .line 1018
    const/16 v10, 0x190

    invoke-virtual {p0, v10}, Lcom/android/phone/MobileNetworkSettings;->showDialog(I)V

    .line 1020
    packed-switch v0, :pswitch_data_0

    .line 1046
    const/4 v4, 0x0

    .line 1052
    .local v4, modemNetworkMode:I
    :goto_0
    if-nez v4, :cond_0

    const/16 v10, 0xb

    if-ne v5, v10, :cond_0

    .line 1054
    const/4 v10, 0x1

    .line 1133
    .end local v0           #buttonNetworkMode:I
    .end local v4           #modemNetworkMode:I
    .end local v5           #settingsNetworkMode:I
    :goto_1
    return v10

    .line 1022
    .restart local v0       #buttonNetworkMode:I
    .restart local v5       #settingsNetworkMode:I
    :pswitch_0
    const/4 v4, 0x7

    .line 1023
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1025
    .end local v4           #modemNetworkMode:I
    :pswitch_1
    const/4 v4, 0x6

    .line 1026
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1028
    .end local v4           #modemNetworkMode:I
    :pswitch_2
    const/4 v4, 0x5

    .line 1029
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1031
    .end local v4           #modemNetworkMode:I
    :pswitch_3
    const/4 v4, 0x4

    .line 1032
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1034
    .end local v4           #modemNetworkMode:I
    :pswitch_4
    const/4 v4, 0x3

    .line 1035
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1037
    .end local v4           #modemNetworkMode:I
    :pswitch_5
    const/4 v4, 0x2

    .line 1038
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1040
    .end local v4           #modemNetworkMode:I
    :pswitch_6
    const/4 v4, 0x1

    .line 1041
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1043
    .end local v4           #modemNetworkMode:I
    :pswitch_7
    const/4 v4, 0x0

    .line 1044
    .restart local v4       #modemNetworkMode:I
    goto :goto_0

    .line 1057
    :cond_0
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    iget-object v11, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v11}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1059
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v10}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "preferred_network_mode"

    invoke-static {v10, v11, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1063
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1064
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v11, p0, Lcom/android/phone/MobileNetworkSettings;->mHandler:Lcom/android/phone/MobileNetworkSettings$MyHandler;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Lcom/android/phone/MobileNetworkSettings$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v11

    iget v12, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    invoke-virtual {v10, v4, v11, v12}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setPreferredNetworkTypeGemini(ILandroid/os/Message;I)V

    .line 1133
    .end local v0           #buttonNetworkMode:I
    .end local v4           #modemNetworkMode:I
    .end local v5           #settingsNetworkMode:I
    :cond_1
    :goto_2
    const/4 v10, 0x1

    goto :goto_1

    .line 1067
    .restart local v0       #buttonNetworkMode:I
    .restart local v4       #modemNetworkMode:I
    .restart local v5       #settingsNetworkMode:I
    :cond_2
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v11, p0, Lcom/android/phone/MobileNetworkSettings;->mHandler:Lcom/android/phone/MobileNetworkSettings$MyHandler;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Lcom/android/phone/MobileNetworkSettings$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v11

    invoke-interface {v10, v4, v11}, Lcom/android/internal/telephony/Phone;->setPreferredNetworkType(ILandroid/os/Message;)V

    goto :goto_2

    .line 1071
    .end local v0           #buttonNetworkMode:I
    .end local v4           #modemNetworkMode:I
    .end local v5           #settingsNetworkMode:I
    .restart local p2
    :cond_3
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    if-ne p1, v10, :cond_1

    .line 1073
    check-cast p2, Ljava/lang/Long;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 1074
    .local v6, simId:J
    const-string v10, "NetworkSettings"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "under click simId="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1075
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1076
    const-wide/16 v10, 0x0

    cmp-long v10, v6, v10

    if-nez v10, :cond_4

    .line 1077
    const-wide/16 v10, 0x0

    invoke-direct {p0, v10, v11}, Lcom/android/phone/MobileNetworkSettings;->switchGprsDefautlSIM(J)V

    .line 1078
    const/4 v10, 0x1

    goto/16 :goto_1

    .line 1081
    :cond_4
    invoke-direct {p0, v6, v7}, Lcom/android/phone/MobileNetworkSettings;->getSimInfoById(J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v8

    .line 1082
    .local v8, simInfo:Landroid/provider/Telephony$SIMInfo;
    if-nez v8, :cond_5

    .line 1083
    const/4 v10, 0x0

    goto/16 :goto_1

    .line 1085
    :cond_5
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget v11, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v10, v11}, Landroid/telephony/TelephonyManager;->isNetworkRoamingGemini(I)Z

    move-result v2

    .line 1086
    .local v2, isInRoaming:Z
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/phone/MobileNetworkSettings;->mDataSwitchMsgIndex:I

    .line 1087
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "isInRoaming = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1088
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v10

    iget-object v10, v10, Lcom/android/phone/PhoneGlobals;->phoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v10}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v9

    .line 1089
    .local v9, slot3G:I
    const/4 v10, -0x1

    if-ne v9, v10, :cond_7

    const/4 v1, 0x1

    .line 1091
    .local v1, is3gOff:Z
    :goto_3
    if-eqz v2, :cond_a

    .line 1092
    iget v10, v8, Landroid/provider/Telephony$SIMInfo;->mDataRoaming:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_8

    const/4 v3, 0x1

    .line 1093
    .local v3, isRoamingDataAllowed:Z
    :goto_4
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "isRoamingDataAllowed = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1094
    if-eqz v3, :cond_9

    .line 1095
    iget v10, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-eq v10, v9, :cond_6

    .line 1117
    .end local v3           #isRoamingDataAllowed:Z
    :cond_6
    :goto_5
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "slot3G = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1118
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "simInfo.mSlot = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1120
    iget v10, p0, Lcom/android/phone/MobileNetworkSettings;->mDataSwitchMsgIndex:I

    const/4 v11, -0x1

    if-ne v10, v11, :cond_b

    .line 1121
    invoke-direct {p0, v6, v7}, Lcom/android/phone/MobileNetworkSettings;->switchGprsDefautlSIM(J)V

    goto/16 :goto_2

    .line 1089
    .end local v1           #is3gOff:Z
    :cond_7
    const/4 v1, 0x0

    goto :goto_3

    .line 1092
    .restart local v1       #is3gOff:Z
    :cond_8
    const/4 v3, 0x0

    goto :goto_4

    .line 1109
    .restart local v3       #isRoamingDataAllowed:Z
    :cond_9
    const v10, 0x7f0d0137

    iput v10, p0, Lcom/android/phone/MobileNetworkSettings;->mDataSwitchMsgIndex:I

    goto :goto_5

    .line 1113
    .end local v3           #isRoamingDataAllowed:Z
    :cond_a
    iget v10, v8, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-eq v10, v9, :cond_6

    goto :goto_5

    .line 1123
    :cond_b
    iput-wide v6, p0, Lcom/android/phone/MobileNetworkSettings;->mSelectGprsIndex:J

    .line 1124
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "mSelectGprsIndex = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-wide v11, p0, Lcom/android/phone/MobileNetworkSettings;->mSelectGprsIndex:J

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 1125
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/android/phone/MobileNetworkSettings;->removeDialog(I)V

    .line 1126
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/android/phone/MobileNetworkSettings;->showDialog(I)V

    goto/16 :goto_2

    .line 1129
    .end local v1           #is3gOff:Z
    .end local v2           #isInRoaming:Z
    .end local v8           #simInfo:Landroid/provider/Telephony$SIMInfo;
    .end local v9           #slot3G:I
    :cond_c
    invoke-direct {p0, v6, v7}, Lcom/android/phone/MobileNetworkSettings;->dealWithDataConn(J)V

    goto/16 :goto_2

    .line 1020
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

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 13
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v7, 0x0

    const/16 v12, 0x12e

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 361
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mPLMNPreference:Landroid/preference/Preference;

    if-ne p2, v10, :cond_2

    .line 362
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 363
    new-instance v2, Landroid/content/Intent;

    const-class v9, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v2, p0, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 364
    .local v2, intent:Landroid/content/Intent;
    const-string v9, "INIT_TITLE_NAME"

    const v10, 0x7f0d0120

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 365
    const-string v9, "ITEM_TYPE"

    const-string v10, "PreferenceScreen"

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 366
    const-string v9, "TARGET_CLASS"

    const-string v10, "com.mediatek.settings.PLMNListPreference"

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 367
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    iget v10, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    invoke-virtual {v9, v2, v10, v12}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    .line 512
    .end local v2           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return v8

    :cond_1
    move v8, v9

    .line 370
    goto :goto_0

    .line 372
    :cond_2
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkModeEx:Landroid/preference/Preference;

    if-ne p2, v10, :cond_4

    .line 375
    new-instance v2, Landroid/content/Intent;

    const-class v10, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v2, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 376
    .restart local v2       #intent:Landroid/content/Intent;
    const-string v10, "ITEM_TYPE"

    const-string v11, "ListPreference"

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 377
    invoke-direct {p0, v9}, Lcom/android/phone/MobileNetworkSettings;->getBaseBand(I)I

    move-result v10

    and-int/lit8 v10, v10, 0x8

    if-eqz v10, :cond_3

    .line 378
    const-string v10, "INIT_ARRAY"

    const v11, 0x7f070020

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 379
    const-string v10, "INIT_ARRAY_VALUE"

    const v11, 0x7f070021

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 384
    :goto_1
    const-string v10, "INIT_TITLE_NAME"

    const v11, 0x7f0d0200

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 385
    const-string v10, "LIST_TITLE_NAME"

    const v11, 0x7f0d00e6

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 386
    const-string v10, "INIT_FEATURE_NAME"

    const-string v11, "NETWORK_MODE"

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 388
    invoke-static {p0, v9}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 389
    .local v1, info:Landroid/provider/Telephony$SIMInfo;
    const-string v9, "INIT_SIM_ID"

    invoke-static {p0}, Lcom/mediatek/settings/CallSettings;->get3GSimCards(Landroid/app/Activity;)[J

    move-result-object v10

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 390
    const-string v9, "INIT_BASE_KEY"

    const-string v10, "preferred_network_mode_key@"

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 391
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    iget v10, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    invoke-virtual {v9, v2, v10, v12}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .line 381
    .end local v1           #info:Landroid/provider/Telephony$SIMInfo;
    :cond_3
    const-string v10, "INIT_ARRAY"

    const v11, 0x7f07001e

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 382
    const-string v10, "INIT_ARRAY_VALUE"

    const v11, 0x7f07001f

    invoke-virtual {v2, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_1

    .line 396
    .end local v2           #intent:Landroid/content/Intent;
    :cond_4
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mGsmUmtsOptions:Lcom/android/phone/GsmUmtsOptions;

    if-eqz v10, :cond_5

    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mGsmUmtsOptions:Lcom/android/phone/GsmUmtsOptions;

    invoke-virtual {v10, p2}, Lcom/android/phone/GsmUmtsOptions;->preferenceTreeClick(Landroid/preference/Preference;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 399
    :cond_5
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mCdmaOptions:Lcom/android/phone/CdmaOptions;

    if-eqz v10, :cond_6

    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mCdmaOptions:Lcom/android/phone/CdmaOptions;

    invoke-virtual {v10, p2}, Lcom/android/phone/CdmaOptions;->preferenceTreeClick(Landroid/preference/Preference;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 401
    const-string v9, "ril.cdma.inecmmode"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 404
    iput-object p2, p0, Lcom/android/phone/MobileNetworkSettings;->mClickedPreference:Landroid/preference/Preference;

    .line 407
    new-instance v9, Landroid/content/Intent;

    const-string v10, "android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS"

    invoke-direct {v9, v10, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/16 v10, 0x11

    invoke-virtual {p0, v9, v10}, Lcom/android/phone/MobileNetworkSettings;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 412
    :cond_6
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    if-ne p2, v10, :cond_7

    .line 414
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v10}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "preferred_network_mode"

    invoke-static {v10, v11, v9}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    .line 417
    .local v5, settingsNetworkMode:I
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 419
    .end local v5           #settingsNetworkMode:I
    :cond_7
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    if-ne p2, v10, :cond_9

    .line 421
    const-string v10, "onPreferenceTreeClick: preference == mButtonDataRoam."

    invoke-static {v10}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 425
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v10}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 427
    iput-boolean v9, p0, Lcom/android/phone/MobileNetworkSettings;->mOkClicked:Z

    .line 428
    const/16 v9, 0x12c

    invoke-virtual {p0, v9}, Lcom/android/phone/MobileNetworkSettings;->showDialog(I)V

    goto/16 :goto_0

    .line 430
    :cond_8
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v10, v9}, Lcom/android/internal/telephony/Phone;->setDataRoamingEnabled(Z)V

    goto/16 :goto_0

    .line 433
    :cond_9
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    if-ne p2, v10, :cond_e

    .line 435
    const-string v10, "onPreferenceTreeClick: preference == mButtonDataEnabled."

    invoke-static {v10}, Lcom/android/phone/MobileNetworkSettings;->log(Ljava/lang/String;)V

    .line 438
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    iget-object v11, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v11}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v11

    invoke-virtual {v10, v11, p0}, Lcom/mediatek/phone/ext/SettingsExtension;->dataEnableReminder(ZLandroid/preference/PreferenceActivity;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 439
    const-string v10, "NetworkSettings"

    const-string v11, "onPreferenceTreeClick: preference == mButtonDataEnabled."

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v10}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v10

    if-eqz v10, :cond_a

    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->isSimLocked()Z

    move-result v10

    if-eqz v10, :cond_a

    .line 441
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v10, v9, v12}, Lcom/mediatek/CellConnService/CellConnMgr;->handleCellConn(II)I

    .line 442
    const-string v10, "NetworkSettings"

    const-string v11, "Data enable check change request pin single card"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 443
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v10, v9}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto/16 :goto_0

    .line 445
    :cond_a
    iput-boolean v8, p0, Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z

    .line 446
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    invoke-virtual {v9}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v4

    .line 447
    .local v4, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v4, :cond_b

    invoke-virtual {v4}, Landroid/net/NetworkInfo;->getType()I

    move-result v9

    if-ne v9, v8, :cond_b

    invoke-virtual {v4}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    if-nez v9, :cond_c

    .line 449
    :cond_b
    const/16 v9, 0x190

    invoke-virtual {p0, v9}, Lcom/android/phone/MobileNetworkSettings;->showDialog(I)V

    .line 451
    :cond_c
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v10}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v10

    invoke-virtual {v9, v10}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 452
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    const/16 v11, 0x7d1

    invoke-virtual {v10, v11}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v10

    const-wide/16 v11, 0x7530

    invoke-virtual {v9, v10, v11, v12}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 453
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v9}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v9

    if-eqz v9, :cond_d

    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->isNeedtoShowRoamingMsg()Z

    move-result v9

    if-eqz v9, :cond_d

    .line 455
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    const v10, 0x7f0d011e

    invoke-virtual {v9, p0, v10}, Lcom/mediatek/phone/ext/SettingsExtension;->showWarningDlg(Landroid/content/Context;I)V

    .line 458
    :cond_d
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mExtension:Lcom/mediatek/phone/ext/SettingsExtension;

    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    iget-object v11, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v11}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v11

    invoke-virtual {v9, v10, v11}, Lcom/mediatek/phone/ext/SettingsExtension;->disableDataRoaming(Landroid/preference/CheckBoxPreference;Z)V

    goto/16 :goto_0

    .line 462
    .end local v4           #networkInfo:Landroid/net/NetworkInfo;
    :cond_e
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mLteDataServicePref:Landroid/preference/Preference;

    if-ne p2, v10, :cond_12

    .line 463
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "setup_prepaid_data_service_url"

    invoke-static {v10, v11}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 465
    .local v6, tmpl:Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_11

    .line 466
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v10}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    .line 467
    .local v0, imsi:Ljava/lang/String;
    if-nez v0, :cond_f

    .line 468
    const-string v0, ""

    .line 470
    :cond_f
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 472
    .local v7, url:Ljava/lang/String;
    :goto_2
    new-instance v2, Landroid/content/Intent;

    const-string v9, "android.intent.action.VIEW"

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v2, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 473
    .restart local v2       #intent:Landroid/content/Intent;
    invoke-virtual {p0, v2}, Lcom/android/phone/MobileNetworkSettings;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 470
    .end local v2           #intent:Landroid/content/Intent;
    .end local v7           #url:Ljava/lang/String;
    :cond_10
    new-array v10, v8, [Ljava/lang/CharSequence;

    aput-object v0, v10, v9

    invoke-static {v6, v10}, Landroid/text/TextUtils;->expandTemplate(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 475
    .end local v0           #imsi:Ljava/lang/String;
    :cond_11
    const-string v9, "NetworkSettings"

    const-string v10, "Missing SETUP_PREPAID_DATA_SERVICE_URL"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 478
    .end local v6           #tmpl:Ljava/lang/String;
    :cond_12
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mApnPref:Landroid/preference/PreferenceScreen;

    if-ne p2, v10, :cond_13

    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v10

    if-eqz v10, :cond_13

    .line 480
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 481
    .local v3, it:Landroid/content/Intent;
    const-string v9, "android.intent.action.MAIN"

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 482
    const-string v9, "com.android.phone"

    const-string v10, "com.mediatek.settings.MultipleSimActivity"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 483
    const-string v9, "simId"

    iget v10, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 484
    const-string v9, "INIT_TITLE_NAME"

    const v10, 0x7f0d01b2

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 485
    const-string v9, "ITEM_TYPE"

    const-string v10, "PreferenceScreen"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 486
    const-string v9, "TARGET_CLASS"

    const-string v10, "com.android.settings.ApnSettings"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 487
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    iget v10, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    invoke-virtual {v9, v3, v10, v12}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto/16 :goto_0

    .line 489
    .end local v3           #it:Landroid/content/Intent;
    :cond_13
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mCarrierSelPref:Landroid/preference/PreferenceScreen;

    if-ne p2, v10, :cond_14

    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v10

    if-eqz v10, :cond_14

    .line 490
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 491
    .restart local v3       #it:Landroid/content/Intent;
    const-string v9, "android.intent.action.MAIN"

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 492
    const-string v9, "com.android.phone"

    const-string v10, "com.mediatek.settings.MultipleSimActivity"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 493
    const-string v9, "INIT_TITLE_NAME"

    const v10, 0x7f0d01b6

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 494
    const-string v9, "ITEM_TYPE"

    const-string v10, "PreferenceScreen"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 495
    const-string v9, "INIT_FEATURE_NAME"

    const-string v10, "NETWORK_SEARCH"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 496
    const-string v9, "TARGET_CLASS"

    const-string v10, "com.android.phone.NetworkSetting"

    invoke-virtual {v3, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 497
    iget-object v9, p0, Lcom/android/phone/MobileNetworkSettings;->mPreCheckForRunning:Lcom/mediatek/settings/PreCheckForRunning;

    iget v10, p0, Lcom/android/phone/MobileNetworkSettings;->mSimId:I

    invoke-virtual {v9, v3, v10, v12}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto/16 :goto_0

    .line 500
    .end local v3           #it:Landroid/content/Intent;
    :cond_14
    iget-object v10, p0, Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;

    if-ne p2, v10, :cond_15

    .line 503
    const-string v9, "NetworkSettings"

    const-string v10, "mDataConnPref is clicked"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 510
    :cond_15
    invoke-virtual {p1, v9}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    move v8, v9

    .line 512
    goto/16 :goto_0
.end method

.method protected onResume()V
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v4, -0x1

    const/4 v1, 0x0

    .line 739
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 743
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_3

    :goto_0
    iput-boolean v0, p0, Lcom/android/phone/MobileNetworkSettings;->mAirplaneModeEnabled:Z

    .line 745
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Lcom/android/phone/MobileNetworkSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    .line 746
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_4

    .line 747
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataEnabled:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 755
    :goto_1
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonDataRoam:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getDataRoamingEnabled()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 757
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const-string v2, "preferred_network_mode_key"

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 758
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mHandler:Lcom/android/phone/MobileNetworkSettings$MyHandler;

    invoke-virtual {v2, v1}, Lcom/android/phone/MobileNetworkSettings$MyHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/android/internal/telephony/Phone;->getPreferredNetworkType(Landroid/os/Message;)V

    .line 761
    :cond_0
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDataUsageListener:Lcom/android/phone/DataUsageListener;

    invoke-virtual {v0}, Lcom/android/phone/DataUsageListener;->resume()V

    .line 765
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 766
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v0, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/android/phone/MobileNetworkSettings;->mDualSimMode:I

    .line 768
    const-string v0, "NetworkSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Settings.onResume(), mDualSimMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/phone/MobileNetworkSettings;->mDualSimMode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    :cond_1
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    if-eqz v0, :cond_2

    .line 773
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings;->mButtonPreferredNetworkMode:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 777
    :cond_2
    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->setDataConnPref()V

    .line 779
    invoke-direct {p0}, Lcom/android/phone/MobileNetworkSettings;->setScreenEnabled()V

    .line 782
    invoke-virtual {p0}, Lcom/android/phone/MobileNetworkSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "gprs_connection_sim_setting"

    invoke-static {v2}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/MobileNetworkSettings;->mGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2, v1, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 791
    return-void

    :cond_3
    move v0, v1

    .line 743
    goto/16 :goto_0

    .line 749
    :cond_4
    const-string v0, "NetworkSettings"

    const-string v2, "onResume, mConnService is null"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method
