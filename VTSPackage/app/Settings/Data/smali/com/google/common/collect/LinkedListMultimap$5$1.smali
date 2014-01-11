.class Lcom/google/common/collect/LinkedListMultimap$5$1;
.super Ljava/lang/Object;
.source "LinkedListMultimap.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/LinkedListMultimap$5;->listIterator(I)Ljava/util/ListIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/LinkedListMultimap$5;

.field final synthetic val$nodes:Ljava/util/ListIterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/LinkedListMultimap$5;Ljava/util/ListIterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 944
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->this$1:Lcom/google/common/collect/LinkedListMultimap$5;

    iput-object p2, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 944
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedListMultimap$5$1;->add(Ljava/util/Map$Entry;)V

    return-void
.end method

.method public add(Ljava/util/Map$Entry;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 987
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    .local p1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 947
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public hasPrevious()Z
    .locals 1

    .prologue
    .line 962
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 944
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedListMultimap$5$1;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 952
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/LinkedListMultimap$Node;

    #calls: Lcom/google/common/collect/LinkedListMultimap;->createEntry(Lcom/google/common/collect/LinkedListMultimap$Node;)Ljava/util/Map$Entry;
    invoke-static {v0}, Lcom/google/common/collect/LinkedListMultimap;->access$1100(Lcom/google/common/collect/LinkedListMultimap$Node;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public nextIndex()I
    .locals 1

    .prologue
    .line 972
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->nextIndex()I

    move-result v0

    return v0
.end method

.method public bridge synthetic previous()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 944
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedListMultimap$5$1;->previous()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public previous()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 967
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/LinkedListMultimap$Node;

    #calls: Lcom/google/common/collect/LinkedListMultimap;->createEntry(Lcom/google/common/collect/LinkedListMultimap$Node;)Ljava/util/Map$Entry;
    invoke-static {v0}, Lcom/google/common/collect/LinkedListMultimap;->access$1100(Lcom/google/common/collect/LinkedListMultimap$Node;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public previousIndex()I
    .locals 1

    .prologue
    .line 977
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previousIndex()I

    move-result v0

    return v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 957
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$5$1;->val$nodes:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->remove()V

    .line 958
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 944
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedListMultimap$5$1;->set(Ljava/util/Map$Entry;)V

    return-void
.end method

.method public set(Ljava/util/Map$Entry;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 982
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$5$1;,"Lcom/google/common/collect/LinkedListMultimap$5.1;"
    .local p1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
