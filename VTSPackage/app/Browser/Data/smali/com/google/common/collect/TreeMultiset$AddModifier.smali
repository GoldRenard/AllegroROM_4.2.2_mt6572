.class final Lcom/google/common/collect/TreeMultiset$AddModifier;
.super Lcom/google/common/collect/TreeMultiset$MultisetModifier;
.source "TreeMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/TreeMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AddModifier"
.end annotation


# instance fields
.field private final countToAdd:I

.field final synthetic this$0:Lcom/google/common/collect/TreeMultiset;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/TreeMultiset;I)V
    .locals 1
    .parameter
    .parameter "countToAdd"

    .prologue
    .line 481
    .local p0, this:Lcom/google/common/collect/TreeMultiset$AddModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.AddModifier;"
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AddModifier;->this$0:Lcom/google/common/collect/TreeMultiset;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/TreeMultiset$MultisetModifier;-><init>(Lcom/google/common/collect/TreeMultiset;Lcom/google/common/collect/TreeMultiset$1;)V

    .line 482
    if-lez p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 483
    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AddModifier;->countToAdd:I

    .line 484
    return-void

    .line 482
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
    .line 478
    .local p0, this:Lcom/google/common/collect/TreeMultiset$AddModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.AddModifier;"
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AddModifier;-><init>(Lcom/google/common/collect/TreeMultiset;I)V

    return-void
.end method


# virtual methods
.method newCount(I)I
    .locals 2
    .parameter "oldCount"

    .prologue
    .line 488
    .local p0, this:Lcom/google/common/collect/TreeMultiset$AddModifier;,"Lcom/google/common/collect/TreeMultiset<TE;>.AddModifier;"
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AddModifier;->countToAdd:I

    const v1, 0x7fffffff

    sub-int/2addr v1, p1

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Cannot add this many elements"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 489
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AddModifier;->countToAdd:I

    add-int/2addr v0, p1

    return v0

    .line 488
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
