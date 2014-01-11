.class Lcom/google/common/collect/ArrayTable$RowMap;
.super Ljava/util/AbstractMap;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ArrayTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RowMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap",
        "<TR;",
        "Ljava/util/Map",
        "<TC;TV;>;>;"
    }
.end annotation


# instance fields
.field transient entrySet:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>.RowMapEntrySet;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/ArrayTable;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/ArrayTable;)V
    .locals 0
    .parameter

    .prologue
    .line 763
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$RowMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 763
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/ArrayTable$RowMap;-><init>(Lcom/google/common/collect/ArrayTable;)V

    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .parameter "rowKey"

    .prologue
    .line 777
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$RowMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ArrayTable;->containsRow(Ljava/lang/Object;)Z

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
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 767
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$RowMap;->entrySet:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;

    .line 768
    .local v0, set:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMapEntrySet;"
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/ArrayTable$RowMapEntrySet;

    .end local v0           #set:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMapEntrySet;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$RowMap;->this$0:Lcom/google/common/collect/ArrayTable;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/ArrayTable$RowMapEntrySet;-><init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V

    iput-object v0, p0, Lcom/google/common/collect/ArrayTable$RowMap;->entrySet:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;

    :cond_0
    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 763
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayTable$RowMap;->get(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/Map;
    .locals 4
    .parameter "rowKey"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 772
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$RowMap;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    invoke-static {v1}, Lcom/google/common/collect/ArrayTable;->access$400(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 773
    .local v0, rowIndex:Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/google/common/collect/ArrayTable$Row;

    iget-object v2, p0, Lcom/google/common/collect/ArrayTable$RowMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/google/common/collect/ArrayTable$Row;-><init>(Lcom/google/common/collect/ArrayTable;I)V

    goto :goto_0
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
    .line 781
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$RowMap;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-virtual {v0}, Lcom/google/common/collect/ArrayTable;->rowKeySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 763
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayTable$RowMap;->remove(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1
    .parameter "rowKey"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 785
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
