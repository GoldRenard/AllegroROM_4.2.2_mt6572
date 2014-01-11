.class public Lcom/mediatek/vt/VTManager;
.super Ljava/lang/Object;
.source "VTManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/vt/VTManager$TelMsgHandler;,
        Lcom/mediatek/vt/VTManager$VTHanlder;,
        Lcom/mediatek/vt/VTManager$State;
    }
.end annotation


# static fields
.field public static final QUIT_THREAD:I = 0x8000000

.field public static final RECORD_TYPE_AUDIO_ONLY:I = 0x2

.field public static final RECORD_TYPE_VIDEO_AUDIO:I = 0x1

.field public static final RECORD_TYPE_VIDEO_ONLY:I = 0x3

.field public static final SET_VT_CLOSE:I = 0x0

.field public static final SET_VT_OPEN:I = 0x1

.field public static final SET_VT_READY:I = 0x2

.field static final TAG:Ljava/lang/String; = "VTManager"

.field private static final VIDEO_TYPE_CAMERA:I = 0x0

.field private static final VIDEO_TYPE_IMAGE:I = 0x1

.field private static final VIDEO_TYPE_LAST_SHOT:I = 0x2

.field public static final VT_ERROR_CALL_DISCONNECT:I = 0x8001

.field public static final VT_ERROR_CAMERA:I = 0x8003

.field public static final VT_ERROR_MEDIA_RECORDER_COMPLETE:I = 0x8007

.field public static final VT_ERROR_MEDIA_RECORDER_EVENT_ERROR:I = 0x8006

.field public static final VT_ERROR_MEDIA_RECORDER_EVENT_INFO:I = 0x8005

.field public static final VT_ERROR_MEDIA_SERVER_DIED:I = 0x8004

.field public static final VT_ERROR_START_VTS_FAIL:I = 0x8002

.field public static final VT_MSG_CAM_BEGIN:I = 0x1000

.field public static final VT_MSG_CLOSE:I = 0x1

.field public static final VT_MSG_CONNECTED:I = 0x4

.field public static final VT_MSG_DISCONNECTED:I = 0x5

.field public static final VT_MSG_EM_INDICATION:I = 0x6

.field public static final VT_MSG_OPEN:I = 0x2

.field public static final VT_MSG_PEER_CAMERA_CLOSE:I = 0x10

.field public static final VT_MSG_PEER_CAMERA_OPEN:I = 0x9

.field public static final VT_MSG_READY:I = 0x3

.field public static final VT_MSG_RECEIVE_FIRSTFRAME:I = 0x8

.field public static final VT_MSG_RING:I = 0x7

.field public static final VT_MSG_START_COUNTER:I = 0x7

.field public static final VT_MSG_VTSTATUS:I = 0x6

.field public static final VT_NORMAL_END_SESSION_COMMAND:I = 0x8101

.field public static final VT_RET_FROM_JNI_FALSE:I = 0x1

.field public static final VT_RET_FROM_JNI_TRUE:I = 0x0

.field public static final VT_VQ_NORMAL:I = 0x1

.field public static final VT_VQ_SHARP:I = 0x0

.field public static final VT_VQ_SMOOTH:I = 0x2

.field private static sVTManager:Lcom/mediatek/vt/VTManager;


# instance fields
.field mCallManager:Ljava/lang/Object;

.field private mClosingVTService:Z

.field mContext:Landroid/content/Context;

.field private mDateTakenRecording:J

.field private mEnableReplacePeerVideo:I

.field private mEndCallLock:Ljava/lang/Integer;

.field private mInvokeHideMeBeforeOpen:Z

.field private mInvokeLockPeerVideoBeforeOpen:Z

.field private mRecordedFileName:Ljava/lang/String;

.field private mRecordedFilePath:Ljava/lang/String;

.field private mReplacePeerVideoPicturePath:Ljava/lang/String;

.field mSettings:Lcom/mediatek/vt/VTSettings;

.field private mSimId:I

.field private mStartVTSMALFail:Z

.field mState:Lcom/mediatek/vt/VTManager$State;

.field mTelMsgHandler:Landroid/os/Handler;

.field mTelMsgThread:Ljava/lang/Thread;

.field mVTListener:Landroid/os/Handler;

.field private mVTListenerLock:Ljava/lang/Integer;

.field mVTThread:Ljava/lang/Thread;

.field mVtHandler:Landroid/os/Handler;

.field private simSN:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 305
    new-instance v0, Lcom/mediatek/vt/VTManager;

    invoke-direct {v0}, Lcom/mediatek/vt/VTManager;-><init>()V

    sput-object v0, Lcom/mediatek/vt/VTManager;->sVTManager:Lcom/mediatek/vt/VTManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 311
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 124
    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    .line 142
    iput-object v3, p0, Lcom/mediatek/vt/VTManager;->mVTListener:Landroid/os/Handler;

    .line 145
    iput-object v3, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    .line 147
    iput-object v3, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    .line 149
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mVTListenerLock:Ljava/lang/Integer;

    .line 150
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mEndCallLock:Ljava/lang/Integer;

    .line 152
    iput-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mInvokeHideMeBeforeOpen:Z

    .line 153
    iput-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mInvokeLockPeerVideoBeforeOpen:Z

    .line 154
    iput-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mClosingVTService:Z

    .line 155
    iput-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mStartVTSMALFail:Z

    .line 162
    iput-object v3, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    .line 163
    iput-object v3, p0, Lcom/mediatek/vt/VTManager;->mRecordedFileName:Ljava/lang/String;

    .line 164
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/mediatek/vt/VTManager;->mDateTakenRecording:J

    .line 172
    const/4 v1, -0x1

    iput v1, p0, Lcom/mediatek/vt/VTManager;->mSimId:I

    .line 312
    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    .line 313
    new-instance v1, Lcom/mediatek/vt/VTSettings;

    invoke-direct {v1}, Lcom/mediatek/vt/VTSettings;-><init>()V

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    .line 317
    sget v1, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->simSN:[I

    .line 318
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v1, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-ge v0, v1, :cond_0

    .line 319
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->simSN:[I

    add-int/lit8 v2, v0, 0x0

    aput v2, v1, v0

    .line 318
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 322
    :cond_0
    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/vt/VTManager;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->simSN:[I

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/vt/VTManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/mediatek/vt/VTManager;->setVTCloseImpl()V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/vt/VTManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/mediatek/vt/VTManager;->setVTOpenImpl()V

    return-void
.end method

.method static synthetic access$500(Lcom/mediatek/vt/VTManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/mediatek/vt/VTManager;->setVTReadyImpl()V

    return-void
.end method

.method static synthetic access$600(Lcom/mediatek/vt/VTManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-boolean v0, p0, Lcom/mediatek/vt/VTManager;->mStartVTSMALFail:Z

    return v0
.end method

.method public static getInstance()Lcom/mediatek/vt/VTManager;
    .locals 1

    .prologue
    .line 308
    sget-object v0, Lcom/mediatek/vt/VTManager;->sVTManager:Lcom/mediatek/vt/VTManager;

    return-object v0
.end method

.method public static setEM(III)V
    .locals 0
    .parameter "item"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 965
    invoke-static {p0, p1, p2}, Lcom/mediatek/vt/VTelProvider;->setEM(III)V

    .line 966
    return-void
.end method

.method private setInvokeHideMeBeforeOpen(Z)V
    .locals 0
    .parameter "invokeHideMeBeforeOpen"

    .prologue
    .line 1192
    iput-boolean p1, p0, Lcom/mediatek/vt/VTManager;->mInvokeHideMeBeforeOpen:Z

    .line 1193
    return-void
.end method

.method private setInvokeLockPeerVideoBeforeOpen(Z)V
    .locals 0
    .parameter "invokeLockPeerVideoBeforeOpen"

    .prologue
    .line 1230
    iput-boolean p1, p0, Lcom/mediatek/vt/VTManager;->mInvokeLockPeerVideoBeforeOpen:Z

    .line 1231
    return-void
.end method

.method private declared-synchronized setVTCloseImpl()V
    .locals 6

    .prologue
    .line 459
    monitor-enter p0

    :try_start_0
    const-string v2, "VTManager"

    const-string v3, "=>setVTCloseImpl"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    :goto_0
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    sget-object v3, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v2, v3, :cond_0

    .line 462
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 463
    :catch_0
    move-exception v0

    .line 464
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_2
    const-string v2, "VTManager"

    const-string v3, "createThreads, wait error"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 473
    .end local v0           #e:Ljava/lang/InterruptedException;
    :cond_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/mediatek/vt/VTManager;->postEventToMMI(IIILjava/lang/Object;)V

    .line 476
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mClosingVTService:Z

    .line 478
    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mEndCallLock:Ljava/lang/Integer;

    monitor-enter v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 479
    :try_start_3
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->closeVTService()I

    move-result v1

    .line 480
    .local v1, ret:I
    if-eqz v1, :cond_1

    .line 481
    const-string v2, "VTManager"

    const-string v4, "setVTCloseImpl, error"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 490
    :goto_1
    monitor-exit p0

    return-void

    .line 484
    :cond_1
    :try_start_4
    sget-object v2, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iput-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    .line 485
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mStartVTSMALFail:Z

    .line 486
    const/4 v2, -0x1

    iput v2, p0, Lcom/mediatek/vt/VTManager;->mSimId:I

    .line 487
    const-string v2, "VTManager"

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v4}, Lcom/mediatek/vt/VTManager$State;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 489
    :try_start_5
    const-string v2, "VTManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<=setVTCloseImpl, mState = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v4}, Lcom/mediatek/vt/VTManager$State;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 459
    .end local v1           #ret:I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 488
    :catchall_1
    move-exception v2

    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
.end method

.method private declared-synchronized setVTOpenImpl()V
    .locals 5

    .prologue
    .line 370
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/mediatek/vt/VTManager;->mSimId:I

    invoke-static {v1}, Lcom/mediatek/vt/VTelProvider;->openVTService(I)I

    move-result v0

    .line 371
    .local v0, ret:I
    if-eqz v0, :cond_0

    .line 372
    const-string v1, "VTManager"

    const-string v2, "setVTOpenImpl, error"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 389
    :goto_0
    monitor-exit p0

    return-void

    .line 375
    :cond_0
    :try_start_1
    sget-object v1, Lcom/mediatek/vt/VTManager$State;->OPEN:Lcom/mediatek/vt/VTManager$State;

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    .line 377
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 378
    const-string v1, "VTManager"

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager$State;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    const-string v1, "VTManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/vt/VTManager;->mInvokeHideMeBeforeOpen:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    iget-boolean v1, p0, Lcom/mediatek/vt/VTManager;->mInvokeHideMeBeforeOpen:Z

    if-eqz v1, :cond_1

    .line 381
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->getVideoType()I

    move-result v1

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v2}, Lcom/mediatek/vt/VTSettings;->getImagePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mediatek/vt/VTManager;->setLocalVideoType(ILjava/lang/String;)V

    .line 383
    :cond_1
    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/mediatek/vt/VTManager;->postEventToMMI(IIILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 370
    .end local v0           #ret:I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized setVTReadyImpl()V
    .locals 6

    .prologue
    .line 406
    monitor-enter p0

    :try_start_0
    const-string v2, "VTManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setVTReadyImpl, mTelMsgHandler = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    const/4 v1, 0x0

    .line 408
    .local v1, ret:I
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v2}, Lcom/mediatek/vt/VTSettings;->getIsSwitch()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 409
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v2}, Lcom/mediatek/vt/VTSettings;->getPeerSurface()Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v3}, Lcom/mediatek/vt/VTSettings;->getLocalSurface()Landroid/view/SurfaceHolder;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/vt/VTelProvider;->initVTService(Landroid/view/Surface;Landroid/view/Surface;)I

    move-result v1

    .line 416
    :goto_0
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    if-nez v2, :cond_0

    .line 417
    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mTelMsgThread:Ljava/lang/Thread;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 419
    :try_start_1
    const-string v2, "VTManager"

    const-string v4, "setVTReadyImpl mTelMsgThread wait "

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 425
    :goto_1
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 427
    :cond_0
    if-eqz v1, :cond_2

    .line 428
    const/4 v2, 0x1

    :try_start_3
    iput-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mStartVTSMALFail:Z

    .line 429
    const-string v2, "VTManager"

    const-string v3, "setVTReadyImpl, error"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    monitor-enter v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 432
    :try_start_4
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 433
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 443
    :goto_2
    monitor-exit p0

    return-void

    .line 412
    :cond_1
    :try_start_5
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v2}, Lcom/mediatek/vt/VTSettings;->getLocalSurface()Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v3}, Lcom/mediatek/vt/VTSettings;->getPeerSurface()Landroid/view/SurfaceHolder;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/vt/VTelProvider;->initVTService(Landroid/view/Surface;Landroid/view/Surface;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result v1

    goto :goto_0

    .line 421
    :catch_0
    move-exception v0

    .line 422
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_6
    const-string v2, "VTManager"

    const-string v4, "setVTReadyImpl, wait error"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 425
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 406
    .end local v1           #ret:I
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 433
    .restart local v1       #ret:I
    :catchall_2
    move-exception v2

    :try_start_8
    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    throw v2

    .line 436
    :cond_2
    sget-object v2, Lcom/mediatek/vt/VTManager$State;->READY:Lcom/mediatek/vt/VTManager$State;

    iput-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    .line 437
    const-string v2, "VTManager"

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager$State;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v2}, Lcom/mediatek/vt/VTSettings;->getCameraSettings()V

    .line 439
    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/mediatek/vt/VTManager;->postEventToMMI(IIILjava/lang/Object;)V

    .line 440
    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    monitor-enter v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 441
    :try_start_a
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 442
    monitor-exit v3

    goto :goto_2

    :catchall_3
    move-exception v2

    monitor-exit v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    :try_start_b
    throw v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1
.end method


# virtual methods
.method public canDecBrightness()Z
    .locals 1

    .prologue
    .line 814
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->canDecBrightness()Z

    move-result v0

    return v0
.end method

.method public canDecContrast()Z
    .locals 1

    .prologue
    .line 862
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->canDecContrast()Z

    move-result v0

    return v0
.end method

.method public canDecZoom()Z
    .locals 1

    .prologue
    .line 838
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->canDecZoom()Z

    move-result v0

    return v0
.end method

.method public canIncBrightness()Z
    .locals 1

    .prologue
    .line 818
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->canIncBrightness()Z

    move-result v0

    return v0
.end method

.method public canIncContrast()Z
    .locals 1

    .prologue
    .line 866
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->canIncContrast()Z

    move-result v0

    return v0
.end method

.method public canIncZoom()Z
    .locals 1

    .prologue
    .line 842
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->canIncZoom()Z

    move-result v0

    return v0
.end method

.method createThreads()V
    .locals 4

    .prologue
    .line 184
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 185
    :cond_0
    const-string v1, "VTManager"

    const-string v2, "init error"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :goto_0
    return-void

    .line 189
    :cond_1
    new-instance v1, Lcom/mediatek/vt/VTManager$1;

    invoke-direct {v1, p0}, Lcom/mediatek/vt/VTManager$1;-><init>(Lcom/mediatek/vt/VTManager;)V

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    .line 203
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 205
    new-instance v1, Lcom/mediatek/vt/VTManager$2;

    invoke-direct {v1, p0}, Lcom/mediatek/vt/VTManager$2;-><init>(Lcom/mediatek/vt/VTManager;)V

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mTelMsgThread:Ljava/lang/Thread;

    .line 236
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    monitor-enter v2

    .line 237
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_2

    .line 239
    :try_start_1
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 245
    :cond_2
    :goto_1
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 247
    const-string v1, "VTManager"

    const-string v2, "mVtHandler.sendEmptyMessage()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 249
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mTelMsgThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_3
    const-string v1, "VTManager"

    const-string v3, "createThreads, wait error"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 245
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public decBrightness()Z
    .locals 2

    .prologue
    .line 822
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->decBrightness()Z

    move-result v0

    .line 823
    .local v0, ret:Z
    if-eqz v0, :cond_0

    .line 824
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 826
    :cond_0
    return v0
.end method

.method public decContrast()Z
    .locals 2

    .prologue
    .line 870
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->decContrast()Z

    move-result v0

    .line 871
    .local v0, ret:Z
    if-eqz v0, :cond_0

    .line 872
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 874
    :cond_0
    return v0
.end method

.method public decZoom()Z
    .locals 2

    .prologue
    .line 846
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->decZoom()Z

    move-result v0

    .line 847
    .local v0, ret:Z
    if-eqz v0, :cond_0

    .line 848
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 850
    :cond_0
    return v0
.end method

.method public deinit()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 332
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->joinThreads()V

    .line 333
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->deinit()V

    .line 334
    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mContext:Landroid/content/Context;

    .line 335
    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mCallManager:Ljava/lang/Object;

    .line 336
    return-void
.end method

.method public enableAlwaysAskSettings(I)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 1200
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enableAlwaysAskSettings in VTManager.java, flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1201
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->enableAlwaysAskSettings(I)I

    .line 1202
    return-void
.end method

.method public enableHideMe(I)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 1215
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enableHideMe in VTManager.java, flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1216
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->enableHideMe(I)I

    .line 1217
    return-void
.end method

.method public enableHideYou(I)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 1210
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enableHideYou in VTManager.java, flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1211
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->enableHideYou(I)I

    .line 1212
    return-void
.end method

.method public enlargeDisplaySurface(Z)V
    .locals 0
    .parameter "isEnlarge"

    .prologue
    .line 696
    return-void
.end method

.method public getCameraSensorCount()I
    .locals 5

    .prologue
    .line 934
    const/4 v0, 0x0

    .line 935
    .local v0, ret:I
    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mEndCallLock:Ljava/lang/Integer;

    monitor-enter v3

    .line 936
    :try_start_0
    sget-object v2, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v2, v4, :cond_0

    .line 937
    monitor-exit v3

    move v1, v0

    .line 941
    .end local v0           #ret:I
    .local v1, ret:I
    :goto_0
    return v1

    .line 939
    .end local v1           #ret:I
    .restart local v0       #ret:I
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->getCameraSensorCount()I

    move-result v0

    .line 940
    monitor-exit v3

    move v1, v0

    .line 941
    .end local v0           #ret:I
    .restart local v1       #ret:I
    goto :goto_0

    .line 940
    .end local v1           #ret:I
    .restart local v0       #ret:I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getColorEffect()Ljava/lang/String;
    .locals 1

    .prologue
    .line 886
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getColorEffect()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMute(Lcom/android/internal/telephony/Phone;)Z
    .locals 1
    .parameter "phone"

    .prologue
    .line 930
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->isMicrophoneOn()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNightMode()Z
    .locals 1

    .prologue
    .line 903
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getNightMode()Z

    move-result v0

    return v0
.end method

.method getParameters()V
    .locals 2

    .prologue
    .line 798
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->getParameters()Lcom/mediatek/vt/CameraParamters;

    move-result-object v1

    iput-object v1, v0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    .line 803
    return-void
.end method

.method public getSimId()I
    .locals 1

    .prologue
    .line 1238
    iget v0, p0, Lcom/mediatek/vt/VTManager;->mSimId:I

    return v0
.end method

.method public getState()Lcom/mediatek/vt/VTManager$State;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    return-object v0
.end method

.method public getSupportedColorEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 895
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getSupportedColorEffects()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getVideoQuality()I
    .locals 1

    .prologue
    .line 922
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getVideoQuality()I

    move-result v0

    return v0
.end method

.method public getmVTListener()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mVTListener:Landroid/os/Handler;

    return-object v0
.end method

.method public incBrightness()Z
    .locals 2

    .prologue
    .line 830
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->incBrightness()Z

    move-result v0

    .line 831
    .local v0, ret:Z
    if-eqz v0, :cond_0

    .line 832
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 834
    :cond_0
    return v0
.end method

.method public incContrast()Z
    .locals 2

    .prologue
    .line 878
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->incContrast()Z

    move-result v0

    .line 879
    .local v0, ret:Z
    if-eqz v0, :cond_0

    .line 880
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 882
    :cond_0
    return v0
.end method

.method public incZoom()Z
    .locals 2

    .prologue
    .line 854
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->incZoom()Z

    move-result v0

    .line 855
    .local v0, ret:Z
    if-eqz v0, :cond_0

    .line 856
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 858
    :cond_0
    return v0
.end method

.method public incomingVTCall(I)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 1225
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "incomingVTCall in VTManager.java, flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1226
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->incomingVTCall(I)I

    .line 1227
    return-void
.end method

.method public incomingVideoDispaly(I)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 1220
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "incomingVideoDispaly in VTManager.java, flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1221
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->incomingVideoDispaly(I)I

    .line 1222
    return-void
.end method

.method public init(Landroid/content/Context;Ljava/lang/Object;)V
    .locals 1
    .parameter "context"
    .parameter "callManager"

    .prologue
    .line 325
    iput-object p1, p0, Lcom/mediatek/vt/VTManager;->mContext:Landroid/content/Context;

    .line 326
    iput-object p2, p0, Lcom/mediatek/vt/VTManager;->mCallManager:Ljava/lang/Object;

    .line 327
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/VTSettings;->init(Landroid/content/Context;)V

    .line 328
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->createThreads()V

    .line 329
    return-void
.end method

.method public isInvokeHideMeBeforeOpen()Z
    .locals 1

    .prologue
    .line 1188
    iget-boolean v0, p0, Lcom/mediatek/vt/VTManager;->mInvokeHideMeBeforeOpen:Z

    return v0
.end method

.method public isInvokeLockPeerVideoBeforeOpenn()Z
    .locals 1

    .prologue
    .line 1196
    iget-boolean v0, p0, Lcom/mediatek/vt/VTManager;->mInvokeLockPeerVideoBeforeOpen:Z

    return v0
.end method

.method public isSpeakerOn(Landroid/content/Context;)Z
    .locals 5
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 954
    const/4 v0, 0x0

    .line 955
    .local v0, result:Z
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mEndCallLock:Ljava/lang/Integer;

    monitor-enter v2

    .line 956
    :try_start_0
    sget-object v3, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v3, v4, :cond_0

    .line 957
    monitor-exit v2

    .line 961
    :goto_0
    return v1

    .line 959
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->isSpeakerOn()I

    move-result v3

    if-nez v3, :cond_1

    move v0, v1

    .line 960
    :goto_1
    monitor-exit v2

    move v1, v0

    .line 961
    goto :goto_0

    .line 959
    :cond_1
    const/4 v0, 0x1

    goto :goto_1

    .line 960
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isSupportNightMode()Z
    .locals 1

    .prologue
    .line 899
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->isSupportNightMode()Z

    move-result v0

    return v0
.end method

.method joinThreads()V
    .locals 7

    .prologue
    const/high16 v6, 0x800

    const/4 v5, 0x0

    .line 254
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget v2, Lcom/android/internal/telephony/PhoneConstants;->GEMINI_SIM_NUM:I

    if-ge v1, v2, :cond_0

    .line 255
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mCallManager:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->simSN:[I

    aget v4, v4, v1

    invoke-virtual {v2, v3, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForVtStatusInfoGemini(Landroid/os/Handler;I)V

    .line 256
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mCallManager:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/gemini/MTKCallManager;

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->simSN:[I

    aget v4, v4, v1

    invoke-virtual {v2, v3, v4}, Lcom/android/internal/telephony/gemini/MTKCallManager;->unregisterForVtRingInfoGemini(Landroid/os/Handler;I)V

    .line 254
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 268
    :cond_0
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    invoke-virtual {v2, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 270
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    if-nez v2, :cond_1

    .line 271
    const-string v2, "VTManager"

    const-string v3, "null == mTelMsgHandler in joinThreads()"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    :goto_1
    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    monitor-enter v3

    .line 282
    :try_start_0
    const-string v2, "VTManager"

    const-string v4, "mTelMsgHandler notify in joinThreads()"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalMonitorStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    :goto_2
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 291
    :try_start_2
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->join()V

    .line 292
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    .line 297
    :goto_3
    iput-object v5, p0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    .line 298
    iput-object v5, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    .line 300
    iput-object v5, p0, Lcom/mediatek/vt/VTManager;->mTelMsgThread:Ljava/lang/Thread;

    .line 301
    iput-object v5, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    .line 303
    return-void

    .line 273
    :cond_1
    const-string v2, "VTManager"

    const-string v3, "null != mTelMsgHandler in joinThreads()"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    invoke-virtual {v2, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_1

    .line 284
    :catch_0
    move-exception v0

    .line 285
    .local v0, e:Ljava/lang/IllegalMonitorStateException;
    :try_start_3
    const-string v2, "VTManager"

    const-string v4, "mTelMsgHandler notify in joinThreads(), wait error"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    invoke-virtual {v0}, Ljava/lang/IllegalMonitorStateException;->printStackTrace()V

    goto :goto_2

    .line 288
    .end local v0           #e:Ljava/lang/IllegalMonitorStateException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 293
    :catch_1
    move-exception v0

    .line 294
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v2, "VTManager"

    const-string v3, "joinThreads error"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3
.end method

.method public lockPeerVideo()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1041
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v1, :cond_0

    .line 1042
    const-string v0, "VTManager"

    const-string v1, "lockPeerVideo, vtmanager state error"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1043
    invoke-direct {p0, v2}, Lcom/mediatek/vt/VTManager;->setInvokeLockPeerVideoBeforeOpen(Z)V

    .line 1044
    invoke-static {v2}, Lcom/mediatek/vt/VTelProvider;->setInvokeLockPeerVideoBeforeOpen(I)I

    .line 1048
    :goto_0
    return-void

    .line 1047
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->lockPeerVideo()I

    goto :goto_0
.end method

.method public declared-synchronized onConnected()V
    .locals 6

    .prologue
    .line 493
    monitor-enter p0

    :try_start_0
    const-string v2, "VTManager"

    const-string v3, "=>onConnected"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 501
    invoke-static {}, Lcom/android/internal/telephony/CallManager;->getInstance()Lcom/android/internal/telephony/CallManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    .line 503
    .local v1, state:Lcom/android/internal/telephony/PhoneConstants$State;
    const-string v2, "VTManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "after received connected callback PhoneState="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_1

    .line 505
    const-string v2, "VTManager"

    const-string v3, "onConnected:State error, receive onConnected while phone state is IDLE"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    const-string v2, "VTManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PhoneState = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 533
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 510
    :cond_1
    :try_start_1
    sget-object v2, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-eq v2, v3, :cond_0

    .line 513
    sget-object v2, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v2, v3, :cond_2

    .line 514
    const-string v2, "VTManager"

    const-string v3, "onConnected, error"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 493
    .end local v1           #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 524
    .restart local v1       #state:Lcom/android/internal/telephony/PhoneConstants$State;
    :cond_2
    :try_start_2
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->startVTService()I

    move-result v0

    .line 525
    .local v0, ret:I
    if-eqz v0, :cond_3

    .line 526
    const-string v2, "VTManager"

    const-string v3, "onConnected, error"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 529
    :cond_3
    sget-object v2, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    iput-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    .line 530
    const-string v2, "VTManager"

    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager$State;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/mediatek/vt/VTManager;->postEventToMMI(IIILjava/lang/Object;)V

    .line 532
    const-string v2, "VTManager"

    const-string v3, "<=onConnected"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public onDisconnected()V
    .locals 2

    .prologue
    .line 536
    const-string v0, "VTManager"

    const-string v1, "pre-onDisconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->setEndCallFlag()V

    .line 538
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->onDisconnectedActual()V

    .line 539
    return-void
.end method

.method public declared-synchronized onDisconnectedActual()V
    .locals 5

    .prologue
    .line 542
    monitor-enter p0

    :try_start_0
    const-string v1, "VTManager"

    const-string v2, "onDisconnected"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 543
    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-eq v1, v2, :cond_0

    .line 544
    const-string v1, "VTManager"

    const-string v2, "onDisconnected, VT Manager state error"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 556
    :goto_0
    monitor-exit p0

    return-void

    .line 547
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->stopVTService()I

    move-result v0

    .line 548
    .local v0, ret:I
    if-eqz v0, :cond_1

    .line 549
    const-string v1, "VTManager"

    const-string v2, "onDisconnected, error"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 542
    .end local v0           #ret:I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 552
    .restart local v0       #ret:I
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 553
    sget-object v1, Lcom/mediatek/vt/VTManager$State;->READY:Lcom/mediatek/vt/VTManager$State;

    iput-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    .line 554
    const-string v1, "VTManager"

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v2}, Lcom/mediatek/vt/VTManager$State;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 555
    const/4 v1, 0x5

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/mediatek/vt/VTManager;->postEventToMMI(IIILjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public onUserInput(Ljava/lang/String;)V
    .locals 2
    .parameter "input"

    .prologue
    .line 1028
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v1, :cond_0

    .line 1029
    const-string v0, "VTManager"

    const-string v1, "onUserInput, vtmanager state error"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1033
    :goto_0
    return-void

    .line 1032
    :cond_0
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->onUserInput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method postEventFromNative(IIILjava/lang/Object;)V
    .locals 3
    .parameter "what"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "obj"

    .prologue
    .line 1018
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "postEventFromNative ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1019
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/mediatek/vt/VTManager;->postEventToMMI(IIILjava/lang/Object;)V

    .line 1020
    return-void
.end method

.method postEventToMMI(IIILjava/lang/Object;)V
    .locals 4
    .parameter "what"
    .parameter "arg1"
    .parameter "arg2"
    .parameter "obj"

    .prologue
    .line 1004
    iget-boolean v0, p0, Lcom/mediatek/vt/VTManager;->mClosingVTService:Z

    if-eqz v0, :cond_0

    const v0, 0x8001

    if-ne v0, p1, :cond_0

    .line 1015
    :goto_0
    return-void

    .line 1007
    :cond_0
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVTListenerLock:Ljava/lang/Integer;

    monitor-enter v1

    .line 1008
    :try_start_0
    const-string v0, "VTManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "postEventToMMI ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1009
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mVTListener:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 1010
    const-string v0, "VTManager"

    const-string v2, "error postEventToMMI"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1014
    :goto_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1012
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mVTListener:Landroid/os/Handler;

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mVTListener:Landroid/os/Handler;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public registerVTListener(Landroid/os/Handler;)V
    .locals 2
    .parameter "h"

    .prologue
    .line 582
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVTListenerLock:Ljava/lang/Integer;

    monitor-enter v1

    .line 583
    :try_start_0
    iput-object p1, p0, Lcom/mediatek/vt/VTManager;->mVTListener:Landroid/os/Handler;

    .line 584
    monitor-exit v1

    .line 585
    return-void

    .line 584
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public replacePeerVideoSettings(ILjava/lang/String;)V
    .locals 2
    .parameter "bEnableReplacePeerVideo"
    .parameter "sReplacePeerVideoPicturePath"

    .prologue
    .line 176
    const-string v0, "VTManager"

    const-string v1, "replacePeerVideoSettings"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    iput p1, p0, Lcom/mediatek/vt/VTManager;->mEnableReplacePeerVideo:I

    .line 178
    iput-object p2, p0, Lcom/mediatek/vt/VTManager;->mReplacePeerVideoPicturePath:Ljava/lang/String;

    .line 179
    invoke-static {p1, p2}, Lcom/mediatek/vt/VTelProvider;->replacePeerVideoSettings(ILjava/lang/String;)I

    .line 181
    return-void
.end method

.method public savePeerPhoto()Z
    .locals 15

    .prologue
    .line 750
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 753
    .local v2, dateTaken:J
    new-instance v13, Ljava/text/SimpleDateFormat;

    const-string v14, "yyyy-MM-dd kk.mm.ss.SSS"

    invoke-direct {v13, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    .line 754
    .local v8, name:Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".png"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 755
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v13

    invoke-virtual {v13}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 757
    .local v0, cameraImageBucketName:Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "/DCIM/Camera/IMG_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 759
    .local v9, path:Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "/DCIM/Camera/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v6, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 761
    .local v6, imageDirectory:Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 763
    const/4 v13, 0x0

    invoke-static {v13, v9}, Lcom/mediatek/vt/VTelProvider;->snapshot(ILjava/lang/String;)I

    move-result v5

    .line 764
    .local v5, flag:I
    if-eqz v5, :cond_0

    .line 765
    const-string v13, "VTManager"

    const-string v14, "***snapshot() fail in Manager layer***"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 766
    const/4 v13, 0x0

    .line 794
    :goto_0
    return v13

    .line 770
    :cond_0
    iget-object v13, p0, Lcom/mediatek/vt/VTManager;->mContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 771
    .local v1, cr:Landroid/content/ContentResolver;
    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 772
    .local v12, values:Landroid/content/ContentValues;
    const-string v13, "title"

    invoke-virtual {v12, v13, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    const-string v13, "_display_name"

    invoke-virtual {v12, v13, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 774
    const-string v13, "datetaken"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 775
    const-string v13, "mime_type"

    const-string v14, "image/png"

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 776
    const-string v13, "orientation"

    const/4 v14, 0x0

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 778
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 779
    .local v7, imageFile:Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_1

    .line 780
    const-string v13, "VTManager"

    const-string v14, "***image_File does not exist in Manager layer***"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 781
    const/4 v13, 0x0

    goto :goto_0

    .line 783
    :cond_1
    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v10

    .line 784
    .local v10, size:J
    const-string v13, "_size"

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 785
    const-string v13, "_data"

    invoke-virtual {v12, v13, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 786
    const-string v13, "VTManager"

    invoke-virtual {v12}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 789
    :try_start_0
    sget-object v13, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v13, v12}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 794
    const/4 v13, 0x1

    goto :goto_0

    .line 790
    :catch_0
    move-exception v4

    .line 791
    .local v4, e:Ljava/lang/Exception;
    const-string v13, "VTManager"

    const-string v14, "insert fail in savePeerPhoto()"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 792
    const/4 v13, 0x0

    goto :goto_0
.end method

.method public setColorEffect(Ljava/lang/String;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 890
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/VTSettings;->setColorEffect(Ljava/lang/String;)V

    .line 891
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 892
    return-void
.end method

.method public setDisplay(Landroid/view/SurfaceHolder;Landroid/view/SurfaceHolder;)V
    .locals 3
    .parameter "local"
    .parameter "peer"

    .prologue
    .line 675
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisplay "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/VTSettings;->setLocalSurface(Landroid/view/SurfaceHolder;)V

    .line 677
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p2}, Lcom/mediatek/vt/VTSettings;->setPeerSurface(Landroid/view/SurfaceHolder;)V

    .line 678
    return-void
.end method

.method public setLocalVideoType(ILjava/lang/String;)V
    .locals 4
    .parameter "videoType"
    .parameter "path"

    .prologue
    const/4 v3, 0x1

    .line 721
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLocalVideoType, closingVTService = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/vt/VTManager;->mClosingVTService:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " videoType = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " path = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 722
    if-nez p2, :cond_0

    .line 723
    const-string v0, "VTManager"

    const-string v1, "setLocalVideoType, path is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 725
    :cond_0
    iget-boolean v0, p0, Lcom/mediatek/vt/VTManager;->mClosingVTService:Z

    if-eqz v0, :cond_2

    .line 726
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mEndCallLock:Ljava/lang/Integer;

    monitor-enter v1

    .line 727
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/VTSettings;->setVideoType(I)V

    .line 728
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p2}, Lcom/mediatek/vt/VTSettings;->setImagePath(Ljava/lang/String;)V

    .line 729
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v2, :cond_1

    .line 730
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/vt/VTManager;->setInvokeHideMeBeforeOpen(Z)V

    .line 731
    monitor-exit v1

    .line 744
    :goto_0
    return-void

    .line 733
    :cond_1
    invoke-static {p1, p2}, Lcom/mediatek/vt/VTelProvider;->setLocalVideoType(ILjava/lang/String;)V

    .line 734
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 736
    :cond_2
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/VTSettings;->setVideoType(I)V

    .line 737
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p2}, Lcom/mediatek/vt/VTSettings;->setImagePath(Ljava/lang/String;)V

    .line 738
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v1, :cond_3

    .line 739
    invoke-direct {p0, v3}, Lcom/mediatek/vt/VTManager;->setInvokeHideMeBeforeOpen(Z)V

    goto :goto_0

    .line 742
    :cond_3
    invoke-static {p1, p2}, Lcom/mediatek/vt/VTelProvider;->setLocalVideoType(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public setMute(Lcom/android/internal/telephony/Phone;Z)V
    .locals 1
    .parameter "phone"
    .parameter "muted"

    .prologue
    .line 926
    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/mediatek/vt/VTelProvider;->turnOnMicrophone(I)V

    .line 927
    return-void

    .line 926
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setNightMode(Z)V
    .locals 1
    .parameter "isOn"

    .prologue
    .line 907
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/VTSettings;->setNightMode(Z)V

    .line 908
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->setParameters()V

    .line 909
    return-void
.end method

.method setParameters()V
    .locals 1

    .prologue
    .line 807
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    iget-object v0, v0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-static {v0}, Lcom/mediatek/vt/VTelProvider;->setParameters(Lcom/mediatek/vt/CameraParamters;)V

    .line 808
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    iget-object v0, v0, Lcom/mediatek/vt/VTSettings;->mCameraParamters:Lcom/mediatek/vt/CameraParamters;

    invoke-static {v0}, Lcom/mediatek/vt/VTelProvider;->updateParameters(Lcom/mediatek/vt/CameraParamters;)Lcom/mediatek/vt/CameraParamters;

    .line 811
    return-void
.end method

.method public setVTClose()V
    .locals 2

    .prologue
    .line 449
    const-string v0, "VTManager"

    const-string v1, "setVTClose"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v1, :cond_0

    .line 451
    const-string v0, "VTManager"

    const-string v1, "setVTCloseImpl, error"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    :goto_0
    return-void

    .line 454
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 455
    invoke-virtual {p0}, Lcom/mediatek/vt/VTManager;->deinit()V

    goto :goto_0
.end method

.method public declared-synchronized setVTDisconnect()V
    .locals 2

    .prologue
    .line 559
    monitor-enter p0

    :try_start_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 560
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x6

    iput v1, v0, Landroid/os/Message;->what:I

    .line 561
    const/4 v1, 0x0

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 563
    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 564
    const/4 v1, 0x0

    iput v1, v0, Landroid/os/Message;->arg2:I

    .line 565
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 566
    monitor-exit p0

    return-void

    .line 559
    .end local v0           #msg:Landroid/os/Message;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setVTOpen(Landroid/content/Context;Ljava/lang/Object;)V
    .locals 2
    .parameter "context"
    .parameter "callManager"

    .prologue
    .line 343
    const-string v0, "VTManager"

    const-string v1, "setVTOpen failed, old interface used"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    return-void
.end method

.method public setVTOpen(Landroid/content/Context;Ljava/lang/Object;I)V
    .locals 3
    .parameter "context"
    .parameter "callManager"
    .parameter "simId"

    .prologue
    .line 352
    const-string v0, "VTManager"

    const-string v1, "setVTOpen"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v1, :cond_0

    .line 354
    const-string v0, "VTManager"

    const-string v1, "setVTOpen, mState != State.CLOSE"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    :goto_0
    return-void

    .line 362
    :cond_0
    iput p3, p0, Lcom/mediatek/vt/VTManager;->mSimId:I

    .line 363
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "simID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/vt/VTManager;->mSimId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    invoke-virtual {p0, p1, p2}, Lcom/mediatek/vt/VTManager;->init(Landroid/content/Context;Ljava/lang/Object;)V

    .line 366
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/vt/VTManager;->mClosingVTService:Z

    goto :goto_0
.end method

.method public declared-synchronized setVTReady()V
    .locals 3

    .prologue
    .line 395
    monitor-enter p0

    :try_start_0
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setVTReady, mVtHandler = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->OPEN:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v1, :cond_1

    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v1, :cond_1

    .line 397
    const-string v0, "VTManager"

    const-string v1, "setVTReadyImpl, error"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 403
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 400
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 401
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 395
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setVTVisible(Z)V
    .locals 4
    .parameter "isVisible"

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 973
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v2, :cond_0

    .line 1001
    :goto_0
    return-void

    .line 976
    :cond_0
    if-nez p1, :cond_1

    .line 977
    const/4 v2, 0x0

    move-object v0, v1

    check-cast v0, Landroid/view/Surface;

    check-cast v1, Landroid/view/Surface;

    invoke-static {v2, v0, v1}, Lcom/mediatek/vt/VTelProvider;->setVTVisible(ILandroid/view/Surface;Landroid/view/Surface;)I

    goto :goto_0

    .line 979
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    if-nez v0, :cond_2

    .line 980
    const-string v0, "VTManager"

    const-string v1, "error setVTVisible, null == mSettings"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 983
    :cond_2
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getPeerSurface()Landroid/view/SurfaceHolder;

    move-result-object v0

    if-nez v0, :cond_3

    .line 984
    const-string v0, "VTManager"

    const-string v1, "error setVTVisible, null == getPeerSurface"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 987
    :cond_3
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getPeerSurface()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    if-nez v0, :cond_4

    .line 988
    const-string v0, "VTManager"

    const-string v1, "error setVTVisible, null == getSurface"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 992
    :cond_4
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getIsSwitch()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 993
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getPeerSurface()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->getLocalSurface()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/mediatek/vt/VTelProvider;->setVTVisible(ILandroid/view/Surface;Landroid/view/Surface;)I

    goto :goto_0

    .line 996
    :cond_5
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getLocalSurface()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v1}, Lcom/mediatek/vt/VTSettings;->getPeerSurface()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-static {v3, v0, v1}, Lcom/mediatek/vt/VTelProvider;->setVTVisible(ILandroid/view/Surface;Landroid/view/Surface;)I

    goto :goto_0
.end method

.method public setVideoQuality(I)V
    .locals 1
    .parameter "quality"

    .prologue
    .line 917
    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0, p1}, Lcom/mediatek/vt/VTSettings;->setVideoQuality(I)V

    .line 918
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->setPeerVideo(I)V

    .line 919
    return-void
.end method

.method public startRecording(IJ)I
    .locals 11
    .parameter "type"
    .parameter "maxSize"

    .prologue
    const/4 v10, 0x1

    .line 1068
    const-string v7, "VTManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "startRecording() in VTManager.java, type is: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "maxSize = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1069
    const/4 v2, 0x0

    .line 1072
    .local v2, ret:I
    sget-object v7, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v8, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v7, v8, :cond_0

    .line 1073
    const-string v7, "VTManager"

    const-string v8, "startRecording() in VTManager.java, State=CLOSE"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1127
    .end local v2           #ret:I
    .local v3, ret:I
    :goto_0
    return v3

    .line 1078
    .end local v3           #ret:I
    .restart local v2       #ret:I
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1080
    .local v0, cameraImageBucketName:Ljava/lang/String;
    const-string v7, "VTManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "cameraImageBucketName is: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/mediatek/vt/VTManager;->mDateTakenRecording:J

    .line 1084
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v8, "yyyy-MM-dd_kk.mm.ss.SSS"

    invoke-direct {v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iget-wide v8, p0, Lcom/mediatek/vt/VTManager;->mDateTakenRecording:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1088
    .local v6, timeSuffix:Ljava/lang/String;
    if-ne v10, p1, :cond_1

    .line 1089
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Video_and_Audio_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/vt/VTManager;->mRecordedFileName:Ljava/lang/String;

    .line 1100
    :goto_1
    new-instance v4, Ljava/io/File;

    invoke-static {}, Lcom/mediatek/storage/StorageManagerEx;->getDefaultPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1102
    .local v4, sampleDir:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->canWrite()Z

    move-result v7

    if-nez v7, :cond_4

    .line 1103
    const-string v7, "VTManager"

    const-string v8, "----- file can\'t write!! ---"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1104
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/PhoneRecord/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/vt/VTManager;->mRecordedFileName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".3gp"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    .line 1106
    const-string v7, "VTManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "recordedFileName is: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1109
    new-instance v1, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/PhoneRecord/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1110
    .local v1, recordDirectory:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 1121
    .end local v1           #recordDirectory:Ljava/io/File;
    :goto_2
    iget-object v7, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    invoke-static {p1, v7, p2, p3}, Lcom/mediatek/vt/VTelProvider;->startRecording(ILjava/lang/String;J)I

    move-result v2

    .line 1122
    if-ne v10, v2, :cond_6

    .line 1123
    const-string v7, "VTManager"

    const-string v8, "VT_RET_FROM_JNI_FALSE == ret in startRecording() in VTManager.java"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1124
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto/16 :goto_0

    .line 1090
    .end local v3           #ret:I
    .end local v4           #sampleDir:Ljava/io/File;
    .restart local v2       #ret:I
    :cond_1
    const/4 v7, 0x2

    if-ne v7, p1, :cond_2

    .line 1091
    const-string v7, "VTManager"

    const-string v8, "type is wrong in startRecording() in VTManager.java"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1092
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto/16 :goto_0

    .line 1093
    .end local v3           #ret:I
    .restart local v2       #ret:I
    :cond_2
    const/4 v7, 0x3

    if-ne v7, p1, :cond_3

    .line 1094
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Only_Peer_Video_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/vt/VTManager;->mRecordedFileName:Ljava/lang/String;

    goto/16 :goto_1

    .line 1096
    :cond_3
    const-string v7, "VTManager"

    const-string v8, "type is wrong in startRecording() in VTManager.java"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1097
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto/16 :goto_0

    .line 1112
    .end local v3           #ret:I
    .restart local v2       #ret:I
    .restart local v4       #sampleDir:Ljava/io/File;
    :cond_4
    new-instance v5, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/PhoneRecord"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1113
    .end local v4           #sampleDir:Ljava/io/File;
    .local v5, sampleDir:Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_5

    .line 1114
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 1116
    :cond_5
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/vt/VTManager;->mRecordedFileName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".3gp"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    .line 1117
    const-string v7, "VTManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "recordedFileName is: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v5

    .end local v5           #sampleDir:Ljava/io/File;
    .restart local v4       #sampleDir:Ljava/io/File;
    goto/16 :goto_2

    :cond_6
    move v3, v2

    .line 1127
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto/16 :goto_0
.end method

.method public stopRecording(I)I
    .locals 12
    .parameter "type"

    .prologue
    const/4 v11, 0x1

    .line 1131
    const-string v8, "VTManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "stopRecording() in VTManager.java, type is: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1132
    const/4 v2, 0x0

    .line 1134
    .local v2, ret:I
    sget-object v8, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v9, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v8, v9, :cond_0

    .line 1135
    const-string v8, "VTManager"

    const-string v9, "stopRecording() in VTManager.java, State=CLOSE"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1184
    .end local v2           #ret:I
    .local v3, ret:I
    :goto_0
    return v3

    .line 1139
    .end local v3           #ret:I
    .restart local v2       #ret:I
    :cond_0
    if-eq v11, p1, :cond_1

    const/4 v8, 0x3

    if-eq v8, p1, :cond_1

    .line 1140
    const-string v8, "VTManager"

    const-string v9, "stopRecording() in VTManager.java, type is wrong"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1141
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto :goto_0

    .line 1144
    .end local v3           #ret:I
    .restart local v2       #ret:I
    :cond_1
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->stopRecording(I)I

    move-result v2

    .line 1145
    if-ne v11, v2, :cond_2

    .line 1146
    const-string v8, "VTManager"

    const-string v9, "VT_RET_FROM_JNI_FALSE == ret in stopRecording() in VTManager.java"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1147
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto :goto_0

    .line 1151
    .end local v3           #ret:I
    .restart local v2       #ret:I
    :cond_2
    iget-object v8, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    if-nez v8, :cond_3

    .line 1152
    const-string v8, "VTManager"

    const-string v9, "null == recordedFilePath in stopRecording() in VTManager.java"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v2

    .line 1153
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto :goto_0

    .line 1155
    .end local v3           #ret:I
    .restart local v2       #ret:I
    :cond_3
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1156
    .local v7, videoFile:Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_4

    .line 1157
    const-string v8, "VTManager"

    const-string v9, "***video_File does not exist in stopRecording()***"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1160
    :cond_4
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 1161
    .local v6, values:Landroid/content/ContentValues;
    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 1162
    .local v4, size:J
    const-string v8, "title"

    iget-object v9, p0, Lcom/mediatek/vt/VTManager;->mRecordedFileName:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1163
    const-string v8, "_display_name"

    iget-object v9, p0, Lcom/mediatek/vt/VTManager;->mRecordedFileName:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1164
    const-string v8, "datetaken"

    iget-wide v9, p0, Lcom/mediatek/vt/VTManager;->mDateTakenRecording:J

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1165
    const-string v8, "mime_type"

    const-string v9, "video/3gpp"

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1166
    const-string v8, "_size"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1167
    const-string v8, "_data"

    iget-object v9, p0, Lcom/mediatek/vt/VTManager;->mRecordedFilePath:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1169
    iget-object v8, p0, Lcom/mediatek/vt/VTManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1177
    .local v0, cr:Landroid/content/ContentResolver;
    :try_start_0
    sget-object v8, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v8, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 1178
    iget-object v8, p0, Lcom/mediatek/vt/VTManager;->mContext:Landroid/content/Context;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-virtual {v7}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v8, v9, v10, v11}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    move v3, v2

    .line 1184
    .end local v2           #ret:I
    .restart local v3       #ret:I
    goto/16 :goto_0

    .line 1180
    .end local v3           #ret:I
    .restart local v2       #ret:I
    :catch_0
    move-exception v1

    .line 1181
    .local v1, e:Ljava/lang/Exception;
    const-string v8, "VTManager"

    const-string v9, "insert fail in stopRecording()"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public switchCamera()Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 702
    const/4 v0, 0x0

    .line 703
    .local v0, ret:I
    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mEndCallLock:Ljava/lang/Integer;

    monitor-enter v2

    .line 705
    :try_start_0
    sget-object v3, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v4, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v3, v4, :cond_1

    .line 706
    monitor-exit v2

    .line 711
    :cond_0
    :goto_0
    return v1

    .line 708
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->switchCamera()I

    move-result v0

    .line 709
    iget-object v3, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v3}, Lcom/mediatek/vt/VTSettings;->getCameraSettings()V

    .line 710
    monitor-exit v2

    .line 711
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    .line 710
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public switchDisplaySurface()V
    .locals 2

    .prologue
    .line 684
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->READY:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-eq v0, v1, :cond_0

    .line 685
    const-string v0, "VTManager"

    const-string v1, "switchDisplaySurface, error"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    :goto_0
    return-void

    .line 688
    :cond_0
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    iget-object v0, p0, Lcom/mediatek/vt/VTManager;->mSettings:Lcom/mediatek/vt/VTSettings;

    invoke-virtual {v0}, Lcom/mediatek/vt/VTSettings;->getIsSwitch()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v1, v0}, Lcom/mediatek/vt/VTSettings;->setIsSwitch(Z)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public turnOnSpeaker(Z)V
    .locals 3
    .parameter "isOn"

    .prologue
    .line 945
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mEndCallLock:Ljava/lang/Integer;

    monitor-enter v1

    .line 946
    :try_start_0
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v2, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v2, :cond_0

    .line 947
    monitor-exit v1

    .line 951
    :goto_0
    return-void

    .line 949
    :cond_0
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/mediatek/vt/VTelProvider;->turnOnSpeaker(I)V

    .line 950
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 949
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public unlockPeerVideo()V
    .locals 2

    .prologue
    .line 1056
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v0, v1, :cond_0

    .line 1057
    const-string v0, "VTManager"

    const-string v1, "unlockPeerVideo, vtmanager state error"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1061
    :goto_0
    return-void

    .line 1060
    :cond_0
    invoke-static {}, Lcom/mediatek/vt/VTelProvider;->unlockPeerVideo()I

    goto :goto_0
.end method

.method public unregisterVTListener()V
    .locals 2

    .prologue
    .line 588
    iget-object v1, p0, Lcom/mediatek/vt/VTManager;->mVTListenerLock:Ljava/lang/Integer;

    monitor-enter v1

    .line 589
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/mediatek/vt/VTManager;->mVTListener:Landroid/os/Handler;

    .line 590
    monitor-exit v1

    .line 591
    return-void

    .line 590
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public userSelectYes(I)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 1205
    const-string v0, "VTManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "userSelectYes in VTManager.java, flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1206
    invoke-static {p1}, Lcom/mediatek/vt/VTelProvider;->userSelectYes(I)I

    .line 1207
    return-void
.end method
