.class Lcom/google/common/collect/ArrayTable$Values;
.super Ljava/util/AbstractCollection;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ArrayTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/ArrayTable;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/ArrayTable;)V
    .locals 0
    .parameter

    .prologue
    .line 821
    .local p0, this:Lcom/google/common/collect/ArrayTable$Values;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Values;"
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$Values;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 821
    .local p0, this:Lcom/google/common/collect/ArrayTable$Values;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Values;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/ArrayTable$Values;-><init>(Lcom/google/common/collect/ArrayTable;)V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .parameter "value"

    .prologue
    .line 837
    .local p0, this:Lcom/google/common/collect/ArrayTable$Values;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Values;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$Values;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ArrayTable;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 823
    .local p0, this:Lcom/google/common/collect/ArrayTable$Values;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Values;"
    new-instance v0, Lcom/google/common/collect/ArrayTable$Values$1;

    invoke-virtual {p0}, Lcom/google/common/collect/ArrayTable$Values;->size()I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/ArrayTable$Values$1;-><init>(Lcom/google/common/collect/ArrayTable$Values;I)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 833
    .local p0, this:Lcom/google/common/collect/ArrayTable$Values;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Values;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$Values;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0}, Lcom/google/common/collect/ArrayTable;->size()I

    move-result v0

    return v0
.end method
