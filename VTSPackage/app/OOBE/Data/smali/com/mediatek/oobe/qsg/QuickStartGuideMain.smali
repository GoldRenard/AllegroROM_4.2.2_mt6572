.class public Lcom/mediatek/oobe/qsg/QuickStartGuideMain;
.super Landroid/app/Activity;
.source "QuickStartGuideMain.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field private static final SUMMARY:[I = null

.field private static final TAG:Ljava/lang/String; = "QuickStartGuideMain"

.field private static final TITLE:[I


# instance fields
.field private mCurrentStep:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mGroupButtons:Landroid/widget/LinearLayout;

.field private mHideVideo:Z

.field private mHolder:Landroid/view/SurfaceHolder;

.field private mIsFirstRun:Z

.field private mIsHolderCreated:Z

.field private mIsPreload:Z

.field private mIsTablet:Z

.field private mIsVideoReadyToBePlayed:Z

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mNextButtons:Landroid/widget/LinearLayout;

.field private mNextListener:Landroid/view/View$OnClickListener;

.field private mNextbtn:Landroid/widget/Button;

.field private mOkbtn:Landroid/widget/Button;

.field private mPath:Ljava/lang/String;

.field private mPlayAgainListener:Landroid/view/View$OnClickListener;

.field private mPlayAgainbtn:Landroid/widget/Button;

.field private mPreview:Landroid/view/SurfaceView;

.field private mProgressBar:Landroid/widget/LinearLayout;

.field private mSetScreen:Z

.field private mSkipListener:Landroid/view/View$OnClickListener;

.field private mSkipbtn:Landroid/widget/Button;

.field private mStartListener:Landroid/view/View$OnClickListener;

.field private mSummary:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;

.field private mVideoHeight:I

.field private mVideoTips:[Ljava/lang/String;

.field private mVideoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x5

    .line 117
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->TITLE:[I

    .line 123
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->SUMMARY:[I

    return-void

    .line 117
    :array_0
    .array-data 0x4
        0x3ct 0x0t 0x9t 0x7ft
        0x3et 0x0t 0x9t 0x7ft
        0x40t 0x0t 0x9t 0x7ft
        0x42t 0x0t 0x9t 0x7ft
        0x37t 0x0t 0x9t 0x7ft
    .end array-data

    .line 123
    :array_1
    .array-data 0x4
        0x3dt 0x0t 0x9t 0x7ft
        0x3ft 0x0t 0x9t 0x7ft
        0x41t 0x0t 0x9t 0x7ft
        0x43t 0x0t 0x9t 0x7ft
        0x46t 0x0t 0x9t 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 84
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 100
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    .line 103
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z

    .line 106
    iput-boolean v3, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z

    .line 111
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsVideoReadyToBePlayed:Z

    .line 112
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsHolderCreated:Z

    .line 114
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    .line 115
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsTablet:Z

    .line 116
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSetScreen:Z

    .line 130
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "JB_01View_Home_screen.mp4"

    aput-object v1, v0, v2

    const-string v1, "JB_02Choose_some_widgets.mp4"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "JB_03Launch_detail_page.mp4"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "JB_04ViewNotifications.mp4"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;

    .line 206
    new-instance v0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$1;-><init>(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSkipListener:Landroid/view/View$OnClickListener;

    .line 212
    new-instance v0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$2;-><init>(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mStartListener:Landroid/view/View$OnClickListener;

    .line 233
    new-instance v0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$3;-><init>(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextListener:Landroid/view/View$OnClickListener;

    .line 262
    new-instance v0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$4;-><init>(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainListener:Landroid/view/View$OnClickListener;

    .line 278
    new-instance v0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$5;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain$5;-><init>(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->finishGuickStartGuide()V

    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextbtn:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    iput-boolean p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)[Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->playVideo(I)V

    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainbtn:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/view/SurfaceView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPreview:Landroid/view/SurfaceView;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->releaseMediaPlayer()V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mGroupButtons:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextButtons:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    return v0
.end method

.method static synthetic access$502(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    iput p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    return p1
.end method

.method static synthetic access$508(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)I
    .locals 2
    .parameter "x0"

    .prologue
    .line 84
    iget v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    return v0
.end method

.method static synthetic access$600(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Landroid/media/MediaPlayer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z

    return v0
.end method

.method static synthetic access$702(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    iput-boolean p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z

    return p1
.end method

.method static synthetic access$800(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsVideoReadyToBePlayed:Z

    return v0
.end method

.method static synthetic access$900(Lcom/mediatek/oobe/qsg/QuickStartGuideMain;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->startVideoPlayback()V

    return-void
.end method

.method private doCleanUp()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 464
    iput v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoWidth:I

    .line 465
    iput v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoHeight:I

    .line 466
    iput-boolean v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsVideoReadyToBePlayed:Z

    .line 468
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 470
    return-void
.end method

.method private finishGuickStartGuide()V
    .locals 3

    .prologue
    .line 487
    const-string v0, "QuickStartGuideMain"

    const-string v1, "finish quick start guide"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 489
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 490
    const-string v0, "QuickStartGuideMain"

    const-string v1, "video is playing "

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 493
    :cond_0
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    if-eqz v0, :cond_1

    .line 499
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "show_quick_start_guide"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 500
    const-string v0, "QuickStartGuideMain"

    const-string v1, "OOBE begin to start launcher with flag stored in settings providers"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    :cond_1
    const-string v0, "QuickStartGuideMain"

    const-string v1, "setResult code 25"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->finish()V

    .line 511
    return-void
.end method

.method private isTablet()V
    .locals 2

    .prologue
    .line 137
    const-string v1, "ro.build.characteristics"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, deviceInfo:Ljava/lang/String;
    const-string v1, "tablet"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 139
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsTablet:Z

    .line 141
    :cond_0
    return-void
.end method

.method private playVideo(I)V
    .locals 9
    .parameter "step"

    .prologue
    const/4 v8, 0x0

    .line 290
    const-string v0, "QuickStartGuideMain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "playVideo step="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z

    if-eqz v0, :cond_0

    .line 293
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->doCleanUp()V

    .line 294
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->updateProgress(I)V

    .line 297
    :cond_0
    if-ltz p1, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-gt p1, v0, :cond_1

    .line 298
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;

    aget-object v0, v0, p1

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPath:Ljava/lang/String;

    .line 301
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 302
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 303
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 304
    .local v6, afd:Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 305
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 306
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->resizeSurfaceView()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 318
    .end local v6           #afd:Landroid/content/res/AssetFileDescriptor;
    :cond_2
    :goto_0
    return-void

    .line 309
    :catch_0
    move-exception v7

    .line 310
    .local v7, e:Ljava/io/IOException;
    const-string v0, "QuickStartGuideMain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unable to open file; error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 311
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 312
    iput-object v8, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0

    .line 313
    .end local v7           #e:Ljava/io/IOException;
    :catch_1
    move-exception v7

    .line 314
    .local v7, e:Ljava/lang/IllegalStateException;
    const-string v0, "QuickStartGuideMain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "media player is in illegal state; error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 315
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 316
    iput-object v8, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0
.end method

.method private releaseMediaPlayer()V
    .locals 1

    .prologue
    .line 457
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 458
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 459
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 461
    :cond_0
    return-void
.end method

.method private startVideoPlayback()V
    .locals 2

    .prologue
    .line 473
    const-string v0, "QuickStartGuideMain"

    const-string v1, "startVideoPlayback"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsHolderCreated:Z

    if-nez v0, :cond_1

    .line 484
    :cond_0
    :goto_0
    return-void

    .line 478
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 480
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 481
    const-string v0, "QuickStartGuideMain"

    const-string v1, "QSG video is playing "

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPreview:Landroid/view/SurfaceView;

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setBackgroundColor(I)V

    goto :goto_0
.end method


# virtual methods
.method protected hideTitleSummary()V
    .locals 2

    .prologue
    .line 349
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mTitle:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 350
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSummary:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 351
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainbtn:Landroid/widget/Button;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 352
    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .parameter "arg0"

    .prologue
    .line 356
    const-string v0, "QuickStartGuideMain"

    const-string v1, "onCompletion called"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z

    if-nez v0, :cond_0

    .line 358
    iget v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->updateTitleSummary(I)V

    .line 359
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainbtn:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 361
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x400

    .line 146
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 148
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->isTablet()V

    .line 149
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsTablet:Z

    if-nez v0, :cond_0

    .line 151
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->setRequestedOrientation(I)V

    .line 154
    :cond_0
    const-string v0, "QuickStartGuideMain"

    const-string v1, "QuickStartGuideMain onCreate "

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const v0, 0x7f03001a

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->setContentView(I)V

    .line 159
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x400

    if-eq v0, v2, :cond_1

    .line 161
    const-string v0, "QuickStartGuideMain"

    const-string v1, " fullscreen = false"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 165
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "mIsFirstRun"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    .line 166
    const-string v0, "QuickStartGuideMain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mIsFirstRun = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    const v0, 0x7f0b0044

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSkipbtn:Landroid/widget/Button;

    .line 169
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    if-nez v0, :cond_2

    .line 171
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSkipbtn:Landroid/widget/Button;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 177
    :goto_0
    const v0, 0x7f0b0045

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mOkbtn:Landroid/widget/Button;

    .line 178
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mOkbtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mStartListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    const v0, 0x7f0b0043

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mGroupButtons:Landroid/widget/LinearLayout;

    .line 180
    const v0, 0x7f0b0046

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextButtons:Landroid/widget/LinearLayout;

    .line 182
    const v0, 0x7f0b0048

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextbtn:Landroid/widget/Button;

    .line 183
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextbtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mNextListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    const v0, 0x7f0b0047

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainbtn:Landroid/widget/Button;

    .line 185
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainbtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPlayAgainListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    const v0, 0x7f0b0041

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mTitle:Landroid/widget/TextView;

    .line 188
    const v0, 0x7f0b0042

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSummary:Landroid/widget/TextView;

    .line 191
    const v0, 0x7f0b0030

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;

    .line 193
    const v0, 0x7f0b0058

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPreview:Landroid/view/SurfaceView;

    .line 194
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPreview:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHolder:Landroid/view/SurfaceHolder;

    .line 195
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 196
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 198
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 200
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 201
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 202
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 204
    return-void

    .line 173
    :cond_2
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSkipbtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSkipListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSkipbtn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 451
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 452
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->releaseMediaPlayer()V

    .line 453
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->doCleanUp()V

    .line 454
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 515
    packed-switch p1, :pswitch_data_0

    .line 531
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_1
    return v0

    .line 517
    :pswitch_0
    const-string v0, "QuickStartGuideMain"

    const-string v1, "Press back button to former settings"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    const-string v0, "QuickStartGuideMain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Is first started?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 520
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    if-eqz v0, :cond_0

    .line 521
    const/4 v0, 0x1

    goto :goto_1

    .line 524
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->finishGuickStartGuide()V

    goto :goto_0

    .line 515
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 435
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 436
    const-string v0, "QuickStartGuideMain"

    const-string v1, "onPause called"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 442
    :cond_0
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    if-eqz v0, :cond_1

    .line 443
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oobe_display"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 445
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "device_provisioned"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 447
    :cond_1
    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .parameter "mediaplayer"

    .prologue
    const/4 v2, 0x1

    .line 365
    const-string v0, "QuickStartGuideMain"

    const-string v1, "onPrepared called"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsVideoReadyToBePlayed:Z

    .line 367
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsHolderCreated:Z

    if-eqz v0, :cond_1

    .line 368
    const-string v0, "QuickStartGuideMain"

    const-string v1, "first prepare video..."

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    iput-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsPreload:Z

    .line 370
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 376
    :cond_0
    :goto_0
    return-void

    .line 373
    :cond_1
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsVideoReadyToBePlayed:Z

    if-eqz v0, :cond_0

    .line 374
    invoke-direct {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->startVideoPlayback()V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 418
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 419
    const-string v0, "QuickStartGuideMain"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onResume called: mHideVideo="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsHolderCreated:Z

    if-eqz v0, :cond_0

    .line 422
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->hideTitleSummary()V

    .line 423
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v3}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 424
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 426
    :cond_0
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsFirstRun:Z

    if-eqz v0, :cond_1

    .line 427
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "oobe_display"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 429
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "device_provisioned"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 431
    :cond_1
    return-void
.end method

.method protected resetProgressBar()V
    .locals 3

    .prologue
    .line 322
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 323
    iget-object v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 324
    .local v1, image:Landroid/widget/ImageView;
    const v2, 0x7f020032

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 325
    if-nez v0, :cond_0

    .line 326
    const v2, 0x7f020033

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 322
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 329
    .end local v1           #image:Landroid/widget/ImageView;
    :cond_1
    return-void
.end method

.method public resizeSurfaceView()V
    .locals 9

    .prologue
    .line 535
    const-string v7, "QuickStartGuideMain"

    const-string v8, "resizeSurfaceView()"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    iget-boolean v7, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSetScreen:Z

    if-eqz v7, :cond_0

    .line 559
    :goto_0
    return-void

    .line 539
    :cond_0
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSetScreen:Z

    .line 541
    iget-object v7, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v7}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v6

    .line 542
    .local v6, videoW:I
    iget-object v7, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v7}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v4

    .line 543
    .local v4, videoH:I
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Display;->getWidth()I

    move-result v3

    .line 544
    .local v3, screenW:I
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Display;->getHeight()I

    move-result v1

    .line 545
    .local v1, screenH:I
    iget-object v7, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPreview:Landroid/view/SurfaceView;

    invoke-virtual {v7}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 547
    .local v0, lp:Landroid/view/ViewGroup$LayoutParams;
    int-to-float v7, v4

    int-to-float v8, v6

    div-float v5, v7, v8

    .line 548
    .local v5, videoScale:F
    int-to-float v7, v1

    int-to-float v8, v3

    div-float v2, v7, v8

    .line 549
    .local v2, screenScale:F
    cmpl-float v7, v2, v5

    if-lez v7, :cond_1

    .line 550
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 551
    int-to-float v7, v3

    mul-float/2addr v7, v5

    float-to-int v7, v7

    iput v7, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 552
    const-string v7, "QuickStartGuideMain"

    const-string v8, "screenScale > videoScale"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    :goto_1
    iget-object v7, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mPreview:Landroid/view/SurfaceView;

    invoke-virtual {v7, v0}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 554
    :cond_1
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 555
    int-to-float v7, v1

    div-float/2addr v7, v5

    float-to-int v7, v7

    iput v7, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 556
    const-string v7, "QuickStartGuideMain"

    const-string v8, "screenScale < videoScale"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .parameter "surfaceholder"
    .parameter "i"
    .parameter "j"
    .parameter "k"

    .prologue
    .line 380
    const-string v0, "QuickStartGuideMain"

    const-string v1, "surfaceChanged called"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3
    .parameter "holder"

    .prologue
    const/4 v2, 0x0

    .line 395
    const-string v0, "QuickStartGuideMain"

    const-string v1, "surfaceCreated called"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsHolderCreated:Z

    .line 398
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 399
    iput-object p1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHolder:Landroid/view/SurfaceHolder;

    .line 400
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 401
    iget v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 402
    iput v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    .line 403
    iget v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mCurrentStep:I

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->playVideo(I)V

    .line 414
    :cond_0
    :goto_0
    return-void

    .line 405
    :cond_1
    const-string v0, "QuickStartGuideMain"

    const-string v1, "surfaceCreated play video"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    iget-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mHideVideo:Z

    if-nez v0, :cond_0

    .line 407
    invoke-virtual {p0}, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->hideTitleSummary()V

    .line 408
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 409
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "surfaceholder"

    .prologue
    .line 386
    const-string v0, "QuickStartGuideMain"

    const-string v1, "surfaceDestroyed called"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mIsHolderCreated:Z

    .line 388
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 389
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 391
    :cond_0
    return-void
.end method

.method protected updateProgress(I)V
    .locals 3
    .parameter "step"

    .prologue
    .line 333
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mVideoTips:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 334
    iget-object v2, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mProgressBar:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 335
    .local v1, image:Landroid/widget/ImageView;
    const v2, 0x7f020032

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 336
    if-ne v0, p1, :cond_0

    .line 337
    const v2, 0x7f020033

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 339
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 333
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 341
    .end local v1           #image:Landroid/widget/ImageView;
    :cond_1
    return-void
.end method

.method protected updateTitleSummary(I)V
    .locals 2
    .parameter "index"

    .prologue
    .line 344
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mTitle:Landroid/widget/TextView;

    sget-object v1, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->TITLE:[I

    aget v1, v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 345
    iget-object v0, p0, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->mSummary:Landroid/widget/TextView;

    sget-object v1, Lcom/mediatek/oobe/qsg/QuickStartGuideMain;->SUMMARY:[I

    aget v1, v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 346
    return-void
.end method
