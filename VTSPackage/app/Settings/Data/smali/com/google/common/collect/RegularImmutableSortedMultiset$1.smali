.class Lcom/google/common/collect/RegularImmutableSortedMultiset$1;
.super Lcom/google/common/collect/TransformedImmutableList;
.source "RegularImmutableSortedMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/TransformedImmutableList",
        "<",
        "Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry",
        "<TE;>;TE;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/RegularImmutableSortedMultiset;


# direct methods
.method constructor <init>(Lcom/google/common/collect/RegularImmutableSortedMultiset;Lcom/google/common/collect/ImmutableList;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 79
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset$1;,"Lcom/google/common/collect/RegularImmutableSortedMultiset.1;"
    .local p2, x0:Lcom/google/common/collect/ImmutableList;,"Lcom/google/common/collect/ImmutableList<Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;>;"
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset$1;->this$0:Lcom/google/common/collect/RegularImmutableSortedMultiset;

    invoke-direct {p0, p2}, Lcom/google/common/collect/TransformedImmutableList;-><init>(Lcom/google/common/collect/ImmutableList;)V

    return-void
.end method


# virtual methods
.method transform(Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry",
            "<TE;>;)TE;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset$1;,"Lcom/google/common/collect/RegularImmutableSortedMultiset.1;"
    .local p1, entry:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    invoke-virtual {p1}, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->getElement()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset$1;,"Lcom/google/common/collect/RegularImmutableSortedMultiset.1;"
    check-cast p1, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableSortedMultiset$1;->transform(Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
