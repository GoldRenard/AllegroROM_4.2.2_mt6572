.class Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;
.super Lcom/google/common/collect/Multimaps$Values;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps$FilteredMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Multimaps$Values",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;)V
    .locals 0
    .parameter

    .prologue
    .line 2437
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.Values;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/Multimaps$Values;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .parameter "o"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 2443
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.Values;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/common/collect/Iterators;->contains(Ljava/util/Iterator;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method multimap()Lcom/google/common/collect/Multimap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2439
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.Values;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    .line 2449
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.Values;"
    iget-object v2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v2, v2, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v2}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 2450
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TK;TV;>;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2451
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 2452
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v2, v2, Lcom/google/common/collect/Multimaps$FilteredMultimap;->predicate:Lcom/google/common/base/Predicate;

    invoke-interface {v2, v0}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2453
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 2454
    const/4 v2, 0x1

    .line 2457
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 2461
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.Values;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    const/4 v0, 0x0

    .line 2462
    .local v0, changed:Z
    iget-object v3, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v3, v3, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v3}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 2463
    .local v2, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TK;TV;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2464
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 2465
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v3, v3, Lcom/google/common/collect/Multimaps$FilteredMultimap;->predicate:Lcom/google/common/base/Predicate;

    invoke-interface {v3, v1}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2466
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 2467
    const/4 v0, 0x1

    goto :goto_0

    .line 2470
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    :cond_1
    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 2474
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.Values;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    const/4 v0, 0x0

    .line 2475
    .local v0, changed:Z
    iget-object v3, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v3, v3, Lcom/google/common/collect/Multimaps$FilteredMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v3}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 2476
    .local v2, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TK;TV;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2477
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 2478
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Values;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    iget-object v3, v3, Lcom/google/common/collect/Multimaps$FilteredMultimap;->predicate:Lcom/google/common/base/Predicate;

    invoke-interface {v3, v1}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2479
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 2480
    const/4 v0, 0x1

    goto :goto_0

    .line 2483
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    :cond_1
    return v0
.end method
