.class final Lcom/google/common/collect/RegularImmutableSortedMultiset;
.super Lcom/google/common/collect/ImmutableSortedMultiset;
.source "RegularImmutableSortedMultiset.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/RegularImmutableSortedMultiset$2;,
        Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSortedMultiset",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final transient entries:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry",
            "<TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/google/common/collect/RegularImmutableSortedMultiset;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Ljava/util/Comparator;Lcom/google/common/collect/ImmutableList;)V
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TE;>;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry",
            "<TE;>;>;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    .local p1, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    .local p2, entries:Lcom/google/common/collect/ImmutableList;,"Lcom/google/common/collect/ImmutableList<Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;>;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/ImmutableSortedMultiset;-><init>(Ljava/util/Comparator;)V

    .line 74
    iput-object p2, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    .line 75
    sget-boolean v0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p2}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 76
    :cond_0
    return-void
.end method

.method static createFromSorted(Ljava/util/Comparator;Ljava/util/List;)Lcom/google/common/collect/RegularImmutableSortedMultiset;
    .locals 7
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<-TE;>;",
            "Ljava/util/List",
            "<+",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;)",
            "Lcom/google/common/collect/RegularImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    .local p1, entries:Ljava/util/List;,"Ljava/util/List<+Lcom/google/common/collect/Multiset$Entry<TE;>;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Lcom/google/common/collect/Lists;->newArrayListWithCapacity(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 61
    .local v2, newEntries:Ljava/util/List;,"Ljava/util/List<Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;>;"
    const/4 v3, 0x0

    .line 62
    .local v3, previous:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Multiset$Entry;

    .line 63
    .local v0, entry:Lcom/google/common/collect/Multiset$Entry;,"Lcom/google/common/collect/Multiset$Entry<TE;>;"
    new-instance v4, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v0}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v6

    invoke-direct {v4, v5, v6, v3}, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;-><init>(Ljava/lang/Object;ILcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;)V

    .end local v3           #previous:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    .local v4, previous:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v3, v4

    .end local v4           #previous:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    .restart local v3       #previous:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    goto :goto_0

    .line 66
    .end local v0           #entry:Lcom/google/common/collect/Multiset$Entry;,"Lcom/google/common/collect/Multiset$Entry<TE;>;"
    :cond_0
    new-instance v5, Lcom/google/common/collect/RegularImmutableSortedMultiset;

    invoke-static {v2}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Lcom/google/common/collect/RegularImmutableSortedMultiset;-><init>(Ljava/util/Comparator;Lcom/google/common/collect/ImmutableList;)V

    return-object v5
.end method

.method private createSubMultiset(II)Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 3
    .parameter "newFromIndex"
    .parameter "newToIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 194
    .end local p0           #this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    :goto_0
    return-object p0

    .line 191
    .restart local p0       #this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    :cond_0
    if-lt p1, p2, :cond_1

    .line 192
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->emptyMultiset(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object p0

    goto :goto_0

    .line 194
    :cond_1
    new-instance v0, Lcom/google/common/collect/RegularImmutableSortedMultiset;

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2, p1, p2}, Lcom/google/common/collect/ImmutableList;->subList(II)Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/RegularImmutableSortedMultiset;-><init>(Ljava/util/Comparator;Lcom/google/common/collect/ImmutableList;)V

    move-object p0, v0

    goto :goto_0
.end method


# virtual methods
.method public count(Ljava/lang/Object;)I
    .locals 7
    .parameter "element"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    const/4 v3, 0x0

    .line 140
    if-nez p1, :cond_0

    .line 148
    :goto_0
    return v3

    .line 144
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v4

    sget-object v5, Lcom/google/common/collect/SortedLists$KeyPresentBehavior;->ANY_PRESENT:Lcom/google/common/collect/SortedLists$KeyPresentBehavior;

    sget-object v6, Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;->INVERTED_INSERTION_INDEX:Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;

    invoke-static {v2, p1, v4, v5, v6}, Lcom/google/common/collect/SortedLists;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;Lcom/google/common/collect/SortedLists$KeyPresentBehavior;Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;)I

    move-result v1

    .line 146
    .local v1, index:I
    if-ltz v1, :cond_1

    iget-object v2, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    invoke-virtual {v2}, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->getCount()I
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1

    .line 147
    .end local v1           #index:I
    :catch_0
    move-exception v0

    .line 148
    .local v0, e:Ljava/lang/ClassCastException;
    goto :goto_0
.end method

.method createDescendingElementSet()Lcom/google/common/collect/ImmutableSortedSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    new-instance v0, Lcom/google/common/collect/RegularImmutableSortedSet;

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->reverse()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->reverseComparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    return-object v0
.end method

.method createElementSet()Lcom/google/common/collect/ImmutableSortedSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    new-instance v0, Lcom/google/common/collect/RegularImmutableSortedSet;

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    return-object v0
.end method

.method descendingEntryIterator()Lcom/google/common/collect/UnmodifiableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->reverse()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    return-object v0
.end method

.method distinctElements()I
    .locals 1

    .prologue
    .line 129
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method

.method elementList()Lcom/google/common/collect/ImmutableList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    new-instance v0, Lcom/google/common/collect/RegularImmutableSortedMultiset$1;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/RegularImmutableSortedMultiset$1;-><init>(Lcom/google/common/collect/RegularImmutableSortedMultiset;Lcom/google/common/collect/ImmutableList;)V

    return-object v0
.end method

.method entryIterator()Lcom/google/common/collect/UnmodifiableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic firstEntry()Lcom/google/common/collect/Multiset$Entry;
    .locals 1

    .prologue
    .line 35
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->firstEntry()Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    move-result-object v0

    return-object v0
.end method

.method public firstEntry()Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    return-object v0
.end method

.method public headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 6
    .parameter
    .parameter "boundType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 155
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    .local p1, upperBound:Ljava/lang/Object;,"TE;"
    sget-object v1, Lcom/google/common/collect/RegularImmutableSortedMultiset$2;->$SwitchMap$com$google$common$collect$BoundType:[I

    invoke-virtual {p2}, Lcom/google/common/collect/BoundType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 165
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 157
    :pswitch_0
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    sget-object v4, Lcom/google/common/collect/SortedLists$KeyPresentBehavior;->ANY_PRESENT:Lcom/google/common/collect/SortedLists$KeyPresentBehavior;

    sget-object v5, Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;->NEXT_HIGHER:Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;

    invoke-static {v1, v2, v3, v4, v5}, Lcom/google/common/collect/SortedLists;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;Lcom/google/common/collect/SortedLists$KeyPresentBehavior;Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;)I

    move-result v0

    .line 167
    .local v0, index:I
    :goto_0
    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->createSubMultiset(II)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v1

    return-object v1

    .line 161
    .end local v0           #index:I
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    sget-object v4, Lcom/google/common/collect/SortedLists$KeyPresentBehavior;->ANY_PRESENT:Lcom/google/common/collect/SortedLists$KeyPresentBehavior;

    sget-object v5, Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;->NEXT_LOWER:Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;

    invoke-static {v1, v2, v3, v4, v5}, Lcom/google/common/collect/SortedLists;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;Lcom/google/common/collect/SortedLists$KeyPresentBehavior;Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;)I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 163
    .restart local v0       #index:I
    goto :goto_0

    .line 155
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 35
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method

.method isPartialView()Z
    .locals 1

    .prologue
    .line 134
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->isPartialView()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic lastEntry()Lcom/google/common/collect/Multiset$Entry;
    .locals 1

    .prologue
    .line 35
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->lastEntry()Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    move-result-object v0

    return-object v0
.end method

.method public lastEntry()Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableSortedMultiset;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    return-object v0
.end method

.method public size()I
    .locals 6

    .prologue
    .line 121
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->firstEntry()Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    move-result-object v0

    .line 122
    .local v0, firstEntry:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->lastEntry()Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;

    move-result-object v1

    .line 123
    .local v1, lastEntry:Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;,"Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry<TE;>;"
    iget-wide v2, v1, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->cumulativeCount:J

    iget-wide v4, v0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->cumulativeCount:J

    sub-long/2addr v2, v4

    iget v4, v0, Lcom/google/common/collect/RegularImmutableSortedMultiset$CumulativeCountEntry;->count:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result v2

    return v2
.end method

.method public tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;
    .locals 6
    .parameter
    .parameter "boundType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/ImmutableSortedMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    .local p1, lowerBound:Ljava/lang/Object;,"TE;"
    sget-object v1, Lcom/google/common/collect/RegularImmutableSortedMultiset$2;->$SwitchMap$com$google$common$collect$BoundType:[I

    invoke-virtual {p2}, Lcom/google/common/collect/BoundType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 183
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 175
    :pswitch_0
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    sget-object v4, Lcom/google/common/collect/SortedLists$KeyPresentBehavior;->ANY_PRESENT:Lcom/google/common/collect/SortedLists$KeyPresentBehavior;

    sget-object v5, Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;->NEXT_LOWER:Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;

    invoke-static {v1, v2, v3, v4, v5}, Lcom/google/common/collect/SortedLists;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;Lcom/google/common/collect/SortedLists$KeyPresentBehavior;Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;)I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 185
    .local v0, index:I
    :goto_0
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->distinctElements()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->createSubMultiset(II)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v1

    return-object v1

    .line 179
    .end local v0           #index:I
    :pswitch_1
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->elementList()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    sget-object v4, Lcom/google/common/collect/SortedLists$KeyPresentBehavior;->ANY_PRESENT:Lcom/google/common/collect/SortedLists$KeyPresentBehavior;

    sget-object v5, Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;->NEXT_HIGHER:Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;

    invoke-static {v1, v2, v3, v4, v5}, Lcom/google/common/collect/SortedLists;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;Lcom/google/common/collect/SortedLists$KeyPresentBehavior;Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;)I

    move-result v0

    .line 181
    .restart local v0       #index:I
    goto :goto_0

    .line 173
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 35
    .local p0, this:Lcom/google/common/collect/RegularImmutableSortedMultiset;,"Lcom/google/common/collect/RegularImmutableSortedMultiset<TE;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableSortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/ImmutableSortedMultiset;

    move-result-object v0

    return-object v0
.end method
