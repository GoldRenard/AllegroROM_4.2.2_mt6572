.class Lcom/cyanogenmod/trebuchet/Launcher$16;
.super Landroid/animation/AnimatorListenerAdapter;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->showAppsCustomizeHelper(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field animationCancelled:Z

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$animated:Z

.field final synthetic val$fromView:Landroid/view/View;

.field final synthetic val$springLoaded:Z

.field final synthetic val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Landroid/view/View;ZZ)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2821
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$fromView:Landroid/view/View;

    iput-boolean p4, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$animated:Z

    iput-boolean p5, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$springLoaded:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 2822
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->animationCancelled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 2855
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->animationCancelled:Z

    .line 2856
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animation"

    .prologue
    const/4 v3, 0x0

    .line 2835
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$fromView:Landroid/view/View;

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$animated:Z

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2600(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V

    .line 2836
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$animated:Z

    #calls: Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2600(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V

    .line 2838
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$springLoaded:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2840
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->hideScrollingIndicator(Z)V

    .line 2841
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->hideDockDivider()V

    .line 2843
    :cond_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->animationCancelled:Z

    if-nez v0, :cond_1

    .line 2844
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 2848
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2700(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 2849
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2700(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->hideSearchBar(Z)V

    .line 2851
    :cond_2
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4
    .parameter "animation"

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 2826
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->isRenderingWallpaper()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 2828
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setTranslationX(F)V

    .line 2829
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setTranslationY(F)V

    .line 2830
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setVisibility(I)V

    .line 2831
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$16;->val$toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->bringToFront()V

    .line 2832
    return-void

    :cond_0
    move v0, v1

    .line 2826
    goto :goto_0
.end method
