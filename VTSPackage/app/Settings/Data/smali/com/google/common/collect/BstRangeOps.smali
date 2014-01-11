.class final Lcom/google/common/collect/BstRangeOps;
.super Ljava/lang/Object;
.source "BstRangeOps.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/BstRangeOps$1;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 174
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beyond(Lcom/google/common/collect/GeneralRange;Ljava/lang/Object;Lcom/google/common/collect/BstSide;)Z
    .locals 2
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "side"
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/GeneralRange",
            "<TK;>;TK;",
            "Lcom/google/common/collect/BstSide;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, range:Lcom/google/common/collect/GeneralRange;,"Lcom/google/common/collect/GeneralRange<TK;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Lcom/google/common/collect/BstRangeOps$1;->$SwitchMap$com$google$common$collect$BstSide:[I

    invoke-virtual {p2}, Lcom/google/common/collect/BstSide;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 170
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 166
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/google/common/collect/GeneralRange;->tooLow(Ljava/lang/Object;)Z

    move-result v0

    .line 168
    :goto_0
    return v0

    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/GeneralRange;->tooHigh(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 164
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static furthestPath(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstPathFactory;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstPath;
    .locals 2
    .parameter
    .end parameter
    .parameter "side"
    .end parameter
    .parameter
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;P:",
            "Lcom/google/common/collect/BstPath",
            "<TN;TP;>;>(",
            "Lcom/google/common/collect/GeneralRange",
            "<TK;>;",
            "Lcom/google/common/collect/BstSide;",
            "Lcom/google/common/collect/BstPathFactory",
            "<TN;TP;>;TN;)TP;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 128
    .local p0, range:Lcom/google/common/collect/GeneralRange;,"Lcom/google/common/collect/GeneralRange<TK;>;"
    .local p2, pathFactory:Lcom/google/common/collect/BstPathFactory;,"Lcom/google/common/collect/BstPathFactory<TN;TP;>;"
    .local p3, root:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    if-nez p3, :cond_0

    .line 132
    const/4 v1, 0x0

    .line 135
    :goto_0
    return-object v1

    .line 134
    :cond_0
    invoke-interface {p2, p3}, Lcom/google/common/collect/BstPathFactory;->initialPath(Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstPath;

    move-result-object v0

    .line 135
    .local v0, path:Lcom/google/common/collect/BstPath;,"TP;"
    invoke-static {p0, p1, p2, v0}, Lcom/google/common/collect/BstRangeOps;->furthestPath(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstPathFactory;Lcom/google/common/collect/BstPath;)Lcom/google/common/collect/BstPath;

    move-result-object v1

    goto :goto_0
.end method

.method private static furthestPath(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstPathFactory;Lcom/google/common/collect/BstPath;)Lcom/google/common/collect/BstPath;
    .locals 5
    .parameter
    .parameter "side"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;P:",
            "Lcom/google/common/collect/BstPath",
            "<TN;TP;>;>(",
            "Lcom/google/common/collect/GeneralRange",
            "<TK;>;",
            "Lcom/google/common/collect/BstSide;",
            "Lcom/google/common/collect/BstPathFactory",
            "<TN;TP;>;TP;)TP;"
        }
    .end annotation

    .prologue
    .local p0, range:Lcom/google/common/collect/GeneralRange;,"Lcom/google/common/collect/GeneralRange<TK;>;"
    .local p2, pathFactory:Lcom/google/common/collect/BstPathFactory;,"Lcom/google/common/collect/BstPathFactory<TN;TP;>;"
    .local p3, currentPath:Lcom/google/common/collect/BstPath;,"TP;"
    const/4 v3, 0x0

    .line 140
    invoke-virtual {p3}, Lcom/google/common/collect/BstPath;->getTip()Lcom/google/common/collect/BstNode;

    move-result-object v1

    .line 141
    .local v1, tip:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-virtual {v1}, Lcom/google/common/collect/BstNode;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 142
    .local v2, tipKey:Ljava/lang/Object;,"TK;"
    invoke-static {p0, v2, p1}, Lcom/google/common/collect/BstRangeOps;->beyond(Lcom/google/common/collect/GeneralRange;Ljava/lang/Object;Lcom/google/common/collect/BstSide;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 143
    invoke-virtual {p1}, Lcom/google/common/collect/BstSide;->other()Lcom/google/common/collect/BstSide;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/google/common/collect/BstNode;->hasChild(Lcom/google/common/collect/BstSide;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 144
    invoke-virtual {p1}, Lcom/google/common/collect/BstSide;->other()Lcom/google/common/collect/BstSide;

    move-result-object v3

    invoke-interface {p2, p3, v3}, Lcom/google/common/collect/BstPathFactory;->extension(Lcom/google/common/collect/BstPath;Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstPath;

    move-result-object p3

    .line 145
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/collect/BstRangeOps;->furthestPath(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstPathFactory;Lcom/google/common/collect/BstPath;)Lcom/google/common/collect/BstPath;

    move-result-object v3

    .line 156
    :cond_0
    :goto_0
    return-object v3

    .line 149
    :cond_1
    invoke-virtual {v1, p1}, Lcom/google/common/collect/BstNode;->hasChild(Lcom/google/common/collect/BstSide;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 150
    invoke-interface {p2, p3, p1}, Lcom/google/common/collect/BstPathFactory;->extension(Lcom/google/common/collect/BstPath;Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstPath;

    move-result-object v0

    .line 151
    .local v0, alphaPath:Lcom/google/common/collect/BstPath;,"TP;"
    invoke-static {p0, p1, p2, v0}, Lcom/google/common/collect/BstRangeOps;->furthestPath(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstPathFactory;Lcom/google/common/collect/BstPath;)Lcom/google/common/collect/BstPath;

    move-result-object v0

    .line 152
    if-eqz v0, :cond_2

    move-object v3, v0

    .line 153
    goto :goto_0

    .line 156
    .end local v0           #alphaPath:Lcom/google/common/collect/BstPath;,"TP;"
    :cond_2
    invoke-virtual {p1}, Lcom/google/common/collect/BstSide;->other()Lcom/google/common/collect/BstSide;

    move-result-object v4

    invoke-static {p0, v2, v4}, Lcom/google/common/collect/BstRangeOps;->beyond(Lcom/google/common/collect/GeneralRange;Ljava/lang/Object;Lcom/google/common/collect/BstSide;)Z

    move-result v4

    if-nez v4, :cond_0

    move-object v3, p3

    goto :goto_0
.end method

.method public static minusRange(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 4
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
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;>(",
            "Lcom/google/common/collect/GeneralRange",
            "<TK;>;",
            "Lcom/google/common/collect/BstBalancePolicy",
            "<TN;>;",
            "Lcom/google/common/collect/BstNodeFactory",
            "<TN;>;TN;)TN;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, range:Lcom/google/common/collect/GeneralRange;,"Lcom/google/common/collect/GeneralRange<TK;>;"
    .local p1, balancePolicy:Lcom/google/common/collect/BstBalancePolicy;,"Lcom/google/common/collect/BstBalancePolicy<TN;>;"
    .local p2, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p3, root:Lcom/google/common/collect/BstNode;,"TN;"
    const/4 v2, 0x0

    .line 78
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    invoke-virtual {p0}, Lcom/google/common/collect/GeneralRange;->hasUpperBound()Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-static {p0, p1, p2, v3, p3}, Lcom/google/common/collect/BstRangeOps;->subTreeBeyondRangeToSide(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    .line 84
    .local v0, higher:Lcom/google/common/collect/BstNode;,"TN;"
    :goto_0
    invoke-virtual {p0}, Lcom/google/common/collect/GeneralRange;->hasLowerBound()Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v2, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-static {p0, p1, p2, v2, p3}, Lcom/google/common/collect/BstRangeOps;->subTreeBeyondRangeToSide(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    .line 87
    .local v1, lower:Lcom/google/common/collect/BstNode;,"TN;"
    :goto_1
    invoke-interface {p1, p2, v1, v0}, Lcom/google/common/collect/BstBalancePolicy;->combine(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v2

    return-object v2

    .end local v0           #higher:Lcom/google/common/collect/BstNode;,"TN;"
    .end local v1           #lower:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_0
    move-object v0, v2

    .line 81
    goto :goto_0

    .restart local v0       #higher:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_1
    move-object v1, v2

    .line 84
    goto :goto_1
.end method

.method private static subTreeBeyondRangeToSide(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;
    .locals 4
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter "side"
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;>(",
            "Lcom/google/common/collect/GeneralRange",
            "<TK;>;",
            "Lcom/google/common/collect/BstBalancePolicy",
            "<TN;>;",
            "Lcom/google/common/collect/BstNodeFactory",
            "<TN;>;",
            "Lcom/google/common/collect/BstSide;",
            "TN;)TN;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 98
    .local p0, range:Lcom/google/common/collect/GeneralRange;,"Lcom/google/common/collect/GeneralRange<TK;>;"
    .local p1, balancePolicy:Lcom/google/common/collect/BstBalancePolicy;,"Lcom/google/common/collect/BstBalancePolicy<TN;>;"
    .local p2, nodeFactory:Lcom/google/common/collect/BstNodeFactory;,"Lcom/google/common/collect/BstNodeFactory<TN;>;"
    .local p4, root:Lcom/google/common/collect/BstNode;,"TN;"
    if-nez p4, :cond_0

    .line 99
    const/4 v2, 0x0

    .line 116
    :goto_0
    return-object v2

    .line 101
    :cond_0
    invoke-virtual {p4}, Lcom/google/common/collect/BstNode;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p0, v2, p3}, Lcom/google/common/collect/BstRangeOps;->beyond(Lcom/google/common/collect/GeneralRange;Ljava/lang/Object;Lcom/google/common/collect/BstSide;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    sget-object v2, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    .line 103
    .local v0, left:Lcom/google/common/collect/BstNode;,"TN;"
    sget-object v2, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-virtual {p4, v2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    .line 104
    .local v1, right:Lcom/google/common/collect/BstNode;,"TN;"
    sget-object v2, Lcom/google/common/collect/BstRangeOps$1;->$SwitchMap$com$google$common$collect$BstSide:[I

    invoke-virtual {p3}, Lcom/google/common/collect/BstSide;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 112
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 106
    :pswitch_0
    sget-object v2, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-static {p0, p1, p2, v2, v1}, Lcom/google/common/collect/BstRangeOps;->subTreeBeyondRangeToSide(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v1

    .line 114
    :goto_1
    invoke-interface {p1, p2, p4, v0, v1}, Lcom/google/common/collect/BstBalancePolicy;->balance(Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v2

    goto :goto_0

    .line 109
    :pswitch_1
    sget-object v2, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-static {p0, p1, p2, v2, v0}, Lcom/google/common/collect/BstRangeOps;->subTreeBeyondRangeToSide(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v0

    .line 110
    goto :goto_1

    .line 116
    .end local v0           #left:Lcom/google/common/collect/BstNode;,"TN;"
    .end local v1           #right:Lcom/google/common/collect/BstNode;,"TN;"
    :cond_1
    invoke-virtual {p4, p3}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v2

    invoke-static {p0, p1, p2, p3, v2}, Lcom/google/common/collect/BstRangeOps;->subTreeBeyondRangeToSide(Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstBalancePolicy;Lcom/google/common/collect/BstNodeFactory;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)Lcom/google/common/collect/BstNode;

    move-result-object v2

    goto :goto_0

    .line 104
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static totalBeyondRangeToSide(Lcom/google/common/collect/BstAggregate;Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)J
    .locals 4
    .parameter
    .end parameter
    .parameter
    .end parameter
    .parameter "side"
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;>(",
            "Lcom/google/common/collect/BstAggregate",
            "<-TN;>;",
            "Lcom/google/common/collect/GeneralRange",
            "<TK;>;",
            "Lcom/google/common/collect/BstSide;",
            "TN;)J"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, aggregate:Lcom/google/common/collect/BstAggregate;,"Lcom/google/common/collect/BstAggregate<-TN;>;"
    .local p1, range:Lcom/google/common/collect/GeneralRange;,"Lcom/google/common/collect/GeneralRange<TK;>;"
    .local p3, root:Lcom/google/common/collect/BstNode;,"TN;"
    const-wide/16 v0, 0x0

    .line 58
    .local v0, accum:J
    :goto_0
    if-eqz p3, :cond_1

    .line 59
    invoke-virtual {p3}, Lcom/google/common/collect/BstNode;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2, p2}, Lcom/google/common/collect/BstRangeOps;->beyond(Lcom/google/common/collect/GeneralRange;Ljava/lang/Object;Lcom/google/common/collect/BstSide;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 60
    invoke-interface {p0, p3}, Lcom/google/common/collect/BstAggregate;->entryValue(Lcom/google/common/collect/BstNode;)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 61
    invoke-virtual {p3, p2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object v2

    invoke-interface {p0, v2}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 62
    invoke-virtual {p2}, Lcom/google/common/collect/BstSide;->other()Lcom/google/common/collect/BstSide;

    move-result-object v2

    invoke-virtual {p3, v2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {p3, p2}, Lcom/google/common/collect/BstNode;->childOrNull(Lcom/google/common/collect/BstSide;)Lcom/google/common/collect/BstNode;

    move-result-object p3

    goto :goto_0

    .line 67
    :cond_1
    return-wide v0
.end method

.method public static totalInRange(Lcom/google/common/collect/BstAggregate;Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstNode;)J
    .locals 4
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
            "<K:",
            "Ljava/lang/Object;",
            "N:",
            "Lcom/google/common/collect/BstNode",
            "<TK;TN;>;>(",
            "Lcom/google/common/collect/BstAggregate",
            "<-TN;>;",
            "Lcom/google/common/collect/GeneralRange",
            "<TK;>;TN;)J"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, aggregate:Lcom/google/common/collect/BstAggregate;,"Lcom/google/common/collect/BstAggregate<-TN;>;"
    .local p1, range:Lcom/google/common/collect/GeneralRange;,"Lcom/google/common/collect/GeneralRange<TK;>;"
    .local p2, root:Lcom/google/common/collect/BstNode;,"TN;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/google/common/collect/GeneralRange;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 42
    :cond_0
    const-wide/16 v0, 0x0

    .line 51
    :cond_1
    :goto_0
    return-wide v0

    .line 44
    :cond_2
    invoke-interface {p0, p2}, Lcom/google/common/collect/BstAggregate;->treeValue(Lcom/google/common/collect/BstNode;)J

    move-result-wide v0

    .line 45
    .local v0, total:J
    invoke-virtual {p1}, Lcom/google/common/collect/GeneralRange;->hasLowerBound()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 46
    sget-object v2, Lcom/google/common/collect/BstSide;->LEFT:Lcom/google/common/collect/BstSide;

    invoke-static {p0, p1, v2, p2}, Lcom/google/common/collect/BstRangeOps;->totalBeyondRangeToSide(Lcom/google/common/collect/BstAggregate;Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 48
    :cond_3
    invoke-virtual {p1}, Lcom/google/common/collect/GeneralRange;->hasUpperBound()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 49
    sget-object v2, Lcom/google/common/collect/BstSide;->RIGHT:Lcom/google/common/collect/BstSide;

    invoke-static {p0, p1, v2, p2}, Lcom/google/common/collect/BstRangeOps;->totalBeyondRangeToSide(Lcom/google/common/collect/BstAggregate;Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/BstSide;Lcom/google/common/collect/BstNode;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    goto :goto_0
.end method
