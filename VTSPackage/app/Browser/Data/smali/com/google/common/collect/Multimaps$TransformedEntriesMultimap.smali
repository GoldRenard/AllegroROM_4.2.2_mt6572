.class Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;
.super Ljava/lang/Object;
.source "Multimaps.java"

# interfaces
.implements Lcom/google/common/collect/Multimap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TransformedEntriesMultimap"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V1:",
        "Ljava/lang/Object;",
        "V2:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/Multimap",
        "<TK;TV2;>;"
    }
.end annotation


# instance fields
.field private transient asMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV2;>;>;"
        }
    .end annotation
.end field

.field private transient entries:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV2;>;>;"
        }
    .end annotation
.end field

.field final fromMultimap:Lcom/google/common/collect/Multimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multimap",
            "<TK;TV1;>;"
        }
    .end annotation
.end field

.field final transformer:Lcom/google/common/collect/Maps$EntryTransformer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Maps$EntryTransformer",
            "<-TK;-TV1;TV2;>;"
        }
    .end annotation
.end field

.field private transient values:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<TV2;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Maps$EntryTransformer;)V
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV1;>;",
            "Lcom/google/common/collect/Maps$EntryTransformer",
            "<-TK;-TV1;TV2;>;)V"
        }
    .end annotation

    .prologue
    .line 1407
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    .local p1, fromMultimap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV1;>;"
    .local p2, transformer:Lcom/google/common/collect/Maps$EntryTransformer;,"Lcom/google/common/collect/Maps$EntryTransformer<-TK;-TV1;TV2;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1408
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Multimap;

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    .line 1409
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Maps$EntryTransformer;

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->transformer:Lcom/google/common/collect/Maps$EntryTransformer;

    .line 1410
    return-void
.end method


# virtual methods
.method public asMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV2;>;>;"
        }
    .end annotation

    .prologue
    .line 1423
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->asMap:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 1424
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v1}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v1

    new-instance v2, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;

    invoke-direct {v2, p0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;-><init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;)V

    invoke-static {v1, v2}, Lcom/google/common/collect/Maps;->transformEntries(Ljava/util/Map;Lcom/google/common/collect/Maps$EntryTransformer;)Ljava/util/Map;

    move-result-object v0

    .line 1432
    .local v0, aM:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV2;>;>;"
    iput-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->asMap:Ljava/util/Map;

    .line 1435
    .end local v0           #aM:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV2;>;>;"
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->asMap:Ljava/util/Map;

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 1439
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->clear()V

    .line 1440
    return-void
.end method

.method public containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .parameter "key"
    .parameter "value"

    .prologue
    .line 1444
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 1445
    .local v0, values:Ljava/util/Collection;,"Ljava/util/Collection<TV2;>;"
    invoke-interface {v0, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .parameter "key"

    .prologue
    .line 1449
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .parameter "value"

    .prologue
    .line 1453
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entries()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV2;>;>;"
        }
    .end annotation

    .prologue
    .line 1459
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->entries:Ljava/util/Collection;

    if-nez v1, :cond_0

    .line 1460
    new-instance v0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries;

    iget-object v1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->transformer:Lcom/google/common/collect/Maps$EntryTransformer;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries;-><init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;Lcom/google/common/collect/Maps$EntryTransformer;)V

    .line 1461
    .local v0, es:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/util/Map$Entry<TK;TV2;>;>;"
    iput-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->entries:Ljava/util/Collection;

    .line 1464
    .end local v0           #es:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/util/Map$Entry<TK;TV2;>;>;"
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->entries:Ljava/util/Collection;

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "obj"

    .prologue
    .line 1577
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    instance-of v1, p1, Lcom/google/common/collect/Multimap;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 1578
    check-cast v0, Lcom/google/common/collect/Multimap;

    .line 1579
    .local v0, other:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<**>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->asMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1581
    .end local v0           #other:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<**>;"
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/Collection",
            "<TV2;>;"
        }
    .end annotation

    .prologue
    .line 1511
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 1585
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 1515
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 1519
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/google/common/collect/Multiset;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 1523
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->keys()Lcom/google/common/collect/Multiset;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV2;)Z"
        }
    .end annotation

    .prologue
    .line 1527
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, value:Ljava/lang/Object;,"TV2;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public putAll(Lcom/google/common/collect/Multimap;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<+TK;+TV2;>;)Z"
        }
    .end annotation

    .prologue
    .line 1536
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    .local p1, multimap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<+TK;+TV2;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Iterable",
            "<+TV2;>;)Z"
        }
    .end annotation

    .prologue
    .line 1531
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, values:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TV2;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 1541
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 1
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Collection",
            "<TV2;>;"
        }
    .end annotation

    .prologue
    .line 1546
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->removeAll(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/Collection;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Iterable",
            "<+TV2;>;)",
            "Ljava/util/Collection",
            "<TV2;>;"
        }
    .end annotation

    .prologue
    .line 1551
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, values:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TV2;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1555
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1589
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Collection",
            "<TV1;>;)",
            "Ljava/util/Collection",
            "<TV2;>;"
        }
    .end annotation

    .prologue
    .line 1413
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, values:Ljava/util/Collection;,"Ljava/util/Collection<TV1;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$1;-><init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;Ljava/lang/Object;)V

    invoke-static {p2, v0}, Lcom/google/common/collect/Collections2;->transform(Ljava/util/Collection;Lcom/google/common/base/Function;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV2;>;"
        }
    .end annotation

    .prologue
    .line 1561
    .local p0, this:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,"Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<TK;TV1;TV2;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->values:Ljava/util/Collection;

    if-nez v1, :cond_0

    .line 1562
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v1}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v1

    new-instance v2, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$3;

    invoke-direct {v2, p0}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$3;-><init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;)V

    invoke-static {v1, v2}, Lcom/google/common/collect/Collections2;->transform(Ljava/util/Collection;Lcom/google/common/base/Function;)Ljava/util/Collection;

    move-result-object v0

    .line 1570
    .local v0, vs:Ljava/util/Collection;,"Ljava/util/Collection<TV2;>;"
    iput-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->values:Ljava/util/Collection;

    .line 1573
    .end local v0           #vs:Ljava/util/Collection;,"Ljava/util/Collection<TV2;>;"
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->values:Ljava/util/Collection;

    goto :goto_0
.end method
