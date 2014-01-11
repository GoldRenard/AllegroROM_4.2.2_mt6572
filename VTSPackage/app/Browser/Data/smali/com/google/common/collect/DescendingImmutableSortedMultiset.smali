.class final Lcom/google/common/collect/DescendingImmutableSortedMultiset;
.super Lcom/google/common/collect/ImmutableSortedMultiset;
.source "DescendingImmutableSortedMultiset.java"


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


# instance fields
.field private final transient forward:Lcom/google/common/collect/ImmutableSortedMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableSortedMultiset;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    .local p1, forward:Lcom/google/common/collect/ImmutableSortedMultiset;,"Lcom/google/common/collect/ImmutableSortedMultiset<TE;>;"
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableSortedMultiset;->reverseComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/collect/ImmutableSortedMultiset;-><init>(Ljava/util/Comparator;)V

    .line 29
    iput-object p1, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    .line 30
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
    .line 34
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableSortedMultiset;->count(Ljava/lang/Object;)I

    move-result v0

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
    .line 59
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->elementSet()Lcom/google/common/collect/ImmutableSortedSet;

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
    .line 54
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->createDescendingElementSet()Lcom/google/common/collect/ImmutableSortedSet;

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
    .line 64
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->entryIterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    return-object v0
.end method

.method public descendingMultiset()Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    return-object v0
.end method

.method public bridge synthetic descendingMultiset()Lcom/google/common/collect/SortedMultiset;
    .locals 1

    .prologue
    .line 24
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->descendingMultiset()Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method distinctElements()I
    .locals 1

    .prologue
    .line 89
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->distinctElements()I

    move-result v0

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
    .line 84
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->descendingEntryIterator()Lcom/google/common/collect/UnmodifiableIterator;

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
    .line 39
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->lastEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method

.method public headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 1
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
    .line 74
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    .local p1, upperBound:Ljava/lang/Object;,"TE;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0, p1, p2}, Lcom/google/common/collect/ImmutableSortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->descendingMultiset()Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 24
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method isPartialView()Z
    .locals 1

    .prologue
    .line 94
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->isPartialView()Z

    move-result v0

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
    .line 44
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->firstEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 49
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->size()I

    move-result v0

    return v0
.end method

.method public tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 1
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
    .line 79
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    .local p1, lowerBound:Ljava/lang/Object;,"TE;"
    iget-object v0, p0, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->forward:Lcom/google/common/collect/ImmutableSortedMultiset;

    invoke-virtual {v0, p1, p2}, Lcom/google/common/collect/ImmutableSortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSortedMultiset;->descendingMultiset()Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 24
    .local p0, this:Lcom/google/common/collect/DescendingImmutableSortedMultiset;,"Lcom/google/common/collect/DescendingImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/DescendingImmutableSortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method
