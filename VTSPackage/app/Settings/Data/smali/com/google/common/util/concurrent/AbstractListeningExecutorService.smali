.class abstract Lcom/google/common/util/concurrent/AbstractListeningExecutorService;
.super Ljava/lang/Object;
.source "AbstractListeningExecutorService.java"

# interfaces
.implements Lcom/google/common/util/concurrent/ListeningExecutorService;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private doInvokeAny(Ljava/util/Collection;ZJ)Ljava/lang/Object;
    .locals 20
    .parameter
    .parameter "timed"
    .parameter "nanos"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/util/concurrent/Callable",
            "<TT;>;>;ZJ)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 65
    .local p1, tasks:Ljava/util/Collection;,"Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v16

    .line 66
    .local v16, ntasks:I
    if-lez v16, :cond_1

    const/16 v18, 0x1

    :goto_0
    invoke-static/range {v18 .. v18}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 67
    new-instance v9, Ljava/util/ArrayList;

    move/from16 v0, v16

    invoke-direct {v9, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 68
    .local v9, futures:Ljava/util/List;,"Ljava/util/List<Ljava/util/concurrent/Future<TT;>;>;"
    new-instance v4, Ljava/util/concurrent/ExecutorCompletionService;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Ljava/util/concurrent/ExecutorCompletionService;-><init>(Ljava/util/concurrent/Executor;)V

    .line 79
    .local v4, ecs:Ljava/util/concurrent/ExecutorCompletionService;,"Ljava/util/concurrent/ExecutorCompletionService<TT;>;"
    const/4 v5, 0x0

    .line 80
    .local v5, ee:Ljava/util/concurrent/ExecutionException;
    if-eqz p2, :cond_2

    :try_start_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 81
    .local v12, lastTime:J
    :goto_1
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 84
    .local v11, it:Ljava/util/Iterator;,"Ljava/util/Iterator<+Ljava/util/concurrent/Callable<TT;>;>;"
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/concurrent/Callable;

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/util/concurrent/ExecutorCompletionService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    add-int/lit8 v16, v16, -0x1

    .line 86
    const/4 v3, 0x1

    .local v3, active:I
    move-object v6, v5

    .line 89
    .end local v5           #ee:Ljava/util/concurrent/ExecutionException;
    .local v6, ee:Ljava/util/concurrent/ExecutionException;
    :goto_2
    :try_start_1
    invoke-virtual {v4}, Ljava/util/concurrent/ExecutorCompletionService;->poll()Ljava/util/concurrent/Future;

    move-result-object v8

    .line 90
    .local v8, f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    if-nez v8, :cond_0

    .line 91
    if-lez v16, :cond_3

    .line 92
    add-int/lit8 v16, v16, -0x1

    .line 93
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/concurrent/Callable;

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/util/concurrent/ExecutorCompletionService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 94
    add-int/lit8 v3, v3, 0x1

    .line 109
    :cond_0
    :goto_3
    if-eqz v8, :cond_a

    .line 110
    add-int/lit8 v3, v3, -0x1

    .line 112
    :try_start_2
    invoke-interface {v8}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v18

    .line 126
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .end local v8           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    check-cast v8, Ljava/util/concurrent/Future;

    .line 127
    .restart local v8       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-interface {v8, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_4

    .line 66
    .end local v3           #active:I
    .end local v4           #ecs:Ljava/util/concurrent/ExecutorCompletionService;,"Ljava/util/concurrent/ExecutorCompletionService<TT;>;"
    .end local v6           #ee:Ljava/util/concurrent/ExecutionException;
    .end local v8           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .end local v9           #futures:Ljava/util/List;,"Ljava/util/List<Ljava/util/concurrent/Future<TT;>;>;"
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v11           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<+Ljava/util/concurrent/Callable<TT;>;>;"
    .end local v12           #lastTime:J
    :cond_1
    const/16 v18, 0x0

    goto :goto_0

    .line 80
    .restart local v4       #ecs:Ljava/util/concurrent/ExecutorCompletionService;,"Ljava/util/concurrent/ExecutorCompletionService<TT;>;"
    .restart local v5       #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v9       #futures:Ljava/util/List;,"Ljava/util/List<Ljava/util/concurrent/Future<TT;>;>;"
    :cond_2
    const-wide/16 v12, 0x0

    goto :goto_1

    .line 95
    .end local v5           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v3       #active:I
    .restart local v6       #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v8       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .restart local v11       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<+Ljava/util/concurrent/Callable<TT;>;>;"
    .restart local v12       #lastTime:J
    :cond_3
    if-nez v3, :cond_4

    .line 121
    if-nez v6, :cond_9

    .line 122
    :try_start_3
    new-instance v5, Ljava/util/concurrent/ExecutionException;

    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-direct {v5, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 124
    .end local v6           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v5       #ee:Ljava/util/concurrent/ExecutionException;
    :goto_5
    :try_start_4
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 126
    .end local v3           #active:I
    .end local v8           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .end local v11           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<+Ljava/util/concurrent/Callable<TT;>;>;"
    .end local v12           #lastTime:J
    :catchall_0
    move-exception v18

    :goto_6
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10       #i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/concurrent/Future;

    .line 127
    .restart local v8       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-interface {v8, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_7

    .line 97
    .end local v5           #ee:Ljava/util/concurrent/ExecutionException;
    .end local v10           #i$:Ljava/util/Iterator;
    .restart local v3       #active:I
    .restart local v6       #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v11       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<+Ljava/util/concurrent/Callable<TT;>;>;"
    .restart local v12       #lastTime:J
    :cond_4
    if-eqz p2, :cond_6

    .line 98
    :try_start_5
    sget-object v18, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, p3

    move-object/from16 v2, v18

    invoke-virtual {v4, v0, v1, v2}, Ljava/util/concurrent/ExecutorCompletionService;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/Future;

    move-result-object v8

    .line 99
    if-nez v8, :cond_5

    .line 100
    new-instance v18, Ljava/util/concurrent/TimeoutException;

    invoke-direct/range {v18 .. v18}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v18

    .line 126
    .end local v8           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    :catchall_1
    move-exception v18

    move-object v5, v6

    .end local v6           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v5       #ee:Ljava/util/concurrent/ExecutionException;
    goto :goto_6

    .line 102
    .end local v5           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v6       #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v8       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    :cond_5
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 103
    .local v14, now:J
    sub-long v18, v14, v12

    sub-long p3, p3, v18

    .line 104
    move-wide v12, v14

    .line 105
    goto :goto_3

    .line 106
    .end local v14           #now:J
    :cond_6
    invoke-virtual {v4}, Ljava/util/concurrent/ExecutorCompletionService;->take()Ljava/util/concurrent/Future;

    move-result-object v8

    goto :goto_3

    .line 113
    :catch_0
    move-exception v7

    .line 114
    .local v7, eex:Ljava/util/concurrent/ExecutionException;
    move-object v5, v7

    .end local v6           #ee:Ljava/util/concurrent/ExecutionException;
    .end local v7           #eex:Ljava/util/concurrent/ExecutionException;
    .restart local v5       #ee:Ljava/util/concurrent/ExecutionException;
    :goto_8
    move-object v6, v5

    .line 119
    .end local v5           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v6       #ee:Ljava/util/concurrent/ExecutionException;
    goto/16 :goto_2

    .line 115
    :catch_1
    move-exception v17

    .line 116
    .local v17, rex:Ljava/lang/RuntimeException;
    new-instance v5, Ljava/util/concurrent/ExecutionException;

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .end local v6           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v5       #ee:Ljava/util/concurrent/ExecutionException;
    goto :goto_8

    .line 127
    .end local v3           #active:I
    .end local v8           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .end local v11           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<+Ljava/util/concurrent/Callable<TT;>;>;"
    .end local v12           #lastTime:J
    .end local v17           #rex:Ljava/lang/RuntimeException;
    .restart local v10       #i$:Ljava/util/Iterator;
    :cond_7
    throw v18

    .end local v5           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v3       #active:I
    .restart local v6       #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v8       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .restart local v11       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<+Ljava/util/concurrent/Callable<TT;>;>;"
    .restart local v12       #lastTime:J
    :cond_8
    return-object v18

    .end local v10           #i$:Ljava/util/Iterator;
    :cond_9
    move-object v5, v6

    .end local v6           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v5       #ee:Ljava/util/concurrent/ExecutionException;
    goto :goto_5

    .end local v5           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v6       #ee:Ljava/util/concurrent/ExecutionException;
    :cond_a
    move-object v5, v6

    .end local v6           #ee:Ljava/util/concurrent/ExecutionException;
    .restart local v5       #ee:Ljava/util/concurrent/ExecutionException;
    goto :goto_8
.end method


# virtual methods
.method public invokeAll(Ljava/util/Collection;)Ljava/util/List;
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/util/concurrent/Callable",
            "<TT;>;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/util/concurrent/Future",
            "<TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .local p1, tasks:Ljava/util/Collection;,"Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    const/4 v8, 0x1

    .line 149
    if-nez p1, :cond_0

    .line 150
    new-instance v6, Ljava/lang/NullPointerException;

    invoke-direct {v6}, Ljava/lang/NullPointerException;-><init>()V

    throw v6

    .line 152
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 153
    .local v3, futures:Ljava/util/List;,"Ljava/util/List<Ljava/util/concurrent/Future<TT;>;>;"
    const/4 v0, 0x0

    .line 155
    .local v0, done:Z
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/concurrent/Callable;

    .line 156
    .local v5, t:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    invoke-static {v5}, Lcom/google/common/util/concurrent/ListenableFutureTask;->create(Ljava/util/concurrent/Callable;)Lcom/google/common/util/concurrent/ListenableFutureTask;

    move-result-object v1

    .line 157
    .local v1, f:Lcom/google/common/util/concurrent/ListenableFutureTask;,"Lcom/google/common/util/concurrent/ListenableFutureTask<TT;>;"
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    invoke-virtual {p0, v1}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 172
    .end local v1           #f:Lcom/google/common/util/concurrent/ListenableFutureTask;,"Lcom/google/common/util/concurrent/ListenableFutureTask<TT;>;"
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #t:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    :catchall_0
    move-exception v6

    if-nez v0, :cond_4

    .line 173
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .restart local v4       #i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Future;

    .line 174
    .local v2, f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    invoke-interface {v2, v8}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_1

    .line 160
    .end local v2           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    :cond_1
    :try_start_1
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Future;

    .line 161
    .restart local v2       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    invoke-interface {v2}, Ljava/util/concurrent/Future;->isDone()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v6

    if-nez v6, :cond_2

    .line 163
    :try_start_2
    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 164
    :catch_0
    move-exception v6

    goto :goto_2

    .line 169
    .end local v2           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    :cond_3
    const/4 v0, 0x1

    .line 172
    if-nez v0, :cond_5

    .line 173
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Future;

    .line 174
    .restart local v2       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    invoke-interface {v2, v8}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_3

    .end local v2           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .end local v4           #i$:Ljava/util/Iterator;
    :cond_4
    throw v6

    .line 165
    .restart local v2       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .restart local v4       #i$:Ljava/util/Iterator;
    :catch_1
    move-exception v6

    goto :goto_2

    .line 174
    .end local v2           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    :cond_5
    return-object v3
.end method

.method public invokeAll(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/util/List;
    .locals 18
    .parameter
    .parameter "timeout"
    .parameter "unit"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/util/concurrent/Callable",
            "<TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/util/concurrent/Future",
            "<TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 183
    .local p1, tasks:Ljava/util/Collection;,"Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    if-eqz p1, :cond_0

    if-nez p4, :cond_1

    .line 184
    :cond_0
    new-instance v16, Ljava/lang/NullPointerException;

    invoke-direct/range {v16 .. v16}, Ljava/lang/NullPointerException;-><init>()V

    throw v16

    .line 186
    :cond_1
    move-object/from16 v0, p4

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v10

    .line 187
    .local v10, nanos:J
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v16

    move/from16 v0, v16

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 188
    .local v5, futures:Ljava/util/List;,"Ljava/util/List<Ljava/util/concurrent/Future<TT;>;>;"
    const/4 v3, 0x0

    .line 190
    .local v3, done:Z
    :try_start_0
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/concurrent/Callable;

    .line 191
    .local v14, t:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    invoke-static {v14}, Lcom/google/common/util/concurrent/ListenableFutureTask;->create(Ljava/util/concurrent/Callable;)Lcom/google/common/util/concurrent/ListenableFutureTask;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 229
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v14           #t:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    :catchall_0
    move-exception v16

    if-nez v3, :cond_8

    .line 230
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6       #i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/concurrent/Future;

    .line 231
    .local v4, f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_1

    .line 194
    .end local v4           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    :cond_2
    :try_start_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 198
    .local v8, lastTime:J
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 199
    .local v7, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/concurrent/Future<TT;>;>;"
    :cond_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_4

    .line 200
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Runnable;

    check-cast v16, Ljava/lang/Runnable;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 201
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v12

    .line 202
    .local v12, now:J
    sub-long v16, v12, v8

    sub-long v10, v10, v16

    .line 203
    move-wide v8, v12

    .line 204
    const-wide/16 v16, 0x0

    cmp-long v16, v10, v16

    if-gtz v16, :cond_3

    .line 229
    if-nez v3, :cond_9

    .line 230
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/concurrent/Future;

    .line 231
    .restart local v4       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_2

    .line 209
    .end local v4           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .end local v12           #now:J
    :cond_4
    :try_start_2
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_5
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/concurrent/Future;

    .line 210
    .restart local v4       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    invoke-interface {v4}, Ljava/util/concurrent/Future;->isDone()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v16

    if-nez v16, :cond_5

    .line 211
    const-wide/16 v16, 0x0

    cmp-long v16, v10, v16

    if-gtz v16, :cond_6

    .line 229
    if-nez v3, :cond_9

    .line 230
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .end local v4           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    check-cast v4, Ljava/util/concurrent/Future;

    .line 231
    .restart local v4       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_4

    .line 215
    :cond_6
    :try_start_3
    sget-object v16, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v16

    invoke-interface {v4, v10, v11, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_3 .. :try_end_3} :catch_0

    .line 221
    :goto_5
    :try_start_4
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-wide v12

    .line 222
    .restart local v12       #now:J
    sub-long v16, v12, v8

    sub-long v10, v10, v16

    .line 223
    move-wide v8, v12

    goto :goto_3

    .line 218
    .end local v12           #now:J
    :catch_0
    move-exception v15

    .line 229
    .local v15, toe:Ljava/util/concurrent/TimeoutException;
    if-nez v3, :cond_9

    .line 230
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .end local v4           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    check-cast v4, Ljava/util/concurrent/Future;

    .line 231
    .restart local v4       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_6

    .line 226
    .end local v4           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .end local v15           #toe:Ljava/util/concurrent/TimeoutException;
    :cond_7
    const/4 v3, 0x1

    .line 229
    if-nez v3, :cond_9

    .line 230
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/concurrent/Future;

    .line 231
    .restart local v4       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-interface {v4, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_7

    .end local v4           #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v7           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/concurrent/Future<TT;>;>;"
    .end local v8           #lastTime:J
    :cond_8
    throw v16

    .restart local v6       #i$:Ljava/util/Iterator;
    .restart local v7       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/concurrent/Future<TT;>;>;"
    .restart local v8       #lastTime:J
    :cond_9
    return-object v5

    .line 217
    .restart local v4       #f:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<TT;>;"
    :catch_1
    move-exception v16

    goto :goto_5

    .line 216
    :catch_2
    move-exception v16

    goto :goto_5
.end method

.method public invokeAny(Ljava/util/Collection;)Ljava/lang/Object;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/util/concurrent/Callable",
            "<TT;>;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 135
    .local p1, tasks:Ljava/util/Collection;,"Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    :try_start_0
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->doInvokeAny(Ljava/util/Collection;ZJ)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, cannotHappen:Ljava/util/concurrent/TimeoutException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public invokeAny(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 3
    .parameter
    .parameter "timeout"
    .parameter "unit"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/util/concurrent/Callable",
            "<TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 144
    .local p1, tasks:Ljava/util/Collection;,"Ljava/util/Collection<+Ljava/util/concurrent/Callable<TT;>;>;"
    const/4 v0, 0x1

    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v1

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->doInvokeAny(Ljava/util/Collection;ZJ)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public submit(Ljava/lang/Runnable;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .parameter "task"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 43
    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/google/common/util/concurrent/ListenableFutureTask;->create(Ljava/lang/Runnable;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFutureTask;

    move-result-object v0

    .line 44
    .local v0, ftask:Lcom/google/common/util/concurrent/ListenableFutureTask;,"Lcom/google/common/util/concurrent/ListenableFutureTask<Ljava/lang/Void;>;"
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 45
    return-object v0
.end method

.method public submit(Ljava/lang/Runnable;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .parameter "task"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "TT;)",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 49
    .local p2, result:Ljava/lang/Object;,"TT;"
    invoke-static {p1, p2}, Lcom/google/common/util/concurrent/ListenableFutureTask;->create(Ljava/lang/Runnable;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFutureTask;

    move-result-object v0

    .line 50
    .local v0, ftask:Lcom/google/common/util/concurrent/ListenableFutureTask;,"Lcom/google/common/util/concurrent/ListenableFutureTask<TT;>;"
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 51
    return-object v0
.end method

.method public submit(Ljava/util/concurrent/Callable;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, task:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    invoke-static {p1}, Lcom/google/common/util/concurrent/ListenableFutureTask;->create(Ljava/util/concurrent/Callable;)Lcom/google/common/util/concurrent/ListenableFutureTask;

    move-result-object v0

    .line 56
    .local v0, ftask:Lcom/google/common/util/concurrent/ListenableFutureTask;,"Lcom/google/common/util/concurrent/ListenableFutureTask<TT;>;"
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 57
    return-object v0
.end method

.method public bridge synthetic submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->submit(Ljava/lang/Runnable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic submit(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->submit(Ljava/lang/Runnable;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/AbstractListeningExecutorService;->submit(Ljava/util/concurrent/Callable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
