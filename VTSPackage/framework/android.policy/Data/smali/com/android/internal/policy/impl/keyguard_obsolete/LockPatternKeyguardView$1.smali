.class Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$1;
.super Ljava/lang/Object;
.source "LockPatternKeyguardView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)V
    .locals 0
    .parameter

    .prologue
    .line 197
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 199
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mMode:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$000(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;

    move-result-object v1

    .line 203
    .local v1, mode:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;
    const/4 v0, 0x0

    .line 204
    .local v0, dismissAfterCreation:Z
    sget-object v2, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;->UnlockScreen:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;

    if-ne v1, v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->getUnlockMode()Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$UnlockMode;
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$UnlockMode;

    move-result-object v2

    sget-object v3, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$UnlockMode;->Unknown:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$UnlockMode;

    if-ne v2, v3, :cond_0

    .line 206
    sget-object v1, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;->LockScreen:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;

    .line 207
    const/4 v0, 0x1

    .line 209
    :cond_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    const/4 v3, 0x1

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->updateScreen(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;Z)V
    invoke-static {v2, v1, v3}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$200(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode;Z)V

    .line 210
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    #calls: Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->restoreWidgetState()V
    invoke-static {v2}, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->access$300(Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;)V

    .line 211
    if-eqz v0, :cond_1

    .line 212
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$1;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;

    iget-object v2, v2, Lcom/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView;->mKeyguardScreenCallback:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardScreenCallback;->keyguardDone(Z)V

    .line 214
    :cond_1
    return-void
.end method
