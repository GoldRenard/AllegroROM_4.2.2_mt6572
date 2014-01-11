.class Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;
.super Lcom/google/common/collect/AbstractMapEntry;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;->get(I)Ljava/util/Map$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractMapEntry",
        "<TR;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;

.field final synthetic val$rowIndex:I


# direct methods
.method constructor <init>(Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 578
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;,"Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1.1;"
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->this$2:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;

    iput p2, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->val$rowIndex:I

    invoke-direct {p0}, Lcom/google/common/collect/AbstractMapEntry;-><init>()V

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .prologue
    .line 580
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;,"Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1.1;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->this$2:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;

    iget-object v0, v0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    iget-object v0, v0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;
    invoke-static {v0}, Lcom/google/common/collect/ArrayTable;->access$200(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iget v1, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->val$rowIndex:I

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 583
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;,"Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1.1;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->this$2:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;

    iget-object v0, v0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    iget-object v0, v0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/collect/ArrayTable;->access$300(Lcom/google/common/collect/ArrayTable;)[[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->val$rowIndex:I

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->this$2:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;

    iget-object v1, v1, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    iget v1, v1, Lcom/google/common/collect/ArrayTable$ColumnEntrySet;->columnIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .prologue
    .line 586
    .local p0, this:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;,"Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1.1;"
    .local p1, value:Ljava/lang/Object;,"TV;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->this$2:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;

    iget-object v0, v0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    iget-object v0, v0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet;->this$0:Lcom/google/common/collect/ArrayTable;

    iget v1, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->val$rowIndex:I

    iget-object v2, p0, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1$1;->this$2:Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;

    iget-object v2, v2, Lcom/google/common/collect/ArrayTable$ColumnEntrySet$1;->this$1:Lcom/google/common/collect/ArrayTable$ColumnEntrySet;

    iget v2, v2, Lcom/google/common/collect/ArrayTable$ColumnEntrySet;->columnIndex:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/common/collect/ArrayTable;->set(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
