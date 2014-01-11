.class Lcom/google/common/cache/LocalCache$LoadingValueReference;
.super Ljava/lang/Object;
.source "LocalCache.java"

# interfaces
.implements Lcom/google/common/cache/LocalCache$ValueReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LoadingValueReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/cache/LocalCache$ValueReference",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field final futureValue:Lcom/google/common/util/concurrent/SettableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/SettableFuture",
            "<TV;>;"
        }
    .end annotation
.end field

.field volatile oldValue:Lcom/google/common/cache/LocalCache$ValueReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field final stopwatch:Lcom/google/common/base/Stopwatch;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3504
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    invoke-static {}, Lcom/google/common/cache/LocalCache;->unset()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/cache/LocalCache$LoadingValueReference;-><init>(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 3505
    return-void
.end method

.method public constructor <init>(Lcom/google/common/cache/LocalCache$ValueReference;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 3507
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p1, oldValue:Lcom/google/common/cache/LocalCache$ValueReference;,"Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 3500
    invoke-static {}, Lcom/google/common/util/concurrent/SettableFuture;->create()Lcom/google/common/util/concurrent/SettableFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->futureValue:Lcom/google/common/util/concurrent/SettableFuture;

    .line 3501
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0}, Lcom/google/common/base/Stopwatch;-><init>()V

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->stopwatch:Lcom/google/common/base/Stopwatch;

    .line 3508
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->oldValue:Lcom/google/common/cache/LocalCache$ValueReference;

    .line 3509
    return-void
.end method

.method private fullyFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .parameter "t"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 3544
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    invoke-static {}, Lcom/google/common/util/concurrent/SettableFuture;->create()Lcom/google/common/util/concurrent/SettableFuture;

    move-result-object v0

    .line 3545
    .local v0, future:Lcom/google/common/util/concurrent/SettableFuture;,"Lcom/google/common/util/concurrent/SettableFuture<TV;>;"
    invoke-static {v0, p1}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->setException(Lcom/google/common/util/concurrent/SettableFuture;Ljava/lang/Throwable;)Z

    .line 3546
    return-object v0
.end method

.method private static setException(Lcom/google/common/util/concurrent/SettableFuture;Ljava/lang/Throwable;)Z
    .locals 2
    .parameter
    .parameter "t"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/SettableFuture",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 3536
    .local p0, future:Lcom/google/common/util/concurrent/SettableFuture;,"Lcom/google/common/util/concurrent/SettableFuture<*>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/SettableFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 3539
    :goto_0
    return v1

    .line 3537
    :catch_0
    move-exception v0

    .line 3539
    .local v0, e:Ljava/lang/Error;
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public copyFor(Ljava/lang/ref/ReferenceQueue;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ValueReference;
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/ReferenceQueue",
            "<TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 3605
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p1, queue:Ljava/lang/ref/ReferenceQueue;,"Ljava/lang/ref/ReferenceQueue<TV;>;"
    .local p2, entry:Lcom/google/common/cache/LocalCache$ReferenceEntry;,"Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    return-object p0
.end method

.method public elapsedNanos()J
    .locals 2

    .prologue
    .line 3581
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->stopwatch:Lcom/google/common/base/Stopwatch;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1}, Lcom/google/common/base/Stopwatch;->elapsedTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 3591
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->oldValue:Lcom/google/common/cache/LocalCache$ValueReference;

    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getEntry()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 3600
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOldValue()Lcom/google/common/cache/LocalCache$ValueReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 3595
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->oldValue:Lcom/google/common/cache/LocalCache$ValueReference;

    return-object v0
.end method

.method public getWeight()I
    .locals 1

    .prologue
    .line 3523
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->oldValue:Lcom/google/common/cache/LocalCache$ValueReference;

    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ValueReference;->getWeight()I

    move-result v0

    return v0
.end method

.method public isActive()Z
    .locals 1

    .prologue
    .line 3518
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->oldValue:Lcom/google/common/cache/LocalCache$ValueReference;

    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v0

    return v0
.end method

.method public isLoading()Z
    .locals 1

    .prologue
    .line 3513
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public loadFuture(Ljava/lang/Object;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 5
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 3564
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, loader:Lcom/google/common/cache/CacheLoader;,"Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    iget-object v4, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->stopwatch:Lcom/google/common/base/Stopwatch;

    invoke-virtual {v4}, Lcom/google/common/base/Stopwatch;->start()Lcom/google/common/base/Stopwatch;

    .line 3565
    iget-object v4, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->oldValue:Lcom/google/common/cache/LocalCache$ValueReference;

    invoke-interface {v4}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v2

    .line 3567
    .local v2, previousValue:Ljava/lang/Object;,"TV;"
    if-nez v2, :cond_1

    .line 3568
    :try_start_0
    invoke-virtual {p2, p1}, Lcom/google/common/cache/CacheLoader;->load(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3569
    .local v1, newValue:Ljava/lang/Object;,"TV;"
    invoke-virtual {p0, v1}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->set(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->futureValue:Lcom/google/common/util/concurrent/SettableFuture;

    .line 3576
    .end local v1           #newValue:Ljava/lang/Object;,"TV;"
    :goto_0
    return-object v4

    .line 3569
    .restart local v1       #newValue:Ljava/lang/Object;,"TV;"
    :cond_0
    invoke-static {v1}, Lcom/google/common/util/concurrent/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    goto :goto_0

    .line 3571
    .end local v1           #newValue:Ljava/lang/Object;,"TV;"
    :cond_1
    invoke-virtual {p2, p1, v2}, Lcom/google/common/cache/CacheLoader;->reload(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 3573
    .local v0, newValue:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    if-eqz v0, :cond_2

    .end local v0           #newValue:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    :goto_1
    move-object v4, v0

    goto :goto_0

    .restart local v0       #newValue:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    :cond_2
    const/4 v4, 0x0

    invoke-static {v4}, Lcom/google/common/util/concurrent/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    .line 3575
    .end local v0           #newValue:Lcom/google/common/util/concurrent/ListenableFuture;,"Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    :catch_0
    move-exception v3

    .line 3576
    .local v3, t:Ljava/lang/Throwable;
    invoke-virtual {p0, v3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->setException(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->futureValue:Lcom/google/common/util/concurrent/SettableFuture;

    goto :goto_0

    :cond_3
    invoke-direct {p0, v3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->fullyFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    goto :goto_0
.end method

.method public notifyNewValue(Ljava/lang/Object;)V
    .locals 1
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 3551
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p1, newValue:Ljava/lang/Object;,"TV;"
    if-eqz p1, :cond_0

    .line 3554
    invoke-virtual {p0, p1}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->set(Ljava/lang/Object;)Z

    .line 3561
    :goto_0
    return-void

    .line 3557
    :cond_0
    invoke-static {}, Lcom/google/common/cache/LocalCache;->unset()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->oldValue:Lcom/google/common/cache/LocalCache$ValueReference;

    goto :goto_0
.end method

.method public set(Ljava/lang/Object;)Z
    .locals 1
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .prologue
    .line 3527
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p1, newValue:Ljava/lang/Object;,"TV;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->futureValue:Lcom/google/common/util/concurrent/SettableFuture;

    invoke-virtual {v0, p1}, Lcom/google/common/util/concurrent/SettableFuture;->set(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setException(Ljava/lang/Throwable;)Z
    .locals 1
    .parameter "t"

    .prologue
    .line 3531
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->futureValue:Lcom/google/common/util/concurrent/SettableFuture;

    invoke-static {v0, p1}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->setException(Lcom/google/common/util/concurrent/SettableFuture;Ljava/lang/Throwable;)Z

    move-result v0

    return v0
.end method

.method public waitForValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 3586
    .local p0, this:Lcom/google/common/cache/LocalCache$LoadingValueReference;,"Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$LoadingValueReference;->futureValue:Lcom/google/common/util/concurrent/SettableFuture;

    invoke-static {v0}, Lcom/google/common/util/concurrent/Uninterruptibles;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
