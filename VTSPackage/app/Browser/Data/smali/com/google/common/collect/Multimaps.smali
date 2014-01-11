.class public final Lcom/google/common/collect/Multimaps;
.super Ljava/lang/Object;
.source "Multimaps.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Multimaps$FilteredMultimap;,
        Lcom/google/common/collect/Multimaps$AsMap;,
        Lcom/google/common/collect/Multimaps$EntrySet;,
        Lcom/google/common/collect/Multimaps$Entries;,
        Lcom/google/common/collect/Multimaps$Values;,
        Lcom/google/common/collect/Multimaps$Keys;,
        Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;,
        Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;,
        Lcom/google/common/collect/Multimaps$MapMultimap;,
        Lcom/google/common/collect/Multimaps$UnmodifiableAsMapEntries;,
        Lcom/google/common/collect/Multimaps$UnmodifiableSortedSetMultimap;,
        Lcom/google/common/collect/Multimaps$UnmodifiableSetMultimap;,
        Lcom/google/common/collect/Multimaps$UnmodifiableListMultimap;,
        Lcom/google/common/collect/Multimaps$UnmodifiableAsMapValues;,
        Lcom/google/common/collect/Multimaps$UnmodifiableMultimap;,
        Lcom/google/common/collect/Multimaps$CustomSortedSetMultimap;,
        Lcom/google/common/collect/Multimaps$CustomSetMultimap;,
        Lcom/google/common/collect/Multimaps$CustomListMultimap;,
        Lcom/google/common/collect/Multimaps$CustomMultimap;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 67
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/util/Set;)Ljava/util/Set;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    invoke-static {p0}, Lcom/google/common/collect/Multimaps;->unmodifiableAsMapEntries(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    invoke-static {p0}, Lcom/google/common/collect/Multimaps;->unmodifiableValueCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    invoke-static {p0}, Lcom/google/common/collect/Multimaps;->unmodifiableEntries(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    invoke-static {p0}, Lcom/google/common/collect/Multimaps;->unmodifiableAsMapEntry(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public static filterEntries(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/Multimap;
    .locals 2
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "untested"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;",
            "Lcom/google/common/base/Predicate",
            "<-",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2273
    .local p0, unfiltered:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    .local p1, entryPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2274
    instance-of v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;

    .end local p0           #unfiltered:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    invoke-static {p0, p1}, Lcom/google/common/collect/Multimaps;->filterFiltered(Lcom/google/common/collect/Multimaps$FilteredMultimap;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/Multimap;

    move-result-object v0

    :goto_0
    return-object v0

    .restart local p0       #unfiltered:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    :cond_0
    new-instance v1, Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Multimap;

    invoke-direct {v1, v0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap;-><init>(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)V

    move-object v0, v1

    goto :goto_0
.end method

.method private static filterFiltered(Lcom/google/common/collect/Multimaps$FilteredMultimap;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/Multimap;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimaps$FilteredMultimap",
            "<TK;TV;>;",
            "Lcom/google/common/base/Predicate",
            "<-",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2288
    .local p0, map:Lcom/google/common/collect/Multimaps$FilteredMultimap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>;"
    .local p1, entryPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-Ljava/util/Map$Entry<TK;TV;>;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {v1, p1}, Lcom/google/common/base/Predicates;->and(Lcom/google/common/base/Predicate;Lcom/google/common/base/Predicate;)Lcom/google/common/base/Predicate;

    move-result-object v0

    .line 2290
    .local v0, predicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TK;TV;>;>;"
    new-instance v1, Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-direct {v1, v2, v0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;-><init>(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)V

    return-object v1
.end method

.method public static filterKeys(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/Multimap;
    .locals 2
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "untested"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;",
            "Lcom/google/common/base/Predicate",
            "<-TK;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2185
    .local p0, unfiltered:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    .local p1, keyPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-TK;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2186
    new-instance v0, Lcom/google/common/collect/Multimaps$4;

    invoke-direct {v0, p1}, Lcom/google/common/collect/Multimaps$4;-><init>(Lcom/google/common/base/Predicate;)V

    .line 2193
    .local v0, entryPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-static {p0, v0}, Lcom/google/common/collect/Multimaps;->filterEntries(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/Multimap;

    move-result-object v1

    return-object v1
.end method

.method public static filterValues(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/Multimap;
    .locals 2
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "untested"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;",
            "Lcom/google/common/base/Predicate",
            "<-TV;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2230
    .local p0, unfiltered:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    .local p1, valuePredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<-TV;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2231
    new-instance v0, Lcom/google/common/collect/Multimaps$5;

    invoke-direct {v0, p1}, Lcom/google/common/collect/Multimaps$5;-><init>(Lcom/google/common/base/Predicate;)V

    .line 2238
    .local v0, entryPredicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-static {p0, v0}, Lcom/google/common/collect/Multimaps;->filterEntries(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/Multimap;

    move-result-object v1

    return-object v1
.end method

.method public static forMap(Ljava/util/Map;)Lcom/google/common/collect/SetMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/SetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1023
    .local p0, map:Ljava/util/Map;,"Ljava/util/Map<TK;TV;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$MapMultimap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$MapMultimap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public static index(Ljava/lang/Iterable;Lcom/google/common/base/Function;)Lcom/google/common/collect/ImmutableListMultimap;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<TV;>;",
            "Lcom/google/common/base/Function",
            "<-TV;TK;>;)",
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1784
    .local p0, values:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TV;>;"
    .local p1, keyFunction:Lcom/google/common/base/Function;,"Lcom/google/common/base/Function<-TV;TK;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/common/collect/Multimaps;->index(Ljava/util/Iterator;Lcom/google/common/base/Function;)Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    return-object v0
.end method

.method public static index(Ljava/lang/Object;Lcom/google/common/base/Function;)Lcom/google/common/collect/ImmutableListMultimap;
    .locals 2
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "I:",
            "Ljava/lang/Object;",
            ":",
            "Ljava/lang/Iterable",
            "<TV;>;:",
            "Ljava/util/Iterator",
            "<TV;>;>(TI;",
            "Lcom/google/common/base/Function",
            "<-TV;TK;>;)",
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1801
    .local p0, values:Ljava/lang/Object;,"TI;"
    .local p1, keyFunction:Lcom/google/common/base/Function;,"Lcom/google/common/base/Function<-TV;TK;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 1802
    .local v0, valuesIterable:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TV;>;"
    invoke-static {v0, p1}, Lcom/google/common/collect/Multimaps;->index(Ljava/lang/Iterable;Lcom/google/common/base/Function;)Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v1

    return-object v1
.end method

.method public static index(Ljava/util/Iterator;Lcom/google/common/base/Function;)Lcom/google/common/collect/ImmutableListMultimap;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Iterator",
            "<TV;>;",
            "Lcom/google/common/base/Function",
            "<-TV;TK;>;)",
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1850
    .local p0, values:Ljava/util/Iterator;,"Ljava/util/Iterator<TV;>;"
    .local p1, keyFunction:Lcom/google/common/base/Function;,"Lcom/google/common/base/Function<-TV;TK;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1851
    invoke-static {}, Lcom/google/common/collect/ImmutableListMultimap;->builder()Lcom/google/common/collect/ImmutableListMultimap$Builder;

    move-result-object v0

    .line 1853
    .local v0, builder:Lcom/google/common/collect/ImmutableListMultimap$Builder;,"Lcom/google/common/collect/ImmutableListMultimap$Builder<TK;TV;>;"
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1854
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1855
    .local v1, value:Ljava/lang/Object;,"TV;"
    invoke-static {v1, p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1856
    invoke-interface {p1, v1}, Lcom/google/common/base/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableListMultimap$Builder;

    goto :goto_0

    .line 1858
    .end local v1           #value:Ljava/lang/Object;,"TV;"
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableListMultimap$Builder;->build()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v2

    return-object v2
.end method

.method public static invertFrom(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/Multimap;
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "M::",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;>(",
            "Lcom/google/common/collect/Multimap",
            "<+TV;+TK;>;TM;)TM;"
        }
    .end annotation

    .prologue
    .line 405
    .local p0, source:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<+TV;+TK;>;"
    .local p1, dest:Lcom/google/common/collect/Multimap;,"TM;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    invoke-interface {p0}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

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

    .line 407
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TV;+TK;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    .line 409
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TV;+TK;>;"
    :cond_0
    return-object p1
.end method

.method public static newListMultimap(Ljava/util/Map;Lcom/google/common/base/Supplier;)Lcom/google/common/collect/ListMultimap;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;",
            "Lcom/google/common/base/Supplier",
            "<+",
            "Ljava/util/List",
            "<TV;>;>;)",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, map:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    .local p1, factory:Lcom/google/common/base/Supplier;,"Lcom/google/common/base/Supplier<+Ljava/util/List<TV;>;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$CustomListMultimap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$CustomListMultimap;-><init>(Ljava/util/Map;Lcom/google/common/base/Supplier;)V

    return-object v0
.end method

.method public static newMultimap(Ljava/util/Map;Lcom/google/common/base/Supplier;)Lcom/google/common/collect/Multimap;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;",
            "Lcom/google/common/base/Supplier",
            "<+",
            "Ljava/util/Collection",
            "<TV;>;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, map:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    .local p1, factory:Lcom/google/common/base/Supplier;,"Lcom/google/common/base/Supplier<+Ljava/util/Collection<TV;>;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$CustomMultimap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$CustomMultimap;-><init>(Ljava/util/Map;Lcom/google/common/base/Supplier;)V

    return-object v0
.end method

.method public static newSetMultimap(Ljava/util/Map;Lcom/google/common/base/Supplier;)Lcom/google/common/collect/SetMultimap;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;",
            "Lcom/google/common/base/Supplier",
            "<+",
            "Ljava/util/Set",
            "<TV;>;>;)",
            "Lcom/google/common/collect/SetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, map:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    .local p1, factory:Lcom/google/common/base/Supplier;,"Lcom/google/common/base/Supplier<+Ljava/util/Set<TV;>;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$CustomSetMultimap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$CustomSetMultimap;-><init>(Ljava/util/Map;Lcom/google/common/base/Supplier;)V

    return-object v0
.end method

.method public static newSortedSetMultimap(Ljava/util/Map;Lcom/google/common/base/Supplier;)Lcom/google/common/collect/SortedSetMultimap;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;",
            "Lcom/google/common/base/Supplier",
            "<+",
            "Ljava/util/SortedSet",
            "<TV;>;>;)",
            "Lcom/google/common/collect/SortedSetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 346
    .local p0, map:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    .local p1, factory:Lcom/google/common/base/Supplier;,"Lcom/google/common/base/Supplier<+Ljava/util/SortedSet<TV;>;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$CustomSortedSetMultimap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$CustomSortedSetMultimap;-><init>(Ljava/util/Map;Lcom/google/common/base/Supplier;)V

    return-object v0
.end method

.method public static synchronizedListMultimap(Lcom/google/common/collect/ListMultimap;)Lcom/google/common/collect/ListMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 840
    .local p0, multimap:Lcom/google/common/collect/ListMultimap;,"Lcom/google/common/collect/ListMultimap<TK;TV;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/common/collect/Synchronized;->listMultimap(Lcom/google/common/collect/ListMultimap;Ljava/lang/Object;)Lcom/google/common/collect/ListMultimap;

    move-result-object v0

    return-object v0
.end method

.method public static synchronizedMultimap(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/Multimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 447
    .local p0, multimap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/common/collect/Synchronized;->multimap(Lcom/google/common/collect/Multimap;Ljava/lang/Object;)Lcom/google/common/collect/Multimap;

    move-result-object v0

    return-object v0
.end method

.method public static synchronizedSetMultimap(Lcom/google/common/collect/SetMultimap;)Lcom/google/common/collect/SetMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/SetMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/SetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 745
    .local p0, multimap:Lcom/google/common/collect/SetMultimap;,"Lcom/google/common/collect/SetMultimap<TK;TV;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/common/collect/Synchronized;->setMultimap(Lcom/google/common/collect/SetMultimap;Ljava/lang/Object;)Lcom/google/common/collect/SetMultimap;

    move-result-object v0

    return-object v0
.end method

.method public static synchronizedSortedSetMultimap(Lcom/google/common/collect/SortedSetMultimap;)Lcom/google/common/collect/SortedSetMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/SortedSetMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/SortedSetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 800
    .local p0, multimap:Lcom/google/common/collect/SortedSetMultimap;,"Lcom/google/common/collect/SortedSetMultimap<TK;TV;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/common/collect/Synchronized;->sortedSetMultimap(Lcom/google/common/collect/SortedSetMultimap;Ljava/lang/Object;)Lcom/google/common/collect/SortedSetMultimap;

    move-result-object v0

    return-object v0
.end method

.method public static transformEntries(Lcom/google/common/collect/ListMultimap;Lcom/google/common/collect/Maps$EntryTransformer;)Lcom/google/common/collect/ListMultimap;
    .locals 1
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V1:",
            "Ljava/lang/Object;",
            "V2:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV1;>;",
            "Lcom/google/common/collect/Maps$EntryTransformer",
            "<-TK;-TV1;TV2;>;)",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV2;>;"
        }
    .end annotation

    .prologue
    .line 1705
    .local p0, fromMap:Lcom/google/common/collect/ListMultimap;,"Lcom/google/common/collect/ListMultimap<TK;TV1;>;"
    .local p1, transformer:Lcom/google/common/collect/Maps$EntryTransformer;,"Lcom/google/common/collect/Maps$EntryTransformer<-TK;-TV1;TV2;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;-><init>(Lcom/google/common/collect/ListMultimap;Lcom/google/common/collect/Maps$EntryTransformer;)V

    return-object v0
.end method

.method public static transformEntries(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Maps$EntryTransformer;)Lcom/google/common/collect/Multimap;
    .locals 1
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V1:",
            "Ljava/lang/Object;",
            "V2:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV1;>;",
            "Lcom/google/common/collect/Maps$EntryTransformer",
            "<-TK;-TV1;TV2;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV2;>;"
        }
    .end annotation

    .prologue
    .line 1398
    .local p0, fromMap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV1;>;"
    .local p1, transformer:Lcom/google/common/collect/Maps$EntryTransformer;,"Lcom/google/common/collect/Maps$EntryTransformer<-TK;-TV1;TV2;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;-><init>(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Maps$EntryTransformer;)V

    return-object v0
.end method

.method public static transformValues(Lcom/google/common/collect/ListMultimap;Lcom/google/common/base/Function;)Lcom/google/common/collect/ListMultimap;
    .locals 2
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V1:",
            "Ljava/lang/Object;",
            "V2:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV1;>;",
            "Lcom/google/common/base/Function",
            "<-TV1;TV2;>;)",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV2;>;"
        }
    .end annotation

    .prologue
    .line 1638
    .local p0, fromMultimap:Lcom/google/common/collect/ListMultimap;,"Lcom/google/common/collect/ListMultimap<TK;TV1;>;"
    .local p1, function:Lcom/google/common/base/Function;,"Lcom/google/common/base/Function<-TV1;TV2;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1639
    new-instance v0, Lcom/google/common/collect/Multimaps$3;

    invoke-direct {v0, p1}, Lcom/google/common/collect/Multimaps$3;-><init>(Lcom/google/common/base/Function;)V

    .line 1646
    .local v0, transformer:Lcom/google/common/collect/Maps$EntryTransformer;,"Lcom/google/common/collect/Maps$EntryTransformer<TK;TV1;TV2;>;"
    invoke-static {p0, v0}, Lcom/google/common/collect/Multimaps;->transformEntries(Lcom/google/common/collect/ListMultimap;Lcom/google/common/collect/Maps$EntryTransformer;)Lcom/google/common/collect/ListMultimap;

    move-result-object v1

    return-object v1
.end method

.method public static transformValues(Lcom/google/common/collect/Multimap;Lcom/google/common/base/Function;)Lcom/google/common/collect/Multimap;
    .locals 2
    .parameter
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V1:",
            "Ljava/lang/Object;",
            "V2:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV1;>;",
            "Lcom/google/common/base/Function",
            "<-TV1;TV2;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV2;>;"
        }
    .end annotation

    .prologue
    .line 1328
    .local p0, fromMultimap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV1;>;"
    .local p1, function:Lcom/google/common/base/Function;,"Lcom/google/common/base/Function<-TV1;TV2;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1329
    new-instance v0, Lcom/google/common/collect/Multimaps$2;

    invoke-direct {v0, p1}, Lcom/google/common/collect/Multimaps$2;-><init>(Lcom/google/common/base/Function;)V

    .line 1336
    .local v0, transformer:Lcom/google/common/collect/Maps$EntryTransformer;,"Lcom/google/common/collect/Maps$EntryTransformer<TK;TV1;TV2;>;"
    invoke-static {p0, v0}, Lcom/google/common/collect/Multimaps;->transformEntries(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Maps$EntryTransformer;)Lcom/google/common/collect/Multimap;

    move-result-object v1

    return-object v1
.end method

.method private static unmodifiableAsMapEntries(Ljava/util/Set;)Ljava/util/Set;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 956
    .local p0, asMapEntries:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$UnmodifiableAsMapEntries;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/common/collect/Multimaps$UnmodifiableAsMapEntries;-><init>(Ljava/util/Set;)V

    return-object v0
.end method

.method private static unmodifiableAsMapEntry(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;)",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;"
        }
    .end annotation

    .prologue
    .line 914
    .local p0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    new-instance v0, Lcom/google/common/collect/Multimaps$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$1;-><init>(Ljava/util/Map$Entry;)V

    return-object v0
.end method

.method private static unmodifiableEntries(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 937
    .local p0, entries:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/util/Map$Entry<TK;TV;>;>;"
    instance-of v0, p0, Ljava/util/Set;

    if-eqz v0, :cond_0

    .line 938
    check-cast p0, Ljava/util/Set;

    .end local p0           #entries:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-static {p0}, Lcom/google/common/collect/Maps;->unmodifiableEntrySet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 940
    .restart local p0       #entries:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/util/Map$Entry<TK;TV;>;>;"
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/common/collect/Maps$UnmodifiableEntries;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/common/collect/Maps$UnmodifiableEntries;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method public static unmodifiableListMultimap(Lcom/google/common/collect/ImmutableListMultimap;)Lcom/google/common/collect/ListMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ImmutableListMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 878
    .local p0, delegate:Lcom/google/common/collect/ImmutableListMultimap;,"Lcom/google/common/collect/ImmutableListMultimap<TK;TV;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/ListMultimap;

    return-object v0
.end method

.method public static unmodifiableListMultimap(Lcom/google/common/collect/ListMultimap;)Lcom/google/common/collect/ListMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/ListMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 863
    .local p0, delegate:Lcom/google/common/collect/ListMultimap;,"Lcom/google/common/collect/ListMultimap<TK;TV;>;"
    instance-of v0, p0, Lcom/google/common/collect/Multimaps$UnmodifiableListMultimap;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/common/collect/ImmutableListMultimap;

    if-eqz v0, :cond_1

    .line 867
    .end local p0           #delegate:Lcom/google/common/collect/ListMultimap;,"Lcom/google/common/collect/ListMultimap<TK;TV;>;"
    :cond_0
    :goto_0
    return-object p0

    .restart local p0       #delegate:Lcom/google/common/collect/ListMultimap;,"Lcom/google/common/collect/ListMultimap<TK;TV;>;"
    :cond_1
    new-instance v0, Lcom/google/common/collect/Multimaps$UnmodifiableListMultimap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$UnmodifiableListMultimap;-><init>(Lcom/google/common/collect/ListMultimap;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public static unmodifiableMultimap(Lcom/google/common/collect/ImmutableMultimap;)Lcom/google/common/collect/Multimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ImmutableMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 484
    .local p0, delegate:Lcom/google/common/collect/ImmutableMultimap;,"Lcom/google/common/collect/ImmutableMultimap<TK;TV;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Multimap;

    return-object v0
.end method

.method public static unmodifiableMultimap(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/Multimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 469
    .local p0, delegate:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    instance-of v0, p0, Lcom/google/common/collect/Multimaps$UnmodifiableMultimap;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/common/collect/ImmutableMultimap;

    if-eqz v0, :cond_1

    .line 473
    .end local p0           #delegate:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    :cond_0
    :goto_0
    return-object p0

    .restart local p0       #delegate:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    :cond_1
    new-instance v0, Lcom/google/common/collect/Multimaps$UnmodifiableMultimap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$UnmodifiableMultimap;-><init>(Lcom/google/common/collect/Multimap;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public static unmodifiableSetMultimap(Lcom/google/common/collect/ImmutableSetMultimap;)Lcom/google/common/collect/SetMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ImmutableSetMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/SetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 783
    .local p0, delegate:Lcom/google/common/collect/ImmutableSetMultimap;,"Lcom/google/common/collect/ImmutableSetMultimap<TK;TV;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/SetMultimap;

    return-object v0
.end method

.method public static unmodifiableSetMultimap(Lcom/google/common/collect/SetMultimap;)Lcom/google/common/collect/SetMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/SetMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/SetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 768
    .local p0, delegate:Lcom/google/common/collect/SetMultimap;,"Lcom/google/common/collect/SetMultimap<TK;TV;>;"
    instance-of v0, p0, Lcom/google/common/collect/Multimaps$UnmodifiableSetMultimap;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/common/collect/ImmutableSetMultimap;

    if-eqz v0, :cond_1

    .line 772
    .end local p0           #delegate:Lcom/google/common/collect/SetMultimap;,"Lcom/google/common/collect/SetMultimap<TK;TV;>;"
    :cond_0
    :goto_0
    return-object p0

    .restart local p0       #delegate:Lcom/google/common/collect/SetMultimap;,"Lcom/google/common/collect/SetMultimap<TK;TV;>;"
    :cond_1
    new-instance v0, Lcom/google/common/collect/Multimaps$UnmodifiableSetMultimap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$UnmodifiableSetMultimap;-><init>(Lcom/google/common/collect/SetMultimap;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public static unmodifiableSortedSetMultimap(Lcom/google/common/collect/SortedSetMultimap;)Lcom/google/common/collect/SortedSetMultimap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/SortedSetMultimap",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/SortedSetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 823
    .local p0, delegate:Lcom/google/common/collect/SortedSetMultimap;,"Lcom/google/common/collect/SortedSetMultimap<TK;TV;>;"
    instance-of v0, p0, Lcom/google/common/collect/Multimaps$UnmodifiableSortedSetMultimap;

    if-eqz v0, :cond_0

    .line 826
    .end local p0           #delegate:Lcom/google/common/collect/SortedSetMultimap;,"Lcom/google/common/collect/SortedSetMultimap<TK;TV;>;"
    :goto_0
    return-object p0

    .restart local p0       #delegate:Lcom/google/common/collect/SortedSetMultimap;,"Lcom/google/common/collect/SortedSetMultimap<TK;TV;>;"
    :cond_0
    new-instance v0, Lcom/google/common/collect/Multimaps$UnmodifiableSortedSetMultimap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$UnmodifiableSortedSetMultimap;-><init>(Lcom/google/common/collect/SortedSetMultimap;)V

    move-object p0, v0

    goto :goto_0
.end method

.method private static unmodifiableValueCollection(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TV;>;)",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 891
    .local p0, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    instance-of v0, p0, Ljava/util/SortedSet;

    if-eqz v0, :cond_0

    .line 892
    check-cast p0, Ljava/util/SortedSet;

    .end local p0           #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSortedSet(Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object v0

    .line 898
    .restart local p0       #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :goto_0
    return-object v0

    .line 893
    :cond_0
    instance-of v0, p0, Ljava/util/Set;

    if-eqz v0, :cond_1

    .line 894
    check-cast p0, Ljava/util/Set;

    .end local p0           #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_0

    .line 895
    .restart local p0       #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :cond_1
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_2

    .line 896
    check-cast p0, Ljava/util/List;

    .end local p0           #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 898
    .restart local p0       #collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :cond_2
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    goto :goto_0
.end method
