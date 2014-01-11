.class Lcom/google/common/eventbus/AnnotatedHandlerFinder;
.super Ljava/lang/Object;
.source "AnnotatedHandlerFinder.java"

# interfaces
.implements Lcom/google/common/eventbus/HandlerFindingStrategy;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static makeHandler(Ljava/lang/Object;Ljava/lang/reflect/Method;)Lcom/google/common/eventbus/EventHandler;
    .locals 2
    .parameter "listener"
    .parameter "method"

    .prologue
    .line 78
    invoke-static {p1}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->methodIsDeclaredThreadSafe(Ljava/lang/reflect/Method;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    new-instance v0, Lcom/google/common/eventbus/EventHandler;

    invoke-direct {v0, p0, p1}, Lcom/google/common/eventbus/EventHandler;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    .line 83
    .local v0, wrapper:Lcom/google/common/eventbus/EventHandler;
    :goto_0
    return-object v0

    .line 81
    .end local v0           #wrapper:Lcom/google/common/eventbus/EventHandler;
    :cond_0
    new-instance v0, Lcom/google/common/eventbus/SynchronizedEventHandler;

    invoke-direct {v0, p0, p1}, Lcom/google/common/eventbus/SynchronizedEventHandler;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    .restart local v0       #wrapper:Lcom/google/common/eventbus/EventHandler;
    goto :goto_0
.end method

.method private static methodIsDeclaredThreadSafe(Ljava/lang/reflect/Method;)Z
    .locals 1
    .parameter "method"

    .prologue
    .line 95
    const-class v0, Lcom/google/common/eventbus/AllowConcurrentEvents;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public findAllHandlers(Ljava/lang/Object;)Lcom/google/common/collect/Multimap;
    .locals 13
    .parameter "listener"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/common/eventbus/EventHandler;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {}, Lcom/google/common/collect/HashMultimap;->create()Lcom/google/common/collect/HashMultimap;

    move-result-object v8

    .line 41
    .local v8, methodsInListener:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<Ljava/lang/Class<*>;Lcom/google/common/eventbus/EventHandler;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 42
    .local v2, clazz:Ljava/lang/Class;
    :goto_0
    if-eqz v2, :cond_3

    .line 43
    invoke-virtual {v2}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .local v1, arr$:[Ljava/lang/reflect/Method;
    array-length v6, v1

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1
    if-ge v5, v6, :cond_2

    aget-object v7, v1, v5

    .line 44
    .local v7, method:Ljava/lang/reflect/Method;
    const-class v10, Lcom/google/common/eventbus/Subscribe;

    invoke-virtual {v7, v10}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/google/common/eventbus/Subscribe;

    .line 46
    .local v0, annotation:Lcom/google/common/eventbus/Subscribe;
    if-eqz v0, :cond_1

    .line 47
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v9

    .line 48
    .local v9, parameterTypes:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    array-length v10, v9

    const/4 v11, 0x1

    if-eq v10, v11, :cond_0

    .line 49
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Method "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " has @Subscribe annotation, but requires "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    array-length v12, v9

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " arguments.  Event handler methods "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "must require a single argument."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 54
    :cond_0
    const/4 v10, 0x0

    aget-object v3, v9, v10

    .line 55
    .local v3, eventType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {p1, v7}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->makeHandler(Ljava/lang/Object;Ljava/lang/reflect/Method;)Lcom/google/common/eventbus/EventHandler;

    move-result-object v4

    .line 57
    .local v4, handler:Lcom/google/common/eventbus/EventHandler;
    invoke-interface {v8, v3, v4}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 43
    .end local v3           #eventType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v4           #handler:Lcom/google/common/eventbus/EventHandler;
    .end local v9           #parameterTypes:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 60
    .end local v0           #annotation:Lcom/google/common/eventbus/Subscribe;
    .end local v7           #method:Ljava/lang/reflect/Method;
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_0

    .line 62
    .end local v1           #arr$:[Ljava/lang/reflect/Method;
    .end local v5           #i$:I
    .end local v6           #len$:I
    :cond_3
    return-object v8
.end method
