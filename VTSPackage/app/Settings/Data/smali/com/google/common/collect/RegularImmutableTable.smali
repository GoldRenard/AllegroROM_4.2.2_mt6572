.class abstract Lcom/google/common/collect/RegularImmutableTable;
.super Lcom/google/common/collect/ImmutableTable;
.source "RegularImmutableTable.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,
        Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableTable",
        "<TR;TC;TV;>;"
    }
.end annotation


# static fields
.field private static final GET_VALUE_FUNCTION:Lcom/google/common/base/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Function",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final cellSet:Lcom/google/common/collect/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;"
        }
    .end annotation
.end field

.field private volatile transient valueList:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    new-instance v0, Lcom/google/common/collect/RegularImmutableTable$1;

    invoke-direct {v0}, Lcom/google/common/collect/RegularImmutableTable$1;-><init>()V

    sput-object v0, Lcom/google/common/collect/RegularImmutableTable;->GET_VALUE_FUNCTION:Lcom/google/common/base/Function;

    return-void
.end method

.method private constructor <init>(Lcom/google/common/collect/ImmutableSet;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    .local p1, cellSet:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableTable;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableTable;->cellSet:Lcom/google/common/collect/ImmutableSet;

    .line 47
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/RegularImmutableTable$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 42
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/RegularImmutableTable;-><init>(Lcom/google/common/collect/ImmutableSet;)V

    return-void
.end method

.method static final forCells(Ljava/lang/Iterable;)Lcom/google/common/collect/RegularImmutableTable;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            "C:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;)",
            "Lcom/google/common/collect/RegularImmutableTable",
            "<TR;TC;TV;>;"
        }
    .end annotation

    .prologue
    .local p0, cells:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    const/4 v0, 0x0

    .line 122
    invoke-static {p0, v0, v0}, Lcom/google/common/collect/RegularImmutableTable;->forCellsInternal(Ljava/lang/Iterable;Ljava/util/Comparator;Ljava/util/Comparator;)Lcom/google/common/collect/RegularImmutableTable;

    move-result-object v0

    return-object v0
.end method

.method static final forCells(Ljava/util/List;Ljava/util/Comparator;Ljava/util/Comparator;)Lcom/google/common/collect/RegularImmutableTable;
    .locals 2
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
            "<R:",
            "Ljava/lang/Object;",
            "C:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;",
            "Ljava/util/Comparator",
            "<-TR;>;",
            "Ljava/util/Comparator",
            "<-TC;>;)",
            "Lcom/google/common/collect/RegularImmutableTable",
            "<TR;TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, cells:Ljava/util/List;,"Ljava/util/List<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    .local p1, rowComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TR;>;"
    .local p2, columnComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TC;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    if-nez p1, :cond_0

    if-eqz p2, :cond_1

    .line 103
    :cond_0
    new-instance v0, Lcom/google/common/collect/RegularImmutableTable$2;

    invoke-direct {v0, p1, p2}, Lcom/google/common/collect/RegularImmutableTable$2;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    .line 115
    .local v0, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 117
    .end local v0           #comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    :cond_1
    invoke-static {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableTable;->forCellsInternal(Ljava/lang/Iterable;Ljava/util/Comparator;Ljava/util/Comparator;)Lcom/google/common/collect/RegularImmutableTable;

    move-result-object v1

    return-object v1
.end method

.method private static final forCellsInternal(Ljava/lang/Iterable;Ljava/util/Comparator;Ljava/util/Comparator;)Lcom/google/common/collect/RegularImmutableTable;
    .locals 13
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
            "<R:",
            "Ljava/lang/Object;",
            "C:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;",
            "Ljava/util/Comparator",
            "<-TR;>;",
            "Ljava/util/Comparator",
            "<-TC;>;)",
            "Lcom/google/common/collect/RegularImmutableTable",
            "<TR;TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, cells:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    .local p1, rowComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TR;>;"
    .local p2, columnComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TC;>;"
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v2

    .line 134
    .local v2, cellSetBuilder:Lcom/google/common/collect/ImmutableSet$Builder;,"Lcom/google/common/collect/ImmutableSet$Builder<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v9

    .line 135
    .local v9, rowSpaceBuilder:Lcom/google/common/collect/ImmutableSet$Builder;,"Lcom/google/common/collect/ImmutableSet$Builder<TR;>;"
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v5

    .line 136
    .local v5, columnSpaceBuilder:Lcom/google/common/collect/ImmutableSet$Builder;,"Lcom/google/common/collect/ImmutableSet$Builder<TC;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Table$Cell;

    .line 137
    .local v0, cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;"
    invoke-virtual {v2, v0}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    .line 138
    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getRowKey()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    .line 139
    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getColumnKey()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v5, v10}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    goto :goto_0

    .line 141
    .end local v0           #cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;"
    :cond_0
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v1

    .line 143
    .local v1, cellSet:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    invoke-virtual {v9}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v8

    .line 144
    .local v8, rowSpace:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TR;>;"
    if-eqz p1, :cond_1

    .line 145
    invoke-static {v8}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v7

    .line 146
    .local v7, rowList:Ljava/util/List;,"Ljava/util/List<TR;>;"
    invoke-static {v7, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 147
    invoke-static {v7}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v8

    .line 149
    .end local v7           #rowList:Ljava/util/List;,"Ljava/util/List<TR;>;"
    :cond_1
    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v4

    .line 150
    .local v4, columnSpace:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TC;>;"
    if-eqz p2, :cond_2

    .line 151
    invoke-static {v4}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v3

    .line 152
    .local v3, columnList:Ljava/util/List;,"Ljava/util/List<TC;>;"
    invoke-static {v3, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 153
    invoke-static {v3}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v4

    .line 158
    .end local v3           #columnList:Ljava/util/List;,"Ljava/util/List<TC;>;"
    :cond_2
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v10

    invoke-virtual {v8}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v11

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v12

    mul-int/2addr v11, v12

    div-int/lit8 v11, v11, 0x2

    if-le v10, v11, :cond_3

    new-instance v10, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;

    invoke-direct {v10, v1, v8, v4}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;-><init>(Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;)V

    :goto_1
    return-object v10

    :cond_3
    new-instance v10, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;

    invoke-direct {v10, v1, v8, v4}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;-><init>(Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;)V

    goto :goto_1
.end method

.method private getValueFunction()Lcom/google/common/base/Function;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Function",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;TV;>;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    sget-object v0, Lcom/google/common/collect/RegularImmutableTable;->GET_VALUE_FUNCTION:Lcom/google/common/base/Function;

    return-object v0
.end method


# virtual methods
.method public final cellSet()Lcom/google/common/collect/ImmutableSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable;->cellSet:Lcom/google/common/collect/ImmutableSet;

    return-object v0
.end method

.method public bridge synthetic cellSet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 41
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable;->cellSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public final containsValue(Ljava/lang/Object;)Z
    .locals 1
    .parameter "value"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 78
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableCollection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final isEmpty()Z
    .locals 1

    .prologue
    .line 82
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public final size()I
    .locals 1

    .prologue
    .line 74
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable;->cellSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v0

    return v0
.end method

.method public final values()Lcom/google/common/collect/ImmutableCollection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableCollection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable;->valueList:Lcom/google/common/collect/ImmutableList;

    .line 66
    .local v0, result:Lcom/google/common/collect/ImmutableList;,"Lcom/google/common/collect/ImmutableList<TV;>;"
    if-nez v0, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable;->cellSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v1

    invoke-direct {p0}, Lcom/google/common/collect/RegularImmutableTable;->getValueFunction()Lcom/google/common/base/Function;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/common/collect/Iterables;->transform(Ljava/lang/Iterable;Lcom/google/common/base/Function;)Ljava/lang/Iterable;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/RegularImmutableTable;->valueList:Lcom/google/common/collect/ImmutableList;

    .line 70
    :cond_0
    return-object v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 41
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v0

    return-object v0
.end method
