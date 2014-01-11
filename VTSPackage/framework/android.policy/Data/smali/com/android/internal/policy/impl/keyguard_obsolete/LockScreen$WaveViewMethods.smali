.class Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;
.super Ljava/lang/Object;
.source "LockScreen.java"

# interfaces
.implements Lcom/android/internal/widget/WaveView$OnTriggerListener;
.implements Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$UnlockWidgetCommonMethods;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WaveViewMethods"
.end annotation


# instance fields
.field private final mWaveView:Lcom/android/internal/widget/WaveView;

.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;Lcom/android/internal/widget/WaveView;)V
    .locals 0
    .parameter
    .parameter "waveView"

    .prologue
    .line 210
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;->mWaveView:Lcom/android/internal/widget/WaveView;

    .line 212
    return-void
.end method


# virtual methods
.method public cleanUp()V
    .locals 2

    .prologue
    .line 248
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;->mWaveView:Lcom/android/internal/widget/WaveView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/WaveView;->setOnTriggerListener(Lcom/android/internal/widget/WaveView$OnTriggerListener;)V

    .line 249
    return-void
.end method

.method public getTargetPosition(I)I
    .locals 1
    .parameter "resourceId"

    .prologue
    .line 245
    const/4 v0, -0x1

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;->mWaveView:Lcom/android/internal/widget/WaveView;

    return-object v0
.end method

.method public onGrabbedStateChange(Landroid/view/View;I)V
    .locals 2
    .parameter "v"
    .parameter "grabbedState"

    .prologue
    .line 225
    const/16 v0, 0xa

    if-ne p2, v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->mCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$400(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    move-result-object v0

    const/16 v1, 0x7530

    invoke-interface {v0, v1}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->pokeWakelock(I)V

    .line 228
    :cond_0
    return-void
.end method

.method public onTrigger(Landroid/view/View;I)V
    .locals 1
    .parameter "v"
    .parameter "whichHandle"

    .prologue
    .line 215
    const/16 v0, 0xa

    if-ne p2, v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->requestUnlockScreen()V
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;->access$700(Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen;)V

    .line 218
    :cond_0
    return-void
.end method

.method public ping()V
    .locals 0

    .prologue
    .line 240
    return-void
.end method

.method public reset(Z)V
    .locals 1
    .parameter "animate"

    .prologue
    .line 237
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockScreen$WaveViewMethods;->mWaveView:Lcom/android/internal/widget/WaveView;

    invoke-virtual {v0}, Lcom/android/internal/widget/WaveView;->reset()V

    .line 238
    return-void
.end method

.method public setEnabled(IZ)V
    .locals 0
    .parameter "resourceId"
    .parameter "enabled"

    .prologue
    .line 243
    return-void
.end method

.method public updateResources()V
    .locals 0

    .prologue
    .line 231
    return-void
.end method
