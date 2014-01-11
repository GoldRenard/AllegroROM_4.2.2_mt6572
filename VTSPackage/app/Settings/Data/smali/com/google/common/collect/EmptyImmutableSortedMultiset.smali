.class final Lcom/google/common/collect/EmptyImmutableSortedMultiset;
.super Lcom/google/common/collect/ImmutableSortedMultiset;
.source "EmptyImmutableSortedMultiset.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSortedMultiset",
        "<TE;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/util/Comparator;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TE;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    .local p1, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/ImmutableSortedMultiset;-><init>(Ljava/util/Comparator;)V

    .line 31
    return-void
.end method


# virtual methods
.method public count(Ljava/lang/Object;)I
    .locals 1
    .parameter "element"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 45
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    const/4 v0, 0x0

    return v0
.end method

.method createDescendingElementSet()Lcom/google/common/collect/ImmutableSortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/EmptyImmutableSortedMultiset;->reverseComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableSortedSet;->emptySet(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object v0

    return-object v0
.end method

.method createElementSet()Lcom/google/common/collect/ImmutableSortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/EmptyImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableSortedSet;->emptySet(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object v0

    return-object v0
.end method

.method descendingEntryIterator()Lcom/google/common/collect/UnmodifiableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    invoke-static {}, Lcom/google/common/collect/Iterators;->emptyIterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    return-object v0
.end method

.method distinctElements()I
    .locals 1

    .prologue
    .line 89
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    const/4 v0, 0x0

    return v0
.end method

.method entryIterator()Lcom/google/common/collect/UnmodifiableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    invoke-static {}, Lcom/google/common/collect/Iterators;->emptyIterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    return-object v0
.end method

.method public firstEntry()Lcom/google/common/collect/Multiset$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 0
    .parameter
    .parameter "boundType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    .local p1, upperBound:Ljava/lang/Object;,"TE;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    return-object p0
.end method

.method public bridge synthetic headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/EmptyImmutableSortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method isPartialView()Z
    .locals 1

    .prologue
    .line 94
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public lastEntry()Lcom/google/common/collect/Multiset$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 50
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 0
    .parameter
    .parameter "boundType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    .local p1, lowerBound:Ljava/lang/Object;,"TE;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    return-object p0
.end method

.method public bridge synthetic tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    .local p0, this:Lcom/google/common/collect/EmptyImmutableSortedMultiset;,"Lcom/google/common/collect/EmptyImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/EmptyImmutableSortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method
