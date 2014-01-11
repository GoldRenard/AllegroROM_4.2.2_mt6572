.class Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;
.super Lcom/google/common/collect/Maps$Values;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$Values",
        "<TK;",
        "Ljava/util/Collection",
        "<TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;)V
    .locals 0
    .parameter

    .prologue
    .line 2613
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.Values;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    invoke-direct {p0}, Lcom/google/common/collect/Maps$Values;-><init>()V

    return-void
.end method


# virtual methods
.method map()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;"
        }
    .end annotation

    .prologue
    .line 2615
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.Values;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    .line 2619
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.Values;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 2620
    .local v0, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2621
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 2622
    const/4 v2, 0x1

    .line 2625
    .end local v0           #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 2629
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.Values;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values$1;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;Ljava/util/Collection;)V

    .line 2635
    .local v0, removalPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    iget-object v1, v1, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->removeEntriesIf(Lcom/google/common/base/Predicate;)Z

    move-result v1

    return v1
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 2639
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.Values;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values$2;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values$2;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;Ljava/util/Collection;)V

    .line 2645
    .local v0, removalPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    iget-object v1, v1, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->removeEntriesIf(Lcom/google/common/base/Predicate;)Z

    move-result v1

    return v1
.end method
