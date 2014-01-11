.class public final Lcom/google/common/collect/ImmutableSetMultimap$Builder;
.super Lcom/google/common/collect/ImmutableMultimap$Builder;
.source "ImmutableSetMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSetMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableMultimap$Builder",
        "<TK;TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableMultimap$Builder;-><init>()V

    .line 200
    new-instance v0, Lcom/google/common/collect/ImmutableSetMultimap$BuilderMultimap;

    invoke-direct {v0}, Lcom/google/common/collect/ImmutableSetMultimap$BuilderMultimap;-><init>()V

    iput-object v0, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->builderMultimap:Lcom/google/common/collect/Multimap;

    .line 201
    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/common/collect/ImmutableMultimap;
    .locals 1

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->build()Lcom/google/common/collect/ImmutableSetMultimap;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/google/common/collect/ImmutableSetMultimap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSetMultimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 278
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->builderMultimap:Lcom/google/common/collect/Multimap;

    iget-object v1, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->valueComparator:Ljava/util/Comparator;

    #calls: Lcom/google/common/collect/ImmutableSetMultimap;->copyOf(Lcom/google/common/collect/Multimap;Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap;
    invoke-static {v0, v1}, Lcom/google/common/collect/ImmutableSetMultimap;->access$000(Lcom/google/common/collect/Multimap;Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method

.method public orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .locals 3
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TK;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    .local p1, keyComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TK;>;"
    new-instance v1, Lcom/google/common/collect/ImmutableSetMultimap$SortedKeyBuilderMultimap;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    iget-object v2, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->builderMultimap:Lcom/google/common/collect/Multimap;

    invoke-direct {v1, v0, v2}, Lcom/google/common/collect/ImmutableSetMultimap$SortedKeyBuilderMultimap;-><init>(Ljava/util/Comparator;Lcom/google/common/collect/Multimap;)V

    iput-object v1, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->builderMultimap:Lcom/google/common/collect/Multimap;

    .line 253
    return-object p0
.end method

.method public bridge synthetic orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method

.method public orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .locals 0
    .parameter
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 270
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    .local p1, valueComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TV;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    .line 271
    return-object p0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 208
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, value:Ljava/lang/Object;,"TV;"
    iget-object v0, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->builderMultimap:Lcom/google/common/collect/Multimap;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 209
    return-object p0
.end method

.method public put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<+TK;+TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    .local p1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TK;+TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->builderMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 220
    return-object p0
.end method

.method public bridge synthetic putAll(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic putAll(Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 193
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap",
            "<+TK;+TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 238
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    .local p1, multimap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<+TK;+TV;>;"
    invoke-interface {p1}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 239
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TK;+Ljava/util/Collection<+TV;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-virtual {p0, v3, v2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    goto :goto_0

    .line 241
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<+TK;+Ljava/util/Collection<+TV;>;>;"
    :cond_0
    return-object p0
.end method

.method public putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .locals 5
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Iterable",
            "<+TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 224
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, values:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TV;>;"
    iget-object v3, p0, Lcom/google/common/collect/ImmutableMultimap$Builder;->builderMultimap:Lcom/google/common/collect/Multimap;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/google/common/collect/Multimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 225
    .local v0, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 226
    .local v2, value:Ljava/lang/Object;,"TV;"
    invoke-static {v2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 228
    .end local v2           #value:Ljava/lang/Object;,"TV;"
    :cond_0
    return-object p0
.end method

.method public varargs putAll(Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;[TV;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 232
    .local p0, this:Lcom/google/common/collect/ImmutableSetMultimap$Builder;,"Lcom/google/common/collect/ImmutableSetMultimap$Builder<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    .local p2, values:[Ljava/lang/Object;,"[TV;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object v0

    return-object v0
.end method
