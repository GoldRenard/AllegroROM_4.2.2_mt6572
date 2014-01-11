.class Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;
.super Lcom/google/common/collect/AbstractIndexedListIterator;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ArrayTable$RowMapEntrySet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractIndexedListIterator",
        "<",
        "Ljava/util/Map$Entry",
        "<TR;",
        "Ljava/util/Map",
        "<TC;TV;>;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ArrayTable$RowMapEntrySet;I)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 791
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;,"Lcom/google/common/collect/ArrayTable$RowMapEntrySet.1;"
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;

    invoke-direct {p0, p2}, Lcom/google/common/collect/AbstractIndexedListIterator;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic get(I)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 791
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;,"Lcom/google/common/collect/ArrayTable$RowMapEntrySet.1;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;->get(I)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method protected get(I)Ljava/util/Map$Entry;
    .locals 3
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry",
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 793
    .local p0, this:Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;,"Lcom/google/common/collect/ArrayTable$RowMapEntrySet.1;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;

    iget-object v0, v0, Lcom/google/common/collect/ArrayTable$RowMapEntrySet;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;
    invoke-static {v0}, Lcom/google/common/collect/ArrayTable;->access$200(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lcom/google/common/collect/ArrayTable$Row;

    iget-object v2, p0, Lcom/google/common/collect/ArrayTable$RowMapEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$RowMapEntrySet;

    iget-object v2, v2, Lcom/google/common/collect/ArrayTable$RowMapEntrySet;->this$0:Lcom/google/common/collect/ArrayTable;

    invoke-direct {v1, v2, p1}, Lcom/google/common/collect/ArrayTable$Row;-><init>(Lcom/google/common/collect/ArrayTable;I)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method
