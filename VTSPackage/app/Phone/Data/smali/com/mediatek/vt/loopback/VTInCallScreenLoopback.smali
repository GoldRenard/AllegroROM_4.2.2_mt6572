.class public Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;
.super Landroid/widget/RelativeLayout;
.source "VTInCallScreenLoopback.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Landroid/widget/PopupMenu$OnDismissListener;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$InCallVideoSettingLocalEffectListener;,
        Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final DELAYED_CLEANUP_AFTER_DISCONNECT:I = 0x92

.field private static final DELAYED_CLEANUP_AFTER_DISCONNECT2:I = 0x93

.field private static final HIDDEN:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "VTInCallScreenLoopback"

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
.field private mActivity:Landroid/app/Activity;

.field private mAudioModePopup:Landroid/widget/PopupMenu;

.field private mAudioModePopupVisible:Z

.field private mCM:Lcom/android/internal/telephony/CallManager;

.field private mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

.field private mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

.field private mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

.field private mHandler:Landroid/os/Handler;

.field private mHighVideoHolder:Landroid/view/SurfaceHolder;

.field private mInCallVideoSettingDialog:Landroid/app/AlertDialog;

.field private mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

.field private mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

.field private mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

.field private mLocaleChanged:Z

.field private mLowVideoHolder:Landroid/view/SurfaceHolder;

.field private mVTAudio:Landroid/widget/CompoundButton;

.field private mVTDialpad:Landroid/widget/CompoundButton;

.field private mVTHangUp:Landroid/widget/ImageButton;

.field private mVTHangUpWrapper:Landroid/widget/LinearLayout;

.field private mVTHighDown:Landroid/widget/ImageButton;

.field private mVTHighUp:Landroid/widget/ImageButton;

.field private mVTHighVideo:Landroid/view/SurfaceView;

.field private mVTInCallCanvas:Landroid/view/ViewGroup;

.field private mVTLowDown:Landroid/widget/ImageButton;

.field private mVTLowUp:Landroid/widget/ImageButton;

.field private mVTLowVideo:Landroid/view/SurfaceView;

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
    .line 201
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 159
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 257
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHandler:Landroid/os/Handler;

    .line 204
    const-string v0, "VTInCallScreen constructor..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 205
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- this = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 208
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 209
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 210
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 218
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 159
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 257
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHandler:Landroid/os/Handler;

    .line 220
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 221
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 222
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 231
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 159
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 257
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$1;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHandler:Landroid/os/Handler;

    .line 233
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 234
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 235
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    invoke-direct {p0, p1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setVTSettingToVTManager()V

    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalZoom()V

    return-void
.end method

.method static synthetic access$1100(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalBrightness()V

    return-void
.end method

.method static synthetic access$1200(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalContrast()V

    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSettingLocalEffect()V

    return-void
.end method

.method static synthetic access$1400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSettingLocalNightMode()V

    return-void
.end method

.method static synthetic access$1500(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSettingPeerQuality()V

    return-void
.end method

.method static synthetic access$1600(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateLocalZoomOrBrightness()V

    return-void
.end method

.method static synthetic access$1800(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1802(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1902(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onReceiveVTManagerReady()V

    return-void
.end method

.method static synthetic access$2000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 115
    invoke-direct {p0, p1, p2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->makeVoiceReCall(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$2200(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2202(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    invoke-direct {p0, p1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->startRecord(I)V

    return-void
.end method

.method static synthetic access$2400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$2402(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTHideMeClick()V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    invoke-direct {p0, p1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Lcom/android/internal/telephony/CallManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTReceiveFirstFrame()V

    return-void
.end method

.method static synthetic access$600(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$902(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 115
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method private closeVTInCallCanvas()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 836
    const-string v0, "closeVTInCallCanvas!"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 838
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    .line 839
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 841
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissAudioModePopup()V

    .line 842
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    .line 843
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 844
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 847
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_2

    .line 848
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 850
    :cond_2
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_3

    .line 851
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 853
    :cond_3
    return-void
.end method

.method private closeVTManager()V
    .locals 3

    .prologue
    .line 1852
    const-string v0, "closeVTManager()!"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1854
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissVTDialogs()V

    .line 1855
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1859
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHandler:Landroid/os/Handler;

    const v1, 0x8001

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1861
    const-string v0, "VT_VOICE_RECORDING"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VT_VIDEO_RECORDING"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1863
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->isVTRecording()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1864
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->stopRecord()V

    .line 1869
    :cond_1
    const-string v0, "- call VTManager onDisconnected ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1871
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->onDisconnected()V

    .line 1873
    const-string v0, "- finish call VTManager onDisconnected ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1877
    const-string v0, "- set VTManager close ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1879
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->setVTClose()V

    .line 1881
    const-string v0, "- finish set VTManager close ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1884
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTInControlRes()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1885
    const-string v0, "VTInCallScreenLoopback:closeVTManager:sendIntent_CALL_END"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1887
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.phone.extra.VT_CALL_END"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1888
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setVTInControlRes(Z)V

    .line 1890
    :cond_2
    return-void
.end method

.method private constructPopupMenu(Landroid/view/View;)Landroid/widget/PopupMenu;
    .locals 2
    .parameter "anchorView"

    .prologue
    .line 2532
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-nez v0, :cond_0

    .line 2534
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    const v1, 0x7f100004

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->inflate(I)V

    .line 2535
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 2537
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setupMenuItems(Landroid/view/Menu;)V

    .line 2538
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    return-object v0
.end method

.method private dismissAudioModePopup()V
    .locals 1

    .prologue
    .line 2729
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    .line 2730
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2731
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    .line 2732
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopupVisible:Z

    .line 2734
    :cond_0
    return-void
.end method

.method private dismissVideoSettingDialogs()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 3214
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 3215
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3216
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    .line 3218
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 3219
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3220
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    .line 3222
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 3223
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3224
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    .line 3226
    :cond_2
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    .line 3227
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3228
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    .line 3230
    :cond_3
    return-void
.end method

.method private getVTInControlRes()Z
    .locals 1

    .prologue
    .line 1821
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInControlRes:Z

    return v0
.end method

.method private handleAudioButtonClick()V
    .locals 0

    .prologue
    .line 2776
    return-void
.end method

.method private hideLocalZoomOrBrightness()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 989
    const-string v0, "hideLocalZoomOrBrightness()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 992
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 993
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 994
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 995
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 996
    return-void
.end method

.method private isDialerOpened()Z
    .locals 1

    .prologue
    .line 2439
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

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
    .line 3259
    const-string v0, "VTInCallScreenLoopback"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3260
    return-void
.end method

.method private makeVoiceReCall(Ljava/lang/String;I)V
    .locals 4
    .parameter "number"
    .parameter "slot"

    .prologue
    .line 2275
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

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2278
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CALL"

    const-string v2, "tel"

    const/4 v3, 0x0

    invoke-static {v2, p1, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2279
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.android.phone.extra.slot"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2280
    const-string v1, "com.android.phone.extra.international"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2281
    const/high16 v1, 0x1400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2282
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/phone/PhoneGlobals;->startActivity(Landroid/content/Intent;)V

    .line 2284
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 2285
    return-void
.end method

.method private okToRecordVoice()Z
    .locals 1

    .prologue
    .line 2528
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoConnected:Z

    return v0
.end method

.method private onReceiveVTManagerReady()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 3088
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoReady:Z

    .line 3089
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 3092
    const-string v0, "Incallscreen, before call setting"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3095
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3097
    const-string v0, "Now DM not locked, VTManager.getInstance().unlockPeerVideo() start;"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3100
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->unlockPeerVideo()V

    .line 3102
    const-string v0, "Now DM not locked, VTManager.getInstance().unlockPeerVideo() end;"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3106
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTIsMT:Z

    if-eqz v0, :cond_0

    .line 3109
    const-string v0, "- VTSettingUtils.getInstance().mShowLocalMT : 1 !"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3110
    const-string v0, "Incallscreen, before enableAlwaysAskSettings"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3112
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->enableAlwaysAskSettings(I)V

    .line 3114
    const-string v0, "Incallscreen, after enableAlwaysAskSettings"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3117
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getInCallScreenInstance()Lcom/android/phone/InCallScreen;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0037

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0038

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;

    invoke-direct {v2, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0039

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$12;

    invoke-direct {v2, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$12;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$11;

    invoke-direct {v1, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$11;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    .line 3182
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 3184
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;

    const/4 v1, 0x5

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    invoke-direct {v0, p0, v1, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;ILandroid/app/AlertDialog;)V

    invoke-virtual {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->start()V

    .line 3188
    :cond_0
    return-void
.end method

.method private onVTHideMeClick()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1188
    const-string v2, "onVTHideMeClick()..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1191
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

    .line 1213
    :goto_0
    return-void

    .line 1198
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    if-eqz v2, :cond_1

    .line 1199
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v1, v3}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    .line 1211
    :goto_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v3

    iget-boolean v3, v3, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    if-nez v3, :cond_4

    :goto_2
    iput-boolean v0, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    .line 1212
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    goto :goto_0

    .line 1201
    :cond_1
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v2

    iget-object v2, v2, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1202
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_1

    .line 1203
    :cond_2
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v2

    iget-object v2, v2, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1204
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    const/4 v3, 0x2

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_1

    .line 1206
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v3

    iget v3, v3, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSlotId:I

    invoke-static {v3}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_1

    :cond_4
    move v0, v1

    .line 1211
    goto :goto_2
.end method

.method private onVTHideMeClick2()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1219
    const-string v0, "onVTHideMeClick2()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1224
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1225
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v1

    iget v1, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSlotId:I

    invoke-static {v1}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    .line 1232
    :goto_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v3, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    .line 1233
    return-void

    .line 1226
    :cond_0
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1227
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x2

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_0

    .line 1229
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_0
.end method

.method private onVTInCallVideoSetting()V
    .locals 2

    .prologue
    .line 1472
    const-string v1, "onVTInCallVideoSetting() ! "

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1475
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 1573
    .local v0, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    return-void
.end method

.method private onVTInCallVideoSettingLocalEffect()V
    .locals 11

    .prologue
    .line 1577
    const-string v9, "onVTInCallVideoSettingLocalEffect() ! "

    invoke-direct {p0, v9}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1589
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/mediatek/vt/VTManager;->getSupportedColorEffects()Ljava/util/List;

    move-result-object v8

    .line 1592
    .local v8, supportEntryValues:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v8, :cond_0

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-gtz v9, :cond_1

    .line 1625
    :cond_0
    :goto_0
    return-void

    .line 1596
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f070015

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 1598
    .local v3, entryValues:[Ljava/lang/CharSequence;
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f070014

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 1600
    .local v1, entries:[Ljava/lang/CharSequence;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1601
    .local v4, entryValues2:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1603
    .local v2, entries2:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    const/4 v5, 0x0

    .local v5, i:I
    array-length v6, v3

    .local v6, len:I
    :goto_1
    if-ge v5, v6, :cond_3

    .line 1604
    aget-object v9, v3, v5

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v9

    if-ltz v9, :cond_2

    .line 1605
    aget-object v9, v3, v5

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1606
    aget-object v9, v1, v5

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1603
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1611
    :cond_3
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onVTInCallVideoSettingLocalEffect() : entryValues2.size() - "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1614
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/mediatek/vt/VTManager;->getColorEffect()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 1616
    .local v0, currentValue:I
    new-instance v7, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$InCallVideoSettingLocalEffectListener;

    invoke-direct {v7, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$InCallVideoSettingLocalEffectListener;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 1618
    .local v7, myClickListener:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$InCallVideoSettingLocalEffectListener;
    invoke-virtual {v7, v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$InCallVideoSettingLocalEffectListener;->setValues(Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method private onVTInCallVideoSettingLocalNightMode()V
    .locals 2

    .prologue
    .line 1654
    const-string v1, "onVTInCallVideoSettingLocalNightMode() ! "

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1668
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$5;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$5;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 1719
    .local v0, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    return-void
.end method

.method private onVTInCallVideoSettingPeerQuality()V
    .locals 2

    .prologue
    .line 1723
    const-string v1, "onVTInCallVideoSettingPeerQuality() ! "

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1736
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 1779
    .local v0, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    return-void
.end method

.method private onVTReceiveFirstFrame()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1830
    const-string v0, "onVTReceiveFirstFrame() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1832
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-eqz v0, :cond_2

    .line 1833
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 1834
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1835
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1845
    :cond_0
    :goto_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHasReceiveFirstFrame:Z

    if-nez v0, :cond_1

    .line 1846
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHasReceiveFirstFrame:Z

    .line 1848
    :cond_1
    return-void

    .line 1839
    :cond_2
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 1840
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1841
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method private onVTShowDialpad()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 1430
    const-string v0, "onVTShowDialpad() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1433
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0}, Lcom/android/phone/DTMFTwelveKeyDialer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1435
    const-string v0, "onShowHideDialpad(): Set mInCallTitle VISIBLE"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1437
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->closeDialer(Z)V

    .line 1439
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    invoke-virtual {v0, v1}, Lcom/android/phone/DTMFTwelveKeyDialer;->openDialer(Z)V

    .line 1440
    return-void
.end method

.method private onVTSwapVideos()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1444
    const-string v0, "onVTSwapVideos() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1447
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    if-eqz v0, :cond_1

    .line 1450
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    .line 1453
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v3

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-nez v0, :cond_5

    move v0, v1

    :goto_0
    iput-boolean v0, v3, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    .line 1455
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1456
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTLocalPeerDisplay()V

    .line 1457
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1459
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    if-eqz v0, :cond_2

    .line 1460
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalZoom()V

    .line 1462
    :cond_2
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    if-eqz v0, :cond_3

    .line 1463
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalBrightness()V

    .line 1465
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    if-eqz v0, :cond_4

    .line 1466
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalContrast()V

    .line 1468
    :cond_4
    return-void

    :cond_5
    move v0, v2

    .line 1453
    goto :goto_0
.end method

.method private onVTSwitchCameraClick()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 1237
    const-string v0, "onVTSwitchCameraClick()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1240
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

    .line 1269
    :goto_0
    return-void

    .line 1245
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInSwitchCamera:Z

    if-eqz v0, :cond_1

    .line 1247
    const-string v0, "VTManager is handling switchcamera now, so returns this time."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1254
    :cond_1
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$3;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$3;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    invoke-virtual {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$3;->start()V

    .line 1262
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTFrontCameraNow:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTFrontCameraNow:Z

    .line 1263
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1265
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 1266
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 1267
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    .line 1268
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    goto :goto_0

    :cond_2
    move v0, v1

    .line 1262
    goto :goto_1
.end method

.method private onVTTakePeerPhotoClick()V
    .locals 2

    .prologue
    .line 1140
    const-string v0, "onVTTakePeerPhotoClick()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1143
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v0

    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v1, :cond_1

    .line 1184
    :cond_0
    :goto_0
    return-void

    .line 1148
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInSnapshot:Z

    if-eqz v0, :cond_2

    .line 1150
    const-string v0, "VTManager is handling snapshot now, so returns this time."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1156
    :cond_2
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isExternalStorageMounted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1161
    const-wide/32 v0, 0xf4240

    invoke-static {v0, v1}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1167
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$2;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$2;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    invoke-virtual {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$2;->start()V

    goto :goto_0
.end method

.method private onVoiceVideoRecordClick(Landroid/view/MenuItem;)V
    .locals 3
    .parameter "menuItem"

    .prologue
    .line 3030
    const-string v1, "onVoiceVideoRecordClick"

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3032
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3033
    .local v0, title:Ljava/lang/String;
    if-nez v0, :cond_1

    .line 3058
    :cond_0
    :goto_0
    return-void

    .line 3036
    :cond_1
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isExternalStorageMounted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3040
    const-wide/32 v1, 0x200000

    invoke-static {v1, v2}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(J)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0
.end method

.method private openVTInCallCanvas()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 818
    const-string v0, "openVTInCallCanvas!"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 820
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 821
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 822
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 825
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 826
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 829
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_2

    .line 830
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 832
    :cond_2
    return-void
.end method

.method private setVTInControlRes(Z)V
    .locals 1
    .parameter "value"

    .prologue
    .line 1825
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean p1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInControlRes:Z

    .line 1826
    return-void
.end method

.method private setVTSettingToVTManager()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 3234
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    if-eqz v0, :cond_0

    .line 3235
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/mediatek/vt/VTManager;->enableHideYou(I)V

    .line 3240
    :goto_0
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMO:Z

    if-eqz v0, :cond_1

    .line 3241
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->enableHideMe(I)V

    .line 3246
    :goto_1
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3247
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->incomingVideoDispaly(I)V

    .line 3254
    :goto_2
    const-string v0, "Incallscreen, after call setting"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3256
    return-void

    .line 3237
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->enableHideYou(I)V

    goto :goto_0

    .line 3243
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/mediatek/vt/VTManager;->enableHideMe(I)V

    goto :goto_1

    .line 3248
    :cond_2
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3249
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/mediatek/vt/VTManager;->incomingVideoDispaly(I)V

    goto :goto_2

    .line 3251
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->incomingVideoDispaly(I)V

    goto :goto_2
.end method

.method private showAudioModePopup()V
    .locals 11

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 2663
    const-string v6, "showAudioModePopup()..."

    invoke-direct {p0, v6}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2666
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissAudioModePopup()V

    .line 2668
    iget-object v6, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-nez v6, :cond_0

    .line 2671
    iget-object v6, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v6}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v6

    const v9, 0x7f100001

    iget-object v10, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v10}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 2673
    iget-object v6, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v6, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 2674
    iget-object v6, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v6, p0}, Landroid/widget/PopupMenu;->setOnDismissListener(Landroid/widget/PopupMenu$OnDismissListener;)V

    .line 2682
    :cond_0
    iget-object v6, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v6}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    .line 2689
    .local v2, menu:Landroid/view/Menu;
    const v6, 0x7f080134

    invoke-interface {v2, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 2697
    .local v3, speakerItem:Landroid/view/MenuItem;
    const v6, 0x7f080135

    invoke-interface {v2, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 2698
    .local v1, earpieceItem:Landroid/view/MenuItem;
    const v6, 0x7f080136

    invoke-interface {v2, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    .line 2699
    .local v5, wiredHeadsetItem:Landroid/view/MenuItem;
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/phone/PhoneGlobals;->isHeadsetPlugged()Z

    move-result v4

    .line 2705
    .local v4, usingHeadset:Z
    if-nez v4, :cond_2

    move v6, v7

    :goto_0
    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2706
    if-nez v4, :cond_1

    move v8, v7

    :cond_1
    invoke-interface {v1, v8}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2708
    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2709
    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2711
    const v6, 0x7f080137

    invoke-interface {v2, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 2714
    .local v0, bluetoothItem:Landroid/view/MenuItem;
    iget-object v6, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v6}, Landroid/widget/PopupMenu;->show()V

    .line 2719
    iput-boolean v7, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopupVisible:Z

    .line 2720
    return-void

    .end local v0           #bluetoothItem:Landroid/view/MenuItem;
    :cond_2
    move v6, v8

    .line 2705
    goto :goto_0
.end method

.method private showGenericErrorDialog(IZ)V
    .locals 0
    .parameter "resid"
    .parameter "isStartupError"

    .prologue
    .line 2100
    return-void
.end method

.method private showReCallDialogEx(ILjava/lang/String;I)V
    .locals 6
    .parameter "resid"
    .parameter "number"
    .parameter "slot"

    .prologue
    .line 2305
    const-string v4, "showReCallDialogEx... "

    invoke-direct {p0, v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2308
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    if-eqz v4, :cond_0

    .line 2309
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2377
    :goto_0
    return-void

    .line 2313
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 2317
    .local v3, msg:Ljava/lang/CharSequence;
    new-instance v1, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;

    invoke-direct {v1, p0, p2, p3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;I)V

    .line 2334
    .local v1, clickListener1:Landroid/content/DialogInterface$OnClickListener;
    new-instance v2, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$8;

    invoke-direct {v2, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$8;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 2357
    .local v2, clickListener2:Landroid/content/DialogInterface$OnClickListener;
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$9;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$9;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 2373
    .local v0, cancelListener:Landroid/content/DialogInterface$OnCancelListener;
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 2376
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showStartVTRecorderDialog()V
    .locals 4

    .prologue
    .line 2948
    const-string v1, "showStartVTRecorderDialog() ..."

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2962
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderEntries:Ljava/util/ArrayList;

    if-nez v1, :cond_3

    .line 2963
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderEntries:Ljava/util/ArrayList;

    .line 2968
    :goto_0
    const-string v1, "VT_VIDEO_RECORDING"

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "VT_VIDEO_RECORDING"

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2970
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0068

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2973
    :cond_0
    const-string v1, "VT_VOICE_RECORDING"

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2974
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0069

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2977
    :cond_1
    const-string v1, "VT_VIDEO_RECORDING"

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2978
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d006a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2982
    :cond_2
    new-instance v0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;

    invoke-direct {v0, p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;-><init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 3026
    .local v0, myClickListener:Landroid/content/DialogInterface$OnClickListener;
    return-void

    .line 2965
    .end local v0           #myClickListener:Landroid/content/DialogInterface$OnClickListener;
    :cond_3
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    goto :goto_0
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 2
    .parameter "string"

    .prologue
    .line 3199
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 3200
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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 929
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoReady:Z

    if-nez v0, :cond_0

    .line 953
    :goto_0
    return-void

    .line 933
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-eqz v0, :cond_1

    .line 934
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 935
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 936
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 937
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 938
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 939
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 949
    :goto_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 950
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 951
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 941
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 942
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 943
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 944
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 945
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 946
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 960
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoReady:Z

    if-nez v0, :cond_0

    .line 984
    :goto_0
    return-void

    .line 964
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-eqz v0, :cond_1

    .line 965
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 966
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 967
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 968
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 969
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 970
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 980
    :goto_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 981
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 982
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 972
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 973
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 974
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 975
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 976
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 977
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 898
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoReady:Z

    if-nez v0, :cond_0

    .line 922
    :goto_0
    return-void

    .line 902
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-eqz v0, :cond_1

    .line 903
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 904
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 905
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 906
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 907
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 908
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 918
    :goto_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 919
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 920
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 910
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 911
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 912
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 913
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 914
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 915
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

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

    .line 2922
    const-string v2, "startVTRecorder() ..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2924
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getDiskAvailableSize()J

    move-result-wide v2

    const-wide/32 v4, 0x200000

    sub-long v0, v2, v4

    .line 2925
    .local v0, sdMaxSize:J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_2

    .line 2926
    const/4 v2, 0x2

    if-ne v2, p1, :cond_1

    .line 2927
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorder;->getInstance(Landroid/content/Context;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/phone/recording/PhoneRecorder;->ismFlagRecord()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2929
    const-string v2, "startRecord"

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2932
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->startVoiceRecord(I)V

    .line 2944
    :cond_0
    :goto_0
    return-void

    .line 2934
    :cond_1
    if-lez p1, :cond_0

    .line 2935
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v2

    invoke-virtual {v2, p1, v0, v1, v6}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->startVideoRecord(IJI)V

    .line 2937
    invoke-virtual {p0, v6}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVideoCallRecordState(I)V

    goto :goto_0

    .line 2939
    :cond_2
    const-wide/16 v2, -0x1

    cmp-long v2, v2, v0

    if-nez v2, :cond_3

    .line 2940
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0033

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 2942
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0034

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private stopVideoRecord()V
    .locals 1

    .prologue
    .line 2895
    const-string v0, "stopVideoRecorder() ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2897
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVideoRecord()V

    .line 2898
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVideoCallRecordState(I)V

    .line 2899
    return-void
.end method

.method private updateAudioButton(Lcom/android/phone/InCallControlState;)V
    .locals 12
    .parameter "inCallControlState"

    .prologue
    const/4 v7, 0x1

    const/16 v9, 0xff

    const/4 v8, 0x0

    .line 2794
    const-string v10, "updateAudioButton()..."

    invoke-direct {p0, v10}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2803
    const/4 v6, 0x0

    .line 2806
    .local v6, showToggleStateIndication:Z
    const/4 v3, 0x0

    .line 2809
    .local v3, showMoreIndicator:Z
    const/4 v5, 0x0

    .line 2810
    .local v5, showSpeakerOnIcon:Z
    const/4 v4, 0x0

    .line 2811
    .local v4, showSpeakerOffIcon:Z
    const/4 v2, 0x0

    .line 2812
    .local v2, showHandsetIcon:Z
    const/4 v1, 0x0

    .line 2814
    .local v1, showBluetoothIcon:Z
    iget-boolean v10, p1, Lcom/android/phone/InCallControlState;->bluetoothEnabled:Z

    if-eqz v10, :cond_2

    .line 2816
    const-string v10, "- updateAudioButton: \'popup menu action button\' mode..."

    invoke-direct {p0, v10}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2819
    iget-object v10, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v10, v7}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 2824
    iget-object v7, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7, v8}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2827
    const/4 v3, 0x1

    .line 2828
    iget-boolean v7, p1, Lcom/android/phone/InCallControlState;->bluetoothIndicatorOn:Z

    if-eqz v7, :cond_0

    .line 2829
    const/4 v1, 0x1

    .line 2867
    :goto_0
    iget-object v7, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7}, Landroid/widget/CompoundButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 2869
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

    invoke-direct {p0, v7}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2877
    const v7, 0x7f08012c

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v3, :cond_5

    move v7, v9

    :goto_1
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2880
    const v7, 0x7f08012d

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v1, :cond_6

    move v7, v9

    :goto_2
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2883
    const v7, 0x7f08012e

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v2, :cond_7

    move v7, v9

    :goto_3
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2886
    const v7, 0x7f08012f

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v5, :cond_8

    move v7, v9

    :goto_4
    invoke-virtual {v10, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2889
    const v7, 0x7f080130

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-eqz v4, :cond_9

    :goto_5
    invoke-virtual {v7, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2891
    return-void

    .line 2830
    .end local v0           #layers:Landroid/graphics/drawable/LayerDrawable;
    :cond_0
    iget-boolean v7, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    if-eqz v7, :cond_1

    .line 2831
    const/4 v5, 0x1

    goto :goto_0

    .line 2833
    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 2835
    :cond_2
    iget-boolean v10, p1, Lcom/android/phone/InCallControlState;->speakerEnabled:Z

    if-eqz v10, :cond_4

    .line 2837
    const-string v10, "- updateAudioButton: \'speaker toggle\' mode..."

    invoke-direct {p0, v10}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2840
    iget-object v10, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v10, v7}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 2844
    iget-object v10, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    iget-boolean v11, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    invoke-virtual {v10, v11}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2847
    const/4 v6, 0x1

    .line 2848
    iget-boolean v5, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    .line 2849
    iget-boolean v10, p1, Lcom/android/phone/InCallControlState;->speakerOn:Z

    if-nez v10, :cond_3

    move v4, v7

    :goto_6
    goto/16 :goto_0

    :cond_3
    move v4, v8

    goto :goto_6

    .line 2852
    :cond_4
    const-string v7, "- updateAudioButton: disabled..."

    invoke-direct {p0, v7}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2857
    iget-object v7, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7, v8}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 2858
    iget-object v7, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v7, v8}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 2861
    const/4 v6, 0x1

    .line 2862
    const/4 v4, 0x1

    goto/16 :goto_0

    .restart local v0       #layers:Landroid/graphics/drawable/LayerDrawable;
    :cond_5
    move v7, v8

    .line 2877
    goto :goto_1

    :cond_6
    move v7, v8

    .line 2880
    goto :goto_2

    :cond_7
    move v7, v8

    .line 2883
    goto :goto_3

    :cond_8
    move v7, v8

    .line 2886
    goto :goto_4

    :cond_9
    move v9, v8

    .line 2889
    goto :goto_5
.end method

.method private updateLocalZoomOrBrightness()V
    .locals 2

    .prologue
    .line 1000
    const-string v0, "updateLocalZoomOrBrightness()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1003
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    if-eqz v0, :cond_1

    .line 1004
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1005
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

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
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    if-eqz v0, :cond_2

    .line 1007
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1008
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_0

    .line 1009
    :cond_2
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    if-eqz v0, :cond_0

    .line 1010
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1011
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_0
.end method

.method private updateVTInCallButtons()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 577
    const-string v4, "updateVTInCallButtons()..."

    invoke-direct {p0, v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 580
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v4

    iget-boolean v4, v4, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    if-nez v4, :cond_0

    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTIdle()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 582
    :cond_0
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 583
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 584
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v4, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 585
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 594
    :goto_0
    const-string v4, "updateVTInCallButtons() : update mVTMute \'s src !"

    invoke-direct {p0, v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 596
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/android/phone/PhoneUtils;->getMute()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 598
    const-string v4, "updateVTInCallButtons() : update mVTSwapVideo \'s src !"

    invoke-direct {p0, v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 600
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v5

    iget-boolean v5, v5, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-nez v5, :cond_3

    :goto_1
    invoke-virtual {v4, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 605
    const-string v2, "updateVTInCallButtons() : update mVTDialpad \'s src !"

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 611
    const-string v2, "updateVTInCallButtons() : update mVTAudio \'s src !"

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 615
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    .line 616
    .local v1, state:Lcom/android/internal/telephony/PhoneConstants$State;
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCallState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    .line 617
    .local v0, fgCallState:Lcom/android/internal/telephony/Call$State;
    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_4

    sget-object v2, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-eq v0, v2, :cond_1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v2, :cond_4

    .line 622
    :cond_1
    const-string v2, "updateVTInCallButtons() :phone state is OFFHOOK orcall state is ALERTING or ACTIVE,not dismiss !"

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 632
    :goto_2
    return-void

    .line 587
    .end local v0           #fgCallState:Lcom/android/internal/telephony/Call$State;
    .end local v1           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_2
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v4, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 588
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 589
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v4, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 590
    iget-object v4, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v5

    iget-boolean v5, v5, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHasReceiveFirstFrame:Z

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    goto :goto_0

    :cond_3
    move v2, v3

    .line 600
    goto :goto_1

    .line 630
    .restart local v0       #fgCallState:Lcom/android/internal/telephony/Call$State;
    .restart local v1       #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_4
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissAudioModePopup()V

    goto :goto_2
.end method

.method private updateVTLocalPeerDisplay()V
    .locals 3

    .prologue
    .line 3191
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-eqz v0, :cond_0

    .line 3192
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/vt/VTManager;->setDisplay(Landroid/view/SurfaceHolder;Landroid/view/SurfaceHolder;)V

    .line 3196
    :goto_0
    return-void

    .line 3194
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/vt/VTManager;->setDisplay(Landroid/view/SurfaceHolder;Landroid/view/SurfaceHolder;)V

    goto :goto_0
.end method


# virtual methods
.method public dismissVTDialogs()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1784
    const-string v0, "dismissVTDialogs() ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1786
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 1787
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1788
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;

    .line 1790
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 1791
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1792
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalEffectDialog:Landroid/app/AlertDialog;

    .line 1794
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    .line 1795
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1796
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingLocalNightmodeDialog:Landroid/app/AlertDialog;

    .line 1798
    :cond_2
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    .line 1799
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1800
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;

    .line 1802
    :cond_3
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    if-eqz v0, :cond_4

    .line 1803
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1804
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;

    .line 1806
    :cond_4
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_5

    .line 1807
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1812
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;

    .line 1814
    :cond_5
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;

    if-eqz v0, :cond_6

    .line 1815
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1816
    iput-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;

    .line 1818
    :cond_6
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

    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 890
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    return-object v0
.end method

.method public handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "menuItem"

    .prologue
    const/4 v0, 0x1

    .line 2549
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "- handleOnScreenMenuItemClick: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2550
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

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2551
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

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2562
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 2596
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    :pswitch_1
    return v0

    .line 2564
    :pswitch_2
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTSwitchCameraClick()V

    goto :goto_0

    .line 2567
    :pswitch_3
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTTakePeerPhotoClick()V

    goto :goto_0

    .line 2570
    :pswitch_4
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTHideMeClick()V

    goto :goto_0

    .line 2573
    :pswitch_5
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTSwapVideos()V

    goto :goto_0

    .line 2576
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVoiceVideoRecordClick(Landroid/view/MenuItem;)V

    goto :goto_0

    .line 2579
    :pswitch_7
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSetting()V

    goto :goto_0

    .line 2562
    :pswitch_data_0
    .packed-switch 0x7f080134
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public initCommonVTState()V
    .locals 1

    .prologue
    .line 2642
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2644
    const-string v0, "- Now DM locked, VTManager.getInstance().lockPeerVideo() start"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2646
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->lockPeerVideo()V

    .line 2648
    const-string v0, "- Now DM locked, VTManager.getInstance().lockPeerVideo() end"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2651
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_1

    .line 2652
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2654
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissAudioModePopup()V

    .line 2655
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTLocalPeerDisplay()V

    .line 2656
    return-void
.end method

.method public initDialingSuccessVTState()V
    .locals 1

    .prologue
    .line 2615
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v0}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->initDialingSuccessVTState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2629
    :cond_0
    :goto_0
    return-void

    .line 2626
    :cond_1
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMO:Z

    if-nez v0, :cond_0

    .line 2627
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTHideMeClick2()V

    goto :goto_0
.end method

.method public initVTInCallScreen()V
    .locals 8

    .prologue
    const v7, 0x7f080116

    const/16 v6, 0x8

    const/4 v5, 0x1

    const v4, 0x7f08011b

    const/4 v3, 0x0

    .line 639
    const-string v0, "initVTInCallCanvas()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 643
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPowerManager:Landroid/os/PowerManager;

    .line 644
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPowerManager:Landroid/os/PowerManager;

    const v1, 0x2000000a

    const-string v2, "VTWakeLock"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 651
    const v0, 0x7f08010e

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    .line 652
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 653
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTInCallCanvas:Landroid/view/ViewGroup;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 655
    const v0, 0x7f080110

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    .line 656
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 657
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 658
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 660
    const v0, 0x7f080111

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    .line 661
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 662
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 663
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 665
    const v0, 0x7f08011c

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    .line 666
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 667
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 668
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 670
    const v0, 0x7f08011d

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    .line 671
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 672
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 673
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 675
    const v0, 0x7f08010f

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    .line 676
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusable(Z)V

    .line 677
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusableInTouchMode(Z)V

    .line 679
    const v0, 0x7f080114

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    .line 680
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusable(Z)V

    .line 681
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setFocusableInTouchMode(Z)V

    .line 683
    invoke-virtual {p0, v7}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    .line 684
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 685
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 687
    const v0, 0x7f080115

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    .line 688
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 689
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 691
    const v0, 0x7f080117

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    .line 692
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 693
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 695
    const v0, 0x7f080118

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    .line 696
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v5}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 697
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setFocusableInTouchMode(Z)V

    .line 699
    const v0, 0x7f080119

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    .line 700
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 701
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setFocusableInTouchMode(Z)V

    .line 703
    invoke-virtual {p0, v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    .line 704
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setFocusable(Z)V

    .line 705
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setFocusableInTouchMode(Z)V

    .line 707
    const v0, 0x7f08011a

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUpWrapper:Landroid/widget/LinearLayout;

    .line 709
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 710
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 711
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 712
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 713
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 714
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 717
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 719
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 725
    :goto_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, p0}, Landroid/view/SurfaceView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 726
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, p0}, Landroid/view/SurfaceView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 729
    const v0, 0x7f080112

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    .line 730
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setFocusable(Z)V

    .line 731
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setFocusableInTouchMode(Z)V

    .line 732
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    const v1, 0x7f0200b2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 733
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceRecordingIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 737
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 738
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 739
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 740
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 742
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 743
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 744
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 746
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 747
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    const v1, 0x7f080118

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 752
    :goto_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 754
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 755
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080118

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 759
    :goto_2
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080115

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 760
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v4}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 762
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusLeftId(I)V

    .line 763
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    const v1, 0x7f080118

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    .line 764
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v7}, Landroid/widget/CompoundButton;->setNextFocusUpId(I)V

    .line 765
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v4}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    .line 767
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setNextFocusLeftId(I)V

    .line 768
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    const v1, 0x7f080119

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setNextFocusRightId(I)V

    .line 769
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v7}, Landroid/widget/ImageButton;->setNextFocusUpId(I)V

    .line 770
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusDownId(I)V

    .line 772
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusLeftId(I)V

    .line 773
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusRightId(I)V

    .line 774
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    const v1, 0x7f080117

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setNextFocusUpId(I)V

    .line 775
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setNextFocusDownId(I)V

    .line 778
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    .line 779
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    .line 781
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 782
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 784
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 785
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 791
    return-void

    .line 721
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 722
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto/16 :goto_0

    .line 749
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMute:Landroid/widget/CompoundButton;

    const v1, 0x7f080119

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusDownId(I)V

    goto/16 :goto_1

    .line 757
    :cond_2
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    const v1, 0x7f080119

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setNextFocusRightId(I)V

    goto/16 :goto_2
.end method

.method public internalAnswerVTCallPre()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1018
    const-string v0, "internalAnswerVTCallPre()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1021
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1022
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->closeVTManager()V

    .line 1024
    const-string v0, "internalAnswerVTCallPre: set VTInCallScreenFlagsLoopback.getInstance().mVTShouldCloseVTManager = false"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1027
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v3, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTShouldCloseVTManager:Z

    .line 1028
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->resetPartial()V

    .line 1048
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->reset()V

    .line 1076
    const-string v0, "VTInCallScreenLoopback:closeVTManager:sendIntent_CALL_START_YET"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1077
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTInControlRes()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1078
    const-string v0, "VTInCallScreenLoopback:closeVTManager:sendIntent_CALL_START_GOES"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1080
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.phone.extra.VT_CALL_START"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1081
    invoke-direct {p0, v4}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setVTInControlRes(Z)V

    .line 1097
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->registerForVTPhoneStates()V

    .line 1100
    const-string v0, "- set VTManager open ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1103
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/vt/VTManager;->setVTOpen(Landroid/content/Context;Ljava/lang/Object;I)V

    .line 1108
    const-string v0, "- finish set VTManager open ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1111
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1112
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTHideMeClick2()V

    .line 1114
    :cond_2
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1116
    const-string v0, "- Now DM locked, VTManager.getInstance().lockPeerVideo() start"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1118
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->lockPeerVideo()V

    .line 1120
    const-string v0, "- Now DM locked, VTManager.getInstance().lockPeerVideo() end"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1124
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedH:Z

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedL:Z

    if-eqz v0, :cond_4

    .line 1127
    const-string v0, "- set VTManager ready ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1129
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->setVTReady()V

    .line 1131
    const-string v0, "- finish set VTManager ready ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1136
    :goto_0
    return-void

    .line 1134
    :cond_4
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v4, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSettingReady:Z

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "view"

    .prologue
    const/4 v4, 0x0

    .line 1933
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 1935
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

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1938
    packed-switch v0, :pswitch_data_0

    .line 2092
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

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2096
    :cond_0
    :goto_0
    return-void

    .line 1942
    :pswitch_1
    const-string v2, "onClick: VTHighVideo..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1944
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-nez v2, :cond_0

    .line 1945
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    .line 1946
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 1947
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 1948
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 1954
    :pswitch_2
    const-string v2, "onClick: VTLowVideo..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1956
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTPeerBigger:Z

    if-eqz v2, :cond_0

    .line 1957
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    .line 1958
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 1959
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 1960
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iput-boolean v4, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    goto :goto_0

    .line 1966
    :pswitch_3
    const-string v2, "onClick: VTMute"

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1973
    :pswitch_4
    const-string v2, "onClick: VTSpeaker..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1975
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->handleAudioButtonClick()V

    goto :goto_0

    .line 1980
    :pswitch_5
    const-string v2, "onClick: VTDialpad..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1987
    :pswitch_6
    const-string v2, "onClick: VTSwapVideo..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1989
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTSwapVideos()V

    goto :goto_0

    .line 1994
    :pswitch_7
    const-string v2, "onClick: VTHangUp..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1996
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInEndingCall:Z

    .line 1997
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1998
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    iget-object v2, v2, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-static {v2}, Lcom/android/phone/PhoneUtils;->hangup(Lcom/android/internal/telephony/CallManager;)Z

    goto/16 :goto_0

    .line 2003
    :pswitch_8
    const-string v2, "onClick: VTLowUp..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2005
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_1

    .line 2006
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incZoom()Z

    .line 2007
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2008
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2009
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_2

    .line 2010
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incBrightness()Z

    .line 2011
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2012
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2013
    :cond_2
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2014
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incContrast()Z

    .line 2015
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2016
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2022
    :pswitch_9
    const-string v2, "onClick: VTHighUp..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2024
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_3

    .line 2025
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incZoom()Z

    .line 2026
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2027
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2028
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_4

    .line 2029
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incBrightness()Z

    .line 2030
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2031
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2032
    :cond_4
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2033
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->incContrast()Z

    .line 2034
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2035
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2041
    :pswitch_a
    const-string v2, "onClick: VTLowDown..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2043
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_5

    .line 2044
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decZoom()Z

    .line 2045
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2046
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2047
    :cond_5
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_6

    .line 2048
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decBrightness()Z

    .line 2049
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2050
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2051
    :cond_6
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2052
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decContrast()Z

    .line 2053
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2054
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2060
    :pswitch_b
    const-string v2, "onClick: VTHighDown..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2062
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    if-eqz v2, :cond_7

    .line 2063
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decZoom()Z

    .line 2064
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2065
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2066
    :cond_7
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    if-eqz v2, :cond_8

    .line 2067
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decBrightness()Z

    .line 2068
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2069
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2070
    :cond_8
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v2

    iget-boolean v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    if-eqz v2, :cond_0

    .line 2071
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager;->decContrast()Z

    .line 2072
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighUp:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2073
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighDown:Landroid/widget/ImageButton;

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_0

    .line 2079
    :pswitch_c
    const-string v2, "onClick: VTOverflowMenu..."

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2081
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v2, :cond_9

    .line 2082
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v2}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2084
    :cond_9
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-direct {p0, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->constructPopupMenu(Landroid/view/View;)Landroid/widget/PopupMenu;

    move-result-object v1

    .line 2085
    .local v1, popup:Landroid/widget/PopupMenu;
    if-eqz v1, :cond_0

    .line 2086
    invoke-virtual {v1}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_0

    .line 1938
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
    .locals 3

    .prologue
    .line 239
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->unregisterForVTPhoneStates()V

    .line 240
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_1

    .line 255
    :cond_0
    :goto_0
    return-void

    .line 243
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 244
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 248
    :cond_2
    const-string v0, "closeVTmanger VTInCallScreenLoopback:onDestory"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 250
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTInControlRes()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 251
    const-string v0, "VTInCallScreenLoopback:onDestory:sentIntent:VTCallUtils.VT_CALL_END"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 252
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.phone.extra.VT_CALL_END"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 253
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->setVTInControlRes(Z)V

    goto :goto_0
.end method

.method public onDismiss(Landroid/widget/PopupMenu;)V
    .locals 2
    .parameter "menu"

    .prologue
    .line 2743
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- onDismiss: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2745
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopupVisible:Z

    .line 2746
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 3205
    const-string v0, "onKeyDown"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 3207
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v0, p1, p2}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3208
    const/4 v0, 0x1

    .line 3210
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
    .line 2543
    invoke-virtual {p0, p1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 2601
    invoke-virtual {p0, p1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->handleOnScreenMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 2606
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    sget-object v1, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_OPEN:Lcom/android/phone/Constants$VTScreenMode;

    if-ne v0, v1, :cond_0

    .line 2607
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/ext/VTInCallScreenExtension;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    .line 2609
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onReceiveVTManagerStartCounter()V
    .locals 5

    .prologue
    .line 3065
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v1

    iget-object v1, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTConnectionStarttime:Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;

    iget-wide v1, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;->mStarttime:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    .line 3066
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 3067
    .local v0, call:Lcom/android/internal/telephony/Call;
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->hasActiveRingingCall()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3068
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getFirstActiveRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    .line 3072
    :cond_0
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 3073
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 3074
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v1

    iget-object v1, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTConnectionStarttime:Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;->mStarttime:J

    .line 3076
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v1

    iget-object v1, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTConnectionStarttime:Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;

    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getActiveFgCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v2

    iput-object v2, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback$VTConnectionStarttime;->mConnection:Lcom/android/internal/telephony/Connection;

    .line 3078
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->notificationMgr:Lcom/android/phone/NotificationMgr;

    invoke-virtual {v1}, Lcom/android/phone/NotificationMgr;->updateInCallNotification()V

    .line 3085
    .end local v0           #call:Lcom/android/internal/telephony/Call;
    :cond_1
    return-void
.end method

.method public onStop()V
    .locals 3

    .prologue
    .line 2245
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    .line 2247
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

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2250
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_0

    .line 2257
    :cond_0
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v1, :cond_1

    .line 2258
    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v1}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2260
    :cond_1
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissAudioModePopup()V

    .line 2263
    const-string v1, "VTInCallScreenLoopback:onStop"

    invoke-direct {p0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2264
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->closeVTManager()V

    .line 2270
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
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHasReceiveFirstFrame:Z

    if-eqz v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mExtension:Lcom/mediatek/phone/ext/VTInCallScreenExtension;

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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 805
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    .line 806
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 807
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 808
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

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
    .line 2759
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopupVisible:Z

    if-eqz v0, :cond_0

    .line 2761
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mAudioModePopup:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->dismiss()V

    .line 2763
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showAudioModePopup()V

    .line 2765
    :cond_0
    return-void
.end method

.method registerForVTPhoneStates()V
    .locals 0

    .prologue
    .line 2397
    return-void
.end method

.method public resetVTFlags()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1307
    const-string v0, "resetVTFlags()..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1310
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->reset()V

    .line 1311
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissVTDialogs()V

    .line 1313
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    .line 1314
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1315
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1319
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 1320
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1321
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHighVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1328
    :cond_1
    return-void
.end method

.method setDialer(Lcom/android/phone/DTMFTwelveKeyDialer;)V
    .locals 0
    .parameter "dialer"

    .prologue
    .line 2384
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mDialer:Lcom/android/phone/DTMFTwelveKeyDialer;

    .line 2385
    return-void
.end method

.method setVTLoopBackInstance(Landroid/app/Activity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 2380
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mActivity:Landroid/app/Activity;

    .line 2381
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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 861
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    if-eq v0, p1, :cond_0

    .line 863
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->openVTInCallCanvas()V

    .line 865
    const-string v0, "setVTScreenMode : mVTWakeLock.acquire() "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 867
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_0

    .line 868
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 872
    :cond_0
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    if-eq v0, v1, :cond_1

    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    if-ne v0, p1, :cond_1

    .line 874
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->closeVTInCallCanvas()V

    .line 876
    const-string v0, "setVTScreenMode : mVTWakeLock.release() "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 878
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 879
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 882
    :cond_1
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTScreenMode:Lcom/android/phone/Constants$VTScreenMode;

    .line 883
    return-void
.end method

.method public setVTVisible(Z)V
    .locals 2
    .parameter "bIsVisible"

    .prologue
    .line 1909
    if-eqz p1, :cond_1

    .line 1910
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedH:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedL:Z

    if-eqz v0, :cond_0

    .line 1913
    const-string v0, "VTManager.getInstance().setVTVisible(true) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1915
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1917
    const-string v0, "VTManager.getInstance().setVTVisible(true) end ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1929
    :cond_0
    :goto_0
    return-void

    .line 1922
    :cond_1
    const-string v0, "VTManager.getInstance().setVTVisible(false) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1924
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1926
    const-string v0, "VTManager.getInstance().setVTVisible(false) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setupMenuItems(Landroid/view/Menu;)V
    .locals 12
    .parameter "menu"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 2444
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 2496
    :goto_0
    return-void

    .line 2448
    :cond_0
    const v8, 0x7f08013c

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 2449
    .local v4, switchCameraMenu:Landroid/view/MenuItem;
    const v8, 0x7f08013d

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    .line 2450
    .local v5, takePeerPhotoMenu:Landroid/view/MenuItem;
    const v8, 0x7f08013f

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 2451
    .local v2, hideLocalVideoMenu:Landroid/view/MenuItem;
    const v8, 0x7f08013e

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 2452
    .local v3, swapVideosMenu:Landroid/view/MenuItem;
    const v8, 0x7f080140

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    .line 2454
    .local v7, voiceRecordMenu:Landroid/view/MenuItem;
    const v8, 0x7f080141

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    .line 2456
    .local v6, videoSettingMenu:Landroid/view/MenuItem;
    invoke-interface {v4, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2457
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/mediatek/vt/VTManager;->getCameraSensorCount()I

    move-result v1

    .line 2459
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

    invoke-direct {p0, v8}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2462
    const/4 v8, 0x2

    if-ne v8, v1, :cond_2

    move v8, v9

    :goto_1
    invoke-interface {v4, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2463
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/settings/VTSettingUtils;->mEnableBackCamera:Z

    if-eqz v8, :cond_3

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    if-nez v8, :cond_3

    move v0, v9

    .line 2466
    .local v0, bIsSwitchCameraEnable:Z
    :goto_2
    invoke-interface {v4, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2468
    invoke-interface {v5, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2469
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->isDialerOpened()Z

    move-result v8

    if-nez v8, :cond_4

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoConnected:Z

    if-eqz v8, :cond_4

    move v8, v9

    :goto_3
    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2472
    invoke-interface {v2, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2473
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    if-nez v8, :cond_5

    .line 2474
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0d0042

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 2480
    :goto_4
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHasReceiveFirstFrame:Z

    invoke-interface {v3, v8}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2482
    invoke-interface {v7, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2483
    invoke-interface {v7, v10}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2484
    const v8, 0x7f0d006f

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 2485
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->okToRecordVoice()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 2486
    invoke-interface {v7, v9}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2487
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v8

    invoke-virtual {v8}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->isVTRecording()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2488
    const v8, 0x7f0d0070

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 2494
    :cond_1
    :goto_5
    invoke-interface {v6, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2495
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTVideoConnected:Z

    invoke-interface {v6, v8}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto/16 :goto_0

    .end local v0           #bIsSwitchCameraEnable:Z
    :cond_2
    move v8, v10

    .line 2462
    goto/16 :goto_1

    :cond_3
    move v0, v10

    .line 2463
    goto :goto_2

    .restart local v0       #bIsSwitchCameraEnable:Z
    :cond_4
    move v8, v10

    .line 2469
    goto :goto_3

    .line 2476
    :cond_5
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v11, 0x7f0d0043

    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_4

    .line 2490
    :cond_6
    invoke-static {}, Lcom/mediatek/phone/DualTalkUtils;->isSupportDualTalk()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2491
    invoke-interface {v7, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_5
.end method

.method public showReCallDialog(ILjava/lang/String;I)V
    .locals 2
    .parameter "resid"
    .parameter "number"
    .parameter "slot"

    .prologue
    .line 2291
    const-string v0, "showReCallDialog... "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2294
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/settings/VTSettingUtils;->mAutoDropBack:Z

    if-eqz v0, :cond_0

    .line 2295
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d004b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V

    .line 2297
    invoke-direct {p0, p2, p3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->makeVoiceReCall(Ljava/lang/String;I)V

    .line 2301
    :goto_0
    return-void

    .line 2299
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showReCallDialogEx(ILjava/lang/String;I)V

    goto :goto_0
.end method

.method public stopRecord()V
    .locals 2

    .prologue
    .line 2904
    const-string v0, "stopRecord"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2906
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorder;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2908
    const-string v0, "stopVoiceRecord"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2910
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVoiceRecord()V

    .line 2918
    :cond_0
    :goto_0
    return-void

    .line 2911
    :cond_1
    const/4 v0, 0x1

    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->getPhoneRecorderState()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 2914
    const-string v0, "stopVideoRecord"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 2916
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->stopVideoRecord()V

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

    .line 1334
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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1337
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_0

    .line 1339
    const-string v0, "surfaceChanged : HighVideo , set mVTSurfaceChangedH = true"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1341
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedH:Z

    .line 1344
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_1

    .line 1346
    const-string v0, "surfaceChanged : LowVideo , set mVTSurfaceChangedL = true"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1348
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedL:Z

    .line 1351
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedH:Z

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedL:Z

    if-eqz v0, :cond_4

    .line 1353
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTLocalPeerDisplay()V

    .line 1356
    const-string v0, "surfaceChanged : VTManager.getInstance().setVTVisible(true) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1358
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1360
    const-string v0, "surfaceChanged : VTManager.getInstance().setVTVisible(true) end ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1362
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1363
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1366
    :cond_2
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSettingReady:Z

    if-eqz v0, :cond_3

    .line 1368
    const-string v0, "- set VTManager ready ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1370
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->setVTReady()V

    .line 1372
    const-string v0, "- finish set VTManager ready ! "

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1374
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSettingReady:Z

    .line 1377
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfacedChanged_afterReady_State= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/vt/VTManager;->getState()Lcom/mediatek/vt/VTManager$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1378
    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V

    .line 1380
    :cond_4
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 1385
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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1387
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .parameter "holder"

    .prologue
    const/4 v2, 0x0

    .line 1392
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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1395
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mHighVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_0

    .line 1397
    const-string v0, "surfaceDestroyed : HighVideo, set mVTSurfaceChangedH = false"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1400
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedH:Z

    .line 1403
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mLowVideoHolder:Landroid/view/SurfaceHolder;

    if-ne p1, v0, :cond_1

    .line 1405
    const-string v0, "surfaceDestroyed : LowVideo, set mVTSurfaceChangedL = false"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1408
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedL:Z

    .line 1411
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedH:Z

    if-nez v0, :cond_2

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTSurfaceChangedL:Z

    if-nez v0, :cond_2

    .line 1414
    const-string v0, "surfaceDestroyed : VTManager.getInstance().setVTVisible(false) start ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1417
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->setVTVisible(Z)V

    .line 1419
    const-string v0, "surfaceDestroyed : VTManager.getInstance().setVTVisible(false) end ..."

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 1422
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1423
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1426
    :cond_2
    return-void
.end method

.method unregisterForVTPhoneStates()V
    .locals 0

    .prologue
    .line 2423
    return-void
.end method

.method public updateVTScreen(Lcom/android/phone/Constants$VTScreenMode;)V
    .locals 4
    .parameter "mode"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 514
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateVTScreen : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 517
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    if-ne p1, v0, :cond_0

    .line 573
    :goto_0
    return-void

    .line 532
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTLowVideo:Landroid/view/SurfaceView;

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setClickable(Z)V

    .line 533
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTHangUp:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 536
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateVTScreen : VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v1

    iget-boolean v1, v1, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 538
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

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    .line 542
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->isVTActive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 543
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 544
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 545
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    .line 546
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    .line 547
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->dismissVideoSettingDialogs()V

    .line 548
    sget-object v0, Lcom/android/phone/Constants$VTScreenMode;->VT_SCREEN_CLOSE:Lcom/android/phone/Constants$VTScreenMode;

    invoke-virtual {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getVTScreenMode()Lcom/android/phone/Constants$VTScreenMode;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 553
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iget-boolean v0, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTHideMeNow:Z

    if-eqz v0, :cond_2

    .line 554
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalZoomSetting:Z

    .line 555
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalBrightnessSetting:Z

    .line 556
    invoke-static {}, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->getInstance()Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;

    move-result-object v0

    iput-boolean v2, v0, Lcom/mediatek/vt/loopback/VTInCallScreenFlagsLoopback;->mVTInLocalContrastSetting:Z

    .line 557
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    .line 560
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->updateVTInCallButtons()V

    .line 562
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isDMLocked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 563
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTDialpad:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 564
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTAudio:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 565
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTOverflowMenu:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 566
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTSwapVideo:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    .line 567
    invoke-direct {p0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->hideLocalZoomOrBrightness()V

    .line 571
    :cond_3
    const-string v0, "updateVTScreen end"

    invoke-direct {p0, v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public updateVideoCallRecordState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 1895
    return-void
.end method
