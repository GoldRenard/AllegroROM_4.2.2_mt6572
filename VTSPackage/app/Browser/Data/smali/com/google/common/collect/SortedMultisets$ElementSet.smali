.class abstract Lcom/google/common/collect/SortedMultisets$ElementSet;
.super Lcom/google/common/collect/Multisets$ElementSet;
.source "SortedMultisets.java"

# interfaces
.implements Ljava/util/SortedSet;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/SortedMultisets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ElementSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Multisets$ElementSet",
        "<TE;>;",
        "Ljava/util/SortedSet",
        "<TE;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 42
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    invoke-direct {p0}, Lcom/google/common/collect/Multisets$ElementSet;-><init>()V

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
    .line 47
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v0

    return-object v0
.end method

.method public first()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->firstEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    #calls: Lcom/google/common/collect/SortedMultisets;->getElementOrThrow(Lcom/google/common/collect/Multiset$Entry;)Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/SortedMultisets;->access$000(Lcom/google/common/collect/Multiset$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public headSet(Ljava/lang/Object;)Ljava/util/SortedSet;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/util/SortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    .local p1, toElement:Ljava/lang/Object;,"TE;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/BoundType;->OPEN:Lcom/google/common/collect/BoundType;

    invoke-interface {v0, p1, v1}, Lcom/google/common/collect/SortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->elementSet()Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method public last()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->lastEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    #calls: Lcom/google/common/collect/SortedMultisets;->getElementOrThrow(Lcom/google/common/collect/Multiset$Entry;)Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/SortedMultisets;->access$000(Lcom/google/common/collect/Multiset$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic multiset()Lcom/google/common/collect/Multiset;
    .locals 1

    .prologue
    .line 42
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method abstract multiset()Lcom/google/common/collect/SortedMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;"
        }
    .end annotation
.end method

.method public subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;TE;)",
            "Ljava/util/SortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    .local p1, fromElement:Ljava/lang/Object;,"TE;"
    .local p2, toElement:Ljava/lang/Object;,"TE;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/BoundType;->CLOSED:Lcom/google/common/collect/BoundType;

    sget-object v2, Lcom/google/common/collect/BoundType;->OPEN:Lcom/google/common/collect/BoundType;

    invoke-interface {v0, p1, v1, p2, v2}, Lcom/google/common/collect/SortedMultiset;->subMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->elementSet()Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method public tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/util/SortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, this:Lcom/google/common/collect/SortedMultisets$ElementSet;,"Lcom/google/common/collect/SortedMultisets$ElementSet<TE;>;"
    .local p1, fromElement:Ljava/lang/Object;,"TE;"
    invoke-virtual {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/BoundType;->CLOSED:Lcom/google/common/collect/BoundType;

    invoke-interface {v0, p1, v1}, Lcom/google/common/collect/SortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->elementSet()Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method
