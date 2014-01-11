.class public Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;
.super Landroid/widget/LinearLayout;
.source "KeyguardVoiceUnlockView.java"

# interfaces
.implements Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityView;


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "VoiceUnlock"


# instance fields
.field private mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

.field private mBouncerFrame:Landroid/graphics/drawable/Drawable;

.field private mEcaView:Landroid/view/View;

.field private mIsShowing:Z

.field private final mIsShowingLock:Ljava/lang/Object;

.field private mKeyguardSecurityCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

.field private mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

.field private mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

.field mUpdateCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

.field private mVoiceUnlockAreaView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowing:Z

    .line 33
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowingLock:Ljava/lang/Object;

    .line 164
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView$1;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView$1;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mUpdateCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

    .line 41
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;)Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowingLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowing:Z

    return v0
.end method

.method static synthetic access$302(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 19
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowing:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->maybeStartBiometricUnlock()V

    return-void
.end method

.method private initializeBiometricUnlockView()V
    .locals 2

    .prologue
    .line 111
    const-string v0, "initializeBiometricUnlockView()"

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->log(Ljava/lang/String;)V

    .line 112
    const v0, 0x10203bf

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mVoiceUnlockAreaView:Landroid/view/View;

    .line 113
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mVoiceUnlockAreaView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 114
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/VoiceUnlock;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/android/internal/policy/impl/keyguard/VoiceUnlock;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    .line 115
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mVoiceUnlockAreaView:Landroid/view/View;

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;->initializeView(Landroid/view/View;)V

    .line 119
    :goto_0
    return-void

    .line 117
    :cond_0
    const-string v0, "Couldn\'t find biometric unlock view"

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 224
    const-string v0, "VoiceUnlock"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "KeyguardVoiceUnlockView: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    return-void
.end method

.method private maybeStartBiometricUnlock()V
    .locals 9

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 127
    const-string v7, "maybeStartBiometricUnlock()"

    invoke-direct {p0, v7}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->log(Ljava/lang/String;)V

    .line 128
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    if-eqz v7, :cond_2

    .line 129
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v3

    .line 130
    .local v3, monitor:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;
    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getFailedUnlockAttempts()I

    move-result v7

    const/4 v8, 0x5

    if-lt v7, v8, :cond_3

    move v0, v5

    .line 133
    .local v0, backupIsTimedOut:Z
    :goto_0
    const/4 v7, 0x3

    invoke-static {v7, v6}, Landroid/media/AudioSystem;->isStreamActive(II)Z

    move-result v7

    if-nez v7, :cond_0

    const/16 v7, 0xa

    invoke-static {v7, v6}, Landroid/media/AudioSystem;->isStreamActive(II)Z

    move-result v7

    if-eqz v7, :cond_4

    :cond_0
    move v2, v5

    .line 135
    .local v2, mediaPlaying:Z
    :goto_1
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    const-string v6, "power"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    .line 139
    .local v4, powerManager:Landroid/os/PowerManager;
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowingLock:Ljava/lang/Object;

    monitor-enter v6

    .line 140
    :try_start_0
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowing:Z

    .line 141
    .local v1, isShowing:Z
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    invoke-virtual {v4}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v5

    if-eqz v5, :cond_1

    if-nez v1, :cond_5

    .line 147
    :cond_1
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    invoke-interface {v5}, Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;->stop()Z

    .line 162
    .end local v0           #backupIsTimedOut:Z
    .end local v1           #isShowing:Z
    .end local v2           #mediaPlaying:Z
    .end local v3           #monitor:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;
    .end local v4           #powerManager:Landroid/os/PowerManager;
    :cond_2
    :goto_2
    return-void

    .restart local v3       #monitor:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;
    :cond_3
    move v0, v6

    .line 130
    goto :goto_0

    .restart local v0       #backupIsTimedOut:Z
    :cond_4
    move v2, v6

    .line 133
    goto :goto_1

    .line 141
    .restart local v2       #mediaPlaying:Z
    .restart local v4       #powerManager:Landroid/os/PowerManager;
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 153
    .restart local v1       #isShowing:Z
    :cond_5
    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getPhoneState()I

    move-result v5

    if-nez v5, :cond_6

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getMaxBiometricUnlockAttemptsReached()Z

    move-result v5

    if-nez v5, :cond_6

    if-nez v0, :cond_6

    if-nez v2, :cond_6

    .line 157
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    invoke-interface {v5}, Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;->start()Z

    goto :goto_2

    .line 159
    :cond_6
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    invoke-interface {v5}, Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;->stopAndShowBackup()V

    goto :goto_2
.end method


# virtual methods
.method public getCallback()Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mKeyguardSecurityCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    return-object v0
.end method

.method public hideBouncer(I)V
    .locals 3
    .parameter "duration"

    .prologue
    .line 218
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mEcaView:Landroid/view/View;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBouncerFrame:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v1, v2, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityViewHelper;->hideBouncer(Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;Landroid/view/View;Landroid/graphics/drawable/Drawable;I)V

    .line 220
    return-void
.end method

.method public needsInput()Z
    .locals 1

    .prologue
    .line 102
    const/4 v0, 0x0

    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 76
    const-string v0, "onDetachedFromWindow()"

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->log(Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;->stop()Z

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mUpdateCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->removeCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;)V

    .line 81
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 45
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 47
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->initializeBiometricUnlockView()V

    .line 49
    new-instance v1, Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea$Helper;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardMessageArea$Helper;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    .line 50
    const v1, 0x10202b1

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mEcaView:Landroid/view/View;

    .line 51
    const v1, 0x10202ad

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 52
    .local v0, bouncerFrameView:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBouncerFrame:Landroid/graphics/drawable/Drawable;

    .line 55
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 85
    const-string v0, "onPause()"

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->log(Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;->stop()Z

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mUpdateCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->removeCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;)V

    .line 90
    return-void
.end method

.method public onResume(I)V
    .locals 2
    .parameter "reason"

    .prologue
    .line 94
    const-string v0, "onResume()"

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->log(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->isKeyguardVisible()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mIsShowing:Z

    .line 96
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->maybeStartBiometricUnlock()V

    .line 97
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->getInstance(Landroid/content/Context;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mUpdateCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->registerCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitorCallback;)V

    .line 98
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 72
    return-void
.end method

.method public setKeyguardCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V
    .locals 1
    .parameter "callback"

    .prologue
    .line 59
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mKeyguardSecurityCallback:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;

    .line 61
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBiometricUnlock:Lcom/android/internal/policy/impl/keyguard/BiometricSensorUnlock;

    check-cast v0, Lcom/android/internal/policy/impl/keyguard/VoiceUnlock;

    invoke-virtual {v0, p1}, Lcom/android/internal/policy/impl/keyguard/VoiceUnlock;->setKeyguardCallback(Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityCallback;)V

    .line 62
    return-void
.end method

.method public setLockPatternUtils(Lcom/android/internal/widget/LockPatternUtils;)V
    .locals 0
    .parameter "utils"

    .prologue
    .line 66
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;

    .line 67
    return-void
.end method

.method public showBouncer(I)V
    .locals 3
    .parameter "duration"

    .prologue
    .line 212
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mSecurityMessageDisplay:Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mEcaView:Landroid/view/View;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardVoiceUnlockView;->mBouncerFrame:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v1, v2, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityViewHelper;->showBouncer(Lcom/android/internal/policy/impl/keyguard/SecurityMessageDisplay;Landroid/view/View;Landroid/graphics/drawable/Drawable;I)V

    .line 214
    return-void
.end method

.method public showUsabilityHint()V
    .locals 0

    .prologue
    .line 208
    return-void
.end method
