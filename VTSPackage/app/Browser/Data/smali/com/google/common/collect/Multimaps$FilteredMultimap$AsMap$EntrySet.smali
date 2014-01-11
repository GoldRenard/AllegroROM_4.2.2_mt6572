.class Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;
.super Lcom/google/common/collect/Maps$EntrySet;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$EntrySet",
        "<TK;",
        "Ljava/util/Collection",
        "<TV;>;>;"
    }
.end annotation


# instance fields
.field delegateEntries:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;Ljava/util/Set;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;)V"
        }
    .end annotation

    .prologue
    .line 2658
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.EntrySet;"
    .local p2, delegateEntries:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    invoke-direct {p0}, Lcom/google/common/collect/Maps$EntrySet;-><init>()V

    .line 2659
    iput-object p2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;->delegateEntries:Ljava/util/Set;

    .line 2660
    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 2667
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.EntrySet;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;->delegateEntries:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

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
    .line 2663
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.EntrySet;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 4
    .parameter "o"

    .prologue
    .line 2671
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.EntrySet;"
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-eqz v2, :cond_0

    move-object v1, p1

    .line 2672
    check-cast v1, Ljava/util/Map$Entry;

    .line 2673
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<**>;"
    iget-object v2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    iget-object v2, v2, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->delegate:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 2674
    .local v0, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2675
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 2676
    const/4 v2, 0x1

    .line 2679
    .end local v0           #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<**>;"
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 2683
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.EntrySet;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    invoke-static {p0, p1}, Lcom/google/common/collect/Sets;->removeAllImpl(Ljava/util/Set;Ljava/lang/Iterable;)Z

    move-result v0

    return v0
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
    .line 2687
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap.EntrySet;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet$1;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;Ljava/util/Collection;)V

    .line 2693
    .local v0, removalPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;->this$1:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    iget-object v1, v1, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->removeEntriesIf(Lcom/google/common/base/Predicate;)Z

    move-result v1

    return v1
.end method
