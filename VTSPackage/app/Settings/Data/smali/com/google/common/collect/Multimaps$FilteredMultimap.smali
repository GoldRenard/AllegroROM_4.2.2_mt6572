.class Lcom/google/common/collect/Multimaps$FilteredMultimap;
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
    name = "FilteredMultimap"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys;,
        Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,
        Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;,
        Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/Multimap",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field static final NOT_EMPTY:Lcom/google/common/base/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Predicate",
            "<",
            "Ljava/util/Collection",
            "<*>;>;"
        }
    .end annotation
.end field


# instance fields
.field asMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field entries:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field keys:Lcom/google/common/collect/AbstractMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/AbstractMultiset",
            "<TK;>;"
        }
    .end annotation
.end field

.field final predicate:Lcom/google/common/base/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Predicate",
            "<-",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final unfiltered:Lcom/google/common/collect/Multimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field values:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 2527
    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$1;

    invoke-direct {v0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$1;-><init>()V

    sput-object v0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->NOT_EMPTY:Lcom/google/common/base/Predicate;

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;",
            "Lcom/google/common/base/Predicate",
            "<-",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 2297
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, unfiltered:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    .local p2, predicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2298
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    .line 2299
    iput-object p2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->predicate:Lcom/google/common/base/Predicate;

    .line 2300
    return-void
.end method


# virtual methods
.method public asMap()Ljava/util/Map;
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
    .line 2524
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap:Ljava/util/Map;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->createAsMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap:Ljava/util/Map;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap:Ljava/util/Map;

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 2383
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->entries()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 2384
    return-void
.end method

.method public containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 2325
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1, p2}, Lcom/google/common/collect/Multimap;->containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .parameter "key"

    .prologue
    .line 2311
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .parameter "value"

    .prologue
    .line 2315
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method createAsMap()Ljava/util/Map;
    .locals 4
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
    .line 2535
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    new-instance v2, Lcom/google/common/collect/Multimaps$FilteredMultimap$2;

    invoke-direct {v2, p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$2;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;)V

    .line 2541
    .local v2, transformer:Lcom/google/common/collect/Maps$EntryTransformer;,"Lcom/google/common/collect/Maps$EntryTransformer<TK;Ljava/util/Collection<TV;>;Ljava/util/Collection<TV;>;>;"
    iget-object v3, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v3}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/google/common/collect/Maps;->transformEntries(Ljava/util/Map;Lcom/google/common/collect/Maps$EntryTransformer;)Ljava/util/Map;

    move-result-object v1

    .line 2545
    .local v1, transformed:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    sget-object v3, Lcom/google/common/collect/Multimaps$FilteredMultimap;->NOT_EMPTY:Lcom/google/common/base/Predicate;

    invoke-static {v1, v3}, Lcom/google/common/collect/Maps;->filterValues(Ljava/util/Map;Lcom/google/common/base/Predicate;)Ljava/util/Map;

    move-result-object v0

    .line 2549
    .local v0, filtered:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    new-instance v3, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;

    invoke-direct {v3, p0, v0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;Ljava/util/Map;)V

    return-object v3
.end method

.method public entries()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 2490
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->entries:Ljava/util/Collection;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {v0, v1}, Lcom/google/common/collect/Collections2;->filter(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->entries:Ljava/util/Collection;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->entries:Ljava/util/Collection;

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "object"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 2387
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    if-ne p1, p0, :cond_0

    .line 2388
    const/4 v1, 0x1

    .line 2394
    :goto_0
    return v1

    .line 2390
    :cond_0
    instance-of v1, p1, Lcom/google/common/collect/Multimap;

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 2391
    check-cast v0, Lcom/google/common/collect/Multimap;

    .line 2392
    .local v0, that:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<**>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 2394
    .end local v0           #that:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<**>;"
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method filterCollection(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TV;>;",
            "Lcom/google/common/base/Predicate",
            "<TV;>;)",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2416
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    .local p2, predicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<TV;>;"
    instance-of v0, p1, Ljava/util/Set;

    if-eqz v0, :cond_0

    .line 2417
    check-cast p1, Ljava/util/Set;

    .end local p1           #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-static {p1, p2}, Lcom/google/common/collect/Sets;->filter(Ljava/util/Set;Lcom/google/common/base/Predicate;)Ljava/util/Set;

    move-result-object v0

    .line 2419
    :goto_0
    return-object v0

    .restart local p1       #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :cond_0
    invoke-static {p1, p2}, Lcom/google/common/collect/Collections2;->filter(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;

    move-result-object v0

    goto :goto_0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2424
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    new-instance v1, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->filterCollection(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 2398
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 2307
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->entries()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

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
    .line 2428
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

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
    .line 2701
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->keys:Lcom/google/common/collect/AbstractMultiset;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;)V

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->keys:Lcom/google/common/collect/AbstractMultiset;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->keys:Lcom/google/common/collect/AbstractMultiset;

    goto :goto_0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)Z"
        }
    .end annotation

    .prologue
    .line 2329
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, value:Ljava/lang/Object;,"TV;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 2330
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1, p2}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public putAll(Lcom/google/common/collect/Multimap;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<+TK;+TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 2345
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, multimap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<+TK;+TV;>;"
    invoke-interface {p1}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 2346
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TK;+TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    goto :goto_0

    .line 2348
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TK;+TV;>;"
    :cond_0
    iget-object v2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v2, p1}, Lcom/google/common/collect/Multimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    move-result v2

    return v2
.end method

.method public putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Iterable",
            "<+TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 2338
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, values:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TV;>;"
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 2339
    .local v1, value:Ljava/lang/Object;,"TV;"
    invoke-virtual {p0, p1, v1}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    goto :goto_0

    .line 2341
    .end local v1           #value:Ljava/lang/Object;,"TV;"
    :cond_0
    iget-object v2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v2, p1, p2}, Lcom/google/common/collect/Multimap;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z

    move-result v2

    return v2
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 2334
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1, p2}, Lcom/google/common/collect/Multimap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeAll(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 5
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2363
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v1

    .line 2364
    .local v1, removed:Ljava/util/List;,"Ljava/util/List<TV;>;"
    iget-object v4, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v4}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    .line 2365
    .local v3, values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    if-eqz v3, :cond_1

    .line 2366
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 2367
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<TV;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2368
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 2369
    .local v2, value:Ljava/lang/Object;,"TV;"
    invoke-virtual {p0, p1, v2}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2370
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2371
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 2375
    .end local v0           #iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<TV;>;"
    .end local v2           #value:Ljava/lang/Object;,"TV;"
    :cond_1
    iget-object v4, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    instance-of v4, v4, Lcom/google/common/collect/SetMultimap;

    if-eqz v4, :cond_2

    .line 2376
    invoke-static {v1}, Lcom/google/common/collect/Sets;->newLinkedHashSet(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v4

    .line 2378
    :goto_1
    return-object v4

    :cond_2
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    goto :goto_1
.end method

.method removeEntriesIf(Lcom/google/common/base/Predicate;)Z
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Predicate",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;)Z"
        }
    .end annotation

    .prologue
    .line 2499
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, removalPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    iget-object v8, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v8}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 2500
    .local v5, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    const/4 v0, 0x0

    .line 2501
    .local v0, changed:Z
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 2503
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 2504
    .local v2, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 2505
    .local v6, key:Ljava/lang/Object;,"TK;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 2506
    .local v1, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    new-instance v7, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;

    invoke-direct {v7, p0, v6}, Lcom/google/common/collect/Multimaps$FilteredMultimap$ValuePredicate;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;Ljava/lang/Object;)V

    .line 2507
    .local v7, valuePredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<TV;>;"
    invoke-virtual {p0, v1, v7}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->filterCollection(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;

    move-result-object v3

    .line 2508
    .local v3, filteredCollection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-static {v6, v3}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v4

    .line 2509
    .local v4, filteredEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;"
    invoke-interface {p1, v4}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 2510
    const/4 v0, 0x1

    .line 2511
    invoke-static {v1, v7}, Lcom/google/common/collect/Iterables;->all(Ljava/lang/Iterable;Lcom/google/common/base/Predicate;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2512
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 2514
    :cond_1
    invoke-interface {v3}, Ljava/util/Collection;->clear()V

    goto :goto_0

    .line 2518
    .end local v1           #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    .end local v2           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;"
    .end local v3           #filteredCollection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    .end local v4           #filteredEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;"
    .end local v6           #key:Ljava/lang/Object;,"TK;"
    .end local v7           #valuePredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<TV;>;"
    :cond_2
    return v0
.end method

.method public replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/Collection;
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Iterable",
            "<+TV;>;)",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2352
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, values:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TV;>;"
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 2353
    .local v2, value:Ljava/lang/Object;,"TV;"
    invoke-virtual {p0, p1, v2}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    goto :goto_0

    .line 2357
    .end local v2           #value:Ljava/lang/Object;,"TV;"
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v1

    .line 2358
    .local v1, oldValues:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    iget-object v3, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v3, p1, p2}, Lcom/google/common/collect/Multimap;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z

    .line 2359
    return-object v1
.end method

.method satisfiesPredicate(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .parameter "key"
    .parameter "value"

    .prologue
    .line 2321
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {p1, p2}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 2303
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->entries()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2402
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2434
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->values:Ljava/util/Collection;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;)V

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->values:Ljava/util/Collection;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->values:Ljava/util/Collection;

    goto :goto_0
.end method
