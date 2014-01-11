.class Lcom/cyanogenmod/trebuchet/Launcher$17;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->showAppsCustomizeHelper(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$animated:Z

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$stateAnimation:Landroid/animation/AnimatorSet;

.field final synthetic val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/animation/AnimatorSet;Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Landroid/view/View;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2881
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$stateAnimation:Landroid/animation/AnimatorSet;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$fromView:Landroid/view/View;

    iput-boolean p5, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$animated:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 2885
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1900(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$stateAnimation:Landroid/animation/AnimatorSet;

    if-eq v0, v1, :cond_0

    .line 2899
    :goto_0
    return-void

    .line 2887
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->setPivotsForZoom(Landroid/view/View;)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2800(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;)V

    .line 2888
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$fromView:Landroid/view/View;

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$animated:Z

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2900(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V

    .line 2889
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$animated:Z

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2900(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V

    .line 2890
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$17;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$17$1;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Launcher$17$1;-><init>(Lcom/cyanogenmod/trebuchet/Launcher$17;)V

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
