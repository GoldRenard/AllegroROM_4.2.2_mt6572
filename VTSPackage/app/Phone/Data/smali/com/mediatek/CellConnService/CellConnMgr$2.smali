.class Lcom/mediatek/CellConnService/CellConnMgr$2;
.super Ljava/lang/Object;
.source "CellConnMgr.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/CellConnService/CellConnMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/CellConnService/CellConnMgr;


# direct methods
.method constructor <init>(Lcom/mediatek/CellConnService/CellConnMgr;)V
    .locals 0
    .parameter

    .prologue
    .line 210
    iput-object p1, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "name"
    .parameter "service"

    .prologue
    .line 214
    const-string v0, "CellConnMgr"

    const-string v1, "onServiceConnected PhoneStateService connected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-static {p2}, Lcom/mediatek/CellConnService/IPhoneStatesMgrService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/CellConnService/IPhoneStatesMgrService;

    move-result-object v1

    #setter for: Lcom/mediatek/CellConnService/CellConnMgr;->mService:Lcom/mediatek/CellConnService/IPhoneStatesMgrService;
    invoke-static {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;->access$402(Lcom/mediatek/CellConnService/CellConnMgr;Lcom/mediatek/CellConnService/IPhoneStatesMgrService;)Lcom/mediatek/CellConnService/IPhoneStatesMgrService;

    .line 217
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->mService:Lcom/mediatek/CellConnService/IPhoneStatesMgrService;
    invoke-static {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->access$400(Lcom/mediatek/CellConnService/CellConnMgr;)Lcom/mediatek/CellConnService/IPhoneStatesMgrService;

    move-result-object v0

    if-nez v0, :cond_0

    .line 218
    const-string v0, "CellConnMgr"

    const-string v1, "onServiceConnected PhoneStateService get service is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    :goto_0
    return-void

    .line 224
    :cond_0
    const-string v0, "CellConnMgr"

    const-string v1, "onServiceConnected notify service ready"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->workerThread:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;
    invoke-static {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->access$500(Lcom/mediatek/CellConnService/CellConnMgr;)Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;

    move-result-object v1

    monitor-enter v1

    .line 226
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->workerThread:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;
    invoke-static {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->access$500(Lcom/mediatek/CellConnService/CellConnMgr;)Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->setServiceReady()V

    .line 227
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->workerThread:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;
    invoke-static {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->access$500(Lcom/mediatek/CellConnService/CellConnMgr;)Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 228
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 233
    const-string v0, "CellConnMgr"

    const-string v1, "onServiceDisconnected PhoneStateService disconnected"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->workerThread:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;
    invoke-static {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->access$500(Lcom/mediatek/CellConnService/CellConnMgr;)Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->resetThreadStarted()V

    .line 235
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$2;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/CellConnService/CellConnMgr;->mService:Lcom/mediatek/CellConnService/IPhoneStatesMgrService;
    invoke-static {v0, v1}, Lcom/mediatek/CellConnService/CellConnMgr;->access$402(Lcom/mediatek/CellConnService/CellConnMgr;Lcom/mediatek/CellConnService/IPhoneStatesMgrService;)Lcom/mediatek/CellConnService/IPhoneStatesMgrService;

    .line 236
    return-void
.end method
