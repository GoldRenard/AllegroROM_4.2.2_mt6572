.class Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;
.super Lcom/google/common/collect/Multisets$EntrySet;
.source "SortedMultisets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/SortedMultisets$DescendingMultiset;->createEntrySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Multisets$EntrySet",
        "<TE;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/SortedMultisets$DescendingMultiset;


# direct methods
.method constructor <init>(Lcom/google/common/collect/SortedMultisets$DescendingMultiset;)V
    .locals 0
    .parameter

    .prologue
    .line 165
    .local p0, this:Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;,"Lcom/google/common/collect/SortedMultisets$DescendingMultiset.2;"
    iput-object p1, p0, Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;->this$0:Lcom/google/common/collect/SortedMultisets$DescendingMultiset;

    invoke-direct {p0}, Lcom/google/common/collect/Multisets$EntrySet;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, this:Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;,"Lcom/google/common/collect/SortedMultisets$DescendingMultiset.2;"
    iget-object v0, p0, Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;->this$0:Lcom/google/common/collect/SortedMultisets$DescendingMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/SortedMultisets$DescendingMultiset;->entryIterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method multiset()Lcom/google/common/collect/Multiset;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, this:Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;,"Lcom/google/common/collect/SortedMultisets$DescendingMultiset.2;"
    iget-object v0, p0, Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;->this$0:Lcom/google/common/collect/SortedMultisets$DescendingMultiset;

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 175
    .local p0, this:Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;,"Lcom/google/common/collect/SortedMultisets$DescendingMultiset.2;"
    iget-object v0, p0, Lcom/google/common/collect/SortedMultisets$DescendingMultiset$2;->this$0:Lcom/google/common/collect/SortedMultisets$DescendingMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/SortedMultisets$DescendingMultiset;->forwardMultiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/SortedMultiset;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
