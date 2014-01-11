.class Lcom/cyanogenmod/trebuchet/Launcher$20;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->hideAppsCustomizeHelper(Lcom/cyanogenmod/trebuchet/Launcher$State;ZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$animated:Z

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$onCompleteRunnable:Ljava/lang/Runnable;

.field final synthetic val$toView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZLandroid/view/View;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3002
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$fromView:Landroid/view/View;

    iput-boolean p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$animated:Z

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$toView:Landroid/view/View;

    iput-object p5, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animation"

    .prologue
    const/4 v3, 0x1

    .line 3005
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 3006
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$fromView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 3007
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$fromView:Landroid/view/View;

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$animated:Z

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2600(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V

    .line 3008
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$toView:Landroid/view/View;

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$animated:Z

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2600(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V

    .line 3009
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3010
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->hideScrollingIndicator(Z)V

    .line 3012
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$onCompleteRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 3013
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 3015
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updateCurrentPageScroll()V

    .line 3016
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$20;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->resumeScrolling()V

    .line 3017
    return-void
.end method
