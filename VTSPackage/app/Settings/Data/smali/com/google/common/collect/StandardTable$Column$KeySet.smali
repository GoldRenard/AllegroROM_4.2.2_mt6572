.class Lcom/google/common/collect/StandardTable$Column$KeySet;
.super Ljava/util/AbstractSet;
.source "StandardTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/StandardTable$Column;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "KeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/StandardTable$Column;


# direct methods
.method constructor <init>(Lcom/google/common/collect/StandardTable$Column;)V
    .locals 0
    .parameter

    .prologue
    .line 646
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    iput-object p1, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 668
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    invoke-virtual {v0}, Lcom/google/common/collect/StandardTable$Column;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 669
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 2
    .parameter "obj"

    .prologue
    .line 660
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable$Column;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object v1, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    iget-object v1, v1, Lcom/google/common/collect/StandardTable$Column;->columnKey:Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Lcom/google/common/collect/StandardTable;->contains(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 2

    .prologue
    .line 656
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable$Column;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object v1, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    iget-object v1, v1, Lcom/google/common/collect/StandardTable$Column;->columnKey:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/StandardTable;->containsColumn(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 648
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    invoke-static {v0}, Lcom/google/common/collect/StandardTable;->keyIteratorImpl(Ljava/util/Map;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 2
    .parameter "obj"

    .prologue
    .line 664
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable$Column;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object v1, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    iget-object v1, v1, Lcom/google/common/collect/StandardTable$Column;->columnKey:Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Lcom/google/common/collect/StandardTable;->remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 672
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    const/4 v0, 0x0

    .line 673
    .local v0, changed:Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 674
    .local v2, obj:Ljava/lang/Object;
    invoke-virtual {p0, v2}, Lcom/google/common/collect/StandardTable$Column$KeySet;->remove(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v0, v3

    goto :goto_0

    .line 676
    .end local v2           #obj:Ljava/lang/Object;
    :cond_0
    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 680
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    new-instance v0, Lcom/google/common/collect/StandardTable$Column$KeySet$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/StandardTable$Column$KeySet$1;-><init>(Lcom/google/common/collect/StandardTable$Column$KeySet;Ljava/util/Collection;)V

    .line 687
    .local v0, predicate:Lcom/google/common/base/Predicate;,"Lcom/google/common/base/Predicate<Ljava/util/Map$Entry<TR;TV;>;>;"
    iget-object v1, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/StandardTable$Column;->removePredicate(Lcom/google/common/base/Predicate;)Z

    move-result v1

    return v1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 652
    .local p0, this:Lcom/google/common/collect/StandardTable$Column$KeySet;,"Lcom/google/common/collect/StandardTable<TR;TC;TV;>.Column.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Column$KeySet;->this$1:Lcom/google/common/collect/StandardTable$Column;

    invoke-virtual {v0}, Lcom/google/common/collect/StandardTable$Column;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
