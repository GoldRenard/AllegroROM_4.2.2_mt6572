.class public Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;
.super Landroid/content/BroadcastReceiver;
.source "NetworkControllerCoolpad.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$1;,
        Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$WifiHandler;,
        Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;,
        Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    }
.end annotation


# static fields
.field private static final ACTION_BOOT_IPO:Ljava/lang/String; = "android.intent.action.ACTION_PREBOOT_IPO"

.field static final CHATTY:Z = false

.field static final DEBUG:Z = false

.field private static final INET_CONDITION_THRESHOLD:I = 0x32

.field static final TAG:Ljava/lang/String; = "NetworkControllerCoolpad"


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

.field private mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

.field private mServiceState:[Landroid/telephony/ServiceState;

.field private mShowAtLeastThreeGees:Z

.field private mSignalClusters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;",
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
    .locals 13
    .parameter "context"

    .prologue
    .line 211
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 110
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mShowAtLeastThreeGees:Z

    .line 111
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAlwaysShowCdmaRssi:Z

    .line 120
    const/4 v10, 0x4

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconListNum:I

    .line 121
    const/4 v10, 0x2

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconIdNum:I

    .line 133
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    .line 134
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    .line 135
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivity:I

    .line 138
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTethered:Z

    .line 139
    const v10, 0x1080564

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTetherIconId:I

    .line 143
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSupported:Z

    .line 144
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsWimaxEnabled:Z

    .line 145
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    .line 146
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIdle:Z

    .line 147
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    .line 148
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSignal:I

    .line 149
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxState:I

    .line 150
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxExtraState:I

    .line 153
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnected:Z

    .line 154
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkType:I

    .line 156
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mInetCondition:I

    .line 159
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    .line 160
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastAirplaneMode:Z

    .line 164
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    .line 165
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconViews:Ljava/util/ArrayList;

    .line 166
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    .line 167
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconViews:Ljava/util/ArrayList;

    .line 168
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconViews:Ljava/util/ArrayList;

    .line 169
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    .line 170
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconViews:Ljava/util/ArrayList;

    .line 171
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedLabelViews:Ljava/util/ArrayList;

    .line 172
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileLabelViews:Ljava/util/ArrayList;

    .line 173
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLabelViews:Ljava/util/ArrayList;

    .line 174
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mEmergencyLabelViews:Ljava/util/ArrayList;

    .line 175
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalClusters:Ljava/util/ArrayList;

    .line 177
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionIconId:I

    .line 178
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionOverlayIconId:I

    .line 179
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWifiIconId:I

    .line 180
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWimaxIconId:I

    .line 181
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedSignalIconId:I

    .line 184
    const-string v10, ""

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedLabel:Ljava/lang/String;

    .line 187
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataAndWifiStacked:Z

    .line 188
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    .line 194
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimCardReady:Z

    .line 2140
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrier1:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2141
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrier2:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2142
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierDivider:Landroid/view/View;

    .line 2186
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    .line 2187
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    .line 212
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    .line 213
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 215
    .local v7, res:Landroid/content/res/Resources;
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const-string v11, "connectivity"

    invoke-virtual {v10, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 217
    .local v0, cm:Landroid/net/ConnectivityManager;
    const/4 v10, 0x0

    invoke-virtual {v0, v10}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v10

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    .line 218
    const v10, 0x7f0a0005

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v10

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mShowAtLeastThreeGees:Z

    .line 219
    const-string v10, "NetworkControllerCoolpad"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "NetworkControllerCoolpad, mShowAtLeastThreeGees="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-boolean v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mShowAtLeastThreeGees:Z

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    const-string v10, "window"

    invoke-static {v10}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v10

    invoke-static {v10}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v9

    .line 224
    .local v9, wm:Landroid/view/IWindowManager;
    :try_start_0
    invoke-interface {v9}, Landroid/view/IWindowManager;->hasSystemNavBar()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 225
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    :goto_0
    const v10, 0x111003a

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v10

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAlwaysShowCdmaRssi:Z

    .line 237
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWifiIcons()V

    .line 238
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWimaxIcons()V

    .line 241
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefault(Landroid/content/Context;)Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v10

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 242
    sget v10, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    iput v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    .line 243
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v11, 0x7f0b005b

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkNameSeparator:Ljava/lang/String;

    .line 244
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v11, 0x10402e6

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkNameDefault:Ljava/lang/String;

    .line 246
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Z

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    .line 247
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    .line 248
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Landroid/telephony/SignalStrength;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalStrength:[Landroid/telephony/SignalStrength;

    .line 249
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Landroid/telephony/ServiceState;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    .line 250
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I

    .line 251
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataState:[I

    .line 252
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Z

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    .line 253
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Lcom/android/internal/telephony/IccCardConstants$State;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    .line 254
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconId:[I

    .line 255
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataActivity:[I

    .line 256
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Lcom/mediatek/systemui/ext/NetworkType;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    .line 257
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Ljava/lang/String;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    .line 258
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 259
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Ljava/lang/String;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionDataType:[Ljava/lang/String;

    .line 260
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Ljava/lang/String;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    .line 261
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconIdNum:I

    filled-new-array {v10, v11}, [I

    move-result-object v10

    const-class v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-static {v11, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 262
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 263
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 264
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconListNum:I

    filled-new-array {v10, v11}, [I

    move-result-object v10

    const-class v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-static {v11, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 265
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [[I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    .line 266
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataTypeIconId:[I

    .line 267
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastMobileActivityIconId:[I

    .line 268
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Z

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimIndicatorFlag:[Z

    .line 269
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [I

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimIndicatorResId:[I

    .line 270
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    new-array v10, v10, [Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    .line 272
    const-string v10, "gsm.siminfo.ready"

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimCardReady:Z

    .line 273
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v10

    const/4 v11, 0x0

    sget-object v12, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    invoke-interface {v10, v11, v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I

    move-result-object v5

    .line 276
    .local v5, iconList:[I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    if-ge v4, v10, :cond_3

    .line 277
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I

    const/4 v11, 0x0

    aput v11, v10, v4

    .line 278
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataState:[I

    const/4 v11, 0x0

    aput v11, v10, v4

    .line 279
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    sget-object v11, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    aput-object v11, v10, v4

    .line 280
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataActivity:[I

    const/4 v11, 0x0

    aput v11, v10, v4

    .line 281
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkNameDefault:Ljava/lang/String;

    aput-object v11, v10, v4

    .line 282
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    const/4 v11, 0x2

    new-array v11, v11, [I

    fill-array-data v11, :array_0

    aput-object v11, v10, v4

    .line 283
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataTypeIconId:[I

    const/4 v11, -0x1

    aput v11, v10, v4

    .line 284
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastMobileActivityIconId:[I

    const/4 v11, -0x1

    aput v11, v10, v4

    .line 285
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    new-instance v11, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    const/4 v12, 0x0

    invoke-direct {v11, p0, v12}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$1;)V

    aput-object v11, v10, v4

    .line 286
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v11, v10, v4

    .line 287
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v12, 0x0

    invoke-direct {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v11, v10, v4

    .line 288
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v12, 0x0

    invoke-direct {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v11, v10, v4

    .line 290
    const/4 v6, 0x0

    .local v6, j:I
    :goto_2
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconListNum:I

    if-ge v6, v10, :cond_1

    .line 292
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v4

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v12, 0x0

    invoke-direct {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v11, v10, v6

    .line 294
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v4

    aget-object v10, v10, v6

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 295
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v4

    aget-object v10, v10, v6

    sget-object v11, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G:[I

    aget v11, v11, v6

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 290
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 227
    .end local v4           #i:I
    .end local v5           #iconList:[I
    .end local v6           #j:I
    :cond_0
    const/4 v10, 0x0

    :try_start_1
    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 229
    :catch_0
    move-exception v1

    .line 230
    .local v1, e:Landroid/os/RemoteException;
    const-string v10, "NetworkControllerCoolpad"

    const-string v11, "Failing checking whether status bar is visible"

    invoke-static {v10, v11}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 298
    .end local v1           #e:Landroid/os/RemoteException;
    .restart local v4       #i:I
    .restart local v5       #iconList:[I
    .restart local v6       #j:I
    :cond_1
    const/4 v6, 0x0

    :goto_3
    iget v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconIdNum:I

    if-ge v6, v10, :cond_2

    .line 299
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v4

    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v12, 0x0

    invoke-direct {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v11, v10, v6

    .line 298
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 303
    :cond_2
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v4

    const/4 v11, 0x0

    aget-object v10, v10, v11

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 304
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v10, v10, v4

    const/4 v11, 0x0

    aget-object v10, v10, v11

    invoke-static {v4}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 307
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    aget-object v10, v10, v4

    const/16 v11, 0x1e1

    invoke-static {v10, v11, v4}, Lcom/android/systemui/statusbar/util/SIMHelper;->listen(Landroid/telephony/PhoneStateListener;II)V

    .line 276
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    .line 316
    .end local v6           #j:I
    :cond_3
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0a0002

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v10

    if-eqz v10, :cond_6

    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-static {v10}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v10

    invoke-interface {v10}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->isHspaDataDistinguishable()Z

    move-result v10

    if-eqz v10, :cond_6

    const/4 v10, 0x1

    :goto_4
    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHspaDataDistinguishable:Z

    .line 320
    const-string v10, "wifi"

    invoke-virtual {p1, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/wifi/WifiManager;

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 321
    new-instance v3, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$WifiHandler;

    invoke-direct {v3, p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$WifiHandler;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V

    .line 322
    .local v3, handler:Landroid/os/Handler;
    new-instance v10, Lcom/android/internal/util/AsyncChannel;

    invoke-direct {v10}, Lcom/android/internal/util/AsyncChannel;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    .line 323
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v10}, Landroid/net/wifi/WifiManager;->getWifiServiceMessenger()Landroid/os/Messenger;

    move-result-object v8

    .line 324
    .local v8, wifiMessenger:Landroid/os/Messenger;
    if-eqz v8, :cond_4

    .line 325
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v10, v11, v3, v8}, Lcom/android/internal/util/AsyncChannel;->connect(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Messenger;)V

    .line 329
    :cond_4
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 330
    .local v2, filter:Landroid/content/IntentFilter;
    const-string v10, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 331
    const-string v10, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 332
    const-string v10, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 333
    const-string v10, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 334
    const-string v10, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 335
    const-string v10, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 336
    const-string v10, "android.net.conn.INET_CONDITION_ACTION"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 337
    const-string v10, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 338
    const-string v10, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 339
    const-string v10, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 340
    iget-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x111003f

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v10

    iput-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSupported:Z

    .line 342
    iget-boolean v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSupported:Z

    if-eqz v10, :cond_5

    .line 343
    const-string v10, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 344
    const-string v10, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 345
    const-string v10, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 347
    :cond_5
    const-string v10, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 348
    const-string v10, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 349
    const-string v10, "android.intent.action.SIM_INSERTED_STATUS"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 350
    const-string v10, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 351
    const-string v10, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v2, v10}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 352
    invoke-virtual {p1, p0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 355
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateAirplaneMode()V

    .line 358
    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v10

    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    .line 359
    return-void

    .line 316
    .end local v2           #filter:Landroid/content/IntentFilter;
    .end local v3           #handler:Landroid/os/Handler;
    .end local v8           #wifiMessenger:Landroid/os/Messenger;
    :cond_6
    const/4 v10, 0x0

    goto/16 :goto_4

    .line 282
    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method

.method private GetCurNetWorkTypeForSignal(I)I
    .locals 1
    .parameter "nSlot"

    .prologue
    .line 1322
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I

    aget v0, v0, p1

    packed-switch v0, :pswitch_data_0

    .line 1336
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 1324
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 1326
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 1328
    :pswitch_3
    const/4 v0, 0x3

    goto :goto_0

    .line 1333
    :pswitch_4
    const/4 v0, 0x4

    goto :goto_0

    .line 1322
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$myPhoneStateListener;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataState:[I

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataActivity:[I

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)Lcom/android/internal/util/AsyncChannel;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivity:I

    return v0
.end method

.method static synthetic access$1402(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    iput p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivity:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Landroid/telephony/SignalStrength;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalStrength:[Landroid/telephony/SignalStrength;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[Landroid/telephony/ServiceState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isCdma(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon()V

    return-void
.end method

.method private getResourceName(I)Ljava/lang/String;
    .locals 3
    .parameter "resId"

    .prologue
    .line 2129
    if-eqz p1, :cond_0

    .line 2130
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2132
    .local v1, res:Landroid/content/res/Resources;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 2137
    .end local v1           #res:Landroid/content/res/Resources;
    :goto_0
    return-object v2

    .line 2133
    .restart local v1       #res:Landroid/content/res/Resources;
    :catch_0
    move-exception v0

    .line 2134
    .local v0, ex:Landroid/content/res/Resources$NotFoundException;
    const-string v2, "(unknown)"

    goto :goto_0

    .line 2137
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

    .line 661
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v0, v2, p1

    .line 663
    .local v0, tempServiceState:Landroid/telephony/ServiceState;
    if-eqz v0, :cond_0

    .line 664
    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getState()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 669
    :pswitch_0
    const/4 v1, 0x1

    .line 672
    :cond_0
    :pswitch_1
    return v1

    .line 664
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
    .line 1216
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v3

    .line 1217
    .local v3, ssid:Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 1227
    .end local v3           #ssid:Ljava/lang/String;
    :goto_0
    return-object v3

    .line 1221
    .restart local v3       #ssid:Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v2

    .line 1222
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

    .line 1223
    .local v1, net:Landroid/net/wifi/WifiConfiguration;
    iget v4, v1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 1224
    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    goto :goto_0

    .line 1227
    .end local v1           #net:Landroid/net/wifi/WifiConfiguration;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private isCdma(I)Z
    .locals 2
    .parameter "slotId"

    .prologue
    .line 654
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v0, v1, p1

    .line 656
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

.method private isSimInserted(I)Z
    .locals 6
    .parameter "slotId"

    .prologue
    .line 2257
    const/4 v2, 0x0

    .line 2258
    .local v2, simInserted:Z
    const-string v3, "phone"

    invoke-static {v3}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v1

    .line 2259
    .local v1, phone:Lcom/android/internal/telephony/ITelephony;
    if-eqz v1, :cond_0

    .line 2261
    :try_start_0
    invoke-interface {v1, p1}, Lcom/android/internal/telephony/ITelephony;->isSimInsert(I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 2266
    :cond_0
    :goto_0
    const-string v3, "NetworkControllerCoolpad"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "isSimInserted("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "), SimInserted="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2267
    return v2

    .line 2262
    :catch_0
    move-exception v0

    .line 2263
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private isWifiOnlyDevice()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 2181
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 2182
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

    .line 677
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    .line 679
    return-void

    :cond_0
    move v0, v1

    .line 677
    goto :goto_0
.end method

.method private updateConnectivity(Landroid/content/Intent;)V
    .locals 8
    .parameter "intent"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1281
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const-string v7, "connectivity"

    invoke-virtual {v4, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1283
    .local v0, connManager:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1286
    .local v2, info:Landroid/net/NetworkInfo;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v5

    :goto_0
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnected:Z

    .line 1287
    iget-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnected:Z

    if-eqz v4, :cond_1

    .line 1288
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkType:I

    .line 1289
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkTypeName:Ljava/lang/String;

    .line 1294
    :goto_1
    const-string v4, "inetCondition"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1301
    .local v1, connectionStatus:I
    const/16 v4, 0x32

    if-le v1, v4, :cond_2

    :goto_2
    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mInetCondition:I

    .line 1302
    const-string v4, "NetworkControllerCoolpad"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateConnectivity, mInetCondition="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mInetCondition:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1304
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_3

    .line 1305
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTethered:Z

    .line 1311
    :goto_3
    const-string v4, "simId"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 1312
    .local v3, slotId:I
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V

    .line 1313
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWimaxIcons()V

    .line 1314
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V

    .line 1315
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V

    .line 1316
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWifiIcons()V

    .line 1317
    return-void

    .end local v1           #connectionStatus:I
    .end local v3           #slotId:I
    :cond_0
    move v4, v6

    .line 1286
    goto :goto_0

    .line 1291
    :cond_1
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkType:I

    .line 1292
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkTypeName:Ljava/lang/String;

    goto :goto_1

    .restart local v1       #connectionStatus:I
    :cond_2
    move v5, v6

    .line 1301
    goto :goto_2

    .line 1307
    :cond_3
    iput-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTethered:Z

    goto :goto_3
.end method

.method private final updateDataIcon()V
    .locals 2

    .prologue
    .line 963
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 964
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V

    .line 963
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 966
    :cond_0
    return-void
.end method

.method private final updateDataIcon(I)V
    .locals 24
    .parameter "slotId"

    .prologue
    .line 969
    const/4 v9, 0x0

    .line 970
    .local v9, iconId:I
    const/16 v20, 0x1

    .line 971
    .local v20, visible:Z
    invoke-static {}, Lcom/android/systemui/statusbar/util/SIMHelper;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v8

    .line 972
    .local v8, iTelephony:Lcom/android/internal/telephony/ITelephony;
    const/16 v18, 0x0

    .line 976
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

    .line 979
    .local v16, tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataState:[I

    move-object/from16 v21, v0

    aget v17, v21, p1

    .line 980
    .local v17, tempDataState:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v21, v0

    aget-object v19, v21, p1

    .line 981
    .local v19, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataActivity:[I

    move-object/from16 v21, v0

    aget v15, v21, p1

    .line 982
    .local v15, tempDataActivity:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v21, v0

    aget-object v18, v21, p1

    .line 984
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconListNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_0

    .line 985
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v21, v0

    aget-object v21, v21, p1

    aget-object v21, v21, v7

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v21

    aput-object v21, v16, v7

    .line 984
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 988
    :cond_0
    const-string v21, "NetworkControllerCoolpad"

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

    .line 991
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isCdma(I)Z

    move-result v21

    if-nez v21, :cond_4

    .line 993
    sget-object v21, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_1

    sget-object v21, Lcom/android/internal/telephony/IccCardConstants$State;->UNKNOWN:Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_c

    .line 995
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    new-array v3, v0, [I

    .line 996
    .local v3, callState:[I
    const/4 v4, 0x1

    .line 997
    .local v4, callStateAllIdle:Z
    const/4 v7, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_3

    .line 999
    :try_start_0
    invoke-interface {v8, v7}, Lcom/android/internal/telephony/ITelephony;->getCallStateGemini(I)I

    move-result v21

    aput v21, v3, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1003
    :goto_2
    const-string v21, "NetworkControllerCoolpad"

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

    .line 1004
    aget v21, v3, v7

    if-eqz v21, :cond_2

    .line 1005
    const/4 v4, 0x0

    .line 997
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1000
    :catch_0
    move-exception v5

    .line 1001
    .local v5, e:Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 1009
    .end local v5           #e:Ljava/lang/Exception;
    :cond_3
    sget-object v21, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_6

    .line 1010
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_5

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_5

    if-eqz v4, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

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

    .line 1015
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1016
    .local v12, simColorId:I
    const-string v21, "NetworkControllerCoolpad"

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

    .line 1017
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_4

    .line 1018
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    .line 1072
    .end local v3           #callState:[I
    .end local v4           #callStateAllIdle:Z
    .end local v12           #simColorId:I
    :cond_4
    :goto_3
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v10

    .line 1074
    .local v10, ident:J
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

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

    .line 1078
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1081
    :goto_4
    const-string v21, "NetworkControllerCoolpad"

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

    .line 1082
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    move-object/from16 v21, v0

    aput-boolean v20, v21, p1

    .line 1083
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconId:[I

    move-object/from16 v21, v0

    aput v9, v21, p1

    .line 1085
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    move-object/from16 v21, v0

    aget-boolean v21, v21, p1

    if-eqz v21, :cond_e

    .line 1086
    const/4 v7, 0x0

    :goto_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_e

    .line 1087
    move/from16 v0, p1

    if-ne v7, v0, :cond_d

    .line 1086
    :goto_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 1021
    .end local v10           #ident:J
    .restart local v3       #callState:[I
    .restart local v4       #callStateAllIdle:Z
    :cond_5
    const/4 v9, 0x0

    .line 1022
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1025
    :cond_6
    const-string v21, "phone"

    invoke-static/range {v21 .. v21}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v13

    .line 1026
    .local v13, telephony:Lcom/android/internal/telephony/ITelephony;
    const/4 v14, 0x0

    .line 1027
    .local v14, tempCapabilitySIM:I
    const/4 v4, 0x1

    .line 1030
    if-eqz v13, :cond_7

    .line 1032
    :try_start_2
    invoke-interface {v13}, Lcom/android/internal/telephony/ITelephony;->get3GCapabilitySIM()I
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    move-result v14

    .line 1038
    :cond_7
    :goto_7
    const/4 v7, 0x0

    :goto_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_a

    .line 1039
    if-ne v14, v7, :cond_9

    .line 1038
    :cond_8
    :goto_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 1033
    :catch_1
    move-exception v6

    .line 1034
    .local v6, ex:Landroid/os/RemoteException;
    invoke-virtual {v6}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_7

    .line 1042
    .end local v6           #ex:Landroid/os/RemoteException;
    :cond_9
    aget v21, v3, v7

    if-eqz v21, :cond_8

    .line 1043
    const/4 v4, 0x0

    goto :goto_9

    .line 1047
    :cond_a
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_b

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_b

    if-eqz v4, :cond_b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

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

    .line 1053
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1054
    .restart local v12       #simColorId:I
    const-string v21, "NetworkControllerCoolpad"

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

    .line 1055
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_4

    .line 1056
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    goto/16 :goto_3

    .line 1059
    .end local v12           #simColorId:I
    :cond_b
    const/4 v9, 0x0

    .line 1060
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1066
    .end local v3           #callState:[I
    .end local v4           #callStateAllIdle:Z
    .end local v13           #telephony:Lcom/android/internal/telephony/ITelephony;
    .end local v14           #tempCapabilitySIM:I
    :cond_c
    const v9, 0x7f0201fb

    .line 1067
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1075
    .restart local v10       #ident:J
    :catch_2
    move-exception v5

    .line 1076
    .local v5, e:Landroid/os/RemoteException;
    :try_start_3
    const-string v21, "NetworkControllerCoolpad"

    const-string v22, "RemoteException"

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1078
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto/16 :goto_4

    .end local v5           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v21

    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v21

    .line 1088
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-boolean v22, v21, v7

    goto/16 :goto_6

    .line 1092
    :cond_e
    return-void
.end method

.method private final updateDataNetType()V
    .locals 2

    .prologue
    .line 815
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 816
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V

    .line 815
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 818
    :cond_0
    return-void
.end method

.method private final updateDataNetType(I)V
    .locals 14
    .parameter "slotId"

    .prologue
    const v13, 0x7f0b0094

    const v12, 0x7f0b0092

    const/4 v11, 0x1

    const/4 v10, 0x0

    const v9, 0x7f0b0093

    .line 822
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 824
    .local v3, tempDataNetType3G:Lcom/mediatek/systemui/ext/NetworkType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I

    aget v2, v6, p1

    .line 826
    .local v2, tempDataNetType:I
    const-string v6, "NetworkControllerCoolpad"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "updateDataNetType("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "), DataNetType="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 828
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    invoke-virtual {v6, p1}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 829
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    aput-boolean v11, v6, p1

    .line 830
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    invoke-static {p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalRoamingIcon(I)I

    move-result v7

    aput v7, v6, p1

    .line 839
    :goto_0
    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsWimaxEnabled:Z

    if-eqz v6, :cond_1

    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    if-eqz v6, :cond_1

    .line 841
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    .line 842
    .local v5, tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v7, 0x7f0b0095

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 939
    .local v0, tempContentDescriptionDataType:Ljava/lang/String;
    :goto_1
    const/4 v6, 0x4

    new-array v1, v6, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v6, v1, v10

    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v6, v1, v11

    const/4 v6, 0x2

    new-instance v7, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v7, v1, v6

    const/4 v6, 0x3

    new-instance v7, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v7, v1, v6

    .line 940
    .local v1, tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v4, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 941
    .local v4, tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    aput-object v3, v6, p1

    .line 942
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionDataType:[Ljava/lang/String;

    aput-object v0, v6, p1

    .line 943
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aput-object v1, v6, p1

    .line 944
    return-void

    .line 832
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v1           #tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v4           #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_0
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    aput-boolean v10, v6, p1

    .line 833
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    aput v10, v6, p1

    goto :goto_0

    .line 845
    :cond_1
    packed-switch v2, :pswitch_data_0

    .line 924
    :pswitch_0
    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mShowAtLeastThreeGees:Z

    if-nez v6, :cond_6

    .line 925
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 926
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    .line 927
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto :goto_1

    .line 847
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_1
    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mShowAtLeastThreeGees:Z

    if-nez v6, :cond_2

    .line 848
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    .line 849
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 851
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto :goto_1

    .line 856
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_2
    :pswitch_2
    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mShowAtLeastThreeGees:Z

    if-nez v6, :cond_3

    .line 857
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_E:Lcom/mediatek/systemui/ext/DataType;

    .line 858
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v7, 0x7f0b0097

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 860
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto :goto_1

    .line 865
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_3
    :pswitch_3
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 866
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 867
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 869
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto :goto_1

    .line 873
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_4
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 874
    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHspaDataDistinguishable:Z

    if-eqz v6, :cond_4

    .line 875
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_H:Lcom/mediatek/systemui/ext/DataType;

    .line 876
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 879
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_4
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 880
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 883
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 885
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_5
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 886
    iget-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHspaDataDistinguishable:Z

    if-eqz v6, :cond_5

    .line 887
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_H_PLUS:Lcom/mediatek/systemui/ext/DataType;

    .line 888
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 891
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_5
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 892
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 895
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 898
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_6
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    .line 899
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    .line 900
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v7, 0x7f0b0096

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 902
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 904
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_7
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    .line 905
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    .line 906
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v7, 0x7f0b0096

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 908
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 913
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_8
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 914
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 915
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 917
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 919
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_9
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    .line 920
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v7, 0x7f0b0095

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 922
    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 930
    .end local v0           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v5           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_6
    sget-object v3, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 931
    sget-object v5, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 932
    .restart local v5       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_1

    .line 845
    nop

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
    .line 628
    const/4 v2, 0x0

    .line 630
    .local v2, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    const-string v3, "ss"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 631
    .local v1, stateExtra:Ljava/lang/String;
    const-string v3, "ABSENT"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 632
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->ABSENT:Lcom/android/internal/telephony/IccCardConstants$State;

    .line 648
    :goto_0
    if-eqz v2, :cond_0

    .line 649
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aput-object v2, v3, p1

    .line 651
    :cond_0
    return-void

    .line 633
    :cond_1
    const-string v3, "READY"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 634
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 635
    :cond_2
    const-string v3, "LOCKED"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 636
    const-string v3, "reason"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 637
    .local v0, lockedReason:Ljava/lang/String;
    const-string v3, "PIN"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 638
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->PIN_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 639
    :cond_3
    const-string v3, "PUK"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 640
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->PUK_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 642
    :cond_4
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->NETWORK_LOCKED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0

    .line 645
    .end local v0           #lockedReason:Ljava/lang/String;
    :cond_5
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->UNKNOWN:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_0
.end method

.method private final updateTelephonySignalStrength()V
    .locals 2

    .prologue
    .line 682
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 683
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V

    .line 682
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 685
    :cond_0
    return-void
.end method

.method private final updateTelephonySignalStrength(I)V
    .locals 19
    .parameter "slotId"

    .prologue
    .line 688
    const/4 v3, 0x0

    .line 689
    .local v3, handled:Z
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v13, v0, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/16 v16, 0x0

    new-instance v17, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v17 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v17, v13, v16

    const/16 v16, 0x1

    new-instance v17, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v17 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v17, v13, v16

    .line 690
    .local v13, tempPhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v10, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 691
    .local v10, tempDataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 692
    .local v12, tempNetworkTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const/4 v14, 0x0

    .line 693
    .local v14, tempServiceState:Landroid/telephony/ServiceState;
    const/4 v15, 0x0

    .line 694
    .local v15, tempSignalStrength:Landroid/telephony/SignalStrength;
    const-string v8, ""

    .line 695
    .local v8, tempContentDescriptionPhoneSignal:Ljava/lang/String;
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v11, v0, [I

    fill-array-data v11, :array_0

    .line 697
    .local v11, tempLastSignalLevel:[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalStrength:[Landroid/telephony/SignalStrength;

    move-object/from16 v16, v0

    aget-object v15, v16, p1

    .line 698
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    move-object/from16 v16, v0

    aget-object v14, v16, p1

    .line 703
    if-nez v3, :cond_0

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isSimInserted(I)Z

    move-result v16

    if-nez v16, :cond_0

    .line 704
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateTelephonySignalStrength("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "), is null signal."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 707
    const/16 v16, 0x0

    aget-object v16, v13, v16

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 708
    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 709
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 712
    const/4 v3, 0x1

    .line 713
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateTelephonySignalStrength("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "), null signal"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 716
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimCardReady:Z

    move/from16 v16, v0

    if-nez v16, :cond_1

    .line 717
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateTelephonySignalStrength("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "), the SIMs initialization of framework has not been ready."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 720
    const/16 v16, 0x0

    aget-object v16, v13, v16

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 721
    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 722
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 723
    const/4 v3, 0x1

    .line 728
    :cond_1
    if-nez v3, :cond_a

    if-eqz v14, :cond_a

    .line 729
    invoke-virtual {v14}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v7

    .line 730
    .local v7, regState:I
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateTelephonySignalStrength("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "), regState="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    const/16 v16, 0x2

    move/from16 v0, v16

    if-ne v7, v0, :cond_2

    .line 732
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, " searching state hasService= "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 735
    const/16 v16, 0x0

    aget-object v16, v13, v16

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 736
    const/4 v3, 0x1

    .line 737
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateTelephonySignalStrength("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "), searching"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    :cond_2
    if-nez v3, :cond_4

    if-eqz v14, :cond_3

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v16

    if-nez v16, :cond_4

    invoke-virtual {v14}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v16

    if-nez v16, :cond_4

    .line 743
    :cond_3
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateTelephonySignalStrength("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ") tempServiceState = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 744
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isSimInserted(I)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 745
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "SimIndicatorState = "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    const/16 v16, 0x1

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_4

    .line 747
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 748
    const/16 v16, 0x0

    aget-object v16, v13, v16

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 749
    const/4 v3, 0x1

    .line 754
    :cond_4
    if-nez v3, :cond_5

    .line 755
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v4

    .line 756
    .local v4, hasService:Z
    const-string v16, "NetworkControllerCoolpad"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "updateTelephonySignalStrength("

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "), hasService="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 757
    if-nez v4, :cond_6

    .line 762
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 763
    const/16 v16, 0x0

    aget-object v16, v13, v16

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 802
    .end local v4           #hasService:Z
    :cond_5
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v16, v0

    invoke-virtual {v10}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v17

    aput-object v17, v16, p1

    .line 803
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    move-object/from16 v16, v0

    aput-object v8, v16, p1

    .line 804
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v16, v0

    aget-object v16, v16, p1

    const/16 v17, 0x0

    const/16 v18, 0x0

    aget-object v18, v13, v18

    invoke-virtual/range {v18 .. v18}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v18

    aput-object v18, v16, v17

    .line 805
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v16, v0

    aget-object v16, v16, p1

    const/16 v17, 0x1

    const/16 v18, 0x1

    aget-object v18, v13, v18

    invoke-virtual/range {v18 .. v18}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v18

    aput-object v18, v16, v17

    .line 806
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v16, v0

    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v17

    aput-object v17, v16, p1

    .line 808
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalClusters:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;

    .line 809
    .local v2, cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-interface {v2, v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setRoamingFlagandResource([Z[I)V

    goto :goto_1

    .line 766
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    .end local v5           #i$:Ljava/util/Iterator;
    .restart local v4       #hasService:Z
    :cond_6
    if-nez v15, :cond_7

    .line 770
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 771
    const/16 v16, 0x0

    aget-object v16, v13, v16

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 772
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    sget-object v17, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    const/16 v18, 0x0

    aget v17, v17, v18

    invoke-virtual/range {v16 .. v17}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0

    .line 775
    :cond_7
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v6, v0, [I

    fill-array-data v6, :array_1

    .line 778
    .local v6, iconLevel:[I
    const/16 v16, 0x0

    invoke-virtual {v15}, Landroid/telephony/SignalStrength;->getLevel()I

    move-result v17

    aput v17, v6, v16

    .line 780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v16, v0

    aget-object v9, v16, p1

    .line 781
    .local v9, tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 782
    invoke-static {v9}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNetworkTypeIcon(Lcom/mediatek/systemui/ext/NetworkType;)I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 785
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 786
    const/16 v16, 0x0

    aget v16, v6, v16

    const/16 v17, 0x6

    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_8

    .line 787
    const/16 v16, 0x0

    aget-object v16, v13, v16

    const/16 v17, 0x0

    aget v17, v6, v17

    move/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalStrengthIcon(II)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 792
    :cond_8
    const/16 v16, 0x0

    aget v16, v6, v16

    const/16 v17, 0x6

    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_9

    .line 793
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    sget-object v17, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    const/16 v18, 0x0

    aget v18, v6, v18

    aget v17, v17, v18

    invoke-virtual/range {v16 .. v17}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 797
    :cond_9
    const/16 v16, 0x0

    aget-object v16, v13, v16

    invoke-virtual/range {v16 .. v16}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v10

    goto/16 :goto_0

    .line 812
    .end local v4           #hasService:Z
    .end local v6           #iconLevel:[I
    .end local v7           #regState:I
    .end local v9           #tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    :cond_a
    return-void

    .line 695
    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data

    .line 775
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

    .line 1201
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v1, :cond_0

    .line 1202
    sget-object v0, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_SIGNAL_STRENGTH:[[I

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mInetCondition:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLevel:I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    .line 1203
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIFI_CONNECTION_STRENGTH:[I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLevel:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    .line 1213
    :goto_0
    return-void

    .line 1206
    :cond_0
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataAndWifiStacked:Z

    if-eqz v1, :cond_1

    .line 1207
    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    .line 1211
    :goto_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v1, 0x7f0b0088

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    goto :goto_0

    .line 1209
    :cond_1
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiEnabled:Z

    if-eqz v1, :cond_2

    const v0, 0x7f020230

    :cond_2
    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    goto :goto_1
.end method

.method private updateWifiState(Landroid/content/Intent;)V
    .locals 11
    .parameter "intent"

    .prologue
    const/4 v10, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 1148
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1149
    .local v0, action:Ljava/lang/String;
    const-string v9, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1150
    const-string v9, "wifi_state"

    const/4 v10, 0x4

    invoke-virtual {p1, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    const/4 v10, 0x3

    if-ne v9, v10, :cond_1

    :goto_0
    iput-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiEnabled:Z

    .line 1194
    :cond_0
    :goto_1
    const-string v7, "NetworkControllerCoolpad"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateWifiState: mWifiLevel = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLevel:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "  mWifiRssi="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiRssi:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " mWifiConnected is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1197
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWifiIcons()V

    .line 1198
    return-void

    :cond_1
    move v7, v8

    .line 1150
    goto :goto_0

    .line 1152
    :cond_2
    const-string v9, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 1153
    const-string v9, "networkInfo"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/net/NetworkInfo;

    .line 1155
    .local v2, networkInfo:Landroid/net/NetworkInfo;
    iget-boolean v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    .line 1156
    .local v5, wasConnected:Z
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_5

    :goto_2
    iput-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    .line 1158
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v7, :cond_7

    if-nez v5, :cond_7

    .line 1160
    const-string v7, "wifiInfo"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiInfo;

    .line 1161
    .local v1, info:Landroid/net/wifi/WifiInfo;
    if-nez v1, :cond_3

    .line 1162
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 1164
    :cond_3
    if-eqz v1, :cond_6

    .line 1165
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->huntForSsid(Landroid/net/wifi/WifiInfo;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiSsid:Ljava/lang/String;

    .line 1175
    .end local v1           #info:Landroid/net/wifi/WifiInfo;
    :cond_4
    :goto_3
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v7, :cond_0

    .line 1176
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const-string v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v6

    .line 1179
    .local v6, wifiInfo:Landroid/net/wifi/WifiInfo;
    if-eqz v6, :cond_0

    .line 1180
    invoke-virtual {v6}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v3

    .line 1181
    .local v3, newRssi:I
    sget v7, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_LEVEL_COUNT:I

    invoke-static {v3, v7}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v4

    .line 1183
    .local v4, newSignalLevel:I
    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLevel:I

    if-eq v4, v7, :cond_0

    .line 1184
    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLevel:I

    goto/16 :goto_1

    .end local v3           #newRssi:I
    .end local v4           #newSignalLevel:I
    .end local v6           #wifiInfo:Landroid/net/wifi/WifiInfo;
    :cond_5
    move v7, v8

    .line 1156
    goto :goto_2

    .line 1167
    .restart local v1       #info:Landroid/net/wifi/WifiInfo;
    :cond_6
    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiSsid:Ljava/lang/String;

    goto :goto_3

    .line 1169
    .end local v1           #info:Landroid/net/wifi/WifiInfo;
    :cond_7
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-nez v7, :cond_4

    .line 1170
    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiSsid:Ljava/lang/String;

    goto :goto_3

    .line 1188
    .end local v2           #networkInfo:Landroid/net/NetworkInfo;
    .end local v5           #wasConnected:Z
    :cond_8
    const-string v7, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1189
    const-string v7, "newRssi"

    const/16 v8, -0xc8

    invoke-virtual {p1, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiRssi:I

    .line 1190
    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiRssi:I

    sget v8, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_LEVEL_COUNT:I

    invoke-static {v7, v8}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v7

    iput v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLevel:I

    goto/16 :goto_1
.end method

.method private updateWimaxIcons()V
    .locals 3

    .prologue
    .line 1256
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsWimaxEnabled:Z

    if-eqz v0, :cond_2

    .line 1257
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    if-eqz v0, :cond_1

    .line 1258
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIdle:Z

    if-eqz v0, :cond_0

    .line 1259
    sget v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_IDLE:I

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    .line 1263
    :goto_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIMAX_CONNECTION_STRENGTH:[I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSignal:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWimax:Ljava/lang/String;

    .line 1272
    :goto_1
    return-void

    .line 1261
    :cond_0
    sget-object v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_SIGNAL_STRENGTH:[[I

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mInetCondition:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSignal:I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    goto :goto_0

    .line 1266
    :cond_1
    sget v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_DISCONNECTED:I

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    .line 1267
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v1, 0x7f0b008d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWimax:Ljava/lang/String;

    goto :goto_1

    .line 1270
    :cond_2
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    goto :goto_1
.end method

.method private final updateWimaxState(Landroid/content/Intent;)V
    .locals 7
    .parameter "intent"

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1232
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1233
    .local v0, action:Ljava/lang/String;
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    .line 1234
    .local v1, wasConnected:Z
    const-string v5, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1235
    const-string v5, "4g_state"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 1237
    .local v2, wimaxStatus:I
    const/4 v5, 0x3

    if-ne v2, v5, :cond_1

    :goto_0
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsWimaxEnabled:Z

    .line 1251
    .end local v2           #wimaxStatus:I
    :cond_0
    :goto_1
    invoke-direct {p0, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V

    .line 1252
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWimaxIcons()V

    .line 1253
    return-void

    .restart local v2       #wimaxStatus:I
    :cond_1
    move v3, v4

    .line 1237
    goto :goto_0

    .line 1239
    .end local v2           #wimaxStatus:I
    :cond_2
    const-string v5, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1240
    const-string v3, "newSignalLevel"

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSignal:I

    goto :goto_1

    .line 1241
    :cond_3
    const-string v5, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1242
    const-string v5, "WimaxState"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxState:I

    .line 1244
    const-string v5, "WimaxStateDetail"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxExtraState:I

    .line 1247
    iget v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxState:I

    const/4 v6, 0x7

    if-ne v5, v6, :cond_4

    move v5, v3

    :goto_2
    iput-boolean v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    .line 1249
    iget v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxExtraState:I

    const/4 v6, 0x6

    if-ne v5, v6, :cond_5

    :goto_3
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIdle:Z

    goto :goto_1

    :cond_4
    move v5, v4

    .line 1247
    goto :goto_2

    :cond_5
    move v3, v4

    .line 1249
    goto :goto_3
.end method


# virtual methods
.method public addCombinedLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 398
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 399
    return-void
.end method

.method public addCombinedSignalIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 390
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 391
    return-void
.end method

.method public addDataDirectionIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 374
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 375
    return-void
.end method

.method public addDataDirectionOverlayIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 378
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    return-void
.end method

.method public addDataTypeIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 394
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 395
    return-void
.end method

.method public addEmergencyLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 410
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mEmergencyLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 411
    return-void
.end method

.method public addMobileLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 402
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 403
    return-void
.end method

.method public addPhoneSignalIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 370
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    return-void
.end method

.method public addSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;)V
    .locals 1
    .parameter "cluster"

    .prologue
    .line 414
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 415
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;)V

    .line 416
    return-void
.end method

.method public addWifiIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 382
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 383
    return-void
.end method

.method public addWifiLabelView(Landroid/widget/TextView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 406
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 407
    return-void
.end method

.method public addWimaxIconView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 386
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
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

    .line 2007
    const-string v1, "NetworkControllerCoolpad state:"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2008
    const-string v2, "  %s network type %d (%s)"

    const/4 v1, 0x3

    new-array v3, v1, [Ljava/lang/Object;

    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnected:Z

    if-eqz v1, :cond_0

    const-string v1, "CONNECTED"

    :goto_0
    aput-object v1, v3, v4

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v5

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkTypeName:Ljava/lang/String;

    aput-object v1, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2011
    const-string v1, "------ telephony ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2013
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_1

    .line 2014
    const-string v1, "====== SlotId: %d ======"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2015
    const-string v1, "  hasService ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2016
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2017
    const-string v1, "  mDataConnected ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2018
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    aget-boolean v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2019
    const-string v1, "  mSimState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2020
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2021
    const-string v1, "  mDataState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2022
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataState:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2023
    const-string v1, "  mDataActivity ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2024
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataActivity:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2025
    const-string v1, "  mDataNetType ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2026
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 2027
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2028
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType:[I

    aget v1, v1, v0

    invoke-static {v1}, Landroid/telephony/TelephonyManager;->getNetworkTypeName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2029
    const-string v1, "  mServiceState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2030
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2031
    const-string v1, "  mSignalStrength ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2032
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2033
    const-string v1, "  mNetworkName ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2034
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2035
    const-string v1, "  mPhoneSignalIconId =0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2036
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2037
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2038
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2039
    const-string v1, "  mDataDirectionIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2040
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconId:[I

    aget v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2041
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2042
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconId:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2043
    const-string v1, "  mDataSignalIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2044
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2045
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2046
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2047
    const-string v1, "  mDataTypeIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2048
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2049
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2050
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2052
    const-string v1, "  mLastPhoneSignalIconId[0]=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2053
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v4

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2054
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2055
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v4

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2056
    const-string v1, "  mLastPhoneSignalIconId[1]=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2057
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v5

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2058
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2059
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v5

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2061
    const-string v1, "  mLastDataTypeIconId =0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2062
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataTypeIconId:[I

    aget v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2063
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2064
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataTypeIconId:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2013
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 2008
    .end local v0           #i:I
    :cond_0
    const-string v1, "DISCONNECTED"

    goto/16 :goto_0

    .line 2067
    .restart local v0       #i:I
    :cond_1
    const-string v1, "------ wifi ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2068
    const-string v1, "  mWifiEnabled="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2069
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiEnabled:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2070
    const-string v1, "  mWifiConnected="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2071
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2072
    const-string v1, "  mWifiRssi="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2073
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiRssi:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2074
    const-string v1, "  mWifiLevel="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2075
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLevel:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2076
    const-string v1, "  mWifiSsid="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2077
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiSsid:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2078
    const-string v1, "  mWifiIconId=0x%08x/%s"

    new-array v2, v6, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2080
    const-string v1, "  mWifiActivity="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2081
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivity:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2083
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSupported:Z

    if-eqz v1, :cond_2

    .line 2084
    const-string v1, "------ wimax ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2085
    const-string v1, "  mIsWimaxEnabled="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2086
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsWimaxEnabled:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2087
    const-string v1, "  mWimaxConnected="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2088
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2089
    const-string v1, "  mWimaxIdle="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2090
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIdle:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2091
    const-string v1, "  mWimaxIconId=0x%08x/%s"

    new-array v2, v6, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2093
    const-string v1, "  mWimaxSignal=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxSignal:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2094
    const-string v1, "  mWimaxState=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2095
    const-string v1, "  mWimaxExtraState=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxExtraState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2098
    :cond_2
    const-string v1, "------ Bluetooth ----"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2099
    const-string v1, "  mBtReverseTethered="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2100
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTethered:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2102
    const-string v1, "------ connectivity ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2103
    const-string v1, "  mInetCondition="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2104
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mInetCondition:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2106
    const-string v1, "------ icons ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2107
    const-string v1, "  mLastDataDirectionIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2108
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2109
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2110
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2111
    const-string v1, "  mLastDataDirectionOverlayIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2112
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionOverlayIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2113
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2114
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionOverlayIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2115
    const-string v1, "  mLastWifiIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2116
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWifiIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2117
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2118
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWifiIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2119
    const-string v1, "  mLastCombinedSignalIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2120
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedSignalIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2121
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2122
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedSignalIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2123
    const-string v1, "  mLastCombinedLabel="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2124
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedLabel:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2125
    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2126
    return-void
.end method

.method public hasMobileDataFeature()Z
    .locals 1

    .prologue
    .line 362
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    return v0
.end method

.method public hideSimIndicator(I)V
    .locals 3
    .parameter "slotId"

    .prologue
    .line 2288
    const-string v0, "NetworkControllerCoolpad"

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

    .line 2289
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimIndicatorFlag:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1

    .line 2290
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V

    .line 2291
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V

    .line 2292
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V

    .line 2293
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 2294
    return-void
.end method

.method isCdmaEri(I)Z
    .locals 5
    .parameter "slotId"

    .prologue
    const/4 v3, 0x1

    .line 947
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v2, v4, p1

    .line 949
    .local v2, tempServiceState:Landroid/telephony/ServiceState;
    if-eqz v2, :cond_1

    .line 950
    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getCdmaEriIconIndex()I

    move-result v0

    .line 951
    .local v0, iconIndex:I
    if-eq v0, v3, :cond_1

    .line 952
    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getCdmaEriIconMode()I

    move-result v1

    .line 953
    .local v1, iconMode:I
    if-eqz v1, :cond_0

    if-ne v1, v3, :cond_1

    .line 959
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

    .line 366
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

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

    .line 459
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    .line 460
    .local v6, action:Ljava/lang/String;
    const-string v0, "NetworkControllerCoolpad"

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

    .line 461
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

    .line 464
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWifiState(Landroid/content/Intent;)V

    .line 465
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    .line 543
    :cond_1
    :goto_0
    return-void

    .line 466
    :cond_2
    const-string v0, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 467
    const-string v0, "simId"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 468
    .local v1, slotId:I
    invoke-direct {p0, v1, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateSimState(ILandroid/content/Intent;)V

    .line 469
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V

    .line 470
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    goto :goto_0

    .line 471
    .end local v1           #slotId:I
    :cond_3
    const-string v0, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 472
    const-string v0, "simId"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 473
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

    invoke-virtual/range {v0 .. v5}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateNetworkName(IZLjava/lang/String;ZLjava/lang/String;)V

    .line 478
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    goto :goto_0

    .line 479
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

    .line 481
    :cond_5
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 482
    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/NetworkInfo;

    .line 483
    .local v7, info:Landroid/net/NetworkInfo;
    if-nez v7, :cond_6

    .line 484
    const-string v0, "NetworkControllerCoolpad"

    const-string v2, "onReceive, ConnectivityManager.CONNECTIVITY_ACTION networkinfo is null."

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 487
    :cond_6
    invoke-virtual {v7}, Landroid/net/NetworkInfo;->getType()I

    move-result v10

    .line 488
    .local v10, type:I
    const-string v0, "NetworkControllerCoolpad"

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

    .line 489
    if-eq v10, v5, :cond_7

    if-eqz v10, :cond_7

    const/4 v0, 0x7

    if-eq v10, v0, :cond_7

    if-eq v10, v11, :cond_7

    const/16 v0, 0x9

    if-ne v10, v0, :cond_1

    .line 495
    .end local v7           #info:Landroid/net/NetworkInfo;
    .end local v10           #type:I
    :cond_7
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateConnectivity(Landroid/content/Intent;)V

    .line 496
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateOperatorInfo()V

    .line 497
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 498
    :cond_8
    const-string v0, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 499
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 500
    :cond_9
    const-string v0, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 501
    :cond_a
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateAirplaneMode()V

    .line 502
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 503
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

    .line 506
    :cond_c
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateWimaxState(Landroid/content/Intent;)V

    .line 507
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 508
    :cond_d
    const-string v0, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 509
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 510
    const-string v0, "type"

    invoke-virtual {p2, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    .line 511
    .restart local v10       #type:I
    const-string v0, "simid"

    const-wide/16 v2, -0x1

    invoke-virtual {p2, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    .line 512
    .local v8, simId:J
    if-ne v10, v11, :cond_e

    .line 514
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType()V

    .line 515
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength()V

    .line 516
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateOperatorInfo()V

    .line 518
    :cond_e
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 519
    .end local v8           #simId:J
    .end local v10           #type:I
    :cond_f
    const-string v0, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 520
    const-string v0, "slotId"

    invoke-virtual {p2, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 521
    .restart local v1       #slotId:I
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V

    .line 522
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V

    .line 523
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateOperatorInfo()V

    .line 524
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 525
    .end local v1           #slotId:I
    :cond_10
    const-string v0, "android.intent.action.SIM_INSERTED_STATUS"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 526
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 527
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType()V

    .line 528
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength()V

    .line 529
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateOperatorInfo()V

    .line 530
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 531
    :cond_11
    const-string v0, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 532
    const-string v0, "NetworkControllerCoolpad"

    const-string v2, "onReceive from TelephonyIntents.ACTION_SIM_INFO_UPDATE"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimCardReady:Z

    .line 534
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 535
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType()V

    .line 536
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength()V

    .line 537
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateOperatorInfo()V

    .line 538
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews()V

    goto/16 :goto_0

    .line 539
    :cond_12
    const-string v0, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 540
    const-string v0, "NetworkControllerCoolpad"

    const-string v2, "onReceive from android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimCardReady:Z

    goto/16 :goto_0
.end method

.method public refreshSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;)V
    .locals 8
    .parameter "cluster"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 419
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    invoke-interface {p1, v0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setRoamingFlagandResource([Z[I)V

    .line 420
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    if-nez v0, :cond_2

    :cond_0
    move v0, v2

    :goto_0
    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    iget v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    invoke-interface {p1, v0, v3, v4, v5}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setWifiIndicators(ZIILjava/lang/String;)V

    .line 425
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsWimaxEnabled:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    if-eqz v0, :cond_4

    .line 427
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAlwaysShowCdmaRssi:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v0, v1

    :goto_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v5, v0, v1

    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWimax:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v7, v0, v1

    move-object v0, p1

    invoke-interface/range {v0 .. v7}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    :cond_1
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    invoke-interface {p1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setIsAirplaneMode(Z)V

    .line 449
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastAirplaneMode:Z

    .line 450
    invoke-interface {p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->apply()V

    .line 451
    return-void

    :cond_2
    move v0, v1

    .line 420
    goto :goto_0

    .line 427
    :cond_3
    const/4 v0, 0x2

    new-array v3, v0, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v0, Lcom/mediatek/systemui/ext/IconIdWrapper;

    iget v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    invoke-direct {v0, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v0, v3, v1

    new-instance v0, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v0, v3, v2

    goto :goto_1

    .line 437
    :cond_4
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    iget v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    if-ge v1, v0, :cond_1

    .line 438
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v5, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    aget-object v6, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v7, v0, v1

    move-object v0, p1

    invoke-interface/range {v0 .. v7}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method refreshViews()V
    .locals 2

    .prologue
    .line 1343
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    if-ge v0, v1, :cond_0

    .line 1344
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 1343
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1346
    :cond_0
    return-void
.end method

.method refreshViews(I)V
    .locals 41
    .parameter "slotId"

    .prologue
    .line 1349
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    .line 1351
    .local v15, context:Landroid/content/Context;
    new-instance v14, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1352
    .local v14, combinedSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1353
    .local v12, combinedActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const-string v13, ""

    .line 1354
    .local v13, combinedLabel:Ljava/lang/String;
    const-string v38, ""

    .line 1355
    .local v38, wifiLabel:Ljava/lang/String;
    const-string v23, ""

    .line 1357
    .local v23, mobileLabel:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isEmergencyOnly()Z

    move-result v16

    .line 1364
    .local v16, emergencyOnly:Z
    new-instance v29, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v29 .. v29}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1365
    .local v29, tempDataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
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

    .line 1367
    .local v5, tempPhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    const-string v8, ""

    .line 1368
    .local v8, tempContentDescriptionPhoneSignal:Ljava/lang/String;
    const-string v9, ""

    .line 1369
    .local v9, tempContentDescriptionDataType:Ljava/lang/String;
    const-string v24, ""

    .line 1371
    .local v24, tempContentDescriptionCombinedSignal:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v35, v3, p1

    .line 1372
    .local v35, tempSignalStrength:Landroid/telephony/SignalStrength;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v34, v3, p1

    .line 1373
    .local v34, tempServiceState:Landroid/telephony/ServiceState;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    aget-boolean v26, v3, p1

    .line 1374
    .local v26, tempDataConnected:Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataActivity:[I

    aget v25, v3, p1

    .line 1375
    .local v25, tempDataActivity:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v28, v3, p1

    .line 1376
    .local v28, tempDataNetType3G:Lcom/mediatek/systemui/ext/NetworkType;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v29

    .line 1377
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    aget-object v8, v3, p1

    .line 1378
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v9, v3, p1

    .line 1379
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v39, 0x0

    aget-object v4, v4, v39

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1380
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v39, 0x1

    aget-object v4, v4, v39

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1381
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    aget-object v33, v3, p1

    .line 1383
    .local v33, tempNetworkName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    if-nez v3, :cond_7

    .line 1384
    const/4 v3, 0x0

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1385
    const/4 v3, 0x0

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1386
    const/4 v3, 0x0

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1387
    const/4 v3, 0x0

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1388
    const/4 v3, 0x1

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1389
    const/4 v3, 0x1

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1390
    const-string v23, ""

    .line 1477
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v3, :cond_13

    .line 1478
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiSsid:Ljava/lang/String;

    if-nez v3, :cond_12

    .line 1479
    const v3, 0x7f0b00a7

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v38

    .line 1480
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    .line 1503
    :goto_0
    move-object/from16 v13, v38

    .line 1504
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1505
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1506
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1507
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v24, v0

    .line 1517
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTethered:Z

    if-eqz v3, :cond_1

    .line 1518
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v4, 0x7f0b005c

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1519
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1520
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTetherIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1521
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v4, 0x7f0b009a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 1525
    :cond_1
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkType:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_15

    const/16 v17, 0x1

    .line 1526
    .local v17, ethernetConnected:Z
    :goto_2
    if-eqz v17, :cond_2

    .line 1528
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnectedNetworkTypeName:Ljava/lang/String;

    .line 1531
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    if-eqz v3, :cond_18

    if-eqz v34, :cond_3

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_18

    invoke-virtual/range {v34 .. v34}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v3

    if-nez v3, :cond_18

    .line 1536
    :cond_3
    const-string v3, "NetworkControllerCoolpad"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "refreshViews("

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "), AirplaneMode="

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    move/from16 v39, v0

    move/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1537
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    const v4, 0x7f0b009b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1538
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isSimInserted(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1539
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1540
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const v4, 0x7f0201d7

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1541
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v29

    .line 1542
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    aget-object v3, v3, v4

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1543
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalNullIcon(I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1544
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1545
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1549
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v3, :cond_16

    .line 1551
    const-string v23, ""

    .line 1614
    :cond_5
    :goto_3
    new-instance v7, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1615
    .local v7, tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1616
    .local v6, tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconId:[I

    aget v27, v3, p1

    .line 1617
    .local v27, tempDataDirectionIconId:I
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v39, 0x0

    aget-object v4, v4, v39

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1618
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v39, 0x1

    aget-object v4, v4, v39

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1619
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v7

    .line 1620
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v6

    .line 1650
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v32, v3, p1

    .line 1651
    .local v32, tempLastPhoneSignalIconId:[I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataTypeIconId:[I

    aget v30, v3, p1

    .line 1652
    .local v30, tempLastDataTypeIconId:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastMobileActivityIconId:[I

    aget v31, v3, p1

    .line 1654
    .local v31, tempLastMobileActivityIconId:I
    const/4 v3, 0x0

    aget v3, v32, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_6

    const/4 v3, 0x1

    aget v3, v32, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_6

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionOverlayIconId:I

    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_6

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWifiIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    if-ne v3, v4, :cond_6

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWimaxIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    if-ne v3, v4, :cond_6

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v30

    if-ne v0, v3, :cond_6

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v31

    if-ne v0, v3, :cond_6

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastAirplaneMode:Z

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    if-eq v3, v4, :cond_20

    .line 1663
    :cond_6
    const-string v3, "NetworkControllerCoolpad"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "refreshViews("

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "), set parameters to signal cluster view."

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1665
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;

    .line 1666
    .local v2, cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    move/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v40, v0

    move/from16 v0, v39

    move-object/from16 v1, v40

    invoke-interface {v2, v3, v4, v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setWifiIndicators(ZIILjava/lang/String;)V

    .line 1672
    const-string v3, "NetworkControllerCoolpad"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "refreshViews("

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "), tempPhoneSignalIconId.0 = "

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v39, 0x0

    aget-object v39, v5, v39

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    move/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "  tempPhoneSignalIconId.1 = "

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v39, 0x1

    aget-object v39, v5, v39

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    move/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "  tempMobileActivityIconId= "

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    move/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "  tempDataTypeIconId= "

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    move/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1676
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    move/from16 v3, p1

    invoke-interface/range {v2 .. v9}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 1684
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    invoke-interface {v2, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setIsAirplaneMode(Z)V

    .line 1685
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mAirplaneMode:Z

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastAirplaneMode:Z

    goto/16 :goto_4

    .line 1399
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v7           #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v17           #ethernetConnected:Z
    .end local v20           #i$:Ljava/util/Iterator;
    .end local v27           #tempDataDirectionIconId:I
    .end local v30           #tempLastDataTypeIconId:I
    .end local v31           #tempLastMobileActivityIconId:I
    .end local v32           #tempLastPhoneSignalIconId:[I
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_d

    .line 1400
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    const/4 v4, 0x0

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_8

    .line 1401
    move-object/from16 v23, v33

    .line 1421
    :goto_5
    const-string v3, "NetworkControllerCoolpad"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "refreshViews("

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "), DataConnected="

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1423
    if-eqz v26, :cond_10

    .line 1424
    invoke-virtual/range {v29 .. v29}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1425
    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1426
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const/16 v21, 0x0

    .line 1428
    .local v21, iconList:[I
    const/4 v3, 0x0

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1429
    packed-switch v25, :pswitch_data_0

    .line 1440
    const/4 v3, 0x1

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->GetCurNetWorkTypeForSignal(I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalDataActivityIcon(II)I

    move-result v3

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1445
    :goto_6
    move-object/from16 v13, v23

    .line 1446
    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v12

    .line 1447
    invoke-virtual/range {v29 .. v29}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1448
    move-object/from16 v24, v9

    .line 1449
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v3, p1

    .line 1452
    const/16 v19, 0x0

    .local v19, i:I
    :goto_7
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    move/from16 v0, v19

    if-ge v0, v3, :cond_0

    .line 1453
    move/from16 v0, v19

    move/from16 v1, p1

    if-ne v0, v1, :cond_f

    .line 1454
    const-string v3, "NetworkControllerCoolpad"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "refreshViews("

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "), mMobileActivityIconId="

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v39, v0

    aget-object v39, v39, v19

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    move/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1452
    :goto_8
    add-int/lit8 v19, v19, 0x1

    goto :goto_7

    .line 1402
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v19           #i:I
    .end local v21           #iconList:[I
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mConnected:Z

    if-nez v3, :cond_9

    if-eqz v16, :cond_c

    .line 1403
    :cond_9
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_a

    if-eqz v16, :cond_b

    .line 1404
    :cond_a
    move-object/from16 v23, v33

    goto/16 :goto_5

    .line 1406
    :cond_b
    const-string v23, ""

    goto/16 :goto_5

    .line 1409
    :cond_c
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v23

    goto/16 :goto_5

    .line 1413
    :cond_d
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 1414
    move-object/from16 v23, v33

    goto/16 :goto_5

    .line 1416
    :cond_e
    const-string v23, ""

    goto/16 :goto_5

    .line 1431
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v21       #iconList:[I
    :pswitch_0
    const/4 v3, 0x2

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->GetCurNetWorkTypeForSignal(I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalDataActivityIcon(II)I

    move-result v3

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_6

    .line 1434
    :pswitch_1
    const/4 v3, 0x3

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->GetCurNetWorkTypeForSignal(I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalDataActivityIcon(II)I

    move-result v3

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_6

    .line 1437
    :pswitch_2
    const/4 v3, 0x4

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->GetCurNetWorkTypeForSignal(I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalDataActivityIcon(II)I

    move-result v3

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_6

    .line 1457
    .restart local v19       #i:I
    :cond_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v19

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1458
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v19

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1459
    const-string v3, "NetworkControllerCoolpad"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "refreshViews("

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v39, "), mMobileActivityIconId="

    move-object/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v39, v0

    aget-object v39, v39, v19

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    move/from16 v0, v39

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 1463
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v19           #i:I
    .end local v21           #iconList:[I
    :cond_10
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1464
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1465
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1466
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1468
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_9
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    move/from16 v0, v19

    if-ge v0, v3, :cond_0

    .line 1469
    move/from16 v0, v19

    move/from16 v1, p1

    if-ne v0, v1, :cond_11

    .line 1468
    :goto_a
    add-int/lit8 v19, v19, 0x1

    goto :goto_9

    .line 1470
    :cond_11
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1471
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_a

    .line 1482
    .end local v19           #i:I
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiSsid:Ljava/lang/String;

    move-object/from16 v38, v0

    .line 1486
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivity:I

    packed-switch v3, :pswitch_data_1

    goto/16 :goto_0

    .line 1497
    :pswitch_3
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1488
    :pswitch_4
    const v3, 0x7f020224

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1491
    :pswitch_5
    const v3, 0x7f020226

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1494
    :pswitch_6
    const v3, 0x7f020225

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiActivityIconId:I

    goto/16 :goto_0

    .line 1510
    :cond_13
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_14

    .line 1511
    const-string v38, ""

    goto/16 :goto_1

    .line 1513
    :cond_14
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v38

    goto/16 :goto_1

    .line 1525
    :cond_15
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 1553
    .restart local v17       #ethernetConnected:Z
    :cond_16
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_17

    .line 1555
    const-string v38, ""

    .line 1560
    :goto_b
    move-object/from16 v24, v8

    .line 1561
    invoke-virtual/range {v29 .. v29}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    goto/16 :goto_3

    .line 1557
    :cond_17
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v38

    .line 1558
    move-object/from16 v13, v38

    goto :goto_b

    .line 1564
    :cond_18
    if-nez v26, :cond_5

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-nez v3, :cond_5

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mBluetoothTethered:Z

    if-nez v3, :cond_5

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxConnected:Z

    if-nez v3, :cond_5

    if-nez v17, :cond_5

    .line 1567
    const v3, 0x7f0b00a6

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1569
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_1b

    .line 1570
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_19

    .line 1571
    invoke-virtual/range {v29 .. v29}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1576
    :goto_c
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_1a

    move-object/from16 v24, v9

    .line 1601
    :goto_d
    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1602
    .local v11, cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aget-object v36, v3, p1

    .line 1604
    .local v36, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 1605
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    const/4 v4, 0x1

    aput-boolean v4, v3, p1

    .line 1606
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalRoamingIcon(I)I

    move-result v4

    aput v4, v3, p1

    goto/16 :goto_3

    .line 1573
    .end local v11           #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v36           #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    :cond_19
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1574
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_c

    .line 1576
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v24, v0

    goto :goto_d

    .line 1579
    :cond_1b
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_1c

    .line 1580
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1581
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1582
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v24, v0

    goto :goto_d

    .line 1584
    :cond_1c
    const/4 v3, 0x1

    move/from16 v0, p1

    if-ne v0, v3, :cond_1d

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    const/4 v4, 0x0

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_1d

    .line 1585
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v13, v3, v4

    .line 1586
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1587
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionDataType:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v24, v3, v4

    goto :goto_d

    .line 1588
    :cond_1d
    if-nez p1, :cond_1e

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    const/4 v4, 0x1

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_1e

    .line 1589
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v13, v3, v4

    .line 1590
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1591
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionDataType:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v24, v3, v4

    goto/16 :goto_d

    .line 1593
    :cond_1e
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1594
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1595
    move-object/from16 v24, v9

    goto/16 :goto_d

    .line 1608
    .restart local v11       #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v36       #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    :cond_1f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    const/4 v4, 0x0

    aput-boolean v4, v3, p1

    .line 1609
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    const/4 v4, 0x0

    aput v4, v3, p1

    goto/16 :goto_3

    .line 1688
    .end local v11           #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v36           #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v7       #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v27       #tempDataDirectionIconId:I
    .restart local v30       #tempLastDataTypeIconId:I
    .restart local v31       #tempLastMobileActivityIconId:I
    .restart local v32       #tempLastPhoneSignalIconId:[I
    :cond_20
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .restart local v20       #i$:Ljava/util/Iterator;
    :goto_e
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;

    .line 1689
    .restart local v2       #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoaming:[Z

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsRoamingId:[I

    invoke-interface {v2, v3, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setRoamingFlagandResource([Z[I)V

    .line 1690
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimIndicatorFlag:[Z

    aget-boolean v3, v3, p1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimIndicatorResId:[I

    aget v4, v4, p1

    move/from16 v0, p1

    invoke-interface {v2, v0, v3, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setShowSimIndicator(IZI)V

    .line 1691
    move/from16 v0, p1

    move-object/from16 v1, v28

    invoke-interface {v2, v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->setDataNetType3G(ILcom/mediatek/systemui/ext/NetworkType;)V

    goto :goto_e

    .line 1695
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    :cond_21
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_f
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;

    .line 1696
    .restart local v2       #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    invoke-interface {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;->apply()V

    goto :goto_f

    .line 1700
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad$SignalCluster;
    :cond_22
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_27

    .line 1701
    const/4 v3, 0x0

    aget v3, v32, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_23

    const/4 v3, 0x1

    aget v3, v32, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_2a

    .line 1704
    :cond_23
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x0

    const/16 v39, 0x0

    aget-object v39, v5, v39

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    aput v39, v3, v4

    .line 1705
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x1

    const/16 v39, 0x1

    aget-object v39, v5, v39

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    aput v39, v3, v4

    .line 1707
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1708
    .local v10, N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_10
    move/from16 v0, v19

    if-ge v0, v10, :cond_2a

    .line 1709
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1710
    .local v37, v:Landroid/widget/ImageView;
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_24

    .line 1711
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1708
    :goto_11
    add-int/lit8 v19, v19, 0x1

    goto :goto_10

    .line 1713
    :cond_24
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1714
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_25

    .line 1715
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1723
    :goto_12
    move-object/from16 v0, v37

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_11

    .line 1717
    :cond_25
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_26

    .line 1718
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_12

    .line 1720
    :cond_26
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_12

    .line 1728
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_27
    const/4 v3, 0x0

    aget v3, v32, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_28

    const/4 v3, 0x1

    aget v3, v32, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_2a

    .line 1732
    :cond_28
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x0

    const/16 v39, 0x0

    aget-object v39, v5, v39

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    aput v39, v3, v4

    .line 1733
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x1

    const/16 v39, 0x1

    aget-object v39, v5, v39

    invoke-virtual/range {v39 .. v39}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v39

    aput v39, v3, v4

    .line 1734
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1736
    .restart local v37       #v:Landroid/widget/ImageView;
    if-eqz v37, :cond_2a

    .line 1737
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_29

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_2b

    .line 1738
    :cond_29
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1757
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_2a
    :goto_13
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionIconId:I

    move/from16 v0, v27

    if-eq v3, v0, :cond_30

    .line 1758
    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionIconId:I

    .line 1759
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1760
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_14
    move/from16 v0, v19

    if-ge v0, v10, :cond_30

    .line 1761
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionIconViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1762
    .restart local v37       #v:Landroid/widget/ImageView;
    if-nez v27, :cond_2f

    .line 1763
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_2e

    .line 1764
    const/4 v3, 0x4

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1760
    :goto_15
    add-int/lit8 v19, v19, 0x1

    goto :goto_14

    .line 1740
    .end local v10           #N:I
    .end local v19           #i:I
    :cond_2b
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1741
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_2c

    .line 1742
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1750
    :goto_16
    move-object/from16 v0, v37

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_13

    .line 1744
    :cond_2c
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_2d

    .line 1745
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_16

    .line 1747
    :cond_2d
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_16

    .line 1766
    .restart local v10       #N:I
    .restart local v19       #i:I
    :cond_2e
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_15

    .line 1769
    :cond_2f
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1770
    move-object/from16 v0, v37

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1771
    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_15

    .line 1776
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_30
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWifiIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    if-eq v3, v4, :cond_32

    .line 1777
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWifiIconId:I

    .line 1778
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1779
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_17
    move/from16 v0, v19

    if-ge v0, v10, :cond_32

    .line 1780
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1781
    .restart local v37       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    if-nez v3, :cond_31

    .line 1782
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1779
    :goto_18
    add-int/lit8 v19, v19, 0x1

    goto :goto_17

    .line 1784
    :cond_31
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1785
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiIconId:I

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1786
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_18

    .line 1792
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_32
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWimaxIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    if-eq v3, v4, :cond_34

    .line 1793
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastWimaxIconId:I

    .line 1794
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1795
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_19
    move/from16 v0, v19

    if-ge v0, v10, :cond_34

    .line 1796
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1797
    .restart local v37       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    if-nez v3, :cond_33

    .line 1798
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1795
    :goto_1a
    add-int/lit8 v19, v19, 0x1

    goto :goto_19

    .line 1800
    :cond_33
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1801
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWimaxIconId:I

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1802
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContentDescriptionWimax:Ljava/lang/String;

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1a

    .line 1807
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_34
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedSignalIconId:I

    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_3e

    .line 1808
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedSignalIconId:I

    .line 1809
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1810
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_1b
    move/from16 v0, v19

    if-ge v0, v10, :cond_3e

    .line 1811
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1812
    .restart local v37       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_37

    .line 1813
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_35

    .line 1814
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1822
    :goto_1c
    move-object/from16 v0, v37

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1810
    :goto_1d
    add-int/lit8 v19, v19, 0x1

    goto :goto_1b

    .line 1816
    :cond_35
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_36

    .line 1817
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1c

    .line 1819
    :cond_36
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1c

    .line 1824
    :cond_37
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v3, :cond_3d

    .line 1825
    const/16 v18, 0x0

    .line 1826
    .local v18, flag:Z
    const/16 v22, 0x0

    .local v22, j:I
    :goto_1e
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mGeminiSimNum:I

    move/from16 v0, v22

    if-ge v0, v3, :cond_38

    .line 1827
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataConnected:[Z

    aget-boolean v3, v3, v22

    if-eqz v3, :cond_3a

    .line 1828
    const/16 v18, 0x1

    .line 1832
    :cond_38
    if-eqz v18, :cond_39

    .line 1833
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1834
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_3b

    .line 1835
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1843
    :goto_1f
    move-object/from16 v0, v37

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1845
    :cond_39
    move-object/from16 v0, v37

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1d

    .line 1826
    :cond_3a
    add-int/lit8 v22, v22, 0x1

    goto :goto_1e

    .line 1837
    :cond_3b
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_3c

    .line 1838
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1f

    .line 1840
    :cond_3c
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1f

    .line 1847
    .end local v18           #flag:Z
    .end local v22           #j:I
    :cond_3d
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1d

    .line 1854
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_3e
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_45

    .line 1855
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v30

    if-ne v0, v3, :cond_3f

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v3, :cond_47

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-eqz v3, :cond_47

    .line 1856
    :cond_3f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataTypeIconId:[I

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 1858
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1859
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_20
    move/from16 v0, v19

    if-ge v0, v10, :cond_47

    .line 1860
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1861
    .restart local v37       #v:Landroid/widget/ImageView;
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_40

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-eqz v3, :cond_40

    .line 1862
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1859
    :goto_21
    add-int/lit8 v19, v19, 0x1

    goto :goto_20

    .line 1863
    :cond_40
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-eqz v3, :cond_42

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_41

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v3, :cond_42

    .line 1864
    :cond_41
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_21

    .line 1866
    :cond_42
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1867
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_43

    .line 1868
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1876
    :goto_22
    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_21

    .line 1870
    :cond_43
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_44

    .line 1871
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_22

    .line 1873
    :cond_44
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_22

    .line 1882
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_45
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataTypeIconId:[I

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 1883
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataTypeIconViews:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1885
    .restart local v37       #v:Landroid/widget/ImageView;
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v30

    if-ne v0, v3, :cond_46

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v3, :cond_47

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-eqz v3, :cond_47

    .line 1886
    :cond_46
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_49

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-eqz v3, :cond_49

    .line 1887
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1905
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_47
    :goto_23
    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v31

    if-eq v0, v3, :cond_48

    .line 1906
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastMobileActivityIconId:[I

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 1910
    :cond_48
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionOverlayIconId:I

    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_52

    .line 1914
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastDataDirectionOverlayIconId:I

    .line 1915
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1916
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_24
    move/from16 v0, v19

    if-ge v0, v10, :cond_52

    .line 1917
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/ImageView;

    .line 1918
    .restart local v37       #v:Landroid/widget/ImageView;
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_4f

    .line 1919
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_4e

    .line 1920
    const/4 v3, 0x4

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1916
    :goto_25
    add-int/lit8 v19, v19, 0x1

    goto :goto_24

    .line 1888
    .end local v10           #N:I
    .end local v19           #i:I
    :cond_49
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-eqz v3, :cond_4b

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_4a

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiConnected:Z

    if-eqz v3, :cond_4b

    .line 1889
    :cond_4a
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_23

    .line 1891
    :cond_4b
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1892
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_4c

    .line 1893
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1901
    :goto_26
    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_23

    .line 1895
    :cond_4c
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_4d

    .line 1896
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_26

    .line 1898
    :cond_4d
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_26

    .line 1922
    .restart local v10       #N:I
    .restart local v19       #i:I
    :cond_4e
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_25

    .line 1925
    :cond_4f
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1926
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_50

    .line 1927
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1935
    :goto_27
    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_25

    .line 1929
    :cond_50
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_51

    .line 1930
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_27

    .line 1932
    :cond_51
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_27

    .line 1941
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/ImageView;
    :cond_52
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedLabel:Ljava/lang/String;

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_53

    .line 1942
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mLastCombinedLabel:Ljava/lang/String;

    .line 1943
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1944
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_28
    move/from16 v0, v19

    if-ge v0, v10, :cond_53

    .line 1945
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCombinedLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/TextView;

    .line 1946
    .local v37, v:Landroid/widget/TextView;
    move-object/from16 v0, v37

    invoke-virtual {v0, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1944
    add-int/lit8 v19, v19, 0x1

    goto :goto_28

    .line 1951
    .end local v10           #N:I
    .end local v19           #i:I
    .end local v37           #v:Landroid/widget/TextView;
    :cond_53
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1952
    .restart local v10       #N:I
    const/16 v19, 0x0

    .restart local v19       #i:I
    :goto_29
    move/from16 v0, v19

    if-ge v0, v10, :cond_55

    .line 1953
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mWifiLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/TextView;

    .line 1954
    .restart local v37       #v:Landroid/widget/TextView;
    const-string v3, ""

    move-object/from16 v0, v38

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_54

    .line 1955
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1952
    :goto_2a
    add-int/lit8 v19, v19, 0x1

    goto :goto_29

    .line 1957
    :cond_54
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1958
    invoke-virtual/range {v37 .. v38}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2a

    .line 1963
    .end local v37           #v:Landroid/widget/TextView;
    :cond_55
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mIsScreenLarge:Z

    if-nez v3, :cond_57

    .line 1964
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1965
    const/16 v19, 0x0

    :goto_2b
    move/from16 v0, v19

    if-ge v0, v10, :cond_58

    .line 1966
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/TextView;

    .line 1967
    .restart local v37       #v:Landroid/widget/TextView;
    const-string v3, ""

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_56

    .line 1968
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1965
    :goto_2c
    add-int/lit8 v19, v19, 0x1

    goto :goto_2b

    .line 1970
    :cond_56
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1971
    move-object/from16 v0, v37

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2c

    .line 1976
    .end local v37           #v:Landroid/widget/TextView;
    :cond_57
    if-nez p1, :cond_59

    .line 1977
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileLabelViews:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/TextView;

    .line 1982
    .restart local v37       #v:Landroid/widget/TextView;
    :goto_2d
    if-eqz v37, :cond_58

    .line 1983
    const-string v3, ""

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 1984
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1993
    .end local v37           #v:Landroid/widget/TextView;
    :cond_58
    :goto_2e
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mEmergencyLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1994
    const/16 v19, 0x0

    :goto_2f
    move/from16 v0, v19

    if-ge v0, v10, :cond_5c

    .line 1995
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mEmergencyLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/TextView;

    .line 1996
    .restart local v37       #v:Landroid/widget/TextView;
    if-nez v16, :cond_5b

    .line 1997
    const/16 v3, 0x8

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1994
    :goto_30
    add-int/lit8 v19, v19, 0x1

    goto :goto_2f

    .line 1979
    .end local v37           #v:Landroid/widget/TextView;
    :cond_59
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mMobileLabelViews:Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Landroid/widget/TextView;

    .restart local v37       #v:Landroid/widget/TextView;
    goto :goto_2d

    .line 1986
    :cond_5a
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1987
    move-object/from16 v0, v37

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2e

    .line 1999
    :cond_5b
    move-object/from16 v0, v37

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2000
    const/4 v3, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_30

    .line 2004
    .end local v37           #v:Landroid/widget/TextView;
    :cond_5c
    return-void

    .line 1429
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 1486
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
    .line 2145
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2146
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2147
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2148
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2149
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2150
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
    .line 2154
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2155
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2156
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2157
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2158
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2159
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2160
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2161
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
    .line 2166
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2167
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2168
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2169
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2170
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2171
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2172
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2173
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2174
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2175
    return-void
.end method

.method public setStackedMode(Z)V
    .locals 1
    .parameter "stacked"

    .prologue
    .line 454
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDataAndWifiStacked:Z

    .line 455
    return-void
.end method

.method public showSimIndicator(I)V
    .locals 4
    .parameter "slotId"

    .prologue
    .line 2274
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v0

    .line 2275
    .local v0, simColor:I
    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 2276
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimIndicatorResId:[I

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIcons;->SIM_INDICATOR_BACKGROUND:[I

    aget v2, v2, v0

    aput v2, v1, p1

    .line 2278
    :cond_0
    const-string v1, "NetworkControllerCoolpad"

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

    .line 2279
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mSimIndicatorFlag:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, p1

    .line 2280
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateTelephonySignalStrength(I)V

    .line 2281
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataNetType(I)V

    .line 2282
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->updateDataIcon(I)V

    .line 2283
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->refreshViews(I)V

    .line 2284
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
    .line 1095
    const-string v2, "NetworkControllerCoolpad"

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

    .line 1098
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1099
    .local v1, str:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 1100
    .local v0, something:Z
    if-eqz p4, :cond_0

    if-eqz p5, :cond_0

    .line 1101
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1102
    const/4 v0, 0x1

    .line 1104
    :cond_0
    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    .line 1105
    if-eqz v0, :cond_1

    .line 1106
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkNameSeparator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1108
    :cond_1
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1109
    const/4 v0, 0x1

    .line 1112
    :cond_2
    if-eqz v0, :cond_3

    .line 1113
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, p1

    .line 1117
    :goto_0
    const-string v2, "NetworkControllerCoolpad"

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

    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    aget-object v4, v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1118
    return-void

    .line 1115
    :cond_3
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkName:[Ljava/lang/String;

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mNetworkNameDefault:Ljava/lang/String;

    aput-object v3, v2, p1

    goto :goto_0
.end method

.method public updateOperatorInfo()V
    .locals 15

    .prologue
    const/16 v14, 0x8

    const/4 v13, 0x2

    const/4 v12, 0x0

    .line 2190
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_0

    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-gtz v9, :cond_1

    .line 2254
    :cond_0
    :goto_0
    return-void

    .line 2194
    :cond_1
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

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

    .line 2195
    .local v3, mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-nez v3, :cond_2

    goto :goto_0

    .line 2200
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    :cond_3
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

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

    .line 2201
    .local v5, mDividerMemeber:Landroid/view/View;
    if-eqz v5, :cond_4

    .line 2202
    invoke-virtual {v5, v14}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 2206
    .end local v5           #mDividerMemeber:Landroid/view/View;
    :cond_5
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isWifiOnlyDevice()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 2208
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

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

    .line 2209
    .restart local v3       #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v3, :cond_6

    .line 2210
    invoke-virtual {v3, v14}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    goto :goto_2

    .line 2216
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    :cond_7
    const/4 v6, 0x0

    .line 2217
    .local v6, mNumOfSIM:I
    const/4 v2, 0x0

    .line 2218
    .local v2, mCarrierLeft:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    const/4 v4, 0x0

    .line 2219
    .local v4, mCarrierRight:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_3
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v0, v9, :cond_d

    .line 2220
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2221
    .restart local v3       #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v3, :cond_a

    .line 2222
    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->getSlotId()I

    move-result v9

    invoke-direct {p0, v9}, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->isSimInserted(I)Z

    move-result v7

    .line 2224
    .local v7, simInserted:Z
    const-string v9, "NetworkControllerCoolpad"

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

    .line 2226
    if-eqz v7, :cond_c

    .line 2227
    invoke-virtual {v3, v12}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    .line 2228
    add-int/lit8 v6, v6, 0x1

    .line 2229
    const/4 v9, 0x1

    if-ne v6, v9, :cond_b

    .line 2230
    move-object v2, v3

    .line 2234
    :cond_8
    :goto_4
    if-lt v6, v13, :cond_9

    add-int/lit8 v9, v0, -0x1

    if-ltz v9, :cond_9

    .line 2235
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mDividerList:Ljava/util/ArrayList;

    add-int/lit8 v10, v0, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    invoke-virtual {v9, v12}, Landroid/view/View;->setVisibility(I)V

    .line 2240
    :cond_9
    :goto_5
    const/16 v9, 0x11

    invoke-virtual {v3, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    .line 2219
    .end local v7           #simInserted:Z
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 2231
    .restart local v7       #simInserted:Z
    :cond_b
    if-ne v6, v13, :cond_8

    .line 2232
    move-object v4, v3

    goto :goto_4

    .line 2238
    :cond_c
    invoke-virtual {v3, v14}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    goto :goto_5

    .line 2244
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    .end local v7           #simInserted:Z
    :cond_d
    if-ne v6, v13, :cond_e

    .line 2245
    const/4 v9, 0x5

    invoke-virtual {v2, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    .line 2246
    const/4 v9, 0x3

    invoke-virtual {v4, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    goto/16 :goto_0

    .line 2247
    :cond_e
    if-nez v6, :cond_0

    .line 2248
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerCoolpad;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2249
    .local v8, v:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v8, :cond_f

    .line 2250
    invoke-virtual {v8, v12}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    .line 2252
    :cond_f
    const-string v9, "NetworkControllerCoolpad"

    const-string v10, "updateOperatorInfo, force the slotId 0 to visible."

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
