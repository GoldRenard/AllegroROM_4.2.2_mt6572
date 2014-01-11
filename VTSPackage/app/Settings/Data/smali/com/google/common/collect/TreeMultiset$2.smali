.class Lcom/google/common/collect/TreeMultiset$2;
.super Ljava/lang/Object;
.source "TreeMultiset.java"

# interfaces
.implements Ljava/util/Iterator;


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
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lcom/google/common/collect/Multiset$Entry",
        "<TE;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/TreeMultiset;

.field toRemove:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TE;"
        }
    .end annotation
.end field

.field final synthetic val$pathIterator:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/TreeMultiset;Ljava/util/Iterator;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 283
    .local p0, this:Lcom/google/common/collect/TreeMultiset$2;,"Lcom/google/common/collect/TreeMultiset.2;"
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$2;->this$0:Lcom/google/common/collect/TreeMultiset;

    iput-object p2, p0, Lcom/google/common/collect/TreeMultiset$2;->val$pathIterator:Ljava/util/Iterator;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 284
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$2;->toRemove:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 288
    .local p0, this:Lcom/google/common/collect/TreeMultiset$2;,"Lcom/google/common/collect/TreeMultiset.2;"
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$2;->val$pathIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lcom/google/common/collect/Multiset$Entry;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 293
    .local p0, this:Lcom/google/common/collect/TreeMultiset$2;,"Lcom/google/common/collect/TreeMultiset.2;"
    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset$2;->val$pathIterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/BstInOrderPath;

    .line 294
    .local v0, path:Lcom/google/common/collect/BstInOrderPath;,"Lcom/google/common/collect/BstInOrderPath<Lcom/google/common/collect/TreeMultiset$Node<TE;>;>;"
    new-instance v2, Lcom/google/common/collect/TreeMultiset$LiveEntry;

    iget-object v3, p0, Lcom/google/common/collect/TreeMultiset$2;->this$0:Lcom/google/common/collect/TreeMultiset;

    invoke-virtual {v0}, Lcom/google/common/collect/BstInOrderPath;->getTip()Lcom/google/common/collect/BstNode;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/TreeMultiset$Node;

    invoke-virtual {v1}, Lcom/google/common/collect/TreeMultiset$Node;->getKey()Ljava/lang/Object;

    move-result-object v4

    iput-object v4, p0, Lcom/google/common/collect/TreeMultiset$2;->toRemove:Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/google/common/collect/BstInOrderPath;->getTip()Lcom/google/common/collect/BstNode;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/TreeMultiset$Node;

    invoke-virtual {v1}, Lcom/google/common/collect/TreeMultiset$Node;->elemCount()I

    move-result v1

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/google/common/collect/TreeMultiset$LiveEntry;-><init>(Lcom/google/common/collect/TreeMultiset;Ljava/lang/Object;ILcom/google/common/collect/TreeMultiset$1;)V

    return-object v2
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 283
    .local p0, this:Lcom/google/common/collect/TreeMultiset$2;,"Lcom/google/common/collect/TreeMultiset.2;"
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$2;->next()Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 3

    .prologue
    .local p0, this:Lcom/google/common/collect/TreeMultiset$2;,"Lcom/google/common/collect/TreeMultiset.2;"
    const/4 v1, 0x0

    .line 300
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$2;->toRemove:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 301
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$2;->this$0:Lcom/google/common/collect/TreeMultiset;

    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$2;->toRemove:Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Lcom/google/common/collect/TreeMultiset;->setCount(Ljava/lang/Object;I)I

    .line 302
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$2;->toRemove:Ljava/lang/Object;

    .line 303
    return-void

    :cond_0
    move v0, v1

    .line 300
    goto :goto_0
.end method
