.class public Lcom/mediatek/oobe/basic/wifi/WifiConfigController;
.super Ljava/lang/Object;
.source "WifiConfigController.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# static fields
.field private static final BUFFER_LENGTH:I = 0x28

.field private static final DEFAULT_WLAN_PROP:Ljava/lang/String; = "wifi-wapi"

.field private static final DHCP:I = 0x0

.field private static final EXCLUSION_PATTERN:Ljava/util/regex/Pattern; = null

.field private static final EXCLUSION_REGEXP:Ljava/lang/String; = "^$|^(\\*)*(\\.)*[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*(\\.)*(\\*)*$"

.field private static final HOSTNAME_PATTERN:Ljava/util/regex/Pattern; = null

.field private static final HOSTNAME_REGEXP:Ljava/lang/String; = "^$|^[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*$"

.field private static final IPV4_ADDRESS_LENGTH:I = 0x4

.field private static final IPV6_ADDRESS_LENGTH:I = 0x10

.field private static final KEYSTORE_SPACE:Ljava/lang/String; = "keystore://"

.field private static final MCC_SUB_BEG:I = 0x0

.field private static final MNC_SUB_BEG:I = 0x3

.field private static final MNC_SUB_END:I = 0x5

.field private static final PHASE2_PREFIX:Ljava/lang/String; = "auth="

.field public static final PROXY_NONE:I = 0x0

.field public static final PROXY_STATIC:I = 0x1

.field private static final SSID_MAX_LEN:I = 0x20

.field private static final STATIC_IP:I = 0x1

.field private static final TAG:Ljava/lang/String; = "WifiConfigController"

.field private static final WAPI:Ljava/lang/String; = "wapi"

.field private static final WIFI:Ljava/lang/String; = "wifi"

.field public static final WIFI_EAP_METHOD_AKA:I = 0x4

.field public static final WIFI_EAP_METHOD_PEAP:I = 0x0

.field public static final WIFI_EAP_METHOD_PWD:I = 0x5

.field public static final WIFI_EAP_METHOD_SIM:I = 0x3

.field public static final WIFI_EAP_METHOD_TLS:I = 0x1

.field public static final WIFI_EAP_METHOD_TTLS:I = 0x2

.field private static final WIFI_WAPI:Ljava/lang/String; = "wifi-wapi"

.field private static final WLAN_PROP_KEY:Ljava/lang/String; = "persist.sys.wlan"


# instance fields
.field private final mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

.field private mAccessPointSecurity:I

.field private final mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

.field private mDns1View:Landroid/widget/TextView;

.field private mDns2View:Landroid/widget/TextView;

.field private mEapAnonymousView:Landroid/widget/TextView;

.field private mEapCaCertSpinner:Landroid/widget/Spinner;

.field private mEapIdentityView:Landroid/widget/TextView;

.field private mEapMethodSpinner:Landroid/widget/Spinner;

.field private mEapUserCertSpinner:Landroid/widget/Spinner;

.field private mEdit:Z

.field mExt:Lcom/mediatek/oobe/ext/IWifiExt;

.field private mGatewayView:Landroid/widget/TextView;

.field private mHex:Z

.field private mIpAddressView:Landroid/widget/TextView;

.field private mIpAssignment:Landroid/net/wifi/WifiConfiguration$IpAssignment;

.field private mIpSettingsSpinner:Landroid/widget/Spinner;

.field private mLinkProperties:Landroid/net/LinkProperties;

.field private mNetworkPrefixLengthView:Landroid/widget/TextView;

.field private mPasswordView:Landroid/widget/TextView;

.field private mPhase2Spinner:Landroid/widget/Spinner;

.field private mProxyExclusionListView:Landroid/widget/TextView;

.field private mProxyHostView:Landroid/widget/TextView;

.field private mProxyPortView:Landroid/widget/TextView;

.field private mProxySettings:Landroid/net/wifi/WifiConfiguration$ProxySettings;

.field private mProxySettingsSpinner:Landroid/widget/Spinner;

.field private mSecuritySpinner:Landroid/widget/Spinner;

.field private mSimSlot:Landroid/widget/Spinner;

.field private mSsidView:Landroid/widget/TextView;

.field private mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

.field private final mTextViewChangedHandler:Landroid/os/Handler;

.field private mTm:Landroid/telephony/TelephonyManager;

.field private final mView:Landroid/view/View;

.field private mWEPKeyIndex:Landroid/widget/Spinner;

.field private mWEPKeyType:Landroid/widget/Spinner;

.field private mWapiAsCert:Landroid/widget/Spinner;

.field private mWapiClientCert:Landroid/widget/Spinner;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 224
    const-string v0, "^$|^[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->HOSTNAME_PATTERN:Ljava/util/regex/Pattern;

    .line 225
    const-string v0, "^$|^(\\*)*(\\.)*[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*(\\.)*(\\*)*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->EXCLUSION_PATTERN:Ljava/util/regex/Pattern;

    .line 226
    return-void
.end method

.method public constructor <init>(Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;Landroid/view/View;Lcom/mediatek/oobe/basic/wifi/AccessPoint;Z)V
    .locals 24
    .parameter "parent"
    .parameter "view"
    .parameter "accessPoint"
    .parameter "edit"

    .prologue
    .line 245
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 206
    sget-object v19, Landroid/net/wifi/WifiConfiguration$IpAssignment;->UNASSIGNED:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAssignment:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    .line 207
    sget-object v19, Landroid/net/wifi/WifiConfiguration$ProxySettings;->UNASSIGNED:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettings:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    .line 208
    new-instance v19, Landroid/net/LinkProperties;

    invoke-direct/range {v19 .. v19}, Landroid/net/LinkProperties;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mLinkProperties:Landroid/net/LinkProperties;

    .line 246
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    .line 249
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    .line 250
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 251
    if-nez p3, :cond_3

    const/16 v19, 0x0

    :goto_0
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    .line 252
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEdit:Z

    .line 254
    new-instance v19, Landroid/os/Handler;

    invoke-direct/range {v19 .. v19}, Landroid/os/Handler;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mTextViewChangedHandler:Landroid/os/Handler;

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v7

    .line 256
    .local v7, context:Landroid/content/Context;
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    .line 260
    .local v12, resources:Landroid/content/res/Resources;
    const-string v19, "phone"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/telephony/TelephonyManager;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mTm:Landroid/telephony/TelephonyManager;

    .line 261
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 264
    invoke-static {v7}, Lcom/mediatek/oobe/utils/Utils;->getWifiPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiExt;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b0089

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/Spinner;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b0081

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/Spinner;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    if-nez v19, :cond_8

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    const v20, 0x7f0900a9

    invoke-interface/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->setTitle(I)V

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b005b

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/TextView;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSsidView:Landroid/widget/TextView;

    .line 275
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSsidView:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSsidView:Landroid/widget/TextView;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Landroid/text/InputFilter;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    new-instance v22, Lcom/mediatek/oobe/utils/Utf8ByteLengthFilter;

    const/16 v23, 0x20

    invoke-direct/range {v22 .. v23}, Lcom/mediatek/oobe/utils/Utf8ByteLengthFilter;-><init>(I)V

    aput-object v22, v20, v21

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 279
    const v19, 0x7f0b005c

    move-object/from16 v0, p2

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 280
    .local v14, securityText:Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v14}, Lcom/mediatek/oobe/ext/IWifiExt;->setSecurityText(Landroid/widget/TextView;)V

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b005d

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/Spinner;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSecuritySpinner:Landroid/widget/Spinner;

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSecuritySpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 294
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b005a

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 299
    const v5, 0x7f060007

    .line 301
    .local v5, arrayId:I
    const-string v19, "persist.sys.wlan"

    const-string v20, "wifi-wapi"

    invoke-static/range {v19 .. v20}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 302
    .local v18, type:Ljava/lang/String;
    const-string v19, "wifi-wapi"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 303
    invoke-static {}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->isWFATestSupported()Z

    move-result v19

    if-eqz v19, :cond_4

    .line 304
    const v5, 0x7f060015

    .line 327
    :cond_0
    :goto_1
    new-instance v4, Landroid/widget/ArrayAdapter;

    const v19, 0x1090008

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v4, v7, v0, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 330
    .local v4, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v19, 0x1090009

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSecuritySpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 334
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showIpConfigFields()V

    .line 335
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showProxyFields()V

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b006a

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b006b

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    const v20, 0x7f0900c8

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->setSubmitButton(Ljava/lang/CharSequence;)V

    .line 429
    .end local v4           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v5           #arrayId:I
    .end local v14           #securityText:Landroid/widget/TextView;
    .end local v18           #type:Ljava/lang/String;
    :cond_1
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    const v20, 0x7f0900c9

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->setCancelButton(Ljava/lang/CharSequence;)V

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getSubmitButton()Landroid/widget/Button;

    move-result-object v19

    if-eqz v19, :cond_2

    .line 431
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->enableSubmitIfAppropriate()V

    .line 433
    :cond_2
    return-void

    .line 251
    .end local v7           #context:Landroid/content/Context;
    .end local v12           #resources:Landroid/content/res/Resources;
    :cond_3
    move-object/from16 v0, p3

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    move/from16 v19, v0

    goto/16 :goto_0

    .line 307
    .restart local v5       #arrayId:I
    .restart local v7       #context:Landroid/content/Context;
    .restart local v12       #resources:Landroid/content/res/Resources;
    .restart local v14       #securityText:Landroid/widget/TextView;
    .restart local v18       #type:Ljava/lang/String;
    :cond_4
    const v5, 0x7f060007

    goto/16 :goto_1

    .line 309
    :cond_5
    const-string v19, "wifi"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 310
    invoke-static {}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->isWFATestSupported()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 311
    const v5, 0x7f060017

    goto/16 :goto_1

    .line 314
    :cond_6
    const v5, 0x7f060016

    goto/16 :goto_1

    .line 316
    :cond_7
    const-string v19, "wapi"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 317
    const v5, 0x7f060018

    goto/16 :goto_1

    .line 341
    .end local v5           #arrayId:I
    .end local v14           #securityText:Landroid/widget/TextView;
    .end local v18           #type:Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-interface/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->setTitle(Ljava/lang/CharSequence;)V

    .line 343
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b0059

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/view/ViewGroup;

    .line 345
    .local v8, group:Landroid/view/ViewGroup;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v17

    .line 346
    .local v17, state:Landroid/net/NetworkInfo$DetailedState;
    if-eqz v17, :cond_9

    .line 347
    const v19, 0x7f0900b2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/mediatek/oobe/basic/wifi/Summary;->get(Landroid/content/Context;Landroid/net/NetworkInfo$DetailedState;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v8, v1, v2}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addRow(Landroid/view/ViewGroup;ILjava/lang/String;)V

    .line 350
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getLevel()I

    move-result v11

    .line 351
    .local v11, level:I
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v11, v0, :cond_a

    .line 352
    const v19, 0x7f060009

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v16

    .line 353
    .local v16, signal:[Ljava/lang/String;
    const v19, 0x7f0900b1

    aget-object v20, v16, v11

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v8, v1, v2}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addRow(Landroid/view/ViewGroup;ILjava/lang/String;)V

    .line 356
    .end local v16           #signal:[Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v10

    .line 357
    .local v10, info:Landroid/net/wifi/WifiInfo;
    if-eqz v10, :cond_b

    invoke-virtual {v10}, Landroid/net/wifi/WifiInfo;->getLinkSpeed()I

    move-result v19

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_b

    .line 358
    const v19, 0x7f0900b3

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10}, Landroid/net/wifi/WifiInfo;->getLinkSpeed()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "Mbps"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v8, v1, v2}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addRow(Landroid/view/ViewGroup;ILjava/lang/String;)V

    .line 363
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v19

    const v20, 0x7f03001c

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v8, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v13

    .line 364
    .local v13, row:Landroid/view/View;
    const v19, 0x7f0b0090

    move/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    move-object/from16 v20, v0

    const v21, 0x7f0900b0

    invoke-interface/range {v20 .. v21}, Lcom/mediatek/oobe/ext/IWifiExt;->getSecurityText(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    const v19, 0x7f0b0091

    move/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getSecurityString(Z)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 366
    invoke-virtual {v8, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 369
    const/4 v15, 0x0

    .line 370
    .local v15, showAdvancedFields:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_10

    .line 371
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v6

    .line 372
    .local v6, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v0, v6, Landroid/net/wifi/WifiConfiguration;->ipAssignment:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    move-object/from16 v19, v0

    sget-object v20, Landroid/net/wifi/WifiConfiguration$IpAssignment;->STATIC:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_d

    .line 373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Landroid/widget/Spinner;->setSelection(I)V

    .line 374
    const/4 v15, 0x1

    .line 379
    :goto_3
    iget-object v0, v6, Landroid/net/wifi/WifiConfiguration;->linkProperties:Landroid/net/LinkProperties;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/net/LinkProperties;->getAddresses()Ljava/util/Collection;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_c
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    .line 380
    .local v3, a:Ljava/net/InetAddress;
    const-string v19, "WifiConfigController"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "HostAddress : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    const-string v19, "WifiConfigController"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Address Length : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v3}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v21

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    invoke-virtual {v3}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x4

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_e

    .line 384
    const v19, 0x7f090122

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v8, v1, v2}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addRow(Landroid/view/ViewGroup;ILjava/lang/String;)V

    goto :goto_4

    .line 376
    .end local v3           #a:Ljava/net/InetAddress;
    .end local v9           #i$:Ljava/util/Iterator;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_3

    .line 385
    .restart local v3       #a:Ljava/net/InetAddress;
    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_e
    invoke-virtual {v3}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_c

    .line 386
    const v19, 0x7f090123

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v8, v1, v2}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addRow(Landroid/view/ViewGroup;ILjava/lang/String;)V

    goto/16 :goto_4

    .line 394
    .end local v3           #a:Ljava/net/InetAddress;
    :cond_f
    iget-object v0, v6, Landroid/net/wifi/WifiConfiguration;->proxySettings:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    move-object/from16 v19, v0

    sget-object v20, Landroid/net/wifi/WifiConfiguration$ProxySettings;->STATIC:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_13

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Landroid/widget/Spinner;->setSelection(I)V

    .line 396
    const/4 v15, 0x1

    .line 402
    .end local v6           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v9           #i$:Ljava/util/Iterator;
    :cond_10
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_11

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEdit:Z

    move/from16 v19, v0

    if-eqz v19, :cond_12

    .line 403
    :cond_11
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showSecurityFields()V

    .line 404
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showIpConfigFields()V

    .line 405
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showProxyFields()V

    .line 406
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b006a

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b006b

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 408
    if-eqz v15, :cond_12

    .line 409
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b006b

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/widget/CheckBox;

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 410
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b006c

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 414
    :cond_12
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEdit:Z

    move/from16 v19, v0

    if-eqz v19, :cond_14

    .line 415
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    const v20, 0x7f0900c8

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->setSubmitButton(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 398
    .restart local v6       #config:Landroid/net/wifi/WifiConfiguration;
    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_5

    .line 417
    .end local v6           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v9           #i$:Ljava/util/Iterator;
    :cond_14
    if-nez v17, :cond_15

    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v11, v0, :cond_15

    .line 418
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    const v20, 0x7f0900c6

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->setSubmitButton(Ljava/lang/CharSequence;)V

    .line 422
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    move/from16 v21, v0

    invoke-interface/range {v19 .. v21}, Lcom/mediatek/oobe/ext/IWifiExt;->shouldAddForgetButton(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 424
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    move-object/from16 v19, v0

    const v20, 0x7f0900c7

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->setForgetButton(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 420
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    move-object/from16 v19, v0

    const v20, 0x7f0b0088

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v19

    const/16 v20, 0x8

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6
.end method

.method public static addQuote(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "s"

    .prologue
    .line 480
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addRow(Landroid/view/ViewGroup;ILjava/lang/String;)V
    .locals 4
    .parameter "group"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 484
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f03001c

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 485
    .local v0, row:Landroid/view/View;
    const v1, 0x7f0b0090

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 486
    const v1, 0x7f0b0091

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 487
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 488
    return-void
.end method

.method private eapSimAkaConfig(Landroid/net/wifi/WifiConfiguration;)V
    .locals 4
    .parameter "config"

    .prologue
    .line 1367
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1369
    .local v0, strSimAka:Ljava/lang/String;
    sget v1, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 1370
    invoke-direct {p0, p1, v0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->simSlotConfig(Landroid/net/wifi/WifiConfiguration;Ljava/lang/String;)V

    .line 1371
    const-string v2, "WifiConfigController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "eap-sim, choose sim_slot"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1378
    :goto_0
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "eap-sim, config.imsi: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1379
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "eap-sim, config.simSlot: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1381
    return-void

    .line 1373
    :cond_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mTm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    .line 1374
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "config.imsi: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1375
    const-string v1, "0"

    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    .line 1376
    const-string v1, "rild"

    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/net/wifi/WifiConfiguration;->pcsc:Ljava/lang/String;

    goto :goto_0
.end method

.method private ipAndProxyFieldsAreValid()Z
    .locals 11

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 730
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mLinkProperties:Landroid/net/LinkProperties;

    invoke-virtual {v7}, Landroid/net/LinkProperties;->clear()V

    .line 731
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-ne v7, v9, :cond_0

    sget-object v7, Landroid/net/wifi/WifiConfiguration$IpAssignment;->STATIC:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    :goto_0
    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAssignment:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    .line 735
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAssignment:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    sget-object v10, Landroid/net/wifi/WifiConfiguration$IpAssignment;->STATIC:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    if-ne v7, v10, :cond_1

    .line 736
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mLinkProperties:Landroid/net/LinkProperties;

    invoke-direct {p0, v7}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->validateIpConfigFields(Landroid/net/LinkProperties;)I

    move-result v6

    .line 737
    .local v6, result:I
    if-eqz v6, :cond_1

    move v7, v8

    .line 765
    .end local v6           #result:I
    :goto_1
    return v7

    .line 731
    :cond_0
    sget-object v7, Landroid/net/wifi/WifiConfiguration$IpAssignment;->DHCP:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    goto :goto_0

    .line 742
    :cond_1
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-ne v7, v9, :cond_3

    sget-object v7, Landroid/net/wifi/WifiConfiguration$ProxySettings;->STATIC:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    :goto_2
    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettings:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    .line 746
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettings:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    sget-object v10, Landroid/net/wifi/WifiConfiguration$ProxySettings;->STATIC:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    if-ne v7, v10, :cond_2

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyHostView:Landroid/widget/TextView;

    if-eqz v7, :cond_2

    .line 747
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyHostView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 748
    .local v2, host:Ljava/lang/String;
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyPortView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 749
    .local v4, portStr:Ljava/lang/String;
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyExclusionListView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 750
    .local v1, exclusionList:Ljava/lang/String;
    const/4 v3, 0x0

    .line 751
    .local v3, port:I
    const/4 v6, 0x0

    .line 753
    .restart local v6       #result:I
    :try_start_0
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 754
    invoke-static {v2, v4, v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->validate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 758
    :goto_3
    if-nez v6, :cond_4

    .line 759
    new-instance v5, Landroid/net/ProxyProperties;

    invoke-direct {v5, v2, v3, v1}, Landroid/net/ProxyProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 760
    .local v5, proxyProperties:Landroid/net/ProxyProperties;
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mLinkProperties:Landroid/net/LinkProperties;

    invoke-virtual {v7, v5}, Landroid/net/LinkProperties;->setHttpProxy(Landroid/net/ProxyProperties;)V

    .end local v1           #exclusionList:Ljava/lang/String;
    .end local v2           #host:Ljava/lang/String;
    .end local v3           #port:I
    .end local v4           #portStr:Ljava/lang/String;
    .end local v5           #proxyProperties:Landroid/net/ProxyProperties;
    .end local v6           #result:I
    :cond_2
    move v7, v9

    .line 765
    goto :goto_1

    .line 742
    :cond_3
    sget-object v7, Landroid/net/wifi/WifiConfiguration$ProxySettings;->NONE:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    goto :goto_2

    .line 755
    .restart local v1       #exclusionList:Ljava/lang/String;
    .restart local v2       #host:Ljava/lang/String;
    .restart local v3       #port:I
    .restart local v4       #portStr:Ljava/lang/String;
    .restart local v6       #result:I
    :catch_0
    move-exception v0

    .line 756
    .local v0, e:Ljava/lang/NumberFormatException;
    const v6, 0x7f090110

    goto :goto_3

    .end local v0           #e:Ljava/lang/NumberFormatException;
    :cond_4
    move v7, v8

    .line 762
    goto :goto_1
.end method

.method private isWEPKeyValid(Ljava/lang/String;)Z
    .locals 6
    .parameter "password"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 537
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    :cond_0
    move v2, v3

    .line 554
    :cond_1
    :goto_0
    return v2

    .line 540
    :cond_2
    const/4 v1, 0x0

    .line 541
    .local v1, keyType:I
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWEPKeyType:Landroid/widget/Spinner;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWEPKeyType:Landroid/widget/Spinner;

    invoke-virtual {v4}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_3

    .line 543
    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWEPKeyType:Landroid/widget/Spinner;

    invoke-virtual {v4}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    .line 545
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 546
    .local v0, keyLength:I
    const/16 v4, 0xa

    if-eq v0, v4, :cond_4

    const/16 v4, 0x1a

    if-eq v0, v4, :cond_4

    const/16 v4, 0x20

    if-ne v0, v4, :cond_5

    :cond_4
    const-string v4, "[0-9A-Fa-f]*"

    invoke-virtual {p1, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    if-eqz v1, :cond_1

    const/4 v4, 0x2

    if-eq v1, v4, :cond_1

    .line 550
    :cond_5
    const/4 v4, 0x5

    if-eq v0, v4, :cond_6

    const/16 v4, 0xd

    if-eq v0, v4, :cond_6

    const/16 v4, 0x10

    if-ne v0, v4, :cond_7

    :cond_6
    if-eqz v1, :cond_1

    if-eq v1, v2, :cond_1

    :cond_7
    move v2, v3

    .line 554
    goto :goto_0
.end method

.method private loadCertificates(Landroid/widget/Spinner;Ljava/lang/String;)V
    .locals 8
    .parameter "spinner"
    .parameter "prefix"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1162
    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v5}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 1163
    .local v3, context:Landroid/content/Context;
    const v5, 0x7f0900c0

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1165
    .local v4, unspecified:Ljava/lang/String;
    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v5

    invoke-virtual {v5, p2}, Landroid/security/KeyStore;->saw(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 1166
    .local v2, certs:[Ljava/lang/String;
    if-eqz v2, :cond_0

    array-length v5, v2

    if-nez v5, :cond_1

    .line 1167
    :cond_0
    new-array v2, v7, [Ljava/lang/String;

    .end local v2           #certs:[Ljava/lang/String;
    aput-object v4, v2, v6

    .line 1175
    .restart local v2       #certs:[Ljava/lang/String;
    :goto_0
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v5, 0x1090008

    invoke-direct {v0, v3, v5, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 1176
    .local v0, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v5, 0x1090009

    invoke-virtual {v0, v5}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 1177
    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1178
    return-void

    .line 1169
    .end local v0           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    :cond_1
    array-length v5, v2

    add-int/lit8 v5, v5, 0x1

    new-array v1, v5, [Ljava/lang/String;

    .line 1170
    .local v1, array:[Ljava/lang/String;
    aput-object v4, v1, v6

    .line 1171
    array-length v5, v2

    invoke-static {v2, v6, v1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1172
    move-object v2, v1

    goto :goto_0
.end method

.method public static makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "imsi"
    .parameter "eapMethod"

    .prologue
    const/4 v3, 0x3

    .line 443
    if-nez p0, :cond_0

    .line 444
    const-string v1, "error"

    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 471
    :goto_0
    return-object v1

    .line 447
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 449
    .local v0, NAI:Ljava/lang/StringBuffer;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, ""

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(I)V

    .line 451
    const-string v1, "SIM"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 452
    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 458
    :cond_1
    :goto_1
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 459
    const-string v1, "@wlan.mnc"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 461
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 462
    const/4 v1, 0x5

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 463
    const-string v1, ".mcc"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 465
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 468
    const-string v1, ".3gppnetwork.org"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 469
    const-string v1, "WifiConfigController"

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 453
    :cond_2
    const-string v1, "AKA"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 454
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method static requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z
    .locals 8
    .parameter "config"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 230
    if-nez p0, :cond_1

    .line 242
    :cond_0
    :goto_0
    return v5

    .line 233
    :cond_1
    iget-object v7, p0, Landroid/net/wifi/WifiConfiguration;->key_id:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    move v5, v6

    .line 234
    goto :goto_0

    .line 236
    :cond_2
    const/4 v7, 0x2

    new-array v4, v7, [Ljava/lang/String;

    iget-object v7, p0, Landroid/net/wifi/WifiConfiguration;->ca_cert:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    iget-object v7, p0, Landroid/net/wifi/WifiConfiguration;->client_cert:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    .line 237
    .local v4, values:[Ljava/lang/String;
    move-object v0, v4

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 238
    .local v3, value:Ljava/lang/String;
    if-eqz v3, :cond_3

    const-string v7, "keystore://"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    move v5, v6

    .line 239
    goto :goto_0

    .line 237
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private setCertificate(Landroid/widget/Spinner;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "spinner"
    .parameter "prefix"
    .parameter "cert"

    .prologue
    .line 1181
    if-eqz p3, :cond_0

    invoke-virtual {p3, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1182
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setSelection(Landroid/widget/Spinner;Ljava/lang/String;)V

    .line 1184
    :cond_0
    return-void
.end method

.method private setSelection(Landroid/widget/Spinner;Ljava/lang/String;)V
    .locals 3
    .parameter "spinner"
    .parameter "value"

    .prologue
    .line 1187
    if-eqz p2, :cond_0

    .line 1189
    invoke-virtual {p1}, Landroid/widget/Spinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 1190
    .local v0, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, i:I
    :goto_0
    if-ltz v1, :cond_0

    .line 1191
    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1192
    invoke-virtual {p1, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1197
    .end local v0           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v1           #i:I
    :cond_0
    return-void

    .line 1190
    .restart local v0       #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .restart local v1       #i:I
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method private showIpConfigFields()V
    .locals 11

    .prologue
    const v10, 0x7f0b008a

    const/4 v9, 0x0

    .line 1070
    const/4 v0, 0x0

    .line 1072
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v8, 0x7f0b0088

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    .line 1074
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_0

    .line 1075
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v7}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 1078
    :cond_0
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_7

    .line 1079
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v7, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    .line 1080
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAddressView:Landroid/widget/TextView;

    if-nez v7, :cond_1

    .line 1081
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v8, 0x7f0b008b

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAddressView:Landroid/widget/TextView;

    .line 1082
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAddressView:Landroid/widget/TextView;

    invoke-virtual {v7, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1083
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v8, 0x7f0b008c

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mGatewayView:Landroid/widget/TextView;

    .line 1084
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mGatewayView:Landroid/widget/TextView;

    invoke-virtual {v7, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1085
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v8, 0x7f0b008d

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mNetworkPrefixLengthView:Landroid/widget/TextView;

    .line 1087
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mNetworkPrefixLengthView:Landroid/widget/TextView;

    invoke-virtual {v7, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1088
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v8, 0x7f0b008e

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns1View:Landroid/widget/TextView;

    .line 1089
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns1View:Landroid/widget/TextView;

    invoke-virtual {v7, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1090
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v8, 0x7f0b008f

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns2View:Landroid/widget/TextView;

    .line 1091
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns2View:Landroid/widget/TextView;

    invoke-virtual {v7, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1093
    :cond_1
    if-eqz v0, :cond_6

    .line 1094
    iget-object v5, v0, Landroid/net/wifi/WifiConfiguration;->linkProperties:Landroid/net/LinkProperties;

    .line 1095
    .local v5, linkProperties:Landroid/net/LinkProperties;
    invoke-virtual {v5}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1096
    .local v3, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Landroid/net/LinkAddress;>;"
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1097
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/LinkAddress;

    .line 1098
    .local v4, linkAddress:Landroid/net/LinkAddress;
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAddressView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1099
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mNetworkPrefixLengthView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/net/LinkAddress;->getNetworkPrefixLength()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1103
    .end local v4           #linkAddress:Landroid/net/LinkAddress;
    :cond_2
    invoke-virtual {v5}, Landroid/net/LinkProperties;->getRoutes()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/RouteInfo;

    .line 1104
    .local v6, route:Landroid/net/RouteInfo;
    invoke-virtual {v6}, Landroid/net/RouteInfo;->isDefaultRoute()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1105
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mGatewayView:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/net/RouteInfo;->getGateway()Ljava/net/InetAddress;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1110
    .end local v6           #route:Landroid/net/RouteInfo;
    :cond_4
    invoke-virtual {v5}, Landroid/net/LinkProperties;->getDnses()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1111
    .local v1, dnsIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/net/InetAddress;>;"
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 1112
    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns1View:Landroid/widget/TextView;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/net/InetAddress;

    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1114
    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1115
    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns2View:Landroid/widget/TextView;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/net/InetAddress;

    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1121
    .end local v1           #dnsIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/net/InetAddress;>;"
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Landroid/net/LinkAddress;>;"
    .end local v5           #linkProperties:Landroid/net/LinkProperties;
    :cond_6
    :goto_0
    return-void

    .line 1119
    :cond_7
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v7, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private showProxyFields()V
    .locals 9

    .prologue
    const v8, 0x7f0b0083

    const v7, 0x7f0b0082

    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 1124
    const/4 v0, 0x0

    .line 1126
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v4, 0x7f0b007f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1128
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v3, v3, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 1129
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 1132
    :cond_0
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 1133
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1134
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1135
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyHostView:Landroid/widget/TextView;

    if-nez v3, :cond_1

    .line 1136
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v4, 0x7f0b0084

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyHostView:Landroid/widget/TextView;

    .line 1137
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyHostView:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1138
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v4, 0x7f0b0085

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyPortView:Landroid/widget/TextView;

    .line 1139
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyPortView:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1140
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v4, 0x7f0b0087

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyExclusionListView:Landroid/widget/TextView;

    .line 1141
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyExclusionListView:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1143
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v4, 0x7f0b0086

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1144
    .local v2, proxyText:Landroid/widget/TextView;
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mExt:Lcom/mediatek/oobe/ext/IWifiExt;

    invoke-interface {v3, v2}, Lcom/mediatek/oobe/ext/IWifiExt;->setProxyText(Landroid/widget/TextView;)V

    .line 1147
    .end local v2           #proxyText:Landroid/widget/TextView;
    :cond_1
    if-eqz v0, :cond_2

    .line 1148
    iget-object v3, v0, Landroid/net/wifi/WifiConfiguration;->linkProperties:Landroid/net/LinkProperties;

    invoke-virtual {v3}, Landroid/net/LinkProperties;->getHttpProxy()Landroid/net/ProxyProperties;

    move-result-object v1

    .line 1149
    .local v1, proxyProperties:Landroid/net/ProxyProperties;
    if-eqz v1, :cond_2

    .line 1150
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyHostView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/net/ProxyProperties;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1151
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyPortView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/net/ProxyProperties;->getPort()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1152
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxyExclusionListView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/net/ProxyProperties;->getExclusionList()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1159
    .end local v1           #proxyProperties:Landroid/net/ProxyProperties;
    :cond_2
    :goto_0
    return-void

    .line 1156
    :cond_3
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1157
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private showSecurityFields()V
    .locals 15

    .prologue
    .line 854
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-nez v12, :cond_0

    iget v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v13, 0x5

    if-eq v12, v13, :cond_0

    .line 856
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006a

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 858
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006c

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 862
    :cond_0
    iget v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    if-nez v12, :cond_2

    .line 863
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b005e

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 865
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0066

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1067
    :cond_1
    :goto_0
    return-void

    .line 868
    :cond_2
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b005e

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 870
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0065

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 871
    iget v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v13, 0x6

    if-ne v12, v13, :cond_3

    .line 872
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0065

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 873
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0065

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/CheckBox;

    iget-boolean v13, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mHex:Z

    invoke-virtual {v12, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 878
    :cond_3
    iget v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v13, 0x1

    if-ne v12, v13, :cond_4

    .line 890
    :cond_4
    iget v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v13, 0x7

    if-ne v12, v13, :cond_5

    .line 891
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b005e

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 892
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0066

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 894
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0067

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Spinner;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    .line 895
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0068

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Spinner;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    .line 896
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    invoke-virtual {v12, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 897
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v12, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 898
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    const-string v13, "WAPIASCERT_"

    invoke-direct {p0, v12, v13}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->loadCertificates(Landroid/widget/Spinner;Ljava/lang/String;)V

    .line 899
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    const-string v13, "WAPIUSERCERT_"

    invoke-direct {p0, v12, v13}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->loadCertificates(Landroid/widget/Spinner;Ljava/lang/String;)V

    .line 901
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v12, :cond_1

    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v12, v12, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v13, -0x1

    if-eq v12, v13, :cond_1

    .line 902
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v12}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    .line 903
    .local v2, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    const-string v13, "WAPIASCERT_"

    iget-object v14, v2, Landroid/net/wifi/WifiConfiguration;->ca_cert2:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v14}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v14

    invoke-direct {p0, v12, v13, v14}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setCertificate(Landroid/widget/Spinner;Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    const-string v13, "WAPIUSERCERT_"

    iget-object v14, v2, Landroid/net/wifi/WifiConfiguration;->client_cert:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v14}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v14

    invoke-direct {p0, v12, v13, v14}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setCertificate(Landroid/widget/Spinner;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 911
    .end local v2           #config:Landroid/net/wifi/WifiConfiguration;
    :cond_5
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0066

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 915
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    if-nez v12, :cond_6

    .line 916
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0063

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    .line 917
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v12, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 918
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0064

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/CheckBox;

    invoke-virtual {v12, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 920
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0065

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/CheckBox;

    invoke-virtual {v12, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 921
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v12, :cond_6

    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v12, v12, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v13, -0x1

    if-eq v12, v13, :cond_6

    .line 922
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    const v13, 0x7f0900bf

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setHint(I)V

    .line 926
    :cond_6
    iget v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v13, 0x5

    if-eq v12, v13, :cond_7

    .line 928
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 929
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0064

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/CheckBox;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 932
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006d

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 934
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b005f

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    .line 937
    :cond_7
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006d

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 939
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b005f

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 940
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006a

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 941
    .local v1, advancedView:Landroid/view/View;
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-nez v12, :cond_8

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v12

    if-nez v12, :cond_8

    .line 942
    const-string v12, "WifiConfigController"

    const-string v13, "add network,Security is AccessPoint.SECURITY_EAP"

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 943
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006a

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 945
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006b

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 947
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006b

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/CheckBox;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 949
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006c

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 954
    :cond_8
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    if-nez v12, :cond_9

    .line 955
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006f

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Spinner;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    .line 959
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v12}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 960
    .local v3, context:Landroid/content/Context;
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v12, 0x1090008

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f06001c

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v13

    invoke-direct {v0, v3, v12, v13}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 963
    .local v0, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v12, 0x1090009

    invoke-virtual {v0, v12}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 964
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v12, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 968
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v12, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 969
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0073

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Spinner;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    .line 970
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0075

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Spinner;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    .line 971
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0077

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Spinner;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    .line 972
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0061

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapIdentityView:Landroid/widget/TextView;

    .line 973
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0079

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapAnonymousView:Landroid/widget/TextView;

    .line 975
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    const-string v13, "CACERT_"

    invoke-direct {p0, v12, v13}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->loadCertificates(Landroid/widget/Spinner;Ljava/lang/String;)V

    .line 976
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    const-string v13, "USRPKEY_"

    invoke-direct {p0, v12, v13}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->loadCertificates(Landroid/widget/Spinner;Ljava/lang/String;)V

    .line 978
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v12, :cond_9

    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v12, v12, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v13, -0x1

    if-eq v12, v13, :cond_9

    .line 979
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v12}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    .line 980
    .restart local v2       #config:Landroid/net/wifi/WifiConfiguration;
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    iget-object v13, v2, Landroid/net/wifi/WifiConfiguration;->eap:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v13}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v12, v13}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setSelection(Landroid/widget/Spinner;Ljava/lang/String;)V

    .line 982
    iget-object v12, v2, Landroid/net/wifi/WifiConfiguration;->phase2:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v12}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v5

    .line 983
    .local v5, phase2Method:Ljava/lang/String;
    if-eqz v5, :cond_b

    const-string v12, "auth="

    invoke-virtual {v5, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 984
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    const-string v13, "auth="

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {v5, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-direct {p0, v12, v13}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setSelection(Landroid/widget/Spinner;Ljava/lang/String;)V

    .line 989
    :goto_1
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    const-string v13, "keystore://CACERT_"

    iget-object v14, v2, Landroid/net/wifi/WifiConfiguration;->ca_cert:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v14}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v14

    invoke-direct {p0, v12, v13, v14}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setCertificate(Landroid/widget/Spinner;Ljava/lang/String;Ljava/lang/String;)V

    .line 991
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    const-string v13, "USRPKEY_"

    iget-object v14, v2, Landroid/net/wifi/WifiConfiguration;->key_id:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v14}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v14

    invoke-direct {p0, v12, v13, v14}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setCertificate(Landroid/widget/Spinner;Ljava/lang/String;Ljava/lang/String;)V

    .line 993
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapIdentityView:Landroid/widget/TextView;

    iget-object v13, v2, Landroid/net/wifi/WifiConfiguration;->identity:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v13}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 994
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapAnonymousView:Landroid/widget/TextView;

    iget-object v13, v2, Landroid/net/wifi/WifiConfiguration;->anonymous_identity:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    invoke-virtual {v13}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->value()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 998
    .end local v0           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v2           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v3           #context:Landroid/content/Context;
    .end local v5           #phase2Method:Ljava/lang/String;
    :cond_9
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b006e

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 999
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0060

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1001
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v12}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v12

    const/4 v13, 0x3

    if-lt v12, v13, :cond_c

    .line 1002
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0072

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1003
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0074

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1004
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0076

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1005
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0078

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1013
    :goto_2
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v12}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v12

    const/4 v13, 0x3

    if-eq v12, v13, :cond_a

    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v12}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v12

    const/4 v13, 0x4

    if-ne v12, v13, :cond_f

    .line 1015
    :cond_a
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapIdentityView:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 1016
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 1017
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0064

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/CheckBox;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 1020
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0070

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1022
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0071

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/Spinner;

    iput-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    .line 1024
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v12}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 1025
    .restart local v3       #context:Landroid/content/Context;
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f060019

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v11

    .line 1026
    .local v11, tempSimAkaMethods:[Ljava/lang/String;
    sget v12, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    add-int/lit8 v10, v12, 0x1

    .line 1027
    .local v10, sum:I
    const-string v12, "WifiConfigController"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "the num of sim slot is :"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    add-int/lit8 v14, v10, -0x1

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1028
    new-array v6, v10, [Ljava/lang/String;

    .line 1029
    .local v6, simAkaMethods:[Ljava/lang/String;
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f0900f5

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1030
    .local v7, simSlotText:Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_3
    if-ge v4, v10, :cond_e

    .line 1031
    array-length v12, v11

    if-ge v4, v12, :cond_d

    .line 1032
    aget-object v12, v11, v4

    aput-object v12, v6, v4

    .line 1030
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 986
    .end local v4           #i:I
    .end local v6           #simAkaMethods:[Ljava/lang/String;
    .end local v7           #simSlotText:Ljava/lang/String;
    .end local v10           #sum:I
    .end local v11           #tempSimAkaMethods:[Ljava/lang/String;
    .restart local v0       #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .restart local v2       #config:Landroid/net/wifi/WifiConfiguration;
    .restart local v5       #phase2Method:Ljava/lang/String;
    :cond_b
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    invoke-direct {p0, v12, v5}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->setSelection(Landroid/widget/Spinner;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1007
    .end local v0           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v2           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v3           #context:Landroid/content/Context;
    .end local v5           #phase2Method:Ljava/lang/String;
    :cond_c
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0072

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1008
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0074

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1009
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0076

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 1010
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0078

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    .line 1034
    .restart local v3       #context:Landroid/content/Context;
    .restart local v4       #i:I
    .restart local v6       #simAkaMethods:[Ljava/lang/String;
    .restart local v7       #simSlotText:Ljava/lang/String;
    .restart local v10       #sum:I
    .restart local v11       #tempSimAkaMethods:[Ljava/lang/String;
    :cond_d
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v6, v4

    goto :goto_4

    .line 1037
    :cond_e
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v12, 0x1090008

    invoke-direct {v0, v3, v12, v6}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 1039
    .restart local v0       #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v12, 0x1090009

    invoke-virtual {v0, v12}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 1040
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    invoke-virtual {v12, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1043
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v12, :cond_1

    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v12, v12, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v13, -0x1

    if-eq v12, v13, :cond_1

    .line 1045
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    invoke-virtual {v12}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    .line 1046
    .restart local v2       #config:Landroid/net/wifi/WifiConfiguration;
    if-eqz v2, :cond_1

    iget-object v12, v2, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    if-eqz v12, :cond_1

    .line 1047
    iget-object v12, v2, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    const-string v13, "\""

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 1048
    .local v8, simslots:[Ljava/lang/String;
    array-length v12, v8

    const/4 v13, 0x1

    if-le v12, v13, :cond_1

    .line 1049
    const/4 v12, 0x1

    aget-object v12, v8, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 1050
    .local v9, slot:I
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    invoke-virtual {v12, v9}, Landroid/widget/Spinner;->setSelection(I)V

    goto/16 :goto_0

    .line 1057
    .end local v0           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v2           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v3           #context:Landroid/content/Context;
    .end local v4           #i:I
    .end local v6           #simAkaMethods:[Ljava/lang/String;
    .end local v7           #simSlotText:Ljava/lang/String;
    .end local v8           #simslots:[Ljava/lang/String;
    .end local v9           #slot:I
    .end local v10           #sum:I
    .end local v11           #tempSimAkaMethods:[Ljava/lang/String;
    :cond_f
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapIdentityView:Landroid/widget/TextView;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 1058
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 1059
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0064

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/CheckBox;

    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 1062
    iget-object v12, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    const v13, 0x7f0b0070

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    const/16 v13, 0x8

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0
.end method

.method private simSlotConfig(Landroid/net/wifi/WifiConfiguration;Ljava/lang/String;)V
    .locals 5
    .parameter "config"
    .parameter "strSimAka"

    .prologue
    .line 1387
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 1388
    .local v0, simSlot:I
    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    .line 1389
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mTm:Landroid/telephony/TelephonyManager;

    invoke-virtual {v1, v0}, Landroid/telephony/TelephonyManager;->getSubscriberIdGemini(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->makeNAI(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    .line 1390
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "config.imsi: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1391
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    .line 1392
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "config.simSlot "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1393
    const-string v1, "rild"

    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/net/wifi/WifiConfiguration;->pcsc:Ljava/lang/String;

    .line 1394
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "config.pcsc: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "rild"

    invoke-static {v3}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1396
    :cond_0
    return-void
.end method

.method public static validate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11
    .parameter "hostname"
    .parameter "port"
    .parameter "exclList"

    .prologue
    const v9, 0x7f090110

    .line 1328
    sget-object v10, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->HOSTNAME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v10, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 1329
    .local v7, match:Ljava/util/regex/Matcher;
    const-string v10, ","

    invoke-virtual {p2, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 1331
    .local v3, exclListArray:[Ljava/lang/String;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v10

    if-nez v10, :cond_1

    .line 1332
    const v9, 0x7f09010c

    .line 1360
    :cond_0
    :goto_0
    return v9

    .line 1335
    :cond_1
    move-object v0, v3

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_1
    if-ge v4, v5, :cond_3

    aget-object v2, v0, v4

    .line 1336
    .local v2, excl:Ljava/lang/String;
    sget-object v10, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->EXCLUSION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v10, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 1337
    .local v6, m:Ljava/util/regex/Matcher;
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v10

    if-nez v10, :cond_2

    .line 1338
    const v9, 0x7f09010d

    goto :goto_0

    .line 1335
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1342
    .end local v2           #excl:Ljava/lang/String;
    .end local v6           #m:Ljava/util/regex/Matcher;
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_4

    .line 1343
    const v9, 0x7f09010e

    goto :goto_0

    .line 1346
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_6

    .line 1347
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_5

    .line 1348
    const v9, 0x7f09010f

    goto :goto_0

    .line 1350
    :cond_5
    const/4 v8, -0x1

    .line 1352
    .local v8, portVal:I
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 1356
    if-lez v8, :cond_0

    const v10, 0xffff

    if-gt v8, v10, :cond_0

    .line 1360
    .end local v8           #portVal:I
    :cond_6
    const/4 v9, 0x0

    goto :goto_0

    .line 1353
    .restart local v8       #portVal:I
    :catch_0
    move-exception v1

    .line 1354
    .local v1, ex:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method private validateIpConfigFields(Landroid/net/LinkProperties;)I
    .locals 16
    .parameter "linkProperties"

    .prologue
    .line 769
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAddressView:Landroid/widget/TextView;

    if-nez v13, :cond_0

    .line 770
    const/4 v13, 0x0

    .line 844
    :goto_0
    return v13

    .line 772
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAddressView:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 773
    .local v9, ipAddr:Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 774
    const v13, 0x7f0900cf

    goto :goto_0

    .line 777
    :cond_1
    const/4 v8, 0x0

    .line 779
    .local v8, inetAddr:Ljava/net/InetAddress;
    :try_start_0
    invoke-static {v9}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 784
    const/4 v11, -0x1

    .line 786
    .local v11, networkPrefixLength:I
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mNetworkPrefixLengthView:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 787
    if-ltz v11, :cond_2

    const/16 v13, 0x20

    if-le v11, v13, :cond_3

    .line 788
    :cond_2
    const v13, 0x7f0900d2

    goto :goto_0

    .line 780
    .end local v11           #networkPrefixLength:I
    :catch_0
    move-exception v4

    .line 781
    .local v4, e:Ljava/lang/IllegalArgumentException;
    const v13, 0x7f0900cf

    goto :goto_0

    .line 790
    .end local v4           #e:Ljava/lang/IllegalArgumentException;
    .restart local v11       #networkPrefixLength:I
    :cond_3
    new-instance v13, Landroid/net/LinkAddress;

    invoke-direct {v13, v8, v11}, Landroid/net/LinkAddress;-><init>(Ljava/net/InetAddress;I)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/net/LinkProperties;->addLinkAddress(Landroid/net/LinkAddress;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 797
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mGatewayView:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 798
    .local v6, gateway:Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 801
    :try_start_2
    invoke-static {v8, v11}, Landroid/net/NetworkUtils;->getNetworkPart(Ljava/net/InetAddress;I)Ljava/net/InetAddress;

    move-result-object v10

    .line 802
    .local v10, netPart:Ljava/net/InetAddress;
    invoke-virtual {v10}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v1

    .line 803
    .local v1, addr:[B
    array-length v13, v1

    add-int/lit8 v13, v13, -0x1

    const/4 v14, 0x1

    aput-byte v14, v1, v13

    .line 804
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mGatewayView:Landroid/widget/TextView;

    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v14

    invoke-virtual {v14}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_3

    .line 820
    .end local v1           #addr:[B
    .end local v10           #netPart:Ljava/net/InetAddress;
    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns1View:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 821
    .local v2, dns:Ljava/lang/String;
    const/4 v3, 0x0

    .line 823
    .local v3, dnsAddr:Ljava/net/InetAddress;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 825
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns1View:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v14}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v14

    const v15, 0x7f0900d4

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 835
    :goto_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns2View:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->length()I

    move-result v13

    if-lez v13, :cond_4

    .line 836
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mDns2View:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 838
    :try_start_3
    invoke-static {v2}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_6

    move-result-object v3

    .line 842
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/net/LinkProperties;->addDns(Ljava/net/InetAddress;)V

    .line 844
    :cond_4
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 791
    .end local v2           #dns:Ljava/lang/String;
    .end local v3           #dnsAddr:Ljava/net/InetAddress;
    .end local v6           #gateway:Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 793
    .local v4, e:Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mNetworkPrefixLengthView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v14}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v14

    const v15, 0x7f0900da

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 805
    .end local v4           #e:Ljava/lang/NumberFormatException;
    .restart local v6       #gateway:Ljava/lang/String;
    :catch_2
    move-exception v5

    .line 806
    .local v5, ee:Ljava/lang/RuntimeException;
    invoke-virtual {v5}, Ljava/lang/RuntimeException;->printStackTrace()V

    goto :goto_2

    .line 807
    .end local v5           #ee:Ljava/lang/RuntimeException;
    :catch_3
    move-exception v12

    .line 808
    .local v12, u:Ljava/net/UnknownHostException;
    invoke-virtual {v12}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_2

    .line 811
    .end local v12           #u:Ljava/net/UnknownHostException;
    :cond_5
    const/4 v7, 0x0

    .line 813
    .local v7, gatewayAddr:Ljava/net/InetAddress;
    :try_start_4
    invoke-static {v6}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_4

    move-result-object v7

    .line 817
    new-instance v13, Landroid/net/RouteInfo;

    invoke-direct {v13, v7}, Landroid/net/RouteInfo;-><init>(Ljava/net/InetAddress;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)V

    goto :goto_2

    .line 814
    :catch_4
    move-exception v4

    .line 815
    .local v4, e:Ljava/lang/IllegalArgumentException;
    const v13, 0x7f0900d0

    goto/16 :goto_0

    .line 828
    .end local v4           #e:Ljava/lang/IllegalArgumentException;
    .end local v7           #gatewayAddr:Ljava/net/InetAddress;
    .restart local v2       #dns:Ljava/lang/String;
    .restart local v3       #dnsAddr:Ljava/net/InetAddress;
    :cond_6
    :try_start_5
    invoke-static {v2}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_5

    move-result-object v3

    .line 832
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/net/LinkProperties;->addDns(Ljava/net/InetAddress;)V

    goto :goto_3

    .line 829
    :catch_5
    move-exception v4

    .line 830
    .restart local v4       #e:Ljava/lang/IllegalArgumentException;
    const v13, 0x7f0900d1

    goto/16 :goto_0

    .line 839
    .end local v4           #e:Ljava/lang/IllegalArgumentException;
    :catch_6
    move-exception v4

    .line 840
    .restart local v4       #e:Ljava/lang/IllegalArgumentException;
    const v13, 0x7f0900d1

    goto/16 :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 1205
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mTextViewChangedHandler:Landroid/os/Handler;

    new-instance v1, Lcom/mediatek/oobe/basic/wifi/WifiConfigController$1;

    invoke-direct {v1, p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController$1;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiConfigController;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1211
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 1216
    return-void
.end method

.method public closeSpinnerDialog()V
    .locals 1

    .prologue
    .line 1299
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSecuritySpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSecuritySpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1300
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSecuritySpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    .line 1325
    :cond_0
    :goto_0
    return-void

    .line 1301
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1303
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto :goto_0

    .line 1304
    :cond_2
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1306
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto :goto_0

    .line 1307
    :cond_3
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1308
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto :goto_0

    .line 1309
    :cond_4
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1311
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto :goto_0

    .line 1312
    :cond_5
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1314
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto :goto_0

    .line 1315
    :cond_6
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1317
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto :goto_0

    .line 1318
    :cond_7
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1319
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSimSlot:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto :goto_0

    .line 1320
    :cond_8
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1321
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto/16 :goto_0

    .line 1322
    :cond_9
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1323
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->dismissPopup()V

    goto/16 :goto_0
.end method

.method enableSubmitIfAppropriate()V
    .locals 6

    .prologue
    const/16 v5, 0x8

    .line 492
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v3}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getSubmitButton()Landroid/widget/Button;

    move-result-object v2

    .line 493
    .local v2, submit:Landroid/widget/Button;
    if-nez v2, :cond_0

    .line 528
    :goto_0
    return-void

    .line 497
    :cond_0
    const/4 v0, 0x0

    .line 498
    .local v0, enabled:Z
    const/4 v1, 0x0

    .line 500
    .local v1, passwordInvalid:Z
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    if-eqz v3, :cond_5

    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->isWEPKeyValid(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_1
    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_2

    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v4, 0x3

    if-eq v3, v4, :cond_2

    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_3

    :cond_2
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->length()I

    move-result v3

    if-lt v3, v5, :cond_4

    :cond_3
    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v4, 0x6

    if-ne v3, v4, :cond_5

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->length()I

    move-result v3

    if-lt v3, v5, :cond_4

    const/16 v3, 0x40

    iget-object v4, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->length()I

    move-result v4

    if-lt v3, v4, :cond_4

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mHex:Z

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "[0-9A-Fa-f]*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 508
    :cond_4
    const/4 v1, 0x1

    .line 511
    :cond_5
    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v4, 0x7

    if-ne v3, v4, :cond_8

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v3

    if-eqz v3, :cond_7

    :cond_6
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v3

    if-nez v3, :cond_8

    .line 514
    :cond_7
    const/4 v1, 0x1

    .line 517
    :cond_8
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSsidView:Landroid/widget/TextView;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSsidView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->length()I

    move-result v3

    if-eqz v3, :cond_b

    :cond_9
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v3, :cond_a

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v3, v3, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_c

    :cond_a
    if-eqz v1, :cond_c

    .line 519
    :cond_b
    const/4 v0, 0x0

    .line 527
    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 521
    :cond_c
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->ipAndProxyFieldsAreValid()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 522
    const/4 v0, 0x1

    goto :goto_1

    .line 524
    :cond_d
    const/4 v0, 0x0

    goto :goto_1
.end method

.method getConfig()Landroid/net/wifi/WifiConfiguration;
    .locals 12

    .prologue
    const/4 v11, 0x2

    const/4 v9, -0x1

    const/4 v3, 0x1

    const/4 v8, 0x0

    const/16 v10, 0x22

    .line 559
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mConfigUi:Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;

    invoke-interface {v7}, Lcom/mediatek/oobe/basic/wifi/WifiConfigUiBase;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 560
    .local v1, context:Landroid/content/Context;
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    if-eq v7, v9, :cond_0

    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEdit:Z

    if-nez v7, :cond_0

    .line 561
    const/4 v0, 0x0

    .line 726
    :goto_0
    return-object v0

    .line 564
    :cond_0
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 568
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    const-string v7, "none"

    invoke-static {v7}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->imsi:Ljava/lang/String;

    .line 569
    const-string v7, "-1"

    invoke-static {v7}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->simSlot:Ljava/lang/String;

    .line 570
    const-string v7, "none"

    invoke-static {v7}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->addQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->pcsc:Ljava/lang/String;

    .line 574
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-nez v7, :cond_1

    .line 575
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSsidView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 578
    iput-boolean v3, v0, Landroid/net/wifi/WifiConfiguration;->hiddenSSID:Z

    .line 587
    :goto_1
    iget v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    packed-switch v7, :pswitch_data_0

    .line 719
    const/4 v0, 0x0

    goto :goto_0

    .line 579
    :cond_1
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    if-ne v7, v9, :cond_2

    .line 580
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-static {v7}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 582
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget-object v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mBssid:Ljava/lang/String;

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->BSSID:Ljava/lang/String;

    goto :goto_1

    .line 584
    :cond_2
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPoint:Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    iget v7, v7, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    iput v7, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    goto :goto_1

    .line 589
    :pswitch_0
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v7, v8}, Ljava/util/BitSet;->set(I)V

    .line 722
    :cond_3
    :goto_2
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettings:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->proxySettings:Landroid/net/wifi/WifiConfiguration$ProxySettings;

    .line 723
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpAssignment:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->ipAssignment:Landroid/net/wifi/WifiConfiguration$IpAssignment;

    .line 724
    new-instance v7, Landroid/net/LinkProperties;

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mLinkProperties:Landroid/net/LinkProperties;

    invoke-direct {v7, v8}, Landroid/net/LinkProperties;-><init>(Landroid/net/LinkProperties;)V

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->linkProperties:Landroid/net/LinkProperties;

    goto :goto_0

    .line 593
    :pswitch_1
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v7, v8}, Ljava/util/BitSet;->set(I)V

    .line 594
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v7, v8}, Ljava/util/BitSet;->set(I)V

    .line 595
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v7, v3}, Ljava/util/BitSet;->set(I)V

    .line 596
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->length()I

    move-result v7

    if-eqz v7, :cond_3

    .line 597
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->length()I

    move-result v5

    .line 598
    .local v5, length:I
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 600
    .local v6, password:Ljava/lang/String;
    const/4 v4, 0x0

    .line 601
    .local v4, keyIndex:I
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWEPKeyIndex:Landroid/widget/Spinner;

    if-eqz v7, :cond_4

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWEPKeyIndex:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-eq v7, v9, :cond_4

    .line 603
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWEPKeyIndex:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v4

    .line 607
    :cond_4
    const/16 v7, 0xa

    if-eq v5, v7, :cond_5

    const/16 v7, 0x1a

    if-eq v5, v7, :cond_5

    const/16 v7, 0x20

    if-ne v5, v7, :cond_6

    :cond_5
    const-string v7, "[0-9A-Fa-f]*"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 610
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    aput-object v6, v7, v4

    .line 616
    :goto_3
    iput v4, v0, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    goto :goto_2

    .line 613
    :cond_6
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    goto :goto_3

    .line 622
    .end local v4           #keyIndex:I
    .end local v5           #length:I
    .end local v6           #password:Ljava/lang/String;
    :pswitch_2
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v7, v3}, Ljava/util/BitSet;->set(I)V

    .line 623
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->length()I

    move-result v7

    if-eqz v7, :cond_3

    .line 624
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 625
    .restart local v6       #password:Ljava/lang/String;
    const-string v7, "[0-9A-Fa-f]{64}"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 626
    iput-object v6, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_2

    .line 628
    :cond_7
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_2

    .line 634
    .end local v6           #password:Ljava/lang/String;
    :pswitch_3
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v7, v11}, Ljava/util/BitSet;->set(I)V

    .line 635
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v9, 0x3

    invoke-virtual {v7, v9}, Ljava/util/BitSet;->set(I)V

    .line 636
    iget-object v9, v0, Landroid/net/wifi/WifiConfiguration;->eap:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v9, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 638
    const-string v9, "AKA"

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_12

    const-string v9, "SIM"

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_12

    .line 641
    iget-object v9, v0, Landroid/net/wifi/WifiConfiguration;->phase2:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-nez v7, :cond_9

    const-string v7, ""

    :goto_4
    invoke-virtual {v9, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 644
    iget-object v9, v0, Landroid/net/wifi/WifiConfiguration;->ca_cert:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-nez v7, :cond_a

    const-string v7, ""

    :goto_5
    invoke-virtual {v9, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 648
    iget-object v9, v0, Landroid/net/wifi/WifiConfiguration;->client_cert:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-nez v7, :cond_b

    const-string v7, ""

    :goto_6
    invoke-virtual {v9, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 652
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-nez v7, :cond_c

    .line 654
    .local v3, isEmptyKeyId:Z
    :goto_7
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->key_id:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    if-eqz v3, :cond_d

    const-string v7, ""

    :goto_8
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 658
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->engine:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    if-eqz v3, :cond_e

    const-string v7, "0"

    :goto_9
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 661
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->engine_id:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    if-eqz v3, :cond_f

    const-string v7, ""

    :goto_a
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 663
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->identity:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapIdentityView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->length()I

    move-result v7

    if-nez v7, :cond_10

    const-string v7, ""

    :goto_b
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 665
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->anonymous_identity:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapAnonymousView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->length()I

    move-result v7

    if-nez v7, :cond_11

    const-string v7, ""

    :goto_c
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 668
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->length()I

    move-result v7

    if-eqz v7, :cond_8

    .line 669
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->password:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v8, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v8}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 675
    .end local v3           #isEmptyKeyId:Z
    :cond_8
    :goto_d
    const-string v7, "WifiConfigController"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "eap-sim/aka, config.toString(): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Landroid/net/wifi/WifiConfiguration;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 641
    :cond_9
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "auth="

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v10, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPhase2Spinner:Landroid/widget/Spinner;

    invoke-virtual {v10}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_4

    .line 644
    :cond_a
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "keystore://CACERT_"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapCaCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_5

    .line 648
    :cond_b
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "keystore://USRCERT_"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_6

    :cond_c
    move v3, v8

    .line 652
    goto/16 :goto_7

    .line 654
    .restart local v3       #isEmptyKeyId:Z
    :cond_d
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "USRPKEY_"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapUserCertSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_8

    .line 658
    :cond_e
    const-string v7, "1"

    goto/16 :goto_9

    .line 661
    :cond_f
    const-string v7, "keystore"

    goto/16 :goto_a

    .line 663
    :cond_10
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapIdentityView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_b

    .line 665
    :cond_11
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapAnonymousView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_c

    .line 673
    .end local v3           #isEmptyKeyId:Z
    :cond_12
    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->eapSimAkaConfig(Landroid/net/wifi/WifiConfiguration;)V

    goto/16 :goto_d

    .line 679
    :pswitch_4
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v8, 0x5

    invoke-virtual {v7, v8}, Ljava/util/BitSet;->set(I)V

    .line 680
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v7, v11}, Ljava/util/BitSet;->set(I)V

    .line 681
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    const/4 v8, 0x3

    invoke-virtual {v7, v8}, Ljava/util/BitSet;->set(I)V

    .line 682
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v8, 0x4

    invoke-virtual {v7, v8}, Ljava/util/BitSet;->set(I)V

    .line 683
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->length()I

    move-result v7

    if-eqz v7, :cond_3

    .line 684
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 685
    .restart local v6       #password:Ljava/lang/String;
    const-string v7, "WifiConfigController"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getConfig(), mHex="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mHex:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mHex:Z

    if-eqz v7, :cond_13

    .line 687
    iput-object v6, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_2

    .line 689
    :cond_13
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_2

    .line 695
    .end local v6           #password:Ljava/lang/String;
    :pswitch_5
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v9, 0x6

    invoke-virtual {v7, v9}, Ljava/util/BitSet;->set(I)V

    .line 696
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v7, v11}, Ljava/util/BitSet;->set(I)V

    .line 697
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    const/4 v9, 0x3

    invoke-virtual {v7, v9}, Ljava/util/BitSet;->set(I)V

    .line 698
    iget-object v7, v0, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    const/4 v9, 0x4

    invoke-virtual {v7, v9}, Ljava/util/BitSet;->set(I)V

    .line 699
    iget-object v9, v0, Landroid/net/wifi/WifiConfiguration;->ca_cert2:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-nez v7, :cond_14

    const-string v7, ""

    :goto_e
    invoke-virtual {v9, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 703
    iget-object v9, v0, Landroid/net/wifi/WifiConfiguration;->client_cert:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-nez v7, :cond_15

    const-string v7, ""

    :goto_f
    invoke-virtual {v9, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 707
    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v7

    if-nez v7, :cond_16

    move v2, v3

    .line 708
    .local v2, isEmptyCert:Z
    :goto_10
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->key_id:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    if-eqz v2, :cond_17

    const-string v7, ""

    :goto_11
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 711
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->engine:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    if-eqz v2, :cond_18

    const-string v7, "0"

    :goto_12
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    .line 714
    iget-object v8, v0, Landroid/net/wifi/WifiConfiguration;->engine_id:Landroid/net/wifi/WifiConfiguration$EnterpriseField;

    if-eqz v2, :cond_19

    const-string v7, ""

    :goto_13
    invoke-virtual {v8, v7}, Landroid/net/wifi/WifiConfiguration$EnterpriseField;->setValue(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 699
    .end local v2           #isEmptyCert:Z
    :cond_14
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "keystore://WAPIASCERT_"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiAsCert:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_e

    .line 703
    :cond_15
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "keystore://WAPIUSERCERT_"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_f

    :cond_16
    move v2, v8

    .line 707
    goto :goto_10

    .line 708
    .restart local v2       #isEmptyCert:Z
    :cond_17
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "keystore://WAPIUSERCERT_"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v7, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mWapiClientCert:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_11

    .line 711
    :cond_18
    const-string v7, "1"

    goto :goto_12

    .line 714
    :cond_19
    const-string v7, "keystore"

    goto :goto_13

    .line 587
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public isEdit()Z
    .locals 1

    .prologue
    .line 1200
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEdit:Z

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    const v3, 0x7f0b006c

    .line 1225
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0b0064

    if-ne v1, v2, :cond_2

    .line 1226
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v0

    .line 1227
    .local v0, pos:I
    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    check-cast p1, Landroid/widget/CheckBox;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x90

    :goto_0
    or-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 1231
    if-ltz v0, :cond_0

    .line 1232
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mPasswordView:Landroid/widget/TextView;

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 1251
    .end local v0           #pos:I
    :cond_0
    :goto_1
    return-void

    .line 1227
    .restart local v0       #pos:I
    :cond_1
    const/16 v1, 0x80

    goto :goto_0

    .line 1234
    .end local v0           #pos:I
    .restart local p1
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0b006b

    if-ne v1, v2, :cond_4

    .line 1235
    check-cast p1, Landroid/widget/CheckBox;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1236
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 1238
    :cond_3
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 1240
    .restart local p1
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0b0065

    if-ne v1, v2, :cond_5

    .line 1242
    check-cast p1, Landroid/widget/CheckBox;

    .end local p1
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mHex:Z

    .line 1243
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->enableSubmitIfAppropriate()V

    .line 1244
    const-string v1, "WifiConfigController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClick mHex is="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mHex:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",enableSubmitIfAppropriate"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1247
    .restart local p1
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0b007e

    if-ne v1, v2, :cond_0

    .line 1249
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->enableSubmitIfAppropriate()V

    goto :goto_1
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 1255
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mSecuritySpinner:Landroid/widget/Spinner;

    if-ne p1, v0, :cond_4

    .line 1256
    iput p3, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    .line 1258
    const-string v0, "persist.sys.wlan"

    const-string v1, "wifi-wapi"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "wapi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1265
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    if-lez v0, :cond_0

    .line 1266
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    add-int/lit8 v0, v0, 0x5

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    .line 1279
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showSecurityFields()V

    .line 1287
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->enableSubmitIfAppropriate()V

    .line 1288
    return-void

    .line 1269
    :cond_2
    invoke-static {}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->isWFATestSupported()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1270
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    .line 1271
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    goto :goto_0

    .line 1274
    :cond_3
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 1275
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mAccessPointSecurity:I

    goto :goto_0

    .line 1280
    :cond_4
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mEapMethodSpinner:Landroid/widget/Spinner;

    if-ne p1, v0, :cond_5

    .line 1281
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showSecurityFields()V

    goto :goto_1

    .line 1282
    :cond_5
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mProxySettingsSpinner:Landroid/widget/Spinner;

    if-ne p1, v0, :cond_6

    .line 1283
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showProxyFields()V

    goto :goto_1

    .line 1284
    :cond_6
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->mIpSettingsSpinner:Landroid/widget/Spinner;

    if-ne p1, v0, :cond_1

    .line 1285
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->showIpConfigFields()V

    goto :goto_1
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1293
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 1221
    return-void
.end method
