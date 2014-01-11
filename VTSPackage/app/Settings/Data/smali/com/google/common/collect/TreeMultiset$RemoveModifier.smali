.class final Lcom/google/common/collect/TreeMultiset$RemoveModifier;
.super Lcom/google/common/collect/TreeMultiset$MultisetModifier;
.source "TreeMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/TreeMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RemoveModifier"
.end annotation


# instance fields
.field private final countToRemove:I

.field final synthetic this$0:Lcom/google/common/collect/TreeMultiset;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/TreeMultiset;I)V
    .locals 1
    .parameter
    .parameter "countToRemove"

    .prologue
    .line 496
    .local p0, this:Lcom/google/common/collect/TreeMultiset$RemoveModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.RemoveModifier;"
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$RemoveModifier;->this$0:Lcom/google/common/collect/TreeMultiset;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/TreeMultiset$MultisetModifier;-><init>(Lcom/google/common/collect/TreeMultiset;Lcom/google/common/collect/TreeMultiset$1;)V

    .line 497
    if-lez p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 498
    iput p2, p0, Lcom/google/common/collect/TreeMultiset$RemoveModifier;->countToRemove:I

    .line 499
    return-void

    .line 497
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/TreeMultiset;ILcom/google/common/collect/TreeMultiset$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 493
    .local p0, this:Lcom/google/common/collect/TreeMultiset$RemoveModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.RemoveModifier;"
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$RemoveModifier;-><init>(Lcom/google/common/collect/TreeMultiset;I)V

    return-void
.end method


# virtual methods
.method newCount(I)I
    .locals 2
    .parameter "oldCount"

    .prologue
    .line 503
    .local p0, this:Lcom/google/common/collect/TreeMultiset$RemoveModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.RemoveModifier;"
    const/4 v0, 0x0

    iget v1, p0, Lcom/google/common/collect/TreeMultiset$RemoveModifier;->countToRemove:I

    sub-int v1, p1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method
