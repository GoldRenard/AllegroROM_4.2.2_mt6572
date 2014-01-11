.class Lcom/google/common/collect/ArrayTable$Column;
.super Ljava/util/AbstractMap;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ArrayTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Column"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap",
        "<TR;TV;>;"
    }
.end annotation


# instance fields
.field final columnIndex:I

.field entrySet:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>.ColumnEntrySet;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/ArrayTable;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ArrayTable;I)V
    .locals 0
    .parameter
    .parameter "columnIndex"

    .prologue
    .line 536
    .local p0, this:Lcom/google/common/collect/ArrayTable$Column;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Column;"
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 537
    iput p2, p0, Lcom/google/common/collect/ArrayTable$Column;->columnIndex:I

    .line 538
    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .parameter "rowKey"

    .prologue
    .line 553
    .local p0, this:Lcom/google/common/collect/ArrayTable$Column;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Column;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    invoke-static {v0}, Lcom/google/common/collect/ArrayTable;->access$400(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TR;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 543
    .local p0, this:Lcom/google/common/collect/ArrayTable$Column;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Column;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$Column;->entrySet:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    .line 544
    .local v0, set:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnEntrySet;"
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    .end local v0           #set:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnEntrySet;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    iget v2, p0, Lcom/google/common/collect/ArrayTable$Column;->columnIndex:I

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/ArrayTable$ColumnEntrySet;-><init>(Lcom/google/common/collect/ArrayTable;I)V

    iput-object v0, p0, Lcom/google/common/collect/ArrayTable$Column;->entrySet:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    :cond_0
    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .parameter "rowKey"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 548
    .local p0, this:Lcom/google/common/collect/ArrayTable$Column;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Column;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    invoke-static {v1}, Lcom/google/common/collect/ArrayTable;->access$400(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 549
    .local v0, rowIndex:Ljava/lang/Integer;
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    iget v2, p0, Lcom/google/common/collect/ArrayTable$Column;->columnIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    #calls: Lcom/google/common/collect/ArrayTable;->getIndexed(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;
    invoke-static {v1, v0, v2}, Lcom/google/common/collect/ArrayTable;->access$600(Lcom/google/common/collect/ArrayTable;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 564
    .local p0, this:Lcom/google/common/collect/ArrayTable$Column;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Column;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0}, Lcom/google/common/collect/ArrayTable;->rowKeySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;TV;)TV;"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/ArrayTable$Column;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.Column;"
    .local p1, rowKey:Ljava/lang/Object;,"TR;"
    .local p2, value:Ljava/lang/Object;,"TV;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 557
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    invoke-static {v1}, Lcom/google/common/collect/ArrayTable;->access$400(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 559
    .local v0, rowIndex:Ljava/lang/Integer;
    if-eqz v0, :cond_0

    move v1, v2

    :goto_0
    const-string v4, "Row %s not in %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v3

    iget-object v3, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;
    invoke-static {v3}, Lcom/google/common/collect/ArrayTable;->access$200(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 560
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$Column;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v3, p0, Lcom/google/common/collect/ArrayTable$Column;->columnIndex:I

    invoke-virtual {v1, v2, v3, p2}, Lcom/google/common/collect/ArrayTable;->set(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    :cond_0
    move v1, v3

    .line 559
    goto :goto_0
.end method
