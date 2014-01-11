.class public Lcom/google/common/eventbus/EventBus;
.super Ljava/lang/Object;
.source "EventBus.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/eventbus/EventBus$EventWithHandler;
    }
.end annotation


# instance fields
.field private final eventsToDispatch:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/google/common/eventbus/EventBus$EventWithHandler;",
            ">;>;"
        }
    .end annotation
.end field

.field private final finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

.field private flattenHierarchyCache:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private final handlersByType:Lcom/google/common/collect/SetMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/SetMultimap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/common/eventbus/EventHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final isDispatching:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final logger:Ljava/util/logging/Logger;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 189
    const-string v0, "default"

    invoke-direct {p0, v0}, Lcom/google/common/eventbus/EventBus;-><init>(Ljava/lang/String;)V

    .line 190
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "identifier"

    .prologue
    .line 198
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    new-instance v1, Lcom/google/common/eventbus/EventBus$1;

    invoke-direct {v1, p0}, Lcom/google/common/eventbus/EventBus$1;-><init>(Lcom/google/common/eventbus/EventBus;)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Multimaps;->newSetMultimap(Ljava/util/Map;Lcom/google/common/base/Supplier;)Lcom/google/common/collect/SetMultimap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->handlersByType:Lcom/google/common/collect/SetMultimap;

    .line 134
    new-instance v0, Lcom/google/common/eventbus/AnnotatedHandlerFinder;

    invoke-direct {v0}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;-><init>()V

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

    .line 137
    new-instance v0, Lcom/google/common/eventbus/EventBus$2;

    invoke-direct {v0, p0}, Lcom/google/common/eventbus/EventBus$2;-><init>(Lcom/google/common/eventbus/EventBus;)V

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    .line 146
    new-instance v0, Lcom/google/common/eventbus/EventBus$3;

    invoke-direct {v0, p0}, Lcom/google/common/eventbus/EventBus$3;-><init>(Lcom/google/common/eventbus/EventBus;)V

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    .line 156
    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakKeys()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/google/common/eventbus/EventBus$4;

    invoke-direct {v1, p0}, Lcom/google/common/eventbus/EventBus$4;-><init>(Lcom/google/common/eventbus/EventBus;)V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->flattenHierarchyCache:Lcom/google/common/cache/LoadingCache;

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lcom/google/common/eventbus/EventBus;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->logger:Ljava/util/logging/Logger;

    .line 200
    return-void
.end method


# virtual methods
.method protected dispatch(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    .locals 5
    .parameter "event"
    .parameter "wrapper"

    .prologue
    .line 313
    :try_start_0
    invoke-virtual {p2, p1}, Lcom/google/common/eventbus/EventHandler;->handleEvent(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    :goto_0
    return-void

    .line 314
    :catch_0
    move-exception v0

    .line 315
    .local v0, e:Ljava/lang/reflect/InvocationTargetException;
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not dispatch event: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to handler "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected dispatchQueuedEvents()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 284
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 301
    :goto_0
    return-void

    .line 288
    :cond_0
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 291
    :goto_1
    :try_start_0
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/eventbus/EventBus$EventWithHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 292
    .local v0, eventWithHandler:Lcom/google/common/eventbus/EventBus$EventWithHandler;
    if-nez v0, :cond_1

    .line 299
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_0

    .line 296
    :cond_1
    :try_start_1
    iget-object v1, v0, Lcom/google/common/eventbus/EventBus$EventWithHandler;->event:Ljava/lang/Object;

    iget-object v2, v0, Lcom/google/common/eventbus/EventBus$EventWithHandler;->handler:Lcom/google/common/eventbus/EventHandler;

    invoke-virtual {p0, v1, v2}, Lcom/google/common/eventbus/EventBus;->dispatch(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 299
    .end local v0           #eventWithHandler:Lcom/google/common/eventbus/EventBus$EventWithHandler;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v1
.end method

.method protected enqueueEvent(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    .locals 2
    .parameter "event"
    .parameter "handler"

    .prologue
    .line 273
    iget-object v0, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v1, Lcom/google/common/eventbus/EventBus$EventWithHandler;

    invoke-direct {v1, p1, p2}, Lcom/google/common/eventbus/EventBus$EventWithHandler;-><init>(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 274
    return-void
.end method

.method flattenHierarchy(Ljava/lang/Class;)Ljava/util/Set;
    .locals 2
    .parameter
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 354
    .local p1, concreteClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :try_start_0
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->flattenHierarchyCache:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v1, p1}, Lcom/google/common/cache/LoadingCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 355
    :catch_0
    move-exception v0

    .line 356
    .local v0, e:Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method getHandlersForEventType(Ljava/lang/Class;)Ljava/util/Set;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Set",
            "<",
            "Lcom/google/common/eventbus/EventHandler;",
            ">;"
        }
    .end annotation

    .prologue
    .line 329
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/google/common/eventbus/EventBus;->handlersByType:Lcom/google/common/collect/SetMultimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/SetMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected newHandlerSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/google/common/eventbus/EventHandler;",
            ">;"
        }
    .end annotation

    .prologue
    .line 340
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    return-object v0
.end method

.method public post(Ljava/lang/Object;)V
    .locals 8
    .parameter "event"

    .prologue
    .line 246
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/google/common/eventbus/EventBus;->flattenHierarchy(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    .line 248
    .local v0, dispatchTypes:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Class<*>;>;"
    const/4 v1, 0x0

    .line 249
    .local v1, dispatched:Z
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 250
    .local v2, eventType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {p0, v2}, Lcom/google/common/eventbus/EventBus;->getHandlersForEventType(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v6

    .line 252
    .local v6, wrappers:Ljava/util/Set;,"Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    if-eqz v6, :cond_0

    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 253
    const/4 v1, 0x1

    .line 254
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/common/eventbus/EventHandler;

    .line 255
    .local v5, wrapper:Lcom/google/common/eventbus/EventHandler;
    invoke-virtual {p0, p1, v5}, Lcom/google/common/eventbus/EventBus;->enqueueEvent(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V

    goto :goto_0

    .line 260
    .end local v2           #eventType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #wrapper:Lcom/google/common/eventbus/EventHandler;
    .end local v6           #wrappers:Ljava/util/Set;,"Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    :cond_1
    if-nez v1, :cond_2

    instance-of v7, p1, Lcom/google/common/eventbus/DeadEvent;

    if-nez v7, :cond_2

    .line 261
    new-instance v7, Lcom/google/common/eventbus/DeadEvent;

    invoke-direct {v7, p0, p1}, Lcom/google/common/eventbus/DeadEvent;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v7}, Lcom/google/common/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 264
    :cond_2
    invoke-virtual {p0}, Lcom/google/common/eventbus/EventBus;->dispatchQueuedEvents()V

    .line 265
    return-void
.end method

.method public register(Ljava/lang/Object;)V
    .locals 2
    .parameter "object"

    .prologue
    .line 211
    iget-object v0, p0, Lcom/google/common/eventbus/EventBus;->handlersByType:Lcom/google/common/collect/SetMultimap;

    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

    invoke-interface {v1, p1}, Lcom/google/common/eventbus/HandlerFindingStrategy;->findAllHandlers(Ljava/lang/Object;)Lcom/google/common/collect/Multimap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/collect/SetMultimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    .line 212
    return-void
.end method

.method public unregister(Ljava/lang/Object;)V
    .locals 8
    .parameter "object"

    .prologue
    .line 221
    iget-object v5, p0, Lcom/google/common/eventbus/EventBus;->finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

    invoke-interface {v5, p1}, Lcom/google/common/eventbus/HandlerFindingStrategy;->findAllHandlers(Ljava/lang/Object;)Lcom/google/common/collect/Multimap;

    move-result-object v4

    .line 222
    .local v4, methodsInListener:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<Ljava/lang/Class<*>;Lcom/google/common/eventbus/EventHandler;>;"
    invoke-interface {v4}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 223
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Class;

    invoke-virtual {p0, v5}, Lcom/google/common/eventbus/EventBus;->getHandlersForEventType(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    .line 224
    .local v0, currentHandlers:Ljava/util/Set;,"Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    .line 226
    .local v2, eventMethodsInListener:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;"
    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v0, v5}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 227
    :cond_0
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "missing event handler for an annotated method. Is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " registered?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 230
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 232
    .end local v0           #currentHandlers:Ljava/util/Set;,"Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;>;"
    .end local v2           #eventMethodsInListener:Ljava/util/Collection;,"Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;"
    :cond_2
    return-void
.end method
