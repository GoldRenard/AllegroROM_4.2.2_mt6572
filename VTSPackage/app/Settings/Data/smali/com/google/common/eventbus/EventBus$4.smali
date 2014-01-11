.class Lcom/google/common/eventbus/EventBus$4;
.super Lcom/google/common/cache/CacheLoader;
.source "EventBus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/eventbus/EventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/cache/CacheLoader",
        "<",
        "Ljava/lang/Class",
        "<*>;",
        "Ljava/util/Set",
        "<",
        "Ljava/lang/Class",
        "<*>;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/eventbus/EventBus;


# direct methods
.method constructor <init>(Lcom/google/common/eventbus/EventBus;)V
    .locals 0
    .parameter

    .prologue
    .line 159
    iput-object p1, p0, Lcom/google/common/eventbus/EventBus$4;->this$0:Lcom/google/common/eventbus/EventBus;

    invoke-direct {p0}, Lcom/google/common/cache/CacheLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic load(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 159
    check-cast p1, Ljava/lang/Class;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/eventbus/EventBus$4;->load(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public load(Ljava/lang/Class;)Ljava/util/Set;
    .locals 9
    .parameter
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 162
    .local p1, concreteClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {}, Lcom/google/common/collect/Lists;->newLinkedList()Ljava/util/LinkedList;

    move-result-object v7

    .line 163
    .local v7, parents:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Class<*>;>;"
    invoke-static {}, Lcom/google/common/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v1

    .line 165
    .local v1, classes:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-interface {v7, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    :cond_0
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_2

    .line 168
    const/4 v8, 0x0

    invoke-interface {v7, v8}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 169
    .local v2, clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 171
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    .line 172
    .local v6, parent:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    if-eqz v6, :cond_1

    .line 173
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/Class;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v5, :cond_0

    aget-object v4, v0, v3

    .line 177
    .local v4, iface:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 181
    .end local v0           #arr$:[Ljava/lang/Class;
    .end local v2           #clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v3           #i$:I
    .end local v4           #iface:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v5           #len$:I
    .end local v6           #parent:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_2
    return-object v1
.end method
