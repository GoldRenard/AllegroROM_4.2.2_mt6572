.class public Lcom/mediatek/phone/vt/VTInCallScreen;
.super Landroid/widget/RelativeLayout;
.source "VTInCallScreen.java"

# interfaces
.implements Lcom/mediatek/phone/vt/IVTInCallScreen;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Landroid/widget/PopupMenu$OnDismissListener;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/vt/VTInCallScreen$InCallVideoSettingLocalEffectListener;,
        Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final HIDDEN:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "VTInCallScreen"

.field private static final SECOND_TO_MILLISECOND:I = 0x3e8

.field private static final VDBG:Z = true

.field private static final VISIBLE:I = 0xff

.field private static final VT_MEDIA_ERROR_VIDEO_FAIL:I = 0x1

.field private static final VT_MEDIA_OCCUPIED:I = 0x1

.field private static final VT_MEDIA_RECORDER_ERROR_UNKNOWN:I = 0x1

.field private static final VT_MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED:I = 0x321

.field private static final VT_MEDIA_RECORDER_NO_I_FRAME:I = 0x7fff

.field private static final VT_PEER_SNAPSHOT_FAIL:I = 0x7f

.field private static final VT_PEER_SNAPSHOT_OK:I = 0x7e

.field private static final VT_TAKE_PEER_PHOTO_DISK_MIN_SIZE:I = 0xf4240

.field private static final WAITING_TIME_FOR_ASK_VT_SHOW_ME:I = 0x5


# instance fields
.field private mAudioModePopup:Landroid/widget/PopupMenu;

.field private mAudioModePopupVisible:Z

.field private mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

.field private mCM:Lcom/android/internal/telephony/CallManager;

.field private mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

.field private mCallBanner:Lcom/mediatek/phone/vt/VTCallBanner;

.field private mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

.field private mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

.field private mHandler:Landroid/os/Handler;

.field private mHasMediaRecordError:Z

.field private mHighVideoHolder:Landroid/view/SurfaceHolder;

.field private mInCallScreen:Lcom/android/phone/InCallScreen;

.field private mInCallVideoSettingDialog:Landroid/app/AlertDialog;

.field private mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

.field private mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

.field private mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

.field private mLocaleChanged:Z

.field private mLowVideoHolder:Landroid/view/SurfaceHolder;

.field private mVTAudio:Landroid/widget/CompoundButton;

.field private mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

.field private mVTDialpad:Landroid/widget/CompoundButton;

.field private mVTHangUp:Landroid/widget/ImageButton;

.field private mVTHangUpWrapper:Landroid/widget/RelativeLayout;

.field private mVTHighDown:Landroid/widget/ImageButton;

.field private mVTHighUp:Landroid/widget/ImageButton;

.field private mVTHighVideo:Landroid/view/SurfaceView;

.field private mVTInCallCanvas:Landroid/view/ViewGroup;

.field private mVTLowDown:Landroid/widget/ImageButton;

.field private mVTLowUp:Landroid/widget/ImageButton;

.field private mVTLowVideo:Landroid/view/SurfaceView;

.field private mVTLowWrapper:Landroid/view/View;

.field private mVTMTAsker:Landroid/app/AlertDialog;

.field private mVTMute:Landroid/widget/CompoundButton;

.field private mVTOverflowMenu:Landroid/widget/ImageButton;

.field private mVTPopupMenu:Landroid/widget/PopupMenu;

.field private mVTPowerManager:Landroid/os/PowerManager;

.field mVTRecorderEntries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mVTRecorderSelector:Landroid/app/AlertDialog;

.field private mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

.field private mVTSwapVideo:Landroid/widget/CompoundButton;

.field private mVTVoiceReCallDialog:Landroid/app/AlertDialog;

.field private mVTVoiceRecordingIcon:Landroid/widget/ImageView;

.field private mVTWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 196
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 150
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 243
    new-instance v0, Lcom/mediatek/phone/vt/VTInCallScreen$1;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$1;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHandler:Landroid/os/Handler;

    .line 199
    const-string v0, "VTInCallScreen constructor..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- this = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 203
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 204
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 205
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 213
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 150
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 243
    new-instance v0, Lcom/mediatek/phone/vt/VTInCallScreen$1;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$1;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHandler:Landroid/os/Handler;

    .line 215
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 216
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 217
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 226
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 150
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 243
    new-instance v0, Lcom/mediatek/phone/vt/VTInCallScreen$1;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$1;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHandler:Landroid/os/Handler;

    .line 228
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 229
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 230
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVTSettingToVTManager()V

    return-void
.end method

.method static synthetic access$1100(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showVTLocalZoom()V

    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showVTLocalBrightness()V

    return-void
.end method

.method static synthetic access$1400(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showVTLocalContrast()V

    return-void
.end method

.method static synthetic access$1500(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTInCallVideoSettingLocalEffect()V

    return-void
.end method

.method static synthetic access$1600(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTInCallVideoSettingLocalNightMode()V

    return-void
.end method

.method static synthetic access$1700(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTInCallVideoSettingPeerQuality()V

    return-void
.end method

.method static synthetic access$1800(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1802(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateLocalZoomOrBrightness()V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onReceiveVTManagerReady()V

    return-void
.end method

.method static synthetic access$2000(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2202(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 108
    invoke-direct {p0, p1, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->makeVoiceReCall(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$2400(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderSelector:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2402(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderSelector:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/mediatek/phone/vt/VTInCallScreen;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->startRecord(I)V

    return-void
.end method

.method static synthetic access$2600(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2602(Lcom/mediatek/phone/vt/VTInCallScreen;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2700(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTHideMeClick()V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/internal/telephony/CallManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/phone/vt/VTInCallScreen;)Lcom/android/phone/InCallScreen;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/phone/vt/VTInCallScreen;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTReceiveFirstFrame()V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/phone/vt/VTInCallScreen;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-boolean v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHasMediaRecordError:Z

    return v0
.end method

.method static synthetic access$702(Lcom/mediatek/phone/vt/VTInCallScreen;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 108
    iput-boolean p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHasMediaRecordError:Z

    return p1
.end method

.method static synthetic access$800(Lcom/mediatek/phone/vt/VTInCallScreen;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private amendLayoutForDifferentScreen()V
    .locals 12

    .prologue
    .line 3282
    sget-boolean v10, Lcom/android/phone/PhoneGlobals;->sHasNavigationBar:Z

    if-eqz v10, :cond_0

    .line 3283
    const-string v10, "has navigation bar, reset the layout size..."

    invoke-direct {p0, v10}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3284
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 3285
    .local v7, res:Landroid/content/res/Resources;
    const v10, 0x7f0c0045

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 3287
    .local v5, lowVideoHeight:I
    const v10, 0x7f0c0046

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 3289
    .local v6, lowVideoWidth:I
    const v10, 0x7f0c0047

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 3291
    .local v3, highVideoHeight:I
    const v10, 0x7f0c0048

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 3293
    .local v4, highVideoWidth:I
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0c0044

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 3295
    .local v1, buttonMargin:I
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v10}, Lcom/android/phone/InCallScreen;->getScreenSize()Landroid/graphics/Point;

    move-result-object v10

    iget v8, v10, Landroid/graphics/Point;->x:I

    .line 3297
    .local v8, screenWidth:I
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v10}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iput v3, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3298
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v10}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iput v4, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3299
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v10}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iput v5, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3300
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v10}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    iput v6, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3302
    mul-int/lit8 v9, v1, 0x5

    .line 3303
    .local v9, totalWidthMarin:I
    sub-int v10, v8, v6

    sub-int/2addr v10, v9

    div-int/lit8 v2, v10, 0x3

    .line 3304
    .local v2, buttonWidth:I
    sub-int v10, v5, v1

    div-int/lit8 v0, v10, 0x2

    .line 3305
    .local v0, buttonHeight:I
    invoke-direct {p0, v2, v0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVtButtonSize(III)V

    .line 3307
    .end local v0           #buttonHeight:I
    .end local v1           #buttonMargin:I
    .end local v2           #buttonWidth:I
    .end local v3           #highVideoHeight:I
    .end local v4           #highVideoWidth:I
    .end local v5           #lowVideoHeight:I
    .end local v6           #lowVideoWidth:I
    .end local v7           #res:Landroid/content/res/Resources;
    .end local v8           #screenWidth:I
    .end local v9           #totalWidthMarin:I
    :cond_0
    return-void
.end method

.method private closeVTInCallCanvas()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 836
    const-string v0, "closeVTInCallCanvas!"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 838
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    .line 839
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 841
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissAudioModePopup()V

    .line 842
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    .line 843
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 844
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 847
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_2

    .line 848
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 850
    :cond_2
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_3

    .line 851
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 853
    :cond_3
    return-void
.end method

.method private closeVTManager()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1859
    const-string v0, "closeVTManager()!"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1861
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissVTDialogs()V

    .line 1862
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1864
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const/4 v1, 0x1

    invoke-static {v0, v3, v1}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 1866
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHandler:Landroid/os/Handler;

    const v1, 0x8001

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1868
    const-string v0, "VT_VOICE_RECORDING"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VT_VIDEO_RECORDING"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1870
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->isVTRecording()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1871
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->stopRecord()V

    .line 1876
    :cond_1
    const-string v0, "- call VTManager onDisconnected ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1878
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->onDisconnected()V

    .line 1880
    const-string v0, "- finish call VTManager onDisconnected ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1884
    const-string v0, "- set VTManager close ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1886
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->setVTClose()V

    .line 1888
    const-string v0, "- finish set VTManager close ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1891
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTInControlRes()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1892
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.phone.extra.VT_CALL_END"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->sendBroadcast(Landroid/content/Intent;)V

    .line 1893
    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVTInControlRes(Z)V

    .line 1895
    :cond_2
    return-void
.end method

.method private constructPopupMenu(Landroid/view/View;)Landroid/widget/PopupMenu;
    .locals 2
    .parameter "anchorView"

    .prologue
    .line 2512
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-nez v0, :cond_0

    .line 2513
    new-instance v0, Landroid/widget/PopupMenu;

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    .line 2514
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    const v1, 0x7f100004

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->inflate(I)V

    .line 2515
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 2517
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->setupMenuItems(Landroid/view/Menu;)V

    .line 2518
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    return-object v0
.end method

.method private dismissAudioModePopup()V
    .locals 1

    .prologue
    .line 2724
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    .line 2725
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2726
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    .line 2727
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopupVisible:Z

    .line 2729
    :cond_0
    return-void
.end method

.method private dismissVideoSettingDialogs()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 3229
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 3230
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3231
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    .line 3233
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 3234
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3235
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    .line 3237
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 3238
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3239
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    .line 3241
    :cond_2
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    .line 3242
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3243
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    .line 3245
    :cond_3
    return-void
.end method

.method private getVTInControlRes()Z
    .locals 1

    .prologue
    .line 1828
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInControlRes:Z

    return v0
.end method

.method private handleAudioButtonClick()V
    .locals 3

    .prologue
    .line 2770
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v0

    .line 2772
    .local v0, inCallControlState:Lcom/android/phone/InCallControlState;
    iget-boolean v1, v0, Lcom/android/phone/InCallControlState;->bluetoothEnabled:Z

    if-eqz v1, :cond_0

    .line 2774
    const-string v1, "- handleAudioButtonClick: \'popup menu\' mode..."

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2776
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showAudioModePopup()V

    .line 2779
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2786
    :goto_0
    return-void

    .line 2782
    :cond_0
    const-string v1, "- handleAudioButtonClick: \'speaker toggle\' mode..."

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2784
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1}, Lcom/android/phone/InCallScreen;->toggleSpeaker()V

    goto :goto_0
.end method

.method private hideLocalZoomOrBrightness()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 989
    const-string v0, "hideLocalZoomOrBrightness()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 992
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 993
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 994
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 995
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 996
    return-void
.end method

.method private isDialerOpened()Z
    .locals 1

    .prologue
    .line 2421
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 3274
    const-string v0, "VTInCallScreen"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3275
    return-void
.end method

.method private makeVoiceReCall(Ljava/lang/String;I)V
    .locals 4
    .parameter "number"
    .parameter "slot"

    .prologue
    .line 2268
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "makeVoiceReCall(), number is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " slot is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2271
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CALL"

    const-string v2, "tel"

    const/4 v3, 0x0

    invoke-static {v2, p1, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2272
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.android.phone.extra.slot"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2273
    const-string v1, "com.android.phone.extra.international"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2274
    const/high16 v1, 0x1400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2275
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/phone/PhoneGlobals;->startActivity(Landroid/content/Intent;)V

    .line 2276
    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVTScreenMode(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 2277
    return-void
.end method

.method private okToRecordVoice()Z
    .locals 1

    .prologue
    .line 2508
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoConnected:Z

    return v0
.end method

.method private onReceiveVTManagerReady()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 3098
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoReady:Z

    .line 3099
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 3102
    const-string v0, "Incallscreen, before call setting"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3105
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3107
    const-string v0, "Now DM not locked, VTManager.getInstance().unlockPeerVideo() start;"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3110
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->unlockPeerVideo()V

    .line 3112
    const-string v0, "Now DM not locked, VTManager.getInstance().unlockPeerVideo() end;"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3116
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTIsMT:Z

    if-eqz v0, :cond_0

    .line 3119
    const-string v0, "- VTSettingUtils.getInstance().mShowLocalMT : 1 !"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3120
    const-string v0, "Incallscreen, before enableAlwaysAskSettings"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3122
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->enableAlwaysAskSettings(I)V

    .line 3124
    const-string v0, "Incallscreen, after enableAlwaysAskSettings"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3127
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0037

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mediatek/phone/vt/VTInCallScreen$20;

    invoke-direct {v2, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$20;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0039

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mediatek/phone/vt/VTInCallScreen$19;

    invoke-direct {v2, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$19;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/phone/vt/VTInCallScreen$18;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$18;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    .line 3192
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 3194
    new-instance v0, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    invoke-direct {v0, p0, v1, v2}, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;ILandroid/app/AlertDialog;)V

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->start()V

    .line 3198
    :cond_0
    return-void
.end method

.method private onVTHideMeClick()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1196
    const-string v2, "onVTHideMeClick()..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1199
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v2

    sget-object v3, Lcom/mediatek/vt/VTManager$State;->READY:Lcom/mediatek/vt/VTManager$State;

    if-eq v2, v3, :cond_0

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v2

    sget-object v3, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    if-eq v2, v3, :cond_0

    .line 1221
    :goto_0
    return-void

    .line 1204
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSlotId:I

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTFile(I)V

    .line 1206
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    if-eqz v2, :cond_1

    .line 1207
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v1, v3}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    .line 1219
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iget-boolean v3, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    if-nez v3, :cond_4

    :goto_2
    iput-boolean v0, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    .line 1220
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 1209
    :cond_1
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v2

    iget-object v2, v2, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1210
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_1

    .line 1211
    :cond_2
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v2

    iget-object v2, v2, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1212
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    const/4 v3, 0x2

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_1

    .line 1214
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iget v3, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSlotId:I

    invoke-static {v3}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_1

    :cond_4
    move v0, v1

    .line 1219
    goto :goto_2
.end method

.method private onVTHideMeClick2()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1227
    const-string v0, "onVTHideMeClick2()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1230
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSlotId:I

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTFile(I)V

    .line 1232
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1233
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    iget v1, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSlotId:I

    invoke-static {v1}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    .line 1241
    :goto_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v3, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    .line 1242
    return-void

    .line 1235
    :cond_0
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1236
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x2

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_0

    .line 1238
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_0
.end method

.method private onVTInCallVideoSetting()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    const v5, 0x7f070016

    const v4, 0x7f0d001f

    .line 1479
    const-string v2, "onVTInCallVideoSetting() ! "

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1482
    new-instance v1, Lcom/mediatek/phone/vt/VTInCallScreen$4;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$4;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 1542
    .local v1, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1543
    .local v0, myBuilder:Landroid/app/AlertDialog$Builder;
    const v2, 0x7f0d0196

    new-instance v3, Lcom/mediatek/phone/vt/VTInCallScreen$5;

    invoke-direct {v3, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$5;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1552
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    if-nez v2, :cond_3

    .line 1553
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_0

    .line 1554
    const/4 v2, 0x0

    invoke-virtual {v0, v5, v2, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1578
    :goto_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    .line 1579
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 1580
    return-void

    .line 1556
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_1

    .line 1557
    const/4 v2, 0x1

    invoke-virtual {v0, v5, v2, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1559
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_2

    .line 1560
    const/4 v2, 0x2

    invoke-virtual {v0, v5, v2, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1563
    :cond_2
    invoke-virtual {v0, v5, v6, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1567
    :cond_3
    const v2, 0x7f070017

    new-instance v3, Lcom/mediatek/phone/vt/VTInCallScreen$6;

    invoke-direct {v3, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$6;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v2, v6, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    goto :goto_0
.end method

.method private onVTInCallVideoSettingLocalEffect()V
    .locals 12

    .prologue
    .line 1584
    const-string v10, "onVTInCallVideoSettingLocalEffect() ! "

    invoke-direct {p0, v10}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1586
    new-instance v7, Landroid/app/AlertDialog$Builder;

    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v7, v10}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1587
    .local v7, myBuilder:Landroid/app/AlertDialog$Builder;
    const v10, 0x7f0d0196

    new-instance v11, Lcom/mediatek/phone/vt/VTInCallScreen$7;

    invoke-direct {v11, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$7;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v7, v10, v11}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1596
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/mediatek/vt/VTManager;->getSupportedColorEffects()Ljava/util/List;

    move-result-object v9

    .line 1599
    .local v9, supportEntryValues:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v9, :cond_0

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-gtz v10, :cond_1

    .line 1632
    :cond_0
    :goto_0
    return-void

    .line 1603
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070015

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 1605
    .local v3, entryValues:[Ljava/lang/CharSequence;
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f070014

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 1607
    .local v1, entries:[Ljava/lang/CharSequence;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1608
    .local v4, entryValues2:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1610
    .local v2, entries2:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    const/4 v5, 0x0

    .local v5, i:I
    array-length v6, v3

    .local v6, len:I
    :goto_1
    if-ge v5, v6, :cond_3

    .line 1611
    aget-object v10, v3, v5

    invoke-virtual {v10}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v10

    if-ltz v10, :cond_2

    .line 1612
    aget-object v10, v3, v5

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1613
    aget-object v10, v1, v5

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1610
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1618
    :cond_3
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "onVTInCallVideoSettingLocalEffect() : entryValues2.size() - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1621
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/mediatek/vt/VTManager;->getColorEffect()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 1623
    .local v0, currentValue:I
    new-instance v8, Lcom/mediatek/phone/vt/VTInCallScreen$InCallVideoSettingLocalEffectListener;

    invoke-direct {v8, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$InCallVideoSettingLocalEffectListener;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 1625
    .local v8, myClickListener:Lcom/mediatek/phone/vt/VTInCallScreen$InCallVideoSettingLocalEffectListener;
    invoke-virtual {v8, v4}, Lcom/mediatek/phone/vt/VTInCallScreen$InCallVideoSettingLocalEffectListener;->setValues(Ljava/util/ArrayList;)V

    .line 1626
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v10

    new-array v10, v10, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/CharSequence;

    invoke-virtual {v7, v10, v0, v8}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1629
    const v10, 0x7f0d0022

    invoke-virtual {v7, v10}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1630
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    iput-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    .line 1631
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0
.end method

.method private onVTInCallVideoSettingLocalNightMode()V
    .locals 6

    .prologue
    const v5, 0x7f070018

    const/4 v4, 0x0

    .line 1661
    const-string v2, "onVTInCallVideoSettingLocalNightMode() ! "

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1664
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1665
    .local v0, myBuilder:Landroid/app/AlertDialog$Builder;
    const v2, 0x7f0d0196

    new-instance v3, Lcom/mediatek/phone/vt/VTInCallScreen$8;

    invoke-direct {v3, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$8;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1673
    const v2, 0x7f0d0023

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1675
    new-instance v1, Lcom/mediatek/phone/vt/VTInCallScreen$9;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$9;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 1700
    .local v1, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->isSupportNightMode()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1702
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->getNightMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1703
    invoke-virtual {v0, v5, v4, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1724
    :goto_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    .line 1725
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 1726
    return-void

    .line 1707
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {v0, v5, v2, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1712
    :cond_1
    const v2, 0x7f070019

    new-instance v3, Lcom/mediatek/phone/vt/VTInCallScreen$10;

    invoke-direct {v3, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$10;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0
.end method

.method private onVTInCallVideoSettingPeerQuality()V
    .locals 6

    .prologue
    const v5, 0x7f07001a

    const/4 v4, 0x1

    .line 1730
    const-string v2, "onVTInCallVideoSettingPeerQuality() ! "

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1732
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1733
    .local v0, myBuilder:Landroid/app/AlertDialog$Builder;
    const v2, 0x7f0d0196

    new-instance v3, Lcom/mediatek/phone/vt/VTInCallScreen$11;

    invoke-direct {v3, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$11;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1741
    const v2, 0x7f0d0024

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1743
    new-instance v1, Lcom/mediatek/phone/vt/VTInCallScreen$12;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$12;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 1768
    .local v1, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->getVideoQuality()I

    move-result v2

    if-ne v4, v2, :cond_0

    .line 1769
    const/4 v2, 0x0

    invoke-virtual {v0, v5, v2, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1784
    :goto_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    .line 1785
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 1786
    return-void

    .line 1772
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->getVideoQuality()I

    move-result v2

    if-nez v2, :cond_1

    .line 1773
    invoke-virtual {v0, v5, v4, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1778
    :cond_1
    const-string v2, "VTManager.getInstance().getVideoQuality() is not VTManager.VT_VQ_SHARP or VTManager.VT_VQ_NORMAL , error ! "

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private onVTReceiveFirstFrame()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1837
    const-string v0, "onVTReceiveFirstFrame() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1839
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-eqz v0, :cond_2

    .line 1840
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 1841
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1842
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1852
    :cond_0
    :goto_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    if-nez v0, :cond_1

    .line 1853
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    .line 1855
    :cond_1
    return-void

    .line 1846
    :cond_2
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 1847
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1848
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method private onVTShowDialpad()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 1437
    const-string v0, "onVTShowDialpad() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1440
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1442
    const-string v0, "onShowHideDialpad(): Set mInCallTitle VISIBLE"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1444
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->closeDialer(Z)V

    .line 1446
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->openDialer(Z)V

    .line 1447
    return-void
.end method

.method private onVTSwapVideos()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1451
    const-string v0, "onVTSwapVideos() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1454
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v0, :cond_1

    .line 1457
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    .line 1460
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-nez v0, :cond_5

    move v0, v1

    :goto_0
    iput-boolean v0, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    .line 1462
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1463
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTLocalPeerDisplay()V

    .line 1464
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1466
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-eqz v0, :cond_2

    .line 1467
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showVTLocalZoom()V

    .line 1469
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-eqz v0, :cond_3

    .line 1470
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showVTLocalBrightness()V

    .line 1472
    :cond_3
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v0, :cond_4

    .line 1473
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showVTLocalContrast()V

    .line 1475
    :cond_4
    return-void

    :cond_5
    move v0, v2

    .line 1460
    goto :goto_0
.end method

.method private onVTSwitchCameraClick()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 1246
    const-string v0, "onVTSwitchCameraClick()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1249
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v0

    sget-object v2, Lcom/mediatek/vt/VTManager$State;->READY:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v2, :cond_0

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v0

    sget-object v2, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v2, :cond_0

    .line 1278
    :goto_0
    return-void

    .line 1254
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInSwitchCamera:Z

    if-eqz v0, :cond_1

    .line 1256
    const-string v0, "VTManager is handling switchcamera now, so returns this time."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1263
    :cond_1
    new-instance v0, Lcom/mediatek/phone/vt/VTInCallScreen$3;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$3;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen$3;->start()V

    .line 1271
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTFrontCameraNow:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTFrontCameraNow:Z

    .line 1272
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1274
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 1275
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 1276
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    .line 1277
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    goto :goto_0

    :cond_2
    move v0, v1

    .line 1271
    goto :goto_1
.end method

.method private onVTTakePeerPhotoClick()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1148
    const-string v0, "onVTTakePeerPhotoClick()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1151
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v0

    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v1, :cond_0

    .line 1192
    :goto_0
    return-void

    .line 1156
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInSnapshot:Z

    if-eqz v0, :cond_1

    .line 1158
    const-string v0, "VTManager is handling snapshot now, so returns this time."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1164
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isExternalStorageMounted()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1165
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0033

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1169
    :cond_2
    const-wide/32 v0, 0xf4240

    invoke-static {v0, v1}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(J)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1170
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0034

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1175
    :cond_3
    new-instance v0, Lcom/mediatek/phone/vt/VTInCallScreen$2;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$2;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreen$2;->start()V

    goto :goto_0
.end method

.method private onVoiceVideoRecordClick(Landroid/view/MenuItem;)V
    .locals 5
    .parameter "menuItem"

    .prologue
    const/4 v4, 0x1

    .line 3040
    const-string v1, "onVoiceVideoRecordClick"

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3042
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3043
    .local v0, title:Ljava/lang/String;
    if-nez v0, :cond_1

    .line 3068
    :cond_0
    :goto_0
    return-void

    .line 3046
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isExternalStorageMounted()Z

    move-result v1

    if-nez v1, :cond_2

    .line 3047
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d000c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 3050
    :cond_2
    const-wide/32 v1, 0x200000

    invoke-static {v1, v2}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(J)Z

    move-result v1

    if-nez v1, :cond_3

    .line 3051
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1, v4}, Lcom/android/phone/InCallScreen;->handleStorageFull(Z)V

    goto :goto_0

    .line 3055
    :cond_3
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const v2, 0x7f0d006f

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 3057
    const-string v1, "want to startRecord"

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3059
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getPhoneRecorderState()I

    move-result v1

    if-nez v1, :cond_0

    .line 3061
    const-string v1, "startRecord"

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3063
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showStartVTRecorderDialog()V

    goto :goto_0

    .line 3065
    :cond_4
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const v2, 0x7f0d0070

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3066
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->stopRecord()V

    goto :goto_0
.end method

.method private openVTInCallCanvas()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 818
    const-string v0, "openVTInCallCanvas!"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 820
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 821
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 822
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 825
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 826
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 829
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_2

    .line 830
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 832
    :cond_2
    return-void
.end method

.method private setVTInControlRes(Z)V
    .locals 1
    .parameter "value"

    .prologue
    .line 1832
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean p1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInControlRes:Z

    .line 1833
    return-void
.end method

.method private setVTSettingToVTManager()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 3249
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    if-eqz v0, :cond_0

    .line 3250
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/mediatek/vt/VTManager;->enableHideYou(I)V

    .line 3255
    :goto_0
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMO:Z

    if-eqz v0, :cond_1

    .line 3256
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->enableHideMe(I)V

    .line 3261
    :goto_1
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3262
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->incomingVideoDispaly(I)V

    .line 3269
    :goto_2
    const-string v0, "Incallscreen, after call setting"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3271
    return-void

    .line 3252
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->enableHideYou(I)V

    goto :goto_0

    .line 3258
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/mediatek/vt/VTManager;->enableHideMe(I)V

    goto :goto_1

    .line 3263
    :cond_2
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3264
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/mediatek/vt/VTManager;->incomingVideoDispaly(I)V

    goto :goto_2

    .line 3266
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->incomingVideoDispaly(I)V

    goto :goto_2
.end method

.method private setVtButtonSize(III)V
    .locals 3
    .parameter "width"
    .parameter "height"
    .parameter "buttonMargin"

    .prologue
    .line 3311
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3312
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3313
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3314
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3315
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3316
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3317
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3318
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3319
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 3320
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v1}, Landroid/widget/CompoundButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3321
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    mul-int/lit8 v2, p2, 0x2

    add-int/2addr v2, p3

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3322
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUpWrapper:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    mul-int/lit8 v2, p2, 0x2

    add-int/2addr v2, p3

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3323
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUpWrapper:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 3325
    .local v0, layoutParams:Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v1, 0x3

    const v2, 0x7f08010f

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 3326
    const/4 v1, 0x1

    const v2, 0x7f080116

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 3327
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 3328
    return-void
.end method

.method private showAudioModePopup()V
    .locals 12

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 2659
    const-string v7, "showAudioModePopup()..."

    invoke-direct {p0, v7}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2662
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissAudioModePopup()V

    .line 2664
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-nez v7, :cond_0

    .line 2665
    new-instance v7, Landroid/widget/PopupMenu;

    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    iget-object v11, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-direct {v7, v10, v11}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    .line 2667
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v7

    const v10, 0x7f100001

    iget-object v11, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v11}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 2669
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 2670
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7, p0}, Landroid/widget/PopupMenu;->setOnDismissListener(Landroid/widget/PopupMenu$OnDismissListener;)V

    .line 2675
    :cond_0
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v7}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v2

    .line 2678
    .local v2, inCallControlState:Lcom/android/phone/InCallControlState;
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    .line 2685
    .local v3, menu:Landroid/view/Menu;
    const v7, 0x7f080134

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 2686
    .local v4, speakerItem:Landroid/view/MenuItem;
    iget-boolean v7, v2, Lcom/android/phone/InCallControlState;->speakerEnabled:Z

    invoke-interface {v4, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2692
    const v7, 0x7f080135

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 2693
    .local v1, earpieceItem:Landroid/view/MenuItem;
    const v7, 0x7f080136

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 2694
    .local v6, wiredHeadsetItem:Landroid/view/MenuItem;
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v5

    .line 2700
    .local v5, usingHeadset:Z
    if-nez v5, :cond_2

    move v7, v8

    :goto_0
    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2701
    if-nez v5, :cond_1

    move v9, v8

    :cond_1
    invoke-interface {v1, v9}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2703
    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2704
    invoke-interface {v6, v5}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2706
    const v7, 0x7f080137

    invoke-interface {v3, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 2707
    .local v0, bluetoothItem:Landroid/view/MenuItem;
    iget-boolean v7, v2, Lcom/android/phone/InCallControlState;->bluetoothEnabled:Z

    invoke-interface {v0, v7}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2709
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->show()V

    .line 2714
    iput-boolean v8, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopupVisible:Z

    .line 2715
    return-void

    .end local v0           #bluetoothItem:Landroid/view/MenuItem;
    :cond_2
    move v7, v9

    .line 2700
    goto :goto_0
.end method

.method private showGenericErrorDialog(IZ)V
    .locals 1
    .parameter "resid"
    .parameter "isStartupError"

    .prologue
    .line 2104
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0, p1, p2}, Lcom/android/phone/InCallScreen;->showGenericErrorDialog(IZ)V

    .line 2105
    return-void
.end method

.method private showReCallDialogEx(ILjava/lang/String;I)V
    .locals 6
    .parameter "resid"
    .parameter "number"
    .parameter "slot"

    .prologue
    .line 2297
    const-string v4, "showReCallDialogEx... "

    invoke-direct {p0, v4}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2300
    iget-object v4, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    if-eqz v4, :cond_0

    .line 2301
    iget-object v4, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2359
    :goto_0
    return-void

    .line 2305
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 2309
    .local v3, msg:Ljava/lang/CharSequence;
    new-instance v1, Lcom/mediatek/phone/vt/VTInCallScreen$13;

    invoke-direct {v1, p0, p2, p3}, Lcom/mediatek/phone/vt/VTInCallScreen$13;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;Ljava/lang/String;I)V

    .line 2326
    .local v1, clickListener1:Landroid/content/DialogInterface$OnClickListener;
    new-instance v2, Lcom/mediatek/phone/vt/VTInCallScreen$14;

    invoke-direct {v2, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$14;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 2344
    .local v2, clickListener2:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Lcom/mediatek/phone/vt/VTInCallScreen$15;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$15;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 2352
    .local v0, cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f0d0196

    invoke-virtual {v4, v5, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f0d0192

    invoke-virtual {v4, v5, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    .line 2355
    iget-object v4, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 2356
    iget-object v4, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 2358
    iget-object v4, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showStartVTRecorderDialog()V
    .locals 5

    .prologue
    .line 2958
    const-string v2, "showStartVTRecorderDialog() ..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2960
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2961
    .local v0, myBuilder:Landroid/app/AlertDialog$Builder;
    const v2, 0x7f0d0196

    new-instance v3, Lcom/mediatek/phone/vt/VTInCallScreen$16;

    invoke-direct {v3, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$16;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 2970
    const v2, 0x7f0d0067

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 2972
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    if-nez v2, :cond_3

    .line 2973
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    .line 2978
    :goto_0
    const-string v2, "VT_VIDEO_RECORDING"

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "VT_VIDEO_RECORDING"

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2980
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0068

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2983
    :cond_0
    const-string v2, "VT_VOICE_RECORDING"

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2984
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0069

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2987
    :cond_1
    const-string v2, "VT_VIDEO_RECORDING"

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2988
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d006a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2992
    :cond_2
    new-instance v1, Lcom/mediatek/phone/vt/VTInCallScreen$17;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/vt/VTInCallScreen$17;-><init>(Lcom/mediatek/phone/vt/VTInCallScreen;)V

    .line 3030
    .local v1, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/CharSequence;

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 3034
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderSelector:Landroid/app/AlertDialog;

    .line 3035
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderSelector:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 3036
    return-void

    .line 2975
    .end local v1           #myClickListener:Landroid/content/DialogInterface$OnClickListener;
    :cond_3
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    goto :goto_0
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 2
    .parameter "string"

    .prologue
    .line 3209
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 3210
    return-void
.end method

.method private showVTLocalBrightness()V
    .locals 4

    .prologue
    const v3, 0x7f0200dc

    const v1, 0x7f0200db

    const/4 v2, 0x0

    .line 926
    const-string v0, "showVTLocalBrightness()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 929
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoReady:Z

    if-nez v0, :cond_0

    .line 953
    :goto_0
    return-void

    .line 933
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-eqz v0, :cond_1

    .line 934
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 935
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 936
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 937
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 938
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 939
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 949
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 950
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 951
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 941
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 942
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 943
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 944
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 945
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 946
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_1
.end method

.method private showVTLocalContrast()V
    .locals 4

    .prologue
    const v3, 0x7f0200de

    const v1, 0x7f0200dd

    const/4 v2, 0x0

    .line 957
    const-string v0, "showVTLocalContrast()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 960
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoReady:Z

    if-nez v0, :cond_0

    .line 984
    :goto_0
    return-void

    .line 964
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-eqz v0, :cond_1

    .line 965
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 966
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 967
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 968
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 969
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 970
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 980
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 981
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 982
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 972
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 973
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 974
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 975
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 976
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 977
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_1
.end method

.method private showVTLocalZoom()V
    .locals 4

    .prologue
    const v3, 0x7f0200e7

    const v1, 0x7f0200e6

    const/4 v2, 0x0

    .line 895
    const-string v0, "showVTLocalZoom()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 898
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoReady:Z

    if-nez v0, :cond_0

    .line 922
    :goto_0
    return-void

    .line 902
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-eqz v0, :cond_1

    .line 903
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 904
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 905
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 906
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 907
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 908
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 918
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 919
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 920
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 910
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 911
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 912
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 913
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 914
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 915
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_1
.end method

.method private startRecord(I)V
    .locals 7
    .parameter "type"

    .prologue
    const/4 v6, 0x1

    .line 2932
    const-string v2, "startVTRecorder() ..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2934
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getDiskAvailableSize()J

    move-result-wide v2

    const-wide/32 v4, 0x200000

    sub-long v0, v2, v4

    .line 2935
    .local v0, sdMaxSize:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_2

    .line 2936
    const/4 v2, 0x2

    if-ne v2, p1, :cond_1

    .line 2937
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorder;->getInstance(Landroid/content/Context;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/phone/recording/PhoneRecorder;->ismFlagRecord()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2939
    const-string v2, "startRecord"

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2942
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->startVoiceRecord(I)V

    .line 2954
    :cond_0
    :goto_0
    return-void

    .line 2944
    :cond_1
    if-lez p1, :cond_0

    .line 2945
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v2

    invoke-virtual {v2, p1, v0, v1, v6}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->startVideoRecord(IJI)V

    .line 2947
    invoke-virtual {p0, v6}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVideoCallRecordState(I)V

    goto :goto_0

    .line 2949
    :cond_2
    const-wide/16 v2, -0x1

    cmp-long v2, v2, v0

    if-nez v2, :cond_3

    .line 2950
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0033

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 2952
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0034

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private stopVideoRecord()V
    .locals 1

    .prologue
    .line 2905
    const-string v0, "stopVideoRecorder() ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2907
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVideoRecord()V

    .line 2908
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVideoCallRecordState(I)V

    .line 2909
    return-void
.end method

.method private updateAudioButton(Lcom/android/phone/InCallControlState;)V
    .locals 12
    .parameter "inCallControlState"

    .prologue
    const/4 v7, 0x1

    const/16 v9, 0xff

    const/4 v8, 0x0

    .line 2804
    const-string v10, "updateAudioButton()..."

    invoke-direct {p0, v10}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2813
    const/4 v6, 0x0

    .line 2816
    .local v6, showToggleStateIndication:Z
    const/4 v3, 0x0

    .line 2819
    .local v3, showMoreIndicator:Z
    const/4 v5, 0x0

    .line 2820
    .local v5, showSpeakerOnIcon:Z
    const/4 v4, 0x0

    .line 2821
    .local v4, showSpeakerOffIcon:Z
    const/4 v2, 0x0

    .line 2822
    .local v2, showHandsetIcon:Z
    const/4 v1, 0x0

    .line 2824
    .local v1, showBluetoothIcon:Z
    iget-boolean v10, p1, Lcom/android/phone/InCallControlState;->bluetoothEnabled:Z

    if-eqz v10, :cond_2

    .line 2826
    const-string v10, "- updateAudioButton: \'popup menu action button\' mode..."

    invoke-direct {p0, v10}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2829
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v10, v7}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 2834
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7, v8}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2837
    const/4 v3, 0x1

    .line 2838
    iget-boolean v7, p1, Lcom/android/phone/InCallControlState;->bluetoothIndicatorOn:Z

    if-eqz v7, :cond_0

    .line 2839
    const/4 v1, 0x1

    .line 2877
    :goto_0
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7}, Landroid/widget/CompoundButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 2879
    .local v0, layers:Landroid/graphics/drawable/LayerDrawable;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "- \'layers\' drawable: "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2887
    const v7, 0x7f08012c

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v3, :cond_5

    move v7, v9

    :goto_1
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2890
    const v7, 0x7f08012d

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v1, :cond_6

    move v7, v9

    :goto_2
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2893
    const v7, 0x7f08012e

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v2, :cond_7

    move v7, v9

    :goto_3
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2896
    const v7, 0x7f08012f

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v5, :cond_8

    move v7, v9

    :goto_4
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2899
    const v7, 0x7f080130

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-eqz v4, :cond_9

    :goto_5
    invoke-virtual {v7, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2901
    return-void

    .line 2840
    .end local v0           #layers:Landroid/graphics/drawable/LayerDrawable;
    :cond_0
    iget-boolean v7, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    if-eqz v7, :cond_1

    .line 2841
    const/4 v5, 0x1

    goto :goto_0

    .line 2843
    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 2845
    :cond_2
    iget-boolean v10, p1, Lcom/android/phone/InCallControlState;->speakerEnabled:Z

    if-eqz v10, :cond_4

    .line 2847
    const-string v10, "- updateAudioButton: \'speaker toggle\' mode..."

    invoke-direct {p0, v10}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2850
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v10, v7}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 2854
    iget-object v10, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    iget-boolean v11, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    invoke-virtual {v10, v11}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2857
    const/4 v6, 0x1

    .line 2858
    iget-boolean v5, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    .line 2859
    iget-boolean v10, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    if-nez v10, :cond_3

    move v4, v7

    :goto_6
    goto/16 :goto_0

    :cond_3
    move v4, v8

    goto :goto_6

    .line 2862
    :cond_4
    const-string v7, "- updateAudioButton: disabled..."

    invoke-direct {p0, v7}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2867
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7, v8}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 2868
    iget-object v7, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7, v8}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2871
    const/4 v6, 0x1

    .line 2872
    const/4 v4, 0x1

    goto/16 :goto_0

    .restart local v0       #layers:Landroid/graphics/drawable/LayerDrawable;
    :cond_5
    move v7, v8

    .line 2887
    goto :goto_1

    :cond_6
    move v7, v8

    .line 2890
    goto :goto_2

    :cond_7
    move v7, v8

    .line 2893
    goto :goto_3

    :cond_8
    move v7, v8

    .line 2896
    goto :goto_4

    :cond_9
    move v9, v8

    .line 2899
    goto :goto_5
.end method

.method private updateLocalZoomOrBrightness()V
    .locals 2

    .prologue
    .line 1000
    const-string v0, "updateLocalZoomOrBrightness()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1003
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-eqz v0, :cond_1

    .line 1004
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1005
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1013
    :cond_0
    :goto_0
    return-void

    .line 1006
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-eqz v0, :cond_2

    .line 1007
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1008
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_0

    .line 1009
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v0, :cond_0

    .line 1010
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1011
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_0
.end method

.method private updateVTInCallButtons()V
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 578
    const-string v5, "updateVTInCallButtons()..."

    invoke-direct {p0, v5}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 581
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v5

    iget-boolean v5, v5, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    if-nez v5, :cond_0

    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTIdle()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 583
    :cond_0
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v5, v4}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 584
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v5, v4}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 585
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v5, v4}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 586
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v5, v4}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 595
    :goto_0
    const-string v5, "updateVTInCallButtons() : update mVTMute \'s src !"

    invoke-direct {p0, v5}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 597
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/android/phone/PhoneUtils;->getMute()Z

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 599
    const-string v5, "updateVTInCallButtons() : update mVTSwapVideo \'s src !"

    invoke-direct {p0, v5}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 601
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v6

    iget-boolean v6, v6, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-nez v6, :cond_3

    :goto_1
    invoke-virtual {v5, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 603
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v3}, Lcom/android/phone/InCallScreen;->getUpdatedInCallControlState()Lcom/android/phone/InCallControlState;

    move-result-object v1

    .line 606
    .local v1, inCallControlState:Lcom/android/phone/InCallControlState;
    const-string v3, "updateVTInCallButtons() : update mVTDialpad \'s src !"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 608
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    iget-boolean v4, v1, Lcom/android/phone/InCallControlState;->dialpadEnabled:Z

    invoke-virtual {v3, v4}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 609
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    iget-boolean v4, v1, Lcom/android/phone/InCallControlState;->dialpadVisible:Z

    invoke-virtual {v3, v4}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 612
    const-string v3, "updateVTInCallButtons() : update mVTAudio \'s src !"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 614
    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateAudioButton(Lcom/android/phone/InCallControlState;)V

    .line 616
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    .line 617
    .local v2, state:Lcom/android/internal/telephony/PhoneConstants$State;
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    .line 618
    .local v0, fgCallState:Lcom/android/internal/telephony/Call$State;
    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v2, v3, :cond_4

    sget-object v3, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-eq v0, v3, :cond_1

    sget-object v3, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v3, :cond_4

    .line 623
    :cond_1
    const-string v3, "updateVTInCallButtons() :phone state is OFFHOOK orcall state is ALERTING or ACTIVE,not dismiss !"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 633
    :goto_2
    return-void

    .line 588
    .end local v0           #fgCallState:Lcom/android/internal/telephony/Call$State;
    .end local v1           #inCallControlState:Lcom/android/phone/InCallControlState;
    .end local v2           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_2
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v5, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 589
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTCallActive()Z

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 590
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v5, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 591
    iget-object v5, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v6

    iget-boolean v6, v6, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    invoke-virtual {v5, v6}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    goto :goto_0

    :cond_3
    move v3, v4

    .line 601
    goto :goto_1

    .line 631
    .restart local v0       #fgCallState:Lcom/android/internal/telephony/Call$State;
    .restart local v1       #inCallControlState:Lcom/android/phone/InCallControlState;
    .restart local v2       #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_4
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissAudioModePopup()V

    goto :goto_2
.end method

.method private updateVTLocalPeerDisplay()V
    .locals 3

    .prologue
    .line 3201
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-eqz v0, :cond_0

    .line 3202
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/vt/VTManager;->setDisplay(Landroid/view/SurfaceHolder;Landroid/view/SurfaceHolder;)V

    .line 3206
    :goto_0
    return-void

    .line 3204
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/vt/VTManager;->setDisplay(Landroid/view/SurfaceHolder;Landroid/view/SurfaceHolder;)V

    goto :goto_0
.end method

.method private updateVideoBkgDrawable()V
    .locals 3

    .prologue
    const/high16 v1, -0x100

    .line 2479
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    if-eqz v0, :cond_2

    .line 2480
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 2482
    const-string v0, "updatescreen(): replace the peer video"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2484
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPeerBigger:Z

    if-eqz v0, :cond_0

    .line 2485
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v2}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2501
    :goto_0
    return-void

    .line 2487
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v2}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 2491
    :cond_1
    const-string v0, "mBkgBitmapHandler is null or mBkgBitmapHandler.getBitmap() is null"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 2495
    :cond_2
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPeerBigger:Z

    if-eqz v0, :cond_3

    .line 2496
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundColor(I)V

    goto :goto_0

    .line 2498
    :cond_3
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundColor(I)V

    goto :goto_0
.end method


# virtual methods
.method public dismissVTDialogs()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1791
    const-string v0, "dismissVTDialogs() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1793
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 1794
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1795
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    .line 1797
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 1798
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1799
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    .line 1801
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 1802
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1803
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    .line 1805
    :cond_2
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    .line 1806
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1807
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    .line 1809
    :cond_3
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    if-eqz v0, :cond_4

    .line 1810
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1811
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMTAsker:Landroid/app/AlertDialog;

    .line 1813
    :cond_4
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_6

    .line 1814
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1815
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveBgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1817
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0}, Lcom/android/phone/InCallScreen;->endInCallScreenSession()V

    .line 1819
    :cond_5
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    .line 1821
    :cond_6
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderSelector:Landroid/app/AlertDialog;

    if-eqz v0, :cond_7

    .line 1822
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderSelector:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1823
    iput-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTRecorderSelector:Landroid/app/AlertDialog;

    .line 1825
    :cond_7
    return-void
.end method

.method public getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;
    .locals 2

    .prologue
    .line 888
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getVTScreenMode : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 890
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    return-object v0
.end method

.method public handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "menuItem"

    .prologue
    const/4 v0, 0x1

    .line 2529
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "- handleOnScreenMenuItemClick: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2530
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2531
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  title: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2534
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    if-nez v1, :cond_0

    .line 2536
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleOnScreenMenuItemClick("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), but null mInCallScreen!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2576
    :goto_0
    return v0

    .line 2542
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 2576
    :pswitch_0
    const/4 v0, 0x0

    goto :goto_0

    .line 2544
    :pswitch_1
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTSwitchCameraClick()V

    goto :goto_0

    .line 2547
    :pswitch_2
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTTakePeerPhotoClick()V

    goto :goto_0

    .line 2550
    :pswitch_3
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTHideMeClick()V

    goto :goto_0

    .line 2553
    :pswitch_4
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTSwapVideos()V

    goto :goto_0

    .line 2556
    :pswitch_5
    invoke-direct {p0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVoiceVideoRecordClick(Landroid/view/MenuItem;)V

    goto :goto_0

    .line 2559
    :pswitch_6
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTInCallVideoSetting()V

    goto :goto_0

    .line 2562
    :pswitch_7
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    sget-object v2, Lcom/android/phone/InCallScreen$InCallAudioMode;->SPEAKER:Lcom/android/phone/InCallScreen$InCallAudioMode;

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallScreen;->switchInCallAudio(Lcom/android/phone/InCallScreen$InCallAudioMode;)V

    goto :goto_0

    .line 2568
    :pswitch_8
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    sget-object v2, Lcom/android/phone/InCallScreen$InCallAudioMode;->EARPIECE:Lcom/android/phone/InCallScreen$InCallAudioMode;

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallScreen;->switchInCallAudio(Lcom/android/phone/InCallScreen$InCallAudioMode;)V

    goto :goto_0

    .line 2571
    :pswitch_9
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    sget-object v2, Lcom/android/phone/InCallScreen$InCallAudioMode;->BLUETOOTH:Lcom/android/phone/InCallScreen$InCallAudioMode;

    invoke-virtual {v1, v2}, Lcom/android/phone/InCallScreen;->switchInCallAudio(Lcom/android/phone/InCallScreen$InCallAudioMode;)V

    goto :goto_0

    .line 2542
    nop

    :pswitch_data_0
    .packed-switch 0x7f080134
        :pswitch_7
        :pswitch_8
        :pswitch_8
        :pswitch_9
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public initCommonVTState()V
    .locals 1

    .prologue
    .line 2630
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    if-eqz v0, :cond_0

    .line 2631
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->updateBitmapBySetting()V

    .line 2634
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    if-nez v0, :cond_1

    .line 2635
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVideoBkgDrawable()V

    .line 2638
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2640
    const-string v0, "- Now DM locked, VTManager.getInstance().lockPeerVideo() start"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2642
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->lockPeerVideo()V

    .line 2644
    const-string v0, "- Now DM locked, VTManager.getInstance().lockPeerVideo() end"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2647
    :cond_2
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_3

    .line 2648
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2650
    :cond_3
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissAudioModePopup()V

    .line 2651
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTLocalPeerDisplay()V

    .line 2652
    return-void
.end method

.method public initDialingSuccessVTState()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 2595
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->initDialingSuccessVTState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2612
    :cond_0
    :goto_0
    return-void

    .line 2599
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    if-eqz v0, :cond_2

    .line 2600
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->forceUpdateBitmapBySetting()V

    .line 2602
    :cond_2
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v0

    if-nez v0, :cond_3

    .line 2604
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const/4 v1, 0x0

    invoke-static {v0, v2, v2, v1}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZZ)V

    .line 2609
    :goto_1
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMO:Z

    if-nez v0, :cond_0

    .line 2610
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTHideMeClick2()V

    goto :goto_0

    .line 2607
    :cond_3
    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->setVTDialWithSpeakerOff(Z)V

    goto :goto_1
.end method

.method public initDialingVTState()V
    .locals 2

    .prologue
    .line 2616
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->registerForVTPhoneStates()V

    .line 2617
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTCallBannerController;->clearCallBannerInfo()V

    .line 2618
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    if-eqz v0, :cond_0

    .line 2619
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2621
    const-string v0, "initDialingVTState(): closeDialer"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2623
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->closeDialer(Z)V

    .line 2626
    :cond_0
    return-void
.end method

.method public initVTInCallScreen()V
    .locals 8

    .prologue
    const v7, 0x7f080116

    const/16 v6, 0x8

    const/4 v5, 0x1

    const v4, 0x7f08011b

    const/4 v3, 0x0

    .line 640
    const-string v0, "initVTInCallCanvas()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 643
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Lcom/android/phone/InCallScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPowerManager:Landroid/os/PowerManager;

    .line 644
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPowerManager:Landroid/os/PowerManager;

    const v1, 0x2000000a

    const-string v2, "VTWakeLock"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 647
    const v0, 0x7f08010b

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/mediatek/phone/vt/VTCallBanner;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCallBanner:Lcom/mediatek/phone/vt/VTCallBanner;

    .line 648
    new-instance v0, Lcom/mediatek/phone/vt/VTCallBannerController;

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCallBanner:Lcom/mediatek/phone/vt/VTCallBanner;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-direct {v0, v1, v2}, Lcom/mediatek/phone/vt/VTCallBannerController;-><init>(Lcom/mediatek/phone/vt/VTCallBanner;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    .line 650
    const v0, 0x7f080113

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowWrapper:Landroid/view/View;

    .line 652
    const v0, 0x7f08010e

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    .line 653
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 654
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 656
    const v0, 0x7f080110

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    .line 657
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 658
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 659
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 661
    const v0, 0x7f080111

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    .line 662
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 663
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 664
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 666
    const v0, 0x7f08011c

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    .line 667
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 668
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 669
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 671
    const v0, 0x7f08011d

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    .line 672
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 673
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 674
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 676
    const v0, 0x7f08010f

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    .line 677
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusable(Z)V

    .line 678
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusableInTouchMode(Z)V

    .line 680
    const v0, 0x7f080114

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    .line 681
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusable(Z)V

    .line 682
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusableInTouchMode(Z)V

    .line 684
    invoke-virtual {p0, v7}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    .line 685
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 686
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 688
    const v0, 0x7f080115

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    .line 689
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 690
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 692
    const v0, 0x7f080117

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    .line 693
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 694
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 696
    const v0, 0x7f080118

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    .line 697
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 698
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 700
    const v0, 0x7f080119

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    .line 701
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 702
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setFocusableInTouchMode(Z)V

    .line 704
    invoke-virtual {p0, v4}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    .line 705
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 706
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setFocusableInTouchMode(Z)V

    .line 708
    const v0, 0x7f08011a

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUpWrapper:Landroid/widget/RelativeLayout;

    .line 710
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 711
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 712
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 713
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 714
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 715
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 717
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 719
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 725
    :goto_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, p0}, Landroid/view/SurfaceView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 726
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, p0}, Landroid/view/SurfaceView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 729
    const v0, 0x7f080112

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    .line 730
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setFocusable(Z)V

    .line 731
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setFocusableInTouchMode(Z)V

    .line 732
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    const v1, 0x7f0200b2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 733
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 737
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 738
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 739
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 740
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 742
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 743
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 744
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 745
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 746
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    const v1, 0x7f080118

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 751
    :goto_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 752
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 753
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080118

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 757
    :goto_2
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 758
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v4}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 760
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 761
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    const v1, 0x7f080118

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 762
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 763
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v4}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 765
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setNextFocusLeftId(I)V

    .line 766
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    const v1, 0x7f080119

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setNextFocusRightId(I)V

    .line 767
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v7}, Landroid/widget/ImageButton;->setNextFocusUpId(I)V

    .line 768
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusDownId(I)V

    .line 770
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusLeftId(I)V

    .line 771
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusRightId(I)V

    .line 772
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setNextFocusUpId(I)V

    .line 773
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusDownId(I)V

    .line 776
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    .line 777
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    .line 779
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 780
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 782
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 783
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 785
    new-instance v0, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    .line 787
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->amendLayoutForDifferentScreen()V

    .line 789
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/ExtensionManager;->getVTInCallScreenExtension()Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    .line 790
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0, p0, p0, v1}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->initVTInCallScreen(Landroid/view/ViewGroup;Landroid/view/View$OnTouchListener;Landroid/app/Activity;)Z

    .line 791
    return-void

    .line 721
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 722
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto/16 :goto_0

    .line 748
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTMute:Landroid/widget/CompoundButton;

    const v1, 0x7f080119

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    goto/16 :goto_1

    .line 755
    :cond_2
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080119

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    goto/16 :goto_2
.end method

.method public internalAnswerVTCallPre()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x1

    .line 1018
    const-string v3, "internalAnswerVTCallPre()..."

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1021
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v3}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->internalAnswerVTCallPre()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1144
    :goto_0
    return-void

    .line 1025
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1026
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->closeVTManager()V

    .line 1028
    const-string v3, "internalAnswerVTCallPre: set VTInCallScreenFlags.getInstance().mVTShouldCloseVTManager = false"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1031
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iput-boolean v4, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTShouldCloseVTManager:Z

    .line 1032
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->resetPartial()V

    .line 1035
    :cond_1
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 1036
    .local v1, ringingCall:Lcom/android/internal/telephony/Call;
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1037
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->getInstance()Lcom/mediatek/phone/DualTalkUtils;

    move-result-object v0

    .line 1038
    .local v0, dt:Lcom/mediatek/phone/DualTalkUtils;
    invoke-virtual {v0}, Lcom/mediatek/phone/DualTalkUtils;->hasMultipleRingingCall()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1039
    invoke-virtual {v0}, Lcom/mediatek/phone/DualTalkUtils;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    .line 1042
    .end local v0           #dt:Lcom/mediatek/phone/DualTalkUtils;
    :cond_2
    invoke-static {v7, v1}, Lcom/android/phone/PhoneUtils;->hangupAllCalls(ZLcom/android/internal/telephony/Call;)V

    .line 1044
    const-string v3, "hangup all calls except current ring call"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1048
    const-string v3, "VTIncallscreen, before incomingVTCall"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1050
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/mediatek/vt/VTManager;->incomingVTCall(I)V

    .line 1052
    const-string v3, "VTIncallscreen, after incomingVTCall"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1055
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v3}, Lcom/android/phone/InCallScreen;->isBluetoothAvailable()Z

    move-result v3

    if-nez v3, :cond_8

    .line 1057
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v3, v7, v7, v4}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZZ)V

    .line 1063
    :goto_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->reset()V

    .line 1064
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iput-boolean v7, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTIsMT:Z

    .line 1066
    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->getSimInfoByCall(Lcom/android/internal/telephony/Call;)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    .line 1067
    .local v2, simInfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v2, :cond_9

    .line 1068
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iget v4, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iput v4, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSlotId:I

    .line 1075
    iget v3, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTFile(I)V

    .line 1076
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v3

    iget v4, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v3, v4}, Lcom/mediatek/settings/VTSettingUtils;->updateVTSettingState(I)V

    .line 1077
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v4

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils;->mPeerBigger:Z

    iput-boolean v4, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    .line 1079
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    if-eqz v3, :cond_3

    .line 1080
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->forceUpdateBitmapBySetting()V

    .line 1081
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iget-boolean v3, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    if-nez v3, :cond_3

    .line 1083
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVideoBkgDrawable()V

    .line 1086
    :cond_3
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    invoke-virtual {v3}, Lcom/mediatek/phone/vt/VTCallBannerController;->clearCallBannerInfo()V

    .line 1088
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTLocalPeerDisplay()V

    .line 1090
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTInControlRes()Z

    move-result v3

    if-nez v3, :cond_4

    .line 1091
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.phone.extra.VT_CALL_START"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/android/phone/InCallScreen;->sendBroadcast(Landroid/content/Intent;)V

    .line 1092
    invoke-direct {p0, v7}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVTInControlRes(Z)V

    .line 1095
    :cond_4
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v3, :cond_5

    .line 1096
    iget-object v3, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v3}, Landroid/widget/PopupMenu;->dismiss()V

    .line 1098
    :cond_5
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissAudioModePopup()V

    .line 1103
    sget-object v3, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_WAITING:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->setVTScreenMode(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1106
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1108
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->registerForVTPhoneStates()V

    .line 1111
    const-string v3, "- set VTManager open ! "

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1113
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/PhoneGlobals;->getCallManager()Ljava/lang/Object;

    move-result-object v5

    iget v6, v2, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v3, v4, v5, v6}, Lcom/mediatek/vt/VTManager;->setVTOpen(Landroid/content/Context;Ljava/lang/Object;I)V

    .line 1116
    const-string v3, "- finish set VTManager open ! "

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1119
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v3

    iget-object v3, v3, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 1120
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTHideMeClick2()V

    .line 1122
    :cond_6
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1124
    const-string v3, "- Now DM locked, VTManager.getInstance().lockPeerVideo() start"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1126
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->lockPeerVideo()V

    .line 1128
    const-string v3, "- Now DM locked, VTManager.getInstance().lockPeerVideo() end"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1132
    :cond_7
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iget-boolean v3, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedH:Z

    if-eqz v3, :cond_a

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iget-boolean v3, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedL:Z

    if-eqz v3, :cond_a

    .line 1135
    const-string v3, "- set VTManager ready ! "

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1137
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->setVTReady()V

    .line 1139
    const-string v3, "- finish set VTManager ready ! "

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1060
    .end local v2           #simInfo:Landroid/provider/Telephony$SIMInfo;
    :cond_8
    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->setVTDialWithSpeakerOff(Z)V

    goto/16 :goto_1

    .line 1070
    .restart local v2       #simInfo:Landroid/provider/Telephony$SIMInfo;
    :cond_9
    const-string v3, "internalAnswerVTCallPre(), accept a incoming call, but can not get ring call sim info, sim info is null,  need to check !!!!!"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1142
    :cond_a
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v3

    iput-boolean v7, v3, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSettingReady:Z

    goto/16 :goto_0
.end method

.method public notifyLocaleChange()V
    .locals 2

    .prologue
    .line 3214
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/vt/VTCallBannerController;->setNeedClearUserData(Z)V

    .line 3215
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "view"

    .prologue
    const/4 v4, 0x0

    .line 1938
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 1940
    .local v0, id:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClick(View "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1943
    packed-switch v0, :pswitch_data_0

    .line 2097
    :pswitch_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClick: unexpected click from ID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (View = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2101
    :cond_0
    :goto_0
    return-void

    .line 1947
    :pswitch_1
    const-string v2, "onClick: VTHighVideo..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1949
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-nez v2, :cond_0

    .line 1950
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    .line 1951
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 1952
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 1953
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 1959
    :pswitch_2
    const-string v2, "onClick: VTLowVideo..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1961
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    if-eqz v2, :cond_0

    .line 1962
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    .line 1963
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 1964
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 1965
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 1971
    :pswitch_3
    const-string v2, "onClick: VTMute"

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1973
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v2}, Lcom/android/phone/InCallScreen;->onMuteClick()V

    goto :goto_0

    .line 1978
    :pswitch_4
    const-string v2, "onClick: VTSpeaker..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1980
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->handleAudioButtonClick()V

    goto :goto_0

    .line 1985
    :pswitch_5
    const-string v2, "onClick: VTDialpad..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1987
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v2}, Lcom/android/phone/InCallScreen;->onOpenCloseDialpad()V

    goto :goto_0

    .line 1992
    :pswitch_6
    const-string v2, "onClick: VTSwapVideo..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1994
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->onVTSwapVideos()V

    goto :goto_0

    .line 1999
    :pswitch_7
    const-string v2, "onClick: VTHangUp..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2001
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInEndingCall:Z

    .line 2002
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 2003
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->hangup(Lcom/android/internal/telephony/CallManager;)Z

    goto/16 :goto_0

    .line 2008
    :pswitch_8
    const-string v2, "onClick: VTLowUp..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2010
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_1

    .line 2011
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incZoom()Z

    .line 2012
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2013
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2014
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_2

    .line 2015
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incBrightness()Z

    .line 2016
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2017
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2018
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2019
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incContrast()Z

    .line 2020
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2021
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2027
    :pswitch_9
    const-string v2, "onClick: VTHighUp..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2029
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_3

    .line 2030
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incZoom()Z

    .line 2031
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2032
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2033
    :cond_3
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_4

    .line 2034
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incBrightness()Z

    .line 2035
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2036
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2037
    :cond_4
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2038
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incContrast()Z

    .line 2039
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2040
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2046
    :pswitch_a
    const-string v2, "onClick: VTLowDown..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2048
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_5

    .line 2049
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decZoom()Z

    .line 2050
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2051
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2052
    :cond_5
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_6

    .line 2053
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decBrightness()Z

    .line 2054
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2055
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2056
    :cond_6
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2057
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decContrast()Z

    .line 2058
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2059
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2065
    :pswitch_b
    const-string v2, "onClick: VTHighDown..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2067
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_7

    .line 2068
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decZoom()Z

    .line 2069
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2070
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2071
    :cond_7
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_8

    .line 2072
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decBrightness()Z

    .line 2073
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2074
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2075
    :cond_8
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2076
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decContrast()Z

    .line 2077
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2078
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2084
    :pswitch_c
    const-string v2, "onClick: VTOverflowMenu..."

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2086
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v2, :cond_9

    .line 2087
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2089
    :cond_9
    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-direct {p0, v2}, Lcom/mediatek/phone/vt/VTInCallScreen;->constructPopupMenu(Landroid/view/View;)Landroid/widget/PopupMenu;

    move-result-object v1

    .line 2090
    .local v1, popup:Landroid/widget/PopupMenu;
    if-eqz v1, :cond_0

    .line 2091
    invoke-virtual {v1}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_0

    .line 1943
    :pswitch_data_0
    .packed-switch 0x7f08010f
        :pswitch_1
        :pswitch_9
        :pswitch_b
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_c
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_a
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->unregisterForVTPhoneStates()V

    .line 235
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_1

    .line 241
    :cond_0
    :goto_0
    return-void

    .line 238
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_0
.end method

.method public onDisconnectVT(Lcom/android/internal/telephony/Connection;IZ)Z
    .locals 10
    .parameter "connection"
    .parameter "slotId"
    .parameter "isForeground"

    .prologue
    const v9, 0x7f0d0017

    const/4 v8, -0x1

    const v7, 0x7f0d0050

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 2113
    if-nez p1, :cond_1

    .line 2242
    :cond_0
    :goto_0
    return v3

    .line 2116
    :cond_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v0

    .line 2118
    .local v0, cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onDisconnectVT(), cause = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " isForeground = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " slotId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2121
    if-eqz p3, :cond_12

    .line 2123
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->UNOBTAINABLE_NUMBER:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-eq v0, v5, :cond_2

    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->INVALID_NUMBER_FORMAT:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-eq v0, v5, :cond_2

    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->INVALID_NUMBER:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_3

    .line 2126
    :cond_2
    const v5, 0x7f0d018f

    invoke-direct {p0, v5, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2127
    goto :goto_0

    .line 2128
    :cond_3
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->CM_MM_RR_CONNECTION_RELEASE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_4

    .line 2129
    const v5, 0x7f0d004f

    invoke-direct {p0, v5, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2130
    goto :goto_0

    .line 2134
    :cond_4
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->NO_ROUTE_TO_DESTINATION:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_5

    .line 2135
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2136
    goto :goto_0

    .line 2137
    :cond_5
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->BUSY:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_6

    .line 2138
    const v5, 0x7f0d0051

    invoke-direct {p0, v5, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2139
    goto :goto_0

    .line 2140
    :cond_6
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->NO_USER_RESPONDING:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_7

    .line 2141
    const v5, 0x7f0d0052

    invoke-direct {p0, v5, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2142
    goto :goto_0

    .line 2143
    :cond_7
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->USER_ALERTING_NO_ANSWER:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_8

    .line 2144
    const v5, 0x7f0d0052

    invoke-direct {p0, v5, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2145
    goto/16 :goto_0

    .line 2146
    :cond_8
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->CALL_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_9

    .line 2147
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2148
    goto/16 :goto_0

    .line 2149
    :cond_9
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->FACILITY_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_a

    .line 2150
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2151
    goto/16 :goto_0

    .line 2154
    :cond_a
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL_UNSPECIFIED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_b

    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v5

    if-nez v5, :cond_b

    .line 2156
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2157
    goto/16 :goto_0

    .line 2158
    :cond_b
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->CONGESTION:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_c

    .line 2159
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2160
    goto/16 :goto_0

    .line 2161
    :cond_c
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->SWITCHING_CONGESTION:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_d

    .line 2162
    const v5, 0x7f0d0053

    invoke-direct {p0, v5, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2163
    goto/16 :goto_0

    .line 2164
    :cond_d
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->SERVICE_NOT_AVAILABLE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_e

    .line 2165
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2166
    goto/16 :goto_0

    .line 2167
    :cond_e
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->BEARER_NOT_IMPLEMENT:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_f

    .line 2168
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2169
    goto/16 :goto_0

    .line 2170
    :cond_f
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->FACILITY_NOT_IMPLEMENT:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_10

    .line 2171
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2172
    goto/16 :goto_0

    .line 2173
    :cond_10
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->RESTRICTED_BEARER_AVAILABLE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_11

    .line 2174
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2175
    goto/16 :goto_0

    .line 2176
    :cond_11
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->OPTION_NOT_AVAILABLE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_12

    .line 2177
    invoke-direct {p0, v7, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showGenericErrorDialog(IZ)V

    move v3, v4

    .line 2178
    goto/16 :goto_0

    .line 2182
    :cond_12
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v5

    iget-boolean v5, v5, Lcom/mediatek/settings/VTSettingUtils;->mAutoDropBack:Z

    if-nez v5, :cond_13

    if-eqz p3, :cond_0

    :cond_13
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->isIncoming()Z

    move-result v5

    if-nez v5, :cond_0

    .line 2183
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    .line 2185
    .local v2, number:Ljava/lang/String;
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMPATIBLE_DESTINATION:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_14

    .line 2187
    const-string v3, "VT call dropback INCOMPATIBLE_DESTINATION"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2189
    const v3, 0x7f0d0015

    invoke-virtual {p0, v3, v2, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    move v3, v4

    .line 2190
    goto/16 :goto_0

    .line 2191
    :cond_14
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->RESOURCE_UNAVAILABLE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_15

    .line 2193
    const-string v3, "VT call dropback RESOURCE_UNAVAILABLE"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2195
    const v3, 0x7f0d0016

    invoke-virtual {p0, v3, v2, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    move v3, v4

    .line 2196
    goto/16 :goto_0

    .line 2197
    :cond_15
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->BEARER_NOT_AUTHORIZED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_16

    .line 2199
    const-string v3, "VT call dropback BEARER_NOT_AUTHORIZED"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2201
    const v3, 0x7f0d0019

    invoke-virtual {p0, v3, v2, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    move v3, v4

    .line 2202
    goto/16 :goto_0

    .line 2203
    :cond_16
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->BEARER_NOT_AVAIL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_17

    .line 2205
    const-string v3, "VT call dropback BEARER_NOT_AVAIL"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2207
    invoke-virtual {p0, v9, v2, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    move v3, v4

    .line 2208
    goto/16 :goto_0

    .line 2209
    :cond_17
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-eq v0, v5, :cond_18

    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_1c

    .line 2212
    :cond_18
    const-string v5, "VT call dropback NORMAL or ERROR_UNSPECIFIED"

    invoke-direct {p0, v5}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2215
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 2216
    invoke-static {p2}, Lcom/mediatek/phone/gemini/GeminiUtils;->isValidSlot(I)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 2217
    sget-object v5, Lcom/mediatek/phone/GeminiConstants;->PROPERTY_CS_NETWORK_TYPES:[Ljava/lang/String;

    aget-object v5, v5, p2

    invoke-static {v5, v8}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 2228
    .local v1, nCSNetType:I
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "VT call dropback nCSNetType = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2230
    if-eq v4, v1, :cond_19

    const/4 v5, 0x2

    if-ne v5, v1, :cond_0

    .line 2231
    :cond_19
    const v3, 0x7f0d0018

    invoke-virtual {p0, v3, v2, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    move v3, v4

    .line 2232
    goto/16 :goto_0

    .line 2220
    .end local v1           #nCSNetType:I
    :cond_1a
    const/4 v1, 0x1

    .restart local v1       #nCSNetType:I
    goto :goto_1

    .line 2223
    .end local v1           #nCSNetType:I
    :cond_1b
    const-string v5, "gsm.cs.network.type"

    invoke-static {v5, v8}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .restart local v1       #nCSNetType:I
    goto :goto_1

    .line 2234
    .end local v1           #nCSNetType:I
    :cond_1c
    sget-object v5, Lcom/android/internal/telephony/Connection$DisconnectCause;->NO_CIRCUIT_AVAIL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v0, v5, :cond_0

    .line 2236
    const-string v3, "VT call dropback NO_CIRCUIT_AVAIL"

    invoke-direct {p0, v3}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2238
    invoke-virtual {p0, v9, v2, p2}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialog(ILjava/lang/String;I)V

    move v3, v4

    .line 2239
    goto/16 :goto_0
.end method

.method public onDismiss(Landroid/widget/PopupMenu;)V
    .locals 2
    .parameter "menu"

    .prologue
    .line 2738
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- onDismiss: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2740
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopupVisible:Z

    .line 2741
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 3220
    const-string v0, "onKeyDown"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 3222
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3223
    const/4 v0, 0x1

    .line 3225
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "arg0"

    .prologue
    .line 2523
    invoke-virtual {p0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 2581
    invoke-virtual {p0, p1}, Lcom/mediatek/phone/vt/VTInCallScreen;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 2586
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    if-ne v0, v1, :cond_0

    .line 2587
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    .line 2589
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onReceiveVTManagerStartCounter()V
    .locals 5

    .prologue
    .line 3072
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, v2}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onReceiveVTManagerStartCounter(Lcom/android/internal/telephony/CallManager;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3095
    :cond_0
    :goto_0
    return-void

    .line 3075
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    iget-object v1, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTConnectionStarttime:Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;

    iget-wide v1, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;->mStarttime:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gez v1, :cond_0

    .line 3076
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 3077
    .local v0, call:Lcom/android/internal/telephony/Call;
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 3078
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 3080
    :cond_2
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v1, v0}, Lcom/android/phone/InCallScreen;->triggerTimerStartCount(Lcom/android/internal/telephony/Call;)V

    .line 3082
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3083
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3084
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    iget-object v1, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTConnectionStarttime:Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;->mStarttime:J

    .line 3086
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    iget-object v1, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTConnectionStarttime:Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    iput-object v2, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags$VTConnectionStarttime;->mConnection:Lcom/android/internal/telephony/Connection;

    .line 3088
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v1}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    .line 3089
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    if-eqz v1, :cond_0

    .line 3090
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    iget-object v2, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/phone/vt/VTCallBannerController;->updateState(Lcom/android/internal/telephony/Call;)V

    goto :goto_0
.end method

.method public onStop()V
    .locals 3

    .prologue
    .line 2247
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    .line 2249
    .local v0, state:Lcom/android/internal/telephony/PhoneConstants$State;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onStop: state = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2252
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_0

    .line 2259
    :cond_0
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v1, :cond_1

    .line 2260
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2262
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissAudioModePopup()V

    .line 2263
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 795
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    if-eqz v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 813
    :goto_0
    return v2

    .line 800
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 803
    :pswitch_0
    const-string v0, "MotionEvent.ACTION_DOWN"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 805
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    .line 806
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 807
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 808
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 800
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public refreshAudioModePopup()V
    .locals 1

    .prologue
    .line 2754
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopupVisible:Z

    if-eqz v0, :cond_0

    .line 2756
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2758
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showAudioModePopup()V

    .line 2760
    :cond_0
    return-void
.end method

.method registerForVTPhoneStates()V
    .locals 0

    .prologue
    .line 2379
    return-void
.end method

.method public resetVTFlags()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1316
    const-string v0, "resetVTFlags()..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1319
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->reset()V

    .line 1320
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissVTDialogs()V

    .line 1322
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 1323
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1324
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1328
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 1329
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1330
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1334
    :cond_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    if-eqz v0, :cond_2

    .line 1335
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mBkgBitmapHandler:Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;

    invoke-virtual {v0}, Lcom/mediatek/phone/vt/VTBackgroundBitmapHandler;->recycle()V

    .line 1337
    :cond_2
    return-void
.end method

.method setDialer(Lcom/android/phone/DTMFTwelveKeyDialer;)V
    .locals 0
    .parameter "dialer"

    .prologue
    .line 2366
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    .line 2367
    return-void
.end method

.method setInCallScreenInstance(Lcom/android/phone/InCallScreen;)V
    .locals 0
    .parameter "inCallScreen"

    .prologue
    .line 2362
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    .line 2363
    return-void
.end method

.method public setVTScreenMode(Lcom/android/phone/Constants$VTScreenMode;)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 858
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setVTScreenMode : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 861
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    if-eq v0, p1, :cond_0

    .line 863
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->openVTInCallCanvas()V

    .line 865
    const-string v0, "setVTScreenMode : mVTWakeLock.acquire() "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 867
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_0

    .line 868
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 872
    :cond_0
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    if-eq v0, v1, :cond_1

    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    if-ne v0, p1, :cond_1

    .line 874
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->closeVTInCallCanvas()V

    .line 876
    const-string v0, "setVTScreenMode : mVTWakeLock.release() "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 878
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 879
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 882
    :cond_1
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 883
    return-void
.end method

.method public setVTVisible(Z)V
    .locals 2
    .parameter "bIsVisible"

    .prologue
    .line 1914
    if-eqz p1, :cond_1

    .line 1915
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedH:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedL:Z

    if-eqz v0, :cond_0

    .line 1918
    const-string v0, "VTManager.getInstance().setVTVisible(true) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1920
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1922
    const-string v0, "VTManager.getInstance().setVTVisible(true) end ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1934
    :cond_0
    :goto_0
    return-void

    .line 1927
    :cond_1
    const-string v0, "VTManager.getInstance().setVTVisible(false) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1929
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1931
    const-string v0, "VTManager.getInstance().setVTVisible(false) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setupMenuItems(Landroid/view/Menu;)V
    .locals 12
    .parameter "menu"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 2426
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 2476
    :goto_0
    return-void

    .line 2430
    :cond_0
    const v8, 0x7f08013c

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 2431
    .local v4, switchCameraMenu:Landroid/view/MenuItem;
    const v8, 0x7f08013d

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    .line 2432
    .local v5, takePeerPhotoMenu:Landroid/view/MenuItem;
    const v8, 0x7f08013f

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 2433
    .local v2, hideLocalVideoMenu:Landroid/view/MenuItem;
    const v8, 0x7f08013e

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 2434
    .local v3, swapVideosMenu:Landroid/view/MenuItem;
    const v8, 0x7f080140

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    .line 2436
    .local v7, voiceRecordMenu:Landroid/view/MenuItem;
    const v8, 0x7f080141

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 2438
    .local v6, videoSettingMenu:Landroid/view/MenuItem;
    invoke-interface {v4, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2439
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/mediatek/vt/VTManager;->getCameraSensorCount()I

    move-result v1

    .line 2441
    .local v1, cameraSensorCount:I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "setupMenuItems() : VTManager.getInstance().getCameraSensorCount() == "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2444
    const/4 v8, 0x2

    if-ne v8, v1, :cond_2

    move v8, v9

    :goto_1
    invoke-interface {v4, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2445
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/settings/VTSettingUtils;->mEnableBackCamera:Z

    if-eqz v8, :cond_3

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    if-nez v8, :cond_3

    move v0, v9

    .line 2448
    .local v0, bIsSwitchCameraEnable:Z
    :goto_2
    invoke-interface {v4, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2450
    invoke-interface {v5, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2451
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->isDialerOpened()Z

    move-result v8

    if-nez v8, :cond_4

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoConnected:Z

    if-eqz v8, :cond_4

    move v8, v9

    :goto_3
    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2454
    invoke-interface {v2, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2455
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    if-nez v8, :cond_5

    .line 2456
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0d0042

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 2461
    :goto_4
    iget-object v8, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-static {v8}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v8

    if-nez v8, :cond_6

    move v8, v9

    :goto_5
    invoke-interface {v3, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2462
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHasReceiveFirstFrame:Z

    invoke-interface {v3, v8}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2464
    invoke-interface {v7, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2465
    invoke-interface {v7, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2466
    const v8, 0x7f0d006f

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 2467
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->okToRecordVoice()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2468
    invoke-interface {v7, v9}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2469
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v8

    invoke-virtual {v8}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->isVTRecording()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2470
    const v8, 0x7f0d0070

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 2474
    :cond_1
    invoke-interface {v6, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2475
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTVideoConnected:Z

    invoke-interface {v6, v8}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto/16 :goto_0

    .end local v0           #bIsSwitchCameraEnable:Z
    :cond_2
    move v8, v10

    .line 2444
    goto/16 :goto_1

    :cond_3
    move v0, v10

    .line 2445
    goto/16 :goto_2

    .restart local v0       #bIsSwitchCameraEnable:Z
    :cond_4
    move v8, v10

    .line 2451
    goto :goto_3

    .line 2458
    :cond_5
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0d0043

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_4

    :cond_6
    move v8, v10

    .line 2461
    goto :goto_5
.end method

.method public showReCallDialog(ILjava/lang/String;I)V
    .locals 3
    .parameter "resid"
    .parameter "number"
    .parameter "slot"

    .prologue
    .line 2283
    const-string v0, "showReCallDialog... "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2286
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mAutoDropBack:Z

    if-eqz v0, :cond_0

    .line 2287
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d004b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->showToast(Ljava/lang/String;)V

    .line 2288
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/android/phone/PhoneUtils;->turnOnSpeaker(Landroid/content/Context;ZZ)V

    .line 2289
    invoke-direct {p0, p2, p3}, Lcom/mediatek/phone/vt/VTInCallScreen;->makeVoiceReCall(Ljava/lang/String;I)V

    .line 2293
    :goto_0
    return-void

    .line 2291
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/phone/vt/VTInCallScreen;->showReCallDialogEx(ILjava/lang/String;I)V

    goto :goto_0
.end method

.method public stopRecord()V
    .locals 2

    .prologue
    .line 2914
    const-string v0, "stopRecord"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2916
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorder;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2918
    const-string v0, "stopVoiceRecord"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2920
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVoiceRecord()V

    .line 2928
    :cond_0
    :goto_0
    return-void

    .line 2921
    :cond_1
    const/4 v0, 0x1

    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getPhoneRecorderState()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 2924
    const-string v0, "stopVideoRecord"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 2926
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->stopVideoRecord()V

    goto :goto_0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .parameter "holder"
    .parameter "format"
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v2, 0x1

    .line 1343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceChanged : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1346
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_0

    .line 1348
    const-string v0, "surfaceChanged : HighVideo , set mVTSurfaceChangedH = true"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1350
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedH:Z

    .line 1353
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_1

    .line 1355
    const-string v0, "surfaceChanged : LowVideo , set mVTSurfaceChangedL = true"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1357
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedL:Z

    .line 1360
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedH:Z

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedL:Z

    if-eqz v0, :cond_4

    .line 1362
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTLocalPeerDisplay()V

    .line 1365
    const-string v0, "surfaceChanged : VTManager.getInstance().setVTVisible(true) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1367
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1369
    const-string v0, "surfaceChanged : VTManager.getInstance().setVTVisible(true) end ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1371
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1372
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1375
    :cond_2
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSettingReady:Z

    if-eqz v0, :cond_3

    .line 1377
    const-string v0, "- set VTManager ready ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1379
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->setVTReady()V

    .line 1381
    const-string v0, "- finish set VTManager ready ! "

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1383
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSettingReady:Z

    .line 1385
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1387
    :cond_4
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 1392
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceCreated : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1394
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .parameter "holder"

    .prologue
    const/4 v2, 0x0

    .line 1399
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceDestroyed : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1402
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_0

    .line 1404
    const-string v0, "surfaceDestroyed : HighVideo, set mVTSurfaceChangedH = false"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1407
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedH:Z

    .line 1410
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_1

    .line 1412
    const-string v0, "surfaceDestroyed : LowVideo, set mVTSurfaceChangedL = false"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1415
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedL:Z

    .line 1418
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedH:Z

    if-nez v0, :cond_2

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedL:Z

    if-nez v0, :cond_2

    .line 1421
    const-string v0, "surfaceDestroyed : VTManager.getInstance().setVTVisible(false) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1424
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1426
    const-string v0, "surfaceDestroyed : VTManager.getInstance().setVTVisible(false) end ..."

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 1429
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1430
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1433
    :cond_2
    return-void
.end method

.method unregisterForVTPhoneStates()V
    .locals 0

    .prologue
    .line 2405
    return-void
.end method

.method public updateElapsedTime(J)V
    .locals 4
    .parameter "elapsedTime"

    .prologue
    .line 2409
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 2410
    .local v0, call:Lcom/android/internal/telephony/Call;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_NONE:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTTimingMode(Ljava/lang/String;)Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 2414
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    const-wide/16 v2, -0x1

    invoke-virtual {v1, v2, v3}, Lcom/mediatek/phone/vt/VTCallBannerController;->updateElapsedTimeWidget(J)V

    .line 2418
    :goto_0
    return-void

    .line 2416
    :cond_0
    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    invoke-virtual {v1, p1, p2}, Lcom/mediatek/phone/vt/VTCallBannerController;->updateElapsedTimeWidget(J)V

    goto :goto_0
.end method

.method public updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V
    .locals 4
    .parameter "mode"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 515
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateVTScreen : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 518
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    if-ne p1, v0, :cond_0

    .line 574
    :goto_0
    return-void

    .line 522
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/Call$State;->INCOMING:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v0

    if-nez v0, :cond_4

    .line 524
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/vt/VTCallBannerController;->updateState(Lcom/android/internal/telephony/Call;)V

    .line 531
    :goto_1
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0}, Lcom/android/phone/InCallScreen;->updateCallTime()V

    .line 533
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setClickable(Z)V

    .line 534
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 537
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateVTScreen : VTInCallScreenFlags.getInstance().mVTHideMeNow - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v1

    iget-boolean v1, v1, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 539
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateVTScreen : VTSettingUtils.getInstance().mEnableBackCamera - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v1

    iget-boolean v1, v1, Lcom/mediatek/settings/VTSettingUtils;->mEnableBackCamera:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    .line 543
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 544
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 545
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 546
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    .line 547
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    .line 548
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->dismissVideoSettingDialogs()V

    .line 549
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 550
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mInCallScreen:Lcom/android/phone/InCallScreen;

    invoke-virtual {v0}, Lcom/android/phone/InCallScreen;->closeOptionsMenu()V

    .line 554
    :cond_1
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTHideMeNow:Z

    if-eqz v0, :cond_2

    .line 555
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalZoomSetting:Z

    .line 556
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalBrightnessSetting:Z

    .line 557
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInLocalContrastSetting:Z

    .line 558
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    .line 561
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->updateVTInCallButtons()V

    .line 563
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 564
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 565
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 566
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 567
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 568
    invoke-direct {p0}, Lcom/mediatek/phone/vt/VTInCallScreen;->hideLocalZoomOrBrightness()V

    .line 572
    :cond_3
    const-string v0, "updateVTScreen end"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/vt/VTInCallScreen;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 525
    :cond_4
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    if-eq v0, v1, :cond_5

    .line 526
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    iget-object v1, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/vt/VTCallBannerController;->updateState(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1

    .line 528
    :cond_5
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen;->mVTCallBannerController:Lcom/mediatek/phone/vt/VTCallBannerController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/vt/VTCallBannerController;->updateState(Lcom/android/internal/telephony/Call;)V

    goto/16 :goto_1
.end method

.method public updateVideoCallRecordState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 1900
    return-void
.end method
