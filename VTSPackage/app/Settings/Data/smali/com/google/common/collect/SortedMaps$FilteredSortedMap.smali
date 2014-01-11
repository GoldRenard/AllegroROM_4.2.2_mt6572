.class Lcom/google/common/collect/SortedMaps$FilteredSortedMap;
.super Lcom/google/common/collect/Maps$FilteredEntryMap;
.source "SortedMaps.java"

# interfaces
.implements Ljava/util/SortedMap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/SortedMaps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FilteredSortedMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Maps$FilteredEntryMap",
        "<TK;TV;>;",
        "Ljava/util/SortedMap",
        "<TK;TV;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/util/SortedMap;Lcom/google/common/base/Predicate;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/SortedMap",
            "<TK;TV;>;",
            "Lcom/google/common/base/Predicate",
            "<-",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 332
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    .local p1, unfiltered:Ljava/util/SortedMap;,"Ljava/util/SortedMap<TK;TV;>;"
    .local p2, entryPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/Maps$FilteredEntryMap;-><init>(Ljava/util/Map;Lcom/google/common/base/Predicate;)V

    .line 333
    return-void
.end method


# virtual methods
.method public comparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<-TK;>;"
        }
    .end annotation

    .prologue
    .line 340
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->sortedMap()Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/SortedMap;->comparator()Ljava/util/Comparator;

    move-result-object v0

    return-object v0
.end method

.method public firstKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 345
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public headMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 361
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    .local p1, toKey:Ljava/lang/Object;,"TK;"
    new-instance v0, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;

    invoke-virtual {p0}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->sortedMap()Ljava/util/SortedMap;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/SortedMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/collect/Maps$AbstractFilteredMap;->predicate:Lcom/google/common/base/Predicate;

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;-><init>(Ljava/util/SortedMap;Lcom/google/common/base/Predicate;)V

    return-object v0
.end method

.method public lastKey()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 349
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->sortedMap()Ljava/util/SortedMap;

    move-result-object v0

    .line 352
    .local v0, headMap:Ljava/util/SortedMap;,"Ljava/util/SortedMap<TK;TV;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/SortedMap;->lastKey()Ljava/lang/Object;

    move-result-object v1

    .line 353
    .local v1, key:Ljava/lang/Object;,"TK;"
    iget-object v2, p0, Lcom/google/common/collect/Maps$AbstractFilteredMap;->unfiltered:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->apply(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 354
    return-object v1

    .line 356
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->sortedMap()Ljava/util/SortedMap;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/SortedMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    .line 357
    goto :goto_0
.end method

.method sortedMap()Ljava/util/SortedMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 336
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Maps$AbstractFilteredMap;->unfiltered:Ljava/util/Map;

    check-cast v0, Ljava/util/SortedMap;

    return-object v0
.end method

.method public subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TK;)",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 365
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    .local p1, fromKey:Ljava/lang/Object;,"TK;"
    .local p2, toKey:Ljava/lang/Object;,"TK;"
    new-instance v0, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;

    invoke-virtual {p0}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->sortedMap()Ljava/util/SortedMap;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Ljava/util/SortedMap;->subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/collect/Maps$AbstractFilteredMap;->predicate:Lcom/google/common/base/Predicate;

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;-><init>(Ljava/util/SortedMap;Lcom/google/common/base/Predicate;)V

    return-object v0
.end method

.method public tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 370
    .local p0, this:Lcom/google/common/collect/SortedMaps$FilteredSortedMap;,"Lcom/google/common/collect/SortedMaps$FilteredSortedMap<TK;TV;>;"
    .local p1, fromKey:Ljava/lang/Object;,"TK;"
    new-instance v0, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;

    invoke-virtual {p0}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;->sortedMap()Ljava/util/SortedMap;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/SortedMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/collect/Maps$AbstractFilteredMap;->predicate:Lcom/google/common/base/Predicate;

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/SortedMaps$FilteredSortedMap;-><init>(Ljava/util/SortedMap;Lcom/google/common/base/Predicate;)V

    return-object v0
.end method
