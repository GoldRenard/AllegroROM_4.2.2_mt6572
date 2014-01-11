.class public final Lcom/google/common/collect/ArrayTable;
.super Ljava/lang/Object;
.source "ArrayTable.java"

# interfaces
.implements Lcom/google/common/collect/Table;
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/ArrayTable$1;,
        Lcom/google/common/collect/ArrayTable$Values;,
        Lcom/google/common/collect/ArrayTable$RowMapEntrySet;,
        Lcom/google/common/collect/ArrayTable$RowMap;,
        Lcom/google/common/collect/ArrayTable$RowEntrySet;,
        Lcom/google/common/collect/ArrayTable$Row;,
        Lcom/google/common/collect/ArrayTable$ColumnMapEntrySet;,
        Lcom/google/common/collect/ArrayTable$ColumnMap;,
        Lcom/google/common/collect/ArrayTable$ColumnEntrySet;,
        Lcom/google/common/collect/ArrayTable$Column;,
        Lcom/google/common/collect/ArrayTable$CellSet;
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
        "Ljava/lang/Object;",
        "Lcom/google/common/collect/Table",
        "<TR;TC;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final array:[[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[[TV;"
        }
    .end annotation
.end field

.field private transient cellSet:Lcom/google/common/collect/ArrayTable$CellSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>.CellSet;"
        }
    .end annotation
.end field

.field private final columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<TC;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final columnList:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<TC;>;"
        }
    .end annotation
.end field

.field private transient columnMap:Lcom/google/common/collect/ArrayTable$ColumnMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>.ColumnMap;"
        }
    .end annotation
.end field

.field private final rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<TR;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final rowList:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<TR;>;"
        }
    .end annotation
.end field

.field private transient rowMap:Lcom/google/common/collect/ArrayTable$RowMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>.RowMap;"
        }
    .end annotation
.end field

.field private transient values:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/common/collect/ArrayTable;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, table:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    const/4 v5, 0x0

    .line 181
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 182
    iget-object v2, p1, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    iput-object v2, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    .line 183
    iget-object v2, p1, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    iput-object v2, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    .line 184
    iget-object v2, p1, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    iput-object v2, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    .line 185
    iget-object v2, p1, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    iput-object v2, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    .line 187
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    iget-object v3, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v3

    filled-new-array {v2, v3}, [I

    move-result-object v2

    const-class v3, Ljava/lang/Object;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, [[Ljava/lang/Object;

    .line 188
    .local v0, copy:[[Ljava/lang/Object;,"[[TV;"
    iput-object v0, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    .line 189
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 190
    iget-object v2, p1, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    aget-object v2, v2, v1

    aget-object v3, v0, v1

    iget-object v4, p1, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    aget-object v4, v4, v1

    array-length v4, v4

    invoke-static {v2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 192
    :cond_0
    return-void
.end method

.method private constructor <init>(Lcom/google/common/collect/Table;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table",
            "<TR;TC;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, table:Lcom/google/common/collect/Table;,"Lcom/google/common/collect/Table<TR;TC;TV;>;"
    invoke-interface {p1}, Lcom/google/common/collect/Table;->rowKeySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {p1}, Lcom/google/common/collect/Table;->columnKeySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/common/collect/ArrayTable;-><init>(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    .line 178
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayTable;->putAll(Lcom/google/common/collect/Table;)V

    .line 179
    return-void
.end method

.method private constructor <init>(Ljava/lang/Iterable;Ljava/lang/Iterable;)V
    .locals 7
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+TR;>;",
            "Ljava/lang/Iterable",
            "<+TC;>;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, rowKeys:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TR;>;"
    .local p2, columnKeys:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TC;>;"
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 147
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 148
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    iput-object v4, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    .line 149
    invoke-static {p2}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    iput-object v4, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    .line 150
    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    move v4, v5

    :goto_0
    invoke-static {v4}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 151
    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    :goto_1
    invoke-static {v5}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 158
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v2

    .line 159
    .local v2, rowBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TR;Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 160
    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 159
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .end local v1           #i:I
    .end local v2           #rowBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TR;Ljava/lang/Integer;>;"
    :cond_0
    move v4, v6

    .line 150
    goto :goto_0

    :cond_1
    move v5, v6

    .line 151
    goto :goto_1

    .line 162
    .restart local v1       #i:I
    .restart local v2       #rowBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TR;Ljava/lang/Integer;>;"
    :cond_2
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v4

    iput-object v4, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    .line 164
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v0

    .line 165
    .local v0, columnBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TC;Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    :goto_3
    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 166
    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 165
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 168
    :cond_3
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v4

    iput-object v4, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    .line 171
    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v4

    iget-object v5, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v5

    filled-new-array {v4, v5}, [I

    move-result-object v4

    const-class v5, Ljava/lang/Object;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[Ljava/lang/Object;

    move-object v3, v4

    check-cast v3, [[Ljava/lang/Object;

    .line 173
    .local v3, tmpArray:[[Ljava/lang/Object;,"[[TV;"
    iput-object v3, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    .line 174
    return-void
.end method

.method static synthetic access$100(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/common/collect/ArrayTable;)[[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    return-object v0
.end method

.method static synthetic access$500(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ImmutableMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/common/collect/ArrayTable;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/ArrayTable;->getIndexed(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/google/common/collect/ArrayTable;)Lcom/google/common/collect/ArrayTable;
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
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>;)",
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, table:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    new-instance v0, Lcom/google/common/collect/ArrayTable;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ArrayTable;-><init>(Lcom/google/common/collect/ArrayTable;)V

    return-object v0
.end method

.method public static create(Lcom/google/common/collect/Table;)Lcom/google/common/collect/ArrayTable;
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
            "Lcom/google/common/collect/Table",
            "<TR;TC;TV;>;)",
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, table:Lcom/google/common/collect/Table;,"Lcom/google/common/collect/Table<TR;TC;TV;>;"
    new-instance v0, Lcom/google/common/collect/ArrayTable;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ArrayTable;-><init>(Lcom/google/common/collect/Table;)V

    return-object v0
.end method

.method public static create(Ljava/lang/Iterable;Ljava/lang/Iterable;)Lcom/google/common/collect/ArrayTable;
    .locals 1
    .parameter
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
            "<+TR;>;",
            "Ljava/lang/Iterable",
            "<+TC;>;)",
            "Lcom/google/common/collect/ArrayTable",
            "<TR;TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, rowKeys:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TR;>;"
    .local p1, columnKeys:Ljava/lang/Iterable;,"Ljava/lang/Iterable<+TC;>;"
    new-instance v0, Lcom/google/common/collect/ArrayTable;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/ArrayTable;-><init>(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    return-object v0
.end method

.method private getIndexed(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;
    .locals 2
    .parameter "rowIndex"
    .parameter "columnIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 338
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    goto :goto_0
.end method


# virtual methods
.method public at(II)Ljava/lang/Object;
    .locals 1
    .parameter "rowIndex"
    .parameter "columnIndex"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)TV;"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    aget-object v0, v0, p1

    aget-object v0, v0, p2

    return-object v0
.end method

.method public cellSet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 467
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->cellSet:Lcom/google/common/collect/ArrayTable$CellSet;

    .line 468
    .local v0, set:Lcom/google/common/collect/ArrayTable$CellSet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.CellSet;"
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/ArrayTable$CellSet;

    .end local v0           #set:Lcom/google/common/collect/ArrayTable$CellSet;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.CellSet;"
    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/ArrayTable$CellSet;-><init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V

    iput-object v0, p0, Lcom/google/common/collect/ArrayTable;->cellSet:Lcom/google/common/collect/ArrayTable$CellSet;

    :cond_0
    return-object v0
.end method

.method public clear()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 278
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public column(Ljava/lang/Object;)Ljava/util/Map;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)",
            "Ljava/util/Map",
            "<TR;TV;>;"
        }
    .end annotation

    .prologue
    .line 527
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, columnKey:Ljava/lang/Object;,"TC;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 529
    .local v0, columnIndex:Ljava/lang/Integer;
    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/google/common/collect/ArrayTable$Column;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/google/common/collect/ArrayTable$Column;-><init>(Lcom/google/common/collect/ArrayTable;I)V

    goto :goto_0
.end method

.method public columnKeyList()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<TC;>;"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public columnKeySet()Lcom/google/common/collect/ImmutableSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<TC;>;"
        }
    .end annotation

    .prologue
    .line 606
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic columnKeySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 80
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ArrayTable;->columnKeySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public columnMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TC;",
            "Ljava/util/Map",
            "<TR;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 613
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->columnMap:Lcom/google/common/collect/ArrayTable$ColumnMap;

    .line 614
    .local v0, map:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/ArrayTable$ColumnMap;

    .end local v0           #map:Lcom/google/common/collect/ArrayTable$ColumnMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.ColumnMap;"
    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/ArrayTable$ColumnMap;-><init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V

    iput-object v0, p0, Lcom/google/common/collect/ArrayTable;->columnMap:Lcom/google/common/collect/ArrayTable$ColumnMap;

    :cond_0
    return-object v0
.end method

.method public contains(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter "rowKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "columnKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 297
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ArrayTable;->containsRow(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p2}, Lcom/google/common/collect/ArrayTable;->containsColumn(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsColumn(Ljava/lang/Object;)Z
    .locals 1
    .parameter "columnKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 306
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsRow(Ljava/lang/Object;)Z
    .locals 1
    .parameter "rowKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 315
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 9
    .parameter "value"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 320
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    .local v0, arr$:[[Ljava/lang/Object;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    move v4, v3

    .end local v0           #arr$:[[Ljava/lang/Object;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v7, v0, v4

    .line 321
    .local v7, row:[Ljava/lang/Object;,"[TV;"
    move-object v1, v7

    .local v1, arr$:[Ljava/lang/Object;
    array-length v6, v1

    .local v6, len$:I
    const/4 v3, 0x0

    .end local v4           #i$:I
    .restart local v3       #i$:I
    :goto_1
    if-ge v3, v6, :cond_1

    aget-object v2, v1, v3

    .line 322
    .local v2, element:Ljava/lang/Object;,"TV;"
    invoke-static {p1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 323
    const/4 v8, 0x1

    .line 327
    .end local v1           #arr$:[Ljava/lang/Object;
    .end local v2           #element:Ljava/lang/Object;,"TV;"
    .end local v3           #i$:I
    .end local v6           #len$:I
    .end local v7           #row:[Ljava/lang/Object;,"[TV;"
    :goto_2
    return v8

    .line 321
    .restart local v1       #arr$:[Ljava/lang/Object;
    .restart local v2       #element:Ljava/lang/Object;,"TV;"
    .restart local v3       #i$:I
    .restart local v6       #len$:I
    .restart local v7       #row:[Ljava/lang/Object;,"[TV;"
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 320
    .end local v2           #element:Ljava/lang/Object;,"TV;"
    :cond_1
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3           #i$:I
    .restart local v4       #i$:I
    goto :goto_0

    .line 327
    .end local v1           #arr$:[Ljava/lang/Object;
    .end local v6           #len$:I
    .end local v7           #row:[Ljava/lang/Object;,"[TV;"
    :cond_2
    const/4 v8, 0x0

    goto :goto_2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "obj"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 432
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    instance-of v1, p1, Lcom/google/common/collect/Table;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 433
    check-cast v0, Lcom/google/common/collect/Table;

    .line 434
    .local v0, other:Lcom/google/common/collect/Table;,"Lcom/google/common/collect/Table<***>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ArrayTable;->cellSet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/common/collect/Table;->cellSet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 436
    .end local v0           #other:Lcom/google/common/collect/Table;,"Lcom/google/common/collect/Table<***>;"
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public erase(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .parameter "rowKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "columnKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    const/4 v2, 0x0

    .line 416
    iget-object v3, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v3, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 417
    .local v1, rowIndex:Ljava/lang/Integer;
    iget-object v3, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v3, p2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 418
    .local v0, columnIndex:Ljava/lang/Integer;
    if-eqz v1, :cond_0

    if-nez v0, :cond_1

    .line 421
    :cond_0
    :goto_0
    return-object v2

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p0, v3, v4, v2}, Lcom/google/common/collect/ArrayTable;->set(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_0
.end method

.method public eraseAll()V
    .locals 5

    .prologue
    .line 286
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    .local v0, arr$:[[Ljava/lang/Object;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 287
    .local v3, row:[Ljava/lang/Object;,"[TV;"
    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 286
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 289
    .end local v3           #row:[Ljava/lang/Object;,"[TV;"
    :cond_0
    return-void
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .parameter "rowKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "columnKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 332
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 333
    .local v1, rowIndex:Ljava/lang/Integer;
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, p2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 334
    .local v0, columnIndex:Ljava/lang/Integer;
    invoke-direct {p0, v1, v0}, Lcom/google/common/collect/ArrayTable;->getIndexed(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 440
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ArrayTable;->cellSet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 347
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
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
            "(TR;TC;TV;)TV;"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, rowKey:Ljava/lang/Object;,"TR;"
    .local p2, columnKey:Ljava/lang/Object;,"TC;"
    .local p3, value:Ljava/lang/Object;,"TV;"
    const/4 v8, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 358
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 361
    .local v1, rowIndex:Ljava/lang/Integer;
    if-eqz v1, :cond_0

    move v2, v3

    :goto_0
    const-string v5, "Row %s not in %s"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object p1, v6, v4

    iget-object v7, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    aput-object v7, v6, v3

    invoke-static {v2, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 362
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, p2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 363
    .local v0, columnIndex:Ljava/lang/Integer;
    if-eqz v0, :cond_1

    move v2, v3

    :goto_1
    const-string v5, "Column %s not in %s"

    new-array v6, v8, [Ljava/lang/Object;

    aput-object p2, v6, v4

    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    aput-object v4, v6, v3

    invoke-static {v2, v5, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 365
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0, v2, v3, p3}, Lcom/google/common/collect/ArrayTable;->set(IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .end local v0           #columnIndex:Ljava/lang/Integer;
    :cond_0
    move v2, v4

    .line 361
    goto :goto_0

    .restart local v0       #columnIndex:Ljava/lang/Integer;
    :cond_1
    move v2, v4

    .line 363
    goto :goto_1
.end method

.method public putAll(Lcom/google/common/collect/Table;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table",
            "<+TR;+TC;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 386
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, table:Lcom/google/common/collect/Table;,"Lcom/google/common/collect/Table<+TR;+TC;+TV;>;"
    invoke-interface {p1}, Lcom/google/common/collect/Table;->cellSet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Table$Cell;

    .line 387
    .local v0, cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<+TR;+TC;+TV;>;"
    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getRowKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getColumnKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lcom/google/common/collect/ArrayTable;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 389
    .end local v0           #cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<+TR;+TC;+TV;>;"
    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "rowKey"
    .parameter "columnKey"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 399
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public row(Ljava/lang/Object;)Ljava/util/Map;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)",
            "Ljava/util/Map",
            "<TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 673
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, rowKey:Ljava/lang/Object;,"TR;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 675
    .local v0, rowIndex:Ljava/lang/Integer;
    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/google/common/collect/ArrayTable$Row;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/google/common/collect/ArrayTable$Row;-><init>(Lcom/google/common/collect/ArrayTable;I)V

    goto :goto_0
.end method

.method public rowKeyList()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 199
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public rowKeySet()Lcom/google/common/collect/ImmutableSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 752
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic rowKeySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 80
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ArrayTable;->rowKeySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public rowMap()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 759
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowMap:Lcom/google/common/collect/ArrayTable$RowMap;

    .line 760
    .local v0, map:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/ArrayTable$RowMap;

    .end local v0           #map:Lcom/google/common/collect/ArrayTable$RowMap;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>.RowMap;"
    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/ArrayTable$RowMap;-><init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V

    iput-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowMap:Lcom/google/common/collect/ArrayTable$RowMap;

    :cond_0
    return-object v0
.end method

.method public set(IILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .parameter "rowIndex"
    .end parameter
    .parameter "columnIndex"
    .end parameter
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IITV;)TV;"
        }
    .end annotation

    .prologue
    .line 244
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p3, value:Ljava/lang/Object;,"TV;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    aget-object v1, v1, p1

    aget-object v0, v1, p2

    .line 245
    .local v0, oldValue:Ljava/lang/Object;,"TV;"
    iget-object v1, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    aget-object v1, v1, p1

    aput-object p3, v1, p2

    .line 246
    return-object v0
.end method

.method public size()I
    .locals 2

    .prologue
    .line 428
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public toArray(Ljava/lang/Class;)[[Ljava/lang/Object;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TV;>;)[[TV;"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    .local p1, valueClass:Ljava/lang/Class;,"Ljava/lang/Class<TV;>;"
    const/4 v5, 0x0

    .line 262
    const/4 v2, 0x2

    new-array v2, v2, [I

    iget-object v3, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v3

    aput v3, v2, v5

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->columnList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v4

    aput v4, v2, v3

    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, [[Ljava/lang/Object;

    .line 264
    .local v0, copy:[[Ljava/lang/Object;,"[[TV;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->rowList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 265
    iget-object v2, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    aget-object v2, v2, v1

    aget-object v3, v0, v1

    iget-object v4, p0, Lcom/google/common/collect/ArrayTable;->array:[[Ljava/lang/Object;

    aget-object v4, v4, v1

    array-length v4, v4

    invoke-static {v2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 264
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 267
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 447
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ArrayTable;->rowMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 817
    .local p0, this:Lcom/google/common/collect/ArrayTable;,"Lcom/google/common/collect/ArrayTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/ArrayTable;->values:Ljava/util/Collection;

    .line 818
    .local v0, v:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/ArrayTable$Values;

    .end local v0           #v:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/ArrayTable$Values;-><init>(Lcom/google/common/collect/ArrayTable;Lcom/google/common/collect/ArrayTable$1;)V

    iput-object v0, p0, Lcom/google/common/collect/ArrayTable;->values:Ljava/util/Collection;

    :cond_0
    return-object v0
.end method
