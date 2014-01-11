.class Lcom/google/common/collect/ArrayTable$ColumnMap;
.super Ljava/util/AbstractMap;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ArrayTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ColumnMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap",
        "<TC;",
        "Ljava/util/Map",
        "<TR;TV;>;>;"
    }
.end annotation


# instance fields
.field transient entrySet:Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>.ColumnMapEntrySet;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/ArrayTable;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/ArrayTable;)V
    .locals 0
    .parameter

    .prologue
    .line 617
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 617
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/ArrayTable$ColumnMap;-><init>(Lcom/google/common/collect/ArrayTable;)V

    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .parameter "columnKey"

    .prologue
    .line 631
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ArrayTable;->containsColumn(Ljava/lang/Object;)Z

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
            "<TC;",
            "Ljava/util/Map",
            "<TR;TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 621
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->entrySet:Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;

    .line 622
    .local v0, set:Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMapEntrySet;"
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;

    .end local v0           #set:Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMapEntrySet;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->this$0:Lcom/google/common/collect/ArrayTable;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;-><init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V

    iput-object v0, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->entrySet:Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;

    :cond_0
    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 617
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayTable$ColumnMap;->get(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/Map;
    .locals 4
    .parameter "columnKey"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<TR;TV;>;"
        }
    .end annotation

    .prologue
    .line 626
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    invoke-static {v1}, Lcom/google/common/collect/ArrayTable;->access$500(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 627
    .local v0, columnIndex:Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/google/common/collect/ArrayTable$Column;

    iget-object v2, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/google/common/collect/ArrayTable$Column;-><init>(Lcom/google/common/collect/ArrayTable;I)V

    goto :goto_0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TC;>;"
        }
    .end annotation

    .prologue
    .line 635
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$ColumnMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0}, Lcom/google/common/collect/ArrayTable;->columnKeySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 617
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayTable$ColumnMap;->remove(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1
    .parameter "columnKey"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<TR;TV;>;"
        }
    .end annotation

    .prologue
    .line 639
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
