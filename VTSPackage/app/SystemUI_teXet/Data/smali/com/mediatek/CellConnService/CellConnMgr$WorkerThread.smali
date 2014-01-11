.class Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;
.super Ljava/lang/Object;
.source "CellConnMgr.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/CellConnService/CellConnMgr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WorkerThread"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;
    }
.end annotation


# instance fields
.field private mRequstList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;",
            ">;"
        }
    .end annotation
.end field

.field private mServiceReady:Z

.field private mThreadStarted:Z

.field final synthetic this$0:Lcom/mediatek/CellConnService/CellConnMgr;


# direct methods
.method public constructor <init>(Lcom/mediatek/CellConnService/CellConnMgr;)V
    .registers 4
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 315
    iput-object p1, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 395
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mRequstList:Ljava/util/ArrayList;

    .line 316
    iput-boolean v1, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mThreadStarted:Z

    .line 317
    iput-boolean v1, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mServiceReady:Z

    .line 318
    return-void
.end method


# virtual methods
.method public addElem(II)V
    .registers 5
    .parameter "slot"
    .parameter "reqType"

    .prologue
    .line 344
    iget-object v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mRequstList:Ljava/util/ArrayList;

    new-instance v1, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;

    invoke-direct {v1, p0, p1, p2}, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;-><init>(Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 345
    return-void
.end method

.method public isThreadStarted()Z
    .registers 2

    .prologue
    .line 356
    iget-boolean v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mThreadStarted:Z

    return v0
.end method

.method public resetThreadStarted()V
    .registers 2

    .prologue
    .line 352
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mThreadStarted:Z

    .line 353
    return-void
.end method

.method public run()V
    .registers 7

    .prologue
    .line 366
    const-string v3, "CellConnMgr"

    const-string v4, "WorkerThread run"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    iget-object v3, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    iget-object v4, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->mCtx:Landroid/content/Context;
    invoke-static {v4}, Lcom/mediatek/CellConnService/CellConnMgr;->access$600(Lcom/mediatek/CellConnService/CellConnMgr;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mediatek/CellConnService/CellConnMgr;->register(Landroid/content/Context;)V

    .line 376
    :try_start_12
    monitor-enter p0
    :try_end_13
    .catch Ljava/lang/InterruptedException; {:try_start_12 .. :try_end_13} :catch_8e

    .line 377
    :try_start_13
    iget-boolean v3, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mServiceReady:Z

    if-nez v3, :cond_23

    .line 378
    const-string v3, "CellConnMgr"

    const-string v4, "WorkerThread wait notify"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    const-wide/16 v3, 0x2710

    invoke-virtual {p0, v3, v4}, Ljava/lang/Object;->wait(J)V

    .line 381
    :cond_23
    const-string v3, "CellConnMgr"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "WorkerThread run current requstList size is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mRequstList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    iget-object v3, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mRequstList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_47
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_af

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;

    .line 383
    .local v1, elem:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;
    const-string v3, "CellConnMgr"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "WorkerThread request slot = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->getSlot()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " reqType = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->getReqType()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    iget-object v3, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->getSlot()I

    move-result v4

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;->getReqType()I

    move-result v5

    #calls: Lcom/mediatek/CellConnService/CellConnMgr;->verifyCellState(II)I
    invoke-static {v3, v4, v5}, Lcom/mediatek/CellConnService/CellConnMgr;->access$700(Lcom/mediatek/CellConnService/CellConnMgr;II)I

    goto :goto_47

    .line 386
    .end local v1           #elem:Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread$Element;
    .end local v2           #i$:Ljava/util/Iterator;
    :catchall_8b
    move-exception v3

    monitor-exit p0
    :try_end_8d
    .catchall {:try_start_13 .. :try_end_8d} :catchall_8b

    :try_start_8d
    throw v3
    :try_end_8e
    .catch Ljava/lang/InterruptedException; {:try_start_8d .. :try_end_8e} :catch_8e

    .line 387
    :catch_8e
    move-exception v0

    .line 388
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v3, "CellConnMgr"

    const-string v4, "WorkerThread wait exception"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 390
    iget-object v3, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    const/4 v4, 0x3

    #setter for: Lcom/mediatek/CellConnService/CellConnMgr;->mResult:I
    invoke-static {v3, v4}, Lcom/mediatek/CellConnService/CellConnMgr;->access$002(Lcom/mediatek/CellConnService/CellConnMgr;I)I

    .line 391
    iget-object v3, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->mHandler:Landroid/os/Handler;
    invoke-static {v3}, Lcom/mediatek/CellConnService/CellConnMgr;->access$200(Lcom/mediatek/CellConnService/CellConnMgr;)Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->this$0:Lcom/mediatek/CellConnService/CellConnMgr;

    #getter for: Lcom/mediatek/CellConnService/CellConnMgr;->mOnServiceComplete:Ljava/lang/Runnable;
    invoke-static {v4}, Lcom/mediatek/CellConnService/CellConnMgr;->access$100(Lcom/mediatek/CellConnService/CellConnMgr;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 393
    .end local v0           #e:Ljava/lang/InterruptedException;
    :goto_ae
    return-void

    .line 386
    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_af
    :try_start_af
    monitor-exit p0
    :try_end_b0
    .catchall {:try_start_af .. :try_end_b0} :catchall_8b

    goto :goto_ae
.end method

.method public setServiceReady()V
    .registers 2

    .prologue
    .line 360
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mServiceReady:Z

    .line 361
    return-void
.end method

.method public setThreadStarted()V
    .registers 2

    .prologue
    .line 348
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/CellConnService/CellConnMgr$WorkerThread;->mThreadStarted:Z

    .line 349
    return-void
.end method
