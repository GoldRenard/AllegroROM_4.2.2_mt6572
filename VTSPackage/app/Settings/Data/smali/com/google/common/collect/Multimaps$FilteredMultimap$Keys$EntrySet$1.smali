.class Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;
.super Ljava/lang/Object;
.source "Multimaps.java"

# interfaces
.implements Lcom/google/common/base/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet;->retainAll(Ljava/util/Collection;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Predicate",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;",
        "Ljava/util/Collection",
        "<TV;>;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet;

.field final synthetic val$c:Ljava/util/Collection;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet;Ljava/util/Collection;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 2741
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;,"Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet.1;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;->this$2:Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet;

    iput-object p2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;->val$c:Ljava/util/Collection;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 2741
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;,"Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet.1;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;->apply(Ljava/util/Map$Entry;)Z

    move-result v0

    return v0
.end method

.method public apply(Ljava/util/Map$Entry;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;)Z"
        }
    .end annotation

    .prologue
    .line 2743
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;,"Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet.1;"
    .local p1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-static {v2, v1}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    .line 2745
    .local v0, multisetEntry:Lcom/google/common/collect/Multiset$Entry;,"Lcom/google/common/collect/Multiset$Entry<TK;>;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$Keys$EntrySet$1;->val$c:Ljava/util/Collection;

    invoke-interface {v1, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
