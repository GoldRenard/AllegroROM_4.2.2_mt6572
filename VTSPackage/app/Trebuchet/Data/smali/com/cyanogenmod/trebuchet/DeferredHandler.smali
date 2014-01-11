.class public Lcom/cyanogenmod/trebuchet/DeferredHandler;
.super Ljava/lang/Object;
.source "DeferredHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/DeferredHandler$1;,
        Lcom/cyanogenmod/trebuchet/DeferredHandler$IdleRunnable;,
        Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;
    }
.end annotation


# instance fields
.field private mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;

.field private mMessageQueue:Landroid/os/MessageQueue;

.field private mQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    .line 36
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mMessageQueue:Landroid/os/MessageQueue;

    .line 37
    new-instance v0, Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;-><init>(Lcom/cyanogenmod/trebuchet/DeferredHandler;Lcom/cyanogenmod/trebuchet/DeferredHandler$1;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;

    .line 75
    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/DeferredHandler;)Ljava/util/LinkedList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 117
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 118
    :try_start_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 119
    monitor-exit v1

    .line 120
    return-void

    .line 119
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public cancelAllRunnablesOfType(I)V
    .locals 4
    .parameter "type"

    .prologue
    .line 104
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v3

    .line 105
    :try_start_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 107
    .local v0, iter:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 108
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 109
    .local v1, p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    iget-object v2, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 110
    invoke-interface {v0}, Ljava/util/ListIterator;->remove()V

    goto :goto_0

    .line 113
    .end local v0           #iter:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;>;"
    .end local v1           #p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0       #iter:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;>;"
    :cond_1
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    return-void
.end method

.method public cancelRunnable(Ljava/lang/Runnable;)V
    .locals 2
    .parameter "runnable"

    .prologue
    .line 99
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 100
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    monitor-exit v1

    .line 102
    return-void

    .line 101
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public flush()V
    .locals 5

    .prologue
    .line 124
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 125
    .local v2, queue:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;>;"
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v4

    .line 126
    :try_start_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 127
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 128
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 130
    .local v1, p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    iget-object v3, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 128
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 132
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "runnable"

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;I)V

    .line 80
    return-void
.end method

.method public post(Ljava/lang/Runnable;I)V
    .locals 4
    .parameter "runnable"
    .parameter "type"

    .prologue
    .line 82
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    new-instance v2, Landroid/util/Pair;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 84
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 85
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->scheduleNextLocked()V

    .line 87
    :cond_0
    monitor-exit v1

    .line 88
    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public postIdle(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "runnable"

    .prologue
    .line 92
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->postIdle(Ljava/lang/Runnable;I)V

    .line 93
    return-void
.end method

.method public postIdle(Ljava/lang/Runnable;I)V
    .locals 1
    .parameter "runnable"
    .parameter "type"

    .prologue
    .line 95
    new-instance v0, Lcom/cyanogenmod/trebuchet/DeferredHandler$IdleRunnable;

    invoke-direct {v0, p0, p1}, Lcom/cyanogenmod/trebuchet/DeferredHandler$IdleRunnable;-><init>(Lcom/cyanogenmod/trebuchet/DeferredHandler;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0, p2}, Lcom/cyanogenmod/trebuchet/DeferredHandler;->post(Ljava/lang/Runnable;I)V

    .line 96
    return-void
.end method

.method scheduleNextLocked()V
    .locals 4

    .prologue
    .line 135
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 136
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 137
    .local v0, p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Runnable;

    .line 138
    .local v1, peek:Ljava/lang/Runnable;
    instance-of v2, v1, Lcom/cyanogenmod/trebuchet/DeferredHandler$IdleRunnable;

    if-eqz v2, :cond_1

    .line 139
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mMessageQueue:Landroid/os/MessageQueue;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;

    invoke-virtual {v2, v3}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 144
    .end local v0           #p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    .end local v1           #peek:Ljava/lang/Runnable;
    :cond_0
    :goto_0
    return-void

    .line 141
    .restart local v0       #p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    .restart local v1       #peek:Ljava/lang/Runnable;
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/DeferredHandler;->mHandler:Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/DeferredHandler$Impl;->sendEmptyMessage(I)Z

    goto :goto_0
.end method
