.class final Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;
.super Lcom/google/common/collect/Multisets$UnmodifiableMultiset;
.source "Multisets.java"

# interfaces
.implements Lcom/google/common/collect/SortedMultiset;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multisets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnmodifiableSortedMultiset"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Multisets$UnmodifiableMultiset",
        "<TE;>;",
        "Lcom/google/common/collect/SortedMultiset",
        "<TE;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private transient descendingMultiset:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/common/collect/SortedMultiset;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 202
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    .local p1, delegate:Lcom/google/common/collect/SortedMultiset;,"Lcom/google/common/collect/SortedMultiset<TE;>;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/Multisets$UnmodifiableMultiset;-><init>(Lcom/google/common/collect/Multiset;)V

    .line 203
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/SortedMultiset;Lcom/google/common/collect/Multisets$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;-><init>(Lcom/google/common/collect/SortedMultiset;)V

    return-void
.end method


# virtual methods
.method public comparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<-TE;>;"
        }
    .end annotation

    .prologue
    .line 212
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic createElementSet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->createElementSet()Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method createElementSet()Ljava/util/SortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->elementSet()Ljava/util/SortedSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSortedSet(Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic delegate()Lcom/google/common/collect/Multiset;
    .locals 1

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method protected delegate()Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-super {p0}, Lcom/google/common/collect/Multisets$UnmodifiableMultiset;->delegate()Lcom/google/common/collect/Multiset;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/SortedMultiset;

    return-object v0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic delegate()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method public descendingMultiset()Lcom/google/common/collect/SortedMultiset;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->descendingMultiset:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;

    .line 230
    .local v0, result:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    if-nez v0, :cond_0

    .line 231
    new-instance v0, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;

    .end local v0           #result:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/collect/SortedMultiset;->descendingMultiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;-><init>(Lcom/google/common/collect/SortedMultiset;)V

    .line 233
    .restart local v0       #result:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    iput-object p0, v0, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->descendingMultiset:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;

    .line 234
    iput-object v0, p0, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->descendingMultiset:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;

    move-object v1, v0

    .line 236
    .end local v0           #result:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    .local v1, result:Ljava/lang/Object;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    :goto_0
    return-object v1

    .end local v1           #result:Ljava/lang/Object;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    .restart local v0       #result:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    :cond_0
    move-object v1, v0

    .restart local v1       #result:Ljava/lang/Object;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    goto :goto_0
.end method

.method public bridge synthetic elementSet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->elementSet()Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method public elementSet()Ljava/util/SortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 222
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-super {p0}, Lcom/google/common/collect/Multisets$UnmodifiableMultiset;->elementSet()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/util/SortedSet;

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
    .line 241
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->firstEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method

.method public headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter
    .parameter "boundType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 261
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    .local p1, upperBound:Ljava/lang/Object;,"TE;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/google/common/collect/SortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Multisets;->unmodifiableSortedMultiset(Lcom/google/common/collect/SortedMultiset;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
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
    .line 246
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->lastEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method

.method public pollFirstEntry()Lcom/google/common/collect/Multiset$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public pollLastEntry()Lcom/google/common/collect/Multiset$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 256
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public subMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter
    .parameter "lowerBoundType"
    .parameter
    .parameter "upperBoundType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            "TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    .local p1, lowerBound:Ljava/lang/Object;,"TE;"
    .local p3, upperBound:Ljava/lang/Object;,"TE;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/common/collect/SortedMultiset;->subMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Multisets;->unmodifiableSortedMultiset(Lcom/google/common/collect/SortedMultiset;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method public tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter
    .parameter "boundType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 275
    .local p0, this:Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;,"Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset<TE;>;"
    .local p1, lowerBound:Ljava/lang/Object;,"TE;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$UnmodifiableSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/google/common/collect/SortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Multisets;->unmodifiableSortedMultiset(Lcom/google/common/collect/SortedMultiset;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
.end method
