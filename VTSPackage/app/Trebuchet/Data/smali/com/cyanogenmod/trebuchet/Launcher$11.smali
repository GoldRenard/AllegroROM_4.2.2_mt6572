.class Lcom/cyanogenmod/trebuchet/Launcher$11;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->onNewIntent(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$alreadyOnHome:Z


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1558
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-boolean p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->val$alreadyOnHome:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 1560
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1598
    :cond_0
    :goto_0
    return-void

    .line 1564
    :cond_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v1

    .line 1566
    .local v1, openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->exitWidgetResizeMode()V

    .line 1567
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->val$alreadyOnHome:Z

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1800(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Launcher$State;

    move-result-object v3

    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->isTouchActive()Z

    move-result v3

    if-nez v3, :cond_3

    if-nez v1, :cond_3

    .line 1569
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1900(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/animation/AnimatorSet;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1570
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v4, 0x0

    #setter for: Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;
    invoke-static {v3, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1902(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;

    .line 1572
    :cond_2
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->moveToDefaultScreen(Z)V

    .line 1573
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2000(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/cyanogenmod/trebuchet/Hotseat;->moveToDefaultScreen(Z)V

    .line 1576
    :cond_3
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    .line 1577
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragMode()V

    .line 1581
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->val$alreadyOnHome:Z

    if-eqz v3, :cond_5

    .line 1582
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->showWorkspace(Z)V

    .line 1587
    :goto_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v2

    .line 1588
    .local v2, v:Landroid/view/View;
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 1589
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    const-string v4, "input_method"

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 1591
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1595
    .end local v0           #imm:Landroid/view/inputmethod/InputMethodManager;
    :cond_4
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->val$alreadyOnHome:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1400(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1596
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1400(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->reset()V

    goto/16 :goto_0

    .line 1584
    .end local v2           #v:Landroid/view/View;
    :cond_5
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher$11;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    #setter for: Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;
    invoke-static {v3, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->access$2102(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/Launcher$State;)Lcom/cyanogenmod/trebuchet/Launcher$State;

    goto :goto_1
.end method
