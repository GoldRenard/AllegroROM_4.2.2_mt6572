.class final Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;
.super Lcom/google/common/collect/Multisets$AbstractEntry;
.source "RegularImmutableSortedMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/RegularImmutableSortedMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CumulativeCountEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Multisets$AbstractEntry",
        "<TE;>;"
    }
.end annotation


# instance fields
.field final count:I

.field final cumulativeCount:J

.field final element:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TE;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;ILcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;)V
    .locals 4
    .parameter
    .end parameter
    .parameter "count"
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I",
            "Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    .local p1, element:Ljava/lang/Object;,"TE;"
    .local p3, previous:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    invoke-direct {p0}, Lcom/google/common/collect/Multisets$AbstractEntry;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->element:Ljava/lang/Object;

    .line 43
    iput p2, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->count:I

    .line 44
    int-to-long v2, p2

    if-nez p3, :cond_0

    const-wide/16 v0, 0x0

    :goto_0
    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->cumulativeCount:J

    .line 45
    return-void

    .line 44
    :cond_0
    iget-wide v0, p3, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->cumulativeCount:J

    goto :goto_0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 54
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    iget v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->count:I

    return v0
.end method

.method public getElement()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->element:Ljava/lang/Object;

    return-object v0
.end method
