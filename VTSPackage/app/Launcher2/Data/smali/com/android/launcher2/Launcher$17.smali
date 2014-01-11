.class Lcom/android/launcher2/Launcher$17;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->hideAppsCustomizeHelper(Lcom/android/launcher2/Launcher$State;ZZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$animated:Z

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$onCompleteRunnable:Ljava/lang/Runnable;

.field final synthetic val$toView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Landroid/view/View;ZLandroid/view/View;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3131
    iput-object p1, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    iput-object p2, p0, Lcom/android/launcher2/Launcher$17;->val$fromView:Landroid/view/View;

    iput-boolean p3, p0, Lcom/android/launcher2/Launcher$17;->val$animated:Z

    iput-object p4, p0, Lcom/android/launcher2/Launcher$17;->val$toView:Landroid/view/View;

    iput-object p5, p0, Lcom/android/launcher2/Launcher$17;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animation"

    .prologue
    const/4 v3, 0x1

    .line 3134
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0, v3}, Lcom/android/launcher2/Launcher;->updateWallpaperVisibility(Z)V

    .line 3135
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->val$fromView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 3136
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v1, p0, Lcom/android/launcher2/Launcher$17;->val$fromView:Landroid/view/View;

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher$17;->val$animated:Z

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/launcher2/Launcher;->access$2200(Lcom/android/launcher2/Launcher;Landroid/view/View;ZZ)V

    .line 3137
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    iget-object v1, p0, Lcom/android/launcher2/Launcher$17;->val$toView:Landroid/view/View;

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher$17;->val$animated:Z

    #calls: Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/launcher2/Launcher;->access$2200(Lcom/android/launcher2/Launcher;Landroid/view/View;ZZ)V

    .line 3138
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v0}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3139
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v0}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->hideScrollingIndicator(Z)V

    .line 3141
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->val$onCompleteRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 3142
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 3144
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/android/launcher2/Launcher;->access$2700(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizePagedView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizePagedView;->updateCurrentPageScroll()V

    .line 3145
    iget-object v0, p0, Lcom/android/launcher2/Launcher$17;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;
    invoke-static {v0}, Lcom/android/launcher2/Launcher;->access$2700(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizePagedView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizePagedView;->resumeScrolling()V

    .line 3146
    return-void
.end method
