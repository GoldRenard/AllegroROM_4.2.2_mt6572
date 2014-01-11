.class final Lcom/google/common/collect/BstCountBasedBalancePolicies;
.super Ljava/lang/Object;
.source "BstCountBasedBalancePolicies.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation


# static fields
.field private static final SECOND_ROTATE_RATIO:I = 0x2

.field private static final SINGLE_ROTATE_RATIO:I = 0x4


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fullRebalancePolicy(Lcom/google/common/collect/BstAggregate;)Lcom/google/common/collect/BstBalancePolicy;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;>(",
            "Lcom/google/common/collect/BstAggregate",
            "<TN;>;)",
            "Lcom/google/common/collect/BstBalancePolicy",
            "<TN;>;"
        }
    .end annotation

    .prologue
    .line 161
    .local p0, countAggregate:Lcom/google/common/collect/BstAggregate;,"Lcom/google/common/collect/BstAggregate<TN;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    invoke-static {p0}, Lcom/google/common/collect/BstCountBasedBalancePolicies;->singleRebalancePolicy(Lcom/google/common/collect/BstAggregate;)Lcom/google/common/collect/BstBalancePolicy;

    move-result-object v0

    .line 164
    .local v0, singleBalancePolicy:Lcom/google/common/collect/BstBalancePolicy;,"Lcom/google/common/collect/BstBalancePolicy<TN;>;"
    new-instance v1, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;

    invoke-direct {v1, v0, p0}, Lcom/google/common/collect/BstCountBasedBalancePolicies$3;-><init>(Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstAggregate;)V

    return-object v1
.end method

.method public static noRebalancePolicy(Lcom/google/common/collect/BstAggregate;)Lcom/google/common/collect/BstBalancePolicy;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Lcom/google/common/collect/BstNode",
            "<*TN;>;>(",
            "Lcom/google/common/collect/BstAggregate",
            "<TN;>;)",
            "Lcom/google/common/collect/BstBalancePolicy",
            "<TN;>;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, countAggregate:Lcom/google/common/collect/BstAggregate;,"Lcom/google/common/collect/BstAggregate<TN;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    new-instance v0, Lcom/google/common/collect/BstCountBasedBalancePolicies$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/BstCountBasedBalancePolicies$1;-><init>(Lcom/google/common/collect/BstAggregate;)V

    return-object v0
.end method

.method public static singleRebalancePolicy(Lcom/google/common/collect/BstAggregate;)Lcom/google/common/collect/BstBalancePolicy;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;>(",
            "Lcom/google/common/collect/BstAggregate",
            "<TN;>;)",
            "Lcom/google/common/collect/BstBalancePolicy",
            "<TN;>;"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, countAggregate:Lcom/google/common/collect/BstAggregate;,"Lcom/google/common/collect/BstAggregate<TN;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    new-instance v0, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;

    invoke-direct {v0, p0}, Lcom/google/common/collect/BstCountBasedBalancePolicies$2;-><init>(Lcom/google/common/collect/BstAggregate;)V

    return-object v0
.end method
