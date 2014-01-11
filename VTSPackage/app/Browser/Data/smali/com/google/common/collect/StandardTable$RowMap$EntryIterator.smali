.class Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;
.super Ljava/lang/Object;
.source "StandardTable.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/StandardTable$RowMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EntryIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<TR;",
        "Ljava/util/Map",
        "<TC;TV;>;>;>;"
    }
.end annotation


# instance fields
.field final delegate:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<TR;>;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lcom/google/common/collect/StandardTable$RowMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/StandardTable$RowMap;)V
    .locals 1
    .parameter

    .prologue
    .line 992
    .local p0, this:Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.RowMap.EntryIterator;"
    iput-object p1, p0, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->this$1:Lcom/google/common/collect/StandardTable$RowMap;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 993
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->this$1:Lcom/google/common/collect/StandardTable$RowMap;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable$RowMap;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable;->backingMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->delegate:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 996
    .local p0, this:Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.RowMap.EntryIterator;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->delegate:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 992
    .local p0, this:Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.RowMap.EntryIterator;"
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 1000
    .local p0, this:Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.RowMap.EntryIterator;"
    iget-object v1, p0, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->delegate:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 1001
    .local v0, rowKey:Ljava/lang/Object;,"TR;"
    new-instance v1, Lcom/google/common/collect/ImmutableEntry;

    iget-object v2, p0, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->this$1:Lcom/google/common/collect/StandardTable$RowMap;

    iget-object v2, v2, Lcom/google/common/collect/StandardTable$RowMap;->this$0:Lcom/google/common/collect/StandardTable;

    invoke-virtual {v2, v0}, Lcom/google/common/collect/StandardTable;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/google/common/collect/ImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 1005
    .local p0, this:Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.RowMap.EntryIterator;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$RowMap$EntryIterator;->delegate:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 1006
    return-void
.end method
