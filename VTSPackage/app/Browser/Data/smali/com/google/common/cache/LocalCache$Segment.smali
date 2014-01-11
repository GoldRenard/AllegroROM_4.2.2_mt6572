.class Lcom/google/common/cache/LocalCache$Segment;
.super Ljava/util/concurrent/locks/ReentrantLock;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Segment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/locks/ReentrantLock;"
    }
.end annotation


# instance fields
.field final accessQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field volatile count:I

.field final keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<TK;>;"
        }
    .end annotation
.end field

.field final map:Lcom/google/common/cache/LocalCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field final maxSegmentWeight:J

.field modCount:I

.field final readCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field final recencyQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

.field volatile table:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field threshold:I

.field totalWeight:I
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field final valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<TV;>;"
        }
    .end annotation
.end field

.field final writeQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/cache/LocalCache;IJLcom/google/common/cache/AbstractCache$StatsCounter;)V
    .locals 2
    .parameter
    .parameter "initialCapacity"
    .parameter "maxSegmentWeight"
    .parameter "statsCounter"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache",
            "<TK;TV;>;IJ",
            "Lcom/google/common/cache/AbstractCache$StatsCounter;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, map:Lcom/google/common/cache/LocalCache;,"Lcom/google/common/cache/LocalCache<TK;TV;>;"
    const/4 v1, 0x0

    .line 2138
    invoke-direct {p0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 2118
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2139
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    .line 2140
    iput-wide p3, p0, Lcom/google/common/cache/LocalCache$Segment;->maxSegmentWeight:J

    .line 2141
    iput-object p5, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    .line 2142
    invoke-virtual {p0, p2}, Lcom/google/common/cache/LocalCache$Segment;->newEntryArray(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$Segment;->initTable(Ljava/util/concurrent/atomic/AtomicReferenceArray;)V

    .line 2144
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesKeyReferences()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    :goto_0
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 2147
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesValueReferences()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    :cond_0
    iput-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 2150
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesAccessQueue()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    :goto_1
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->recencyQueue:Ljava/util/Queue;

    .line 2154
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesWriteQueue()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Lcom/google/common/cache/LocalCache$WriteQueue;

    invoke-direct {v0}, Lcom/google/common/cache/LocalCache$WriteQueue;-><init>()V

    :goto_2
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    .line 2158
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesAccessQueue()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Lcom/google/common/cache/LocalCache$AccessQueue;

    invoke-direct {v0}, Lcom/google/common/cache/LocalCache$AccessQueue;-><init>()V

    :goto_3
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    .line 2161
    return-void

    :cond_1
    move-object v0, v1

    .line 2144
    goto :goto_0

    .line 2150
    :cond_2
    invoke-static {}, Lcom/google/common/cache/LocalCache;->discardingQueue()Ljava/util/Queue;

    move-result-object v0

    goto :goto_1

    .line 2154
    :cond_3
    invoke-static {}, Lcom/google/common/cache/LocalCache;->discardingQueue()Ljava/util/Queue;

    move-result-object v0

    goto :goto_2

    .line 2158
    :cond_4
    invoke-static {}, Lcom/google/common/cache/LocalCache;->discardingQueue()Ljava/util/Queue;

    move-result-object v0

    goto :goto_3
.end method


# virtual methods
.method cleanUp()V
    .locals 3

    .prologue
    .line 3470
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v2}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    .line 3471
    .local v0, now:J
    invoke-virtual {p0, v0, v1}, Lcom/google/common/cache/LocalCache$Segment;->runLockedCleanup(J)V

    .line 3472
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->runUnlockedCleanup()V

    .line 3473
    return-void
.end method

.method clear()V
    .locals 5

    .prologue
    .line 3236
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget v3, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v3, :cond_4

    .line 3237
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3239
    :try_start_0
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3240
    .local v2, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 3241
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_1
    if-eqz v0, :cond_1

    .line 3243
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3244
    sget-object v3, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/RemovalCause;)V

    .line 3241
    :cond_0
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_1

    .line 3240
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3248
    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_2
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 3249
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3248
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 3251
    :cond_3
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->clearReferenceQueues()V

    .line 3252
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->clear()V

    .line 3253
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->clear()V

    .line 3254
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 3256
    iget v3, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3257
    const/4 v3, 0x0

    iput v3, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3259
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3260
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .line 3263
    .end local v1           #i:I
    .end local v2           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :cond_4
    return-void

    .line 3259
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3260
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v3
.end method

.method clearKeyReferenceQueue()V
    .locals 1

    .prologue
    .line 2552
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2553
    return-void
.end method

.method clearReferenceQueues()V
    .locals 1

    .prologue
    .line 2543
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesKeyReferences()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2544
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->clearKeyReferenceQueue()V

    .line 2546
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesValueReferences()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2547
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->clearValueReferenceQueue()V

    .line 2549
    :cond_1
    return-void
.end method

.method clearValueReferenceQueue()V
    .locals 1

    .prologue
    .line 2556
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2557
    return-void
.end method

.method containsKey(Ljava/lang/Object;I)Z
    .locals 5
    .parameter "key"
    .parameter "hash"

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v3, 0x0

    .line 2805
    :try_start_0
    iget v4, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v4, :cond_2

    .line 2806
    iget-object v4, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v4}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v1

    .line 2807
    .local v1, now:J
    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->getLiveEntry(Ljava/lang/Object;IJ)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 2808
    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-nez v0, :cond_0

    .line 2816
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1           #now:J
    :goto_0
    return v3

    .line 2811
    .restart local v0       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v1       #now:J
    :cond_0
    :try_start_1
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    if-eqz v4, :cond_1

    const/4 v3, 0x1

    .line 2816
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_0

    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1           #now:J
    :cond_2
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v3
.end method

.method containsValue(Ljava/lang/Object;)Z
    .locals 8
    .parameter "value"
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 2827
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :try_start_0
    iget v7, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v7, :cond_3

    .line 2828
    iget-object v7, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v7, v7, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v7}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v4

    .line 2829
    .local v4, now:J
    iget-object v6, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2830
    .local v6, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    .line 2831
    .local v3, length:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v3, :cond_3

    .line 2832
    invoke-virtual {v6, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_1
    if-eqz v0, :cond_2

    .line 2833
    invoke-virtual {p0, v0, v4, v5}, Lcom/google/common/cache/LocalCache$Segment;->getLiveValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Ljava/lang/Object;

    move-result-object v1

    .line 2834
    .local v1, entryValue:Ljava/lang/Object;,"TV;"
    if-nez v1, :cond_1

    .line 2832
    :cond_0
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_1

    .line 2837
    :cond_1
    iget-object v7, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v7, v7, Lcom/google/common/cache/LocalCache;->valueEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v7, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    if-eqz v7, :cond_0

    .line 2838
    const/4 v7, 0x1

    .line 2846
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1           #entryValue:Ljava/lang/Object;,"TV;"
    .end local v2           #i:I
    .end local v3           #length:I
    .end local v4           #now:J
    .end local v6           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :goto_2
    return v7

    .line 2831
    .restart local v0       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v2       #i:I
    .restart local v3       #length:I
    .restart local v4       #now:J
    .restart local v6       #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2844
    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2           #i:I
    .end local v3           #length:I
    .end local v4           #now:J
    .end local v6           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :cond_3
    const/4 v7, 0x0

    .line 2846
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_2

    :catchall_0
    move-exception v7

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v7
.end method

.method copyEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2183
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, original:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, newNext:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v1

    .line 2184
    .local v1, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->entryFactory:Lcom/google/common/cache/LocalCache$EntryFactory;

    invoke-virtual {v2, p0, p1, p2}, Lcom/google/common/cache/LocalCache$EntryFactory;->copyEntry(Lcom/google/common/cache/LocalCache$Segment;Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2185
    .local v0, newEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-interface {v1, v2, v0}, Lcom/google/common/cache/LocalCache$ValueReference;->copyFor(Ljava/lang/ref/ReferenceQueue;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2186
    return-object v0
.end method

.method drainKeyReferenceQueue()V
    .locals 4
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2514
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v1, 0x0

    .line 2515
    .local v1, i:I
    :cond_0
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v3}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v2

    .local v2, ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<+TK;>;"
    if-eqz v2, :cond_1

    move-object v0, v2

    .line 2517
    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2518
    .local v0, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v3, v0}, Lcom/google/common/cache/LocalCache;->reclaimKey(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V

    .line 2519
    add-int/lit8 v1, v1, 0x1

    const/16 v3, 0x10

    if-ne v1, v3, :cond_0

    .line 2523
    .end local v0           #entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_1
    return-void
.end method

.method drainRecencyQueue()V
    .locals 2
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2619
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->recencyQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v0, :cond_1

    .line 2624
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2625
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2628
    :cond_1
    return-void
.end method

.method drainReferenceQueues()V
    .locals 1
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2503
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesKeyReferences()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2504
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainKeyReferenceQueue()V

    .line 2506
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesValueReferences()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2507
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainValueReferenceQueue()V

    .line 2509
    :cond_1
    return-void
.end method

.method drainValueReferenceQueue()V
    .locals 4
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2528
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v0, 0x0

    .line 2529
    .local v0, i:I
    :cond_0
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v3}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v1

    .local v1, ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<+TV;>;"
    if-eqz v1, :cond_1

    move-object v2, v1

    .line 2531
    check-cast v2, Lcom/google/common/cache/LocalCache$ValueReference;

    .line 2532
    .local v2, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v3, v2}, Lcom/google/common/cache/LocalCache;->reclaimValue(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2533
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x10

    if-ne v0, v3, :cond_0

    .line 2537
    .end local v2           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_1
    return-void
.end method

.method enqueueNotification(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/RemovalCause;)V
    .locals 3
    .parameter
    .parameter "cause"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/RemovalCause;",
            ")V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2667
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2, p2}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 2668
    return-void
.end method

.method enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V
    .locals 4
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "hash"
    .end parameter
    .parameter
    .end parameter
    .parameter "cause"
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/RemovalCause;",
            ")V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2673
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    iget v2, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->getWeight()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    .line 2674
    invoke-virtual {p4}, Lcom/google/common/cache/RemovalCause;->wasEvicted()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2675
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-interface {v2}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordEviction()V

    .line 2677
    :cond_0
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->removalNotificationQueue:Ljava/util/Queue;

    sget-object v3, Lcom/google/common/cache/LocalCache;->DISCARDING_QUEUE:Ljava/util/Queue;

    if-eq v2, v3, :cond_1

    .line 2678
    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 2679
    .local v1, value:Ljava/lang/Object;,"TV;"
    new-instance v0, Lcom/google/common/cache/RemovalNotification;

    invoke-direct {v0, p1, v1, p4}, Lcom/google/common/cache/RemovalNotification;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/common/cache/RemovalCause;)V

    .line 2680
    .local v0, notification:Lcom/google/common/cache/RemovalNotification;,"Lcom/google/common/cache/RemovalNotification<TK;TV;>;"
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->removalNotificationQueue:Ljava/util/Queue;

    invoke-interface {v2, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 2682
    .end local v0           #notification:Lcom/google/common/cache/RemovalNotification;,"Lcom/google/common/cache/RemovalNotification<TK;TV;>;"
    .end local v1           #value:Ljava/lang/Object;,"TV;"
    :cond_1
    return-void
.end method

.method evictEntries()V
    .locals 5
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2690
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1}, Lcom/google/common/cache/LocalCache;->evictsBySize()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2701
    :cond_0
    return-void

    .line 2694
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainRecencyQueue()V

    .line 2695
    :cond_2
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    int-to-long v1, v1

    iget-wide v3, p0, Lcom/google/common/cache/LocalCache$Segment;->maxSegmentWeight:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 2696
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->getNextEvictable()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2697
    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    sget-object v2, Lcom/google/common/cache/RemovalCause;->SIZE:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2698
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method expand()V
    .locals 18
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2927
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2928
    .local v14, oldTable:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v12

    .line 2929
    .local v12, oldCapacity:I
    const/high16 v17, 0x4000

    move/from16 v0, v17

    if-lt v12, v0, :cond_0

    .line 2992
    :goto_0
    return-void

    .line 2943
    :cond_0
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 2944
    .local v5, newCount:I
    shl-int/lit8 v17, v12, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/common/cache/LocalCache$Segment;->newEntryArray(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-result-object v10

    .line 2945
    .local v10, newTable:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v17

    mul-int/lit8 v17, v17, 0x3

    div-int/lit8 v17, v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    .line 2946
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v17

    add-int/lit8 v8, v17, -0x1

    .line 2947
    .local v8, newMask:I
    const/4 v13, 0x0

    .local v13, oldIndex:I
    :goto_1
    if-ge v13, v12, :cond_6

    .line 2950
    invoke-virtual {v14, v13}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2952
    .local v3, head:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v3, :cond_1

    .line 2953
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .line 2954
    .local v11, next:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    and-int v4, v17, v8

    .line 2957
    .local v4, headIndex:I
    if-nez v11, :cond_2

    .line 2958
    invoke-virtual {v10, v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2947
    .end local v4           #headIndex:I
    .end local v11           #next:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 2963
    .restart local v4       #headIndex:I
    .restart local v11       #next:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_2
    move-object v15, v3

    .line 2964
    .local v15, tail:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move/from16 v16, v4

    .line 2965
    .local v16, tailIndex:I
    move-object v2, v11

    .local v2, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_2
    if-eqz v2, :cond_4

    .line 2966
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    and-int v7, v17, v8

    .line 2967
    .local v7, newIndex:I
    move/from16 v0, v16

    if-eq v7, v0, :cond_3

    .line 2969
    move/from16 v16, v7

    .line 2970
    move-object v15, v2

    .line 2965
    :cond_3
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    goto :goto_2

    .line 2973
    .end local v7           #newIndex:I
    :cond_4
    move/from16 v0, v16

    invoke-virtual {v10, v0, v15}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2976
    move-object v2, v3

    :goto_3
    if-eq v2, v15, :cond_1

    .line 2977
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/common/cache/LocalCache$Segment;->isCollected(Lcom/google/common/cache/LocalCache$ReferenceEntry;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 2978
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeCollectedEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V

    .line 2979
    add-int/lit8 v5, v5, -0x1

    .line 2976
    :goto_4
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    goto :goto_3

    .line 2981
    :cond_5
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    and-int v7, v17, v8

    .line 2982
    .restart local v7       #newIndex:I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2983
    .local v9, newNext:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v9}, Lcom/google/common/cache/LocalCache$Segment;->copyEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v6

    .line 2984
    .local v6, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {v10, v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    goto :goto_4

    .line 2990
    .end local v2           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3           #head:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4           #headIndex:I
    .end local v6           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v7           #newIndex:I
    .end local v9           #newNext:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v11           #next:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v15           #tail:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v16           #tailIndex:I
    :cond_6
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2991
    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    goto/16 :goto_0
.end method

.method expireEntries(J)V
    .locals 3
    .parameter "now"
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2648
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainRecencyQueue()V

    .line 2651
    :cond_0
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1, v0, p1, p2}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2652
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    sget-object v2, Lcom/google/common/cache/RemovalCause;->EXPIRED:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2653
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2656
    :cond_1
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .restart local v0       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1, v0, p1, p2}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2657
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    sget-object v2, Lcom/google/common/cache/RemovalCause;->EXPIRED:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2658
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2661
    :cond_2
    return-void
.end method

.method get(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 8
    .parameter "key"
    .parameter "hash"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v0, 0x0

    .line 2783
    :try_start_0
    iget v2, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v2, :cond_2

    .line 2784
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v2}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v5

    .line 2785
    .local v5, now:J
    invoke-virtual {p0, p1, p2, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->getLiveEntry(Ljava/lang/Object;IJ)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 2786
    .local v1, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-nez v1, :cond_0

    .line 2799
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v1           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5           #now:J
    :goto_0
    return-object v0

    .line 2790
    .restart local v1       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v5       #now:J
    :cond_0
    :try_start_1
    invoke-interface {v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v4

    .line 2791
    .local v4, value:Ljava/lang/Object;,"TV;"
    if-eqz v4, :cond_1

    .line 2792
    invoke-virtual {p0, v1, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V

    .line 2793
    invoke-interface {v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v7, v0, Lcom/google/common/cache/LocalCache;->defaultLoader:Lcom/google/common/cache/CacheLoader;

    move-object v0, p0

    move v3, p2

    invoke-virtual/range {v0 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->scheduleRefresh(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILjava/lang/Object;JLcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 2799
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_0

    .line 2795
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2799
    .end local v1           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4           #value:Ljava/lang/Object;,"TV;"
    .end local v5           #now:J
    :cond_2
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v0
.end method

.method get(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .locals 11
    .parameter
    .parameter "hash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2209
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, loader:Lcom/google/common/cache/CacheLoader;,"Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    :try_start_0
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v0, :cond_1

    .line 2211
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->getEntry(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v1

    .line 2212
    .local v1, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v1, :cond_1

    .line 2213
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v5

    .line 2214
    .local v5, now:J
    invoke-virtual {p0, v1, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->getLiveValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Ljava/lang/Object;

    move-result-object v4

    .line 2215
    .local v4, value:Ljava/lang/Object;,"TV;"
    if-eqz v4, :cond_0

    .line 2216
    invoke-virtual {p0, v1, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V

    .line 2217
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordHits(I)V

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move-object v7, p3

    .line 2218
    invoke-virtual/range {v0 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->scheduleRefresh(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILjava/lang/Object;JLcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 2238
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v1           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4           #value:Ljava/lang/Object;,"TV;"
    .end local v5           #now:J
    :goto_0
    return-object v0

    .line 2220
    .restart local v1       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v4       #value:Ljava/lang/Object;,"TV;"
    .restart local v5       #now:J
    :cond_0
    :try_start_1
    invoke-interface {v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v10

    .line 2221
    .local v10, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v10}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2222
    invoke-virtual {p0, v1, p1, v10}, Lcom/google/common/cache/LocalCache$Segment;->waitForLoadingValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ValueReference;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    .line 2238
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_0

    .line 2228
    .end local v1           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4           #value:Ljava/lang/Object;,"TV;"
    .end local v5           #now:J
    .end local v10           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_1
    :try_start_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->lockedGetOrLoad(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v0

    .line 2238
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_0

    .line 2229
    :catch_0
    move-exception v9

    .line 2230
    .local v9, ee:Ljava/util/concurrent/ExecutionException;
    :try_start_3
    invoke-virtual {v9}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v8

    .line 2231
    .local v8, cause:Ljava/lang/Throwable;
    instance-of v0, v8, Ljava/lang/Error;

    if-eqz v0, :cond_2

    .line 2232
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionError;

    check-cast v8, Ljava/lang/Error;

    .end local v8           #cause:Ljava/lang/Throwable;
    invoke-direct {v0, v8}, Lcom/google/common/util/concurrent/ExecutionError;-><init>(Ljava/lang/Error;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2238
    .end local v9           #ee:Ljava/util/concurrent/ExecutionException;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v0

    .line 2233
    .restart local v8       #cause:Ljava/lang/Throwable;
    .restart local v9       #ee:Ljava/util/concurrent/ExecutionException;
    :cond_2
    :try_start_4
    instance-of v0, v8, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_3

    .line 2234
    new-instance v0, Lcom/google/common/util/concurrent/UncheckedExecutionException;

    invoke-direct {v0, v8}, Lcom/google/common/util/concurrent/UncheckedExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 2236
    :cond_3
    throw v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method getAndRecordStats(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;
    .locals 5
    .parameter
    .parameter "hash"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2379
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, newValue:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    const/4 v0, 0x0

    .line 2381
    .local v0, value:Ljava/lang/Object;,"TV;"
    :try_start_0
    invoke-static {p4}, Lcom/google/common/util/concurrent/Uninterruptibles;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0

    .line 2382
    if-nez v0, :cond_1

    .line 2383
    new-instance v1, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CacheLoader returned null for key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2389
    .end local v0           #value:Ljava/lang/Object;,"TV;"
    :catchall_0
    move-exception v1

    if-nez v0, :cond_0

    .line 2390
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->elapsedNanos()J

    move-result-wide v3

    invoke-interface {v2, v3, v4}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordLoadException(J)V

    .line 2391
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->removeLoadingValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;)Z

    :cond_0
    throw v1

    .line 2385
    .restart local v0       #value:Ljava/lang/Object;,"TV;"
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->elapsedNanos()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordLoadSuccess(J)V

    .line 2386
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/common/cache/LocalCache$Segment;->storeLoadedValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2389
    if-nez v0, :cond_2

    .line 2390
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->elapsedNanos()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordLoadException(J)V

    .line 2391
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->removeLoadingValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;)Z

    :cond_2
    return-object v0
.end method

.method getEntry(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 3
    .parameter "key"
    .parameter "hash"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 2727
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0, p2}, Lcom/google/common/cache/LocalCache$Segment;->getFirst(I)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_3

    .line 2728
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v2

    if-eq v2, p2, :cond_1

    .line 2727
    :cond_0
    :goto_1
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_0

    .line 2732
    :cond_1
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 2733
    .local v1, entryKey:Ljava/lang/Object;,"TK;"
    if-nez v1, :cond_2

    .line 2734
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V

    goto :goto_1

    .line 2738
    :cond_2
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v2, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2743
    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1           #entryKey:Ljava/lang/Object;,"TK;"
    :goto_2
    return-object v0

    .restart local v0       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method getFirst(I)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 2
    .parameter "hash"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2719
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2720
    .local v0, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, p1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    return-object v1
.end method

.method getLiveEntry(Ljava/lang/Object;IJ)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 3
    .parameter "key"
    .parameter "hash"
    .parameter "now"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "IJ)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v1, 0x0

    .line 2748
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->getEntry(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2749
    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-nez v0, :cond_1

    move-object v0, v1

    .line 2755
    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_0
    :goto_0
    return-object v0

    .line 2751
    .restart local v0       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_1
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v2, v0, p3, p4}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2752
    invoke-virtual {p0, p3, p4}, Lcom/google/common/cache/LocalCache$Segment;->tryExpireEntries(J)V

    move-object v0, v1

    .line 2753
    goto :goto_0
.end method

.method getLiveValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Ljava/lang/Object;
    .locals 3
    .parameter
    .parameter "now"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;J)TV;"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    const/4 v1, 0x0

    .line 2763
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    .line 2764
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V

    move-object v0, v1

    .line 2777
    :cond_0
    :goto_0
    return-object v0

    .line 2767
    :cond_1
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 2768
    .local v0, value:Ljava/lang/Object;,"TV;"
    if-nez v0, :cond_2

    .line 2769
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V

    move-object v0, v1

    .line 2770
    goto :goto_0

    .line 2773
    :cond_2
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v2, p1, p2, p3}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2774
    invoke-virtual {p0, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->tryExpireEntries(J)V

    move-object v0, v1

    .line 2775
    goto :goto_0
.end method

.method getNextEvictable()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2705
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2706
    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ValueReference;->getWeight()I

    move-result v2

    .line 2707
    .local v2, weight:I
    if-lez v2, :cond_0

    .line 2708
    return-object v0

    .line 2711
    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2           #weight:I
    :cond_1
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
.end method

.method initTable(Ljava/util/concurrent/atomic/AtomicReferenceArray;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 2168
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, newTable:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    .line 2169
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->customWeigher()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/google/common/cache/LocalCache$Segment;->maxSegmentWeight:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 2171
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    .line 2173
    :cond_0
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2174
    return-void
.end method

.method insertLoadingValueReference(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$LoadingValueReference;
    .locals 10
    .parameter
    .parameter "hash"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 2438
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const/4 v0, 0x0

    .line 2439
    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2441
    :try_start_0
    iget-object v9, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v9, v9, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v9}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v5

    .line 2442
    .local v5, now:J
    invoke-virtual {p0, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 2444
    iget-object v7, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2445
    .local v7, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    and-int v3, p2, v9

    .line 2446
    .local v3, index:I
    invoke-virtual {v7, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2449
    .local v2, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v0, v2

    :goto_0
    if-eqz v0, :cond_2

    .line 2450
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 2451
    .local v1, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v9

    if-ne v9, p2, :cond_1

    if-eqz v1, :cond_1

    iget-object v9, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v9, v9, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v9, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 2455
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v8

    .line 2456
    .local v8, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v9

    if-eqz v9, :cond_0

    .line 2458
    const/4 v4, 0x0

    .line 2477
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2478
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v1           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v8           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_1
    return-object v4

    .line 2462
    .restart local v1       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v8       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_0
    :try_start_1
    iget v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2463
    new-instance v4, Lcom/google/common/cache/LocalCache$LoadingValueReference;

    invoke-direct {v4, v8}, Lcom/google/common/cache/LocalCache$LoadingValueReference;-><init>(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2465
    .local v4, loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    invoke-interface {v0, v4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2477
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2478
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 2449
    .end local v4           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .end local v8           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_1
    :try_start_2
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_0

    .line 2470
    .end local v1           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_2
    iget v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2471
    new-instance v4, Lcom/google/common/cache/LocalCache$LoadingValueReference;

    invoke-direct {v4}, Lcom/google/common/cache/LocalCache$LoadingValueReference;-><init>()V

    .line 2472
    .restart local v4       #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2473
    invoke-interface {v0, v4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2474
    invoke-virtual {v7, v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2477
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2478
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 2477
    .end local v2           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3           #index:I
    .end local v4           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .end local v5           #now:J
    .end local v7           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v9

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2478
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v9
.end method

.method isCollected(Lcom/google/common/cache/LocalCache$ReferenceEntry;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    const/4 v1, 0x1

    .line 3434
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    .line 3438
    :cond_0
    :goto_0
    return v1

    .line 3437
    :cond_1
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v0

    .line 3438
    .local v0, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method loadAsync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 6
    .parameter
    .parameter "hash"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2356
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, loader:Lcom/google/common/cache/CacheLoader;,"Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    invoke-virtual {p3, p1, p4}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->loadFuture(Ljava/lang/Object;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v5

    .line 2357
    .local v5, loadingFuture:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    new-instance v0, Lcom/google/common/cache/LocalCache$Segment$1;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/common/cache/LocalCache$Segment$1;-><init>(Lcom/google/common/cache/LocalCache$Segment;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/util/concurrent/ListenableFuture;)V

    sget-object v1, Lcom/google/common/cache/LocalCache;->sameThreadExecutor:Lcom/google/common/util/concurrent/ListeningExecutorService;

    invoke-interface {v5, v0, v1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 2371
    return-object v5
.end method

.method loadSync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .locals 2
    .parameter
    .parameter "hash"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2350
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, loader:Lcom/google/common/cache/CacheLoader;,"Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    invoke-virtual {p3, p1, p4}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->loadFuture(Ljava/lang/Object;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 2351
    .local v0, loadingFuture:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/common/cache/LocalCache$Segment;->getAndRecordStats(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method lockedGetOrLoad(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .locals 20
    .parameter
    .parameter "hash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2245
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, loader:Lcom/google/common/cache/CacheLoader;,"Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    const/16 v16, 0x0

    .line 2246
    .local v16, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v9, 0x0

    .line 2247
    .local v9, loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    const/4 v4, 0x1

    .line 2249
    .local v4, createNewEntry:Z
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2252
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v12

    .line 2253
    .local v12, now:J
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 2255
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    move/from16 v17, v0

    add-int/lit8 v11, v17, -0x1

    .line 2256
    .local v11, newCount:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2257
    .local v14, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    and-int v8, p2, v17

    .line 2258
    .local v8, index:I
    invoke-virtual {v14, v8}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2260
    .local v7, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v5, v7

    .local v5, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v5, :cond_0

    .line 2261
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 2262
    .local v6, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    move/from16 v0, v17

    move/from16 v1, p2

    if-ne v0, v1, :cond_5

    if-eqz v6, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v6}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 2264
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v16

    .line 2265
    invoke-interface/range {v16 .. v16}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v17

    if-eqz v17, :cond_2

    .line 2266
    const/4 v4, 0x0

    .line 2291
    .end local v6           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_0
    :goto_1
    if-eqz v4, :cond_1

    .line 2292
    new-instance v10, Lcom/google/common/cache/LocalCache$LoadingValueReference;

    invoke-direct {v10}, Lcom/google/common/cache/LocalCache$LoadingValueReference;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2294
    .end local v9           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local v10, loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    if-nez v5, :cond_6

    .line 2295
    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2, v7}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v5

    .line 2296
    invoke-interface {v5, v10}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2297
    invoke-virtual {v14, v8, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    move-object v9, v10

    .line 2303
    .end local v10           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v9       #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    :cond_1
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2304
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .line 2307
    if-eqz v4, :cond_7

    .line 2312
    :try_start_2
    monitor-enter v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 2313
    :try_start_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v9, v3}, Lcom/google/common/cache/LocalCache$Segment;->loadSync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Ljava/lang/Object;

    move-result-object v15

    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    .line 2320
    :goto_3
    return-object v15

    .line 2268
    .restart local v6       #entryKey:Ljava/lang/Object;,"TK;"
    :cond_2
    :try_start_4
    invoke-interface/range {v16 .. v16}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v15

    .line 2269
    .local v15, value:Ljava/lang/Object;,"TV;"
    if-nez v15, :cond_3

    .line 2270
    sget-object v17, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 2283
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 2284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 2285
    move-object/from16 v0, p0

    iput v11, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 2303
    .end local v5           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v6           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v7           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v8           #index:I
    .end local v11           #newCount:I
    .end local v12           #now:J
    .end local v14           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .end local v15           #value:Ljava/lang/Object;,"TV;"
    :catchall_0
    move-exception v17

    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2304
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v17

    .line 2271
    .restart local v5       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v6       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v7       #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v8       #index:I
    .restart local v11       #newCount:I
    .restart local v12       #now:J
    .restart local v14       #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .restart local v15       #value:Ljava/lang/Object;,"TV;"
    :cond_3
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v12, v13}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 2274
    sget-object v17, Lcom/google/common/cache/RemovalCause;->EXPIRED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    goto :goto_4

    .line 2276
    :cond_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V

    .line 2277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordHits(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 2303
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2304
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_3

    .line 2260
    .end local v15           #value:Ljava/lang/Object;,"TV;"
    :cond_5
    :try_start_6
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v5

    goto/16 :goto_0

    .line 2299
    .end local v6           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v9           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v10       #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    :cond_6
    :try_start_7
    invoke-interface {v5, v10}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    move-object v9, v10

    .end local v10           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v9       #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    goto/16 :goto_2

    .line 2314
    :catchall_1
    move-exception v17

    :try_start_8
    monitor-exit v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :try_start_9
    throw v17
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 2316
    :catchall_2
    move-exception v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    throw v17

    .line 2320
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v16

    invoke-virtual {v0, v5, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->waitForLoadingValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ValueReference;)Ljava/lang/Object;

    move-result-object v15

    goto/16 :goto_3

    .line 2303
    .end local v9           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v10       #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    :catchall_3
    move-exception v17

    move-object v9, v10

    .end local v10           #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v9       #loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    goto :goto_5
.end method

.method newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 1
    .parameter
    .end parameter
    .parameter "hash"
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2178
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, next:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->entryFactory:Lcom/google/common/cache/LocalCache$EntryFactory;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$EntryFactory;->newEntry(Lcom/google/common/cache/LocalCache$Segment;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    return-object v0
.end method

.method newEntryArray(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .locals 1
    .parameter "size"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 2164
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    return-object v0
.end method

.method postReadCleanup()V
    .locals 1

    .prologue
    .line 3446
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    and-int/lit8 v0, v0, 0x3f

    if-nez v0, :cond_0

    .line 3447
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->cleanUp()V

    .line 3449
    :cond_0
    return-void
.end method

.method postWriteCleanup()V
    .locals 0

    .prologue
    .line 3466
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->runUnlockedCleanup()V

    .line 3467
    return-void
.end method

.method preWriteCleanup(J)V
    .locals 0
    .parameter "now"
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3459
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->runLockedCleanup(J)V

    .line 3460
    return-void
.end method

.method put(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;
    .locals 23
    .parameter
    .parameter "hash"
    .parameter
    .parameter "onlyIfAbsent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;Z)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 2852
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, value:Ljava/lang/Object;,"TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2854
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v4}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v8

    .line 2855
    .local v8, now:J
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 2857
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    .line 2858
    .local v20, newCount:I
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    move/from16 v0, v20

    if-le v0, v4, :cond_0

    .line 2859
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->expand()V

    .line 2860
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    .line 2863
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v21, v0

    .line 2864
    .local v21, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v21 .. v21}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    and-int v19, p2, v4

    .line 2865
    .local v19, index:I
    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2868
    .local v18, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v5, v18

    .local v5, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v5, :cond_5

    .line 2869
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v16

    .line 2870
    .local v16, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v4

    move/from16 v0, p2

    if-ne v4, v0, :cond_4

    if-eqz v16, :cond_4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v4, v0, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 2874
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v22

    .line 2875
    .local v22, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface/range {v22 .. v22}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v17

    .line 2877
    .local v17, entryValue:Ljava/lang/Object;,"TV;"
    if-nez v17, :cond_2

    .line 2878
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2879
    invoke-interface/range {v22 .. v22}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2880
    sget-object v4, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    .line 2881
    invoke-virtual/range {v4 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2882
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    move/from16 v20, v0

    .line 2887
    :goto_1
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 2888
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2889
    const/16 v17, 0x0

    .line 2917
    .end local v17           #entryValue:Ljava/lang/Object;,"TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2918
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v16           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v22           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_2
    return-object v17

    .restart local v16       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v17       #entryValue:Ljava/lang/Object;,"TV;"
    .restart local v22       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_1
    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    .line 2884
    :try_start_1
    invoke-virtual/range {v4 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2885
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    goto :goto_1

    .line 2890
    :cond_2
    if-eqz p4, :cond_3

    .line 2894
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v8, v9}, Lcom/google/common/cache/LocalCache$Segment;->recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2917
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2918
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2

    .line 2898
    :cond_3
    :try_start_2
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2899
    sget-object v4, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    .line 2900
    invoke-virtual/range {v4 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2901
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2917
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2918
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2

    .line 2868
    .end local v17           #entryValue:Ljava/lang/Object;,"TV;"
    .end local v22           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_4
    :try_start_3
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v5

    goto/16 :goto_0

    .line 2908
    .end local v16           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_5
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2909
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .local v11, newEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v10, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p3

    move-wide v14, v8

    .line 2910
    invoke-virtual/range {v10 .. v15}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2911
    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2912
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    .line 2913
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 2914
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2915
    const/16 v17, 0x0

    .line 2917
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2918
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto/16 :goto_2

    .line 2917
    .end local v5           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v8           #now:J
    .end local v11           #newEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v18           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v19           #index:I
    .end local v20           #newCount:I
    .end local v21           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v4

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2918
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v4
.end method

.method reclaimKey(Lcom/google/common/cache/LocalCache$ReferenceEntry;I)Z
    .locals 11
    .parameter
    .parameter "hash"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;I)Z"
        }
    .end annotation

    .prologue
    .line 3311
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3313
    :try_start_0
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3314
    .local v8, newCount:I
    iget-object v10, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3315
    .local v10, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    and-int v7, p2, v0

    .line 3316
    .local v7, index:I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3318
    .local v1, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v2, v1

    .local v2, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v2, :cond_1

    .line 3319
    if-ne v2, p1, :cond_0

    .line 3320
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3321
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v5

    sget-object v6, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object v0, p0

    move v4, p2

    invoke-virtual/range {v0 .. v6}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v9

    .line 3323
    .local v9, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3324
    invoke-virtual {v10, v7, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3325
    iput v8, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3326
    const/4 v0, 0x1

    .line 3332
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3333
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v9           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_1
    return v0

    .line 3318
    :cond_0
    :try_start_1
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    goto :goto_0

    .line 3330
    :cond_1
    const/4 v0, 0x0

    .line 3332
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3333
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3332
    .end local v1           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v7           #index:I
    .end local v8           #newCount:I
    .end local v10           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3333
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v0
.end method

.method reclaimValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;)Z
    .locals 12
    .parameter
    .parameter "hash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v0, 0x0

    .line 3341
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3343
    :try_start_0
    iget v4, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v4, -0x1

    .line 3344
    .local v8, newCount:I
    iget-object v10, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3345
    .local v10, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    and-int v7, p2, v4

    .line 3346
    .local v7, index:I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3348
    .local v1, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v2, v1

    .local v2, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v2, :cond_3

    .line 3349
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 3350
    .local v3, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v4

    if-ne v4, p2, :cond_2

    if-eqz v3, :cond_2

    iget-object v4, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v4, p1, v3}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 3352
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v11

    .line 3353
    .local v11, v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    if-ne v11, p3, :cond_1

    .line 3354
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3355
    sget-object v6, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object v0, p0

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v9

    .line 3357
    .local v9, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3358
    invoke-virtual {v10, v7, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3359
    iput v8, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3360
    const/4 v0, 0x1

    .line 3368
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3369
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_0

    .line 3370
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v3           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v9           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v11           #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_0
    :goto_1
    return v0

    .line 3368
    .restart local v3       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v11       #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3369
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_0

    .line 3370
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3348
    .end local v11           #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_2
    :try_start_1
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    goto :goto_0

    .line 3368
    .end local v3           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_3
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3369
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_0

    .line 3370
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3368
    .end local v1           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v7           #index:I
    .end local v8           #newCount:I
    .end local v10           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3369
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_4

    .line 3370
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    :cond_4
    throw v0
.end method

.method recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    .locals 1
    .parameter
    .parameter "now"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;J)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2584
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsAccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2585
    invoke-interface {p1, p2, p3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setAccessTime(J)V

    .line 2587
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2588
    return-void
.end method

.method recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    .locals 1
    .parameter
    .parameter "now"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;J)V"
        }
    .end annotation

    .prologue
    .line 2569
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsAccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2570
    invoke-interface {p1, p2, p3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setAccessTime(J)V

    .line 2572
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->recencyQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2573
    return-void
.end method

.method recordWrite(Lcom/google/common/cache/LocalCache$ReferenceEntry;IJ)V
    .locals 1
    .parameter
    .parameter "weight"
    .parameter "now"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;IJ)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2597
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainRecencyQueue()V

    .line 2598
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    .line 2600
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsAccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2601
    invoke-interface {p1, p3, p4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setAccessTime(J)V

    .line 2603
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsWrite()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2604
    invoke-interface {p1, p3, p4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setWriteTime(J)V

    .line 2606
    :cond_1
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2607
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2608
    return-void
.end method

.method refresh(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .locals 4
    .parameter
    .parameter "hash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, loader:Lcom/google/common/cache/CacheLoader;,"Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    const/4 v2, 0x0

    .line 2415
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->insertLoadingValueReference(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$LoadingValueReference;

    move-result-object v0

    .line 2417
    .local v0, loadingValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    if-nez v0, :cond_1

    .line 2429
    :cond_0
    :goto_0
    return-object v2

    .line 2421
    :cond_1
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/google/common/cache/LocalCache$Segment;->loadAsync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 2422
    .local v1, result:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    invoke-interface {v1}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2424
    :try_start_0
    invoke-interface {v1}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 2425
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 15
    .parameter "key"
    .parameter "hash"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 3094
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3096
    :try_start_0
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v1}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v12

    .line 3097
    .local v12, now:J
    invoke-virtual {p0, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3099
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3100
    .local v10, newCount:I
    iget-object v14, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3101
    .local v14, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    and-int v9, p2, v1

    .line 3102
    .local v9, index:I
    invoke-virtual {v14, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3104
    .local v2, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v3, v2

    .local v3, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v3, :cond_3

    .line 3105
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 3106
    .local v4, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    move/from16 v0, p2

    if-ne v1, v0, :cond_2

    if-eqz v4, :cond_2

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 3108
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v6

    .line 3109
    .local v6, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v8

    .line 3112
    .local v8, entryValue:Ljava/lang/Object;,"TV;"
    if-eqz v8, :cond_0

    .line 3113
    sget-object v7, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;

    .line 3121
    .local v7, cause:Lcom/google/common/cache/RemovalCause;
    :goto_1
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    move-object v1, p0

    move/from16 v5, p2

    .line 3122
    invoke-virtual/range {v1 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .line 3124
    .local v11, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3125
    invoke-virtual {v14, v9, v11}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3126
    iput v10, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3133
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3134
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v4           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v6           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v7           #cause:Lcom/google/common/cache/RemovalCause;
    .end local v8           #entryValue:Ljava/lang/Object;,"TV;"
    .end local v11           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_2
    return-object v8

    .line 3114
    .restart local v4       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v6       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v8       #entryValue:Ljava/lang/Object;,"TV;"
    :cond_0
    :try_start_1
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3115
    sget-object v7, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v7       #cause:Lcom/google/common/cache/RemovalCause;
    goto :goto_1

    .line 3118
    .end local v7           #cause:Lcom/google/common/cache/RemovalCause;
    :cond_1
    const/4 v8, 0x0

    .line 3133
    .end local v8           #entryValue:Ljava/lang/Object;,"TV;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3134
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2

    .line 3104
    .end local v6           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_2
    :try_start_2
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    goto :goto_0

    .line 3131
    .end local v4           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_3
    const/4 v8, 0x0

    .line 3133
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3134
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2

    .line 3133
    .end local v2           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v9           #index:I
    .end local v10           #newCount:I
    .end local v12           #now:J
    .end local v14           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3134
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v1
.end method

.method remove(Ljava/lang/Object;ILjava/lang/Object;)Z
    .locals 15
    .parameter "key"
    .parameter "hash"
    .parameter "value"

    .prologue
    .line 3191
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3193
    :try_start_0
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v1}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v12

    .line 3194
    .local v12, now:J
    invoke-virtual {p0, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3196
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3197
    .local v10, newCount:I
    iget-object v14, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3198
    .local v14, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    and-int v9, p2, v1

    .line 3199
    .local v9, index:I
    invoke-virtual {v14, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3201
    .local v2, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v3, v2

    .local v3, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v3, :cond_4

    .line 3202
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 3203
    .local v4, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    move/from16 v0, p2

    if-ne v1, v0, :cond_3

    if-eqz v4, :cond_3

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3205
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v6

    .line 3206
    .local v6, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v8

    .line 3209
    .local v8, entryValue:Ljava/lang/Object;,"TV;"
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->valueEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p3

    invoke-virtual {v1, v0, v8}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3210
    sget-object v7, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;

    .line 3218
    .local v7, cause:Lcom/google/common/cache/RemovalCause;
    :goto_1
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    move-object v1, p0

    move/from16 v5, p2

    .line 3219
    invoke-virtual/range {v1 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .line 3221
    .local v11, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3222
    invoke-virtual {v14, v9, v11}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3223
    iput v10, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3224
    sget-object v1, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v7, v1, :cond_2

    const/4 v1, 0x1

    .line 3230
    :goto_2
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3231
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v4           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v6           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v7           #cause:Lcom/google/common/cache/RemovalCause;
    .end local v8           #entryValue:Ljava/lang/Object;,"TV;"
    .end local v11           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_3
    return v1

    .line 3211
    .restart local v4       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v6       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v8       #entryValue:Ljava/lang/Object;,"TV;"
    :cond_0
    if-nez v8, :cond_1

    :try_start_1
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3212
    sget-object v7, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v7       #cause:Lcom/google/common/cache/RemovalCause;
    goto :goto_1

    .line 3215
    .end local v7           #cause:Lcom/google/common/cache/RemovalCause;
    :cond_1
    const/4 v1, 0x0

    .line 3230
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3231
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_3

    .line 3224
    .restart local v7       #cause:Lcom/google/common/cache/RemovalCause;
    .restart local v11       #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_2
    const/4 v1, 0x0

    goto :goto_2

    .line 3201
    .end local v6           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v7           #cause:Lcom/google/common/cache/RemovalCause;
    .end local v8           #entryValue:Ljava/lang/Object;,"TV;"
    .end local v11           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_3
    :try_start_2
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    goto :goto_0

    .line 3228
    .end local v4           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_4
    const/4 v1, 0x0

    .line 3230
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3231
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_3

    .line 3230
    .end local v2           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v9           #index:I
    .end local v10           #newCount:I
    .end local v12           #now:J
    .end local v14           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3231
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v1
.end method

.method removeCollectedEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3302
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    sget-object v0, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, p1, v0}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/RemovalCause;)V

    .line 3303
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3304
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3305
    return-void
.end method

.method removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z
    .locals 11
    .parameter
    .parameter "hash"
    .parameter "cause"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;I",
            "Lcom/google/common/cache/RemovalCause;",
            ")Z"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3409
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3410
    .local v8, newCount:I
    iget-object v10, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3411
    .local v10, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    and-int v7, p2, v0

    .line 3412
    .local v7, index:I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3414
    .local v1, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v2, v1

    .local v2, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v2, :cond_1

    .line 3415
    if-ne v2, p1, :cond_0

    .line 3416
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3417
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v5

    move-object v0, p0

    move v4, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v9

    .line 3419
    .local v9, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3420
    invoke-virtual {v10, v7, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3421
    iput v8, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3422
    const/4 v0, 0x1

    .line 3426
    .end local v9           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_1
    return v0

    .line 3414
    :cond_0
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    goto :goto_0

    .line 3426
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method removeEntryFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3286
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3287
    .local v1, newCount:I
    invoke-interface {p2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    .line 3288
    .local v2, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v0, p1

    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eq v0, p2, :cond_1

    .line 3289
    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$Segment;->isCollected(Lcom/google/common/cache/LocalCache$ReferenceEntry;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3290
    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$Segment;->removeCollectedEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V

    .line 3291
    add-int/lit8 v1, v1, -0x1

    .line 3288
    :goto_1
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_0

    .line 3293
    :cond_0
    invoke-virtual {p0, v0, v2}, Lcom/google/common/cache/LocalCache$Segment;->copyEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    goto :goto_1

    .line 3296
    :cond_1
    iput v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3297
    return-object v2
.end method

.method removeLoadingValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;)Z
    .locals 9
    .parameter
    .parameter "hash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, valueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    const/4 v7, 0x0

    .line 3376
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3378
    :try_start_0
    iget-object v5, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3379
    .local v5, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    and-int v3, p2, v8

    .line 3380
    .local v3, index:I
    invoke-virtual {v5, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3382
    .local v2, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v0, v2

    .local v0, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v0, :cond_3

    .line 3383
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 3384
    .local v1, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v8

    if-ne v8, p2, :cond_2

    if-eqz v1, :cond_2

    iget-object v8, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v8, v8, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v8, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 3386
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v6

    .line 3387
    .local v6, v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    if-ne v6, p3, :cond_1

    .line 3388
    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->isActive()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 3389
    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->getOldValue()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v7

    invoke-interface {v0, v7}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3394
    :goto_1
    const/4 v7, 0x1

    .line 3402
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3403
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v1           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v6           #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_2
    return v7

    .line 3391
    .restart local v1       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v6       #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_0
    :try_start_1
    invoke-virtual {p0, v2, v0}, Lcom/google/common/cache/LocalCache$Segment;->removeEntryFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v4

    .line 3392
    .local v4, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {v5, v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 3402
    .end local v0           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v2           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3           #index:I
    .end local v4           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .end local v6           #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :catchall_0
    move-exception v7

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3403
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v7

    .line 3402
    .restart local v0       #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v1       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v2       #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v3       #index:I
    .restart local v5       #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .restart local v6       #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3403
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2

    .line 3382
    .end local v6           #v:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_2
    :try_start_2
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 3402
    .end local v1           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_3
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3403
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2
.end method

.method removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 1
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "hash"
    .end parameter
    .parameter
    .end parameter
    .parameter "cause"
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;I",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/RemovalCause;",
            ")",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3270
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p3, key:Ljava/lang/Object;,"TK;"
    .local p5, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 3271
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v0, p2}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3272
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p2}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3274
    invoke-interface {p5}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3275
    const/4 v0, 0x0

    invoke-interface {p5, v0}, Lcom/google/common/cache/LocalCache$ValueReference;->notifyNewValue(Ljava/lang/Object;)V

    .line 3278
    .end local p1           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    return-object p1

    .restart local p1       #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntryFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object p1

    goto :goto_0
.end method

.method replace(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 20
    .parameter
    .parameter "hash"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 3048
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, newValue:Ljava/lang/Object;,"TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3050
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v3}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v13

    .line 3051
    .local v13, now:J
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3053
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v19, v0

    .line 3054
    .local v19, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    and-int v16, p2, v3

    .line 3055
    .local v16, index:I
    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3057
    .local v4, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v5, v4

    .local v5, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v5, :cond_3

    .line 3058
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 3059
    .local v6, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v3

    move/from16 v0, p2

    if-ne v3, v0, :cond_2

    if-eqz v6, :cond_2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v6}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3061
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v8

    .line 3062
    .local v8, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v15

    .line 3063
    .local v15, entryValue:Ljava/lang/Object;,"TV;"
    if-nez v15, :cond_1

    .line 3064
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3066
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 3067
    .local v17, newCount:I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3068
    sget-object v9, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v3, p0

    move/from16 v7, p2

    invoke-virtual/range {v3 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v18

    .line 3070
    .local v18, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 3071
    move-object/from16 v0, v19

    move/from16 v1, v16

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3072
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3074
    .end local v17           #newCount:I
    .end local v18           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_0
    const/4 v15, 0x0

    .line 3087
    .end local v15           #entryValue:Ljava/lang/Object;,"TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3088
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v6           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v8           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_1
    return-object v15

    .line 3077
    .restart local v6       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v8       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v15       #entryValue:Ljava/lang/Object;,"TV;"
    :cond_1
    :try_start_1
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3078
    sget-object v3, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2, v8, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v9, p0

    move-object v10, v5

    move-object/from16 v11, p1

    move-object/from16 v12, p3

    .line 3079
    invoke-virtual/range {v9 .. v14}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 3080
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3087
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3088
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3057
    .end local v8           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v15           #entryValue:Ljava/lang/Object;,"TV;"
    :cond_2
    :try_start_2
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v5

    goto/16 :goto_0

    .line 3085
    .end local v6           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_3
    const/4 v15, 0x0

    .line 3087
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3088
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3087
    .end local v4           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v13           #now:J
    .end local v16           #index:I
    .end local v19           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v3

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3088
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v3
.end method

.method replace(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)Z
    .locals 20
    .parameter
    .parameter "hash"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;TV;)Z"
        }
    .end annotation

    .prologue
    .line 2995
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, oldValue:Ljava/lang/Object;,"TV;"
    .local p4, newValue:Ljava/lang/Object;,"TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2997
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v3}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v13

    .line 2998
    .local v13, now:J
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3000
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v19, v0

    .line 3001
    .local v19, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    and-int v16, p2, v3

    .line 3002
    .local v16, index:I
    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3004
    .local v4, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v5, v4

    .local v5, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v5, :cond_4

    .line 3005
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 3006
    .local v6, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v3

    move/from16 v0, p2

    if-ne v3, v0, :cond_3

    if-eqz v6, :cond_3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v6}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 3008
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v8

    .line 3009
    .local v8, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v15

    .line 3010
    .local v15, entryValue:Ljava/lang/Object;,"TV;"
    if-nez v15, :cond_1

    .line 3011
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3013
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 3014
    .local v17, newCount:I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3015
    sget-object v9, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v3, p0

    move/from16 v7, p2

    invoke-virtual/range {v3 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v18

    .line 3017
    .local v18, newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 3018
    move-object/from16 v0, v19

    move/from16 v1, v16

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3019
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3021
    .end local v17           #newCount:I
    .end local v18           #newFirst:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_0
    const/4 v3, 0x0

    .line 3041
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3042
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v6           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v8           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v15           #entryValue:Ljava/lang/Object;,"TV;"
    :goto_1
    return v3

    .line 3024
    .restart local v6       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v8       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v15       #entryValue:Ljava/lang/Object;,"TV;"
    :cond_1
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->valueEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p3

    invoke-virtual {v3, v0, v15}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3025
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3026
    sget-object v3, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2, v8, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v9, p0

    move-object v10, v5

    move-object/from16 v11, p1

    move-object/from16 v12, p4

    .line 3027
    invoke-virtual/range {v9 .. v14}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 3028
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3029
    const/4 v3, 0x1

    .line 3041
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3042
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3033
    :cond_2
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v13, v14}, Lcom/google/common/cache/LocalCache$Segment;->recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 3034
    const/4 v3, 0x0

    .line 3041
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3042
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3004
    .end local v8           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v15           #entryValue:Ljava/lang/Object;,"TV;"
    :cond_3
    :try_start_3
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v5

    goto/16 :goto_0

    .line 3039
    .end local v6           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_4
    const/4 v3, 0x0

    .line 3041
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3042
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_1

    .line 3041
    .end local v4           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v13           #now:J
    .end local v16           #index:I
    .end local v19           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v3

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3042
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v3
.end method

.method runLockedCleanup(J)V
    .locals 2
    .parameter "now"

    .prologue
    .line 3476
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryLock()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3478
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainReferenceQueues()V

    .line 3479
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->expireEntries(J)V

    .line 3480
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3482
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3485
    :cond_0
    return-void

    .line 3482
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    throw v0
.end method

.method runUnlockedCleanup()V
    .locals 1

    .prologue
    .line 3489
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3490
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->processPendingNotifications()V

    .line 3492
    :cond_0
    return-void
.end method

.method scheduleRefresh(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILjava/lang/Object;JLcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .locals 5
    .parameter
    .parameter
    .parameter "hash"
    .parameter
    .parameter "now"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;ITV;J",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 2398
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, key:Ljava/lang/Object;,"TK;"
    .local p4, oldValue:Ljava/lang/Object;,"TV;"
    .local p7, loader:Lcom/google/common/cache/CacheLoader;,"Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1}, Lcom/google/common/cache/LocalCache;->refreshes()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getWriteTime()J

    move-result-wide v1

    sub-long v1, p5, v1

    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-wide v3, v3, Lcom/google/common/cache/LocalCache;->refreshNanos:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 2399
    invoke-virtual {p0, p2, p3, p7}, Lcom/google/common/cache/LocalCache$Segment;->refresh(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;

    move-result-object v0

    .line 2400
    .local v0, newValue:Ljava/lang/Object;,"TV;"
    if-eqz v0, :cond_0

    .line 2404
    .end local v0           #newValue:Ljava/lang/Object;,"TV;"
    :goto_0
    return-object v0

    :cond_0
    move-object v0, p4

    goto :goto_0
.end method

.method setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V
    .locals 5
    .parameter
    .parameter
    .parameter
    .parameter "now"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;TV;J)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2194
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, key:Ljava/lang/Object;,"TK;"
    .local p3, value:Ljava/lang/Object;,"TV;"
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v0

    .line 2195
    .local v0, previous:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->weigher:Lcom/google/common/cache/Weigher;

    invoke-interface {v3, p2, p3}, Lcom/google/common/cache/Weigher;->weigh(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    .line 2196
    .local v2, weight:I
    if-ltz v2, :cond_0

    const/4 v3, 0x1

    :goto_0
    const-string v4, "Weights must be non-negative"

    invoke-static {v3, v4}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 2198
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->valueStrength:Lcom/google/common/cache/LocalCache$Strength;

    invoke-virtual {v3, p0, p1, p3, v2}, Lcom/google/common/cache/LocalCache$Strength;->referenceValue(Lcom/google/common/cache/LocalCache$Segment;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v1

    .line 2200
    .local v1, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {p1, v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2201
    invoke-virtual {p0, p1, v2, p4, p5}, Lcom/google/common/cache/LocalCache$Segment;->recordWrite(Lcom/google/common/cache/LocalCache$ReferenceEntry;IJ)V

    .line 2202
    invoke-interface {v0, p3}, Lcom/google/common/cache/LocalCache$ValueReference;->notifyNewValue(Ljava/lang/Object;)V

    .line 2203
    return-void

    .line 2196
    .end local v1           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method storeLoadedValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Ljava/lang/Object;)Z
    .locals 25
    .parameter
    .parameter "hash"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;TV;)Z"
        }
    .end annotation

    .prologue
    .line 3140
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p3, oldValueReference:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, newValue:Ljava/lang/Object;,"TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3142
    :try_start_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v5, v5, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v5}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v9

    .line 3143
    .local v9, now:J
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3145
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v22, v5, 0x1

    .line 3146
    .local v22, newCount:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v23, v0

    .line 3147
    .local v23, table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    and-int v21, p2, v5

    .line 3148
    .local v21, index:I
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3150
    .local v20, first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v6, v20

    .local v6, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_0
    if-eqz v6, :cond_5

    .line 3151
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v18

    .line 3152
    .local v18, entryKey:Ljava/lang/Object;,"TK;"
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v5

    move/from16 v0, p2

    if-ne v5, v0, :cond_4

    if-eqz v18, :cond_4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v5, v5, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 3154
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v24

    .line 3155
    .local v24, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface/range {v24 .. v24}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v19

    .line 3156
    .local v19, entryValue:Ljava/lang/Object;,"TV;"
    if-eqz v19, :cond_0

    move-object/from16 v0, p3

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_3

    .line 3157
    :cond_0
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3158
    invoke-virtual/range {p3 .. p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->isActive()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3159
    if-nez v19, :cond_2

    sget-object v17, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    .line 3161
    .local v17, cause:Lcom/google/common/cache/RemovalCause;
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, v17

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 3162
    add-int/lit8 v22, v22, -0x1

    .end local v17           #cause:Lcom/google/common/cache/RemovalCause;
    :cond_1
    move-object/from16 v5, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p4

    .line 3164
    invoke-virtual/range {v5 .. v10}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 3165
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3166
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3167
    const/4 v5, 0x1

    .line 3185
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3186
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v18           #entryKey:Ljava/lang/Object;,"TK;"
    .end local v19           #entryValue:Ljava/lang/Object;,"TV;"
    .end local v24           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_2
    return v5

    .line 3159
    .restart local v18       #entryKey:Ljava/lang/Object;,"TK;"
    .restart local v19       #entryValue:Ljava/lang/Object;,"TV;"
    .restart local v24       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_2
    :try_start_1
    sget-object v17, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    goto :goto_1

    .line 3171
    :cond_3
    new-instance v24, Lcom/google/common/cache/LocalCache$WeightedStrongValueReference;

    .end local v24           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v5, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v5}, Lcom/google/common/cache/LocalCache$WeightedStrongValueReference;-><init>(Ljava/lang/Object;I)V

    .line 3172
    .restart local v24       #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    sget-object v5, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3173
    const/4 v5, 0x0

    .line 3185
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3186
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2

    .line 3150
    .end local v19           #entryValue:Ljava/lang/Object;,"TV;"
    .end local v24           #valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_4
    :try_start_2
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v6

    goto/16 :goto_0

    .line 3177
    .end local v18           #entryKey:Ljava/lang/Object;,"TK;"
    :cond_5
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3178
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v12

    .local v12, newEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v11, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p4

    move-wide v15, v9

    .line 3179
    invoke-virtual/range {v11 .. v16}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 3180
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1, v12}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3181
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3182
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 3183
    const/4 v5, 0x1

    .line 3185
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3186
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_2

    .line 3185
    .end local v6           #e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v9           #now:J
    .end local v12           #newEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v20           #first:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v21           #index:I
    .end local v22           #newCount:I
    .end local v23           #table:Ljava/util/concurrent/atomic/AtomicReferenceArray;,"Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_0
    move-exception v5

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3186
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v5
.end method

.method tryDrainReferenceQueues()V
    .locals 1

    .prologue
    .line 2488
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryLock()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2490
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainReferenceQueues()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2492
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2495
    :cond_0
    return-void

    .line 2492
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    throw v0
.end method

.method tryExpireEntries(J)V
    .locals 1
    .parameter "now"

    .prologue
    .line 2636
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryLock()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2638
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->expireEntries(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2640
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2644
    :cond_0
    return-void

    .line 2640
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    throw v0
.end method

.method waitForLoadingValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ValueReference;)Ljava/lang/Object;
    .locals 7
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/cache/LocalCache$Segment;,"Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, e:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, key:Ljava/lang/Object;,"TK;"
    .local p3, valueReference:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v4, 0x1

    .line 2326
    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v3

    if-nez v3, :cond_0

    .line 2327
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 2330
    :cond_0
    invoke-static {p1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    move v3, v4

    :goto_0
    const-string v5, "Recursive load"

    invoke-static {v3, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 2333
    :try_start_0
    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->waitForValue()Ljava/lang/Object;

    move-result-object v2

    .line 2334
    .local v2, value:Ljava/lang/Object;,"TV;"
    if-nez v2, :cond_2

    .line 2335
    new-instance v3, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CacheLoader returned null for key "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2342
    .end local v2           #value:Ljava/lang/Object;,"TV;"
    :catchall_0
    move-exception v3

    iget-object v5, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-interface {v5, v4}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    throw v3

    .line 2330
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 2338
    .restart local v2       #value:Ljava/lang/Object;,"TV;"
    :cond_2
    :try_start_1
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v3}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    .line 2339
    .local v0, now:J
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/cache/LocalCache$Segment;->recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2342
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-interface {v3, v4}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    return-object v2
.end method
