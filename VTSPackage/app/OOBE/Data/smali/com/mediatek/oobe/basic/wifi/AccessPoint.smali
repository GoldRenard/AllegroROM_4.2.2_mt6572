.class Lcom/mediatek/oobe/basic/wifi/AccessPoint;
.super Landroid/preference/Preference;
.source "AccessPoint.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/oobe/basic/wifi/AccessPoint$1;,
        Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;
    }
.end annotation


# static fields
.field private static final KEY_CONFIG:Ljava/lang/String; = "key_config"

.field private static final KEY_DETAILEDSTATE:Ljava/lang/String; = "key_detailedstate"

.field private static final KEY_PROP_WFA_TEST_SUPPORT:Ljava/lang/String; = "persist.radio.wifi.wpa2wpaalone"

.field private static final KEY_PROP_WFA_TEST_VALUE:Ljava/lang/String; = "true"

.field private static final KEY_SCANRESULT:Ljava/lang/String; = "key_scanresult"

.field private static final KEY_WIFIINFO:Ljava/lang/String; = "key_wifiinfo"

.field static final SECURITY_EAP:I = 0x5

.field static final SECURITY_NONE:I = 0x0

.field static final SECURITY_PSK:I = 0x2

.field static final SECURITY_WAPI_CERT:I = 0x7

.field static final SECURITY_WAPI_PSK:I = 0x6

.field static final SECURITY_WEP:I = 0x1

.field static final SECURITY_WPA2_PSK:I = 0x4

.field static final SECURITY_WPA_PSK:I = 0x3

.field private static final STATE_NONE:[I = null

.field private static final STATE_SECURED:[I = null

.field static final TAG:Ljava/lang/String; = "OOBE.AccessPoint"

.field static sExt:Lcom/mediatek/oobe/ext/IWifiExt;

.field private static sWFATestFlag:Ljava/lang/String;


# instance fields
.field mBssid:Ljava/lang/String;

.field private mConfig:Landroid/net/wifi/WifiConfiguration;

.field private mInfo:Landroid/net/wifi/WifiInfo;

.field mNetworkId:I

.field mPskType:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

.field private mRssi:I

.field mScanResult:Landroid/net/wifi/ScanResult;

.field mSecurity:I

.field mSsid:Ljava/lang/String;

.field private mState:Landroid/net/NetworkInfo$DetailedState;

.field mWpsAvailable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 82
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/high16 v1, 0x7f01

    aput v1, v0, v2

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->STATE_SECURED:[I

    .line 83
    new-array v0, v2, [I

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->STATE_NONE:[I

    .line 88
    sput-object v3, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sWFATestFlag:Ljava/lang/String;

    .line 122
    sput-object v3, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/net/wifi/ScanResult;)V
    .locals 1
    .parameter "context"
    .parameter "result"

    .prologue
    .line 230
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 111
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mWpsAvailable:Z

    .line 113
    sget-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->UNKNOWN:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mPskType:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    .line 231
    const v0, 0x7f030013

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setWidgetLayoutResource(I)V

    .line 232
    invoke-direct {p0, p2}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->loadResult(Landroid/net/wifi/ScanResult;)V

    .line 233
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->refresh()V

    .line 235
    sget-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    if-nez v0, :cond_0

    .line 236
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/Utils;->getWifiPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiExt;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    .line 239
    :cond_0
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/net/wifi/WifiConfiguration;)V
    .locals 1
    .parameter "context"
    .parameter "config"

    .prologue
    .line 218
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 111
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mWpsAvailable:Z

    .line 113
    sget-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->UNKNOWN:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mPskType:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    .line 219
    const v0, 0x7f030013

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setWidgetLayoutResource(I)V

    .line 220
    invoke-direct {p0, p2}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->loadConfig(Landroid/net/wifi/WifiConfiguration;)V

    .line 221
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->refresh()V

    .line 223
    sget-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    if-nez v0, :cond_0

    .line 224
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/Utils;->getWifiPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiExt;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    .line 227
    :cond_0
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 2
    .parameter "context"
    .parameter "savedState"

    .prologue
    .line 242
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 111
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mWpsAvailable:Z

    .line 113
    sget-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->UNKNOWN:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mPskType:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    .line 243
    const v0, 0x7f030013

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setWidgetLayoutResource(I)V

    .line 245
    const-string v0, "key_config"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiConfiguration;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    .line 246
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->loadConfig(Landroid/net/wifi/WifiConfiguration;)V

    .line 249
    :cond_0
    const-string v0, "key_scanresult"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/ScanResult;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mScanResult:Landroid/net/wifi/ScanResult;

    .line 250
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mScanResult:Landroid/net/wifi/ScanResult;

    if-eqz v0, :cond_1

    .line 251
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mScanResult:Landroid/net/wifi/ScanResult;

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->loadResult(Landroid/net/wifi/ScanResult;)V

    .line 253
    :cond_1
    const-string v0, "key_wifiinfo"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiInfo;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    .line 254
    const-string v0, "key_detailedstate"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 255
    const-string v0, "key_detailedstate"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/NetworkInfo$DetailedState;->valueOf(Ljava/lang/String;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    .line 257
    :cond_2
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V

    .line 259
    sget-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    if-nez v0, :cond_3

    .line 260
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/Utils;->getWifiPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/IWifiExt;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    .line 263
    :cond_3
    return-void
.end method

.method static convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "string"

    .prologue
    .line 410
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

.method private static getPskType(Landroid/net/wifi/ScanResult;)Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;
    .locals 5
    .parameter "result"

    .prologue
    .line 203
    iget-object v2, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v3, "WPA-PSK"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 204
    .local v0, wpa:Z
    iget-object v2, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v3, "WPA2-PSK"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    .line 205
    .local v1, wpa2:Z
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 206
    sget-object v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->WPA_WPA2:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    .line 213
    :goto_0
    return-object v2

    .line 207
    :cond_0
    if-eqz v1, :cond_1

    .line 208
    sget-object v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->WPA2:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    goto :goto_0

    .line 209
    :cond_1
    if-eqz v0, :cond_2

    .line 210
    sget-object v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->WPA:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    goto :goto_0

    .line 212
    :cond_2
    const-string v2, "OOBE.AccessPoint"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received abnormal flag string: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    sget-object v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->UNKNOWN:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    goto :goto_0
.end method

.method private static getSecurity(Landroid/net/wifi/ScanResult;)I
    .locals 2
    .parameter "result"

    .prologue
    .line 149
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WAPI-PSK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    const/4 v0, 0x6

    .line 162
    :goto_0
    return v0

    .line 152
    :cond_0
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WAPI-CERT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 154
    const/4 v0, 0x7

    goto :goto_0

    .line 155
    :cond_1
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WEP"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 156
    const/4 v0, 0x1

    goto :goto_0

    .line 157
    :cond_2
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "PSK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 158
    const/4 v0, 0x2

    goto :goto_0

    .line 159
    :cond_3
    iget-object v0, p0, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "EAP"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 160
    const/4 v0, 0x5

    goto :goto_0

    .line 162
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getSecurity(Landroid/net/wifi/WifiConfiguration;)I
    .locals 6
    .parameter "config"

    .prologue
    const/4 v3, 0x6

    const/4 v4, 0x5

    const/4 v2, 0x2

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 125
    iget-object v5, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v5, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-eqz v5, :cond_1

    move v0, v2

    .line 145
    :cond_0
    :goto_0
    return v0

    .line 128
    :cond_1
    iget-object v5, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v5, v2}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v5, 0x3

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    move v0, v4

    .line 129
    goto :goto_0

    .line 132
    :cond_3
    iget-object v2, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-eqz v2, :cond_4

    move v0, v3

    .line 133
    goto :goto_0

    .line 136
    :cond_4
    iget-object v2, p0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 137
    const/4 v0, 0x7

    goto :goto_0

    .line 140
    :cond_5
    iget v2, p0, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    if-ltz v2, :cond_6

    iget v2, p0, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    iget-object v3, p0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_6

    iget-object v2, p0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    iget v3, p0, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    aget-object v2, v2, v3

    if-nez v2, :cond_0

    .line 145
    :cond_6
    iget-object v2, p0, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    aget-object v2, v2, v1

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public static isWFATestSupported()Z
    .locals 3

    .prologue
    .line 485
    sget-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sWFATestFlag:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 486
    const-string v0, "persist.radio.wifi.wpa2wpaalone"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sWFATestFlag:Ljava/lang/String;

    .line 487
    const-string v0, "OOBE.AccessPoint"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isWFATestSupported(), sWFATestFlag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sWFATestFlag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    :cond_0
    const-string v0, "true"

    sget-object v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sWFATestFlag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private loadConfig(Landroid/net/wifi/WifiConfiguration;)V
    .locals 1
    .parameter "config"

    .prologue
    .line 275
    iget-object v0, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    .line 276
    iget-object v0, p1, Landroid/net/wifi/WifiConfiguration;->BSSID:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mBssid:Ljava/lang/String;

    .line 277
    invoke-static {p1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getSecurity(Landroid/net/wifi/WifiConfiguration;)I

    move-result v0

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    .line 278
    iget v0, p1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    .line 279
    const v0, 0x7fffffff

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    .line 280
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    .line 281
    return-void

    .line 275
    :cond_0
    iget-object v0, p1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-static {v0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->removeDoubleQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private loadResult(Landroid/net/wifi/ScanResult;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 284
    iget-object v0, p1, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    .line 285
    iget-object v0, p1, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mBssid:Ljava/lang/String;

    .line 286
    invoke-static {p1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getSecurity(Landroid/net/wifi/ScanResult;)I

    move-result v0

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    .line 287
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    iget-object v0, p1, Landroid/net/wifi/ScanResult;->capabilities:Ljava/lang/String;

    const-string v1, "WPS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mWpsAvailable:Z

    .line 288
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 289
    invoke-static {p1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getPskType(Landroid/net/wifi/ScanResult;)Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mPskType:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    .line 291
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    .line 292
    iget v0, p1, Landroid/net/wifi/ScanResult;->level:I

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    .line 293
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mScanResult:Landroid/net/wifi/ScanResult;

    .line 294
    return-void

    .line 287
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private refresh()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 415
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setTitle(Ljava/lang/CharSequence;)V

    .line 416
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 417
    .local v0, context:Landroid/content/Context;
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    if-eqz v3, :cond_0

    .line 418
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    invoke-static {v0, v3}, Lcom/mediatek/oobe/basic/wifi/Summary;->get(Landroid/content/Context;Landroid/net/NetworkInfo$DetailedState;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setSummary(Ljava/lang/CharSequence;)V

    .line 461
    :goto_0
    return-void

    .line 419
    :cond_0
    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    const v4, 0x7fffffff

    if-ne v3, v4, :cond_1

    .line 420
    const v3, 0x7f0900c5

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 421
    :cond_1
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    iget v3, v3, Landroid/net/wifi/WifiConfiguration;->status:I

    if-ne v3, v5, :cond_2

    .line 422
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    iget v3, v3, Landroid/net/wifi/WifiConfiguration;->disableReason:I

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 431
    :pswitch_0
    const v3, 0x7f0900c2

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 424
    :pswitch_1
    const v3, 0x7f0900c4

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 428
    :pswitch_2
    const v3, 0x7f0900c3

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 437
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 438
    .local v2, summary:Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v3, :cond_3

    .line 439
    const v3, 0x7f0900c1

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    :cond_3
    iget v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    if-eqz v3, :cond_4

    .line 444
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-nez v3, :cond_6

    .line 445
    const v3, 0x7f0900e6

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 449
    .local v1, securityStrFormat:Ljava/lang/String;
    :goto_1
    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0, v5}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getSecurityString(Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .end local v1           #securityStrFormat:Ljava/lang/String;
    :cond_4
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    if-nez v3, :cond_5

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mWpsAvailable:Z

    if-eqz v3, :cond_5

    .line 453
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-nez v3, :cond_7

    .line 454
    const v3, 0x7f0900e4

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    :cond_5
    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 447
    :cond_6
    const v3, 0x7f0900e7

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #securityStrFormat:Ljava/lang/String;
    goto :goto_1

    .line 456
    .end local v1           #securityStrFormat:Ljava/lang/String;
    :cond_7
    const v3, 0x7f0900e5

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 422
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method static removeDoubleQuotes(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "string"

    .prologue
    const/16 v3, 0x22

    const/4 v2, 0x1

    .line 402
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 403
    .local v0, length:I
    if-le v0, v2, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_0

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_0

    .line 404
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 406
    .end local p0
    :cond_0
    return-object p0
.end method

.method public static resetWFAFlag()V
    .locals 1

    .prologue
    .line 495
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sWFATestFlag:Ljava/lang/String;

    .line 496
    return-void
.end method


# virtual methods
.method public compareTo(Landroid/preference/Preference;)I
    .locals 10
    .parameter "preference"

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 311
    instance-of v5, p1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    if-nez v5, :cond_1

    move v3, v4

    .line 341
    :cond_0
    :goto_0
    return v3

    :cond_1
    move-object v2, p1

    .line 314
    check-cast v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;

    .line 316
    .local v2, other:Lcom/mediatek/oobe/basic/wifi/AccessPoint;
    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    iget-object v6, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    if-eq v5, v6, :cond_2

    .line 317
    iget-object v5, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    if-nez v5, :cond_0

    move v3, v4

    goto :goto_0

    .line 321
    :cond_2
    sget-object v5, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->sExt:Lcom/mediatek/oobe/ext/IWifiExt;

    iget-object v6, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    iget v7, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    iget-object v8, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    iget v9, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    invoke-interface {v5, v6, v7, v8, v9}, Lcom/mediatek/oobe/ext/IWifiExt;->getApOrder(Ljava/lang/String;ILjava/lang/String;I)I

    move-result v1

    .line 322
    .local v1, order:I
    if-eqz v1, :cond_3

    move v3, v1

    .line 323
    goto :goto_0

    .line 328
    :cond_3
    iget v5, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    iget v6, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    xor-int/2addr v5, v6

    if-gez v5, :cond_4

    .line 329
    iget v5, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    const v6, 0x7fffffff

    if-ne v5, v6, :cond_0

    move v3, v4

    goto :goto_0

    .line 332
    :cond_4
    iget v5, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    iget v6, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    xor-int/2addr v5, v6

    if-gez v5, :cond_5

    .line 333
    iget v5, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    if-ne v5, v3, :cond_0

    move v3, v4

    goto :goto_0

    .line 336
    :cond_5
    iget v3, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    iget v4, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    invoke-static {v3, v4}, Landroid/net/wifi/WifiManager;->compareSignalLevel(II)I

    move-result v0

    .line 337
    .local v0, difference:I
    if-eqz v0, :cond_6

    move v3, v0

    .line 338
    goto :goto_0

    .line 341
    :cond_6
    iget-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    iget-object v4, v2, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v3

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    check-cast p1, Landroid/preference/Preference;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->compareTo(Landroid/preference/Preference;)I

    move-result v0

    return v0
.end method

.method protected generateOpenNetworkConfig()V
    .locals 2

    .prologue
    .line 469
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    if-eqz v0, :cond_0

    .line 470
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 472
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    if-eqz v0, :cond_1

    .line 480
    :goto_0
    return-void

    .line 475
    :cond_1
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    .line 476
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 478
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mBssid:Ljava/lang/String;

    iput-object v1, v0, Landroid/net/wifi/WifiConfiguration;->BSSID:Ljava/lang/String;

    .line 479
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    goto :goto_0
.end method

.method getConfig()Landroid/net/wifi/WifiConfiguration;
    .locals 1

    .prologue
    .line 390
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    return-object v0
.end method

.method getInfo()Landroid/net/wifi/WifiInfo;
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    return-object v0
.end method

.method getLevel()I
    .locals 2

    .prologue
    .line 383
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    .line 384
    const/4 v0, -0x1

    .line 386
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v0

    goto :goto_0
.end method

.method public getSecurityString(Z)Ljava/lang/String;
    .locals 3
    .parameter "concise"

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 167
    .local v0, context:Landroid/content/Context;
    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    packed-switch v1, :pswitch_data_0

    .line 198
    :pswitch_0
    if-eqz p1, :cond_6

    const-string v1, ""

    :goto_0
    return-object v1

    .line 169
    :pswitch_1
    if-eqz p1, :cond_0

    const v1, 0x7f0900ed

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const v1, 0x7f0900f4

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 172
    :pswitch_2
    sget-object v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint$1;->$SwitchMap$com$mediatek$oobe$basic$wifi$AccessPoint$PskType:[I

    iget-object v2, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mPskType:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1

    .line 184
    if-eqz p1, :cond_4

    const v1, 0x7f0900ec

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 174
    :pswitch_3
    if-eqz p1, :cond_1

    const v1, 0x7f0900e9

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const v1, 0x7f0900f0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 177
    :pswitch_4
    if-eqz p1, :cond_2

    const v1, 0x7f0900ea

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    const v1, 0x7f0900f1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 180
    :pswitch_5
    if-eqz p1, :cond_3

    const v1, 0x7f0900eb

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_3
    const v1, 0x7f0900f2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 184
    :cond_4
    const v1, 0x7f0900f3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 188
    :pswitch_6
    if-eqz p1, :cond_5

    const v1, 0x7f0900e8

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_5
    const v1, 0x7f0900ef

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 192
    :pswitch_7
    const v1, 0x7f09011a

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 195
    :pswitch_8
    const v1, 0x7f09011b

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 198
    :cond_6
    const v1, 0x7f0900ee

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 167
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 172
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method getState()Landroid/net/NetworkInfo$DetailedState;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    return-object v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 298
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 299
    const v1, 0x7f0b002f

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 300
    .local v0, signal:Landroid/widget/ImageView;
    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_0

    .line 301
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 307
    :goto_0
    return-void

    .line 303
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getLevel()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageLevel(I)V

    .line 304
    const v1, 0x7f020039

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 305
    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    if-eqz v1, :cond_1

    sget-object v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->STATE_SECURED:[I

    :goto_1
    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setImageState([IZ)V

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->STATE_NONE:[I

    goto :goto_1
.end method

.method public saveWifiState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedState"

    .prologue
    .line 266
    const-string v0, "key_config"

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mConfig:Landroid/net/wifi/WifiConfiguration;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 267
    const-string v0, "key_scanresult"

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mScanResult:Landroid/net/wifi/ScanResult;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 268
    const-string v0, "key_wifiinfo"

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 269
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    if-eqz v0, :cond_0

    .line 270
    const-string v0, "key_detailedstate"

    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    invoke-virtual {v1}, Landroid/net/NetworkInfo$DetailedState;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    :cond_0
    return-void
.end method

.method update(Landroid/net/wifi/WifiInfo;Landroid/net/NetworkInfo$DetailedState;)V
    .locals 4
    .parameter "info"
    .parameter "state"

    .prologue
    const/4 v3, 0x0

    .line 364
    const/4 v0, 0x0

    .line 365
    .local v0, reorder:Z
    if-eqz p1, :cond_3

    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mNetworkId:I

    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 366
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    if-nez v1, :cond_2

    const/4 v0, 0x1

    .line 367
    :goto_0
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v1

    iput v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    .line 368
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    .line 369
    iput-object p2, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    .line 370
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->refresh()V

    .line 377
    :cond_0
    :goto_1
    if-eqz v0, :cond_1

    .line 378
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->notifyHierarchyChanged()V

    .line 380
    :cond_1
    return-void

    .line 366
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 371
    :cond_3
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    if-eqz v1, :cond_0

    .line 372
    const/4 v0, 0x1

    .line 373
    iput-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mInfo:Landroid/net/wifi/WifiInfo;

    .line 374
    iput-object v3, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mState:Landroid/net/NetworkInfo$DetailedState;

    .line 375
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->refresh()V

    goto :goto_1
.end method

.method update(Landroid/net/wifi/ScanResult;)Z
    .locals 3
    .parameter "result"

    .prologue
    .line 345
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSsid:Ljava/lang/String;

    iget-object v2, p1, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    invoke-static {p1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getSecurity(Landroid/net/wifi/ScanResult;)I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 346
    iget v1, p1, Landroid/net/wifi/ScanResult;->level:I

    iget v2, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    invoke-static {v1, v2}, Landroid/net/wifi/WifiManager;->compareSignalLevel(II)I

    move-result v1

    if-lez v1, :cond_0

    .line 347
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getLevel()I

    move-result v0

    .line 348
    .local v0, oldLevel:I
    iget v1, p1, Landroid/net/wifi/ScanResult;->level:I

    iput v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mRssi:I

    .line 349
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getLevel()I

    move-result v1

    if-eq v1, v0, :cond_0

    .line 350
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->notifyChanged()V

    .line 354
    .end local v0           #oldLevel:I
    :cond_0
    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mSecurity:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 355
    invoke-static {p1}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->getPskType(Landroid/net/wifi/ScanResult;)Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->mPskType:Lcom/mediatek/oobe/basic/wifi/AccessPoint$PskType;

    .line 357
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/wifi/AccessPoint;->refresh()V

    .line 358
    const/4 v1, 0x1

    .line 360
    :goto_0
    return v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method
