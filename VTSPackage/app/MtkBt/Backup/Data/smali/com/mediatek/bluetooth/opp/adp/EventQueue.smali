.class public Lcom/mediatek/bluetooth/opp/adp/EventQueue;
.super Ljava/lang/Object;
.source "EventQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<EventType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mIsCanceled:Z

.field private mQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<TEventType;>;"
        }
    .end annotation
.end field

.field private mReturnCount:I

.field private mReturnThreshold:I

.field private mTimeout:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .parameter "timeout"
    .parameter "returnThreshold"

    .prologue
    .line 63
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mIsCanceled:Z

    .line 56
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    .line 65
    iput p1, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mTimeout:I

    .line 66
    iput p2, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mReturnThreshold:I

    .line 67
    return-void
.end method


# virtual methods
.method public cancelWaitNewEvent()V
    .locals 3

    .prologue
    .line 143
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 145
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mIsCanceled:Z

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EventQueue.cancelWaitNewEvent():"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 152
    monitor-exit v1

    .line 153
    return-void

    .line 152
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 179
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 182
    monitor-exit v1

    .line 183
    return-void

    .line 182
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TEventType;)Z"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    .local p1, event:Ljava/lang/Object;,"TEventType;"
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getPrintableString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 213
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .local v2, res:Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 216
    .local v0, e:Ljava/lang/Object;,"TEventType;"
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 218
    .end local v0           #e:Ljava/lang/Object;,"TEventType;"
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public notifyNewEvent(Ljava/lang/Object;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TEventType;)V"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    .local p1, newEvent:Ljava/lang/Object;,"TEventType;"
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 164
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EventQueue.notifyNewEvent() after insert queue size:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 170
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 171
    monitor-exit v1

    .line 172
    return-void

    .line 171
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 192
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method public waitNewEvent()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TEventType;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 71
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    iget v0, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mTimeout:I

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public waitNewEvent(I)Ljava/lang/Object;
    .locals 7
    .parameter "waitTimeout"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TEventType;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<TEventType;>;"
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 83
    iput v3, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mReturnCount:I

    .line 87
    :goto_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    monitor-enter v3

    .line 91
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EventQueue.waitNewEvent() before remove queue size:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 95
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 97
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    monitor-exit v3

    .line 121
    :goto_1
    return-object v2

    .line 98
    :cond_0
    iget v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mReturnThreshold:I

    if-lez v4, :cond_1

    .line 103
    iget v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mReturnCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mReturnCount:I

    .line 104
    iget v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mReturnCount:I

    iget v5, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mReturnThreshold:I

    if-lt v4, v5, :cond_1

    .line 106
    monitor-exit v3

    goto :goto_1

    .line 134
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 112
    :cond_1
    :try_start_1
    iget-boolean v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mIsCanceled:Z

    if-eqz v4, :cond_2

    .line 114
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mIsCanceled:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalMonitorStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    .line 115
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 117
    :cond_2
    :try_start_3
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mQueue:Ljava/util/LinkedList;

    int-to-long v5, p1

    invoke-virtual {v4, v5, v6}, Ljava/lang/Object;->wait(J)V

    .line 118
    iget-boolean v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mIsCanceled:Z

    if-eqz v4, :cond_3

    .line 120
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->mIsCanceled:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalMonitorStateException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_2

    .line 121
    :try_start_4
    monitor-exit v3

    goto :goto_1

    .line 123
    :catch_0
    move-exception v1

    .line 125
    .local v1, ie:Ljava/lang/InterruptedException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EventQueue.waitNewEvent() thread["

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "] interrupted"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 126
    throw v1

    .line 127
    .end local v1           #ie:Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 128
    .local v0, ex:Ljava/lang/IllegalMonitorStateException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EventQueue.waitNewEvent() error: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalMonitorStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 129
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v4, "EventQueue.waitNewEvent() error."

    invoke-direct {v2, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 130
    .end local v0           #ex:Ljava/lang/IllegalMonitorStateException;
    :catch_2
    move-exception v0

    .line 131
    .local v0, ex:Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EventQueue.waitNewEvent() error: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 132
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v4, "EventQueue.waitNewEvent() error."

    invoke-direct {v2, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 134
    .end local v0           #ex:Ljava/lang/IllegalArgumentException;
    :cond_3
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0
.end method
