.class Lcom/google/common/collect/TreeMultiset$1;
.super Lcom/google/common/collect/AbstractLinkedIterator;
.source "TreeMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/TreeMultiset;->iteratorInDirection(Lcom/google/common/collect/BstInOrderPath;Lcom/google/common/collect/BstSide;)Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractLinkedIterator",
        "<",
        "Lcom/google/common/collect/BstInOrderPath",
        "<",
        "Lcom/google/common/collect/TreeMultiset$Node",
        "<TE;>;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/TreeMultiset;

.field final synthetic val$direction:Lcom/google/common/collect/BstSide;


# direct methods
.method constructor <init>(Lcom/google/common/collect/TreeMultiset;Lcom/google/common/collect/BstInOrderPath;Lcom/google/common/collect/BstSide;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 272
    .local p0, this:Lcom/google/common/collect/TreeMultiset$1;,"Lcom/google/common/collect/TreeMultiset.1;"
    .local p2, x0:Lcom/google/common/collect/BstInOrderPath;,"Lcom/google/common/collect/BstInOrderPath<Lcom/google/common/collect/TreeMultiset$Node<TE;>;>;"
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$1;->this$0:Lcom/google/common/collect/TreeMultiset;

    iput-object p3, p0, Lcom/google/common/collect/TreeMultiset$1;->val$direction:Lcom/google/common/collect/BstSide;

    invoke-direct {p0, p2}, Lcom/google/common/collect/AbstractLinkedIterator;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected computeNext(Lcom/google/common/collect/BstInOrderPath;)Lcom/google/common/collect/BstInOrderPath;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BstInOrderPath",
            "<",
            "Lcom/google/common/collect/TreeMultiset$Node",
            "<TE;>;>;)",
            "Lcom/google/common/collect/BstInOrderPath",
            "<",
            "Lcom/google/common/collect/TreeMultiset$Node",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/TreeMultiset$1;,"Lcom/google/common/collect/TreeMultiset.1;"
    .local p1, previous:Lcom/google/common/collect/BstInOrderPath;,"Lcom/google/common/collect/BstInOrderPath<Lcom/google/common/collect/TreeMultiset$Node<TE;>;>;"
    const/4 v2, 0x0

    .line 275
    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset$1;->val$direction:Lcom/google/common/collect/BstSide;

    invoke-virtual {p1, v1}, Lcom/google/common/collect/BstInOrderPath;->hasNext(Lcom/google/common/collect/BstSide;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 280
    :goto_0
    return-object v2

    .line 278
    :cond_0
    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset$1;->val$direction:Lcom/google/common/collect/BstSide;

    invoke-virtual {p1, v1}, Lcom/google/common/collect/BstInOrderPath;->next(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstInOrderPath;

    move-result-object v0

    .line 280
    .local v0, next:Lcom/google/common/collect/BstInOrderPath;,"Lcom/google/common/collect/BstInOrderPath<Lcom/google/common/collect/TreeMultiset$Node<TE;>;>;"
    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset$1;->this$0:Lcom/google/common/collect/TreeMultiset;

    #getter for: Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;
    invoke-static {v1}, Lcom/google/common/collect/TreeMultiset;->access$400(Lcom/google/common/collect/TreeMultiset;)Lcom/google/common/collect/GeneralRange;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/common/collect/BstInOrderPath;->getTip()Lcom/google/common/collect/BstNode;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/TreeMultiset$Node;

    invoke-virtual {v1}, Lcom/google/common/collect/TreeMultiset$Node;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .end local v0           #next:Lcom/google/common/collect/BstInOrderPath;,"Lcom/google/common/collect/BstInOrderPath<Lcom/google/common/collect/TreeMultiset$Node<TE;>;>;"
    :goto_1
    move-object v2, v0

    goto :goto_0

    .restart local v0       #next:Lcom/google/common/collect/BstInOrderPath;,"Lcom/google/common/collect/BstInOrderPath<Lcom/google/common/collect/TreeMultiset$Node<TE;>;>;"
    :cond_1
    move-object v0, v2

    goto :goto_1
.end method

.method protected bridge synthetic computeNext(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 272
    .local p0, this:Lcom/google/common/collect/TreeMultiset$1;,"Lcom/google/common/collect/TreeMultiset.1;"
    check-cast p1, Lcom/google/common/collect/BstInOrderPath;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeMultiset$1;->computeNext(Lcom/google/common/collect/BstInOrderPath;)Lcom/google/common/collect/BstInOrderPath;

    move-result-object v0

    return-object v0
.end method
