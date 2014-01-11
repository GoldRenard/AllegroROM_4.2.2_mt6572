.class final Lcom/google/common/collect/BstCountBasedBalancePolicies$3;
.super Ljava/lang/Object;
.source "BstCountBasedBalancePolicies.java"

# interfaces
.implements Lcom/google/common/collect/BstBalancePolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/BstCountBasedBalancePolicies;->fullRebalancePolicy(Lcom/google/common/collect/BstAggregate;)Lcom/google/common/collect/BstBalancePolicy;
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

.field final synthetic val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;


# direct methods
.method constructor <init>(Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstAggregate;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 164
    iput-object p1, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    iput-object p2, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
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

    .line 168
    if-nez p3, :cond_0

    .line 169
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    invoke-static {p4, p2, p1, v6}, Lcom/google/common/collect/BstOperations;->insertMin(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstBalancePolicy;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    .line 184
    :goto_0
    return-object v6

    .line 170
    :cond_0
    if-nez p4, :cond_1

    .line 171
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    invoke-static {p3, p2, p1, v6}, Lcom/google/common/collect/BstOperations;->insertMax(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstBalancePolicy;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    goto :goto_0

    .line 173
    :cond_1
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v6, p3}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v0

    .line 174
    .local v0, countL:J
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v6, p4}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    .line 175
    .local v2, countR:J
    mul-long v6, v8, v0

    cmp-long v6, v6, v2

    if-gtz v6, :cond_2

    .line 176
    sget-object v6, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v6}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    invoke-virtual {p0, p1, p2, p3, v6}, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v4

    .line 177
    .local v4, resultLeft:Lcom/google/common/collect/BstNode;,"TN;"
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    sget-object v7, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v7}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v7

    invoke-interface {v6, p1, p4, v4, v7}, Lcom/google/common/collect/BstBalancePolicy;->balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    goto :goto_0

    .line 179
    .end local v4           #resultLeft:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_2
    mul-long v6, v8, v2

    cmp-long v6, v6, v0

    if-gtz v6, :cond_3

    .line 180
    sget-object v6, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v6}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    invoke-virtual {p0, p1, p2, v6, p4}, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v5

    .line 181
    .local v5, resultRight:Lcom/google/common/collect/BstNode;,"TN;"
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    sget-object v7, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v7}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v7

    invoke-interface {v6, p1, p3, v7, v5}, Lcom/google/common/collect/BstBalancePolicy;->balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    goto :goto_0

    .line 184
    .end local v5           #resultRight:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_3
    invoke-virtual {p1, p2, p3, p4}, Lcom/google/common/collect/BstNodeFactory;->createNode(Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    goto :goto_0
.end method

.method public combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 10
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
    .local p1, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p2, left:Lcom/google/common/collect/BstNode;,"TN;"
    .local p3, right:Lcom/google/common/collect/BstNode;,"TN;"
    const-wide/16 v8, 0x4

    .line 191
    if-nez p2, :cond_0

    .line 207
    .end local p3           #right:Lcom/google/common/collect/BstNode;,"TN;"
    :goto_0
    return-object p3

    .line 193
    .restart local p3       #right:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_0
    if-nez p3, :cond_1

    move-object p3, p2

    .line 194
    goto :goto_0

    .line 196
    :cond_1
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v6, p2}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v0

    .line 197
    .local v0, countL:J
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$countAggregate:Lcom/google/common/collect/BstAggregate;

    invoke-interface {v6, p3}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    .line 198
    .local v2, countR:J
    mul-long v6, v8, v0

    cmp-long v6, v6, v2

    if-gtz v6, :cond_2

    .line 199
    sget-object v6, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v6}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    invoke-virtual {p0, p1, p2, v6}, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v4

    .line 200
    .local v4, resultLeft:Lcom/google/common/collect/BstNode;,"TN;"
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    sget-object v7, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p3, v7}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v7

    invoke-interface {v6, p1, p3, v4, v7}, Lcom/google/common/collect/BstBalancePolicy;->balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_0

    .line 202
    .end local v4           #resultLeft:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_2
    mul-long v6, v8, v2

    cmp-long v6, v6, v0

    if-gtz v6, :cond_3

    .line 203
    sget-object v6, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p2, v6}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v6

    invoke-virtual {p0, p1, v6, p3}, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v5

    .line 204
    .local v5, resultRight:Lcom/google/common/collect/BstNode;,"TN;"
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    sget-object v7, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p2, v7}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v7

    invoke-interface {v6, p1, p2, v7, v5}, Lcom/google/common/collect/BstBalancePolicy;->balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_0

    .line 207
    .end local v5           #resultRight:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_3
    iget-object v6, p0, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;->val$singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;

    invoke-interface {v6, p1, p2, p3}, Lcom/google/common/collect/BstBalancePolicy;->combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_0
.end method
