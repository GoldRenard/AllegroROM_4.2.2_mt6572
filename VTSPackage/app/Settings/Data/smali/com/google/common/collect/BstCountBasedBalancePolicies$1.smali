.class final Lcom/google/common/collect/BstCountBasedBalancePolicies$1;
.super Ljava/lang/Object;
.source "BstCountBasedBalancePolicies.java"

# interfaces
.implements Lcom/google/common/collect/BstBalancePolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/BstCountBasedBalancePolicies;->noRebalancePolicy(Lcom/google/common/collect/BstAggregate;)Lcom/google/common/collect/BstBalancePolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/BstBalancePolicy",
        "<TN;>;"
    }
.end annotation


# instance fields
.field final synthetic val$countAggregate:Lcom/google/common/collect/BstAggregate;


# direct methods
.method constructor <init>(Lcom/google/common/collect/BstAggregate;)V
    .locals 0
    .parameter

    .prologue
    .line 49
    iput-object p1, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$1;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 1
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BstNodeFactory",
            "<TN;>;TN;TN;TN;)TN;"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, source:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p4, right:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/BstNodeFactory;

    invoke-virtual {v0, p2, p3, p4}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    return-object v0
.end method

.method public combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 4
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BstNodeFactory",
            "<TN;>;TN;TN;)TN;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 59
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, right:Lcom/google/common/collect/BstNode;,"TN;"
    if-nez p2, :cond_0

    .line 67
    .end local p3           #right:Lcom/google/common/collect/BstNode;,"TN;"
    :goto_0
    return-object p3

    .line 61
    .restart local p3       #right:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_0
    if-nez p3, :cond_1

    move-object p3, p2

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$1;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v0, p2}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$1;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v2, p3}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 64
    sget-object v0, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p2, v0}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p2, v1}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    invoke-virtual {p0, p1, v1, p3}, Lcom/google/common/collect/BstCountBasedBalancePolicies$1;->combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    invoke-virtual {p1, p2, v0, v1}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_0

    .line 67
    :cond_2
    sget-object v0, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v0}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/common/collect/BstCountBasedBalancePolicies$1;->combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v1}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    invoke-virtual {p1, p3, v0, v1}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_0
.end method
