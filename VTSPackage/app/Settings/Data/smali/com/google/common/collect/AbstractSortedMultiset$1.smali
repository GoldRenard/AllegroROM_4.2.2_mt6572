.class Lcom/google/common/collect/AbstractSortedMultiset$1;
.super Lcom/google/common/collect/SortedMultisets$ElementSet;
.source "AbstractSortedMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/AbstractSortedMultiset;->createElementSet()Ljava/util/SortedSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/SortedMultisets$ElementSet",
        "<TE;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/AbstractSortedMultiset;


# direct methods
.method constructor <init>(Lcom/google/common/collect/AbstractSortedMultiset;)V
    .locals 0
    .parameter

    .prologue
    .line 55
    .local p0, this:Lcom/google/common/collect/AbstractSortedMultiset$1;,"Lcom/google/common/collect/AbstractSortedMultiset.1;"
    iput-object p1, p0, Lcom/google/common/collect/AbstractSortedMultiset$1;->this$0:Lcom/google/common/collect/AbstractSortedMultiset;

    invoke-direct {p0}, Lcom/google/common/collect/SortedMultisets$ElementSet;-><init>()V

    return-void
.end method


# virtual methods
.method bridge synthetic multiset()Lcom/google/common/collect/Multiset;
    .locals 1

    .prologue
    .line 55
    .local p0, this:Lcom/google/common/collect/AbstractSortedMultiset$1;,"Lcom/google/common/collect/AbstractSortedMultiset.1;"
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractSortedMultiset$1;->multiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method multiset()Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/SortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, this:Lcom/google/common/collect/AbstractSortedMultiset$1;,"Lcom/google/common/collect/AbstractSortedMultiset.1;"
    iget-object v0, p0, Lcom/google/common/collect/AbstractSortedMultiset$1;->this$0:Lcom/google/common/collect/AbstractSortedMultiset;

    return-object v0
.end method
