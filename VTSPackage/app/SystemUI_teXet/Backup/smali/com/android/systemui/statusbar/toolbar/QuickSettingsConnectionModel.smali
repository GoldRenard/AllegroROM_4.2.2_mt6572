.class public final Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;
.super Ljava/lang/Object;
.source "QuickSettingsConnectionModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$21;,
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;,
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;,
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;,
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;,
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;,
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;,
        Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;
    }
.end annotation


# static fields
.field private static final ATTACH_TIME_OUT_LENGTH:I = 0x7530

.field private static final COUNT:I = 0x5

.field private static final DBG:Z = true

.field private static final DETACH_TIME_OUT_LENGTH:I = 0x2710

.field private static final EVENT_ATTACH_TIME_OUT:I = 0x7d1

.field private static final EVENT_DETACH_TIME_OUT:I = 0x7d0

.field private static final FALLBACK_SCREEN_TIMEOUT_VALUE:I = 0x7530

.field private static final IPO_BOOT:Ljava/lang/String; = "android.intent.action.ACTION_PREBOOT_IPO"

.field public static final MAXIMUM_TIMEOUT:I = 0xea60

.field public static final MEDIUM_TIMEOUT:I = 0x7530

.field public static final MINIMUM_TIMEOUT:I = 0x3a98

.field private static final PROFILE_SWITCH_DIALOG_LONG_TIMEOUT:I = 0xfa0

.field private static final PROFILE_SWITCH_DIALOG_SHORT_TIMEOUT:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "QuickSettingsConnectionModel"

.field private static final TRANSACTION_START:Ljava/lang/String; = "com.android.mms.transaction.START"

.field private static final TRANSACTION_STOP:Ljava/lang/String; = "com.android.mms.transaction.STOP"


# instance fields
.field private mAirlineModeIcon:Landroid/widget/ImageView;

.field private mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

.field private mAirlineModeTileView:Landroid/view/View;

.field private mAudioManager:Landroid/media/AudioManager;

.field private mAudioProfileIcon:Landroid/widget/ImageView;

.field private mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

.field private mAudioProfileTileView:Landroid/view/View;

.field private mAutoRotateIcon:Landroid/widget/ImageView;

.field private mAutoRotateTileView:Landroid/view/View;

.field private mAutoRotationChangeObserver:Landroid/database/ContentObserver;

.field private mAutoRotationStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

.field private mBluetoothIcon:Landroid/widget/ImageView;

.field private mBluetoothLayout:Landroid/widget/FrameLayout;

.field private mBluetoothStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

.field private mBluetoothSwitchIngGifView:Landroid/widget/ImageView;

.field private mBluetoothTileView:Landroid/view/View;

.field private mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

.field private mContext:Landroid/content/Context;

.field private mCurrentScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

.field private mDataConnLayout:Landroid/widget/FrameLayout;

.field private mDataConnSwitchIngGifView:Landroid/widget/ImageView;

.field private mDataTimerHandler:Landroid/os/Handler;

.field private mDismissProfileSwitchDialogRunnable:Ljava/lang/Runnable;

.field private mGpsIcon:Landroid/widget/ImageView;

.field private mGpsStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

.field private mGpsTileView:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mMettingProfileIcon:Landroid/widget/ImageView;

.field private mMobileIcon:Landroid/widget/ImageView;

.field private mMobileStateChangeObserver:Landroid/database/ContentObserver;

.field private mMobileStateForSingleCardChangeObserver:Landroid/database/ContentObserver;

.field private mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

.field private mMobileTileView:Landroid/view/View;

.field private mMuteProfileIcon:Landroid/widget/ImageView;

.field private mNormalProfileIcon:Landroid/widget/ImageView;

.field private mOutdoorSwitchIcon:Landroid/widget/ImageView;

.field mPhoneStateListener1:Landroid/telephony/PhoneStateListener;

.field mPhoneStateListenerGemini:Landroid/telephony/PhoneStateListener;

.field private mProfileKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

.field private mProfileSwitchDialog:Landroid/app/Dialog;

.field private mProfileSwitchListener:Landroid/view/View$OnClickListener;

.field private mServiceState1:I

.field private mServiceStateGemini:[I

.field private mSimCardReady:Z

.field private mStatusBarService:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

.field private mSwitchDialog:Landroid/app/AlertDialog;

.field private mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

.field private mTimeoutChangeObserver:Landroid/database/ContentObserver;

.field private mTimeoutIcon:Landroid/widget/ImageView;

.field private mTimeoutIndicator:Landroid/widget/ImageView;

.field private mTimeoutStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

.field private mTimeoutTileView:Landroid/view/View;

.field private mUpdating:Z

.field private mWifiIcon:Landroid/widget/ImageView;

.field private mWifiLayout:Landroid/widget/FrameLayout;

.field private mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

.field private mWifiSwitchIngGifView:Landroid/widget/ImageView;

.field private mWifiTileView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 462
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mUpdating:Z

    .line 123
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mHandler:Landroid/os/Handler;

    .line 125
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSimCardReady:Z

    .line 147
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataTimerHandler:Landroid/os/Handler;

    .line 180
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$2;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$2;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateChangeObserver:Landroid/database/ContentObserver;

    .line 195
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$3;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$3;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateForSingleCardChangeObserver:Landroid/database/ContentObserver;

    .line 211
    sget v0, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceStateGemini:[I

    .line 212
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$4;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$4;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mPhoneStateListener1:Landroid/telephony/PhoneStateListener;

    .line 222
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$5;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$5;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mPhoneStateListenerGemini:Landroid/telephony/PhoneStateListener;

    .line 244
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$6;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$6;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 1846
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$16;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$16;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutChangeObserver:Landroid/database/ContentObserver;

    .line 1854
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$17;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$17;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationChangeObserver:Landroid/database/ContentObserver;

    .line 1912
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$18;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$18;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    .line 1931
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$19;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$19;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    .line 2057
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$20;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$20;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDismissProfileSwitchDialogRunnable:Ljava/lang/Runnable;

    .line 463
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    .line 464
    new-instance v0, Lcom/mediatek/CellConnService/CellConnMgr;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    .line 465
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;->register(Landroid/content/Context;)V

    .line 466
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1200(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    invoke-static {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    return-object v0
.end method

.method static synthetic access$1502(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/app/AlertDialog;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->wasItTheMonkey()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->showProfileSwitchDialog()V

    return-void
.end method

.method static synthetic access$2900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiSwitchIngGifView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3002(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiSwitchIngGifView:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$302(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;I)I
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceState1:I

    return p1
.end method

.method static synthetic access$3100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/FrameLayout;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothSwitchIngGifView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3402(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothSwitchIngGifView:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$3500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/FrameLayout;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/mediatek/CellConnService/CellConnMgr;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/phone/PhoneStatusBar;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mStatusBarService:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->onAirplaneModeChanged()V

    return-void
.end method

.method static synthetic access$4000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$4100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->stopFrameAnim()V

    return-void
.end method

.method static synthetic access$4200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/view/View;I)Landroid/app/AlertDialog;
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 72
    invoke-direct {p0, p1, p2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->createDialog(Landroid/view/View;I)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/os/Handler;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataTimerHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnSwitchIngGifView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$4902(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnSwitchIngGifView:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)[I
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceStateGemini:[I

    return-object v0
.end method

.method static synthetic access$5000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/FrameLayout;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$5100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIndicator:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/content/Context;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->toggleTimeout(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$5600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Ljava/util/List;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileKeys:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$5900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Ljava/lang/String;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->updateAudioProfile(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    return-object v0
.end method

.method static synthetic access$6000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->updateProfileView(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    return-void
.end method

.method static synthetic access$6100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/app/Dialog;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$6200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mUpdating:Z

    return v0
.end method

.method static synthetic access$6300(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->removeAllProfileSwitchDialogCallbacks()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .registers 2
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    return-object v0
.end method

.method private createDialog(Landroid/view/View;I)Landroid/app/AlertDialog;
    .registers 12
    .parameter "v"
    .parameter "resId"

    .prologue
    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 597
    new-instance v7, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-direct {v7, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 598
    .local v7, b:Landroid/app/AlertDialog$Builder;
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    move-object v1, p1

    move v3, v2

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;IIII)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x104

    new-instance v2, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$15;

    invoke-direct {v2, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$15;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 609
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    .line 610
    .local v6, alertDialog:Landroid/app/AlertDialog;
    invoke-virtual {v6}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x7de

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 611
    return-object v6
.end method

.method private createProfileSwitchDialog()V
    .registers 8

    .prologue
    const/4 v6, 0x1

    .line 2018
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    if-nez v4, :cond_de

    .line 2019
    new-instance v4, Landroid/app/Dialog;

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    .line 2020
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4, v6}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 2021
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f040010

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->setContentView(I)V

    .line 2022
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 2023
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x7de

    invoke-virtual {v4, v5}, Landroid/view/Window;->setType(I)V

    .line 2024
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    iget v5, v4, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    or-int/lit8 v5, v5, 0x10

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 2026
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/view/Window;->clearFlags(I)V

    .line 2028
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007b

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMettingProfileIcon:Landroid/widget/ImageView;

    .line 2029
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007e

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mOutdoorSwitchIcon:Landroid/widget/ImageView;

    .line 2030
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080078

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMuteProfileIcon:Landroid/widget/ImageView;

    .line 2031
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080075

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mNormalProfileIcon:Landroid/widget/ImageView;

    .line 2032
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080074

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 2033
    .local v2, normalProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2034
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->GENERAL:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2035
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080077

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 2036
    .local v1, muteProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2037
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->SILENT:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2038
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007a

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 2039
    .local v0, meetingProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2040
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->MEETING:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2041
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007d

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 2042
    .local v3, outdoorProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2043
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->OUTDOOR:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2044
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCurrentScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    if-eqz v4, :cond_de

    .line 2045
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCurrentScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-direct {p0, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->loadEnabledProfileResource(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    .line 2048
    .end local v0           #meetingProfile:Landroid/view/View;
    .end local v1           #muteProfile:Landroid/view/View;
    .end local v2           #normalProfile:Landroid/view/View;
    .end local v3           #outdoorProfile:Landroid/view/View;
    :cond_de
    return-void
.end method

.method private dismissProfileSwitchDialog(I)V
    .registers 6
    .parameter "timeout"

    .prologue
    .line 2051
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->removeAllProfileSwitchDialogCallbacks()V

    .line 2052
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_f

    .line 2053
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDismissProfileSwitchDialogRunnable:Ljava/lang/Runnable;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2055
    :cond_f
    return-void
.end method

.method private static getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .registers 3
    .parameter "intent"

    .prologue
    .line 454
    const-string v1, "state"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 455
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_11

    .line 456
    const-class v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    invoke-static {v1, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    .line 458
    :goto_10
    return-object v1

    :cond_11
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    goto :goto_10
.end method

.method public static getTimeout(Landroid/content/Context;)I
    .registers 7
    .parameter "context"

    .prologue
    const/16 v2, 0x7530

    .line 1896
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "screen_off_timeout"

    const/16 v5, 0x7530

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_d} :catch_1e

    move-result v1

    .line 1898
    .local v1, timeout:I
    const/16 v3, 0x3a98

    if-gt v1, v3, :cond_15

    .line 1899
    const/16 v1, 0x3a98

    .line 1909
    .end local v1           #timeout:I
    :goto_14
    return v1

    .line 1900
    .restart local v1       #timeout:I
    :cond_15
    if-gt v1, v2, :cond_1a

    .line 1901
    const/16 v1, 0x7530

    goto :goto_14

    .line 1903
    :cond_1a
    const v1, 0xea60

    goto :goto_14

    .line 1906
    .end local v1           #timeout:I
    :catch_1e
    move-exception v0

    .line 1907
    .local v0, e:Ljava/lang/Exception;
    const-string v3, "QuickSettingsConnectionModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getTimeout: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v2

    .line 1909
    goto :goto_14
.end method

.method private initIconViews()V
    .registers 3

    .prologue
    .line 1835
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    const v1, 0x7f08009f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiIcon:Landroid/widget/ImageView;

    .line 1836
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    const v1, 0x7f08008a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothIcon:Landroid/widget/ImageView;

    .line 1837
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    const v1, 0x7f080090

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsIcon:Landroid/widget/ImageView;

    .line 1838
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    const v1, 0x7f08008e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileIcon:Landroid/widget/ImageView;

    .line 1839
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    const v1, 0x7f080080

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeIcon:Landroid/widget/ImageView;

    .line 1840
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    const v1, 0x7f080099

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIcon:Landroid/widget/ImageView;

    .line 1841
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    const v1, 0x7f080085

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateIcon:Landroid/widget/ImageView;

    .line 1842
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    const v1, 0x7f08009a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIndicator:Landroid/widget/ImageView;

    .line 1843
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    const v1, 0x7f080083

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    .line 1844
    return-void
.end method

.method private initLayout()V
    .registers 3

    .prologue
    .line 1829
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    const v1, 0x7f08008d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnLayout:Landroid/widget/FrameLayout;

    .line 1830
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    const v1, 0x7f080089

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothLayout:Landroid/widget/FrameLayout;

    .line 1831
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    const v1, 0x7f08009e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiLayout:Landroid/widget/FrameLayout;

    .line 1832
    return-void
.end method

.method public static isAirplaneModeOn(Landroid/content/Context;)Z
    .registers 4
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 1757
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_e

    const/4 v0, 0x1

    :cond_e
    return v0
.end method

.method private isWifiOnlyDevice()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 240
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 241
    .local v0, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->isNetworkSupported(I)Z

    move-result v2

    if-nez v2, :cond_14

    const/4 v1, 0x1

    :cond_14
    return v1
.end method

.method private loadDisabledProfileResouceForAll()V
    .registers 3

    .prologue
    .line 1956
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mNormalProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020071

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1957
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMettingProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020066

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1958
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mOutdoorSwitchIcon:Landroid/widget/ImageView;

    const v1, 0x7f020075

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1959
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMuteProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020070

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1960
    return-void
.end method

.method private loadEnabledProfileResource(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V
    .registers 6
    .parameter "scenario"

    .prologue
    const v3, 0x7f020056

    .line 1964
    const-string v0, "QuickSettingsConnectionModel"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadEnabledProfileResource called, profile is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1966
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCurrentScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    .line 1967
    sget-object v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$21;->$SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario:[I

    invoke-virtual {p1}, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_78

    .line 1987
    :goto_28
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1990
    :goto_2d
    return-void

    .line 1969
    :pswitch_2e
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mNormalProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020073

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1970
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f02005b

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_2d

    .line 1973
    :pswitch_3f
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMettingProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020065

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1974
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020063

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_2d

    .line 1977
    :pswitch_50
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mOutdoorSwitchIcon:Landroid/widget/ImageView;

    const v1, 0x7f020078

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1978
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020076

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_2d

    .line 1981
    :pswitch_61
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMuteProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f02006f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1982
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f02009a

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_2d

    .line 1985
    :pswitch_72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_28

    .line 1967
    :pswitch_data_78
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_3f
        :pswitch_50
        :pswitch_61
        :pswitch_72
    .end packed-switch
.end method

.method private onAirplaneModeChanged()V
    .registers 7

    .prologue
    .line 423
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v0

    .line 427
    .local v0, airplaneModeEnabled:Z
    if-eqz v0, :cond_40

    .line 429
    const/4 v1, 0x0

    .local v1, i:I
    :goto_9
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    add-int/lit8 v3, v3, 0x0

    if-ge v1, v3, :cond_40

    .line 430
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceStateGemini:[I

    aget v3, v3, v1

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3d

    .line 431
    const-string v3, "QuickSettingsConnectionModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unfinish! mServiceStateGemini:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceStateGemini:[I

    aget v5, v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for simId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    .end local v1           #i:I
    :goto_3c
    return-void

    .line 429
    .restart local v1       #i:I
    :cond_3d
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 446
    .end local v1           #i:I
    :cond_40
    const-string v3, "QuickSettingsConnectionModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onServiceStateChanged called, inAirplaneMode is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 448
    .local v2, intent:Landroid/content/Intent;
    const-string v3, "state"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 449
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v4, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;->onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V

    .line 450
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;->setImageViewResources(Landroid/content/Context;)V

    goto :goto_3c
.end method

.method private removeAllProfileSwitchDialogCallbacks()V
    .registers 3

    .prologue
    .line 2067
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDismissProfileSwitchDialogRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 2068
    return-void
.end method

.method private showProfileSwitchDialog()V
    .registers 2

    .prologue
    .line 2006
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->createProfileSwitchDialog()V

    .line 2007
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 2009
    :try_start_b
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/IWindowManager;->dismissKeyguard()V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_12} :catch_1d

    .line 2012
    :goto_12
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 2013
    const/16 v0, 0xfa0

    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->dismissProfileSwitchDialog(I)V

    .line 2015
    :cond_1c
    return-void

    .line 2010
    :catch_1d
    move-exception v0

    goto :goto_12
.end method

.method private stopFrameAnim()V
    .registers 4

    .prologue
    .line 2071
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->getSwitchingGifView()Landroid/widget/ImageView;

    move-result-object v0

    .line 2072
    .local v0, animView:Landroid/widget/ImageView;
    if-eqz v0, :cond_1e

    .line 2073
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2074
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 2075
    .local v1, mFrameDrawable:Landroid/graphics/drawable/AnimationDrawable;
    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 2076
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 2079
    .end local v1           #mFrameDrawable:Landroid/graphics/drawable/AnimationDrawable;
    :cond_1e
    return-void
.end method

.method private toggleTimeout(Landroid/content/Context;)V
    .registers 9
    .parameter "context"

    .prologue
    const/16 v6, 0x7530

    .line 1868
    :try_start_2
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1869
    .local v0, cr:Landroid/content/ContentResolver;
    const-string v3, "screen_off_timeout"

    const/16 v4, 0x7530

    invoke-static {v0, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 1871
    .local v2, timeout:I
    const-string v3, "QuickSettingsConnectionModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "toggleTimeout, before is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1873
    const/16 v3, 0x3a98

    if-gt v2, v3, :cond_4a

    .line 1874
    const/16 v2, 0x7530

    .line 1880
    :goto_2c
    const-string v3, "screen_off_timeout"

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1882
    const-string v3, "QuickSettingsConnectionModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "toggleTimeout, after is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_49} :catch_53

    .line 1887
    .end local v0           #cr:Landroid/content/ContentResolver;
    .end local v2           #timeout:I
    :goto_49
    return-void

    .line 1875
    .restart local v0       #cr:Landroid/content/ContentResolver;
    .restart local v2       #timeout:I
    :cond_4a
    if-gt v2, v6, :cond_50

    .line 1876
    const v2, 0xea60

    goto :goto_2c

    .line 1878
    :cond_50
    const/16 v2, 0x3a98

    goto :goto_2c

    .line 1884
    .end local v0           #cr:Landroid/content/ContentResolver;
    .end local v2           #timeout:I
    :catch_53
    move-exception v1

    .line 1885
    .local v1, e:Ljava/lang/Exception;
    const-string v3, "QuickSettingsConnectionModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "toggleTimeout: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_49
.end method

.method private updateAudioProfile(Ljava/lang/String;)V
    .registers 5
    .parameter "key"

    .prologue
    .line 1993
    if-nez p1, :cond_3

    .line 2003
    :goto_2
    return-void

    .line 1997
    :cond_3
    const-string v0, "QuickSettingsConnectionModel"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateAudioProfile called, selected profile is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1999
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v0, p1}, Lcom/mediatek/audioprofile/AudioProfileManager;->setActiveProfile(Ljava/lang/String;)V

    .line 2001
    const-string v0, "QuickSettingsConnectionModel"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateAudioProfile called, setActiveProfile is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private updateProfileView(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V
    .registers 2
    .parameter "scenario"

    .prologue
    .line 1951
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->loadDisabledProfileResouceForAll()V

    .line 1952
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->loadEnabledProfileResource(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    .line 1953
    return-void
.end method

.method private wasItTheMonkey()Z
    .registers 4

    .prologue
    .line 587
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v2, "activity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 588
    .local v0, activityManager:Landroid/app/ActivityManager;
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 589
    const-string v1, "QuickSettingsConnectionModel"

    const-string v2, "it was the monkey"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    const/4 v1, 0x1

    .line 593
    :goto_18
    return v1

    .line 592
    :cond_19
    const-string v1, "QuickSettingsConnectionModel"

    const-string v2, "it was an user"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    const/4 v1, 0x0

    goto :goto_18
.end method


# virtual methods
.method public buildIconViews()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 469
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioManager:Landroid/media/AudioManager;

    .line 470
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v1, "audioprofile"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/audioprofile/AudioProfileManager;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    .line 472
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    .line 475
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    .line 478
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    .line 481
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v0

    if-nez v0, :cond_3b

    .line 483
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    .line 487
    :cond_3b
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    .line 488
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    .line 489
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    .line 492
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$7;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$7;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 510
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$8;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$8;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 518
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$9;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$9;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 527
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v0

    if-nez v0, :cond_7e

    .line 529
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$10;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$10;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 545
    :cond_7e
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$11;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$11;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 563
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$12;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$12;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 569
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$13;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$13;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 576
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$14;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$14;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 583
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->createProfileSwitchDialog()V

    .line 584
    return-void
.end method

.method public dismissDialogs()V
    .registers 2

    .prologue
    .line 615
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_9

    .line 616
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 618
    :cond_9
    return-void
.end method

.method public initConfigurationState()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 1712
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v0

    .line 1714
    .local v0, isAirlineModeOn:Z
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v2

    invoke-interface {v2}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDisableWifiAtAirplaneMode()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 1715
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;->setAirlineMode(Z)V

    .line 1717
    :cond_18
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1720
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1723
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1725
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1727
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v2

    if-nez v2, :cond_8a

    .line 1729
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setAirlineMode(Z)V

    .line 1730
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    .line 1731
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setCurrentState(Landroid/content/Context;I)V

    .line 1732
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1734
    const-string v2, "gsm.siminfo.ready"

    invoke-static {v2, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSimCardReady:Z

    .line 1735
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSimCardReady:Z

    if-eqz v2, :cond_8a

    .line 1736
    const-string v2, "QuickSettingsConnectionModel"

    const-string v3, "Oops, sim ready, maybe phone is drop down and restarted"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1737
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfoList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 1738
    .local v1, simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    if-eqz v1, :cond_73

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_ae

    .line 1739
    :cond_73
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    .line 1743
    :goto_78
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->isClickable()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 1744
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1749
    .end local v1           #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_8a
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1750
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1751
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getActiveProfileKey()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_ad

    .line 1752
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getActiveProfileKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getScenario(Ljava/lang/String;)Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->updateProfileView(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    .line 1754
    :cond_ad
    return-void

    .line 1741
    .restart local v1       #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_ae
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    goto :goto_78
.end method

.method public setQuickSettingsTileView(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .registers 9
    .parameter "wifiTileView"
    .parameter "bluetoothTileView"
    .parameter "gpsTileView"
    .parameter "mobileTileView"
    .parameter "airlineModeTileView"
    .parameter "timeoutTileView"
    .parameter "autoRotateTile"
    .parameter "audioProfileTile"

    .prologue
    .line 1816
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    .line 1817
    iput-object p2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    .line 1818
    iput-object p3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    .line 1819
    iput-object p4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    .line 1820
    iput-object p5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    .line 1821
    iput-object p6, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    .line 1822
    iput-object p7, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    .line 1823
    iput-object p8, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    .line 1824
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->initLayout()V

    .line 1825
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->initIconViews()V

    .line 1826
    return-void
.end method

.method public setStatusBarService(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)V
    .registers 2
    .parameter "statusBarService"

    .prologue
    .line 1761
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mStatusBarService:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    .line 1762
    return-void
.end method

.method public setUpdates(Z)V
    .registers 9
    .parameter "update"

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 621
    iget-boolean v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mUpdating:Z

    if-eq p1, v3, :cond_bf

    .line 622
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileKeys:Ljava/util/List;

    .line 623
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->getPredefinedProfileKeys()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileKeys:Ljava/util/List;

    .line 624
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mUpdating:Z

    .line 625
    if-eqz p1, :cond_c0

    .line 626
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 628
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v3, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 631
    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 634
    const-string v3, "android.location.PROVIDERS_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 637
    const-string v3, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 638
    const-string v3, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 639
    const-string v3, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 640
    const-string v3, "com.android.mms.transaction.START"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 641
    const-string v3, "com.android.mms.transaction.STOP"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 642
    const-string v3, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 643
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 645
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "gprs_connection_sim_setting"

    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4, v6, v5}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 654
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 658
    .local v2, telephonyManager:Landroid/telephony/TelephonyManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_6e
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    add-int/lit8 v3, v3, 0x0

    if-ge v1, v3, :cond_7c

    .line 659
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mPhoneStateListenerGemini:Landroid/telephony/PhoneStateListener;

    invoke-static {v3, v6, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->listen(Landroid/telephony/PhoneStateListener;II)V

    .line 658
    add-int/lit8 v1, v1, 0x1

    goto :goto_6e

    .line 665
    :cond_7c
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "screen_off_timeout"

    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4, v6, v5}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 668
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "accelerometer_rotation"

    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4, v6, v5}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 673
    const-string v3, "QuickSettingsConnectionModel"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setUpdates: listenAudioProfie with mAudioProfileListenr = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 674
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    invoke-virtual {v3, v4, v6}, Lcom/mediatek/audioprofile/AudioProfileManager;->listenAudioProfie(Lcom/mediatek/common/audioprofile/AudioProfileListener;I)V

    .line 700
    .end local v0           #filter:Landroid/content/IntentFilter;
    .end local v1           #i:I
    .end local v2           #telephonyManager:Landroid/telephony/TelephonyManager;
    :cond_bf
    :goto_bf
    return-void

    .line 677
    :cond_c0
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 679
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 685
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 689
    .restart local v2       #telephonyManager:Landroid/telephony/TelephonyManager;
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_dd
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    add-int/lit8 v3, v3, 0x0

    if-ge v1, v3, :cond_eb

    .line 690
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mPhoneStateListenerGemini:Landroid/telephony/PhoneStateListener;

    invoke-static {v3, v5, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->listen(Landroid/telephony/PhoneStateListener;II)V

    .line 689
    add-int/lit8 v1, v1, 0x1

    goto :goto_dd

    .line 695
    :cond_eb
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 696
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 697
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    invoke-virtual {v3, v4, v5}, Lcom/mediatek/audioprofile/AudioProfileManager;->listenAudioProfie(Lcom/mediatek/common/audioprofile/AudioProfileListener;I)V

    goto :goto_bf
.end method

.method public updateForSimReady()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 373
    const-string v1, "QuickSettingsConnectionModel"

    const-string v2, "Panel sim ready called"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v1

    if-nez v1, :cond_36

    .line 377
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSimCardReady:Z

    .line 378
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfoList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 379
    .local v0, simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    if-eqz v0, :cond_1e

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_37

    .line 380
    :cond_1e
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    .line 384
    :goto_24
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->isClickable()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 385
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 389
    .end local v0           #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_36
    return-void

    .line 382
    .restart local v0       #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_37
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v1, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    goto :goto_24
.end method

.method public updateResources()V
    .registers 13

    .prologue
    const v11, 0x7f0b000f

    .line 1766
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    const v10, 0x7f0800a0

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 1767
    .local v8, wifiText:Landroid/widget/TextView;
    const v9, 0x7f0b000d

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1770
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    const v10, 0x7f08008b

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 1771
    .local v3, bluetoothText:Landroid/widget/TextView;
    const v9, 0x7f0b000e

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1774
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    const v10, 0x7f080091

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 1775
    .local v5, gpsText:Landroid/widget/TextView;
    const v9, 0x7f0b0010

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1778
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v9

    if-nez v9, :cond_4a

    .line 1780
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    const v10, 0x7f08008f

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 1781
    .local v4, dataConnText:Landroid/widget/TextView;
    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setText(I)V

    .line 1785
    .end local v4           #dataConnText:Landroid/widget/TextView;
    :cond_4a
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    const v10, 0x7f08009b

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 1786
    .local v7, timeoutText:Landroid/widget/TextView;
    const v9, 0x7f0b0018

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1787
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    const v10, 0x7f080086

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1788
    .local v2, autoRotateText:Landroid/widget/TextView;
    const v9, 0x7f0b0011

    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1789
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    const v10, 0x7f080084

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1790
    .local v1, audioProfileText:Landroid/widget/TextView;
    const v9, 0x7f0b0033

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1791
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    const v10, 0x7f080081

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1792
    .local v0, airPlaneModeText:Landroid/widget/TextView;
    const v9, 0x7f0b0016

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1793
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    if-eqz v9, :cond_97

    .line 1794
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    invoke-virtual {v9, v11}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 1796
    :cond_97
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    if-eqz v9, :cond_a0

    .line 1797
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-virtual {v9}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->updateResources()V

    .line 1801
    :cond_a0
    const/4 v6, 0x0

    .line 1802
    .local v6, isProfileSwitchDialogVisible:Z
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    if-eqz v9, :cond_b3

    .line 1803
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->removeAllProfileSwitchDialogCallbacks()V

    .line 1805
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v9}, Landroid/app/Dialog;->isShowing()Z

    move-result v6

    .line 1806
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v9}, Landroid/app/Dialog;->dismiss()V

    .line 1808
    :cond_b3
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    .line 1809
    if-eqz v6, :cond_bb

    .line 1810
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->showProfileSwitchDialog()V

    .line 1812
    :cond_bb
    return-void
.end method

.method public updateSimInfo(Landroid/content/Intent;)V
    .registers 10
    .parameter "intent"

    .prologue
    .line 399
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v5

    if-nez v5, :cond_49

    .line 401
    const-string v5, "type"

    const/4 v6, -0x1

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 402
    .local v4, type:I
    const/4 v5, 0x1

    if-ne v4, v5, :cond_49

    .line 403
    const-string v5, "simid"

    const-wide/16 v6, -0x1

    invoke-virtual {p1, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 404
    .local v2, simId:J
    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v6, "gprs_connection_sim_setting"

    invoke-static {v5, v6}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefaultSIM(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v0

    .line 406
    .local v0, currentSimId:J
    cmp-long v5, v2, v0

    if-nez v5, :cond_49

    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-lez v5, :cond_49

    .line 408
    const-string v5, "QuickSettingsConnectionModel"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "sim setting changed, simId is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v6}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 417
    .end local v0           #currentSimId:J
    .end local v2           #simId:J
    .end local v4           #type:I
    :cond_49
    return-void
.end method
