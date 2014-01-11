.class Lcom/google/common/collect/Lists$Partition;
.super Ljava/util/AbstractList;
.source "Lists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Lists;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Partition"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractList",
        "<",
        "Ljava/util/List",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field final size:I


# direct methods
.method constructor <init>(Ljava/util/List;I)V
    .locals 0
    .parameter
    .parameter "size"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 495
    .local p0, this:Lcom/google/common/collect/Lists$Partition;,"Lcom/google/common/collect/Lists$Partition<TT;>;"
    .local p1, list:Ljava/util/List;,"Ljava/util/List<TT;>;"
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 496
    iput-object p1, p0, Lcom/google/common/collect/Lists$Partition;->list:Ljava/util/List;

    .line 497
    iput p2, p0, Lcom/google/common/collect/Lists$Partition;->size:I

    .line 498
    return-void
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 491
    .local p0, this:Lcom/google/common/collect/Lists$Partition;,"Lcom/google/common/collect/Lists$Partition<TT;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Lists$Partition;->get(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Ljava/util/List;
    .locals 5
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 501
    .local p0, this:Lcom/google/common/collect/Lists$Partition;,"Lcom/google/common/collect/Lists$Partition<TT;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Lists$Partition;->size()I

    move-result v1

    .line 502
    .local v1, listSize:I
    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 503
    iget v3, p0, Lcom/google/common/collect/Lists$Partition;->size:I

    mul-int v2, p1, v3

    .line 504
    .local v2, start:I
    iget v3, p0, Lcom/google/common/collect/Lists$Partition;->size:I

    add-int/2addr v3, v2

    iget-object v4, p0, Lcom/google/common/collect/Lists$Partition;->list:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 505
    .local v0, end:I
    iget-object v3, p0, Lcom/google/common/collect/Lists$Partition;->list:Ljava/util/List;

    invoke-interface {v3, v2, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 518
    .local p0, this:Lcom/google/common/collect/Lists$Partition;,"Lcom/google/common/collect/Lists$Partition<TT;>;"
    iget-object v0, p0, Lcom/google/common/collect/Lists$Partition;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 3

    .prologue
    .line 510
    .local p0, this:Lcom/google/common/collect/Lists$Partition;,"Lcom/google/common/collect/Lists$Partition<TT;>;"
    iget-object v1, p0, Lcom/google/common/collect/Lists$Partition;->list:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget v2, p0, Lcom/google/common/collect/Lists$Partition;->size:I

    div-int v0, v1, v2

    .line 511
    .local v0, result:I
    iget v1, p0, Lcom/google/common/collect/Lists$Partition;->size:I

    mul-int/2addr v1, v0

    iget-object v2, p0, Lcom/google/common/collect/Lists$Partition;->list:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v1, v2, :cond_0

    .line 512
    add-int/lit8 v0, v0, 0x1

    .line 514
    :cond_0
    return v0
.end method
