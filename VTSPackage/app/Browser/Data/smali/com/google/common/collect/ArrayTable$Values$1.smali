.class Lcom/google/common/collect/ArrayTable$Values$1;
.super Lcom/google/common/collect/AbstractIndexedListIterator;
.source "ArrayTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ArrayTable$Values;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractIndexedListIterator",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/ArrayTable$Values;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ArrayTable$Values;I)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 823
    .local p0, this:Lcom/google/common/collect/ArrayTable$Values$1;,"Lcom/google/common/collect/ArrayTable$Values.1;"
    iput-object p1, p0, Lcom/google/common/collect/ArrayTable$Values$1;->this$1:Lcom/google/common/collect/ArrayTable$Values;

    invoke-direct {p0, p2}, Lcom/google/common/collect/AbstractIndexedListIterator;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected get(I)Ljava/lang/Object;
    .locals 3
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .prologue
    .line 825
    .local p0, this:Lcom/google/common/collect/ArrayTable$Values$1;,"Lcom/google/common/collect/ArrayTable$Values.1;"
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable$Values$1;->this$1:Lcom/google/common/collect/ArrayTable$Values;

    iget-object v2, v2, Lcom/google/common/collect/ArrayTable$Values;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;
    invoke-static {v2}, Lcom/google/common/collect/ArrayTable;->access$100(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    div-int v1, p1, v2

    .line 826
    .local v1, rowIndex:I
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable$Values$1;->this$1:Lcom/google/common/collect/ArrayTable$Values;

    iget-object v2, v2, Lcom/google/common/collect/ArrayTable$Values;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;
    invoke-static {v2}, Lcom/google/common/collect/ArrayTable;->access$100(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    rem-int v0, p1, v2

    .line 827
    .local v0, columnIndex:I
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable$Values$1;->this$1:Lcom/google/common/collect/ArrayTable$Values;

    iget-object v2, v2, Lcom/google/common/collect/ArrayTable$Values;->this$0:Lcom/google/common/collect/ArrayTable;

    #getter for: Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;
    invoke-static {v2}, Lcom/google/common/collect/ArrayTable;->access$300(Lcom/google/common/collect/ArrayTable;)[[Ljava/lang/Object;

    move-result-object v2

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    return-object v2
.end method
