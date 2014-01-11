.class abstract Lcom/google/common/collect/TreeMultiset$MultisetModifier;
.super Ljava/lang/Object;
.source "TreeMultiset.java"

# interfaces
.implements Lcom/google/common/collect/BstModifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/TreeMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "MultisetModifier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/BstModifier",
        "<TE;",
        "Lcom/google/common/collect/TreeMultiset$Node",
        "<TE;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/TreeMultiset;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/TreeMultiset;)V
    .locals 0
    .parameter

    .prologue
    .line 457
    .local p0, this:Lcom/google/common/collect/TreeMultiset$MultisetModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.MultisetModifier;"
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$MultisetModifier;->this$0:Lcom/google/common/collect/TreeMultiset;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/TreeMultiset;Lcom/google/common/collect/TreeMultiset$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 457
    .local p0, this:Lcom/google/common/collect/TreeMultiset$MultisetModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.MultisetModifier;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/TreeMultiset$MultisetModifier;-><init>(Lcom/google/common/collect/TreeMultiset;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic modify(Ljava/lang/Object;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstModificationResult;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 457
    .local p0, this:Lcom/google/common/collect/TreeMultiset$MultisetModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.MultisetModifier;"
    check-cast p2, Lcom/google/common/collect/TreeMultiset$Node;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$MultisetModifier;->modify(Ljava/lang/Object;Lcom/google/common/collect/TreeMultiset$Node;)Lcom/google/common/collect/BstModificationResult;

    move-result-object v0

    return-object v0
.end method

.method public modify(Ljava/lang/Object;Lcom/google/common/collect/TreeMultiset$Node;)Lcom/google/common/collect/BstModificationResult;
    .locals 5
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/TreeMultiset$Node",
            "<TE;>;)",
            "Lcom/google/common/collect/BstModificationResult",
            "<",
            "Lcom/google/common/collect/TreeMultiset$Node",
            "<TE;>;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/TreeMultiset$MultisetModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.MultisetModifier;"
    .local p1, key:Ljava/lang/Object;,"TE;"
    .local p2, originalEntry:Lcom/google/common/collect/TreeMultiset$Node;,"Lcom/google/common/collect/TreeMultiset$Node<TE;>;"
    const/4 v4, 0x0

    .line 463
    #calls: Lcom/google/common/collect/TreeMultiset;->countOrZero(Lcom/google/common/collect/TreeMultiset$Node;)I
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset;->access$1200(Lcom/google/common/collect/TreeMultiset$Node;)I

    move-result v1

    .line 464
    .local v1, oldCount:I
    invoke-virtual {p0, v1}, Lcom/google/common/collect/TreeMultiset$MultisetModifier;->newCount(I)I

    move-result v0

    .line 465
    .local v0, newCount:I
    if-ne v1, v0, :cond_0

    .line 466
    invoke-static {p2}, Lcom/google/common/collect/BstModificationResult;->identity(Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstModificationResult;

    move-result-object v2

    .line 472
    :goto_0
    return-object v2

    .line 467
    :cond_0
    if-nez v0, :cond_1

    .line 468
    invoke-static {p2, v4}, Lcom/google/common/collect/BstModificationResult;->rebalancingChange(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstModificationResult;

    move-result-object v2

    goto :goto_0

    .line 469
    :cond_1
    if-nez v1, :cond_2

    .line 470
    new-instance v2, Lcom/google/common/collect/TreeMultiset$Node;

    invoke-direct {v2, p1, v0, v4}, Lcom/google/common/collect/TreeMultiset$Node;-><init>(Ljava/lang/Object;ILcom/google/common/collect/TreeMultiset$1;)V

    invoke-static {v4, v2}, Lcom/google/common/collect/BstModificationResult;->rebalancingChange(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstModificationResult;

    move-result-object v2

    goto :goto_0

    .line 472
    :cond_2
    new-instance v2, Lcom/google/common/collect/TreeMultiset$Node;

    invoke-virtual {p2}, Lcom/google/common/collect/TreeMultiset$Node;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v2, v3, v0, v4}, Lcom/google/common/collect/TreeMultiset$Node;-><init>(Ljava/lang/Object;ILcom/google/common/collect/TreeMultiset$1;)V

    invoke-static {p2, v2}, Lcom/google/common/collect/BstModificationResult;->rebuildingChange(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstModificationResult;

    move-result-object v2

    goto :goto_0
.end method

.method abstract newCount(I)I
.end method
