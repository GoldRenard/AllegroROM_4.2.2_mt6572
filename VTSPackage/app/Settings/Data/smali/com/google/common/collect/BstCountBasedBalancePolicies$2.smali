.class final Lcom/google/common/collect/BstCountBasedBalancePolicies$2;
.super Ljava/lang/Object;
.source "BstCountBasedBalancePolicies.java"

# interfaces
.implements Lcom/google/common/collect/BstBalancePolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/BstCountBasedBalancePolicies;->singleRebalancePolicy(Lcom/google/common/collect/BstAggregate;)Lcom/google/common/collect/BstBalancePolicy;
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
    .line 82
    iput-object p1, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private rotateL(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 8
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BstNodeFactory",
            "<TN;>;TN;TN;TN;)TN;"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, source:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p4, right:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-static {p4}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v2, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    .line 101
    .local v0, rl:Lcom/google/common/collect/BstNode;,"TN;"
    sget-object v2, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    .line 102
    .local v1, rr:Lcom/google/common/collect/BstNode;,"TN;"
    iget-object v2, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v2, v0}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    const-wide/16 v4, 0x2

    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v6, v1}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v6

    mul-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 103
    invoke-direct {p0, p1, p4, v0, v1}, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->singleR(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object p4

    .line 105
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->singleL(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v2

    return-object v2
.end method

.method private rotateR(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 8
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter
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
    .line 109
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, source:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p4, right:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v2, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    .line 111
    .local v1, lr:Lcom/google/common/collect/BstNode;,"TN;"
    sget-object v2, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    .line 112
    .local v0, ll:Lcom/google/common/collect/BstNode;,"TN;"
    iget-object v2, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v2, v1}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    const-wide/16 v4, 0x2

    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v6, v0}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v6

    mul-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 113
    invoke-direct {p0, p1, p3, v0, v1}, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->singleL(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    .line 115
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->singleR(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v2

    return-object v2
.end method

.method private singleL(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 2
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BstNodeFactory",
            "<TN;>;TN;TN;TN;)TN;"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, source:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p4, right:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-static {p4}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v0}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    invoke-virtual {p1, p2, p3, v0}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v1}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    invoke-virtual {p1, p4, v0, v1}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    return-object v0
.end method

.method private singleR(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 2
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter
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
    .line 126
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, source:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p4, right:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v0}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    sget-object v1, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v1}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    invoke-virtual {p1, p2, v1, p4}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    invoke-virtual {p1, p3, v0, v1}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 10
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
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, source:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p4, right:Lcom/google/common/collect/BstNode;,"TN;"
    const-wide/16 v8, 0x4

    .line 86
    iget-object v4, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v4, p3}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v0

    .line 87
    .local v0, countL:J
    iget-object v4, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v4, p4}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    .line 88
    .local v2, countR:J
    add-long v4, v0, v2

    const-wide/16 v6, 0x1

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 89
    mul-long v4, v8, v0

    cmp-long v4, v2, v4

    if-ltz v4, :cond_0

    .line 90
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->rotateL(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v4

    .line 95
    :goto_0
    return-object v4

    .line 91
    :cond_0
    mul-long v4, v8, v2

    cmp-long v4, v0, v4

    if-ltz v4, :cond_1

    .line 92
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->rotateR(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v4

    goto :goto_0

    .line 95
    :cond_1
    invoke-virtual {p1, p2, p3, p4}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v4

    goto :goto_0
.end method

.method public combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 7
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
    .line 134
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, right:Lcom/google/common/collect/BstNode;,"TN;"
    if-nez p2, :cond_0

    move-object v3, p3

    .line 149
    :goto_0
    return-object v3

    .line 136
    :cond_0
    if-nez p3, :cond_1

    move-object v3, p2

    .line 137
    goto :goto_0

    .line 140
    :cond_1
    iget-object v3, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v3, p2}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v3

    iget-object v5, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v5, p3}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_2

    .line 141
    invoke-static {p2, p1, p0}, Lcom/google/common/collect/BstOperations;->extractMax(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstBalancePolicy;)Lcom/google/common/collect/BstMutationResult;

    move-result-object v0

    .line 142
    .local v0, extractLeftMax:Lcom/google/common/collect/BstMutationResult;,"Lcom/google/common/collect/BstMutationResult<TK;TN;>;"
    invoke-virtual {v0}, Lcom/google/common/collect/BstMutationResult;->getOriginalTarget()Lcom/google/common/collect/BstNode;

    move-result-object v2

    .line 143
    .local v2, newRootSource:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-virtual {v0}, Lcom/google/common/collect/BstMutationResult;->getChangedRoot()Lcom/google/common/collect/BstNode;

    move-result-object p2

    .line 149
    .end local v0           #extractLeftMax:Lcom/google/common/collect/BstMutationResult;,"Lcom/google/common/collect/BstMutationResult<TK;TN;>;"
    :goto_1
    invoke-virtual {p1, v2, p2, p3}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v3

    goto :goto_0

    .line 145
    .end local v2           #newRootSource:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_2
    invoke-static {p3, p1, p0}, Lcom/google/common/collect/BstOperations;->extractMin(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstBalancePolicy;)Lcom/google/common/collect/BstMutationResult;

    move-result-object v1

    .line 146
    .local v1, extractRightMin:Lcom/google/common/collect/BstMutationResult;,"Lcom/google/common/collect/BstMutationResult<TK;TN;>;"
    invoke-virtual {v1}, Lcom/google/common/collect/BstMutationResult;->getOriginalTarget()Lcom/google/common/collect/BstNode;

    move-result-object v2

    .line 147
    .restart local v2       #newRootSource:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-virtual {v1}, Lcom/google/common/collect/BstMutationResult;->getChangedRoot()Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_1
.end method
