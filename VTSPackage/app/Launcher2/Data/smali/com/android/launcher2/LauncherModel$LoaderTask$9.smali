.class Lcom/android/launcher2/LauncherModel$LoaderTask$9;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/LauncherModel$LoaderTask;->bindWorkspace(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/launcher2/LauncherModel$LoaderTask;

.field final synthetic val$oldCallbacks:Lcom/android/launcher2/LauncherModel$Callbacks;

.field final synthetic val$t:J


# direct methods
.method constructor <init>(Lcom/android/launcher2/LauncherModel$LoaderTask;Lcom/android/launcher2/LauncherModel$Callbacks;J)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1952
    iput-object p1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask$9;->this$1:Lcom/android/launcher2/LauncherModel$LoaderTask;

    iput-object p2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask$9;->val$oldCallbacks:Lcom/android/launcher2/LauncherModel$Callbacks;

    iput-wide p3, p0, Lcom/android/launcher2/LauncherModel$LoaderTask$9;->val$t:J

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 1954
    iget-object v1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask$9;->this$1:Lcom/android/launcher2/LauncherModel$LoaderTask;

    iget-object v2, p0, Lcom/android/launcher2/LauncherModel$LoaderTask$9;->val$oldCallbacks:Lcom/android/launcher2/LauncherModel$Callbacks;

    invoke-virtual {v1, v2}, Lcom/android/launcher2/LauncherModel$LoaderTask;->tryGetCallbacks(Lcom/android/launcher2/LauncherModel$Callbacks;)Lcom/android/launcher2/LauncherModel$Callbacks;

    move-result-object v0

    .line 1955
    .local v0, callbacks:Lcom/android/launcher2/LauncherModel$Callbacks;
    if-eqz v0, :cond_0

    .line 1956
    invoke-interface {v0}, Lcom/android/launcher2/LauncherModel$Callbacks;->finishBindingItems()V

    .line 1960
    :cond_0
    invoke-static {v7}, Lcom/android/launcher2/InstallShortcutHelper;->setInstallingShortcut(Z)V

    .line 1964
    const-string v1, "Launcher.Model"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bound workspace in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/android/launcher2/LauncherModel$LoaderTask$9;->val$t:J

    sub-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1968
    iget-object v1, p0, Lcom/android/launcher2/LauncherModel$LoaderTask$9;->this$1:Lcom/android/launcher2/LauncherModel$LoaderTask;

    #setter for: Lcom/android/launcher2/LauncherModel$LoaderTask;->mIsLoadingAndBindingWorkspace:Z
    invoke-static {v1, v7}, Lcom/android/launcher2/LauncherModel$LoaderTask;->access$1502(Lcom/android/launcher2/LauncherModel$LoaderTask;Z)Z

    .line 1969
    return-void
.end method
