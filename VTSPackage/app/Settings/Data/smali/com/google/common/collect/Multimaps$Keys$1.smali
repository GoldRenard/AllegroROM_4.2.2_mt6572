.class Lcom/google/common/collect/Multimaps$Keys$1;
.super Ljava/lang/Object;
.source "Multimaps.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multimaps$Keys;->entryIterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lcom/google/common/collect/Multiset$Entry",
        "<TK;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Multimaps$Keys;

.field final synthetic val$backingIterator:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$Keys;Ljava/util/Iterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1867
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys$1;,"Lcom/google/common/collect/Multimaps$Keys.1;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$Keys$1;->this$0:Lcom/google/common/collect/Multimaps$Keys;

    iput-object p2, p0, Lcom/google/common/collect/Multimaps$Keys$1;->val$backingIterator:Ljava/util/Iterator;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 1869
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys$1;,"Lcom/google/common/collect/Multimaps$Keys.1;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$Keys$1;->val$backingIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lcom/google/common/collect/Multiset$Entry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 1873
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys$1;,"Lcom/google/common/collect/Multimaps$Keys.1;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$Keys$1;->val$backingIterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1875
    .local v0, backingEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;"
    new-instance v1, Lcom/google/common/collect/Multimaps$Keys$1$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/Multimaps$Keys$1$1;-><init>(Lcom/google/common/collect/Multimaps$Keys$1;Ljava/util/Map$Entry;)V

    return-object v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1867
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys$1;,"Lcom/google/common/collect/Multimaps$Keys.1;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys$1;->next()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 1887
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys$1;,"Lcom/google/common/collect/Multimaps$Keys.1;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$Keys$1;->val$backingIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 1888
    return-void
.end method
