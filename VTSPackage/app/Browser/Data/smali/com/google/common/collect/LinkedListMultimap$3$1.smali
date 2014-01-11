.class Lcom/google/common/collect/LinkedListMultimap$3$1;
.super Ljava/lang/Object;
.source "LinkedListMultimap.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/LinkedListMultimap$3;->listIterator(I)Ljava/util/ListIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/LinkedListMultimap$3;

.field final synthetic val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/LinkedListMultimap$3;Lcom/google/common/collect/LinkedListMultimap$NodeIterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 853
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->this$1:Lcom/google/common/collect/LinkedListMultimap$3;

    iput-object p2, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 888
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    .local p1, e:Ljava/lang/Object;,"TV;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 856
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public hasPrevious()Z
    .locals 1

    .prologue
    .line 864
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->hasPrevious()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 860
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->next()Lcom/google/common/collect/LinkedListMultimap$Node;

    move-result-object v0

    iget-object v0, v0, Lcom/google/common/collect/LinkedListMultimap$Node;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public nextIndex()I
    .locals 1

    .prologue
    .line 872
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->nextIndex()I

    move-result v0

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 868
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->previous()Lcom/google/common/collect/LinkedListMultimap$Node;

    move-result-object v0

    iget-object v0, v0, Lcom/google/common/collect/LinkedListMultimap$Node;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public previousIndex()I
    .locals 1

    .prologue
    .line 876
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->previousIndex()I

    move-result v0

    return v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 880
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->remove()V

    .line 881
    return-void
.end method

.method public set(Ljava/lang/Object;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 884
    .local p0, this:Lcom/google/common/collect/LinkedListMultimap$3$1;,"Lcom/google/common/collect/LinkedListMultimap$3.1;"
    .local p1, e:Ljava/lang/Object;,"TV;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$3$1;->val$nodes:Lcom/google/common/collect/LinkedListMultimap$NodeIterator;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/LinkedListMultimap$NodeIterator;->setValue(Ljava/lang/Object;)V

    .line 885
    return-void
.end method
