.class public final Lcom/google/common/util/concurrent/AtomicLongMap;
.super Ljava/lang/Object;
.source "AtomicLongMap.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private transient asMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final map:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<TK;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/concurrent/ConcurrentHashMap;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<TK;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, map:Ljava/util/concurrent/ConcurrentHashMap;,"Ljava/util/concurrent/ConcurrentHashMap<TK;Ljava/util/concurrent/atomic/AtomicLong;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentHashMap;

    iput-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    .line 45
    return-void
.end method

.method public static create()Lcom/google/common/util/concurrent/AtomicLongMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/util/concurrent/AtomicLongMap",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 51
    new-instance v0, Lcom/google/common/util/concurrent/AtomicLongMap;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/AtomicLongMap;-><init>(Ljava/util/concurrent/ConcurrentHashMap;)V

    return-object v0
.end method

.method public static create(Ljava/util/Map;)Lcom/google/common/util/concurrent/AtomicLongMap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<+TK;+",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/google/common/util/concurrent/AtomicLongMap",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, m:Ljava/util/Map;,"Ljava/util/Map<+TK;+Ljava/lang/Long;>;"
    invoke-static {}, Lcom/google/common/util/concurrent/AtomicLongMap;->create()Lcom/google/common/util/concurrent/AtomicLongMap;

    move-result-object v0

    .line 59
    .local v0, result:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    invoke-virtual {v0, p0}, Lcom/google/common/util/concurrent/AtomicLongMap;->putAll(Ljava/util/Map;)V

    .line 60
    return-object v0
.end method

.method private createAsMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 276
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, Lcom/google/common/util/concurrent/AtomicLongMap$1;

    invoke-direct {v1, p0}, Lcom/google/common/util/concurrent/AtomicLongMap$1;-><init>(Lcom/google/common/util/concurrent/AtomicLongMap;)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Maps;->transformValues(Ljava/util/Map;Lcom/google/common/base/Function;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addAndGet(Ljava/lang/Object;J)J
    .locals 7
    .parameter
    .parameter "delta"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;J)J"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    :cond_0
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 93
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_1

    .line 94
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v5, p1, v6}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 95
    .restart local v0       #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_1

    .line 114
    .end local p2
    :goto_0
    return-wide p2

    .line 102
    .restart local p2
    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    .line 103
    .local v3, oldValue:J
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-nez v5, :cond_2

    .line 105
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v5, p1, v0, v6}, Ljava/util/concurrent/ConcurrentHashMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 112
    :cond_2
    add-long v1, v3, p2

    .line 113
    .local v1, newValue:J
    invoke-virtual {v0, v3, v4, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v5

    if-eqz v5, :cond_1

    move-wide p2, v1

    .line 114
    goto :goto_0
.end method

.method public asMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 271
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->asMap:Ljava/util/Map;

    .line 272
    .local v0, result:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/lang/Long;>;"
    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/common/util/concurrent/AtomicLongMap;->createAsMap()Ljava/util/Map;

    move-result-object v0

    .end local v0           #result:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/lang/Long;>;"
    iput-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->asMap:Ljava/util/Map;

    :cond_0
    return-object v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 314
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 315
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .parameter "key"

    .prologue
    .line 289
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public decrementAndGet(Ljava/lang/Object;)J
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)J"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/util/concurrent/AtomicLongMap;->addAndGet(Ljava/lang/Object;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public get(Ljava/lang/Object;)J
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)J"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    iget-object v1, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 69
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_0

    const-wide/16 v1, 0x0

    :goto_0
    return-wide v1

    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    goto :goto_0
.end method

.method public getAndAdd(Ljava/lang/Object;J)J
    .locals 9
    .parameter
    .parameter "delta"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;J)J"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v5, 0x0

    .line 141
    :cond_0
    iget-object v7, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 142
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_1

    .line 143
    iget-object v7, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v8, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v8, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v7, p1, v8}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 144
    .restart local v0       #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_1

    move-wide v3, v5

    .line 163
    :goto_0
    return-wide v3

    .line 151
    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    .line 152
    .local v3, oldValue:J
    cmp-long v7, v3, v5

    if-nez v7, :cond_2

    .line 154
    iget-object v7, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v8, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v8, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v7, p1, v0, v8}, Ljava/util/concurrent/ConcurrentHashMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move-wide v3, v5

    .line 155
    goto :goto_0

    .line 161
    :cond_2
    add-long v1, v3, p2

    .line 162
    .local v1, newValue:J
    invoke-virtual {v0, v3, v4, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v7

    if-eqz v7, :cond_1

    goto :goto_0
.end method

.method public getAndDecrement(Ljava/lang/Object;)J
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)J"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/util/concurrent/AtomicLongMap;->getAndAdd(Ljava/lang/Object;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getAndIncrement(Ljava/lang/Object;)J
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)J"
        }
    .end annotation

    .prologue
    .line 125
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v0, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/util/concurrent/AtomicLongMap;->getAndAdd(Ljava/lang/Object;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public incrementAndGet(Ljava/lang/Object;)J
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)J"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v0, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/util/concurrent/AtomicLongMap;->addAndGet(Ljava/lang/Object;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 304
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/Object;J)J
    .locals 7
    .parameter
    .parameter "newValue"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;J)J"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v3, 0x0

    .line 176
    :cond_0
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 177
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_1

    .line 178
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v5, p1, v6}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 179
    .restart local v0       #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_1

    move-wide v1, v3

    .line 197
    :goto_0
    return-wide v1

    .line 186
    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    .line 187
    .local v1, oldValue:J
    cmp-long v5, v1, v3

    if-nez v5, :cond_2

    .line 189
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v5, p1, v0, v6}, Ljava/util/concurrent/ConcurrentHashMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move-wide v1, v3

    .line 190
    goto :goto_0

    .line 196
    :cond_2
    invoke-virtual {v0, v1, v2, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 211
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, m:Ljava/util/Map;,"Ljava/util/Map<+TK;+Ljava/lang/Long;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 212
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TK;+Ljava/lang/Long;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {p0, v3, v4, v5}, Lcom/google/common/util/concurrent/AtomicLongMap;->put(Ljava/lang/Object;J)J

    goto :goto_0

    .line 214
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TK;+Ljava/lang/Long;>;"
    :cond_0
    return-void
.end method

.method putIfAbsent(Ljava/lang/Object;J)J
    .locals 7
    .parameter
    .parameter "newValue"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;J)J"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v3, 0x0

    .line 352
    :cond_0
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 353
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_2

    .line 354
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v5, p1, v6}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 355
    .restart local v0       #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_2

    move-wide v1, v3

    .line 371
    :cond_1
    :goto_0
    return-wide v1

    .line 361
    :cond_2
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    .line 362
    .local v1, oldValue:J
    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    .line 364
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v6, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    invoke-virtual {v5, p1, v0, v6}, Ljava/util/concurrent/ConcurrentHashMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move-wide v1, v3

    .line 365
    goto :goto_0
.end method

.method public remove(Ljava/lang/Object;)J
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)J"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v3, 0x0

    .line 221
    iget-object v5, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 222
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_0

    move-wide v1, v3

    .line 232
    :goto_0
    return-wide v1

    .line 227
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    .line 228
    .local v1, oldValue:J
    cmp-long v5, v1, v3

    if-eqz v5, :cond_1

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 230
    :cond_1
    iget-object v3, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method remove(Ljava/lang/Object;J)Z
    .locals 7
    .parameter
    .parameter "value"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;J)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v5, 0x0

    const/4 v3, 0x0

    .line 397
    iget-object v4, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 398
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_1

    .line 415
    :cond_0
    :goto_0
    return v3

    .line 402
    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    .line 403
    .local v1, oldValue:J
    cmp-long v4, v1, p2

    if-nez v4, :cond_0

    .line 407
    cmp-long v4, v1, v5

    if-eqz v4, :cond_2

    invoke-virtual {v0, v1, v2, v5, v6}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 409
    :cond_2
    iget-object v3, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 411
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public removeAllZeros()V
    .locals 7

    .prologue
    .line 244
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v3, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 245
    .local v2, key:Ljava/lang/Object;,"TK;"
    iget-object v3, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 246
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_0

    .line 247
    iget-object v3, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    .line 250
    .end local v0           #atomic:Ljava/util/concurrent/atomic/AtomicLong;
    .end local v2           #key:Ljava/lang/Object;,"TK;"
    :cond_1
    return-void
.end method

.method replace(Ljava/lang/Object;JJ)Z
    .locals 6
    .parameter
    .parameter "expectedOldValue"
    .parameter "newValue"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;JJ)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    const-wide/16 v4, 0x0

    const/4 v1, 0x0

    .line 384
    cmp-long v2, p2, v4

    if-nez v2, :cond_1

    .line 385
    invoke-virtual {p0, p1, p4, p5}, Lcom/google/common/util/concurrent/AtomicLongMap;->putIfAbsent(Ljava/lang/Object;J)J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    const/4 v1, 0x1

    .line 388
    :cond_0
    :goto_0
    return v1

    .line 387
    :cond_1
    iget-object v2, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 388
    .local v0, atomic:Ljava/util/concurrent/atomic/AtomicLong;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p2, p3, p4, p5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v1

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 297
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method

.method public sum()J
    .locals 6

    .prologue
    .line 258
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    const-wide/16 v1, 0x0

    .line 259
    .local v1, sum:J
    iget-object v4, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/atomic/AtomicLong;

    .line 260
    .local v3, value:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    add-long/2addr v1, v4

    goto :goto_0

    .line 262
    .end local v3           #value:Ljava/util/concurrent/atomic/AtomicLong;
    :cond_0
    return-wide v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 319
    .local p0, this:Lcom/google/common/util/concurrent/AtomicLongMap;,"Lcom/google/common/util/concurrent/AtomicLongMap<TK;>;"
    iget-object v0, p0, Lcom/google/common/util/concurrent/AtomicLongMap;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
