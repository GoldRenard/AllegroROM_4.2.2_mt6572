.class Lcom/android/launcher2/Launcher$14;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->showAppsCustomizeHelper(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$animated:Z

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$scale:F

.field final synthetic val$stateAnimation:Landroid/animation/AnimatorSet;

.field final synthetic val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Landroid/animation/AnimatorSet;Lcom/android/launcher2/AppsCustomizeTabHost;FLandroid/view/View;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2994
    iput-object p1, p0, Lcom/android/launcher2/Launcher$14;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p2, p0, Lcom/android/launcher2/Launcher$14;->val$stateAnimation:Landroid/animation/AnimatorSet;

    iput-object p3, p0, Lcom/android/launcher2/Launcher$14;->val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;

    iput p4, p0, Lcom/android/launcher2/Launcher$14;->val$scale:F

    iput-object p5, p0, Lcom/android/launcher2/Launcher$14;->val$fromView:Landroid/view/View;

    iput-boolean p6, p0, Lcom/android/launcher2/Launcher$14;->val$animated:Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 2998
    iget-object v0, p0, Lcom/android/launcher2/Launcher$14;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0}, Lcom/android/launcher2/Launcher;->access$2400(Lcom/android/launcher2/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/Launcher$14;->val$stateAnimation:Landroid/animation/AnimatorSet;

    if-eq v0, v1, :cond_0

    .line 3012
    :goto_0
    return-void

    .line 3000
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher$14;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v1, p0, Lcom/android/launcher2/Launcher$14;->val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;

    iget v2, p0, Lcom/android/launcher2/Launcher$14;->val$scale:F

    #calls: Lcom/android/launcher2/Launcher;->setPivotsForZoom(Landroid/view/View;F)V
    invoke-static {v0, v1, v2}, Lcom/android/launcher2/Launcher;->access$2500(Lcom/android/launcher2/Launcher;Landroid/view/View;F)V

    .line 3001
    iget-object v0, p0, Lcom/android/launcher2/Launcher$14;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v1, p0, Lcom/android/launcher2/Launcher$14;->val$fromView:Landroid/view/View;

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher$14;->val$animated:Z

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/launcher2/Launcher;->access$2600(Lcom/android/launcher2/Launcher;Landroid/view/View;ZZ)V

    .line 3002
    iget-object v0, p0, Lcom/android/launcher2/Launcher$14;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v1, p0, Lcom/android/launcher2/Launcher$14;->val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher$14;->val$animated:Z

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/launcher2/Launcher;->access$2600(Lcom/android/launcher2/Launcher;Landroid/view/View;ZZ)V

    .line 3003
    iget-object v0, p0, Lcom/android/launcher2/Launcher$14;->val$toView:Lcom/android/launcher2/AppsCustomizeTabHost;

    new-instance v1, Lcom/android/launcher2/Launcher$14$1;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Launcher$14$1;-><init>(Lcom/android/launcher2/Launcher$14;)V

    invoke-virtual {v0, v1}, Lcom/android/launcher2/AppsCustomizeTabHost;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
