.class Lcom/google/common/collect/Multisets$SetMultiset$1;
.super Lcom/google/common/collect/Multisets$EntrySet;
.source "Multisets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multisets$SetMultiset;->entrySet()Ljava/util/Set;
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
.field final synthetic this$0:Lcom/google/common/collect/Multisets$SetMultiset;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multisets$SetMultiset;)V
    .locals 0
    .parameter

    .prologue
    .line 384
    .local p0, this:Lcom/google/common/collect/Multisets$SetMultiset$1;,"Lcom/google/common/collect/Multisets$SetMultiset.1;"
    iput-object p1, p0, Lcom/google/common/collect/Multisets$SetMultiset$1;->this$0:Lcom/google/common/collect/Multisets$SetMultiset;

    invoke-direct {p0}, Lcom/google/common/collect/Multisets$EntrySet;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 2
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
    .line 390
    .local p0, this:Lcom/google/common/collect/Multisets$SetMultiset$1;,"Lcom/google/common/collect/Multisets$SetMultiset.1;"
    iget-object v0, p0, Lcom/google/common/collect/Multisets$SetMultiset$1;->this$0:Lcom/google/common/collect/Multisets$SetMultiset;

    iget-object v0, v0, Lcom/google/common/collect/Multisets$SetMultiset;->delegate:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v1, Lcom/google/common/collect/Multisets$SetMultiset$1$1;

    invoke-direct {v1, p0}, Lcom/google/common/collect/Multisets$SetMultiset$1$1;-><init>(Lcom/google/common/collect/Multisets$SetMultiset$1;)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

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
    .line 386
    .local p0, this:Lcom/google/common/collect/Multisets$SetMultiset$1;,"Lcom/google/common/collect/Multisets$SetMultiset.1;"
    iget-object v0, p0, Lcom/google/common/collect/Multisets$SetMultiset$1;->this$0:Lcom/google/common/collect/Multisets$SetMultiset;

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 399
    .local p0, this:Lcom/google/common/collect/Multisets$SetMultiset$1;,"Lcom/google/common/collect/Multisets$SetMultiset.1;"
    iget-object v0, p0, Lcom/google/common/collect/Multisets$SetMultiset$1;->this$0:Lcom/google/common/collect/Multisets$SetMultiset;

    iget-object v0, v0, Lcom/google/common/collect/Multisets$SetMultiset;->delegate:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
