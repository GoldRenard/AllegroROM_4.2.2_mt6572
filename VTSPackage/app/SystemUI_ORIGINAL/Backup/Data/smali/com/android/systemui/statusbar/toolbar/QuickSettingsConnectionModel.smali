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
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 470
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

    .line 1902
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$16;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$16;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutChangeObserver:Landroid/database/ContentObserver;

    .line 1910
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$17;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$17;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationChangeObserver:Landroid/database/ContentObserver;

    .line 1968
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$18;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$18;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    .line 1987
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$19;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$19;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    .line 2113
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$20;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$20;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDismissProfileSwitchDialogRunnable:Ljava/lang/Runnable;

    .line 471
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    .line 472
    new-instance v0, Lcom/mediatek/CellConnService/CellConnMgr;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    .line 473
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;->register(Landroid/content/Context;)V

    .line 474
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1200(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-static {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    return-object v0
.end method

.method static synthetic access$1502(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/SimIconsListView;)Lcom/android/systemui/statusbar/toolbar/SimIconsListView;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->wasItTheMonkey()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->showProfileSwitchDialog()V

    return-void
.end method

.method static synthetic access$2900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiSwitchIngGifView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3002(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiSwitchIngGifView:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$302(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceState1:I

    return p1
.end method

.method static synthetic access$3100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothSwitchIngGifView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3402(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothSwitchIngGifView:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$3500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/mediatek/CellConnService/CellConnMgr;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/phone/PhoneStatusBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mStatusBarService:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->onAirplaneModeChanged()V

    return-void
.end method

.method static synthetic access$4000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$4100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->stopFrameAnim()V

    return-void
.end method

.method static synthetic access$4200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/view/View;I)Landroid/app/AlertDialog;
    .locals 1
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
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataTimerHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnSwitchIngGifView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$4902(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnSwitchIngGifView:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceStateGemini:[I

    return-object v0
.end method

.method static synthetic access$5000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$5100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIndicator:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5500(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Landroid/content/Context;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->toggleTimeout(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$5600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateIcon:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$5700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileKeys:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$5900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->updateAudioProfile(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    return-object v0
.end method

.method static synthetic access$6000(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->updateProfileView(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    return-void
.end method

.method static synthetic access$6100(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/app/Dialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$6200(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mUpdating:Z

    return v0
.end method

.method static synthetic access$6300(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->removeAllProfileSwitchDialogCallbacks()V

    return-void
.end method

.method static synthetic access$700(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    return-object v0
.end method

.method private createDialog(Landroid/view/View;I)Landroid/app/AlertDialog;
    .locals 9
    .parameter "v"
    .parameter "resId"

    .prologue
    const/4 v8, 0x1

    const/4 v2, 0x0

    .line 635
    new-instance v7, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-direct {v7, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 636
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

    .line 647
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    .line 648
    .local v6, alertDialog:Landroid/app/AlertDialog;
    invoke-virtual {v6}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x7de

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 649
    return-object v6
.end method

.method private createProfileSwitchDialog()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 2074
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    if-nez v4, :cond_0

    .line 2075
    new-instance v4, Landroid/app/Dialog;

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    .line 2076
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4, v6}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 2077
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f040014

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->setContentView(I)V

    .line 2078
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 2079
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x7de

    invoke-virtual {v4, v5}, Landroid/view/Window;->setType(I)V

    .line 2080
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    iget v5, v4, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    or-int/lit8 v5, v5, 0x10

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 2082
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/view/Window;->clearFlags(I)V

    .line 2084
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007f

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMettingProfileIcon:Landroid/widget/ImageView;

    .line 2085
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080082

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mOutdoorSwitchIcon:Landroid/widget/ImageView;

    .line 2086
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007c

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMuteProfileIcon:Landroid/widget/ImageView;

    .line 2087
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080079

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mNormalProfileIcon:Landroid/widget/ImageView;

    .line 2088
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080078

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 2089
    .local v2, normalProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2090
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->GENERAL:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2091
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007b

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 2092
    .local v1, muteProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2093
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->SILENT:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2094
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f08007e

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 2095
    .local v0, meetingProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2096
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->MEETING:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2097
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    const v5, 0x7f080081

    invoke-virtual {v4, v5}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 2098
    .local v3, outdoorProfile:Landroid/view/View;
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2099
    sget-object v4, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->OUTDOOR:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-static {v4}, Lcom/mediatek/audioprofile/AudioProfileManager;->getProfileKey(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2100
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCurrentScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    if-eqz v4, :cond_0

    .line 2101
    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCurrentScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    invoke-direct {p0, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->loadEnabledProfileResource(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    .line 2104
    .end local v0           #meetingProfile:Landroid/view/View;
    .end local v1           #muteProfile:Landroid/view/View;
    .end local v2           #normalProfile:Landroid/view/View;
    .end local v3           #outdoorProfile:Landroid/view/View;
    :cond_0
    return-void
.end method

.method private dismissProfileSwitchDialog(I)V
    .locals 4
    .parameter "timeout"

    .prologue
    .line 2107
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->removeAllProfileSwitchDialogCallbacks()V

    .line 2108
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 2109
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDismissProfileSwitchDialogRunnable:Ljava/lang/Runnable;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2111
    :cond_0
    return-void
.end method

.method private static getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 2
    .parameter "intent"

    .prologue
    .line 462
    const-string v1, "state"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 463
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 464
    const-class v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    invoke-static {v1, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    .line 466
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    goto :goto_0
.end method

.method public static getTimeout(Landroid/content/Context;)I
    .locals 6
    .parameter "context"

    .prologue
    const/16 v2, 0x7530

    .line 1952
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "screen_off_timeout"

    const/16 v5, 0x7530

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1954
    .local v1, timeout:I
    const/16 v3, 0x3a98

    if-gt v1, v3, :cond_0

    .line 1955
    const/16 v1, 0x3a98

    .line 1965
    .end local v1           #timeout:I
    :goto_0
    return v1

    .line 1956
    .restart local v1       #timeout:I
    :cond_0
    if-gt v1, v2, :cond_1

    .line 1957
    const/16 v1, 0x7530

    goto :goto_0

    .line 1959
    :cond_1
    const v1, 0xea60

    goto :goto_0

    .line 1962
    .end local v1           #timeout:I
    :catch_0
    move-exception v0

    .line 1963
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

    .line 1965
    goto :goto_0
.end method

.method private initIconViews()V
    .locals 2

    .prologue
    .line 1891
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    const v1, 0x7f0800a3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiIcon:Landroid/widget/ImageView;

    .line 1892
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    const v1, 0x7f08008e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothIcon:Landroid/widget/ImageView;

    .line 1893
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    const v1, 0x7f080094

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsIcon:Landroid/widget/ImageView;

    .line 1894
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    const v1, 0x7f080092

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileIcon:Landroid/widget/ImageView;

    .line 1895
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    const v1, 0x7f080084

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeIcon:Landroid/widget/ImageView;

    .line 1896
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    const v1, 0x7f08009d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIcon:Landroid/widget/ImageView;

    .line 1897
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    const v1, 0x7f080089

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateIcon:Landroid/widget/ImageView;

    .line 1898
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    const v1, 0x7f08009e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutIndicator:Landroid/widget/ImageView;

    .line 1899
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    const v1, 0x7f080087

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    .line 1900
    return-void
.end method

.method private initLayout()V
    .locals 2

    .prologue
    .line 1885
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    const v1, 0x7f080091

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDataConnLayout:Landroid/widget/FrameLayout;

    .line 1886
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    const v1, 0x7f08008d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothLayout:Landroid/widget/FrameLayout;

    .line 1887
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    const v1, 0x7f0800a2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiLayout:Landroid/widget/FrameLayout;

    .line 1888
    return-void
.end method

.method public static isAirplaneModeOn(Landroid/content/Context;)Z
    .locals 3
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 1813
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isWifiOnlyDevice()Z
    .locals 4

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

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private loadDisabledProfileResouceForAll()V
    .locals 2

    .prologue
    .line 2012
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mNormalProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020071

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2013
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMettingProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020066

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2014
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mOutdoorSwitchIcon:Landroid/widget/ImageView;

    const v1, 0x7f020075

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2015
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMuteProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020070

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2016
    return-void
.end method

.method private loadEnabledProfileResource(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V
    .locals 4
    .parameter "scenario"

    .prologue
    const v3, 0x7f020056

    .line 2020
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

    .line 2022
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mCurrentScenario:Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    .line 2023
    sget-object v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$21;->$SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario:[I

    invoke-virtual {p1}, Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 2043
    :goto_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2046
    :goto_1
    return-void

    .line 2025
    :pswitch_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mNormalProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020073

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2026
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f02005b

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 2029
    :pswitch_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMettingProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020065

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2030
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020063

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 2033
    :pswitch_2
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mOutdoorSwitchIcon:Landroid/widget/ImageView;

    const v1, 0x7f020078

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2034
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f020076

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 2037
    :pswitch_3
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMuteProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f02006f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2038
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    const v1, 0x7f02009a

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 2041
    :pswitch_4
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 2023
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private onAirplaneModeChanged()V
    .locals 6

    .prologue
    .line 431
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v0

    .line 435
    .local v0, airplaneModeEnabled:Z
    if-eqz v0, :cond_1

    .line 437
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    add-int/lit8 v3, v3, 0x0

    if-ge v1, v3, :cond_1

    .line 438
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mServiceStateGemini:[I

    aget v3, v3, v1

    const/4 v4, 0x3

    if-eq v3, v4, :cond_0

    .line 439
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

    .line 459
    .end local v1           #i:I
    :goto_1
    return-void

    .line 437
    .restart local v1       #i:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 454
    .end local v1           #i:I
    :cond_1
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

    .line 455
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 456
    .local v2, intent:Landroid/content/Intent;
    const-string v3, "state"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 457
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v4, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;->onActualStateChange(Landroid/content/Context;Landroid/content/Intent;)V

    .line 458
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;->setImageViewResources(Landroid/content/Context;)V

    goto :goto_1
.end method

.method private removeAllProfileSwitchDialogCallbacks()V
    .locals 2

    .prologue
    .line 2123
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mDismissProfileSwitchDialogRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 2124
    return-void
.end method

.method private showProfileSwitchDialog()V
    .locals 1

    .prologue
    .line 2062
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->createProfileSwitchDialog()V

    .line 2063
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2065
    :try_start_0
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/IWindowManager;->dismissKeyguard()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2068
    :goto_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 2069
    const/16 v0, 0xfa0

    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->dismissProfileSwitchDialog(I)V

    .line 2071
    :cond_0
    return-void

    .line 2066
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private stopFrameAnim()V
    .locals 3

    .prologue
    .line 2127
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->getSwitchingGifView()Landroid/widget/ImageView;

    move-result-object v0

    .line 2128
    .local v0, animView:Landroid/widget/ImageView;
    if-eqz v0, :cond_0

    .line 2129
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2130
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 2131
    .local v1, mFrameDrawable:Landroid/graphics/drawable/AnimationDrawable;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2132
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 2135
    .end local v1           #mFrameDrawable:Landroid/graphics/drawable/AnimationDrawable;
    :cond_0
    return-void
.end method

.method private toggleTimeout(Landroid/content/Context;)V
    .locals 7
    .parameter "context"

    .prologue
    const/16 v6, 0x7530

    .line 1924
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1925
    .local v0, cr:Landroid/content/ContentResolver;
    const-string v3, "screen_off_timeout"

    const/16 v4, 0x7530

    invoke-static {v0, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 1927
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

    .line 1929
    const/16 v3, 0x3a98

    if-gt v2, v3, :cond_0

    .line 1930
    const/16 v2, 0x7530

    .line 1936
    :goto_0
    const-string v3, "screen_off_timeout"

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1938
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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1943
    .end local v0           #cr:Landroid/content/ContentResolver;
    .end local v2           #timeout:I
    :goto_1
    return-void

    .line 1931
    .restart local v0       #cr:Landroid/content/ContentResolver;
    .restart local v2       #timeout:I
    :cond_0
    if-gt v2, v6, :cond_1

    .line 1932
    const v2, 0xea60

    goto :goto_0

    .line 1934
    :cond_1
    const/16 v2, 0x3a98

    goto :goto_0

    .line 1940
    .end local v0           #cr:Landroid/content/ContentResolver;
    .end local v2           #timeout:I
    :catch_0
    move-exception v1

    .line 1941
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

    goto :goto_1
.end method

.method private updateAudioProfile(Ljava/lang/String;)V
    .locals 3
    .parameter "key"

    .prologue
    .line 2049
    if-nez p1, :cond_0

    .line 2059
    :goto_0
    return-void

    .line 2053
    :cond_0
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

    .line 2055
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v0, p1}, Lcom/mediatek/audioprofile/AudioProfileManager;->setActiveProfile(Ljava/lang/String;)V

    .line 2057
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

    goto :goto_0
.end method

.method private updateProfileView(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V
    .locals 0
    .parameter "scenario"

    .prologue
    .line 2007
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->loadDisabledProfileResouceForAll()V

    .line 2008
    invoke-direct {p0, p1}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->loadEnabledProfileResource(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    .line 2009
    return-void
.end method

.method private wasItTheMonkey()Z
    .locals 3

    .prologue
    .line 625
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v2, "activity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 626
    .local v0, activityManager:Landroid/app/ActivityManager;
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 627
    const-string v1, "QuickSettingsConnectionModel"

    const-string v2, "it was the monkey"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 628
    const/4 v1, 0x1

    .line 631
    :goto_0
    return v1

    .line 630
    :cond_0
    const-string v1, "QuickSettingsConnectionModel"

    const-string v2, "it was an user"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public buildIconViews()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 477
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioManager:Landroid/media/AudioManager;

    .line 478
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v1, "audioprofile"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/audioprofile/AudioProfileManager;

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    .line 480
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    .line 483
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    .line 486
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    .line 489
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v0

    if-nez v0, :cond_0

    .line 491
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    .line 495
    :cond_0
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    .line 496
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    .line 497
    new-instance v0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$1;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    .line 500
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$7;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$7;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 531
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$8;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$8;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 556
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$9;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$9;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 565
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v0

    if-nez v0, :cond_1

    .line 567
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$10;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$10;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 583
    :cond_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$11;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$11;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 601
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$12;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$12;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 607
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$13;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$13;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 614
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    new-instance v1, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$14;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$14;-><init>(Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 621
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->createProfileSwitchDialog()V

    .line 622
    return-void
.end method

.method public dismissDialogs()V
    .locals 1

    .prologue
    .line 653
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 654
    iget-object v0, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 656
    :cond_0
    return-void
.end method

.method public initConfigurationState()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1766
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v0

    .line 1769
    .local v0, isAirlineModeOn:Z
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/systemui/ext/PluginFactory;->getStatusBarPlugin(Landroid/content/Context;)Lcom/mediatek/systemui/ext/IStatusBarPlugin;

    move-result-object v2

    invoke-interface {v2}, Lcom/mediatek/systemui/ext/IStatusBarPlugin;->supportDisableWifiAtAirplaneMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1770
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;->setAirlineMode(Z)V

    .line 1773
    :cond_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$WifiStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1776
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$BluetoothStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1779
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$GpsStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1781
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AirlineModeStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1783
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1785
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setAirlineMode(Z)V

    .line 1786
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    .line 1787
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setCurrentState(Landroid/content/Context;I)V

    .line 1788
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1790
    const-string v2, "gsm.siminfo.ready"

    invoke-static {v2, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSimCardReady:Z

    .line 1791
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSimCardReady:Z

    if-eqz v2, :cond_2

    .line 1792
    const-string v2, "QuickSettingsConnectionModel"

    const-string v3, "Oops, sim ready, maybe phone is drop down and restarted"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1793
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfoList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 1794
    .local v1, simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_4

    .line 1795
    :cond_1
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2, v4}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    .line 1799
    :goto_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->isClickable()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 1800
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1805
    .end local v1           #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_2
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$TimeoutStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1806
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$AutoRotationStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 1807
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getActiveProfileKey()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1808
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getActiveProfileKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getScenario(Ljava/lang/String;)Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->updateProfileView(Lcom/mediatek/audioprofile/AudioProfileManager$Scenario;)V

    .line 1810
    :cond_3
    return-void

    .line 1797
    .restart local v1       #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_4
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    goto :goto_0
.end method

.method public setQuickSettingsTileView(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .parameter "wifiTileView"
    .parameter "bluetoothTileView"
    .parameter "gpsTileView"
    .parameter "mobileTileView"
    .parameter "airlineModeTileView"
    .parameter "timeoutTileView"
    .parameter "autoRotateTile"
    .parameter "audioProfileTile"

    .prologue
    .line 1872
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    .line 1873
    iput-object p2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    .line 1874
    iput-object p3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    .line 1875
    iput-object p4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    .line 1876
    iput-object p5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    .line 1877
    iput-object p6, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    .line 1878
    iput-object p7, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    .line 1879
    iput-object p8, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    .line 1880
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->initLayout()V

    .line 1881
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->initIconViews()V

    .line 1882
    return-void
.end method

.method public setStatusBarService(Lcom/android/systemui/statusbar/phone/PhoneStatusBar;)V
    .locals 0
    .parameter "statusBarService"

    .prologue
    .line 1817
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mStatusBarService:Lcom/android/systemui/statusbar/phone/PhoneStatusBar;

    .line 1818
    return-void
.end method

.method public setUpdates(Z)V
    .locals 7
    .parameter "update"

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 659
    iget-boolean v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mUpdating:Z

    if-eq p1, v3, :cond_1

    .line 660
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileKeys:Ljava/util/List;

    .line 661
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    invoke-virtual {v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->getPredefinedProfileKeys()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileKeys:Ljava/util/List;

    .line 662
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mUpdating:Z

    .line 663
    if-eqz p1, :cond_2

    .line 664
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 666
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v3, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 669
    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 672
    const-string v3, "android.location.PROVIDERS_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 675
    const-string v3, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 676
    const-string v3, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 677
    const-string v3, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 678
    const-string v3, "com.android.mms.transaction.START"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 679
    const-string v3, "com.android.mms.transaction.STOP"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 680
    const-string v3, "android.intent.action.ACTION_PREBOOT_IPO"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 681
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 683
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "gprs_connection_sim_setting"

    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4, v6, v5}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 692
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 696
    .local v2, telephonyManager:Landroid/telephony/TelephonyManager;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    add-int/lit8 v3, v3, 0x0

    if-ge v1, v3, :cond_0

    .line 697
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mPhoneStateListenerGemini:Landroid/telephony/PhoneStateListener;

    invoke-static {v3, v6, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->listen(Landroid/telephony/PhoneStateListener;II)V

    .line 696
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 703
    :cond_0
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "screen_off_timeout"

    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4, v6, v5}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 706
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "accelerometer_rotation"

    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4, v6, v5}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 711
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

    .line 712
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    invoke-virtual {v3, v4, v6}, Lcom/mediatek/audioprofile/AudioProfileManager;->listenAudioProfie(Lcom/mediatek/common/audioprofile/AudioProfileListener;I)V

    .line 738
    .end local v0           #filter:Landroid/content/IntentFilter;
    .end local v1           #i:I
    .end local v2           #telephonyManager:Landroid/telephony/TelephonyManager;
    :cond_1
    :goto_1
    return-void

    .line 715
    :cond_2
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 717
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 723
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 727
    .restart local v2       #telephonyManager:Landroid/telephony/TelephonyManager;
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_2
    sget v3, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    add-int/lit8 v3, v3, 0x0

    if-ge v1, v3, :cond_3

    .line 728
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mPhoneStateListenerGemini:Landroid/telephony/PhoneStateListener;

    invoke-static {v3, v5, v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->listen(Landroid/telephony/PhoneStateListener;II)V

    .line 727
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 733
    :cond_3
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 734
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotationChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v3, v4}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 735
    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v4, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileListenr:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    invoke-virtual {v3, v4, v5}, Lcom/mediatek/audioprofile/AudioProfileManager;->listenAudioProfie(Lcom/mediatek/common/audioprofile/AudioProfileListener;I)V

    goto :goto_1
.end method

.method public updateForSimReady()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 381
    const-string v1, "QuickSettingsConnectionModel"

    const-string v2, "Panel sim ready called"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v1

    if-nez v1, :cond_1

    .line 385
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSimCardReady:Z

    .line 386
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfoList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 387
    .local v0, simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_2

    .line 388
    :cond_0
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    .line 392
    :goto_0
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->isClickable()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 393
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 397
    .end local v0           #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_1
    return-void

    .line 390
    .restart local v0       #simInfos:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;>;"
    :cond_2
    iget-object v1, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    invoke-virtual {v1, v3}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setHasSim(Z)V

    goto :goto_0
.end method

.method public updateResources()V
    .locals 12

    .prologue
    const v11, 0x7f0b000f

    .line 1822
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mWifiTileView:Landroid/view/View;

    const v10, 0x7f0800a4

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 1823
    .local v8, wifiText:Landroid/widget/TextView;
    const v9, 0x7f0b000d

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1826
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mBluetoothTileView:Landroid/view/View;

    const v10, 0x7f08008f

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 1827
    .local v3, bluetoothText:Landroid/widget/TextView;
    const v9, 0x7f0b000e

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1830
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mGpsTileView:Landroid/view/View;

    const v10, 0x7f080095

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 1831
    .local v5, gpsText:Landroid/widget/TextView;
    const v9, 0x7f0b0010

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1834
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v9

    if-nez v9, :cond_0

    .line 1836
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileTileView:Landroid/view/View;

    const v10, 0x7f080093

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 1837
    .local v4, dataConnText:Landroid/widget/TextView;
    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setText(I)V

    .line 1841
    .end local v4           #dataConnText:Landroid/widget/TextView;
    :cond_0
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mTimeoutTileView:Landroid/view/View;

    const v10, 0x7f08009f

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 1842
    .local v7, timeoutText:Landroid/widget/TextView;
    const v9, 0x7f0b0018

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1843
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAutoRotateTileView:Landroid/view/View;

    const v10, 0x7f08008a

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1844
    .local v2, autoRotateText:Landroid/widget/TextView;
    const v9, 0x7f0b0011

    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1845
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAudioProfileTileView:Landroid/view/View;

    const v10, 0x7f080088

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1846
    .local v1, audioProfileText:Landroid/widget/TextView;
    const v9, 0x7f0b0033

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1847
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mAirlineModeTileView:Landroid/view/View;

    const v10, 0x7f080085

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1848
    .local v0, airPlaneModeText:Landroid/widget/TextView;
    const v9, 0x7f0b0016

    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(I)V

    .line 1849
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    if-eqz v9, :cond_1

    .line 1850
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchDialog:Landroid/app/AlertDialog;

    invoke-virtual {v9, v11}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 1852
    :cond_1
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    if-eqz v9, :cond_2

    .line 1853
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mSwitchListview:Lcom/android/systemui/statusbar/toolbar/SimIconsListView;

    invoke-virtual {v9}, Lcom/android/systemui/statusbar/toolbar/SimIconsListView;->updateResources()V

    .line 1857
    :cond_2
    const/4 v6, 0x0

    .line 1858
    .local v6, isProfileSwitchDialogVisible:Z
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    if-eqz v9, :cond_3

    .line 1859
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->removeAllProfileSwitchDialogCallbacks()V

    .line 1861
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v9}, Landroid/app/Dialog;->isShowing()Z

    move-result v6

    .line 1862
    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    invoke-virtual {v9}, Landroid/app/Dialog;->dismiss()V

    .line 1864
    :cond_3
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mProfileSwitchDialog:Landroid/app/Dialog;

    .line 1865
    if-eqz v6, :cond_4

    .line 1866
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->showProfileSwitchDialog()V

    .line 1868
    :cond_4
    return-void
.end method

.method public updateSimInfo(Landroid/content/Intent;)V
    .locals 8
    .parameter "intent"

    .prologue
    .line 407
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->isWifiOnlyDevice()Z

    move-result v5

    if-nez v5, :cond_0

    .line 409
    const-string v5, "type"

    const/4 v6, -0x1

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 410
    .local v4, type:I
    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 411
    const-string v5, "simid"

    const-wide/16 v6, -0x1

    invoke-virtual {p1, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 412
    .local v2, simId:J
    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    const-string v6, "gprs_connection_sim_setting"

    invoke-static {v5, v6}, Lcom/android/systemui/statusbar/util/SIMHelper;->getDefaultSIM(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v0

    .line 414
    .local v0, currentSimId:J
    cmp-long v5, v2, v0

    if-nez v5, :cond_0

    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-lez v5, :cond_0

    .line 416
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

    .line 418
    iget-object v5, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mMobileStateTracker:Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;

    iget-object v6, p0, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v6}, Lcom/android/systemui/statusbar/toolbar/QuickSettingsConnectionModel$MobileStateTracker;->setImageViewResources(Landroid/content/Context;)V

    .line 425
    .end local v0           #currentSimId:J
    .end local v2           #simId:J
    .end local v4           #type:I
    :cond_0
    return-void
.end method
