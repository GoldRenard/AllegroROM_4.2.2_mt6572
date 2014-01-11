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

.field static final DEBUG_AUX:Z = false

.field private static final INET_CONDITION_THRESHOLD:I = 0x32

.field static final SIGNAL_TIMER_COUNT:I = 0x2710

.field static final TAG:Ljava/lang/String; = "NetworkControllerGemini"

.field static newSIM1IconLevel:[I

.field static newSIM1LastSignalLevel:[I

.field static newSIM1SlotId:I

.field static newSIM2IconLevel:[I

.field static newSIM2LastSignalLevel:[I

.field static newSIM2SlotId:I

.field static oldSIM1IconLevel:[I

.field static oldSIM2IconLevel:[I

.field static timerRunSIM1:Z

.field static timerRunSIM2:Z


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

.field private mLastSignalLevel:[I

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

.field private newSIM1ContentDescriptionPhoneSignal:Ljava/lang/String;

.field private newSIM1DataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private newSIM1PhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private newSIM2ContentDescriptionPhoneSignal:Ljava/lang/String;

.field private newSIM2DataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;

.field private newSIM2PhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x2

    .line 88
    new-array v0, v1, [I

    fill-array-data v0, :array_32

    sput-object v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->oldSIM1IconLevel:[I

    .line 89
    new-array v0, v1, [I

    fill-array-data v0, :array_3a

    sput-object v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM1IconLevel:[I

    .line 90
    sput-boolean v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->timerRunSIM1:Z

    .line 92
    new-array v0, v1, [I

    fill-array-data v0, :array_42

    sput-object v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->oldSIM2IconLevel:[I

    .line 93
    new-array v0, v1, [I

    fill-array-data v0, :array_4a

    sput-object v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM2IconLevel:[I

    .line 94
    sput-boolean v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->timerRunSIM2:Z

    .line 99
    new-array v0, v1, [I

    fill-array-data v0, :array_52

    sput-object v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM1LastSignalLevel:[I

    .line 104
    new-array v0, v1, [I

    fill-array-data v0, :array_5a

    sput-object v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM2LastSignalLevel:[I

    return-void

    .line 88
    nop

    :array_32
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 89
    :array_3a
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 92
    :array_42
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 93
    :array_4a
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 99
    :array_52
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 104
    :array_5a
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 16
    .parameter "context"

    .prologue
    .line 235
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 96
    const/4 v11, 0x2

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v12, 0x0

    new-instance v13, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v13, v11, v12

    const/4 v12, 0x1

    new-instance v13, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v13, v11, v12

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM1PhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 98
    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM1DataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 101
    const/4 v11, 0x2

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v12, 0x0

    new-instance v13, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v13, v11, v12

    const/4 v12, 0x1

    new-instance v13, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v13, v11, v12

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM2PhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 103
    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->newSIM2DataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 108
    const/4 v11, 0x2

    new-array v11, v11, [I

    fill-array-data v11, :array_432

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastSignalLevel:[I

    .line 134
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    .line 135
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    .line 144
    const/4 v11, 0x4

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    .line 145
    const/4 v11, 0x2

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconIdNum:I

    .line 157
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    .line 158
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    .line 159
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    .line 162
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    .line 163
    const v11, 0x1080564

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTetherIconId:I

    .line 167
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    .line 168
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    .line 169
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    .line 170
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    .line 171
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    .line 172
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    .line 173
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    .line 174
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    .line 177
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    .line 178
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    .line 180
    const/4 v11, 0x0

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    .line 183
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    .line 184
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    .line 188
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    .line 189
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    .line 190
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    .line 191
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    .line 192
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    .line 193
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    .line 194
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    .line 195
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    .line 196
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    .line 197
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    .line 198
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    .line 199
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    .line 201
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    .line 202
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    .line 203
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    .line 204
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    .line 205
    const/4 v11, -0x1

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    .line 208
    const-string v11, ""

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    .line 211
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataAndWifiStacked:Z

    .line 212
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    .line 218
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    .line 2379
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrier1:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2380
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrier2:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2381
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierDivider:Landroid/view/View;

    .line 2425
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    .line 2426
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    .line 236
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    .line 237
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 239
    .local v7, res:Landroid/content/res/Resources;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v12, "connectivity"

    invoke-virtual {v11, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 241
    .local v0, cm:Landroid/net/ConnectivityManager;
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    .line 242
    const v11, 0x7f0a0005

    invoke-virtual {v7, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    .line 243
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

    .line 245
    const-string v11, "window"

    invoke-static {v11}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v11

    invoke-static {v11}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v10

    .line 248
    .local v10, wm:Landroid/view/IWindowManager;
    :try_start_152
    invoke-interface {v10}, Landroid/view/IWindowManager;->hasSystemNavBar()Z

    move-result v11

    if-eqz v11, :cond_2dd

    .line 249
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z
    :try_end_15b
    .catch Landroid/os/RemoteException; {:try_start_152 .. :try_end_15b} :catch_2e2

    .line 257
    :goto_15b
    const v11, 0x111003a

    invoke-virtual {v7, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    .line 261
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiIcons()V

    .line 262
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxIcons()V

    .line 265
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefault(Landroid/content/Context;)Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 266
    sget v11, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    iput v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    .line 267
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b005c

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameSeparator:Ljava/lang/String;

    .line 268
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x10402e6

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameDefault:Ljava/lang/String;

    .line 270
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Z

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    .line 271
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    .line 272
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Landroid/telephony/SignalStrength;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    .line 273
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Landroid/telephony/ServiceState;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    .line 274
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    .line 275
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    .line 276
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Z

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    .line 277
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/android/internal/telephony/IccCardConstants$State;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    .line 278
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    .line 279
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    .line 280
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/NetworkType;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    .line 281
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Ljava/lang/String;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    .line 282
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 283
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Ljava/lang/String;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    .line 284
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Ljava/lang/String;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    .line 285
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    iget v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconIdNum:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    const-class v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 286
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 287
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 288
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    iget v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    filled-new-array {v11, v12}, [I

    move-result-object v11

    const-class v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-static {v12, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[Lcom/mediatek/systemui/ext/IconIdWrapper;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    .line 289
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [[I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    .line 290
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    .line 291
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    .line 292
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Z

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    .line 293
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorResId:[I

    .line 294
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    new-array v11, v11, [Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    .line 296
    const-string v11, "gsm.siminfo.ready"

    const/4 v12, 0x0

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    .line 297
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    const/4 v12, 0x0

    sget-object v13, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    invoke-interface {v11, v12, v13}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I

    move-result-object v5

    .line 300
    .local v5, iconList:[I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_24f
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v4, v11, :cond_369

    .line 301
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    const/4 v12, 0x0

    aput v12, v11, v4

    .line 302
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    const/4 v12, 0x0

    aput v12, v11, v4

    .line 303
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    sget-object v12, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    aput-object v12, v11, v4

    .line 304
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    const/4 v12, 0x0

    aput v12, v11, v4

    .line 305
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameDefault:Ljava/lang/String;

    aput-object v12, v11, v4

    .line 306
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    const/4 v12, 0x2

    new-array v12, v12, [I

    fill-array-data v12, :array_43a

    aput-object v12, v11, v4

    .line 307
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    const/4 v12, -0x1

    aput v12, v11, v4

    .line 308
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    const/4 v12, -0x1

    aput v12, v11, v4

    .line 309
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    new-instance v12, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    const/4 v13, 0x0

    invoke-direct {v12, p0, v13}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$1;)V

    aput-object v12, v11, v4

    .line 310
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v12, v11, v4

    .line 311
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v4

    .line 312
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v4

    .line 314
    const/4 v6, 0x0

    .local v6, j:I
    :goto_2aa
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    if-ge v6, v11, :cond_304

    .line 316
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v6

    .line 317
    if-eqz v5, :cond_2ec

    .line 318
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v12

    invoke-interface {v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 319
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    aget v12, v5, v6

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 314
    :goto_2da
    add-int/lit8 v6, v6, 0x1

    goto :goto_2aa

    .line 251
    .end local v4           #i:I
    .end local v5           #iconList:[I
    .end local v6           #j:I
    :cond_2dd
    const/4 v11, 0x0

    :try_start_2de
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z
    :try_end_2e0
    .catch Landroid/os/RemoteException; {:try_start_2de .. :try_end_2e0} :catch_2e2

    goto/16 :goto_15b

    .line 253
    :catch_2e2
    move-exception v1

    .line 254
    .local v1, e:Landroid/os/RemoteException;
    const-string v11, "NetworkControllerGemini"

    const-string v12, "Failing checking whether status bar is visible"

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_15b

    .line 321
    .end local v1           #e:Landroid/os/RemoteException;
    .restart local v4       #i:I
    .restart local v5       #iconList:[I
    .restart local v6       #j:I
    :cond_2ec
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 322
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    aget-object v11, v11, v6

    sget-object v12, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->DATA_G:[I

    aget v12, v12, v6

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_2da

    .line 325
    :cond_304
    const/4 v6, 0x0

    :goto_305
    iget v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconIdNum:I

    if-ge v6, v11, :cond_318

    .line 326
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v12, v11, v6

    .line 325
    add-int/lit8 v6, v6, 0x1

    goto :goto_305

    .line 329
    :cond_318
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11, v4}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v8

    .line 330
    .local v8, resId:I
    const/4 v11, -0x1

    if-eq v8, v11, :cond_350

    .line 331
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

    .line 332
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    const/4 v12, 0x0

    aget-object v11, v11, v12

    invoke-virtual {v11, v8}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 340
    :goto_343
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    aget-object v11, v11, v4

    const/16 v12, 0x1e1

    invoke-static {v11, v12, v4}, Lcom/android/systemui/statusbar/util/SIMHelper;->listen(Landroid/telephony/PhoneStateListener;II)V

    .line 300
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_24f

    .line 334
    :cond_350
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    const/4 v12, 0x0

    aget-object v11, v11, v12

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 336
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v11, v11, v4

    const/4 v12, 0x0

    aget-object v11, v11, v12

    const v12, 0x7f0201e7

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_343

    .line 349
    .end local v6           #j:I
    .end local v8           #resId:I
    :cond_369
    invoke-static {}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSimInsertedStatus()V

    .line 351
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0a0002

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    if-eqz v11, :cond_42e

    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->isHspaDataDistinguishable()Z

    move-result v11

    if-eqz v11, :cond_42e

    const/4 v11, 0x1

    :goto_388
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHspaDataDistinguishable:Z

    .line 355
    const-string v11, "wifi"

    invoke-virtual {p1, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/net/wifi/WifiManager;

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 356
    new-instance v3, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;

    invoke-direct {v3, p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;-><init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V

    .line 357
    .local v3, handler:Landroid/os/Handler;
    new-instance v11, Lcom/android/internal/util/AsyncChannel;

    invoke-direct {v11}, Lcom/android/internal/util/AsyncChannel;-><init>()V

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    .line 358
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v11}, Landroid/net/wifi/WifiManager;->getWifiServiceMessenger()Landroid/os/Messenger;

    move-result-object v9

    .line 359
    .local v9, wifiMessenger:Landroid/os/Messenger;
    if-eqz v9, :cond_3af

    .line 360
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v11, v12, v3, v9}, Lcom/android/internal/util/AsyncChannel;->connect(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Messenger;)V

    .line 364
    :cond_3af
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 365
    .local v2, filter:Landroid/content/IntentFilter;
    const-string v11, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 366
    const-string v11, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 367
    const-string v11, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 368
    const-string v11, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 369
    const-string v11, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 370
    const-string v11, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 371
    const-string v11, "android.net.conn.INET_CONDITION_ACTION"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 372
    const-string v11, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 373
    const-string v11, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 374
    const-string v11, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 375
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x111003f

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    .line 377
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    if-eqz v11, :cond_408

    .line 378
    const-string v11, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 379
    const-string v11, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 380
    const-string v11, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 382
    :cond_408
    const-string v11, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 383
    const-string v11, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 384
    const-string v11, "android.intent.action.SIM_INSERTED_STATUS"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 385
    const-string v11, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 386
    const-string v11, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v2, v11}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 387
    invoke-virtual {p1, p0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 390
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateAirplaneMode()V

    .line 393
    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v11

    iput-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    .line 394
    return-void

    .line 351
    .end local v2           #filter:Landroid/content/IntentFilter;
    .end local v3           #handler:Landroid/os/Handler;
    .end local v9           #wifiMessenger:Landroid/os/Messenger;
    :cond_42e
    const/4 v11, 0x0

    goto/16 :goto_388

    .line 108
    nop

    :array_432
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data

    .line 306
    :array_43a
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneStateListener:[Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$myPhoneStateListener;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)Lcom/android/internal/util/AsyncChannel;
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    return v0
.end method

.method static synthetic access$1402(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    iput p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/SignalStrength;
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[Landroid/telephony/ServiceState;
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)[I
    .registers 2
    .parameter "x0"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)Z
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon()V

    return-void
.end method

.method private getResourceName(I)Ljava/lang/String;
    .registers 5
    .parameter "resId"

    .prologue
    .line 2368
    if-eqz p1, :cond_11

    .line 2369
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2371
    .local v1, res:Landroid/content/res/Resources;
    :try_start_8
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;
    :try_end_b
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_8 .. :try_end_b} :catch_d

    move-result-object v2

    .line 2376
    .end local v1           #res:Landroid/content/res/Resources;
    :goto_c
    return-object v2

    .line 2372
    .restart local v1       #res:Landroid/content/res/Resources;
    :catch_d
    move-exception v0

    .line 2373
    .local v0, ex:Landroid/content/res/Resources$NotFoundException;
    const-string v2, "(unknown)"

    goto :goto_c

    .line 2376
    .end local v0           #ex:Landroid/content/res/Resources$NotFoundException;
    .end local v1           #res:Landroid/content/res/Resources;
    :cond_11
    const-string v2, "(null)"

    goto :goto_c
.end method

.method private hasService(I)Z
    .registers 5
    .parameter "slotId"

    .prologue
    const/4 v1, 0x0

    .line 699
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v0, v2, p1

    .line 701
    .local v0, tempServiceState:Landroid/telephony/ServiceState;
    if-eqz v0, :cond_f

    .line 702
    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getState()I

    move-result v2

    packed-switch v2, :pswitch_data_10

    .line 707
    :pswitch_e
    const/4 v1, 0x1

    .line 710
    :cond_f
    :pswitch_f
    return v1

    .line 702
    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_f
    .end packed-switch
.end method

.method private huntForSsid(Landroid/net/wifi/WifiInfo;)Ljava/lang/String;
    .registers 8
    .parameter "info"

    .prologue
    .line 1451
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v3

    .line 1452
    .local v3, ssid:Ljava/lang/String;
    if-eqz v3, :cond_7

    .line 1462
    .end local v3           #ssid:Ljava/lang/String;
    :goto_6
    return-object v3

    .line 1456
    .restart local v3       #ssid:Ljava/lang/String;
    :cond_7
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v2

    .line 1457
    .local v2, networks:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiConfiguration;

    .line 1458
    .local v1, net:Landroid/net/wifi/WifiConfiguration;
    iget v4, v1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    move-result v5

    if-ne v4, v5, :cond_11

    .line 1459
    iget-object v3, v1, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    goto :goto_6

    .line 1462
    .end local v1           #net:Landroid/net/wifi/WifiConfiguration;
    :cond_28
    const/4 v3, 0x0

    goto :goto_6
.end method

.method private isCdma(I)Z
    .registers 4
    .parameter "slotId"

    .prologue
    .line 692
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v0, v1, p1

    .line 694
    .local v0, tempSignalStrength:Landroid/telephony/SignalStrength;
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Landroid/telephony/SignalStrength;->isGsm()Z

    move-result v1

    if-nez v1, :cond_e

    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method private isWifiOnlyDevice()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 2420
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 2421
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v2

    if-nez v2, :cond_12

    const/4 v1, 0x1

    :cond_12
    return v1
.end method

.method private updateAirplaneMode()V
    .registers 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 715
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "airplane_mode_on"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_13

    :goto_10
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    .line 717
    return-void

    :cond_13
    move v0, v1

    .line 715
    goto :goto_10
.end method

.method private updateConnectivity(Landroid/content/Intent;)V
    .registers 10
    .parameter "intent"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1516
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v7, "connectivity"

    invoke-virtual {v4, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1518
    .local v0, connManager:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 1521
    .local v2, info:Landroid/net/NetworkInfo;
    if-eqz v2, :cond_76

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_76

    move v4, v5

    :goto_19
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    .line 1522
    iget-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    if-eqz v4, :cond_78

    .line 1523
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    .line 1524
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkTypeName:Ljava/lang/String;

    .line 1529
    :goto_2b
    const-string v4, "inetCondition"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1536
    .local v1, connectionStatus:I
    const/16 v4, 0x32

    if-le v1, v4, :cond_7f

    :goto_35
    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    .line 1537
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

    .line 1539
    if-eqz v2, :cond_81

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_81

    .line 1540
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    .line 1546
    :goto_60
    const-string v4, "simId"

    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 1547
    .local v3, slotId:I
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 1548
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxIcons()V

    .line 1549
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 1550
    invoke-direct {p0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 1551
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiIcons()V

    .line 1552
    return-void

    .end local v1           #connectionStatus:I
    .end local v3           #slotId:I
    :cond_76
    move v4, v6

    .line 1521
    goto :goto_19

    .line 1526
    :cond_78
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    .line 1527
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkTypeName:Ljava/lang/String;

    goto :goto_2b

    .restart local v1       #connectionStatus:I
    :cond_7f
    move v5, v6

    .line 1536
    goto :goto_35

    .line 1542
    :cond_81
    iput-boolean v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    goto :goto_60
.end method

.method private final updateDataIcon()V
    .registers 3

    .prologue
    .line 1142
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_b

    .line 1143
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 1142
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1145
    :cond_b
    return-void
.end method

.method private final updateDataIcon(I)V
    .registers 26
    .parameter "slotId"

    .prologue
    .line 1148
    const/4 v9, 0x0

    .line 1149
    .local v9, iconId:I
    const/16 v20, 0x1

    .line 1150
    .local v20, visible:Z
    invoke-static {}, Lcom/android/systemui/statusbar/util/SIMHelper;->getITelephony()Lcom/android/internal/telephony/ITelephony;

    move-result-object v8

    .line 1151
    .local v8, iTelephony:Lcom/android/internal/telephony/ITelephony;
    const/16 v18, 0x0

    .line 1155
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

    .line 1158
    .local v16, tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    move-object/from16 v21, v0

    aget v17, v21, p1

    .line 1159
    .local v17, tempDataState:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v21, v0

    aget-object v19, v21, p1

    .line 1160
    .local v19, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    move-object/from16 v21, v0

    aget v15, v21, p1

    .line 1161
    .local v15, tempDataActivity:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v21, v0

    aget-object v18, v21, p1

    .line 1163
    const/4 v7, 0x0

    .local v7, i:I
    :goto_56
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconListNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_73

    .line 1164
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v21, v0

    aget-object v21, v21, p1

    aget-object v21, v21, v7

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v21

    aput-object v21, v16, v7

    .line 1163
    add-int/lit8 v7, v7, 0x1

    goto :goto_56

    .line 1167
    :cond_73
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

    .line 1170
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v21

    if-nez v21, :cond_2de

    .line 1172
    sget-object v21, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_db

    sget-object v21, Lcom/android/internal/telephony/IccCardConstants$State;->UNKNOWN:Lcom/android/internal/telephony/IccCardConstants$State;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_2d7

    .line 1215
    :cond_db
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    new-array v3, v0, [I

    .line 1216
    .local v3, callState:[I
    const/4 v4, 0x1

    .line 1217
    .local v4, callStateAllIdle:Z
    const/4 v7, 0x0

    :goto_e7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_138

    .line 1219
    :try_start_f1
    invoke-interface {v8, v7}, Lcom/android/internal/telephony/ITelephony;->getCallStateGemini(I)I

    move-result v21

    aput v21, v3, v7
    :try_end_f7
    .catch Ljava/lang/Exception; {:try_start_f1 .. :try_end_f7} :catch_133

    .line 1223
    :goto_f7
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

    .line 1224
    aget v21, v3, v7

    if-eqz v21, :cond_130

    .line 1225
    const/4 v4, 0x0

    .line 1217
    :cond_130
    add-int/lit8 v7, v7, 0x1

    goto :goto_e7

    .line 1220
    :catch_133
    move-exception v5

    .line 1221
    .local v5, e:Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_f7

    .line 1229
    .end local v5           #e:Ljava/lang/Exception;
    :cond_138
    sget-object v21, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_237

    .line 1230
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_232

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_232

    if-eqz v4, :cond_232

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

    if-eq v0, v1, :cond_232

    .line 1235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1236
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

    .line 1237
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_1ac

    .line 1238
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    .line 1307
    .end local v3           #callState:[I
    .end local v4           #callStateAllIdle:Z
    .end local v12           #simColorId:I
    :cond_1ac
    :goto_1ac
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v10

    .line 1309
    .local v10, ident:J
    :try_start_1b0
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
    :try_end_1cd
    .catchall {:try_start_1b0 .. :try_end_1cd} :catchall_364
    .catch Landroid/os/RemoteException; {:try_start_1b0 .. :try_end_1cd} :catch_357

    .line 1313
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1316
    :goto_1d0
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

    .line 1317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    move-object/from16 v21, v0

    aput-boolean v20, v21, p1

    .line 1318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    move-object/from16 v21, v0

    aput v9, v21, p1

    .line 1320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    move-object/from16 v21, v0

    aget-boolean v21, v21, p1

    if-eqz v21, :cond_375

    .line 1321
    const/4 v7, 0x0

    :goto_221
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_375

    .line 1322
    move/from16 v0, p1

    if-ne v7, v0, :cond_369

    .line 1321
    :goto_22f
    add-int/lit8 v7, v7, 0x1

    goto :goto_221

    .line 1241
    .end local v10           #ident:J
    .restart local v3       #callState:[I
    .restart local v4       #callStateAllIdle:Z
    :cond_232
    const/4 v9, 0x0

    .line 1242
    const/16 v20, 0x0

    goto/16 :goto_1ac

    .line 1245
    :cond_237
    const-string v21, "phone"

    invoke-static/range {v21 .. v21}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v13

    .line 1246
    .local v13, telephony:Lcom/android/internal/telephony/ITelephony;
    const/4 v14, 0x0

    .line 1247
    .local v14, tempCapabilitySIM:I
    const/4 v4, 0x1

    .line 1250
    if-eqz v13, :cond_249

    .line 1252
    :try_start_245
    invoke-interface {v13}, Lcom/android/internal/telephony/ITelephony;->get3GCapabilitySIM()I
    :try_end_248
    .catch Landroid/os/RemoteException; {:try_start_245 .. :try_end_248} :catch_259

    move-result v14

    .line 1258
    :cond_249
    :goto_249
    const/4 v7, 0x0

    :goto_24a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_264

    .line 1259
    if-ne v14, v7, :cond_25e

    .line 1258
    :cond_256
    :goto_256
    add-int/lit8 v7, v7, 0x1

    goto :goto_24a

    .line 1253
    :catch_259
    move-exception v6

    .line 1254
    .local v6, ex:Landroid/os/RemoteException;
    invoke-virtual {v6}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_249

    .line 1262
    .end local v6           #ex:Landroid/os/RemoteException;
    :cond_25e
    aget v21, v3, v7

    if-eqz v21, :cond_256

    .line 1263
    const/4 v4, 0x0

    goto :goto_256

    .line 1267
    :cond_264
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_2d2

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_2d2

    if-eqz v4, :cond_2d2

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

    if-eq v0, v1, :cond_2d2

    .line 1273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1274
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

    .line 1275
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_1ac

    .line 1276
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    goto/16 :goto_1ac

    .line 1279
    .end local v12           #simColorId:I
    :cond_2d2
    const/4 v9, 0x0

    .line 1280
    const/16 v20, 0x0

    goto/16 :goto_1ac

    .line 1286
    .end local v3           #callState:[I
    .end local v4           #callStateAllIdle:Z
    .end local v13           #telephony:Lcom/android/internal/telephony/ITelephony;
    .end local v14           #tempCapabilitySIM:I
    :cond_2d7
    const v9, 0x7f0201f5

    .line 1287
    const/16 v20, 0x0

    goto/16 :goto_1ac

    .line 1290
    :cond_2de
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

    .line 1292
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v21

    if-eqz v21, :cond_352

    const/16 v21, 0x2

    move/from16 v0, v17

    move/from16 v1, v21

    if-ne v0, v1, :cond_352

    .line 1294
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v12

    .line 1295
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

    .line 1296
    const/16 v21, -0x1

    move/from16 v0, v21

    if-le v12, v0, :cond_1ac

    .line 1297
    aget-object v21, v16, v12

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v9

    goto/16 :goto_1ac

    .line 1301
    .end local v12           #simColorId:I
    :cond_352
    const/4 v9, 0x0

    .line 1302
    const/16 v20, 0x0

    goto/16 :goto_1ac

    .line 1310
    .restart local v10       #ident:J
    :catch_357
    move-exception v5

    .line 1311
    .local v5, e:Landroid/os/RemoteException;
    :try_start_358
    const-string v21, "NetworkControllerGemini"

    const-string v22, "RemoteException"

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_35f
    .catchall {:try_start_358 .. :try_end_35f} :catchall_364

    .line 1313
    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    goto/16 :goto_1d0

    .end local v5           #e:Landroid/os/RemoteException;
    :catchall_364
    move-exception v21

    invoke-static {v10, v11}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v21

    .line 1323
    :cond_369
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-boolean v22, v21, v7

    goto/16 :goto_22f

    .line 1327
    :cond_375
    return-void
.end method

.method private final updateDataNetType()V
    .registers 3

    .prologue
    .line 935
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_b

    .line 936
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 935
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 938
    :cond_b
    return-void
.end method

.method private final updateDataNetType(I)V
    .registers 16
    .parameter "slotId"

    .prologue
    .line 942
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 944
    .local v6, tempDataNetType3G:Lcom/mediatek/systemui/ext/NetworkType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    aget v5, v11, p1

    .line 946
    .local v5, tempDataNetType:I
    const-string v11, "NetworkControllerGemini"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updateDataNetType("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "), DataNetType="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 947
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11, p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v2

    .line 948
    .local v2, simColorId:I
    const/4 v11, -0x1

    if-ne v2, v11, :cond_38

    .line 1123
    :goto_37
    return-void

    .line 951
    :cond_38
    const-string v11, "NetworkControllerGemini"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updateDataNetType("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "), simColorId="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 953
    const/4 v9, 0x0

    .line 954
    .local v9, tempIsRoaming:Z
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v11

    if-eqz v11, :cond_67

    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdmaEri(I)Z

    move-result v11

    if-nez v11, :cond_6f

    :cond_67
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    invoke-virtual {v11, p1}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v11

    if-eqz v11, :cond_1cd

    .line 956
    :cond_6f
    const/4 v10, 0x0

    .line 958
    .local v10, tempRoamingId:I
    const/4 v11, -0x1

    if-le v2, v11, :cond_7a

    const/4 v11, 0x4

    if-ge v2, v11, :cond_7a

    .line 959
    sget-object v11, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->ROAMING:[I

    aget v10, v11, v2

    .line 961
    :cond_7a
    const-string v11, "NetworkControllerGemini"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updateDataNetType("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")  RoamingresId= "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " simColorId = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 962
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v12, 0x1

    aput-boolean v12, v11, p1

    .line 963
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    aput v10, v11, p1

    .line 964
    const/4 v9, 0x1

    .line 973
    .end local v10           #tempRoamingId:I
    :goto_b0
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    if-eqz v11, :cond_1d9

    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-eqz v11, :cond_1d9

    .line 975
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    .line 976
    .local v8, tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0096

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1083
    .local v3, tempContentDescriptionDataType:Ljava/lang/String;
    :goto_c3
    const/4 v11, 0x4

    new-array v4, v11, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v11, 0x0

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v12, v4, v11

    const/4 v11, 0x1

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v12, v4, v11

    const/4 v11, 0x2

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v12, v4, v11

    const/4 v11, 0x3

    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v12, v4, v11

    .line 1084
    .local v4, tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v7, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1085
    .local v7, tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11, v9, v8}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I

    move-result-object v0

    .line 1086
    .local v0, iconList:[I
    if-eqz v0, :cond_2c7

    .line 1087
    const/4 v11, 0x0

    aget-object v11, v4, v11

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v12

    invoke-interface {v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1088
    const/4 v11, 0x0

    aget-object v11, v4, v11

    const/4 v12, 0x0

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1089
    const/4 v11, 0x1

    aget-object v11, v4, v11

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v12

    invoke-interface {v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1090
    const/4 v11, 0x1

    aget-object v11, v4, v11

    const/4 v12, 0x1

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1091
    const/4 v11, 0x2

    aget-object v11, v4, v11

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v12

    invoke-interface {v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1092
    const/4 v11, 0x2

    aget-object v11, v4, v11

    const/4 v12, 0x2

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1093
    const/4 v11, 0x3

    aget-object v11, v4, v11

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v12

    invoke-interface {v12}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1094
    const/4 v11, 0x3

    aget-object v11, v4, v11

    const/4 v12, 0x3

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1095
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    invoke-interface {v11}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v7, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1096
    aget v11, v0, v2

    invoke-virtual {v7, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1110
    :goto_16d
    if-eqz v5, :cond_175

    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v11

    if-nez v11, :cond_181

    .line 1111
    :cond_175
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v11, :cond_181

    .line 1112
    const/4 v11, 0x0

    invoke-virtual {v7, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1113
    const/4 v11, 0x0

    invoke-virtual {v7, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1117
    :cond_181
    const-string v11, "NetworkControllerGemini"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updateDataNetType("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "), DataNetType3G="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " tempDataTypeIconId= "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1119
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    aput-object v6, v11, p1

    .line 1120
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    aput-object v3, v11, p1

    .line 1121
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v12

    aput-object v12, v11, p1

    .line 1122
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataIconList:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aput-object v4, v11, p1

    goto/16 :goto_37

    .line 966
    .end local v0           #iconList:[I
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v4           #tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v7           #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_1cd
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v12, 0x0

    aput-boolean v12, v11, p1

    .line 967
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    const/4 v12, 0x0

    aput v12, v11, p1

    goto/16 :goto_b0

    .line 979
    :cond_1d9
    packed-switch v5, :pswitch_data_316

    .line 1068
    :pswitch_1dc
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v11, :cond_2b8

    .line 1069
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1070
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    .line 1071
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0093

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 981
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_1ef
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v11, :cond_200

    .line 982
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_G:Lcom/mediatek/systemui/ext/DataType;

    .line 983
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0093

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 985
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 990
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_200
    :pswitch_200
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mShowAtLeastThreeGees:Z

    if-nez v11, :cond_211

    .line 991
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_E:Lcom/mediatek/systemui/ext/DataType;

    .line 992
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0098

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 994
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 999
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_211
    :pswitch_211
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1000
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 1001
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0094

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1003
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1007
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_220
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1008
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v11}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v11

    iget-object v12, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    aget-boolean v12, v12, p1

    invoke-interface {v11, v12, v5}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->get3GPlusResources(ZI)Z

    move-result v1

    .line 1009
    .local v1, needShow3gplus:Z
    const/4 v11, 0x1

    if-ne v1, v11, :cond_240

    .line 1011
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_3G_PLUS:Lcom/mediatek/systemui/ext/DataType;

    .line 1012
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0095

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1016
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_240
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHspaDataDistinguishable:Z

    if-eqz v11, :cond_251

    .line 1017
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_H:Lcom/mediatek/systemui/ext/DataType;

    .line 1018
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0095

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1022
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_251
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 1023
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0094

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1027
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1029
    .end local v1           #needShow3gplus:Z
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_25e
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1030
    iget-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHspaDataDistinguishable:Z

    if-eqz v11, :cond_271

    .line 1031
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_H_PLUS:Lcom/mediatek/systemui/ext/DataType;

    .line 1032
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0095

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1035
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_271
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 1036
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0094

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1039
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1042
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_27e
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1043
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    .line 1044
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0097

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1046
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1048
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_28d
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1049
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_1X:Lcom/mediatek/systemui/ext/DataType;

    .line 1050
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0097

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1052
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1057
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_29c
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1058
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 1059
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0094

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1061
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1063
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :pswitch_2ab
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_4G:Lcom/mediatek/systemui/ext/DataType;

    .line 1064
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0096

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1066
    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1074
    .end local v3           #tempContentDescriptionDataType:Ljava/lang/String;
    .end local v8           #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    :cond_2b8
    sget-object v6, Lcom/mediatek/systemui/ext/NetworkType;->Type_3G:Lcom/mediatek/systemui/ext/NetworkType;

    .line 1075
    sget-object v8, Lcom/mediatek/systemui/ext/DataType;->Type_3G:Lcom/mediatek/systemui/ext/DataType;

    .line 1076
    .restart local v8       #tempDateType:Lcom/mediatek/systemui/ext/DataType;
    iget-object v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v12, 0x7f0b0094

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3       #tempContentDescriptionDataType:Ljava/lang/String;
    goto/16 :goto_c3

    .line 1098
    .restart local v0       #iconList:[I
    .restart local v4       #tempDataIconList:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v7       #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    :cond_2c7
    invoke-static {v9, v8}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getDataTypeIconListGemini(ZLcom/mediatek/systemui/ext/DataType;)[I

    move-result-object v0

    .line 1099
    const/4 v11, 0x0

    aget-object v11, v4, v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1100
    const/4 v11, 0x0

    aget-object v11, v4, v11

    const/4 v12, 0x0

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1101
    const/4 v11, 0x1

    aget-object v11, v4, v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1102
    const/4 v11, 0x1

    aget-object v11, v4, v11

    const/4 v12, 0x1

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1103
    const/4 v11, 0x2

    aget-object v11, v4, v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1104
    const/4 v11, 0x2

    aget-object v11, v4, v11

    const/4 v12, 0x2

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1105
    const/4 v11, 0x3

    aget-object v11, v4, v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1106
    const/4 v11, 0x3

    aget-object v11, v4, v11

    const/4 v12, 0x3

    aget v12, v0, v12

    invoke-virtual {v11, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1107
    const/4 v11, 0x0

    invoke-virtual {v7, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1108
    aget v11, v0, v2

    invoke-virtual {v7, v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_16d

    .line 979
    :pswitch_data_316
    .packed-switch 0x0
        :pswitch_1ef
        :pswitch_1dc
        :pswitch_200
        :pswitch_211
        :pswitch_27e
        :pswitch_29c
        :pswitch_29c
        :pswitch_28d
        :pswitch_220
        :pswitch_220
        :pswitch_220
        :pswitch_1dc
        :pswitch_29c
        :pswitch_2ab
        :pswitch_29c
        :pswitch_25e
    .end packed-switch
.end method

.method private final updateSimState(ILandroid/content/Intent;)V
    .registers 7
    .parameter "slotId"
    .parameter "intent"

    .prologue
    .line 666
    const/4 v2, 0x0

    .line 668
    .local v2, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    const-string v3, "ss"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 669
    .local v1, stateExtra:Ljava/lang/String;
    const-string v3, "ABSENT"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 670
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->ABSENT:Lcom/android/internal/telephony/IccCardConstants$State;

    .line 686
    :goto_11
    if-eqz v2, :cond_17

    .line 687
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aput-object v2, v3, p1

    .line 689
    :cond_17
    return-void

    .line 671
    :cond_18
    const-string v3, "READY"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 672
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_11

    .line 673
    :cond_23
    const-string v3, "LOCKED"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4a

    .line 674
    const-string v3, "reason"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 675
    .local v0, lockedReason:Ljava/lang/String;
    const-string v3, "PIN"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 676
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->PIN_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_11

    .line 677
    :cond_3c
    const-string v3, "PUK"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 678
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->PUK_REQUIRED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_11

    .line 680
    :cond_47
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->NETWORK_LOCKED:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_11

    .line 683
    .end local v0           #lockedReason:Ljava/lang/String;
    :cond_4a
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->UNKNOWN:Lcom/android/internal/telephony/IccCardConstants$State;

    goto :goto_11
.end method

.method private final updateTelephonySignalStrength()V
    .registers 3

    .prologue
    .line 720
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_b

    .line 721
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 720
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 723
    :cond_b
    return-void
.end method

.method private final updateTelephonySignalStrength(I)V
    .registers 30
    .parameter "slotId"

    .prologue
    .line 726
    const/4 v6, 0x0

    .line 728
    .local v6, handled:Z
    const/16 v20, 0x1

    .line 729
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

    .line 730
    .local v19, tempPhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v17, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v17 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 731
    .local v17, tempDataSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const/16 v21, 0x0

    .line 732
    .local v21, tempServiceState:Landroid/telephony/ServiceState;
    const/16 v22, 0x0

    .line 733
    .local v22, tempSignalStrength:Landroid/telephony/SignalStrength;
    const-string v15, ""

    .line 734
    .local v15, tempContentDescriptionPhoneSignal:Ljava/lang/String;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [I

    move-object/from16 v18, v0

    fill-array-data v18, :array_6ce

    .line 736
    .local v18, tempLastSignalLevel:[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    move-object/from16 v24, v0

    aget-object v22, v24, p1

    .line 737
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    move-object/from16 v24, v0

    aget-object v21, v24, p1

    .line 740
    if-nez v6, :cond_c8

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v24

    if-nez v24, :cond_c8

    .line 741
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

    .line 742
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v12

    .line 743
    .local v12, resId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v12, v0, :cond_310

    .line 744
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

    .line 745
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 746
    const/16 v20, 0x0

    .line 754
    :goto_a5
    const/4 v6, 0x1

    .line 755
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

    .line 758
    .end local v12           #resId:I
    :cond_c8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    move/from16 v24, v0

    if-nez v24, :cond_f3

    .line 759
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

    .line 761
    const/4 v6, 0x1

    .line 766
    :cond_f3
    if-nez v6, :cond_19e

    if-eqz v21, :cond_19e

    .line 767
    invoke-virtual/range {v21 .. v21}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v11

    .line 768
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

    .line 769
    const/16 v24, 0x2

    move/from16 v0, v24

    if-ne v11, v0, :cond_19e

    .line 770
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

    .line 771
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthSearchingIconGemini(I)I

    move-result v12

    .line 772
    .restart local v12       #resId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v12, v0, :cond_325

    .line 773
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

    .line 774
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 779
    :goto_17b
    const/4 v6, 0x1

    .line 780
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

    .line 784
    .end local v11           #regState:I
    .end local v12           #resId:I
    :cond_19e
    if-nez v6, :cond_22f

    if-eqz v21, :cond_1ae

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v24

    if-nez v24, :cond_22f

    invoke-virtual/range {v21 .. v21}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v24

    if-nez v24, :cond_22f

    .line 786
    :cond_1ae
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

    .line 787
    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v24

    if-eqz v24, :cond_22f

    .line 788
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

    .line 789
    const/16 v24, 0x1

    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSimIndicatorStateGemini(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_22f

    .line 790
    const/16 v20, 0x1

    .line 791
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 792
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201bd

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 793
    const/16 v24, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 794
    const v24, 0x7f0201bd

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 795
    const/4 v6, 0x1

    .line 800
    :cond_22f
    if-nez v6, :cond_297

    .line 801
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v7

    .line 802
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

    .line 803
    if-nez v7, :cond_362

    .line 807
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthNullIconGemini(I)I

    move-result v12

    .line 808
    .restart local v12       #resId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v12, v0, :cond_33a

    .line 809
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

    .line 810
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 811
    const/16 v20, 0x0

    .line 923
    .end local v7           #hasService:Z
    .end local v12           #resId:I
    :cond_297
    :goto_297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-object/from16 v24, v0

    invoke-virtual/range {v17 .. v17}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v25

    aput-object v25, v24, p1

    .line 924
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    move-object/from16 v24, v0

    aput-object v15, v24, p1

    .line 925
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

    .line 926
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

    .line 928
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

    .line 929
    const/16 v24, 0x0

    aget-object v24, v19, v24

    invoke-virtual/range {v24 .. v24}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v24

    const/16 v25, -0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_30f

    .line 930
    const/16 v20, 0x0

    .line 932
    :cond_30f
    return-void

    .line 748
    .restart local v12       #resId:I
    :cond_310
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 750
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201e7

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_a5

    .line 776
    .restart local v11       #regState:I
    :cond_325
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 777
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201e8

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_17b

    .line 813
    .end local v11           #regState:I
    .restart local v7       #hasService:Z
    :cond_33a
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 815
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201e7

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 817
    const/16 v24, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 818
    const v24, 0x7f0201be

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_297

    .line 821
    .end local v12           #resId:I
    :cond_362
    if-nez v22, :cond_39c

    .line 825
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 826
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const v25, 0x7f0201be

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 827
    const/16 v24, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 828
    const v24, 0x7f0201be

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 829
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    sget-object v25, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    const/16 v26, 0x0

    aget v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    goto/16 :goto_297

    .line 832
    :cond_39c
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v8, v0, [I

    fill-array-data v8, :array_6d6

    .line 833
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

    .line 834
    .local v9, iconList:[[I
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v24

    if-eqz v24, :cond_65c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    move/from16 v24, v0

    if-eqz v24, :cond_65c

    .line 835
    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getCdmaLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    .line 836
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

    .line 842
    :goto_42b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v24, v0

    aget-object v16, v24, p1

    .line 844
    .local v16, tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    sget-object v24, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_491

    .line 845
    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getEvdoLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    .line 846
    const/16 v24, 0x1

    const/16 v25, 0x1

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getCdmaLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    .line 847
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

    .line 857
    :cond_491
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v24

    if-eqz v24, :cond_66a

    .line 858
    invoke-virtual/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdmaEri(I)Z

    move-result v10

    .line 863
    .local v10, isRoaming:Z
    :goto_49b
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

    .line 865
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v14

    .line 866
    .local v14, simColorId:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v14, v0, :cond_30f

    .line 870
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

    .line 871
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

    .line 873
    .local v13, signalIcon:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v13, v0, :cond_67a

    .line 874
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

    .line 876
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 886
    :cond_54d
    :goto_54d
    sget-object v24, Lcom/mediatek/systemui/ext/NetworkType;->Type_1X3G:Lcom/mediatek/systemui/ext/NetworkType;

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_5dd

    .line 887
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

    .line 889
    .local v23, upSignalIcon:I
    const/16 v24, -0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_59b

    .line 890
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

    .line 892
    const/16 v24, 0x0

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 894
    :cond_59b
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

    .line 896
    .local v5, downSignalIcon:I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v5, v0, :cond_5dd

    .line 897
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

    .line 899
    const/16 v24, 0x1

    aget-object v24, v19, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 903
    .end local v5           #downSignalIcon:I
    .end local v23           #upSignalIcon:I
    :cond_5dd
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

    .line 908
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v24

    const/16 v25, 0x0

    aget v25, v8, v25

    invoke-interface/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getSignalStrengthDescription(I)Ljava/lang/String;

    move-result-object v4

    .line 909
    .local v4, desc:Ljava/lang/String;
    if-eqz v4, :cond_6ae

    .line 910
    move-object v15, v4

    .line 917
    :cond_652
    :goto_652
    const/16 v24, 0x0

    aget-object v24, v19, v24

    invoke-virtual/range {v24 .. v24}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v17

    goto/16 :goto_297

    .line 840
    .end local v4           #desc:Ljava/lang/String;
    .end local v10           #isRoaming:Z
    .end local v13           #signalIcon:I
    .end local v14           #simColorId:I
    .end local v16           #tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    :cond_65c
    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v22 .. v22}, Landroid/telephony/SignalStrength;->getLevel()I

    move-result v26

    aput v26, v8, v25

    aput v26, v18, v24

    goto/16 :goto_42b

    .line 861
    .restart local v16       #tempDataNetType:Lcom/mediatek/systemui/ext/NetworkType;
    :cond_66a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v10

    .restart local v10       #isRoaming:Z
    goto/16 :goto_49b

    .line 878
    .restart local v13       #signalIcon:I
    .restart local v14       #simColorId:I
    :cond_67a
    const/16 v24, 0x0

    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-static {v14, v0}, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->getTelephonySignalStrengthIconList(IZ)[I

    move-result-object v25

    aput-object v25, v9, v24

    .line 879
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 880
    const/16 v24, 0x0

    aget v24, v8, v24

    const/16 v25, 0x5

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_54d

    .line 881
    const/16 v24, 0x0

    aget-object v24, v19, v24

    const/16 v25, 0x0

    aget-object v25, v9, v25

    const/16 v26, 0x0

    aget v26, v8, v26

    aget v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_54d

    .line 912
    .restart local v4       #desc:Ljava/lang/String;
    :cond_6ae
    const/16 v24, 0x0

    aget v24, v8, v24

    const/16 v25, 0x5

    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_652

    .line 913
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move-object/from16 v24, v0

    sget-object v25, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->PHONE_SIGNAL_STRENGTH:[I

    const/16 v26, 0x0

    aget v26, v8, v26

    aget v25, v25, v26

    invoke-virtual/range {v24 .. v25}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    goto :goto_652

    .line 734
    nop

    :array_6ce
    .array-data 0x4
        0xfft 0xfft 0xfft 0xfft
        0xfft 0xfft 0xfft 0xfft
    .end array-data

    .line 832
    :array_6d6
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private updateWifiIcons()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 1436
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v1, :cond_20

    .line 1437
    sget-object v0, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_SIGNAL_STRENGTH:[[I

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    .line 1438
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIFI_CONNECTION_STRENGTH:[I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    .line 1448
    :goto_1f
    return-void

    .line 1441
    :cond_20
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataAndWifiStacked:Z

    if-eqz v1, :cond_32

    .line 1442
    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    .line 1446
    :goto_26
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v1, 0x7f0b0089

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    goto :goto_1f

    .line 1444
    :cond_32
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    if-eqz v1, :cond_39

    const v0, 0x7f02022a

    :cond_39
    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    goto :goto_26
.end method

.method private updateWifiState(Landroid/content/Intent;)V
    .registers 13
    .parameter "intent"

    .prologue
    const/4 v10, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 1383
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1384
    .local v0, action:Ljava/lang/String;
    const-string v9, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_53

    .line 1385
    const-string v9, "wifi_state"

    const/4 v10, 0x4

    invoke-virtual {p1, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    const/4 v10, 0x3

    if-ne v9, v10, :cond_51

    :goto_19
    iput-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    .line 1429
    :cond_1b
    :goto_1b
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

    .line 1432
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiIcons()V

    .line 1433
    return-void

    :cond_51
    move v7, v8

    .line 1385
    goto :goto_19

    .line 1387
    :cond_53
    const-string v9, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_bf

    .line 1388
    const-string v9, "networkInfo"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/net/NetworkInfo;

    .line 1390
    .local v2, networkInfo:Landroid/net/NetworkInfo;
    iget-boolean v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    .line 1391
    .local v5, wasConnected:Z
    if-eqz v2, :cond_b3

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_b3

    :goto_6d
    iput-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    .line 1393
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v7, :cond_b8

    if-nez v5, :cond_b8

    .line 1395
    const-string v7, "wifiInfo"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiInfo;

    .line 1396
    .local v1, info:Landroid/net/wifi/WifiInfo;
    if-nez v1, :cond_85

    .line 1397
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 1399
    :cond_85
    if-eqz v1, :cond_b5

    .line 1400
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->huntForSsid(Landroid/net/wifi/WifiInfo;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    .line 1410
    .end local v1           #info:Landroid/net/wifi/WifiInfo;
    :cond_8d
    :goto_8d
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v7, :cond_1b

    .line 1411
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const-string v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/wifi/WifiManager;

    invoke-virtual {v7}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v6

    .line 1414
    .local v6, wifiInfo:Landroid/net/wifi/WifiInfo;
    if-eqz v6, :cond_1b

    .line 1415
    invoke-virtual {v6}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v3

    .line 1416
    .local v3, newRssi:I
    sget v7, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_LEVEL_COUNT:I

    invoke-static {v3, v7}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v4

    .line 1418
    .local v4, newSignalLevel:I
    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    if-eq v4, v7, :cond_1b

    .line 1419
    iput v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    goto/16 :goto_1b

    .end local v3           #newRssi:I
    .end local v4           #newSignalLevel:I
    .end local v6           #wifiInfo:Landroid/net/wifi/WifiInfo;
    :cond_b3
    move v7, v8

    .line 1391
    goto :goto_6d

    .line 1402
    .restart local v1       #info:Landroid/net/wifi/WifiInfo;
    :cond_b5
    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    goto :goto_8d

    .line 1404
    .end local v1           #info:Landroid/net/wifi/WifiInfo;
    :cond_b8
    iget-boolean v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-nez v7, :cond_8d

    .line 1405
    iput-object v10, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    goto :goto_8d

    .line 1423
    .end local v2           #networkInfo:Landroid/net/NetworkInfo;
    .end local v5           #wasConnected:Z
    :cond_bf
    const-string v7, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1b

    .line 1424
    const-string v7, "newRssi"

    const/16 v8, -0xc8

    invoke-virtual {p1, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiRssi:I

    .line 1425
    iget v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiRssi:I

    sget v8, Lcom/android/systemui/statusbar/policy/WifiIcons;->WIFI_LEVEL_COUNT:I

    invoke-static {v7, v8}, Landroid/net/wifi/WifiManager;->calculateSignalLevel(II)I

    move-result v7

    iput v7, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    goto/16 :goto_1b
.end method

.method private updateWimaxIcons()V
    .registers 4

    .prologue
    .line 1491
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    if-eqz v0, :cond_3c

    .line 1492
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-eqz v0, :cond_2c

    .line 1493
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    if-eqz v0, :cond_1f

    .line 1494
    sget v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_IDLE:I

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    .line 1498
    :goto_10
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/android/systemui/statusbar/policy/AccessibilityContentDescriptions;->WIMAX_CONNECTION_STRENGTH:[I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    .line 1507
    :goto_1e
    return-void

    .line 1496
    :cond_1f
    sget-object v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_SIGNAL_STRENGTH:[[I

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    aget-object v0, v0, v1

    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    goto :goto_10

    .line 1501
    :cond_2c
    sget v0, Lcom/android/systemui/statusbar/policy/WimaxIcons;->WIMAX_DISCONNECTED:I

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    .line 1502
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v1, 0x7f0b008e

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    goto :goto_1e

    .line 1505
    :cond_3c
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    goto :goto_1e
.end method

.method private final updateWimaxState(Landroid/content/Intent;)V
    .registers 9
    .parameter "intent"

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1467
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1468
    .local v0, action:Ljava/lang/String;
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    .line 1469
    .local v1, wasConnected:Z
    const-string v5, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 1470
    const-string v5, "4g_state"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 1472
    .local v2, wimaxStatus:I
    const/4 v5, 0x3

    if-ne v2, v5, :cond_23

    :goto_1a
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    .line 1486
    .end local v2           #wimaxStatus:I
    :cond_1c
    :goto_1c
    invoke-direct {p0, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 1487
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxIcons()V

    .line 1488
    return-void

    .restart local v2       #wimaxStatus:I
    :cond_23
    move v3, v4

    .line 1472
    goto :goto_1a

    .line 1474
    .end local v2           #wimaxStatus:I
    :cond_25
    const-string v5, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_36

    .line 1475
    const-string v3, "newSignalLevel"

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    goto :goto_1c

    .line 1476
    :cond_36
    const-string v5, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 1477
    const-string v5, "WimaxState"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    .line 1479
    const-string v5, "WimaxStateDetail"

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    .line 1482
    iget v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    const/4 v6, 0x7

    if-ne v5, v6, :cond_5e

    move v5, v3

    :goto_54
    iput-boolean v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    .line 1484
    iget v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    const/4 v6, 0x6

    if-ne v5, v6, :cond_60

    :goto_5b
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    goto :goto_1c

    :cond_5e
    move v5, v4

    .line 1482
    goto :goto_54

    :cond_60
    move v3, v4

    .line 1484
    goto :goto_5b
.end method


# virtual methods
.method public addCombinedLabelView(Landroid/widget/TextView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 433
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 434
    return-void
.end method

.method public addCombinedSignalIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 425
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 426
    return-void
.end method

.method public addDataDirectionIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 409
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 410
    return-void
.end method

.method public addDataDirectionOverlayIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 413
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 414
    return-void
.end method

.method public addDataTypeIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 429
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 430
    return-void
.end method

.method public addEmergencyLabelView(Landroid/widget/TextView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 445
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 446
    return-void
.end method

.method public addMobileLabelView(Landroid/widget/TextView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 437
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 438
    return-void
.end method

.method public addPhoneSignalIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 405
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 406
    return-void
.end method

.method public addSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;)V
    .registers 3
    .parameter "cluster"

    .prologue
    .line 449
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 450
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;)V

    .line 451
    return-void
.end method

.method public addWifiIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 417
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    return-void
.end method

.method public addWifiLabelView(Landroid/widget/TextView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 441
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    return-void
.end method

.method public addWimaxIconView(Landroid/widget/ImageView;)V
    .registers 3
    .parameter "v"

    .prologue
    .line 421
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 422
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 11
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 2246
    const-string v1, "NetworkControllerGemini state:"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2247
    const-string v2, "  %s network type %d (%s)"

    const/4 v1, 0x3

    new-array v3, v1, [Ljava/lang/Object;

    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    if-eqz v1, :cond_1c7

    const-string v1, "CONNECTED"

    :goto_13
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

    .line 2250
    const-string v1, "------ telephony ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2252
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2e
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_1cb

    .line 2253
    const-string v1, "====== SlotId: %d ======"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2254
    const-string v1, "  hasService ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2255
    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2256
    const-string v1, "  mDataConnected ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2257
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    aget-boolean v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2258
    const-string v1, "  mSimState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2259
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2260
    const-string v1, "  mDataState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2261
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataState:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2262
    const-string v1, "  mDataActivity ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2263
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2264
    const-string v1, "  mDataNetType ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2265
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    aget v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 2266
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2267
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType:[I

    aget v1, v1, v0

    invoke-static {v1}, Landroid/telephony/TelephonyManager;->getNetworkTypeName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2268
    const-string v1, "  mServiceState ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2269
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2270
    const-string v1, "  mSignalStrength ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2271
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 2272
    const-string v1, "  mNetworkName ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2273
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2274
    const-string v1, "  mPhoneSignalIconId =0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2275
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2276
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2277
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2278
    const-string v1, "  mDataDirectionIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2279
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    aget v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2280
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2281
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2282
    const-string v1, "  mDataSignalIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2283
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2284
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2285
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2286
    const-string v1, "  mDataTypeIconId ="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2287
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2288
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2289
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2291
    const-string v1, "  mLastPhoneSignalIconId[0]=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2292
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v4

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2293
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2294
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v4

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2295
    const-string v1, "  mLastPhoneSignalIconId[1]=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2296
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v5

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2297
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2298
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v1, v1, v0

    aget v1, v1, v5

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2300
    const-string v1, "  mLastDataTypeIconId =0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2301
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    aget v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2302
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2303
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    aget v1, v1, v0

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2252
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2e

    .line 2247
    .end local v0           #i:I
    :cond_1c7
    const-string v1, "DISCONNECTED"

    goto/16 :goto_13

    .line 2306
    .restart local v0       #i:I
    :cond_1cb
    const-string v1, "------ wifi ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2307
    const-string v1, "  mWifiEnabled="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2308
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2309
    const-string v1, "  mWifiConnected="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2310
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2311
    const-string v1, "  mWifiRssi="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2312
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiRssi:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2313
    const-string v1, "  mWifiLevel="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2314
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLevel:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2315
    const-string v1, "  mWifiSsid="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2316
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2317
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

    .line 2319
    const-string v1, "  mWifiActivity="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2320
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2322
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSupported:Z

    if-eqz v1, :cond_2a2

    .line 2323
    const-string v1, "------ wimax ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2324
    const-string v1, "  mIsWimaxEnabled="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2325
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2326
    const-string v1, "  mWimaxConnected="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2327
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2328
    const-string v1, "  mWimaxIdle="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2329
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIdle:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2330
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

    .line 2332
    const-string v1, "  mWimaxSignal=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxSignal:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2333
    const-string v1, "  mWimaxState=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2334
    const-string v1, "  mWimaxExtraState=%d"

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxExtraState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2337
    :cond_2a2
    const-string v1, "------ Bluetooth ----"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2338
    const-string v1, "  mBtReverseTethered="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2339
    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Z)V

    .line 2341
    const-string v1, "------ connectivity ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2342
    const-string v1, "  mInetCondition="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2343
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mInetCondition:I

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(I)V

    .line 2345
    const-string v1, "------ icons ------"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2346
    const-string v1, "  mLastDataDirectionIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2347
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2348
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2349
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2350
    const-string v1, "  mLastDataDirectionOverlayIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2351
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2352
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2353
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2354
    const-string v1, "  mLastWifiIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2355
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2356
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2357
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2358
    const-string v1, "  mLastCombinedSignalIconId=0x"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2359
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2360
    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2361
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2362
    const-string v1, "  mLastCombinedLabel="

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2363
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2364
    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 2365
    return-void
.end method

.method public hasMobileDataFeature()Z
    .registers 2

    .prologue
    .line 397
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    return v0
.end method

.method public hideSimIndicator(I)V
    .registers 5
    .parameter "slotId"

    .prologue
    .line 2513
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

    .line 2514
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1

    .line 2515
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 2516
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 2517
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 2518
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 2519
    return-void
.end method

.method isCdmaEri(I)Z
    .registers 7
    .parameter "slotId"

    .prologue
    const/4 v3, 0x1

    .line 1126
    iget-object v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v2, v4, p1

    .line 1128
    .local v2, tempServiceState:Landroid/telephony/ServiceState;
    if-eqz v2, :cond_16

    .line 1129
    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getCdmaEriIconIndex()I

    move-result v0

    .line 1130
    .local v0, iconIndex:I
    if-eq v0, v3, :cond_16

    .line 1131
    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getCdmaEriIconMode()I

    move-result v1

    .line 1132
    .local v1, iconMode:I
    if-eqz v1, :cond_15

    if-ne v1, v3, :cond_16

    .line 1138
    .end local v0           #iconIndex:I
    .end local v1           #iconMode:I
    :cond_15
    :goto_15
    return v3

    :cond_16
    const/4 v3, 0x0

    goto :goto_15
.end method

.method public isEmergencyOnly()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 401
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    if-eqz v1, :cond_12

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v0, 0x1

    :cond_12
    return v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 15
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v11, 0x1

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 494
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    .line 495
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

    .line 496
    const-string v0, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    const-string v0, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    const-string v0, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 499
    :cond_37
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWifiState(Landroid/content/Intent;)V

    .line 500
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    .line 581
    :cond_3d
    :goto_3d
    return-void

    .line 501
    :cond_3e
    const-string v0, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 502
    const-string v0, "simId"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 503
    .local v1, slotId:I
    invoke-static {}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSimInsertedStatus()V

    .line 504
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength()V

    .line 505
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 506
    invoke-direct {p0, v1, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateSimState(ILandroid/content/Intent;)V

    .line 507
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 508
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    goto :goto_3d

    .line 509
    .end local v1           #slotId:I
    :cond_5f
    const-string v0, "android.provider.Telephony.SPN_STRINGS_UPDATED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8d

    .line 510
    const-string v0, "simId"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 511
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

    .line 516
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    goto :goto_3d

    .line 517
    .end local v1           #slotId:I
    :cond_8d
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9d

    const-string v0, "android.net.conn.INET_CONDITION_ACTION"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_eb

    .line 519
    :cond_9d
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e0

    .line 520
    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/NetworkInfo;

    .line 521
    .local v7, info:Landroid/net/NetworkInfo;
    if-nez v7, :cond_b7

    .line 522
    const-string v0, "NetworkControllerGemini"

    const-string v2, "onReceive, ConnectivityManager.CONNECTIVITY_ACTION networkinfo is null."

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3d

    .line 525
    :cond_b7
    invoke-virtual {v7}, Landroid/net/NetworkInfo;->getType()I

    move-result v10

    .line 526
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

    .line 527
    if-eq v10, v5, :cond_e0

    if-eqz v10, :cond_e0

    const/4 v0, 0x7

    if-eq v10, v0, :cond_e0

    if-eq v10, v11, :cond_e0

    const/16 v0, 0x9

    if-ne v10, v0, :cond_3d

    .line 533
    .end local v7           #info:Landroid/net/NetworkInfo;
    .end local v10           #type:I
    :cond_e0
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateConnectivity(Landroid/content/Intent;)V

    .line 534
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 535
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 536
    :cond_eb
    const-string v0, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f8

    .line 537
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 538
    :cond_f8
    const-string v0, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_108

    const-string v0, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_110

    .line 539
    :cond_108
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateAirplaneMode()V

    .line 540
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 541
    :cond_110
    const-string v0, "android.net.fourG.NET_4G_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_128

    const-string v0, "android.net.wimax.SIGNAL_LEVEL_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_128

    const-string v0, "android.net.fourG.wimax.WIMAX_NETWORK_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_130

    .line 544
    :cond_128
    invoke-direct {p0, p2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateWimaxState(Landroid/content/Intent;)V

    .line 545
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 546
    :cond_130
    const-string v0, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_159

    .line 547
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 548
    const-string v0, "type"

    invoke-virtual {p2, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    .line 549
    .restart local v10       #type:I
    const-string v0, "simid"

    const-wide/16 v2, -0x1

    invoke-virtual {p2, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    .line 550
    .local v8, simId:J
    if-ne v10, v11, :cond_154

    .line 552
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    .line 553
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength()V

    .line 554
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 556
    :cond_154
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 557
    .end local v8           #simId:J
    .end local v10           #type:I
    :cond_159
    const-string v0, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_175

    .line 558
    const-string v0, "slotId"

    invoke-virtual {p2, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 559
    .restart local v1       #slotId:I
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 560
    invoke-direct {p0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 561
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 562
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 563
    .end local v1           #slotId:I
    :cond_175
    const-string v0, "android.intent.action.SIM_INSERTED_STATUS"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18e

    .line 564
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 565
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    .line 566
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength()V

    .line 567
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 568
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 569
    :cond_18e
    const-string v0, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b0

    .line 570
    const-string v0, "NetworkControllerGemini"

    const-string v2, "onReceive from TelephonyIntents.ACTION_SIM_INFO_UPDATE"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    iput-boolean v11, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    .line 572
    invoke-static {p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 573
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType()V

    .line 574
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength()V

    .line 575
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateOperatorInfo()V

    .line 576
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto/16 :goto_3d

    .line 577
    :cond_1b0
    const-string v0, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 578
    const-string v0, "NetworkControllerGemini"

    const-string v2, "onReceive from android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    iput-boolean v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimCardReady:Z

    goto/16 :goto_3d
.end method

.method public refreshSignalCluster(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;)V
    .registers 10
    .parameter "cluster"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 454
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    invoke-interface {p1, v0, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setRoamingFlagandResource([Z[I)V

    .line 455
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiEnabled:Z

    if-eqz v0, :cond_4e

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-nez v0, :cond_15

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-nez v0, :cond_4e

    :cond_15
    move v0, v2

    :goto_16
    iget v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    iget v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    invoke-interface {p1, v0, v3, v4, v5}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setWifiIndicators(ZIILjava/lang/String;)V

    .line 460
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsWimaxEnabled:Z

    if-eqz v0, :cond_64

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-eqz v0, :cond_64

    .line 462
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAlwaysShowCdmaRssi:Z

    if-eqz v0, :cond_50

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v0, v1

    :goto_2f
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v0, v1

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v5, v0, v1

    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v7, v0, v1

    move-object v0, p1

    invoke-interface/range {v0 .. v7}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    :cond_41
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    invoke-interface {p1, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setIsAirplaneMode(Z)V

    .line 484
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    .line 485
    invoke-interface {p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->apply()V

    .line 486
    return-void

    :cond_4e
    move v0, v1

    .line 455
    goto :goto_16

    .line 462
    :cond_50
    const/4 v0, 0x2

    new-array v3, v0, [Lcom/mediatek/systemui/ext/IconIdWrapper;

    new-instance v0, Lcom/mediatek/systemui/ext/IconIdWrapper;

    iget v4, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    invoke-direct {v0, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>(I)V

    aput-object v0, v3, v1

    new-instance v0, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    aput-object v0, v3, v2

    goto :goto_2f

    .line 472
    :cond_64
    const/4 v1, 0x0

    .local v1, i:I
    :goto_65
    iget v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v1, v0, :cond_41

    .line 473
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

    .line 472
    add-int/lit8 v1, v1, 0x1

    goto :goto_65
.end method

.method refreshViews()V
    .registers 3

    .prologue
    .line 1558
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    if-ge v0, v1, :cond_b

    .line 1559
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 1558
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1561
    :cond_b
    return-void
.end method

.method refreshViews(I)V
    .registers 46
    .parameter "slotId"

    .prologue
    .line 1564
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    .line 1566
    .local v15, context:Landroid/content/Context;
    new-instance v14, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1567
    .local v14, combinedSignalIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v12, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1568
    .local v12, combinedActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    const-string v13, ""

    .line 1569
    .local v13, combinedLabel:Ljava/lang/String;
    const-string v41, ""

    .line 1570
    .local v41, wifiLabel:Ljava/lang/String;
    const-string v24, ""

    .line 1572
    .local v24, mobileLabel:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isEmergencyOnly()Z

    move-result v17

    .line 1579
    .local v17, emergencyOnly:Z
    new-instance v31, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1580
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

    .line 1582
    .local v5, tempPhoneSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;
    const-string v8, ""

    .line 1583
    .local v8, tempContentDescriptionPhoneSignal:Ljava/lang/String;
    const-string v9, ""

    .line 1584
    .local v9, tempContentDescriptionDataType:Ljava/lang/String;
    const-string v26, ""

    .line 1586
    .local v26, tempContentDescriptionCombinedSignal:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalStrength:[Landroid/telephony/SignalStrength;

    aget-object v38, v3, p1

    .line 1587
    .local v38, tempSignalStrength:Landroid/telephony/SignalStrength;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mServiceState:[Landroid/telephony/ServiceState;

    aget-object v37, v3, p1

    .line 1588
    .local v37, tempServiceState:Landroid/telephony/ServiceState;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    aget-boolean v28, v3, p1

    .line 1589
    .local v28, tempDataConnected:Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataActivity:[I

    aget v27, v3, p1

    .line 1590
    .local v27, tempDataActivity:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataNetType3G:[Lcom/mediatek/systemui/ext/NetworkType;

    aget-object v30, v3, p1

    .line 1591
    .local v30, tempDataNetType3G:Lcom/mediatek/systemui/ext/NetworkType;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v31

    .line 1592
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionPhoneSignal:[Ljava/lang/String;

    aget-object v8, v3, p1

    .line 1593
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    aget-object v9, v3, p1

    .line 1594
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v42, 0x0

    aget-object v4, v4, v42

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1595
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v42, 0x1

    aget-object v4, v4, v42

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1596
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    aget-object v35, v3, p1

    .line 1598
    .local v35, tempNetworkName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-nez v3, :cond_35d

    .line 1599
    const/4 v3, 0x0

    move-object/from16 v0, v31

    invoke-virtual {v0, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1600
    const/4 v3, 0x0

    move-object/from16 v0, v31

    invoke-virtual {v0, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1601
    const/4 v3, 0x0

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1602
    const/4 v3, 0x0

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1603
    const/4 v3, 0x1

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1604
    const/4 v3, 0x1

    aget-object v3, v5, v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1605
    const-string v24, ""

    .line 1696
    :cond_c2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_578

    .line 1697
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    if-nez v3, :cond_547

    .line 1698
    const v3, 0x7f0b00a8

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 1699
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    .line 1722
    :goto_da
    move-object/from16 v13, v41

    .line 1723
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1724
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1725
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1726
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1727
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v26, v0

    .line 1736
    :goto_f8
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    if-eqz v3, :cond_11f

    .line 1737
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v4, 0x7f0b005d

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1738
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1739
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTetherIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1740
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v4, 0x7f0b009b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v26

    .line 1744
    :cond_11f
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkType:I

    const/16 v4, 0x9

    if-ne v3, v4, :cond_58b

    const/16 v18, 0x1

    .line 1745
    .local v18, ethernetConnected:Z
    :goto_129
    if-eqz v18, :cond_12f

    .line 1747
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnectedNetworkTypeName:Ljava/lang/String;

    .line 1750
    :cond_12f
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    if-eqz v3, :cond_5a9

    if-eqz v37, :cond_143

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_5a9

    invoke-virtual/range {v37 .. v37}, Landroid/telephony/ServiceState;->isEmergencyOnly()Z

    move-result v3

    if-nez v3, :cond_5a9

    .line 1755
    :cond_143
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

    .line 1756
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    const v4, 0x7f0b009c

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1757
    invoke-static/range {p1 .. p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v3

    if-eqz v3, :cond_1d4

    .line 1758
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1759
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const v4, 0x7f0201bd

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1760
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v31

    .line 1761
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    aget-object v3, v3, v4

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1762
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    aget-object v3, v3, v4

    const v4, 0x7f0201bd

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1763
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1764
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1768
    :cond_1d4
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_58f

    .line 1770
    const-string v24, ""

    .line 1853
    :cond_1dc
    :goto_1dc
    new-instance v7, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1854
    .local v7, tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1855
    .local v6, tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconId:[I

    aget v29, v3, p1

    .line 1856
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

    .line 1857
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconId:[[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v4, v4, p1

    const/16 v42, 0x1

    aget-object v4, v4, v42

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v5, v3

    .line 1858
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v7

    .line 1859
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v6

    .line 1889
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v34, v3, p1

    .line 1890
    .local v34, tempLastPhoneSignalIconId:[I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    aget v32, v3, p1

    .line 1891
    .local v32, tempLastDataTypeIconId:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    aget v33, v3, p1

    .line 1893
    .local v33, tempLastMobileActivityIconId:I
    const/4 v3, 0x0

    aget v3, v34, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_284

    const/4 v3, 0x1

    aget v3, v34, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_284

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_284

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    if-ne v3, v4, :cond_284

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    if-ne v3, v4, :cond_284

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v32

    if-ne v0, v3, :cond_284

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v33

    if-ne v0, v3, :cond_284

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    if-eq v3, v4, :cond_79f

    .line 1902
    :cond_284
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

    .line 1904
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, i$:Ljava/util/Iterator;
    :goto_2b0
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_79f

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;

    .line 1905
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

    .line 1911
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

    .line 1915
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    move/from16 v3, p1

    invoke-interface/range {v2 .. v9}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setMobileDataIndicators(IZ[Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Lcom/mediatek/systemui/ext/IconIdWrapper;Ljava/lang/String;Ljava/lang/String;)V

    .line 1923
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    invoke-interface {v2, v3}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setIsAirplaneMode(Z)V

    .line 1924
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mAirplaneMode:Z

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastAirplaneMode:Z

    goto/16 :goto_2b0

    .line 1614
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v7           #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v18           #ethernetConnected:Z
    .end local v21           #i$:Ljava/util/Iterator;
    .end local v29           #tempDataDirectionIconId:I
    .end local v32           #tempLastDataTypeIconId:I
    .end local v33           #tempLastMobileActivityIconId:I
    .end local v34           #tempLastPhoneSignalIconId:[I
    :cond_35d
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_484

    .line 1615
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    const/4 v4, 0x0

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_463

    .line 1616
    move-object/from16 v24, v35

    .line 1635
    :goto_36e
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

    .line 1637
    if-eqz v28, :cond_503

    .line 1638
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move/from16 v0, p1

    invoke-static {v3, v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v25

    .line 1639
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

    .line 1640
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1641
    new-instance v6, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1642
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    const/4 v4, 0x0

    move/from16 v0, v25

    invoke-interface {v3, v0, v4}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getDataActivityIconList(IZ)[I

    move-result-object v22

    .line 1643
    .local v22, iconList:[I
    if-eqz v22, :cond_492

    .line 1644
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->getPluginResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1645
    aget v3, v22, v27

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1664
    :goto_404
    move-object/from16 v13, v24

    .line 1665
    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v12

    .line 1666
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1667
    move-object/from16 v26, v9

    .line 1668
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v3, p1

    .line 1671
    const/16 v20, 0x0

    .local v20, i:I
    :goto_41c
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v0, v20

    if-ge v0, v3, :cond_c2

    .line 1672
    move/from16 v0, v20

    move/from16 v1, p1

    if-ne v0, v1, :cond_4b7

    .line 1673
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

    .line 1671
    :goto_460
    add-int/lit8 v20, v20, 0x1

    goto :goto_41c

    .line 1617
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v20           #i:I
    .end local v22           #iconList:[I
    .end local v25           #simColorId:I
    :cond_463
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mConnected:Z

    if-nez v3, :cond_46b

    if-eqz v17, :cond_47b

    .line 1618
    :cond_46b
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_473

    if-eqz v17, :cond_477

    .line 1619
    :cond_473
    move-object/from16 v24, v35

    goto/16 :goto_36e

    .line 1621
    :cond_477
    const-string v24, ""

    goto/16 :goto_36e

    .line 1624
    :cond_47b
    const v3, 0x7f0b00a7

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v24

    goto/16 :goto_36e

    .line 1628
    :cond_484
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-eqz v3, :cond_48e

    .line 1629
    move-object/from16 v24, v35

    goto/16 :goto_36e

    .line 1631
    :cond_48e
    const-string v24, ""

    goto/16 :goto_36e

    .line 1647
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v22       #iconList:[I
    .restart local v25       #simColorId:I
    :cond_492
    const/4 v3, 0x0

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1648
    packed-switch v27, :pswitch_data_dca

    .line 1659
    const/4 v3, 0x0

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_404

    .line 1650
    :pswitch_49f
    const v3, 0x7f020207

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_404

    .line 1653
    :pswitch_4a7
    const v3, 0x7f020212

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_404

    .line 1656
    :pswitch_4af
    const v3, 0x7f02020c

    invoke-virtual {v6, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_404

    .line 1676
    .restart local v20       #i:I
    :cond_4b7
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v20

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1677
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, v20

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1678
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

    goto/16 :goto_460

    .line 1682
    .end local v6           #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v20           #i:I
    .end local v22           #iconList:[I
    .end local v25           #simColorId:I
    :cond_503
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1683
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1684
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1685
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1687
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_521
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v0, v20

    if-ge v0, v3, :cond_c2

    .line 1688
    move/from16 v0, v20

    move/from16 v1, p1

    if-ne v0, v1, :cond_532

    .line 1687
    :goto_52f
    add-int/lit8 v20, v20, 0x1

    goto :goto_521

    .line 1689
    :cond_532
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1690
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileActivityIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto :goto_52f

    .line 1701
    .end local v20           #i:I
    :cond_547
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiSsid:Ljava/lang/String;

    move-object/from16 v41, v0

    .line 1705
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I

    packed-switch v3, :pswitch_data_dd4

    goto/16 :goto_da

    .line 1716
    :pswitch_556
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_da

    .line 1707
    :pswitch_55d
    const v3, 0x7f02021e

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_da

    .line 1710
    :pswitch_566
    const v3, 0x7f020220

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_da

    .line 1713
    :pswitch_56f
    const v3, 0x7f02021f

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivityIconId:I

    goto/16 :goto_da

    .line 1729
    :cond_578
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_582

    .line 1730
    const-string v41, ""

    goto/16 :goto_f8

    .line 1732
    :cond_582
    const v3, 0x7f0b00a7

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v41

    goto/16 :goto_f8

    .line 1744
    :cond_58b
    const/16 v18, 0x0

    goto/16 :goto_129

    .line 1772
    .restart local v18       #ethernetConnected:Z
    :cond_58f
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_59f

    .line 1774
    const-string v41, ""

    .line 1779
    :goto_597
    move-object/from16 v26, v8

    .line 1780
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    goto/16 :goto_1dc

    .line 1776
    :cond_59f
    const v3, 0x7f0b00a7

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 1777
    move-object/from16 v13, v41

    goto :goto_597

    .line 1783
    :cond_5a9
    if-nez v28, :cond_1dc

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-nez v3, :cond_1dc

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mBluetoothTethered:Z

    if-nez v3, :cond_1dc

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxConnected:Z

    if-nez v3, :cond_1dc

    if-nez v18, :cond_1dc

    .line 1786
    const v3, 0x7f0b00a7

    invoke-virtual {v15, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1788
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_716

    .line 1789
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_701

    .line 1790
    invoke-virtual/range {v31 .. v31}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1795
    :goto_5d6
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_70e

    move-object/from16 v26, v9

    .line 1820
    :goto_5de
    new-instance v11, Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-direct {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;-><init>()V

    .line 1821
    .local v11, cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimState:[Lcom/android/internal/telephony/IccCardConstants$State;

    aget-object v39, v3, p1

    .line 1822
    .local v39, tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v11

    .line 1824
    const/16 v16, 0x0

    .line 1825
    .local v16, dataTypeIconId:I
    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdma(I)Z

    move-result v3

    if-eqz v3, :cond_601

    invoke-virtual/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isCdmaEri(I)Z

    move-result v3

    if-nez v3, :cond_60d

    :cond_601
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhone:Lcom/mediatek/telephony/TelephonyManagerEx;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v3

    if-eqz v3, :cond_78d

    .line 1827
    :cond_60d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    move/from16 v0, p1

    invoke-static {v3, v0}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v25

    .line 1828
    .restart local v25       #simColorId:I
    const/16 v36, 0x0

    .line 1830
    .local v36, tempRoamingId:I
    const/4 v3, -0x1

    move/from16 v0, v25

    if-le v0, v3, :cond_627

    const/4 v3, 0x4

    move/from16 v0, v25

    if-ge v0, v3, :cond_627

    .line 1831
    sget-object v3, Lcom/android/systemui/statusbar/policy/TelephonyIconsGemini;->ROAMING:[I

    aget v36, v3, v25

    .line 1833
    :cond_627
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

    .line 1834
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v4, 0x1

    aput-boolean v4, v3, p1

    .line 1835
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    aput v36, v3, p1

    .line 1841
    .end local v25           #simColorId:I
    .end local v36           #tempRoamingId:I
    :goto_66c
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

    .line 1842
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1843
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    aget-object v3, v3, p1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1845
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDataTypeAlwaysDisplayWhileOn()Z

    move-result v3

    if-eqz v3, :cond_1dc

    .line 1846
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

    .line 1848
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    invoke-virtual {v11}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v4

    aput-object v4, v3, p1

    goto/16 :goto_1dc

    .line 1792
    .end local v11           #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v16           #dataTypeIconId:I
    .end local v39           #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    :cond_701
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1793
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    goto/16 :goto_5d6

    .line 1795
    :cond_70e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v26, v0

    goto/16 :goto_5de

    .line 1798
    :cond_716
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mHasMobileDataFeature:Z

    if-eqz v3, :cond_72f

    .line 1799
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1800
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1801
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v26, v0

    goto/16 :goto_5de

    .line 1803
    :cond_72f
    const/4 v3, 0x1

    move/from16 v0, p1

    if-ne v0, v3, :cond_758

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    const/4 v4, 0x0

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_758

    .line 1804
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v13, v3, v4

    .line 1805
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1806
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v26, v3, v4

    goto/16 :goto_5de

    .line 1807
    :cond_758
    if-nez p1, :cond_77e

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    const/4 v4, 0x1

    aget-boolean v3, v3, v4

    if-eqz v3, :cond_77e

    .line 1808
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v13, v3, v4

    .line 1809
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataSignalIconId:[Lcom/mediatek/systemui/ext/IconIdWrapper;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->clone()Lcom/mediatek/systemui/ext/IconIdWrapper;

    move-result-object v14

    .line 1810
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionDataType:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v26, v3, v4

    goto/16 :goto_5de

    .line 1812
    :cond_77e
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setResources(Landroid/content/res/Resources;)V

    .line 1813
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    invoke-virtual {v14, v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->setIconId(I)V

    .line 1814
    move-object/from16 v26, v9

    goto/16 :goto_5de

    .line 1837
    .restart local v11       #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v16       #dataTypeIconId:I
    .restart local v39       #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    :cond_78d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    const/4 v4, 0x0

    aput-boolean v4, v3, p1

    .line 1838
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    const/4 v4, 0x0

    aput v4, v3, p1

    .line 1839
    const/16 v16, 0x0

    goto/16 :goto_66c

    .line 1927
    .end local v11           #cmccDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .end local v16           #dataTypeIconId:I
    .end local v39           #tempSimState:Lcom/android/internal/telephony/IccCardConstants$State;
    .restart local v6       #tempMobileActivityIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v7       #tempDataTypeIconId:Lcom/mediatek/systemui/ext/IconIdWrapper;
    .restart local v29       #tempDataDirectionIconId:I
    .restart local v32       #tempLastDataTypeIconId:I
    .restart local v33       #tempLastMobileActivityIconId:I
    .restart local v34       #tempLastPhoneSignalIconId:[I
    :cond_79f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21       #i$:Ljava/util/Iterator;
    :goto_7a7
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7d7

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;

    .line 1928
    .restart local v2       #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoaming:[Z

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsRoamingId:[I

    invoke-interface {v2, v3, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setRoamingFlagandResource([Z[I)V

    .line 1929
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    aget-boolean v3, v3, p1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorResId:[I

    aget v4, v4, p1

    move/from16 v0, p1

    invoke-interface {v2, v0, v3, v4}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setShowSimIndicator(IZI)V

    .line 1930
    move/from16 v0, p1

    move-object/from16 v1, v30

    invoke-interface {v2, v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->setDataNetType3G(ILcom/mediatek/systemui/ext/NetworkType;)V

    goto :goto_7a7

    .line 1934
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    :cond_7d7
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSignalClusters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_7df
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7ef

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;

    .line 1935
    .restart local v2       #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    invoke-interface {v2}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;->apply()V

    goto :goto_7df

    .line 1939
    .end local v2           #cluster:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$SignalCluster;
    :cond_7ef
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_89a

    .line 1940
    const/4 v3, 0x0

    aget v3, v34, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_80d

    const/4 v3, 0x1

    aget v3, v34, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_8f8

    .line 1943
    :cond_80d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x0

    const/16 v42, 0x0

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1944
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x1

    const/16 v42, 0x1

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1946
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1947
    .local v10, N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_839
    move/from16 v0, v20

    if-ge v0, v10, :cond_8f8

    .line 1948
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 1949
    .local v40, v:Landroid/widget/ImageView;
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_85c

    .line 1950
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1947
    :goto_859
    add-int/lit8 v20, v20, 0x1

    goto :goto_839

    .line 1952
    :cond_85c
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1953
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_87d

    .line 1954
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1962
    :goto_877
    move-object/from16 v0, v40

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_859

    .line 1956
    :cond_87d
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_88d

    .line 1957
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_877

    .line 1959
    :cond_88d
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_877

    .line 1967
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_89a
    const/4 v3, 0x0

    aget v3, v34, v3

    const/4 v4, 0x0

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-ne v3, v4, :cond_8b2

    const/4 v3, 0x1

    aget v3, v34, v3

    const/4 v4, 0x1

    aget-object v4, v5, v4

    invoke-virtual {v4}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_8f8

    .line 1971
    :cond_8b2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x0

    const/16 v42, 0x0

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1972
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastPhoneSignalIconId:[[I

    aget-object v3, v3, p1

    const/4 v4, 0x1

    const/16 v42, 0x1

    aget-object v42, v5, v42

    invoke-virtual/range {v42 .. v42}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v42

    aput v42, v3, v4

    .line 1973
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mPhoneSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 1975
    .restart local v40       #v:Landroid/widget/ImageView;
    if-eqz v40, :cond_8f8

    .line 1976
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_8f1

    invoke-direct/range {p0 .. p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->hasService(I)Z

    move-result v3

    if-nez v3, :cond_931

    .line 1977
    :cond_8f1
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1996
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_8f8
    :goto_8f8
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    move/from16 v0, v29

    if-eq v3, v0, :cond_98a

    .line 1997
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionIconId:I

    .line 1998
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 1999
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_910
    move/from16 v0, v20

    if-ge v0, v10, :cond_98a

    .line 2000
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2001
    .restart local v40       #v:Landroid/widget/ImageView;
    if-nez v29, :cond_977

    .line 2002
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_96f

    .line 2003
    const/4 v3, 0x4

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1999
    :goto_92e
    add-int/lit8 v20, v20, 0x1

    goto :goto_910

    .line 1979
    .end local v10           #N:I
    .end local v20           #i:I
    :cond_931
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1980
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_952

    .line 1981
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1989
    :goto_94c
    move-object/from16 v0, v40

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_8f8

    .line 1983
    :cond_952
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_962

    .line 1984
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_94c

    .line 1986
    :cond_962
    const/4 v3, 0x0

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_94c

    .line 2005
    .restart local v10       #N:I
    .restart local v20       #i:I
    :cond_96f
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_92e

    .line 2008
    :cond_977
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2009
    move-object/from16 v0, v40

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2010
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_92e

    .line 2015
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_98a
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    if-eq v3, v4, :cond_9df

    .line 2016
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWifiIconId:I

    .line 2017
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2018
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_9a6
    move/from16 v0, v20

    if-ge v0, v10, :cond_9df

    .line 2019
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2020
    .restart local v40       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    if-nez v3, :cond_9c6

    .line 2021
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2018
    :goto_9c3
    add-int/lit8 v20, v20, 0x1

    goto :goto_9a6

    .line 2023
    :cond_9c6
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2024
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiIconId:I

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2025
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWifi:Ljava/lang/String;

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_9c3

    .line 2031
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_9df
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    if-eq v3, v4, :cond_a34

    .line 2032
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastWimaxIconId:I

    .line 2033
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2034
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_9fb
    move/from16 v0, v20

    if-ge v0, v10, :cond_a34

    .line 2035
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2036
    .restart local v40       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    if-nez v3, :cond_a1b

    .line 2037
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2034
    :goto_a18
    add-int/lit8 v20, v20, 0x1

    goto :goto_9fb

    .line 2039
    :cond_a1b
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2040
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWimaxIconId:I

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2041
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContentDescriptionWimax:Ljava/lang/String;

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_a18

    .line 2046
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_a34
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_afa

    .line 2047
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedSignalIconId:I

    .line 2048
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2049
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_a50
    move/from16 v0, v20

    if-ge v0, v10, :cond_afa

    .line 2050
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedSignalIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2051
    .restart local v40       #v:Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_a96

    .line 2052
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_a7f

    .line 2053
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2061
    :goto_a75
    move-object/from16 v0, v40

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 2049
    :goto_a7c
    add-int/lit8 v20, v20, 0x1

    goto :goto_a50

    .line 2055
    :cond_a7f
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_a8c

    .line 2056
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_a75

    .line 2058
    :cond_a8c
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_a75

    .line 2063
    :cond_a96
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_af2

    .line 2064
    const/16 v19, 0x0

    .line 2065
    .local v19, flag:Z
    const/16 v23, 0x0

    .local v23, j:I
    :goto_aa0
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mGeminiSimNum:I

    move/from16 v0, v23

    if-ge v0, v3, :cond_ab2

    .line 2066
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataConnected:[Z

    aget-boolean v3, v3, v23

    if-eqz v3, :cond_ad8

    .line 2067
    const/16 v19, 0x1

    .line 2071
    :cond_ab2
    if-eqz v19, :cond_ad0

    .line 2072
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2073
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_adb

    .line 2074
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2082
    :goto_ac9
    move-object/from16 v0, v40

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 2084
    :cond_ad0
    move-object/from16 v0, v40

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_a7c

    .line 2065
    :cond_ad8
    add-int/lit8 v23, v23, 0x1

    goto :goto_aa0

    .line 2076
    :cond_adb
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_ae8

    .line 2077
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_ac9

    .line 2079
    :cond_ae8
    invoke-virtual {v14}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_ac9

    .line 2086
    .end local v19           #flag:Z
    .end local v23           #j:I
    :cond_af2
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_a7c

    .line 2093
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_afa
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_b9a

    .line 2094
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v32

    if-ne v0, v3, :cond_b14

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_bd7

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_bd7

    .line 2095
    :cond_b14
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 2097
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2098
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_b28
    move/from16 v0, v20

    if-ge v0, v10, :cond_bd7

    .line 2099
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2100
    .restart local v40       #v:Landroid/widget/ImageView;
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_b4e

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_b4e

    .line 2101
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2098
    :goto_b4b
    add-int/lit8 v20, v20, 0x1

    goto :goto_b28

    .line 2102
    :cond_b4e
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_b68

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_b60

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_b68

    .line 2103
    :cond_b60
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_b4b

    .line 2105
    :cond_b68
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2106
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_b83

    .line 2107
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2115
    :goto_b7d
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_b4b

    .line 2109
    :cond_b83
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_b90

    .line 2110
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_b7d

    .line 2112
    :cond_b90
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_b7d

    .line 2121
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_b9a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataTypeIconId:[I

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 2122
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataTypeIconViews:Ljava/util/ArrayList;

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2124
    .restart local v40       #v:Landroid/widget/ImageView;
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v32

    if-ne v0, v3, :cond_bc4

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_bd7

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_bd7

    .line 2125
    :cond_bc4
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_c2a

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_c2a

    .line 2126
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2144
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_bd7
    :goto_bd7
    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move/from16 v0, v33

    if-eq v0, v3, :cond_be9

    .line 2145
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastMobileActivityIconId:[I

    invoke-virtual {v6}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    aput v4, v3, p1

    .line 2149
    :cond_be9
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v4

    if-eq v3, v4, :cond_cb1

    .line 2153
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastDataDirectionOverlayIconId:I

    .line 2154
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2155
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_c05
    move/from16 v0, v20

    if-ge v0, v10, :cond_cb1

    .line 2156
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataDirectionOverlayIconViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/ImageView;

    .line 2157
    .restart local v40       #v:Landroid/widget/ImageView;
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_c7f

    .line 2158
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_c77

    .line 2159
    const/4 v3, 0x4

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2155
    :goto_c27
    add-int/lit8 v20, v20, 0x1

    goto :goto_c05

    .line 2127
    .end local v10           #N:I
    .end local v20           #i:I
    :cond_c2a
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-eqz v3, :cond_c44

    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-eqz v3, :cond_c3c

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiConnected:Z

    if-eqz v3, :cond_c44

    .line 2128
    :cond_c3c
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_bd7

    .line 2130
    :cond_c44
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2131
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_c60

    .line 2132
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2140
    :goto_c59
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_bd7

    .line 2134
    :cond_c60
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_c6d

    .line 2135
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c59

    .line 2137
    :cond_c6d
    invoke-virtual {v7}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_c59

    .line 2161
    .restart local v10       #N:I
    .restart local v20       #i:I
    :cond_c77
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_c27

    .line 2164
    :cond_c7f
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2165
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    if-eqz v3, :cond_c9a

    .line 2166
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2174
    :goto_c94
    move-object/from16 v0, v40

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_c27

    .line 2168
    :cond_c9a
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    if-nez v3, :cond_ca7

    .line 2169
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c94

    .line 2171
    :cond_ca7
    invoke-virtual {v12}, Lcom/mediatek/systemui/ext/IconIdWrapper;->getIconId()I

    move-result v3

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_c94

    .line 2180
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/ImageView;
    :cond_cb1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_ce1

    .line 2181
    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mLastCombinedLabel:Ljava/lang/String;

    .line 2182
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2183
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_cc9
    move/from16 v0, v20

    if-ge v0, v10, :cond_ce1

    .line 2184
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCombinedLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2185
    .local v40, v:Landroid/widget/TextView;
    move-object/from16 v0, v40

    invoke-virtual {v0, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2183
    add-int/lit8 v20, v20, 0x1

    goto :goto_cc9

    .line 2190
    .end local v10           #N:I
    .end local v20           #i:I
    .end local v40           #v:Landroid/widget/TextView;
    :cond_ce1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2191
    .restart local v10       #N:I
    const/16 v20, 0x0

    .restart local v20       #i:I
    :goto_ceb
    move/from16 v0, v20

    if-ge v0, v10, :cond_d19

    .line 2192
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2193
    .restart local v40       #v:Landroid/widget/TextView;
    const-string v3, ""

    move-object/from16 v0, v41

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d0f

    .line 2194
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2191
    :goto_d0c
    add-int/lit8 v20, v20, 0x1

    goto :goto_ceb

    .line 2196
    :cond_d0f
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2197
    invoke-virtual/range {v40 .. v41}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_d0c

    .line 2202
    .end local v40           #v:Landroid/widget/TextView;
    :cond_d19
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mIsScreenLarge:Z

    if-nez v3, :cond_d5b

    .line 2203
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2204
    const/16 v20, 0x0

    :goto_d29
    move/from16 v0, v20

    if-ge v0, v10, :cond_d7b

    .line 2205
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2206
    .restart local v40       #v:Landroid/widget/TextView;
    const-string v3, ""

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d4d

    .line 2207
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2204
    :goto_d4a
    add-int/lit8 v20, v20, 0x1

    goto :goto_d29

    .line 2209
    :cond_d4d
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2210
    move-object/from16 v0, v40

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_d4a

    .line 2215
    .end local v40           #v:Landroid/widget/TextView;
    :cond_d5b
    if-nez p1, :cond_da1

    .line 2216
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2221
    .restart local v40       #v:Landroid/widget/TextView;
    :goto_d68
    if-eqz v40, :cond_d7b

    .line 2222
    const-string v3, ""

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_dad

    .line 2223
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2232
    .end local v40           #v:Landroid/widget/TextView;
    :cond_d7b
    :goto_d7b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 2233
    const/16 v20, 0x0

    :goto_d85
    move/from16 v0, v20

    if-ge v0, v10, :cond_dc9

    .line 2234
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mEmergencyLabelViews:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .line 2235
    .restart local v40       #v:Landroid/widget/TextView;
    if-nez v17, :cond_dbb

    .line 2236
    const/16 v3, 0x8

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2233
    :goto_d9e
    add-int/lit8 v20, v20, 0x1

    goto :goto_d85

    .line 2218
    .end local v40           #v:Landroid/widget/TextView;
    :cond_da1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mMobileLabelViews:Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Landroid/widget/TextView;

    .restart local v40       #v:Landroid/widget/TextView;
    goto :goto_d68

    .line 2225
    :cond_dad
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2226
    move-object/from16 v0, v40

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_d7b

    .line 2238
    :cond_dbb
    move-object/from16 v0, v40

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2239
    const/4 v3, 0x0

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_d9e

    .line 2243
    .end local v40           #v:Landroid/widget/TextView;
    :cond_dc9
    return-void

    .line 1648
    :pswitch_data_dca
    .packed-switch 0x1
        :pswitch_49f
        :pswitch_4a7
        :pswitch_4af
    .end packed-switch

    .line 1705
    :pswitch_data_dd4
    .packed-switch 0x0
        :pswitch_556
        :pswitch_55d
        :pswitch_566
        :pswitch_56f
    .end packed-switch
.end method

.method public setCarrierGemini(Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Landroid/view/View;)V
    .registers 5
    .parameter "carrier1"
    .parameter "carrier2"
    .parameter "carrierDivider"

    .prologue
    .line 2384
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2385
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2386
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2387
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2388
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2389
    return-void
.end method

.method public setCarrierGemini(Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Landroid/view/View;Landroid/view/View;)V
    .registers 7
    .parameter "carrier1"
    .parameter "carrier2"
    .parameter "carrier3"
    .parameter "carrierDivider1"
    .parameter "carrierDivider2"

    .prologue
    .line 2393
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2394
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2395
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2396
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2397
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2398
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2399
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2400
    return-void
.end method

.method public setCarrierGemini(Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 9
    .parameter "carrier1"
    .parameter "carrier2"
    .parameter "carrier3"
    .parameter "carrier4"
    .parameter "carrierDivider1"
    .parameter "carrierDivider2"
    .parameter "carrierDivider3"

    .prologue
    .line 2405
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2406
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2407
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2408
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2409
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2410
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2411
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2412
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2413
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2414
    return-void
.end method

.method public setStackedMode(Z)V
    .registers 3
    .parameter "stacked"

    .prologue
    .line 489
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDataAndWifiStacked:Z

    .line 490
    return-void
.end method

.method public showSimIndicator(I)V
    .registers 6
    .parameter "slotId"

    .prologue
    .line 2499
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMColorIdBySlot(Landroid/content/Context;I)I

    move-result v0

    .line 2500
    .local v0, simColor:I
    const/4 v1, -0x1

    if-le v0, v1, :cond_14

    const/4 v1, 0x4

    if-ge v0, v1, :cond_14

    .line 2501
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorResId:[I

    sget-object v2, Lcom/android/systemui/statusbar/policy/TelephonyIcons;->SIM_INDICATOR_BACKGROUND:[I

    aget v2, v2, v0

    aput v2, v1, p1

    .line 2503
    :cond_14
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

    .line 2504
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mSimIndicatorFlag:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, p1

    .line 2505
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateTelephonySignalStrength(I)V

    .line 2506
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataNetType(I)V

    .line 2507
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->updateDataIcon(I)V

    .line 2508
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews(I)V

    .line 2509
    return-void
.end method

.method updateNetworkName(IZLjava/lang/String;ZLjava/lang/String;)V
    .registers 11
    .parameter "slotId"
    .parameter "showSpn"
    .parameter "spn"
    .parameter "showPlmn"
    .parameter "plmn"

    .prologue
    .line 1330
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

    .line 1333
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1334
    .local v1, str:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 1335
    .local v0, something:Z
    if-eqz p4, :cond_4e

    if-eqz p5, :cond_4e

    .line 1336
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1337
    const/4 v0, 0x1

    .line 1339
    :cond_4e
    if-eqz p2, :cond_5d

    if-eqz p3, :cond_5d

    .line 1340
    if-eqz v0, :cond_59

    .line 1341
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameSeparator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1343
    :cond_59
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1344
    const/4 v0, 0x1

    .line 1347
    :cond_5d
    if-eqz v0, :cond_8e

    .line 1348
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, p1

    .line 1352
    :goto_67
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

    .line 1353
    return-void

    .line 1350
    :cond_8e
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkName:[Ljava/lang/String;

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mNetworkNameDefault:Ljava/lang/String;

    aput-object v3, v2, p1

    goto :goto_67
.end method

.method public updateOperatorInfo()V
    .registers 16

    .prologue
    const/16 v14, 0x8

    const/4 v13, 0x2

    const/4 v12, 0x0

    .line 2429
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_14

    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-gtz v9, :cond_15

    .line 2493
    :cond_14
    :goto_14
    return-void

    .line 2433
    :cond_15
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2434
    .local v3, mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-nez v3, :cond_1b

    goto :goto_14

    .line 2439
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    :cond_2a
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_30
    :goto_30
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_42

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 2440
    .local v5, mDividerMemeber:Landroid/view/View;
    if-eqz v5, :cond_30

    .line 2441
    invoke-virtual {v5, v14}, Landroid/view/View;->setVisibility(I)V

    goto :goto_30

    .line 2445
    .end local v5           #mDividerMemeber:Landroid/view/View;
    :cond_42
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->isWifiOnlyDevice()Z

    move-result v9

    if-eqz v9, :cond_60

    .line 2447
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4e
    :goto_4e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2448
    .restart local v3       #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v3, :cond_4e

    .line 2449
    invoke-virtual {v3, v14}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    goto :goto_4e

    .line 2455
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    :cond_60
    const/4 v6, 0x0

    .line 2456
    .local v6, mNumOfSIM:I
    const/4 v2, 0x0

    .line 2457
    .local v2, mCarrierLeft:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    const/4 v4, 0x0

    .line 2458
    .local v4, mCarrierRight:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_64
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v0, v9, :cond_d8

    .line 2459
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2460
    .restart local v3       #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v3, :cond_cd

    .line 2461
    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->getSlotId()I

    move-result v9

    invoke-static {v9}, Lcom/android/systemui/statusbar/util/SIMHelper;->isSimInserted(I)Z

    move-result v7

    .line 2463
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

    .line 2465
    if-eqz v7, :cond_d4

    .line 2466
    invoke-virtual {v3, v12}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    .line 2467
    add-int/lit8 v6, v6, 0x1

    .line 2468
    const/4 v9, 0x1

    if-ne v6, v9, :cond_d0

    .line 2469
    move-object v2, v3

    .line 2473
    :cond_b5
    :goto_b5
    if-lt v6, v13, :cond_c8

    add-int/lit8 v9, v0, -0x1

    if-ltz v9, :cond_c8

    .line 2474
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mDividerList:Ljava/util/ArrayList;

    add-int/lit8 v10, v0, -0x1

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    invoke-virtual {v9, v12}, Landroid/view/View;->setVisibility(I)V

    .line 2479
    :cond_c8
    :goto_c8
    const/16 v9, 0x11

    invoke-virtual {v3, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    .line 2458
    .end local v7           #simInserted:Z
    :cond_cd
    add-int/lit8 v0, v0, 0x1

    goto :goto_64

    .line 2470
    .restart local v7       #simInserted:Z
    :cond_d0
    if-ne v6, v13, :cond_b5

    .line 2471
    move-object v4, v3

    goto :goto_b5

    .line 2477
    :cond_d4
    invoke-virtual {v3, v14}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    goto :goto_c8

    .line 2483
    .end local v3           #mCarrierMember:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    .end local v7           #simInserted:Z
    :cond_d8
    if-ne v6, v13, :cond_e4

    .line 2484
    const/4 v9, 0x5

    invoke-virtual {v2, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    .line 2485
    const/4 v9, 0x3

    invoke-virtual {v4, v9}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setGravity(I)V

    goto/16 :goto_14

    .line 2486
    :cond_e4
    if-nez v6, :cond_14

    .line 2487
    iget-object v9, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mCarrierList:Ljava/util/ArrayList;

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;

    .line 2488
    .local v8, v:Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
    if-eqz v8, :cond_f3

    .line 2489
    invoke-virtual {v8, v12}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setVisibility(I)V

    .line 2491
    :cond_f3
    const-string v9, "NetworkControllerGemini"

    const-string v10, "updateOperatorInfo, force the slotId 0 to visible."

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_14
.end method
