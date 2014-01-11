.class public Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;
.super Landroid/content/BroadcastReceiver;
.source "NetworkControllerGemini.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$1;,
        Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;,
        Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;,
        Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    }
.end annotation


# static fields
.field private static final ACTION_BOOT_IPO:Ljava/lang/String; = "android.intent.action.ACTION_PREBOOT_IPO"

.field static final CHATTY:Z = false

.field static final DEBUG:Z = false

.field private static final INET_CONDITION_THRESHOLD:I = 0x32

.field static final TAG:Ljava/lang/String; = "NetworkControllerGemini"


# instance fields
.field private mAirplaneMode:Z

.field private mAlwaysShowCdmaRssi:Z

.field private mBatteryStats:Lcom/android/internal/app/IBatteryStats;

.field private mBluetoothTetherIconId:I

.field private mBluetoothTethered:Z

.field private mCarrier1:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

.field private mCarrier2:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

.field private mCarrierDivider:Landroid/view/View;

.field private mCarrierList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;",
            ">;"
        }
    .end annotation
.end field

.field private mCombinedLabelViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mCombinedSignalIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mConnected:Z

.field private mConnectedNetworkType:I

.field private mConnectedNetworkTypeName:Ljava/lang/String;

.field private mContentDescriptionDataType:[Ljava/lang/String;

.field private mContentDescriptionPhoneSignal:[Ljava/lang/String;

.field private mContentDescriptionWifi:Ljava/lang/String;

.field private mContentDescriptionWimax:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDataActive:Z

.field private mDataActivity:[I

.field private mDataAndWifiStacked:Z

.field private mDataConnected:[Z

.field private mDataDirectionIconId:[I

.field private mDataDirectionIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mDataDirectionOverlayIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mDataIconListNum:I

.field private mDataNetType:[I

.field private mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

.field private mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mDataState:[I

.field private mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mDataTypeIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mDividerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mEmergencyLabelViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mGeminiSimNum:I

.field private mHasMobileDataFeature:Z

.field private mHspaDataDistinguishable:Z

.field private mInetCondition:I

.field private mIsRoaming:[Z

.field private mIsRoamingId:[I

.field private mIsScreenLarge:Z

.field private mIsWimaxEnabled:Z

.field private mLastAirplaneMode:Z

.field private mLastCombinedLabel:Ljava/lang/String;

.field private mLastCombinedSignalIconId:I

.field private mLastDataDirectionIconId:I

.field private mLastDataDirectionOverlayIconId:I

.field private mLastDataTypeIconId:[I

.field private mLastMobileActivityIconId:[I

.field private mLastPhoneSignalIconId:[[I

.field private mLastWifiIconId:I

.field private mLastWimaxIconId:I

.field private mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mMobileLabelViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mNetworkName:[Ljava/lang/String;

.field private mNetworkNameDefault:Ljava/lang/String;

.field private mNetworkNameSeparator:Ljava/lang/String;

.field private final mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

.field private mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private mPhoneSignalIconIdNum:I

.field private mPhoneSignalIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

.field private mServiceState:[Landroid/telephony/ServiceState;

.field private mShowAtLeastThreeGees:Z

.field private mSignalClusters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;",
            ">;"
        }
    .end annotation
.end field

.field private mSignalStrength:[Landroid/telephony/SignalStrength;

.field private mSimCardReady:Z

.field private mSimIndicatorFlag:[Z

.field private mSimIndicatorResId:[I

.field private mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

.field private mWifiActivity:I

.field private mWifiActivityIconId:I

.field private mWifiChannel:Lcom/android/internal/util/AsyncChannel;

.field private mWifiConnected:Z

.field private mWifiEnabled:Z

.field private mWifiIconId:I

.field private mWifiIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mWifiLabelViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mWifiLevel:I

.field private final mWifiManager:Landroid/net/wifi/WifiManager;

.field private mWifiRssi:I

.field private mWifiSsid:Ljava/lang/String;

.field private mWimaxConnected:Z

.field private mWimaxExtraState:I

.field private mWimaxIconId:I

.field private mWimaxIconViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mWimaxIdle:Z

.field private mWimaxSignal:I

.field private mWimaxState:I

.field private mWimaxSupported:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 14
    .parameter "context"

    .prologue
    .line 208
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 107
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    .line 108
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    .line 117
    const/4 v11, 0x4

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    .line 118
    const/4 v11, 0x2

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconIdNum:I

    .line 130
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    .line 131
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    .line 132
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    .line 135
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    .line 136
    const v11, 0x1080564

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTetherIconId:I

    .line 140
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    .line 141
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    .line 142
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    .line 143
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    .line 144
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    .line 145
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    .line 146
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    .line 147
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    .line 150
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    .line 151
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    .line 153
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    .line 156
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    .line 157
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    .line 161
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    .line 162
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    .line 163
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    .line 164
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    .line 165
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    .line 166
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    .line 167
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    .line 168
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    .line 169
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    .line 170
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    .line 171
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    .line 172
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    .line 174
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    .line 175
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    .line 176
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    .line 177
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    .line 178
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    .line 181
    const-string v11, ""

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    .line 184
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataAndWifiStacked:Z

    .line 185
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    .line 191
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    .line 2336
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrier1:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2337
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrier2:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2338
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierDivider:Landroid/view/View;

    .line 2382
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    .line 2383
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    .line 209
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    .line 210
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 212
    .local v7, res:Landroid/content/res/Resources;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v12, "connectivity"

    invoke-virtual {v11, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 214
    .local v0, cm:Landroid/net/ConnectivityManager;
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    .line 215
    const v11, 0x7f0a0005

    invoke-virtual {v7, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    .line 216
    const-string v11, "NetworkControllerGemini"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "NetworkControllerGemini, mShowAtLeastThreeGees="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-boolean v13, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    const-string v11, "window"

    invoke-static {v11}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v11

    invoke-static {v11}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v10

    .line 221
    .local v10, wm:Landroid/view/IWindowManager;
    :try_start_0
    invoke-interface {v10}, Landroid/view/IWindowManager;->hasSystemNavBar()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 222
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_0
    const v11, 0x111003a

    invoke-virtual {v7, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    .line 234
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiIcons()V

    .line 235
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxIcons()V

    .line 238
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefault(Landroid/content/Context;)Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 239
    sget v11, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    .line 240
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b005b

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameSeparator:Ljava/lang/String;

    .line 241
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x10402e6

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameDefault:Ljava/lang/String;

    .line 243
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Z

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    .line 244
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    .line 245
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Landroid/telephony/SignalStrength;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    .line 246
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Landroid/telephony/ServiceState;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    .line 247
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    .line 248
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    .line 249
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Z

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    .line 250
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/android/internal/telephony/IccCardConstants$State;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    .line 251
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    .line 252
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    .line 253
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/NetworkType;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    .line 254
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Ljava/lang/String;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    .line 255
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 256
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Ljava/lang/String;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    .line 257
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Ljava/lang/String;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    .line 258
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    iget v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconIdNum:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    const-class v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 259
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 260
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 261
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    iget v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    const-class v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 262
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [[I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    .line 263
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    .line 264
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    .line 265
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Z

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    .line 266
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorResId:[I

    .line 267
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    .line 269
    const-string v11, "gsm.siminfo.ready"

    const/4 v12, 0x0

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    .line 270
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    const/4 v12, 0x0

    sget-object v13, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    invoke-interface {v11, v12, v13}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I

    move-result-object v5

    .line 273
    .local v5, iconList:[I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v4, v11, :cond_5

    .line 274
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    const/4 v12, 0x0

    aput v12, v11, v4

    .line 275
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    const/4 v12, 0x0

    aput v12, v11, v4

    .line 276
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    sget-object v12, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    aput-object v12, v11, v4

    .line 277
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    const/4 v12, 0x0

    aput v12, v11, v4

    .line 278
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameDefault:Ljava/lang/String;

    aput-object v12, v11, v4

    .line 279
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    const/4 v12, 0x2

    new-array v12, v12, [I

    fill-array-data v12, :array_0

    aput-object v12, v11, v4

    .line 280
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    const/4 v12, -0x1

    aput v12, v11, v4

    .line 281
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    const/4 v12, -0x1

    aput v12, v11, v4

    .line 282
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    new-instance v12, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    const/4 v13, 0x0

    invoke-direct {v12, p0, v13}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$1;)V

    aput-object v12, v11, v4

    .line 283
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v12, v11, v4

    .line 284
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v4

    .line 285
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v4

    .line 287
    const/4 v6, 0x0

    .local v6, j:I
    :goto_2
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    if-ge v6, v11, :cond_2

    .line 289
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v6

    .line 290
    if-eqz v5, :cond_1

    .line 291
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v12

    invoke-interface {v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 292
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    aget v12, v5, v6

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 287
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 224
    .end local v4           #i:I
    .end local v5           #iconList:[I
    .end local v6           #j:I
    :cond_0
    const/4 v11, 0x0

    :try_start_1
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 226
    :catch_0
    move-exception v1

    .line 227
    .local v1, e:Landroid/os/RemoteException;
    const-string v11, "NetworkControllerGemini"

    const-string v12, "Failing checking whether status bar is visible"

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 294
    .end local v1           #e:Landroid/os/RemoteException;
    .restart local v4       #i:I
    .restart local v5       #iconList:[I
    .restart local v6       #j:I
    :cond_1
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 295
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    sget-object v12, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G:[I

    aget v12, v12, v6

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_3

    .line 298
    :cond_2
    const/4 v6, 0x0

    :goto_4
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconIdNum:I

    if-ge v6, v11, :cond_3

    .line 299
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v6

    .line 298
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 302
    :cond_3
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11, v4}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v8

    .line 303
    .local v8, resId:I
    const/4 v11, -0x1

    if-eq v8, v11, :cond_4

    .line 304
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    const/4 v12, 0x0

    aget-object v11, v11, v12

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v12

    invoke-interface {v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 305
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    const/4 v12, 0x0

    aget-object v11, v11, v12

    invoke-virtual {v11, v8}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 311
    :goto_5
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    aget-object v11, v11, v4

    const/16 v12, 0x1e1

    invoke-static {v11, v12, v4}, Lcom/android/systemui/statusbar/util/SIMHelper;->listen(Landroid/telephony/PhoneStateListener;II)V

    .line 273
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    .line 307
    :cond_4
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    const/4 v12, 0x0

    aget-object v11, v11, v12

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 308
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    const/4 v12, 0x0

    aget-object v11, v11, v12

    const v12, 0x7f0201ed

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_5

    .line 320
    .end local v6           #j:I
    .end local v8           #resId:I
    :cond_5
    invoke-static {}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSimInsertedStatus()V

    .line 322
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0a0002

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    if-eqz v11, :cond_8

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->isHspaDataDistinguishable()Z

    move-result v11

    if-eqz v11, :cond_8

    const/4 v11, 0x1

    :goto_6
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHspaDataDistinguishable:Z

    .line 326
    const-string v11, "wifi"

    invoke-virtual {p1, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/net/wifi/WifiManager;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 327
    new-instance v3, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;

    invoke-direct {v3, p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    .line 328
    .local v3, handler:Landroid/os/Handler;
    new-instance v11, Lcom/android/internal/util/AsyncChannel;

    invoke-direct {v11}, Lcom/android/internal/util/AsyncChannel;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    .line 329
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v11}, Landroid/net/wifi/WifiManager;->getWifiServiceMessenger()Landroid/os/Messenger;

    move-result-object v9

    .line 330
    .local v9, wifiMessenger:Landroid/os/Messenger;
    if-eqz v9, :cond_6

    .line 331
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v12, v3, v9}, Lcom/android/internal/util/AsyncChannel;->connect(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Messenger;)V

    .line 335
    :cond_6
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 336
    .local v2, filter:Landroid/content/IntentFilter;
    const-string v11, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 337
    const-string v11, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 338
    const-string v11, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 339
    const-string v11, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 340
    const-string v11, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 341
    const-string v11, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 342
    const-string v11, "android.net.conn.INET_CONDITION_ACTION"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 343
    const-string v11, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 344
    const-string v11, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 345
    const-string v11, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 346
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x111003f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    .line 348
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    if-eqz v11, :cond_7

    .line 349
    const-string v11, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 350
    const-string v11, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 351
    const-string v11, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 353
    :cond_7
    const-string v11, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 354
    const-string v11, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 355
    const-string v11, "android.intent.action.SIM_INSERTED_STATUS"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 356
    const-string v11, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 357
    const-string v11, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 358
    invoke-virtual {p1, p0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 361
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateAirplaneMode()V

    .line 364
    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    .line 365
    return-void

    .line 322
    .end local v2           #filter:Landroid/content/IntentFilter;
    .end local v3           #handler:Landroid/os/Handler;
    .end local v9           #wifiMessenger:Landroid/os/Messenger;
    :cond_8
    const/4 v11, 0x0

    goto/16 :goto_6

    .line 279
    nop

    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)Lcom/android/internal/util/AsyncChannel;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    return v0
.end method

.method static synthetic access$1402(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/SignalStrength;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/ServiceState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon()V

    return-void
.end method

.method private getResourceName(I)Ljava/lang/String;
    .locals 3
    .parameter "resId"

    .prologue
    .line 2325
    if-eqz p1, :cond_0

    .line 2326
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2328
    .local v1, res:Landroid/content/res/Resources;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 2333
    .end local v1           #res:Landroid/content/res/Resources;
    :goto_0
    return-object v2

    .line 2329
    .restart local v1       #res:Landroid/content/res/Resources;
    :catch_0
    move-exception v0

    .line 2330
    .local v0, ex:Landroid/content/res/Resources$NotFoundException;
    const-string v2, "(unknown)"

    goto :goto_0

    .line 2333
    .end local v0           #ex:Landroid/content/res/Resources$NotFoundException;
    .end local v1           #res:Landroid/content/res/Resources;
    :cond_0
    const-string v2, "(null)"

    goto :goto_0
.end method

.method private hasService(I)Z
    .locals 3
    .parameter "slotId"

    .prologue
    const/4 v1, 0x0

    .line 670
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v0, v2, p1

    .line 672
    .local v0, tempServiceState:Landroid/telephony/ServiceState;
    if-eqz v0, :cond_0

    .line 673
    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getState()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 678
    :pswitch_0
    const/4 v1, 0x1

    .line 681
    :cond_0
    :pswitch_1
    return v1

    .line 673
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private huntForSsid(Landroid/net/wifi/WifiInfo;)Ljava/lang/String;
    .locals 6
    .parameter "info"

    .prologue
    .line 1408
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v3

    .line 1409
    .local v3, ssid:Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 1419
    .end local v3           #ssid:Ljava/lang/String;
    :goto_0
    return-object v3

    .line 1413
    .restart local v3       #ssid:Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v2

    .line 1414
    .local v2, networks:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiConfiguration;

    .line 1415
    .local v1, net:Landroid/net/wifi/WifiConfiguration;
    iget v4, v1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 1416
    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    goto :goto_0

    .line 1419
    .end local v1           #net:Landroid/net/wifi/WifiConfiguration;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private isCdma(I)Z
    .locals 2
    .parameter "slotId"

    .prologue
    .line 663
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v0, v1, p1

    .line 665
    .local v0, tempSignalStrength:Landroid/telephony/SignalStrength;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/SignalStrength;->isGsm()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isWifiOnlyDevice()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 2377
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 2378
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private updateAirplaneMode()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 686
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    .line 688
    return-void

    :cond_0
    move v0, v1

    .line 686
    goto :goto_0
.end method

.method private updateConnectivity(Landroid/content/Intent;)V
    .locals 8
    .parameter "intent"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1473
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v7, "connectivity"

    invoke-virtual {v4, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1475
    .local v0, connManager:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1478
    .local v2, info:Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v5

    :goto_0
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    .line 1479
    iget-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    if-eqz v4, :cond_1

    .line 1480
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    .line 1481
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkTypeName:Ljava/lang/String;

    .line 1486
    :goto_1
    const-string v4, "inetCondition"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1493
    .local v1, connectionStatus:I
    const/16 v4, 0x32

    if-le v1, v4, :cond_2

    :goto_2
    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    .line 1494
    const-string v4, "NetworkControllerGemini"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateConnectivity, mInetCondition="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1496
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_3

    .line 1497
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    .line 1503
    :goto_3
    const-string v4, "simId"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 1504
    .local v3, slotId:I
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 1505
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxIcons()V

    .line 1506
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 1507
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 1508
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiIcons()V

    .line 1509
    return-void

    .end local v1           #connectionStatus:I
    .end local v3           #slotId:I
    :cond_0
    move v4, v6

    .line 1478
    goto :goto_0

    .line 1483
    :cond_1
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    .line 1484
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkTypeName:Ljava/lang/String;

    goto :goto_1

    .restart local v1       #connectionStatus:I
    :cond_2
    move v5, v6

    .line 1493
    goto :goto_2

    .line 1499
    :cond_3
    iput-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    goto :goto_3
.end method

.method private final updateDataIcon()V
    .locals 2

    .prologue
    .line 1099
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 1100
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 1099
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1102
    :cond_0
    return-void
.end method

.method private final updateDataIcon(I)V
    .locals 24
    .parameter "slotId"

    .prologue
    .line 1105
    const/4 v9, 0x0

    .line 1106
    .local v9, iconId:I
    const/16 v20, 0x1

    .line 1107
    .local v20, visible:Z
    invoke-static {}, Lcom/android/systemui/statusbar/util/SIMHelper;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v8

    .line 1108
    .local v8, iTelephony:Lcom/android/internal/telephony/ITelephony;
    const/16 v18, 0x0

    .line 1112
    .local v18, tempNetType3G:Lcom/mediatek/systemui/ext/NetworkType;
    const/16 v21, 0x4

    move/from16 v0, v21

    new-array v0, v0, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v16, v0

    const/16 v21, 0x0

    new-instance v22, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v22 .. v22}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v22, v16, v21

    const/16 v21, 0x1

    new-instance v22, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v22 .. v22}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v22, v16, v21

    const/16 v21, 0x2

    new-instance v22, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v22 .. v22}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v22, v16, v21

    const/16 v21, 0x3

    new-instance v22, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v22 .. v22}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v22, v16, v21

    .line 1115
    .local v16, tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    move-object/from16 v21, v0

    aget v17, v21, p1

    .line 1116
    .local v17, tempDataState:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v21, v0

    aget-object v19, v21, p1

    .line 1117
    .local v19, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    move-object/from16 v21, v0

    aget v15, v21, p1

    .line 1118
    .local v15, tempDataActivity:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v21, v0

    aget-object v18, v21, p1

    .line 1120
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_0

    .line 1121
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v21, v0

    aget-object v21, v21, p1

    aget-object v21, v21, v7

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v21

    aput-object v21, v16, v7

    .line 1120
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1124
    :cond_0
    const-string v21, "NetworkControllerGemini"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateDataIcon("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "), SimState="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", DataState="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", DataActivity="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", tempNetType3G="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1127
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v21

    if-nez v21, :cond_d

    .line 1129
    sget-object v21, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_1

    sget-object v21, Lcom/android/internal/telephony/IccCardConstants$State;->UNKNOWN:Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_c

    .line 1172
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    new-array v3, v0, [I

    .line 1173
    .local v3, callState:[I
    const/4 v4, 0x1

    .line 1174
    .local v4, callStateAllIdle:Z
    const/4 v7, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_3

    .line 1176
    :try_start_0
    invoke-interface {v8, v7}, Lcom/android/internal/telephony/ITelephony;->getCallStateGemini(I)I

    move-result v21

    aput v21, v3, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1180
    :goto_2
    const-string v21, "NetworkControllerGemini"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateDataIcon("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "), callState("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ") is "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    aget v23, v3, v7

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1181
    aget v21, v3, v7

    if-eqz v21, :cond_2

    .line 1182
    const/4 v4, 0x0

    .line 1174
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1177
    :catch_0
    move-exception v5

    .line 1178
    .local v5, e:Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 1186
    .end local v5           #e:Ljava/lang/Exception;
    :cond_3
    sget-object v21, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_6

    .line 1187
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_5

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_5

    if-eqz v4, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v21

    const-string v22, "airplane_mode_on"

    const/16 v23, 0x0

    invoke-static/range {v21 .. v23}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v21

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_5

    .line 1192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1193
    .local v12, simColorId:I
    const-string v21, "NetworkControllerGemini"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateDataIcon("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "), simColorId="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1194
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_4

    .line 1195
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    .line 1264
    .end local v3           #callState:[I
    .end local v4           #callStateAllIdle:Z
    .end local v12           #simColorId:I
    :cond_4
    :goto_3
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v10

    .line 1266
    .local v10, ident:J
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->getNetworkType(I)I

    move-result v22

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lcom/android/internal/app/IBatteryStats;->notePhoneDataConnectionState(IZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_2

    .line 1270
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1273
    :goto_4
    const-string v21, "NetworkControllerGemini"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateDataIcon("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "), iconId="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", visible="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1274
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    move-object/from16 v21, v0

    aput-boolean v20, v21, p1

    .line 1275
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    move-object/from16 v21, v0

    aput v9, v21, p1

    .line 1277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    move-object/from16 v21, v0

    aget-boolean v21, v21, p1

    if-eqz v21, :cond_10

    .line 1278
    const/4 v7, 0x0

    :goto_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_10

    .line 1279
    move/from16 v0, p1

    if-ne v7, v0, :cond_f

    .line 1278
    :goto_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 1198
    .end local v10           #ident:J
    .restart local v3       #callState:[I
    .restart local v4       #callStateAllIdle:Z
    :cond_5
    const/4 v9, 0x0

    .line 1199
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1202
    :cond_6
    const-string v21, "phone"

    invoke-static/range {v21 .. v21}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v13

    .line 1203
    .local v13, telephony:Lcom/android/internal/telephony/ITelephony;
    const/4 v14, 0x0

    .line 1204
    .local v14, tempCapabilitySIM:I
    const/4 v4, 0x1

    .line 1207
    if-eqz v13, :cond_7

    .line 1209
    :try_start_2
    invoke-interface {v13}, Lcom/android/internal/telephony/ITelephony;->get3GCapabilitySIM()I
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    move-result v14

    .line 1215
    :cond_7
    :goto_7
    const/4 v7, 0x0

    :goto_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_a

    .line 1216
    if-ne v14, v7, :cond_9

    .line 1215
    :cond_8
    :goto_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 1210
    :catch_1
    move-exception v6

    .line 1211
    .local v6, ex:Landroid/os/RemoteException;
    invoke-virtual {v6}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_7

    .line 1219
    .end local v6           #ex:Landroid/os/RemoteException;
    :cond_9
    aget v21, v3, v7

    if-eqz v21, :cond_8

    .line 1220
    const/4 v4, 0x0

    goto :goto_9

    .line 1224
    :cond_a
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_b

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_b

    if-eqz v4, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v21

    const-string v22, "airplane_mode_on"

    const/16 v23, 0x0

    invoke-static/range {v21 .. v23}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v21

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_b

    .line 1230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1231
    .restart local v12       #simColorId:I
    const-string v21, "NetworkControllerGemini"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateDataIcon("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "), simColorId="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1232
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_4

    .line 1233
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    goto/16 :goto_3

    .line 1236
    .end local v12           #simColorId:I
    :cond_b
    const/4 v9, 0x0

    .line 1237
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1243
    .end local v3           #callState:[I
    .end local v4           #callStateAllIdle:Z
    .end local v13           #telephony:Lcom/android/internal/telephony/ITelephony;
    .end local v14           #tempCapabilitySIM:I
    :cond_c
    const v9, 0x7f0201fb

    .line 1244
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1247
    :cond_d
    const-string v21, "NetworkControllerGemini"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateDataIcon("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "), at cdma mode"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1249
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_e

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_e

    .line 1251
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1252
    .restart local v12       #simColorId:I
    const-string v21, "NetworkControllerGemini"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "updateDataIcon("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "), simColorId="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1253
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_4

    .line 1254
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    goto/16 :goto_3

    .line 1258
    .end local v12           #simColorId:I
    :cond_e
    const/4 v9, 0x0

    .line 1259
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1267
    .restart local v10       #ident:J
    :catch_2
    move-exception v5

    .line 1268
    .local v5, e:Landroid/os/RemoteException;
    :try_start_3
    const-string v21, "NetworkControllerGemini"

    const-string v22, "RemoteException"

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1270
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto/16 :goto_4

    .end local v5           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v21

    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v21

    .line 1280
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-boolean v22, v21, v7

    goto/16 :goto_6

    .line 1284
    :cond_10
    return-void
.end method

.method private final updateDataNetType()V
    .locals 2

    .prologue
    .line 902
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 903
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 902
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 905
    :cond_0
    return-void
.end method

.method private final updateDataNetType(I)V
    .locals 13
    .parameter "slotId"

    .prologue
    .line 909
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 911
    .local v5, tempDataNetType3G:Lcom/mediatek/systemui/ext/NetworkType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    aget v4, v10, p1

    .line 913
    .local v4, tempDataNetType:I
    const-string v10, "NetworkControllerGemini"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateDataNetType("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "), DataNetType="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 914
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v10, p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v1

    .line 915
    .local v1, simColorId:I
    const/4 v10, -0x1

    if-ne v1, v10, :cond_0

    .line 1080
    :goto_0
    return-void

    .line 918
    :cond_0
    const-string v10, "NetworkControllerGemini"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateDataNetType("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "), simColorId="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 920
    const/4 v8, 0x0

    .line 921
    .local v8, tempIsRoaming:Z
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdmaEri(I)Z

    move-result v10

    if-nez v10, :cond_2

    :cond_1
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    invoke-virtual {v10, p1}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 923
    :cond_2
    const/4 v9, 0x0

    .line 925
    .local v9, tempRoamingId:I
    const/4 v10, -0x1

    if-le v1, v10, :cond_3

    const/4 v10, 0x4

    if-ge v1, v10, :cond_3

    .line 926
    sget-object v10, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->ROAMING:[I

    aget v9, v10, v1

    .line 928
    :cond_3
    const-string v10, "NetworkControllerGemini"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateDataNetType("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ")  RoamingresId= "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " simColorId = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 929
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v11, 0x1

    aput-boolean v11, v10, p1

    .line 930
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    aput v9, v10, p1

    .line 931
    const/4 v8, 0x1

    .line 940
    .end local v9           #tempRoamingId:I
    :goto_1
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    if-eqz v10, :cond_7

    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-eqz v10, :cond_7

    .line 942
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    .line 943
    .local v7, tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0095

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1040
    .local v2, tempContentDescriptionDataType:Ljava/lang/String;
    :goto_2
    const/4 v10, 0x4

    new-array v3, v10, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v10, 0x0

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v11, v3, v10

    const/4 v10, 0x1

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v11, v3, v10

    const/4 v10, 0x2

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v11, v3, v10

    const/4 v10, 0x3

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v11, v3, v10

    .line 1041
    .local v3, tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1042
    .local v6, tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v10

    invoke-interface {v10, v8, v7}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I

    move-result-object v0

    .line 1043
    .local v0, iconList:[I
    if-eqz v0, :cond_d

    .line 1044
    const/4 v10, 0x0

    aget-object v10, v3, v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1045
    const/4 v10, 0x0

    aget-object v10, v3, v10

    const/4 v11, 0x0

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1046
    const/4 v10, 0x1

    aget-object v10, v3, v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1047
    const/4 v10, 0x1

    aget-object v10, v3, v10

    const/4 v11, 0x1

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1048
    const/4 v10, 0x2

    aget-object v10, v3, v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1049
    const/4 v10, 0x2

    aget-object v10, v3, v10

    const/4 v11, 0x2

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1050
    const/4 v10, 0x3

    aget-object v10, v3, v10

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1051
    const/4 v10, 0x3

    aget-object v10, v3, v10

    const/4 v11, 0x3

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1052
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v10

    invoke-interface {v10}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v6, v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1053
    aget v10, v0, v1

    invoke-virtual {v6, v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1067
    :goto_3
    if-eqz v4, :cond_4

    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v10

    if-nez v10, :cond_5

    .line 1068
    :cond_4
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v10, :cond_5

    .line 1069
    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1070
    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1074
    :cond_5
    const-string v10, "NetworkControllerGemini"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateDataNetType("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "), DataNetType3G="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " tempDataTypeIconId= "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1076
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    aput-object v5, v10, p1

    .line 1077
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    aput-object v2, v10, p1

    .line 1078
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v11

    aput-object v11, v10, p1

    .line 1079
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aput-object v3, v10, p1

    goto/16 :goto_0

    .line 933
    .end local v0           #iconList:[I
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v3           #tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v6           #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_6
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v11, 0x0

    aput-boolean v11, v10, p1

    .line 934
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    const/4 v11, 0x0

    aput v11, v10, p1

    goto/16 :goto_1

    .line 946
    :cond_7
    packed-switch v4, :pswitch_data_0

    .line 1025
    :pswitch_0
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v10, :cond_c

    .line 1026
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1027
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    .line 1028
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0092

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 948
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_1
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v10, :cond_8

    .line 949
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    .line 950
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0092

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 952
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 957
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_8
    :pswitch_2
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v10, :cond_9

    .line 958
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_E:Lcom/mediatek/systemui/ext/DataType;

    .line 959
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0097

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 961
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 966
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_9
    :pswitch_3
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 967
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 968
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0093

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 970
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 974
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_4
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 975
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHspaDataDistinguishable:Z

    if-eqz v10, :cond_a

    .line 976
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_H:Lcom/mediatek/systemui/ext/DataType;

    .line 977
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0094

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 980
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_a
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 981
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0093

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 984
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 986
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_5
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 987
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHspaDataDistinguishable:Z

    if-eqz v10, :cond_b

    .line 988
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_H_PLUS:Lcom/mediatek/systemui/ext/DataType;

    .line 989
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0094

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 992
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_b
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 993
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0093

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 996
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 999
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_6
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1000
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    .line 1001
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0096

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1003
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 1005
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_7
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1006
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    .line 1007
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0096

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1009
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 1014
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_8
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1015
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 1016
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0093

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1018
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 1020
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_9
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    .line 1021
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0095

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1023
    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 1031
    .end local v2           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v7           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_c
    sget-object v5, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1032
    sget-object v7, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 1033
    .restart local v7       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v11, 0x7f0b0093

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_2

    .line 1055
    .restart local v0       #iconList:[I
    .restart local v3       #tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v6       #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    :cond_d
    invoke-static {v8, v7}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I

    move-result-object v0

    .line 1056
    const/4 v10, 0x0

    aget-object v10, v3, v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1057
    const/4 v10, 0x0

    aget-object v10, v3, v10

    const/4 v11, 0x0

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1058
    const/4 v10, 0x1

    aget-object v10, v3, v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1059
    const/4 v10, 0x1

    aget-object v10, v3, v10

    const/4 v11, 0x1

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1060
    const/4 v10, 0x2

    aget-object v10, v3, v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1061
    const/4 v10, 0x2

    aget-object v10, v3, v10

    const/4 v11, 0x2

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1062
    const/4 v10, 0x3

    aget-object v10, v3, v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1063
    const/4 v10, 0x3

    aget-object v10, v3, v10

    const/4 v11, 0x3

    aget v11, v0, v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1064
    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1065
    aget v10, v0, v1

    invoke-virtual {v6, v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_3

    .line 946
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_6
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_8
        :pswitch_9
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method private final updateSimState(ILandroid/content/Intent;)V
    .locals 4
    .parameter "slotId"
    .parameter "intent"

    .prologue
    .line 637
    const/4 v2, 0x0

    .line 639
    .local v2, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    const-string v3, "ss"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 640
    .local v1, stateExtra:Ljava/lang/String;
    const-string v3, "ABSENT"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 641
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->ABSENT:Lcom/android/internal/telephony/IccCardConstants$State;

    .line 657
    :goto_0
    if-eqz v2, :cond_0

    .line 658
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aput-object v2, v3, p1

    .line 660
    :cond_0
    return-void

    .line 642
    :cond_1
    const-string v3, "READY"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 643
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 644
    :cond_2
    const-string v3, "LOCKED"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 645
    const-string v3, "reason"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 646
    .local v0, lockedReason:Ljava/lang/String;
    const-string v3, "PIN"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 647
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->PIN_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 648
    :cond_3
    const-string v3, "PUK"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 649
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->PUK_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 651
    :cond_4
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->NETWORK_LOCKED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 654
    .end local v0           #lockedReason:Ljava/lang/String;
    :cond_5
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->UNKNOWN:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0
.end method

.method private final updateTelephonySignalStrength()V
    .locals 2

    .prologue
    .line 691
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 692
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 691
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 694
    :cond_0
    return-void
.end method

.method private final updateTelephonySignalStrength(I)V
    .locals 28
    .parameter "slotId"

    .prologue
    .line 697
    const/4 v6, 0x0

    .line 699
    .local v6, handled:Z
    const/16 v20, 0x1

    .line 700
    .local v20, tempSIMCUSignVisible:Z
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v19, v0

    const/16 v24, 0x0

    new-instance v25, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v25, v19, v24

    const/16 v24, 0x1

    new-instance v25, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v25, v19, v24

    .line 701
    .local v19, tempPhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v17, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v17 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 702
    .local v17, tempDataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const/16 v21, 0x0

    .line 703
    .local v21, tempServiceState:Landroid/telephony/ServiceState;
    const/16 v22, 0x0

    .line 704
    .local v22, tempSignalStrength:Landroid/telephony/SignalStrength;
    const-string v15, ""

    .line 705
    .local v15, tempContentDescriptionPhoneSignal:Ljava/lang/String;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [I

    move-object/from16 v18, v0

    fill-array-data v18, :array_0

    .line 707
    .local v18, tempLastSignalLevel:[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    move-object/from16 v24, v0

    aget-object v22, v24, p1

    .line 708
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    move-object/from16 v24, v0

    aget-object v21, v24, p1

    .line 711
    if-nez v6, :cond_0

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v24

    if-nez v24, :cond_0

    .line 712
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), is null signal."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 713
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v12

    .line 714
    .local v12, resId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v12, v0, :cond_7

    .line 715
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 716
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 717
    const/16 v20, 0x0

    .line 723
    :goto_0
    const/4 v6, 0x1

    .line 724
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), null signal"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    .end local v12           #resId:I
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    move/from16 v24, v0

    if-nez v24, :cond_1

    .line 728
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), the SIMs initialization of framework has not been ready."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 730
    const/4 v6, 0x1

    .line 735
    :cond_1
    if-nez v6, :cond_2

    if-eqz v21, :cond_2

    .line 736
    invoke-virtual/range {v21 .. v21}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v11

    .line 737
    .local v11, regState:I
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), regState="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    const/16 v24, 0x2

    move/from16 v0, v24

    if-ne v11, v0, :cond_2

    .line 739
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, " searching state hasService= "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthSearchingIconGemini(I)I

    move-result v12

    .line 741
    .restart local v12       #resId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v12, v0, :cond_8

    .line 742
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 743
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 748
    :goto_1
    const/4 v6, 0x1

    .line 749
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), searching"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 753
    .end local v11           #regState:I
    .end local v12           #resId:I
    :cond_2
    if-nez v6, :cond_4

    if-eqz v21, :cond_3

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v24

    if-nez v24, :cond_4

    invoke-virtual/range {v21 .. v21}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v24

    if-nez v24, :cond_4

    .line 755
    :cond_3
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ") tempServiceState = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 756
    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v24

    if-eqz v24, :cond_4

    .line 757
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "SimIndicatorState = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 758
    const/16 v24, 0x1

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_4

    .line 759
    const/16 v20, 0x1

    .line 760
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 761
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201d7

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 762
    const/16 v24, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 763
    const v24, 0x7f0201d7

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 764
    const/4 v6, 0x1

    .line 769
    :cond_4
    if-nez v6, :cond_5

    .line 770
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v7

    .line 771
    .local v7, hasService:Z
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), hasService="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    if-nez v7, :cond_a

    .line 776
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v12

    .line 777
    .restart local v12       #resId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v12, v0, :cond_9

    .line 778
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 779
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 780
    const/16 v20, 0x0

    .line 890
    .end local v7           #hasService:Z
    .end local v12           #resId:I
    :cond_5
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v24, v0

    invoke-virtual/range {v17 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v25

    aput-object v25, v24, p1

    .line 891
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    move-object/from16 v24, v0

    aput-object v15, v24, p1

    .line 892
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v24, v0

    aget-object v24, v24, p1

    const/16 v25, 0x0

    const/16 v26, 0x0

    aget-object v26, v19, v26

    invoke-virtual/range {v26 .. v26}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v26

    aput-object v26, v24, v25

    .line 893
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v24, v0

    aget-object v24, v24, p1

    const/16 v25, 0x1

    const/16 v26, 0x1

    aget-object v26, v19, v26

    invoke-virtual/range {v26 .. v26}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v26

    aput-object v26, v24, v25

    .line 895
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, " updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ") tempSIMCUSignVisible= "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 896
    const/16 v24, 0x0

    aget-object v24, v19, v24

    invoke-virtual/range {v24 .. v24}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v24

    const/16 v25, -0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_6

    .line 897
    const/16 v20, 0x0

    .line 899
    :cond_6
    return-void

    .line 719
    .restart local v12       #resId:I
    :cond_7
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 720
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201ed

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_0

    .line 745
    .restart local v11       #regState:I
    :cond_8
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 746
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201ee

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_1

    .line 782
    .end local v11           #regState:I
    .restart local v7       #hasService:Z
    :cond_9
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 783
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201ed

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 784
    const/16 v24, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 785
    const v24, 0x7f0201d8

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_2

    .line 788
    .end local v12           #resId:I
    :cond_a
    if-nez v22, :cond_b

    .line 792
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 793
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201d8

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 794
    const/16 v24, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 795
    const v24, 0x7f0201d8

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 796
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    sget-object v25, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    const/16 v26, 0x0

    aget v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    goto/16 :goto_2

    .line 799
    :cond_b
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v8, v0, [I

    fill-array-data v8, :array_1

    .line 800
    .local v8, iconLevel:[I
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v9, v0, [[I

    const/16 v24, 0x0

    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [I

    move-object/from16 v25, v0

    aput-object v25, v9, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [I

    move-object/from16 v25, v0

    aput-object v25, v9, v24

    .line 801
    .local v9, iconList:[[I
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v24

    if-eqz v24, :cond_11

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    move/from16 v24, v0

    if-eqz v24, :cond_11

    .line 802
    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getCdmaLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    .line 803
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "mAlwaysShowCdmaRssi="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    move/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " set to cdmaLevel="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v26, v26, v27

    invoke-virtual/range {v26 .. v26}, Landroid/telephony/SignalStrength;->getCdmaLevel()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " instead of level="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v26, v26, v27

    invoke-virtual/range {v26 .. v26}, Landroid/telephony/SignalStrength;->getLevel()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 809
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v24, v0

    aget-object v16, v24, p1

    .line 811
    .local v16, tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    sget-object v24, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_c

    .line 812
    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getEvdoLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    .line 813
    const/16 v24, 0x1

    const/16 v25, 0x1

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getCdmaLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    .line 814
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, " CT SlotId ("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ") two signal strength : tempLastSignalLevel[0] = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const/16 v26, 0x0

    aget v26, v18, v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "  tempLastSignalLevel[1] = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const/16 v26, 0x1

    aget v26, v18, v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 824
    :cond_c
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v24

    if-eqz v24, :cond_12

    .line 825
    invoke-virtual/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdmaEri(I)Z

    move-result v10

    .line 830
    .local v10, isRoaming:Z
    :goto_4
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), isRoaming="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ", mInetCondition="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    move/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 832
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v14

    .line 833
    .local v14, simColorId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v14, v0, :cond_6

    .line 837
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), simColorId="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 838
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    const/16 v25, 0x0

    aget v25, v8, v25

    const/16 v26, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-interface {v0, v14, v1, v2}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthIconGemini(IIZ)I

    move-result v13

    .line 840
    .local v13, signalIcon:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v13, v0, :cond_13

    .line 841
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 843
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 853
    :cond_d
    :goto_5
    sget-object v24, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_f

    .line 854
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    const/16 v25, 0x0

    const/16 v26, 0x0

    aget v26, v8, v26

    const/16 v27, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-interface {v0, v14, v1, v2, v3}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthIconGemini(IIIZ)I

    move-result v23

    .line 856
    .local v23, upSignalIcon:I
    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_e

    .line 857
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 859
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 861
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    const/16 v25, 0x1

    const/16 v26, 0x1

    aget v26, v8, v26

    const/16 v27, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-interface {v0, v14, v1, v2, v3}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthIconGemini(IIIZ)I

    move-result v5

    .line 863
    .local v5, downSignalIcon:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v5, v0, :cond_f

    .line 864
    const/16 v24, 0x1

    aget-object v24, v19, v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 866
    const/16 v24, 0x1

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 870
    .end local v5           #downSignalIcon:I
    .end local v23           #upSignalIcon:I
    :cond_f
    const-string v24, "NetworkControllerGemini"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "updateTelephonySignalStrength("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "), tempDataNetType = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " , simColorId="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "  tempPhoneSignalIconId[0] = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const/16 v26, 0x0

    aget-object v26, v19, v26

    invoke-virtual/range {v26 .. v26}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "  tempPhoneSignalIconId[1] = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const/16 v26, 0x1

    aget-object v26, v19, v26

    invoke-virtual/range {v26 .. v26}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 875
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    const/16 v25, 0x0

    aget v25, v8, v25

    invoke-interface/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthDescription(I)Ljava/lang/String;

    move-result-object v4

    .line 876
    .local v4, desc:Ljava/lang/String;
    if-eqz v4, :cond_14

    .line 877
    move-object v15, v4

    .line 884
    :cond_10
    :goto_6
    const/16 v24, 0x0

    aget-object v24, v19, v24

    invoke-virtual/range {v24 .. v24}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v17

    goto/16 :goto_2

    .line 807
    .end local v4           #desc:Ljava/lang/String;
    .end local v10           #isRoaming:Z
    .end local v13           #signalIcon:I
    .end local v14           #simColorId:I
    .end local v16           #tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    :cond_11
    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    goto/16 :goto_3

    .line 828
    .restart local v16       #tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v10

    .restart local v10       #isRoaming:Z
    goto/16 :goto_4

    .line 845
    .restart local v13       #signalIcon:I
    .restart local v14       #simColorId:I
    :cond_13
    const/16 v24, 0x0

    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-static {v14, v0}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalStrengthIconList(IZ)[I

    move-result-object v25

    aput-object v25, v9, v24

    .line 846
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 847
    const/16 v24, 0x0

    aget v24, v8, v24

    const/16 v25, 0x5

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_d

    .line 848
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    aget-object v25, v9, v25

    const/16 v26, 0x0

    aget v26, v8, v26

    aget v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_5

    .line 879
    .restart local v4       #desc:Ljava/lang/String;
    :cond_14
    const/16 v24, 0x0

    aget v24, v8, v24

    const/16 v25, 0x5

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_10

    .line 880
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    sget-object v25, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    const/16 v26, 0x0

    aget v26, v8, v26

    aget v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    goto :goto_6

    .line 705
    nop

    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data

    .line 799
    :array_1
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private updateWifiIcons()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 1393
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v1, :cond_0

    .line 1394
    sget-object v0, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_SIGNAL_STRENGTH:[[I

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    .line 1395
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIFI_CONNECTION_STRENGTH:[I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    .line 1405
    :goto_0
    return-void

    .line 1398
    :cond_0
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataAndWifiStacked:Z

    if-eqz v1, :cond_1

    .line 1399
    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    .line 1403
    :goto_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v1, 0x7f0b0088

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    goto :goto_0

    .line 1401
    :cond_1
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    if-eqz v1, :cond_2

    const v0, 0x7f020230

    :cond_2
    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    goto :goto_1
.end method

.method private updateWifiState(Landroid/content/Intent;)V
    .locals 11
    .parameter "intent"

    .prologue
    const/4 v10, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 1340
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1341
    .local v0, action:Ljava/lang/String;
    const-string v9, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1342
    const-string v9, "wifi_state"

    const/4 v10, 0x4

    invoke-virtual {p1, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    const/4 v10, 0x3

    if-ne v9, v10, :cond_1

    :goto_0
    iput-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    .line 1386
    :cond_0
    :goto_1
    const-string v7, "NetworkControllerGemini"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateWifiState: mWifiLevel = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "  mWifiRssi="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiRssi:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " mWifiConnected is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1389
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiIcons()V

    .line 1390
    return-void

    :cond_1
    move v7, v8

    .line 1342
    goto :goto_0

    .line 1344
    :cond_2
    const-string v9, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 1345
    const-string v9, "networkInfo"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/net/NetworkInfo;

    .line 1347
    .local v2, networkInfo:Landroid/net/NetworkInfo;
    iget-boolean v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    .line 1348
    .local v5, wasConnected:Z
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_5

    :goto_2
    iput-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    .line 1350
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v7, :cond_7

    if-nez v5, :cond_7

    .line 1352
    const-string v7, "wifiInfo"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiInfo;

    .line 1353
    .local v1, info:Landroid/net/wifi/WifiInfo;
    if-nez v1, :cond_3

    .line 1354
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 1356
    :cond_3
    if-eqz v1, :cond_6

    .line 1357
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->huntForSsid(Landroid/net/wifi/WifiInfo;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    .line 1367
    .end local v1           #info:Landroid/net/wifi/WifiInfo;
    :cond_4
    :goto_3
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v7, :cond_0

    .line 1368
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v6

    .line 1371
    .local v6, wifiInfo:Landroid/net/wifi/WifiInfo;
    if-eqz v6, :cond_0

    .line 1372
    invoke-virtual {v6}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v3

    .line 1373
    .local v3, newRssi:I
    sget v7, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_LEVEL_COUNT:I

    invoke-static {v3, v7}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v4

    .line 1375
    .local v4, newSignalLevel:I
    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    if-eq v4, v7, :cond_0

    .line 1376
    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    goto/16 :goto_1

    .end local v3           #newRssi:I
    .end local v4           #newSignalLevel:I
    .end local v6           #wifiInfo:Landroid/net/wifi/WifiInfo;
    :cond_5
    move v7, v8

    .line 1348
    goto :goto_2

    .line 1359
    .restart local v1       #info:Landroid/net/wifi/WifiInfo;
    :cond_6
    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    goto :goto_3

    .line 1361
    .end local v1           #info:Landroid/net/wifi/WifiInfo;
    :cond_7
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-nez v7, :cond_4

    .line 1362
    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    goto :goto_3

    .line 1380
    .end local v2           #networkInfo:Landroid/net/NetworkInfo;
    .end local v5           #wasConnected:Z
    :cond_8
    const-string v7, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1381
    const-string v7, "newRssi"

    const/16 v8, -0xc8

    invoke-virtual {p1, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiRssi:I

    .line 1382
    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiRssi:I

    sget v8, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_LEVEL_COUNT:I

    invoke-static {v7, v8}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v7

    iput v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    goto/16 :goto_1
.end method

.method private updateWimaxIcons()V
    .locals 3

    .prologue
    .line 1448
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    if-eqz v0, :cond_2

    .line 1449
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-eqz v0, :cond_1

    .line 1450
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    if-eqz v0, :cond_0

    .line 1451
    sget v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_IDLE:I

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    .line 1455
    :goto_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIMAX_CONNECTION_STRENGTH:[I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    .line 1464
    :goto_1
    return-void

    .line 1453
    :cond_0
    sget-object v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_SIGNAL_STRENGTH:[[I

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    goto :goto_0

    .line 1458
    :cond_1
    sget v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_DISCONNECTED:I

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    .line 1459
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v1, 0x7f0b008d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    goto :goto_1

    .line 1462
    :cond_2
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    goto :goto_1
.end method

.method private final updateWimaxState(Landroid/content/Intent;)V
    .locals 7
    .parameter "intent"

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1424
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1425
    .local v0, action:Ljava/lang/String;
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    .line 1426
    .local v1, wasConnected:Z
    const-string v5, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1427
    const-string v5, "4g_state"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 1429
    .local v2, wimaxStatus:I
    const/4 v5, 0x3

    if-ne v2, v5, :cond_1

    :goto_0
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    .line 1443
    .end local v2           #wimaxStatus:I
    :cond_0
    :goto_1
    invoke-direct {p0, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 1444
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxIcons()V

    .line 1445
    return-void

    .restart local v2       #wimaxStatus:I
    :cond_1
    move v3, v4

    .line 1429
    goto :goto_0

    .line 1431
    .end local v2           #wimaxStatus:I
    :cond_2
    const-string v5, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1432
    const-string v3, "newSignalLevel"

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    goto :goto_1

    .line 1433
    :cond_3
    const-string v5, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1434
    const-string v5, "WimaxState"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    .line 1436
    const-string v5, "WimaxStateDetail"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    .line 1439
    iget v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    const/4 v6, 0x7

    if-ne v5, v6, :cond_4

    move v5, v3

    :goto_2
    iput-boolean v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    .line 1441
    iget v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    const/4 v6, 0x6

    if-ne v5, v6, :cond_5

    :goto_3
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    goto :goto_1

    :cond_4
    move v5, v4

    .line 1439
    goto :goto_2

    :cond_5
    move v3, v4

    .line 1441
    goto :goto_3
.end method


# virtual methods
.method public addCombinedLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 404
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 405
    return-void
.end method

.method public addCombinedSignalIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 396
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 397
    return-void
.end method

.method public addDataDirectionIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 380
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 381
    return-void
.end method

.method public addDataDirectionOverlayIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 384
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    return-void
.end method

.method public addDataTypeIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 400
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 401
    return-void
.end method

.method public addEmergencyLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 416
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 417
    return-void
.end method

.method public addMobileLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 408
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 409
    return-void
.end method

.method public addPhoneSignalIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 376
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    return-void
.end method

.method public addSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;)V
    .locals 1
    .parameter "cluster"

    .prologue
    .line 420
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 421
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;)V

    .line 422
    return-void
.end method

.method public addWifiIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 388
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 389
    return-void
.end method

.method public addWifiLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 412
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 413
    return-void
.end method

.method public addWimaxIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 392
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 7
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 2203
    const-string v1, "NetworkControllerGemini state:"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2204
    const-string v2, "  %s network type %d (%s)"

    const/4 v1, 0x3

    new-array v3, v1, [Ljava/lang/Object;

    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    if-eqz v1, :cond_0

    const-string v1, "CONNECTED"

    :goto_0
    aput-object v1, v3, v4

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v5

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkTypeName:Ljava/lang/String;

    aput-object v1, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2207
    const-string v1, "------ telephony ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2209
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_1

    .line 2210
    const-string v1, "====== SlotId: %d ======"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2211
    const-string v1, "  hasService ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2212
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2213
    const-string v1, "  mDataConnected ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2214
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    aget-boolean v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2215
    const-string v1, "  mSimState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2216
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2217
    const-string v1, "  mDataState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2218
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2219
    const-string v1, "  mDataActivity ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2220
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2221
    const-string v1, "  mDataNetType ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2222
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 2223
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2224
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    aget v1, v1, v0

    invoke-static {v1}, Landroid/telephony/TelephonyManager;->getNetworkTypeName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2225
    const-string v1, "  mServiceState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2226
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2227
    const-string v1, "  mSignalStrength ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2228
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2229
    const-string v1, "  mNetworkName ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2230
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2231
    const-string v1, "  mPhoneSignalIconId =0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2232
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2233
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2234
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2235
    const-string v1, "  mDataDirectionIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2236
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    aget v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2237
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2238
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2239
    const-string v1, "  mDataSignalIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2240
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2241
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2242
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2243
    const-string v1, "  mDataTypeIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2244
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2245
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2246
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2248
    const-string v1, "  mLastPhoneSignalIconId[0]=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2249
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v4

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2250
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2251
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v4

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2252
    const-string v1, "  mLastPhoneSignalIconId[1]=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2253
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v5

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2254
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2255
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v5

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2257
    const-string v1, "  mLastDataTypeIconId =0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2258
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    aget v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2259
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2260
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2209
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 2204
    .end local v0           #i:I
    :cond_0
    const-string v1, "DISCONNECTED"

    goto/16 :goto_0

    .line 2263
    .restart local v0       #i:I
    :cond_1
    const-string v1, "------ wifi ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2264
    const-string v1, "  mWifiEnabled="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2265
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2266
    const-string v1, "  mWifiConnected="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2267
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2268
    const-string v1, "  mWifiRssi="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2269
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiRssi:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2270
    const-string v1, "  mWifiLevel="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2271
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2272
    const-string v1, "  mWifiSsid="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2273
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2274
    const-string v1, "  mWifiIconId=0x%08x/%s"

    new-array v2, v6, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2276
    const-string v1, "  mWifiActivity="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2277
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2279
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    if-eqz v1, :cond_2

    .line 2280
    const-string v1, "------ wimax ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2281
    const-string v1, "  mIsWimaxEnabled="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2282
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2283
    const-string v1, "  mWimaxConnected="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2284
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2285
    const-string v1, "  mWimaxIdle="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2286
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2287
    const-string v1, "  mWimaxIconId=0x%08x/%s"

    new-array v2, v6, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2289
    const-string v1, "  mWimaxSignal=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2290
    const-string v1, "  mWimaxState=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2291
    const-string v1, "  mWimaxExtraState=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2294
    :cond_2
    const-string v1, "------ Bluetooth ----"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2295
    const-string v1, "  mBtReverseTethered="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2296
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2298
    const-string v1, "------ connectivity ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2299
    const-string v1, "  mInetCondition="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2300
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2302
    const-string v1, "------ icons ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2303
    const-string v1, "  mLastDataDirectionIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2304
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2305
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2306
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2307
    const-string v1, "  mLastDataDirectionOverlayIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2308
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2309
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2310
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2311
    const-string v1, "  mLastWifiIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2312
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2313
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2314
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2315
    const-string v1, "  mLastCombinedSignalIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2316
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2317
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2318
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2319
    const-string v1, "  mLastCombinedLabel="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2320
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2321
    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2322
    return-void
.end method

.method public hasMobileDataFeature()Z
    .locals 1

    .prologue
    .line 368
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    return v0
.end method

.method public hideSimIndicator(I)V
    .locals 3
    .parameter "slotId"

    .prologue
    .line 2470
    const-string v0, "NetworkControllerGemini"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hideSimIndicator slotId is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2471
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1

    .line 2472
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 2473
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 2474
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 2475
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 2476
    return-void
.end method

.method isCdmaEri(I)Z
    .locals 5
    .parameter "slotId"

    .prologue
    const/4 v3, 0x1

    .line 1083
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v2, v4, p1

    .line 1085
    .local v2, tempServiceState:Landroid/telephony/ServiceState;
    if-eqz v2, :cond_1

    .line 1086
    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getCdmaEriIconIndex()I

    move-result v0

    .line 1087
    .local v0, iconIndex:I
    if-eq v0, v3, :cond_1

    .line 1088
    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getCdmaEriIconMode()I

    move-result v1

    .line 1089
    .local v1, iconMode:I
    if-eqz v1, :cond_0

    if-ne v1, v3, :cond_1

    .line 1095
    .end local v0           #iconIndex:I
    .end local v1           #iconMode:I
    :cond_0
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public isEmergencyOnly()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 372
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v11, 0x1

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 465
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    .line 466
    .local v6, action:Ljava/lang/String;
    const-string v0, "NetworkControllerGemini"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive, intent action is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    const-string v0, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 470
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiState(Landroid/content/Intent;)V

    .line 471
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    .line 552
    :cond_1
    :goto_0
    return-void

    .line 472
    :cond_2
    const-string v0, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 473
    const-string v0, "simId"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 474
    .local v1, slotId:I
    invoke-static {}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSimInsertedStatus()V

    .line 475
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 476
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 477
    invoke-direct {p0, v1, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateSimState(ILandroid/content/Intent;)V

    .line 478
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 479
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    goto :goto_0

    .line 480
    .end local v1           #slotId:I
    :cond_3
    const-string v0, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 481
    const-string v0, "simId"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 482
    .restart local v1       #slotId:I
    const-string v0, "showSpn"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    const-string v0, "spn"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "showPlmn"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    const-string v0, "plmn"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateNetworkName(IZLjava/lang/String;ZLjava/lang/String;)V

    .line 487
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    goto :goto_0

    .line 488
    .end local v1           #slotId:I
    :cond_4
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "android.net.conn.INET_CONDITION_ACTION"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 490
    :cond_5
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 491
    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/NetworkInfo;

    .line 492
    .local v7, info:Landroid/net/NetworkInfo;
    if-nez v7, :cond_6

    .line 493
    const-string v0, "NetworkControllerGemini"

    const-string v2, "onReceive, ConnectivityManager.CONNECTIVITY_ACTION networkinfo is null."

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 496
    :cond_6
    invoke-virtual {v7}, Landroid/net/NetworkInfo;->getType()I

    move-result v10

    .line 497
    .local v10, type:I
    const-string v0, "NetworkControllerGemini"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive, ConnectivityManager.CONNECTIVITY_ACTION network type is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    if-eq v10, v5, :cond_7

    if-eqz v10, :cond_7

    const/4 v0, 0x7

    if-eq v10, v0, :cond_7

    if-eq v10, v11, :cond_7

    const/16 v0, 0x9

    if-ne v10, v0, :cond_1

    .line 504
    .end local v7           #info:Landroid/net/NetworkInfo;
    .end local v10           #type:I
    :cond_7
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateConnectivity(Landroid/content/Intent;)V

    .line 505
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 506
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 507
    :cond_8
    const-string v0, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 508
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 509
    :cond_9
    const-string v0, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 510
    :cond_a
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateAirplaneMode()V

    .line 511
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 512
    :cond_b
    const-string v0, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 515
    :cond_c
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxState(Landroid/content/Intent;)V

    .line 516
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 517
    :cond_d
    const-string v0, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 518
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 519
    const-string v0, "type"

    invoke-virtual {p2, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    .line 520
    .restart local v10       #type:I
    const-string v0, "simid"

    const-wide/16 v2, -0x1

    invoke-virtual {p2, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    .line 521
    .local v8, simId:J
    if-ne v10, v11, :cond_e

    .line 523
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    .line 524
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength()V

    .line 525
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 527
    :cond_e
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 528
    .end local v8           #simId:J
    .end local v10           #type:I
    :cond_f
    const-string v0, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 529
    const-string v0, "slotId"

    invoke-virtual {p2, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 530
    .restart local v1       #slotId:I
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 531
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 532
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 533
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 534
    .end local v1           #slotId:I
    :cond_10
    const-string v0, "android.intent.action.SIM_INSERTED_STATUS"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 535
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 536
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    .line 537
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength()V

    .line 538
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 539
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 540
    :cond_11
    const-string v0, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 541
    const-string v0, "NetworkControllerGemini"

    const-string v2, "onReceive from TelephonyIntents.ACTION_SIM_INFO_UPDATE"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    .line 543
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 544
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    .line 545
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength()V

    .line 546
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 547
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_0

    .line 548
    :cond_12
    const-string v0, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 549
    const-string v0, "NetworkControllerGemini"

    const-string v2, "onReceive from android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    goto/16 :goto_0
.end method

.method public refreshSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;)V
    .locals 8
    .parameter "cluster"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 425
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    invoke-interface {p1, v0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setRoamingFlagandResource([Z[I)V

    .line 426
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-nez v0, :cond_2

    :cond_0
    move v0, v2

    :goto_0
    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    iget v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    invoke-interface {p1, v0, v3, v4, v5}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setWifiIndicators(ZIILjava/lang/String;)V

    .line 431
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-eqz v0, :cond_4

    .line 433
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v0, v1

    :goto_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v5, v0, v1

    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v7, v0, v1

    move-object v0, p1

    invoke-interface/range {v0 .. v7}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    :cond_1
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    invoke-interface {p1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setIsAirplaneMode(Z)V

    .line 455
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    .line 456
    invoke-interface {p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->apply()V

    .line 457
    return-void

    :cond_2
    move v0, v1

    .line 426
    goto :goto_0

    .line 433
    :cond_3
    const/4 v0, 0x2

    new-array v3, v0, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v0, Lcom/mediatek/systemui/ext/IconIdWrapper;

    iget v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    invoke-direct {v0, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v0, v3, v1

    new-instance v0, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v0, v3, v2

    goto :goto_1

    .line 443
    :cond_4
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    iget v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v1, v0, :cond_1

    .line 444
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v5, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    aget-object v6, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v7, v0, v1

    move-object v0, p1

    invoke-interface/range {v0 .. v7}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method refreshViews()V
    .locals 2

    .prologue
    .line 1515
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 1516
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 1515
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1518
    :cond_0
    return-void
.end method

.method refreshViews(I)V
    .locals 44
    .parameter "slotId"

    .prologue
    .line 1521
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    .line 1523
    .local v15, context:Landroid/content/Context;
    new-instance v14, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1524
    .local v14, combinedSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1525
    .local v12, combinedActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const-string v13, ""

    .line 1526
    .local v13, combinedLabel:Ljava/lang/String;
    const-string v41, ""

    .line 1527
    .local v41, wifiLabel:Ljava/lang/String;
    const-string v24, ""

    .line 1529
    .local v24, mobileLabel:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isEmergencyOnly()Z

    move-result v17

    .line 1536
    .local v17, emergencyOnly:Z
    new-instance v31, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1537
    .local v31, tempDataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const/4 v3, 0x2

    new-array v5, v3, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v3, 0x0

    new-instance v4, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v4, v5, v3

    const/4 v3, 0x1

    new-instance v4, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v4, v5, v3

    .line 1539
    .local v5, tempPhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    const-string v8, ""

    .line 1540
    .local v8, tempContentDescriptionPhoneSignal:Ljava/lang/String;
    const-string v9, ""

    .line 1541
    .local v9, tempContentDescriptionDataType:Ljava/lang/String;
    const-string v26, ""

    .line 1543
    .local v26, tempContentDescriptionCombinedSignal:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v38, v3, p1

    .line 1544
    .local v38, tempSignalStrength:Landroid/telephony/SignalStrength;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v37, v3, p1

    .line 1545
    .local v37, tempServiceState:Landroid/telephony/ServiceState;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    aget-boolean v28, v3, p1

    .line 1546
    .local v28, tempDataConnected:Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    aget v27, v3, p1

    .line 1547
    .local v27, tempDataActivity:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v30, v3, p1

    .line 1548
    .local v30, tempDataNetType3G:Lcom/mediatek/systemui/ext/NetworkType;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v31

    .line 1549
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    aget-object v8, v3, p1

    .line 1550
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v9, v3, p1

    .line 1551
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v42, 0x0

    aget-object v4, v4, v42

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1552
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v42, 0x1

    aget-object v4, v4, v42

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1553
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    aget-object v35, v3, p1

    .line 1555
    .local v35, tempNetworkName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-nez v3, :cond_7

    .line 1556
    const/4 v3, 0x0

    move-object/from16 v0, v31

    invoke-virtual {v0, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1557
    const/4 v3, 0x0

    move-object/from16 v0, v31

    invoke-virtual {v0, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1558
    const/4 v3, 0x0

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1559
    const/4 v3, 0x0

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1560
    const/4 v3, 0x1

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1561
    const/4 v3, 0x1

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1562
    const-string v24, ""

    .line 1653
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_14

    .line 1654
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    if-nez v3, :cond_13

    .line 1655
    const v3, 0x7f0b00a7

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 1656
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    .line 1679
    :goto_0
    move-object/from16 v13, v41

    .line 1680
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1681
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1682
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1683
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1684
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v26, v0

    .line 1693
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    if-eqz v3, :cond_1

    .line 1694
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v4, 0x7f0b005c

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1695
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1696
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTetherIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1697
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v4, 0x7f0b009a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 1701
    :cond_1
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_16

    const/16 v18, 0x1

    .line 1702
    .local v18, ethernetConnected:Z
    :goto_2
    if-eqz v18, :cond_2

    .line 1704
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkTypeName:Ljava/lang/String;

    .line 1707
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    if-eqz v3, :cond_19

    if-eqz v37, :cond_3

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_19

    invoke-virtual/range {v37 .. v37}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v3

    if-nez v3, :cond_19

    .line 1712
    :cond_3
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), AirplaneMode="

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    move/from16 v42, v0

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1713
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v4, 0x7f0b009b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1714
    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1715
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1716
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const v4, 0x7f0201d7

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1717
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v31

    .line 1718
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    aget-object v3, v3, v4

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1719
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    aget-object v3, v3, v4

    const v4, 0x7f0201d7

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1720
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1721
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1725
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_17

    .line 1727
    const-string v24, ""

    .line 1810
    :cond_5
    :goto_3
    new-instance v7, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1811
    .local v7, tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1812
    .local v6, tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    aget v29, v3, p1

    .line 1813
    .local v29, tempDataDirectionIconId:I
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v42, 0x0

    aget-object v4, v4, v42

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1814
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v42, 0x1

    aget-object v4, v4, v42

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1815
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v7

    .line 1816
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v6

    .line 1846
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v34, v3, p1

    .line 1847
    .local v34, tempLastPhoneSignalIconId:[I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    aget v32, v3, p1

    .line 1848
    .local v32, tempLastDataTypeIconId:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    aget v33, v3, p1

    .line 1850
    .local v33, tempLastMobileActivityIconId:I
    const/4 v3, 0x0

    aget v3, v34, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_6

    const/4 v3, 0x1

    aget v3, v34, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_6

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_6

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    if-ne v3, v4, :cond_6

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    if-ne v3, v4, :cond_6

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v32

    if-ne v0, v3, :cond_6

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v33

    if-ne v0, v3, :cond_6

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    if-eq v3, v4, :cond_24

    .line 1859
    :cond_6
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), set parameters to signal cluster view."

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1861
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;

    .line 1862
    .local v2, cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    move/from16 v42, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v43, v0

    move/from16 v0, v42

    move-object/from16 v1, v43

    invoke-interface {v2, v3, v4, v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setWifiIndicators(ZIILjava/lang/String;)V

    .line 1868
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), tempPhoneSignalIconId.0 = "

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v42, 0x0

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "  tempPhoneSignalIconId.1 = "

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v42, 0x1

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "  tempMobileActivityIconId= "

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "  tempDataTypeIconId= "

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1872
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    move/from16 v3, p1

    invoke-interface/range {v2 .. v9}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 1880
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    invoke-interface {v2, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setIsAirplaneMode(Z)V

    .line 1881
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    goto/16 :goto_4

    .line 1571
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v7           #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v18           #ethernetConnected:Z
    .end local v21           #i$:Ljava/util/Iterator;
    .end local v29           #tempDataDirectionIconId:I
    .end local v32           #tempLastDataTypeIconId:I
    .end local v33           #tempLastMobileActivityIconId:I
    .end local v34           #tempLastPhoneSignalIconId:[I
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_d

    .line 1572
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    const/4 v4, 0x0

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_8

    .line 1573
    move-object/from16 v24, v35

    .line 1592
    :goto_5
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), DataConnected="

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v28

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1594
    if-eqz v28, :cond_11

    .line 1595
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move/from16 v0, p1

    invoke-static {v3, v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v25

    .line 1596
    .local v25, simColorId:I
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, ")"

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, " simColorId = "

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1597
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1598
    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1599
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    const/4 v4, 0x0

    move/from16 v0, v25

    invoke-interface {v3, v0, v4}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataActivityIconList(IZ)[I

    move-result-object v22

    .line 1600
    .local v22, iconList:[I
    if-eqz v22, :cond_f

    .line 1601
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1602
    aget v3, v22, v27

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1621
    :goto_6
    move-object/from16 v13, v24

    .line 1622
    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v12

    .line 1623
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1624
    move-object/from16 v26, v9

    .line 1625
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v3, p1

    .line 1628
    const/16 v20, 0x0

    .local v20, i:I
    :goto_7
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v0, v20

    if-ge v0, v3, :cond_0

    .line 1629
    move/from16 v0, v20

    move/from16 v1, p1

    if-ne v0, v1, :cond_10

    .line 1630
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), mMobileActivityIconId="

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v42, v0

    aget-object v42, v42, v20

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1628
    :goto_8
    add-int/lit8 v20, v20, 0x1

    goto :goto_7

    .line 1574
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v20           #i:I
    .end local v22           #iconList:[I
    .end local v25           #simColorId:I
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    if-nez v3, :cond_9

    if-eqz v17, :cond_c

    .line 1575
    :cond_9
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_a

    if-eqz v17, :cond_b

    .line 1576
    :cond_a
    move-object/from16 v24, v35

    goto/16 :goto_5

    .line 1578
    :cond_b
    const-string v24, ""

    goto/16 :goto_5

    .line 1581
    :cond_c
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v24

    goto/16 :goto_5

    .line 1585
    :cond_d
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 1586
    move-object/from16 v24, v35

    goto/16 :goto_5

    .line 1588
    :cond_e
    const-string v24, ""

    goto/16 :goto_5

    .line 1604
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v22       #iconList:[I
    .restart local v25       #simColorId:I
    :cond_f
    const/4 v3, 0x0

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1605
    packed-switch v27, :pswitch_data_0

    .line 1616
    const/4 v3, 0x0

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_6

    .line 1607
    :pswitch_0
    const v3, 0x7f02020d

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_6

    .line 1610
    :pswitch_1
    const v3, 0x7f020218

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_6

    .line 1613
    :pswitch_2
    const v3, 0x7f020212

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_6

    .line 1633
    .restart local v20       #i:I
    :cond_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v20

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1634
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v20

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1635
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), mMobileActivityIconId="

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v42, v0

    aget-object v42, v42, v20

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 1639
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v20           #i:I
    .end local v22           #iconList:[I
    .end local v25           #simColorId:I
    :cond_11
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1640
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1641
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1642
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1644
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_9
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v0, v20

    if-ge v0, v3, :cond_0

    .line 1645
    move/from16 v0, v20

    move/from16 v1, p1

    if-ne v0, v1, :cond_12

    .line 1644
    :goto_a
    add-int/lit8 v20, v20, 0x1

    goto :goto_9

    .line 1646
    :cond_12
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1647
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_a

    .line 1658
    .end local v20           #i:I
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    move-object/from16 v41, v0

    .line 1662
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    packed-switch v3, :pswitch_data_1

    goto/16 :goto_0

    .line 1673
    :pswitch_3
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1664
    :pswitch_4
    const v3, 0x7f020224

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1667
    :pswitch_5
    const v3, 0x7f020226

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1670
    :pswitch_6
    const v3, 0x7f020225

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1686
    :cond_14
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_15

    .line 1687
    const-string v41, ""

    goto/16 :goto_1

    .line 1689
    :cond_15
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v41

    goto/16 :goto_1

    .line 1701
    :cond_16
    const/16 v18, 0x0

    goto/16 :goto_2

    .line 1729
    .restart local v18       #ethernetConnected:Z
    :cond_17
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_18

    .line 1731
    const-string v41, ""

    .line 1736
    :goto_b
    move-object/from16 v26, v8

    .line 1737
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    goto/16 :goto_3

    .line 1733
    :cond_18
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 1734
    move-object/from16 v13, v41

    goto :goto_b

    .line 1740
    :cond_19
    if-nez v28, :cond_5

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-nez v3, :cond_5

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    if-nez v3, :cond_5

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-nez v3, :cond_5

    if-nez v18, :cond_5

    .line 1743
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1745
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_1f

    .line 1746
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_1d

    .line 1747
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1752
    :goto_c
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_1e

    move-object/from16 v26, v9

    .line 1777
    :goto_d
    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1778
    .local v11, cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aget-object v39, v3, p1

    .line 1779
    .local v39, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v11

    .line 1781
    const/16 v16, 0x0

    .line 1782
    .local v16, dataTypeIconId:I
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v3

    if-eqz v3, :cond_1a

    invoke-virtual/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdmaEri(I)Z

    move-result v3

    if-nez v3, :cond_1b

    :cond_1a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 1784
    :cond_1b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move/from16 v0, p1

    invoke-static {v3, v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v25

    .line 1785
    .restart local v25       #simColorId:I
    const/16 v36, 0x0

    .line 1787
    .local v36, tempRoamingId:I
    const/4 v3, -0x1

    move/from16 v0, v25

    if-le v0, v3, :cond_1c

    const/4 v3, 0x4

    move/from16 v0, v25

    if-ge v0, v3, :cond_1c

    .line 1788
    sget-object v3, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->ROAMING:[I

    aget v36, v3, v25

    .line 1790
    :cond_1c
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, ")  RoamingresId= "

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, " simColorId = "

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1791
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v4, 0x1

    aput-boolean v4, v3, p1

    .line 1792
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    aput v36, v3, p1

    .line 1798
    .end local v25           #simColorId:I
    .end local v36           #tempRoamingId:I
    :goto_e
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), dataTypeIconId="

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1799
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1800
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1802
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1803
    const-string v3, "NetworkControllerGemini"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v42, "refreshViews("

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, "), SimState="

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v42, ", mDataTypeIconId="

    move-object/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    move/from16 v0, v42

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1805
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v3, p1

    goto/16 :goto_3

    .line 1749
    .end local v11           #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v16           #dataTypeIconId:I
    .end local v39           #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    :cond_1d
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1750
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_c

    .line 1752
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v26, v0

    goto/16 :goto_d

    .line 1755
    :cond_1f
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_20

    .line 1756
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1757
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1758
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v26, v0

    goto/16 :goto_d

    .line 1760
    :cond_20
    const/4 v3, 0x1

    move/from16 v0, p1

    if-ne v0, v3, :cond_21

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    const/4 v4, 0x0

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_21

    .line 1761
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v13, v3, v4

    .line 1762
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1763
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v26, v3, v4

    goto/16 :goto_d

    .line 1764
    :cond_21
    if-nez p1, :cond_22

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    const/4 v4, 0x1

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_22

    .line 1765
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v13, v3, v4

    .line 1766
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1767
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v26, v3, v4

    goto/16 :goto_d

    .line 1769
    :cond_22
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1770
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1771
    move-object/from16 v26, v9

    goto/16 :goto_d

    .line 1794
    .restart local v11       #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v16       #dataTypeIconId:I
    .restart local v39       #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    :cond_23
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v4, 0x0

    aput-boolean v4, v3, p1

    .line 1795
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    const/4 v4, 0x0

    aput v4, v3, p1

    .line 1796
    const/16 v16, 0x0

    goto/16 :goto_e

    .line 1884
    .end local v11           #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v16           #dataTypeIconId:I
    .end local v39           #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v7       #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v29       #tempDataDirectionIconId:I
    .restart local v32       #tempLastDataTypeIconId:I
    .restart local v33       #tempLastMobileActivityIconId:I
    .restart local v34       #tempLastPhoneSignalIconId:[I
    :cond_24
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21       #i$:Ljava/util/Iterator;
    :goto_f
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;

    .line 1885
    .restart local v2       #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    invoke-interface {v2, v3, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setRoamingFlagandResource([Z[I)V

    .line 1886
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    aget-boolean v3, v3, p1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorResId:[I

    aget v4, v4, p1

    move/from16 v0, p1

    invoke-interface {v2, v0, v3, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setShowSimIndicator(IZI)V

    .line 1887
    move/from16 v0, p1

    move-object/from16 v1, v30

    invoke-interface {v2, v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setDataNetType3G(ILcom/mediatek/systemui/ext/NetworkType;)V

    goto :goto_f

    .line 1891
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    :cond_25
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_10
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;

    .line 1892
    .restart local v2       #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    invoke-interface {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->apply()V

    goto :goto_10

    .line 1896
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    :cond_26
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_2b

    .line 1897
    const/4 v3, 0x0

    aget v3, v34, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_27

    const/4 v3, 0x1

    aget v3, v34, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_2e

    .line 1900
    :cond_27
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x0

    const/16 v42, 0x0

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1901
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x1

    const/16 v42, 0x1

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1903
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1904
    .local v10, N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_11
    move/from16 v0, v20

    if-ge v0, v10, :cond_2e

    .line 1905
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 1906
    .local v40, v:Landroid/widget/ImageView;
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_28

    .line 1907
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1904
    :goto_12
    add-int/lit8 v20, v20, 0x1

    goto :goto_11

    .line 1909
    :cond_28
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1910
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_29

    .line 1911
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1919
    :goto_13
    move-object/from16 v0, v40

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_12

    .line 1913
    :cond_29
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_2a

    .line 1914
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_13

    .line 1916
    :cond_2a
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_13

    .line 1924
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_2b
    const/4 v3, 0x0

    aget v3, v34, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_2c

    const/4 v3, 0x1

    aget v3, v34, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_2e

    .line 1928
    :cond_2c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x0

    const/16 v42, 0x0

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1929
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x1

    const/16 v42, 0x1

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1930
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 1932
    .restart local v40       #v:Landroid/widget/ImageView;
    if-eqz v40, :cond_2e

    .line 1933
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_2d

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_2f

    .line 1934
    :cond_2d
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1953
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_2e
    :goto_14
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    move/from16 v0, v29

    if-eq v3, v0, :cond_34

    .line 1954
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    .line 1955
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1956
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_15
    move/from16 v0, v20

    if-ge v0, v10, :cond_34

    .line 1957
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 1958
    .restart local v40       #v:Landroid/widget/ImageView;
    if-nez v29, :cond_33

    .line 1959
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_32

    .line 1960
    const/4 v3, 0x4

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1956
    :goto_16
    add-int/lit8 v20, v20, 0x1

    goto :goto_15

    .line 1936
    .end local v10           #N:I
    .end local v20           #i:I
    :cond_2f
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1937
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_30

    .line 1938
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1946
    :goto_17
    move-object/from16 v0, v40

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_14

    .line 1940
    :cond_30
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_31

    .line 1941
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_17

    .line 1943
    :cond_31
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_17

    .line 1962
    .restart local v10       #N:I
    .restart local v20       #i:I
    :cond_32
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_16

    .line 1965
    :cond_33
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1966
    move-object/from16 v0, v40

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1967
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_16

    .line 1972
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_34
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    if-eq v3, v4, :cond_36

    .line 1973
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    .line 1974
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1975
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_18
    move/from16 v0, v20

    if-ge v0, v10, :cond_36

    .line 1976
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 1977
    .restart local v40       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    if-nez v3, :cond_35

    .line 1978
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1975
    :goto_19
    add-int/lit8 v20, v20, 0x1

    goto :goto_18

    .line 1980
    :cond_35
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1981
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1982
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_19

    .line 1988
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_36
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    if-eq v3, v4, :cond_38

    .line 1989
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    .line 1990
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1991
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_1a
    move/from16 v0, v20

    if-ge v0, v10, :cond_38

    .line 1992
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 1993
    .restart local v40       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    if-nez v3, :cond_37

    .line 1994
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1991
    :goto_1b
    add-int/lit8 v20, v20, 0x1

    goto :goto_1a

    .line 1996
    :cond_37
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1997
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1998
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1b

    .line 2003
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_38
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_42

    .line 2004
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    .line 2005
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2006
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_1c
    move/from16 v0, v20

    if-ge v0, v10, :cond_42

    .line 2007
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2008
    .restart local v40       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_3b

    .line 2009
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_39

    .line 2010
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2018
    :goto_1d
    move-object/from16 v0, v40

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 2006
    :goto_1e
    add-int/lit8 v20, v20, 0x1

    goto :goto_1c

    .line 2012
    :cond_39
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_3a

    .line 2013
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1d

    .line 2015
    :cond_3a
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1d

    .line 2020
    :cond_3b
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_41

    .line 2021
    const/16 v19, 0x0

    .line 2022
    .local v19, flag:Z
    const/16 v23, 0x0

    .local v23, j:I
    :goto_1f
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v0, v23

    if-ge v0, v3, :cond_3c

    .line 2023
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    aget-boolean v3, v3, v23

    if-eqz v3, :cond_3e

    .line 2024
    const/16 v19, 0x1

    .line 2028
    :cond_3c
    if-eqz v19, :cond_3d

    .line 2029
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2030
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_3f

    .line 2031
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2039
    :goto_20
    move-object/from16 v0, v40

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 2041
    :cond_3d
    move-object/from16 v0, v40

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1e

    .line 2022
    :cond_3e
    add-int/lit8 v23, v23, 0x1

    goto :goto_1f

    .line 2033
    :cond_3f
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_40

    .line 2034
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_20

    .line 2036
    :cond_40
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_20

    .line 2043
    .end local v19           #flag:Z
    .end local v23           #j:I
    :cond_41
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1e

    .line 2050
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_42
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_49

    .line 2051
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v32

    if-ne v0, v3, :cond_43

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_4b

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_4b

    .line 2052
    :cond_43
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 2054
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2055
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_21
    move/from16 v0, v20

    if-ge v0, v10, :cond_4b

    .line 2056
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2057
    .restart local v40       #v:Landroid/widget/ImageView;
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_44

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_44

    .line 2058
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2055
    :goto_22
    add-int/lit8 v20, v20, 0x1

    goto :goto_21

    .line 2059
    :cond_44
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_46

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_45

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_46

    .line 2060
    :cond_45
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_22

    .line 2062
    :cond_46
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2063
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_47

    .line 2064
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2072
    :goto_23
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_22

    .line 2066
    :cond_47
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_48

    .line 2067
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_23

    .line 2069
    :cond_48
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_23

    .line 2078
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_49
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 2079
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2081
    .restart local v40       #v:Landroid/widget/ImageView;
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v32

    if-ne v0, v3, :cond_4a

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_4b

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_4b

    .line 2082
    :cond_4a
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_4d

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_4d

    .line 2083
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2101
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_4b
    :goto_24
    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v33

    if-eq v0, v3, :cond_4c

    .line 2102
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 2106
    :cond_4c
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_56

    .line 2110
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    .line 2111
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2112
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_25
    move/from16 v0, v20

    if-ge v0, v10, :cond_56

    .line 2113
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2114
    .restart local v40       #v:Landroid/widget/ImageView;
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_53

    .line 2115
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_52

    .line 2116
    const/4 v3, 0x4

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2112
    :goto_26
    add-int/lit8 v20, v20, 0x1

    goto :goto_25

    .line 2084
    .end local v10           #N:I
    .end local v20           #i:I
    :cond_4d
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_4f

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_4e

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_4f

    .line 2085
    :cond_4e
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_24

    .line 2087
    :cond_4f
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2088
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_50

    .line 2089
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2097
    :goto_27
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_24

    .line 2091
    :cond_50
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_51

    .line 2092
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_27

    .line 2094
    :cond_51
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_27

    .line 2118
    .restart local v10       #N:I
    .restart local v20       #i:I
    :cond_52
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_26

    .line 2121
    :cond_53
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2122
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_54

    .line 2123
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2131
    :goto_28
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_26

    .line 2125
    :cond_54
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_55

    .line 2126
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_28

    .line 2128
    :cond_55
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_28

    .line 2137
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_56
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_57

    .line 2138
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    .line 2139
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2140
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_29
    move/from16 v0, v20

    if-ge v0, v10, :cond_57

    .line 2141
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2142
    .local v40, v:Landroid/widget/TextView;
    move-object/from16 v0, v40

    invoke-virtual {v0, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2140
    add-int/lit8 v20, v20, 0x1

    goto :goto_29

    .line 2147
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/TextView;
    :cond_57
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2148
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_2a
    move/from16 v0, v20

    if-ge v0, v10, :cond_59

    .line 2149
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2150
    .restart local v40       #v:Landroid/widget/TextView;
    const-string v3, ""

    move-object/from16 v0, v41

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_58

    .line 2151
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2148
    :goto_2b
    add-int/lit8 v20, v20, 0x1

    goto :goto_2a

    .line 2153
    :cond_58
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2154
    invoke-virtual/range {v40 .. v41}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2b

    .line 2159
    .end local v40           #v:Landroid/widget/TextView;
    :cond_59
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_5b

    .line 2160
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2161
    const/16 v20, 0x0

    :goto_2c
    move/from16 v0, v20

    if-ge v0, v10, :cond_5c

    .line 2162
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2163
    .restart local v40       #v:Landroid/widget/TextView;
    const-string v3, ""

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 2164
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2161
    :goto_2d
    add-int/lit8 v20, v20, 0x1

    goto :goto_2c

    .line 2166
    :cond_5a
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2167
    move-object/from16 v0, v40

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2d

    .line 2172
    .end local v40           #v:Landroid/widget/TextView;
    :cond_5b
    if-nez p1, :cond_5d

    .line 2173
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2178
    .restart local v40       #v:Landroid/widget/TextView;
    :goto_2e
    if-eqz v40, :cond_5c

    .line 2179
    const-string v3, ""

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5e

    .line 2180
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2189
    .end local v40           #v:Landroid/widget/TextView;
    :cond_5c
    :goto_2f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2190
    const/16 v20, 0x0

    :goto_30
    move/from16 v0, v20

    if-ge v0, v10, :cond_60

    .line 2191
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2192
    .restart local v40       #v:Landroid/widget/TextView;
    if-nez v17, :cond_5f

    .line 2193
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2190
    :goto_31
    add-int/lit8 v20, v20, 0x1

    goto :goto_30

    .line 2175
    .end local v40           #v:Landroid/widget/TextView;
    :cond_5d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .restart local v40       #v:Landroid/widget/TextView;
    goto :goto_2e

    .line 2182
    :cond_5e
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2183
    move-object/from16 v0, v40

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2f

    .line 2195
    :cond_5f
    move-object/from16 v0, v40

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2196
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_31

    .line 2200
    .end local v40           #v:Landroid/widget/TextView;
    :cond_60
    return-void

    .line 1605
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 1662
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public setCarrierGemini(Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Landroid/view/View;)V
    .locals 1
    .parameter "carrier1"
    .parameter "carrier2"
    .parameter "carrierDivider"

    .prologue
    .line 2341
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2342
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2343
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2344
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2345
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2346
    return-void
.end method

.method public setCarrierGemini(Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "carrier1"
    .parameter "carrier2"
    .parameter "carrier3"
    .parameter "carrierDivider1"
    .parameter "carrierDivider2"

    .prologue
    .line 2350
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2351
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2352
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2353
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2354
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2355
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2356
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2357
    return-void
.end method

.method public setCarrierGemini(Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "carrier1"
    .parameter "carrier2"
    .parameter "carrier3"
    .parameter "carrier4"
    .parameter "carrierDivider1"
    .parameter "carrierDivider2"
    .parameter "carrierDivider3"

    .prologue
    .line 2362
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2363
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2364
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2365
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2366
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2367
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2368
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2369
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2370
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2371
    return-void
.end method

.method public setStackedMode(Z)V
    .locals 1
    .parameter "stacked"

    .prologue
    .line 460
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataAndWifiStacked:Z

    .line 461
    return-void
.end method

.method public showSimIndicator(I)V
    .locals 4
    .parameter "slotId"

    .prologue
    .line 2456
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v0

    .line 2457
    .local v0, simColor:I
    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 2458
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorResId:[I

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIcons;->SIM_INDICATOR_BACKGROUND:[I

    aget v2, v2, v0

    aput v2, v1, p1

    .line 2460
    :cond_0
    const-string v1, "NetworkControllerGemini"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "showSimIndicator slotId is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " simColor = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2461
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, p1

    .line 2462
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 2463
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 2464
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 2465
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 2466
    return-void
.end method

.method updateNetworkName(IZLjava/lang/String;ZLjava/lang/String;)V
    .locals 5
    .parameter "slotId"
    .parameter "showSpn"
    .parameter "spn"
    .parameter "showPlmn"
    .parameter "plmn"

    .prologue
    .line 1287
    const-string v2, "NetworkControllerGemini"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateNetworkName("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "), showSpn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " spn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " showPlmn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " plmn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1290
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1291
    .local v1, str:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 1292
    .local v0, something:Z
    if-eqz p4, :cond_0

    if-eqz p5, :cond_0

    .line 1293
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1294
    const/4 v0, 0x1

    .line 1296
    :cond_0
    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    .line 1297
    if-eqz v0, :cond_1

    .line 1298
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameSeparator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1300
    :cond_1
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1301
    const/4 v0, 0x1

    .line 1304
    :cond_2
    if-eqz v0, :cond_3

    .line 1305
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, p1

    .line 1309
    :goto_0
    const-string v2, "NetworkControllerGemini"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateNetworkName("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "), mNetworkName="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    aget-object v4, v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1310
    return-void

    .line 1307
    :cond_3
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameDefault:Ljava/lang/String;

    aput-object v3, v2, p1

    goto :goto_0
.end method

.method public updateOperatorInfo()V
    .locals 15

    .prologue
    const/16 v14, 0x8

    const/4 v13, 0x2

    const/4 v12, 0x0

    .line 2386
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_0

    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-gtz v9, :cond_1

    .line 2450
    :cond_0
    :goto_0
    return-void

    .line 2390
    :cond_1
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2391
    .local v3, mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-nez v3, :cond_2

    goto :goto_0

    .line 2396
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    :cond_3
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 2397
    .local v5, mDividerMemeber:Landroid/view/View;
    if-eqz v5, :cond_4

    .line 2398
    invoke-virtual {v5, v14}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 2402
    .end local v5           #mDividerMemeber:Landroid/view/View;
    :cond_5
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isWifiOnlyDevice()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 2404
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2405
    .restart local v3       #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v3, :cond_6

    .line 2406
    invoke-virtual {v3, v14}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    goto :goto_2

    .line 2412
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    :cond_7
    const/4 v6, 0x0

    .line 2413
    .local v6, mNumOfSIM:I
    const/4 v2, 0x0

    .line 2414
    .local v2, mCarrierLeft:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    const/4 v4, 0x0

    .line 2415
    .local v4, mCarrierRight:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_3
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v0, v9, :cond_d

    .line 2416
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2417
    .restart local v3       #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v3, :cond_a

    .line 2418
    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->getSlotId()I

    move-result v9

    invoke-static {v9}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v7

    .line 2420
    .local v7, simInserted:Z
    const-string v9, "NetworkControllerGemini"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "updateOperatorInfo, simInserted is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", SIM slod id is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->getSlotId()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2422
    if-eqz v7, :cond_c

    .line 2423
    invoke-virtual {v3, v12}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    .line 2424
    add-int/lit8 v6, v6, 0x1

    .line 2425
    const/4 v9, 0x1

    if-ne v6, v9, :cond_b

    .line 2426
    move-object v2, v3

    .line 2430
    :cond_8
    :goto_4
    if-lt v6, v13, :cond_9

    add-int/lit8 v9, v0, -0x1

    if-ltz v9, :cond_9

    .line 2431
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    add-int/lit8 v10, v0, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    invoke-virtual {v9, v12}, Landroid/view/View;->setVisibility(I)V

    .line 2436
    :cond_9
    :goto_5
    const/16 v9, 0x11

    invoke-virtual {v3, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    .line 2415
    .end local v7           #simInserted:Z
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 2427
    .restart local v7       #simInserted:Z
    :cond_b
    if-ne v6, v13, :cond_8

    .line 2428
    move-object v4, v3

    goto :goto_4

    .line 2434
    :cond_c
    invoke-virtual {v3, v14}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    goto :goto_5

    .line 2440
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    .end local v7           #simInserted:Z
    :cond_d
    if-ne v6, v13, :cond_e

    .line 2441
    const/4 v9, 0x5

    invoke-virtual {v2, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    .line 2442
    const/4 v9, 0x3

    invoke-virtual {v4, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    goto/16 :goto_0

    .line 2443
    :cond_e
    if-nez v6, :cond_0

    .line 2444
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2445
    .local v8, v:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v8, :cond_f

    .line 2446
    invoke-virtual {v8, v12}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    .line 2448
    :cond_f
    const-string v9, "NetworkControllerGemini"

    const-string v10, "updateOperatorInfo, force the slotId 0 to visible."

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
