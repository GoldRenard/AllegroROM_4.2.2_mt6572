.class Lcom/mediatek/vt/VTManager$1;
.super Ljava/lang/Thread;
.source "VTManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/VTManager;->createThreads()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/VTManager;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/VTManager;)V
    .locals 0
    .parameter

    .prologue
    .line 189
    iput-object p1, p0, Lcom/mediatek/vt/VTManager$1;->this$0:Lcom/mediatek/vt/VTManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 192
    const-string v0, "VTManager"

    const-string v1, "run(), mVTThread"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 194
    iget-object v0, p0, Lcom/mediatek/vt/VTManager$1;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v1, v0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    monitor-enter v1

    .line 195
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/vt/VTManager$1;->this$0:Lcom/mediatek/vt/VTManager;

    new-instance v2, Lcom/mediatek/vt/VTManager$VTHanlder;

    iget-object v3, p0, Lcom/mediatek/vt/VTManager$1;->this$0:Lcom/mediatek/vt/VTManager;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/mediatek/vt/VTManager$VTHanlder;-><init>(Lcom/mediatek/vt/VTManager;Lcom/mediatek/vt/VTManager$1;)V

    iput-object v2, v0, Lcom/mediatek/vt/VTManager;->mVtHandler:Landroid/os/Handler;

    .line 196
    const-string v0, "VTManager"

    const-string v2, "mVTThread.notify()"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    iget-object v0, p0, Lcom/mediatek/vt/VTManager$1;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v0, v0, Lcom/mediatek/vt/VTManager;->mVTThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 198
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 201
    return-void

    .line 198
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
