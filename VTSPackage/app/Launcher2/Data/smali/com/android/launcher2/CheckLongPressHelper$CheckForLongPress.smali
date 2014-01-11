.class Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;
.super Ljava/lang/Object;
.source "CheckLongPressHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/CheckLongPressHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckForLongPress"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/CheckLongPressHelper;


# direct methods
.method constructor <init>(Lcom/android/launcher2/CheckLongPressHelper;)V
    .locals 0
    .parameter

    .prologue
    .line 27
    iput-object p1, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 29
    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #getter for: Lcom/android/launcher2/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/android/launcher2/CheckLongPressHelper;->access$000(Lcom/android/launcher2/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #getter for: Lcom/android/launcher2/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/android/launcher2/CheckLongPressHelper;->access$000(Lcom/android/launcher2/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #getter for: Lcom/android/launcher2/CheckLongPressHelper;->mHasPerformedLongPress:Z
    invoke-static {v0}, Lcom/android/launcher2/CheckLongPressHelper;->access$100(Lcom/android/launcher2/CheckLongPressHelper;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 32
    invoke-static {}, Lcom/android/launcher2/InstallShortcutHelper;->isInstallingShortcut()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 33
    const-string v0, "CheckLongPressHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Is installing shortcut, so cancel this long click: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #getter for: Lcom/android/launcher2/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v2}, Lcom/android/launcher2/CheckLongPressHelper;->access$000(Lcom/android/launcher2/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #getter for: Lcom/android/launcher2/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/android/launcher2/CheckLongPressHelper;->access$000(Lcom/android/launcher2/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setPressed(Z)V

    .line 35
    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #setter for: Lcom/android/launcher2/CheckLongPressHelper;->mHasPerformedLongPress:Z
    invoke-static {v0, v4}, Lcom/android/launcher2/CheckLongPressHelper;->access$102(Lcom/android/launcher2/CheckLongPressHelper;Z)Z

    .line 44
    :cond_0
    :goto_0
    return-void

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #getter for: Lcom/android/launcher2/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/android/launcher2/CheckLongPressHelper;->access$000(Lcom/android/launcher2/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->performLongClick()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #getter for: Lcom/android/launcher2/CheckLongPressHelper;->mView:Landroid/view/View;
    invoke-static {v0}, Lcom/android/launcher2/CheckLongPressHelper;->access$000(Lcom/android/launcher2/CheckLongPressHelper;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setPressed(Z)V

    .line 41
    iget-object v0, p0, Lcom/android/launcher2/CheckLongPressHelper$CheckForLongPress;->this$0:Lcom/android/launcher2/CheckLongPressHelper;

    #setter for: Lcom/android/launcher2/CheckLongPressHelper;->mHasPerformedLongPress:Z
    invoke-static {v0, v4}, Lcom/android/launcher2/CheckLongPressHelper;->access$102(Lcom/android/launcher2/CheckLongPressHelper;Z)Z

    goto :goto_0
.end method
