.class public Lcom/android/internal/policy/impl/keyguard/FaceUnlock;
.super Ljava/lang/Object;
.source "FaceUnlock.java"

# interfaces
.implements Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;
.implements Landroid/os/Handler$Callback;


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "FULLockscreen"


# instance fields
.field private final BACKUP_LOCK_TIMEOUT:I

.field private final MSG_CANCEL:I

.field private final MSG_POKE_WAKELOCK:I

.field private final MSG_REPORT_FAILED_ATTEMPT:I

.field private final MSG_SERVICE_CONNECTED:I

.field private final MSG_SERVICE_DISCONNECTED:I

.field private final MSG_UNLOCK:I

.field private mBoundToService:Z

.field private mConnection:Landroid/content/ServiceConnection;

.field private final mContext:Landroid/content/Context;

.field private final mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

.field private mFaceUnlockView:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private volatile mIsRunning:Z

.field mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

.field private final mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mService:Lcom/android/internal/policy/IFaceLockInterface;

.field private mServiceRunning:Z

.field private final mServiceRunningLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    .line 52
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    .line 56
    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->MSG_SERVICE_CONNECTED:I

    .line 57
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->MSG_SERVICE_DISCONNECTED:I

    .line 58
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->MSG_UNLOCK:I

    .line 59
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->MSG_CANCEL:I

    .line 60
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->MSG_REPORT_FAILED_ATTEMPT:I

    .line 61
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->MSG_POKE_WAKELOCK:I

    .line 66
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    .line 70
    const/16 v0, 0x1388

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->BACKUP_LOCK_TIMEOUT:I

    .line 355
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$1;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$1;-><init>(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    .line 425
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$2;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock$2;-><init>(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    .line 79
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    .line 80
    new-instance v0, Lcom/android/internal/widget/LockPatternUtils;

    invoke-direct {v0, p1}, Lcom/android/internal/widget/LockPatternUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 81
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    .line 82
    return-void
.end method

.method static synthetic access$002(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;Lcom/android/internal/policy/IFaceLockInterface;)Lcom/android/internal/policy/IFaceLockInterface;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/FaceUnlock;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private startUi(Landroid/os/IBinder;IIII)V
    .locals 9
    .parameter "windowToken"
    .parameter "x"
    .parameter "y"
    .parameter "w"
    .parameter "h"

    .prologue
    .line 379
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v8

    .line 380
    :try_start_0
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunning:Z

    if-nez v0, :cond_0

    .line 381
    const-string v0, "FULLockscreen"

    const-string v1, "Starting Face Unlock"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 383
    :try_start_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->isBiometricWeakLivelinessEnabled()Z

    move-result v6

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v6}, Lcom/android/internal/policy/IFaceLockInterface;->startUi(Landroid/os/IBinder;IIIIZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 389
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 393
    :goto_0
    monitor-exit v8

    .line 394
    :goto_1
    return-void

    .line 385
    :catch_0
    move-exception v7

    .line 386
    .local v7, e:Landroid/os/RemoteException;
    const-string v0, "FULLockscreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Caught exception starting Face Unlock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    monitor-exit v8

    goto :goto_1

    .line 393
    .end local v7           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 391
    :cond_0
    :try_start_3
    const-string v0, "FULLockscreen"

    const-string v1, "startUi() attempted while running"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method private stopUi()V
    .locals 5

    .prologue
    .line 404
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v2

    .line 405
    :try_start_0
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunning:Z

    if-eqz v1, :cond_0

    .line 406
    const-string v1, "FULLockscreen"

    const-string v3, "Stopping Face Unlock"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 408
    :try_start_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    invoke-interface {v1}, Lcom/android/internal/policy/IFaceLockInterface;->stopUi()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 412
    :goto_0
    const/4 v1, 0x0

    :try_start_2
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 419
    :cond_0
    monitor-exit v2

    .line 420
    return-void

    .line 409
    :catch_0
    move-exception v0

    .line 410
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "FULLockscreen"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Caught exception stopping Face Unlock: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 419
    .end local v0           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method


# virtual methods
.method public cleanUp()V
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    if-eqz v0, :cond_0

    .line 188
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v0, v1}, Lcom/android/internal/policy/IFaceLockInterface;->unregisterCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    :goto_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->stopUi()V

    .line 193
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    .line 195
    :cond_0
    return-void

    .line 189
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getQuality()I
    .locals 1

    .prologue
    .line 201
    const v0, 0x8000

    return v0
.end method

.method handleCancel()V
    .locals 3

    .prologue
    .line 322
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->setAlternateUnlockEnabled(Z)V

    .line 324
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->showBackupSecurity()V

    .line 325
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->stop()Z

    .line 326
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    const-wide/16 v1, 0x1388

    invoke-interface {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->userActivity(J)V

    .line 327
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 2
    .parameter "msg"

    .prologue
    .line 210
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 230
    const-string v0, "FULLockscreen"

    const-string v1, "Unhandled message"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    const/4 v0, 0x0

    .line 233
    :goto_0
    return v0

    .line 212
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->handleServiceConnected()V

    .line 233
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 215
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->handleServiceDisconnected()V

    goto :goto_1

    .line 218
    :pswitch_2
    iget v0, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->handleUnlock(I)V

    goto :goto_1

    .line 221
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->handleCancel()V

    goto :goto_1

    .line 224
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->handleReportFailedAttempt()V

    goto :goto_1

    .line 227
    :pswitch_5
    iget v0, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->handlePokeWakelock(I)V

    goto :goto_1

    .line 210
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method handlePokeWakelock(I)V
    .locals 4
    .parameter "millis"

    .prologue
    .line 346
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 347
    .local v0, powerManager:Landroid/os/PowerManager;
    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 348
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    int-to-long v2, p1

    invoke-interface {v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->userActivity(J)V

    .line 350
    :cond_0
    return-void
.end method

.method handleReportFailedAttempt()V
    .locals 2

    .prologue
    .line 336
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->setAlternateUnlockEnabled(Z)V

    .line 338
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->reportFailedUnlockAttempt()V

    .line 339
    return-void
.end method

.method handleServiceConnected()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 241
    const-string v0, "FULLockscreen"

    const-string v2, "handleServiceConnected()"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    if-nez v0, :cond_1

    .line 249
    const-string v0, "FULLockscreen"

    const-string v2, "Dropping startUi() in handleServiceConnected() because no longer bound"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    :cond_0
    :goto_0
    return-void

    .line 254
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v0, v2}, Lcom/android/internal/policy/IFaceLockInterface;->registerCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 264
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    .line 265
    .local v1, windowToken:Landroid/os/IBinder;
    if-eqz v1, :cond_2

    .line 269
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    const-wide/16 v2, 0x0

    invoke-interface {v0, v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->userActivity(J)V

    .line 272
    const/4 v0, 0x2

    new-array v7, v0, [I

    .line 273
    .local v7, position:[I
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->getLocationInWindow([I)V

    .line 274
    aget v2, v7, v4

    const/4 v0, 0x1

    aget v3, v7, v0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->startUi(Landroid/os/IBinder;IIII)V

    goto :goto_0

    .line 255
    .end local v1           #windowToken:Landroid/os/IBinder;
    .end local v7           #position:[I
    :catch_0
    move-exception v6

    .line 256
    .local v6, e:Landroid/os/RemoteException;
    const-string v0, "FULLockscreen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught exception connecting to Face Unlock: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    .line 258
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    .line 259
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    goto :goto_0

    .line 277
    .end local v6           #e:Landroid/os/RemoteException;
    .restart local v1       #windowToken:Landroid/os/IBinder;
    :cond_2
    const-string v0, "FULLockscreen"

    const-string v2, "windowToken is null in handleServiceConnected()"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method handleServiceDisconnected()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 287
    const-string v0, "FULLockscreen"

    const-string v1, "handleServiceDisconnected()"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunningLock:Ljava/lang/Object;

    monitor-enter v1

    .line 291
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    .line 292
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mServiceRunning:Z

    .line 293
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    iput-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    .line 295
    iput-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    .line 296
    return-void

    .line 293
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method handleUnlock(I)V
    .locals 4
    .parameter "authenticatedUserId"

    .prologue
    .line 303
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->stop()Z

    .line 304
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->getCurrentUser()I

    move-result v0

    .line 305
    .local v0, currentUserId:I
    if-ne p1, v0, :cond_0

    .line 307
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    invoke-interface {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->reportSuccessfulUnlockAttempt()V

    .line 308
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;->dismiss(Z)V

    .line 313
    :goto_0
    return-void

    .line 310
    :cond_0
    const-string v1, "FULLockscreen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Ignoring unlock for authenticated user ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") because the current user is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public initializeView(Landroid/view/View;)V
    .locals 2
    .parameter "biometricUnlockView"

    .prologue
    .line 94
    const-string v0, "FULLockscreen"

    const-string v1, "initializeView()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockView:Landroid/view/View;

    .line 96
    return-void
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    return v0
.end method

.method public setKeyguardCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V
    .locals 0
    .parameter "keyguardScreenCallback"

    .prologue
    .line 85
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    .line 86
    return-void
.end method

.method public start()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 120
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 121
    const-string v0, "FULLockscreen"

    const-string v1, "start() called off of the UI thread"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    :cond_0
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    if-eqz v0, :cond_1

    .line 125
    const-string v0, "FULLockscreen"

    const-string v1, "start() called when already running"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    :cond_1
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    if-nez v0, :cond_2

    .line 129
    const-string v0, "FULLockscreen"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Binding to Face Unlock service for user="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v2}, Lcom/android/internal/widget/LockPatternUtils;->getCurrentUser()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/android/internal/policy/IFaceLockInterface;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    invoke-virtual {v3}, Lcom/android/internal/widget/LockPatternUtils;->getCurrentUser()I

    move-result v3

    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;II)Z

    .line 135
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    .line 140
    :goto_0
    iput-boolean v4, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    .line 141
    return v4

    .line 137
    :cond_2
    const-string v0, "FULLockscreen"

    const-string v1, "Attempt to bind to Face Unlock when already bound"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public stop()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 149
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    if-eq v1, v2, :cond_0

    .line 150
    const-string v1, "FULLockscreen"

    const-string v2, "stop() called from non-UI thread"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 156
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    .line 158
    .local v0, mWasRunning:Z
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->stopUi()V

    .line 160
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    if-eqz v1, :cond_2

    .line 161
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    if-eqz v1, :cond_1

    .line 163
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mService:Lcom/android/internal/policy/IFaceLockInterface;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mFaceUnlockCallback:Lcom/android/internal/policy/IFaceLockCallback;

    invoke-interface {v1, v2}, Lcom/android/internal/policy/IFaceLockInterface;->unregisterCallback(Lcom/android/internal/policy/IFaceLockCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :cond_1
    :goto_0
    const-string v1, "FULLockscreen"

    const-string v2, "Unbinding from Face Unlock service"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 170
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mBoundToService:Z

    .line 177
    :cond_2
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mIsRunning:Z

    .line 178
    return v0

    .line 164
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public stopAndShowBackup()V
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/FaceUnlock;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 111
    return-void
.end method
