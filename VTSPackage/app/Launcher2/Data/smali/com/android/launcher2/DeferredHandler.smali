.class public Lcom/android/launcher2/DeferredHandler;
.super Ljava/lang/Object;
.source "DeferredHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/DeferredHandler$IdleRunnable;,
        Lcom/android/launcher2/DeferredHandler$Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DeferredHandler"


# instance fields
.field private mHandler:Lcom/android/launcher2/DeferredHandler$Impl;

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
    .line 75
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    .line 37
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mMessageQueue:Landroid/os/MessageQueue;

    .line 38
    new-instance v0, Lcom/android/launcher2/DeferredHandler$Impl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/launcher2/DeferredHandler$Impl;-><init>(Lcom/android/launcher2/DeferredHandler;Lcom/android/launcher2/DeferredHandler$1;)V

    iput-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mHandler:Lcom/android/launcher2/DeferredHandler$Impl;

    .line 76
    return-void
.end method

.method static synthetic access$100(Lcom/android/launcher2/DeferredHandler;)Ljava/util/LinkedList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/launcher2/DeferredHandler;)Landroid/os/MessageQueue;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mMessageQueue:Landroid/os/MessageQueue;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 118
    iget-object v1, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 119
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 120
    monitor-exit v1

    .line 121
    return-void

    .line 120
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
    .line 105
    iget-object v3, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v3

    .line 106
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 108
    .local v0, iter:Ljava/util/ListIterator;,"Ljava/util/ListIterator<Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 109
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 110
    .local v1, p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    iget-object v2, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 111
    invoke-interface {v0}, Ljava/util/ListIterator;->remove()V

    goto :goto_0

    .line 114
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

    .line 115
    return-void
.end method

.method public cancelRunnable(Ljava/lang/Runnable;)V
    .locals 2
    .parameter "runnable"

    .prologue
    .line 100
    iget-object v1, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 101
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 102
    monitor-exit v1

    .line 103
    return-void

    .line 102
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
    .line 125
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 126
    .local v2, queue:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;>;"
    iget-object v4, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v4

    .line 127
    :try_start_0
    iget-object v3, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 128
    iget-object v3, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 129
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
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

    .line 131
    .local v1, p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    iget-object v3, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 129
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 133
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "runnable"

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/DeferredHandler;->post(Ljava/lang/Runnable;I)V

    .line 81
    return-void
.end method

.method public post(Ljava/lang/Runnable;I)V
    .locals 4
    .parameter "runnable"
    .parameter "type"

    .prologue
    .line 83
    iget-object v1, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    monitor-enter v1

    .line 84
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    new-instance v2, Landroid/util/Pair;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 85
    iget-object v0, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/android/launcher2/DeferredHandler;->scheduleNextLocked()V

    .line 88
    :cond_0
    monitor-exit v1

    .line 89
    return-void

    .line 88
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
    .line 93
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/DeferredHandler;->postIdle(Ljava/lang/Runnable;I)V

    .line 94
    return-void
.end method

.method public postIdle(Ljava/lang/Runnable;I)V
    .locals 1
    .parameter "runnable"
    .parameter "type"

    .prologue
    .line 96
    new-instance v0, Lcom/android/launcher2/DeferredHandler$IdleRunnable;

    invoke-direct {v0, p0, p1}, Lcom/android/launcher2/DeferredHandler$IdleRunnable;-><init>(Lcom/android/launcher2/DeferredHandler;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0, p2}, Lcom/android/launcher2/DeferredHandler;->post(Ljava/lang/Runnable;I)V

    .line 97
    return-void
.end method

.method scheduleNextLocked()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 136
    iget-object v2, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 137
    iget-object v2, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 138
    .local v0, p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Runnable;

    .line 139
    .local v1, peek:Ljava/lang/Runnable;
    instance-of v2, v1, Lcom/android/launcher2/DeferredHandler$IdleRunnable;

    if-eqz v2, :cond_1

    .line 140
    iget-object v2, p0, Lcom/android/launcher2/DeferredHandler;->mMessageQueue:Landroid/os/MessageQueue;

    iget-object v3, p0, Lcom/android/launcher2/DeferredHandler;->mHandler:Lcom/android/launcher2/DeferredHandler$Impl;

    invoke-virtual {v2, v3}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 143
    iget-object v2, p0, Lcom/android/launcher2/DeferredHandler;->mQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-ne v2, v4, :cond_0

    .line 144
    iget-object v2, p0, Lcom/android/launcher2/DeferredHandler;->mHandler:Lcom/android/launcher2/DeferredHandler$Impl;

    new-instance v3, Lcom/android/launcher2/DeferredHandler$1;

    invoke-direct {v3, p0}, Lcom/android/launcher2/DeferredHandler$1;-><init>(Lcom/android/launcher2/DeferredHandler;)V

    invoke-virtual {v2, v3}, Lcom/android/launcher2/DeferredHandler$Impl;->post(Ljava/lang/Runnable;)Z

    .line 156
    .end local v0           #p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    .end local v1           #peek:Ljava/lang/Runnable;
    :cond_0
    :goto_0
    return-void

    .line 153
    .restart local v0       #p:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Runnable;Ljava/lang/Integer;>;"
    .restart local v1       #peek:Ljava/lang/Runnable;
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/DeferredHandler;->mHandler:Lcom/android/launcher2/DeferredHandler$Impl;

    invoke-virtual {v2, v4}, Lcom/android/launcher2/DeferredHandler$Impl;->sendEmptyMessage(I)Z

    goto :goto_0
.end method
