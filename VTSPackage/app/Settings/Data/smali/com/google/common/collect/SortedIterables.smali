.class final Lcom/google/common/collect/SortedIterables;
.super Ljava/lang/Object;
.source "SortedIterables.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<*>;",
            "Ljava/lang/Iterable",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    .local p1, elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    instance-of v2, p1, Ljava/util/SortedSet;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 50
    check-cast v1, Ljava/util/SortedSet;

    .line 51
    .local v1, sortedSet:Ljava/util/SortedSet;,"Ljava/util/SortedSet<*>;"
    invoke-interface {v1}, Ljava/util/SortedSet;->comparator()Ljava/util/Comparator;

    move-result-object v0

    .line 52
    .local v0, comparator2:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    if-nez v0, :cond_0

    .line 53
    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v0

    .line 60
    .end local v1           #sortedSet:Ljava/util/SortedSet;,"Ljava/util/SortedSet<*>;"
    .end local p1           #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    :cond_0
    :goto_0
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2

    .line 55
    .end local v0           #comparator2:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    .restart local p1       #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    :cond_1
    instance-of v2, p1, Lcom/google/common/collect/SortedIterable;

    if-eqz v2, :cond_2

    .line 56
    check-cast p1, Lcom/google/common/collect/SortedIterable;

    .end local p1           #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    invoke-interface {p1}, Lcom/google/common/collect/SortedIterable;->comparator()Ljava/util/Comparator;

    move-result-object v0

    .restart local v0       #comparator2:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    goto :goto_0

    .line 58
    .end local v0           #comparator2:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    .restart local p1       #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    :cond_2
    const/4 v0, 0x0

    .restart local v0       #comparator2:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    goto :goto_0
.end method

.method static singletonEntries(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TE;>;)",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 188
    .local p0, set:Ljava/util/Collection;,"Ljava/util/Collection<TE;>;"
    new-instance v0, Lcom/google/common/collect/SortedIterables$2;

    invoke-direct {v0}, Lcom/google/common/collect/SortedIterables$2;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/collect/Collections2;->transform(Ljava/util/Collection;Lcom/google/common/base/Function;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public static sortedCounts(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/Collection;
    .locals 12
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<-TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;)",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    .local p1, elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TE;>;"
    instance-of v10, p1, Lcom/google/common/collect/Multiset;

    if-eqz v10, :cond_1

    move-object v6, p1

    .line 136
    check-cast v6, Lcom/google/common/collect/Multiset;

    .line 137
    .local v6, multiset:Lcom/google/common/collect/Multiset;,"Lcom/google/common/collect/Multiset<TE;>;"
    invoke-static {p0, p1}, Lcom/google/common/collect/SortedIterables;->hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 138
    invoke-interface {v6}, Lcom/google/common/collect/Multiset;->entrySet()Ljava/util/Set;

    move-result-object v3

    .line 184
    .end local v6           #multiset:Lcom/google/common/collect/Multiset;,"Lcom/google/common/collect/Multiset<TE;>;"
    :goto_0
    return-object v3

    .line 140
    .restart local v6       #multiset:Lcom/google/common/collect/Multiset;,"Lcom/google/common/collect/Multiset<TE;>;"
    :cond_0
    invoke-interface {v6}, Lcom/google/common/collect/Multiset;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-static {v10}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v3

    .line 141
    .local v3, entries:Ljava/util/List;,"Ljava/util/List<Lcom/google/common/collect/Multiset$Entry<TE;>;>;"
    invoke-static {p0}, Lcom/google/common/collect/Ordering;->from(Ljava/util/Comparator;)Lcom/google/common/collect/Ordering;

    move-result-object v10

    new-instance v11, Lcom/google/common/collect/SortedIterables$1;

    invoke-direct {v11}, Lcom/google/common/collect/SortedIterables$1;-><init>()V

    invoke-virtual {v10, v11}, Lcom/google/common/collect/Ordering;->onResultOf(Lcom/google/common/base/Function;)Lcom/google/common/collect/Ordering;

    move-result-object v10

    invoke-static {v3, v10}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_0

    .line 149
    .end local v3           #entries:Ljava/util/List;,"Ljava/util/List<Lcom/google/common/collect/Multiset$Entry<TE;>;>;"
    .end local v6           #multiset:Lcom/google/common/collect/Multiset;,"Lcom/google/common/collect/Multiset<TE;>;"
    :cond_1
    instance-of v10, p1, Ljava/util/Set;

    if-eqz v10, :cond_3

    .line 151
    invoke-static {p0, p1}, Lcom/google/common/collect/SortedIterables;->hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z

    move-result v10

    if-eqz v10, :cond_2

    move-object v8, p1

    .line 152
    check-cast v8, Ljava/util/Collection;

    .line 158
    .local v8, sortedElements:Ljava/util/Collection;,"Ljava/util/Collection<TE;>;"
    :goto_1
    invoke-static {v8}, Lcom/google/common/collect/SortedIterables;->singletonEntries(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v3

    goto :goto_0

    .line 154
    .end local v8           #sortedElements:Ljava/util/Collection;,"Ljava/util/Collection<TE;>;"
    :cond_2
    invoke-static {p1}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v5

    .line 155
    .local v5, list:Ljava/util/List;,"Ljava/util/List<TE;>;"
    invoke-static {v5, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 156
    move-object v8, v5

    .restart local v8       #sortedElements:Ljava/util/Collection;,"Ljava/util/Collection<TE;>;"
    goto :goto_1

    .line 159
    .end local v5           #list:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .end local v8           #sortedElements:Ljava/util/Collection;,"Ljava/util/Collection<TE;>;"
    :cond_3
    invoke-static {p0, p1}, Lcom/google/common/collect/SortedIterables;->hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 160
    const/4 v0, 0x0

    .line 161
    .local v0, current:Ljava/lang/Object;,"TE;"
    const/4 v1, 0x0

    .line 162
    .local v1, currentCount:I
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v9

    .line 163
    .local v9, sortedEntries:Ljava/util/List;,"Ljava/util/List<Lcom/google/common/collect/Multiset$Entry<TE;>;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .end local v0           #current:Ljava/lang/Object;,"TE;"
    .local v4, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 164
    .local v2, e:Ljava/lang/Object;,"TE;"
    if-lez v1, :cond_5

    .line 165
    invoke-interface {p0, v0, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v10

    if-nez v10, :cond_4

    .line 166
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 168
    :cond_4
    invoke-static {v0, v1}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    move-object v0, v2

    .line 170
    .restart local v0       #current:Ljava/lang/Object;,"TE;"
    const/4 v1, 0x1

    goto :goto_2

    .line 173
    .end local v0           #current:Ljava/lang/Object;,"TE;"
    :cond_5
    move-object v0, v2

    .line 174
    .restart local v0       #current:Ljava/lang/Object;,"TE;"
    const/4 v1, 0x1

    goto :goto_2

    .line 177
    .end local v0           #current:Ljava/lang/Object;,"TE;"
    .end local v2           #e:Ljava/lang/Object;,"TE;"
    :cond_6
    if-lez v1, :cond_7

    .line 178
    invoke-static {v0, v1}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    move-object v3, v9

    .line 180
    goto :goto_0

    .line 182
    .end local v1           #currentCount:I
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v9           #sortedEntries:Ljava/util/List;,"Ljava/util/List<Lcom/google/common/collect/Multiset$Entry<TE;>;>;"
    :cond_8
    invoke-static {p0}, Lcom/google/common/collect/TreeMultiset;->create(Ljava/util/Comparator;)Lcom/google/common/collect/TreeMultiset;

    move-result-object v7

    .line 183
    .local v7, multiset:Lcom/google/common/collect/TreeMultiset;,"Lcom/google/common/collect/TreeMultiset<TE;>;"
    invoke-static {v7, p1}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 184
    invoke-virtual {v7}, Lcom/google/common/collect/TreeMultiset;->entrySet()Ljava/util/Set;

    move-result-object v3

    goto :goto_0
.end method

.method public static sortedCounts(Ljava/util/Comparator;Ljava/util/Iterator;)Ljava/util/Collection;
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<-TE;>;",
            "Ljava/util/Iterator",
            "<TE;>;)",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    .local p1, elements:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    invoke-static {p0}, Lcom/google/common/collect/TreeMultiset;->create(Ljava/util/Comparator;)Lcom/google/common/collect/TreeMultiset;

    move-result-object v0

    .line 125
    .local v0, multiset:Lcom/google/common/collect/TreeMultiset;,"Lcom/google/common/collect/TreeMultiset<TE;>;"
    invoke-static {v0, p1}, Lcom/google/common/collect/Iterators;->addAll(Ljava/util/Collection;Ljava/util/Iterator;)Z

    .line 126
    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset;->entrySet()Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public static sortedUnique(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/Collection;
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<-TE;>;",
            "Ljava/lang/Iterable",
            "<TE;>;)",
            "Ljava/util/Collection",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    .local p1, elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TE;>;"
    instance-of v2, p1, Lcom/google/common/collect/Multiset;

    if-eqz v2, :cond_0

    .line 83
    check-cast p1, Lcom/google/common/collect/Multiset;

    .end local p1           #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TE;>;"
    invoke-interface {p1}, Lcom/google/common/collect/Multiset;->elementSet()Ljava/util/Set;

    move-result-object p1

    .line 85
    .restart local p1       #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TE;>;"
    :cond_0
    instance-of v2, p1, Ljava/util/Set;

    if-eqz v2, :cond_2

    .line 86
    invoke-static {p0, p1}, Lcom/google/common/collect/SortedIterables;->hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 87
    check-cast p1, Ljava/util/Set;

    .line 97
    .end local p1           #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TE;>;"
    :goto_0
    return-object p1

    .line 89
    .restart local p1       #elements:Ljava/lang/Iterable;,"Ljava/lang/Iterable<TE;>;"
    :cond_1
    invoke-static {p1}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v1

    .line 90
    .local v1, list:Ljava/util/List;,"Ljava/util/List<TE;>;"
    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    move-object p1, v1

    .line 91
    goto :goto_0

    .line 93
    .end local v1           #list:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :cond_2
    invoke-static {p1}, Lcom/google/common/collect/Iterables;->toArray(Ljava/lang/Iterable;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 94
    .local v0, array:[Ljava/lang/Object;,"[TE;"
    invoke-static {p0, p1}, Lcom/google/common/collect/SortedIterables;->hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 95
    invoke-static {v0, p0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 97
    :cond_3
    invoke-static {p0, v0}, Lcom/google/common/collect/SortedIterables;->uniquifySortedArray(Ljava/util/Comparator;[Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object p1

    goto :goto_0
.end method

.method public static sortedUnique(Ljava/util/Comparator;Ljava/util/Iterator;)Ljava/util/Collection;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<-TE;>;",
            "Ljava/util/Iterator",
            "<TE;>;)",
            "Ljava/util/Collection",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    .local p1, elements:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    invoke-static {p0}, Lcom/google/common/collect/Sets;->newTreeSet(Ljava/util/Comparator;)Ljava/util/TreeSet;

    move-result-object v0

    .line 71
    .local v0, sortedSet:Ljava/util/SortedSet;,"Ljava/util/SortedSet<TE;>;"
    invoke-static {v0, p1}, Lcom/google/common/collect/Iterators;->addAll(Ljava/util/Collection;Ljava/util/Iterator;)Z

    .line 72
    return-object v0
.end method

.method private static uniquifySortedArray(Ljava/util/Comparator;[Ljava/lang/Object;)Ljava/util/Collection;
    .locals 6
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<-TE;>;[TE;)",
            "Ljava/util/Collection",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TE;>;"
    .local p1, array:[Ljava/lang/Object;,"[TE;"
    array-length v4, p1

    if-nez v4, :cond_0

    .line 103
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v4

    .line 115
    :goto_0
    return-object v4

    .line 105
    :cond_0
    const/4 v2, 0x1

    .line 106
    .local v2, length:I
    const/4 v1, 0x1

    .local v1, i:I
    :goto_1
    array-length v4, p1

    if-ge v1, v4, :cond_2

    .line 107
    aget-object v4, p1, v1

    add-int/lit8 v5, v2, -0x1

    aget-object v5, p1, v5

    invoke-interface {p0, v4, v5}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 108
    .local v0, cmp:I
    if-eqz v0, :cond_1

    .line 109
    add-int/lit8 v3, v2, 0x1

    .end local v2           #length:I
    .local v3, length:I
    aget-object v4, p1, v1

    aput-object v4, p1, v2

    move v2, v3

    .line 106
    .end local v3           #length:I
    .restart local v2       #length:I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 112
    .end local v0           #cmp:I
    :cond_2
    array-length v4, p1

    if-ge v2, v4, :cond_3

    .line 113
    invoke-static {p1, v2}, Lcom/google/common/collect/ObjectArrays;->arraysCopyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    .line 115
    :cond_3
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    goto :goto_0
.end method
