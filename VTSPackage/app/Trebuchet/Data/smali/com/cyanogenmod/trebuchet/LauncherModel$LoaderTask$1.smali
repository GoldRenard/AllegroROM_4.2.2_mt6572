.class Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$1;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->waitForIdle()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;)V
    .locals 0
    .parameter

    .prologue
    .line 1041
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$1;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1043
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$1;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    monitor-enter v1

    .line 1044
    :try_start_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$1;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    const/4 v2, 0x1

    #setter for: Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->mLoadAndBindStepFinished:Z
    invoke-static {v0, v2}, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;->access$102(Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;Z)Z

    .line 1048
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask$1;->this$1:Lcom/cyanogenmod/trebuchet/LauncherModel$LoaderTask;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 1049
    monitor-exit v1

    .line 1050
    return-void

    .line 1049
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
