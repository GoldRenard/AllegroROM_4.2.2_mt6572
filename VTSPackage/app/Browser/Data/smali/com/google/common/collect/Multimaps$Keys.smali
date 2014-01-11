.class abstract Lcom/google/common/collect/Multimaps$Keys;
.super Lcom/google/common/collect/AbstractMultiset;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Keys"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Multimaps$Keys$KeysEntrySet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractMultiset",
        "<TK;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1861
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    invoke-direct {p0}, Lcom/google/common/collect/AbstractMultiset;-><init>()V

    .line 1900
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1999
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->clear()V

    .line 2000
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .parameter "element"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 1940
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public count(Ljava/lang/Object;)I
    .locals 4
    .parameter "element"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    const/4 v2, 0x0

    .line 1954
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v3

    invoke-interface {v3, p1}, Lcom/google/common/collect/Multimap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1955
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 1956
    .local v1, values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    if-nez v1, :cond_1

    .line 1962
    .end local v1           #values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :cond_0
    :goto_0
    return v2

    .line 1956
    .restart local v1       #values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/Collection;->size()I
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    goto :goto_0

    .line 1959
    .end local v1           #values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :catch_0
    move-exception v0

    .line 1960
    .local v0, e:Ljava/lang/ClassCastException;
    goto :goto_0

    .line 1961
    .end local v0           #e:Ljava/lang/ClassCastException;
    :catch_1
    move-exception v0

    .line 1962
    .local v0, e:Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method createEntrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TK;>;>;"
        }
    .end annotation

    .prologue
    .line 1897
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    new-instance v0, Lcom/google/common/collect/Multimaps$Keys$KeysEntrySet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$Keys$KeysEntrySet;-><init>(Lcom/google/common/collect/Multimaps$Keys;)V

    return-object v0
.end method

.method distinctElements()I
    .locals 1

    .prologue
    .line 1893
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public elementSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 2003
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method entryIterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TK;>;>;"
        }
    .end annotation

    .prologue
    .line 1865
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1867
    .local v0, backingIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TK;Ljava/util/Collection<TV;>;>;>;"
    new-instance v1, Lcom/google/common/collect/Multimaps$Keys$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/Multimaps$Keys$1;-><init>(Lcom/google/common/collect/Multimaps$Keys;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 1944
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v1, Lcom/google/common/collect/Multimaps$Keys$2;

    invoke-direct {v1, p0}, Lcom/google/common/collect/Multimaps$Keys$2;-><init>(Lcom/google/common/collect/Multimaps$Keys;)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method abstract multimap()Lcom/google/common/collect/Multimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;"
        }
    .end annotation
.end method

.method public remove(Ljava/lang/Object;I)I
    .locals 7
    .parameter "element"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "occurrences"
    .end parameter

    .prologue
    .local p0, this:Lcom/google/common/collect/Multimaps$Keys;,"Lcom/google/common/collect/Multimaps$Keys<TK;TV;>;"
    const/4 v6, 0x0

    .line 1967
    if-ltz p2, :cond_1

    const/4 v5, 0x1

    :goto_0
    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1968
    if-nez p2, :cond_2

    .line 1969
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$Keys;->count(Ljava/lang/Object;)I

    move-result v6

    .line 1995
    :cond_0
    :goto_1
    return v6

    :cond_1
    move v5, v6

    .line 1967
    goto :goto_0

    .line 1974
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Keys;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1981
    .local v4, values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    if-eqz v4, :cond_0

    .line 1985
    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v3

    .line 1986
    .local v3, oldCount:I
    if-lt p2, v3, :cond_4

    .line 1987
    invoke-interface {v4}, Ljava/util/Collection;->clear()V

    :cond_3
    move v6, v3

    .line 1995
    goto :goto_1

    .line 1975
    .end local v3           #oldCount:I
    .end local v4           #values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :catch_0
    move-exception v0

    .line 1976
    .local v0, e:Ljava/lang/ClassCastException;
    goto :goto_1

    .line 1977
    .end local v0           #e:Ljava/lang/ClassCastException;
    :catch_1
    move-exception v0

    .line 1978
    .local v0, e:Ljava/lang/NullPointerException;
    goto :goto_1

    .line 1989
    .end local v0           #e:Ljava/lang/NullPointerException;
    .restart local v3       #oldCount:I
    .restart local v4       #values:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :cond_4
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1990
    .local v2, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<TV;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    if-ge v1, p2, :cond_3

    .line 1991
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1992
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 1990
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method
