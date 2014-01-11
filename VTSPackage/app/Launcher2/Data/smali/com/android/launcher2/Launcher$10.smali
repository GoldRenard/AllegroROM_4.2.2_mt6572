.class Lcom/android/launcher2/Launcher$10;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Launcher;->onNewIntent(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Launcher;

.field final synthetic val$alreadyOnHome:Z


# direct methods
.method constructor <init>(Lcom/android/launcher2/Launcher;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1635
    iput-object p1, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    iput-boolean p2, p0, Lcom/android/launcher2/Launcher$10;->val$alreadyOnHome:Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 1637
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1674
    :cond_0
    :goto_0
    return-void

    .line 1641
    :cond_1
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v1

    .line 1643
    .local v1, openFolder:Lcom/android/launcher2/Folder;
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->exitWidgetResizeMode()V

    .line 1644
    iget-boolean v3, p0, Lcom/android/launcher2/Launcher$10;->val$alreadyOnHome:Z

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$1800(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Launcher$State;

    move-result-object v3

    sget-object v4, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->isTouchActive()Z

    move-result v3

    if-nez v3, :cond_2

    if-nez v1, :cond_2

    .line 1648
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v4}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/launcher2/Workspace;->moveOutAppWidget(I)Z

    .line 1649
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/android/launcher2/Workspace;->moveToDefaultScreen(Z)V

    .line 1652
    :cond_2
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->closeFolder()V

    .line 1653
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragMode()V

    .line 1657
    iget-boolean v3, p0, Lcom/android/launcher2/Launcher$10;->val$alreadyOnHome:Z

    if-eqz v3, :cond_4

    .line 1658
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3, v5}, Lcom/android/launcher2/Launcher;->showWorkspace(Z)V

    .line 1663
    :goto_1
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v2

    .line 1664
    .local v2, v:Landroid/view/View;
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 1665
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    const-string v4, "input_method"

    invoke-virtual {v3, v4}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 1667
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1671
    .end local v0           #imm:Landroid/view/inputmethod/InputMethodManager;
    :cond_3
    iget-boolean v3, p0, Lcom/android/launcher2/Launcher$10;->val$alreadyOnHome:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$1100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizeTabHost;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1672
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    #getter for: Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;
    invoke-static {v3}, Lcom/android/launcher2/Launcher;->access$1100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizeTabHost;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/AppsCustomizeTabHost;->reset()V

    goto/16 :goto_0

    .line 1660
    .end local v2           #v:Landroid/view/View;
    :cond_4
    iget-object v3, p0, Lcom/android/launcher2/Launcher$10;->this$0:Lcom/android/launcher2/Launcher;

    sget-object v4, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    #setter for: Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;
    invoke-static {v3, v4}, Lcom/android/launcher2/Launcher;->access$1902(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/Launcher$State;)Lcom/android/launcher2/Launcher$State;

    goto :goto_1
.end method
