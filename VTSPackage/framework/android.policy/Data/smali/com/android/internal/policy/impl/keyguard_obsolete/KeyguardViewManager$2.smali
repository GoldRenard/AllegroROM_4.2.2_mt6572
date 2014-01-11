.class Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$2;
.super Ljava/lang/Object;
.source "KeyguardViewManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->hide()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

.field final synthetic val$lastView:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 291
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    iput-object p2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$2;->val$lastView:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 293
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    monitor-enter v1

    .line 294
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$2;->val$lastView:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;->cleanUp()V

    .line 295
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$2;->this$0:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;

    #getter for: Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->mKeyguardHost:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;->access$100(Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewManager$2;->val$lastView:Lcom/android/internal/policy/impl/keyguard_obsolete/KeyguardViewBase;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 296
    monitor-exit v1

    .line 297
    return-void

    .line 296
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
