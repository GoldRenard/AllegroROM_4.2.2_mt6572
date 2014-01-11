.class final Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;
.super Lcom/google/common/collect/RegularImmutableTable;
.source "RegularImmutableTable.java"


# annotations
.annotation build Lcom/google/common/annotations/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/RegularImmutableTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DenseImmutableTable"
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
        "Lcom/google/common/collect/RegularImmutableTable",
        "<TR;TC;TV;>;"
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# instance fields
.field private final columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableBiMap",
            "<TC;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile transient columnMap:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<TC;",
            "Ljava/util/Map",
            "<TR;TV;>;>;"
        }
    .end annotation
.end field

.field private final rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableBiMap",
            "<TR;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile transient rowMap:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;"
        }
    .end annotation
.end field

.field private final values:[[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[[TV;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;)V
    .locals 12
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/google/common/collect/Table$Cell",
            "<TR;TC;TV;>;>;",
            "Lcom/google/common/collect/ImmutableSet",
            "<TR;>;",
            "Lcom/google/common/collect/ImmutableSet",
            "<TC;>;)V"
        }
    .end annotation

    .prologue
    .line 295
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    .local p1, cellSet:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    .local p2, rowSpace:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TR;>;"
    .local p3, columnSpace:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TC;>;"
    const/4 v8, 0x0

    invoke-direct {p0, p1, v8}, Lcom/google/common/collect/RegularImmutableTable;-><init>(Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/RegularImmutableTable$1;)V

    .line 297
    invoke-virtual {p2}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v8

    invoke-virtual {p3}, Lcom/google/common/collect/ImmutableSet;->size()I

    move-result v9

    filled-new-array {v8, v9}, [I

    move-result-object v8

    const-class v9, Ljava/lang/Object;

    invoke-static {v9, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [[Ljava/lang/Object;

    move-object v0, v8

    check-cast v0, [[Ljava/lang/Object;

    .line 298
    .local v0, array:[[Ljava/lang/Object;,"[[TV;"
    iput-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    .line 299
    invoke-static {p2}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->makeIndex(Lcom/google/common/collect/ImmutableSet;)Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v8

    iput-object v8, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    .line 300
    invoke-static {p3}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->makeIndex(Lcom/google/common/collect/ImmutableSet;)Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v8

    iput-object v8, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    .line 301
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/Table$Cell;

    .line 302
    .local v1, cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;"
    invoke-interface {v1}, Lcom/google/common/collect/Table$Cell;->getRowKey()Ljava/lang/Object;

    move-result-object v7

    .line 303
    .local v7, rowKey:Ljava/lang/Object;,"TR;"
    invoke-interface {v1}, Lcom/google/common/collect/Table$Cell;->getColumnKey()Ljava/lang/Object;

    move-result-object v3

    .line 304
    .local v3, columnKey:Ljava/lang/Object;,"TC;"
    iget-object v8, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v8, v7}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 305
    .local v6, rowIndex:I
    iget-object v8, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v8, v3}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 306
    .local v2, columnIndex:I
    iget-object v8, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    aget-object v8, v8, v6

    aget-object v4, v8, v2

    .line 307
    .local v4, existingValue:Ljava/lang/Object;,"TV;"
    if-nez v4, :cond_0

    const/4 v8, 0x1

    :goto_1
    const-string v9, "duplicate key: (%s, %s)"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v7, v10, v11

    const/4 v11, 0x1

    aput-object v3, v10, v11

    invoke-static {v8, v9, v10}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 309
    iget-object v8, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    aget-object v8, v8, v6

    invoke-interface {v1}, Lcom/google/common/collect/Table$Cell;->getValue()Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v8, v2

    goto :goto_0

    .line 307
    :cond_0
    const/4 v8, 0x0

    goto :goto_1

    .line 311
    .end local v1           #cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;"
    .end local v2           #columnIndex:I
    .end local v3           #columnKey:Ljava/lang/Object;,"TC;"
    .end local v4           #existingValue:Ljava/lang/Object;,"TV;"
    .end local v6           #rowIndex:I
    .end local v7           #rowKey:Ljava/lang/Object;,"TR;"
    :cond_1
    return-void
.end method

.method private makeColumnMap()Lcom/google/common/collect/ImmutableMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap",
            "<TC;",
            "Ljava/util/Map",
            "<TR;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 339
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v1

    .line 341
    .local v1, columnMapBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TC;Ljava/util/Map<TR;TV;>;>;"
    const/4 v0, 0x0

    .local v0, c:I
    :goto_0
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableBiMap;->size()I

    move-result v5

    if-ge v0, v5, :cond_2

    .line 342
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v3

    .line 343
    .local v3, rowMapBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TR;TV;>;"
    const/4 v2, 0x0

    .local v2, r:I
    :goto_1
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableBiMap;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 344
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    aget-object v5, v5, v2

    aget-object v4, v5, v0

    .line 345
    .local v4, value:Ljava/lang/Object;,"TV;"
    if-eqz v4, :cond_0

    .line 346
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableBiMap;->inverse()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 343
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 349
    .end local v4           #value:Ljava/lang/Object;,"TV;"
    :cond_1
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableBiMap;->inverse()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 341
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 352
    .end local v2           #r:I
    .end local v3           #rowMapBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TR;TV;>;"
    :cond_2
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v5

    return-object v5
.end method

.method private static makeIndex(Lcom/google/common/collect/ImmutableSet;)Lcom/google/common/collect/ImmutableBiMap;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ImmutableSet",
            "<TE;>;)",
            "Lcom/google/common/collect/ImmutableBiMap",
            "<TE;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 283
    .local p0, set:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TE;>;"
    invoke-static {}, Lcom/google/common/collect/ImmutableBiMap;->builder()Lcom/google/common/collect/ImmutableBiMap$Builder;

    move-result-object v2

    .line 285
    .local v2, indexBuilder:Lcom/google/common/collect/ImmutableBiMap$Builder;,"Lcom/google/common/collect/ImmutableBiMap$Builder<TE;Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .line 286
    .local v0, i:I
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 287
    .local v3, key:Ljava/lang/Object;,"TE;"
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/common/collect/ImmutableBiMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableBiMap$Builder;

    .line 288
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 290
    .end local v3           #key:Ljava/lang/Object;,"TE;"
    :cond_0
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableBiMap$Builder;->build()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v4

    return-object v4
.end method

.method private makeRowMap()Lcom/google/common/collect/ImmutableMap;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap",
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 409
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v4

    .line 410
    .local v4, rowMapBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TR;Ljava/util/Map<TC;TV;>;>;"
    const/4 v2, 0x0

    .local v2, r:I
    :goto_0
    iget-object v6, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    array-length v6, v6

    if-ge v2, v6, :cond_2

    .line 411
    iget-object v6, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    aget-object v3, v6, v2

    .line 412
    .local v3, row:[Ljava/lang/Object;,"[TV;"
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v1

    .line 413
    .local v1, columnMapBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TC;TV;>;"
    const/4 v0, 0x0

    .local v0, c:I
    :goto_1
    array-length v6, v3

    if-ge v0, v6, :cond_1

    .line 414
    aget-object v5, v3, v0

    .line 415
    .local v5, value:Ljava/lang/Object;,"TV;"
    if-eqz v5, :cond_0

    .line 416
    iget-object v6, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableBiMap;->inverse()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v6, v5}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 413
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 419
    .end local v5           #value:Ljava/lang/Object;,"TV;"
    :cond_1
    iget-object v6, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableBiMap;->inverse()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 410
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 422
    .end local v0           #c:I
    .end local v1           #columnMapBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TC;TV;>;"
    .end local v3           #row:[Ljava/lang/Object;,"[TV;"
    :cond_2
    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v6

    return-object v6
.end method


# virtual methods
.method public bridge synthetic cellSet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-super {p0}, Lcom/google/common/collect/RegularImmutableTable;->cellSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public column(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)",
            "Lcom/google/common/collect/ImmutableMap",
            "<TR;TV;>;"
        }
    .end annotation

    .prologue
    .line 314
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    .local p1, columnKey:Ljava/lang/Object;,"TC;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5, p1}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 316
    .local v2, columnIndexInteger:Ljava/lang/Integer;
    if-nez v2, :cond_0

    .line 317
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v5

    .line 328
    :goto_0
    return-object v5

    .line 320
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 321
    .local v1, columnIndex:I
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v0

    .line 322
    .local v0, columnBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TR;TV;>;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    array-length v5, v5

    if-ge v3, v5, :cond_2

    .line 323
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    aget-object v5, v5, v3

    aget-object v4, v5, v1

    .line 324
    .local v4, value:Ljava/lang/Object;,"TV;"
    if-eqz v4, :cond_1

    .line 325
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableBiMap;->inverse()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v5, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 322
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 328
    .end local v4           #value:Ljava/lang/Object;,"TV;"
    :cond_2
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v5

    goto :goto_0
.end method

.method public bridge synthetic column(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1
    .parameter "x0"

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->column(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

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
    .line 333
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableBiMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic columnKeySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public columnMap()Lcom/google/common/collect/ImmutableMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap",
            "<TC;",
            "Ljava/util/Map",
            "<TR;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 356
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnMap:Lcom/google/common/collect/ImmutableMap;

    .line 357
    .local v0, result:Lcom/google/common/collect/ImmutableMap;,"Lcom/google/common/collect/ImmutableMap<TC;Ljava/util/Map<TR;TV;>;>;"
    if-nez v0, :cond_0

    .line 358
    invoke-direct {p0}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->makeColumnMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnMap:Lcom/google/common/collect/ImmutableMap;

    .line 360
    :cond_0
    return-object v0
.end method

.method public bridge synthetic columnMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

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
    .line 365
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

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
    .line 369
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableBiMap;->containsKey(Ljava/lang/Object;)Z

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
    .line 373
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableBiMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
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
    .line 378
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    iget-object v2, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v2, p1}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 379
    .local v1, rowIndex:Ljava/lang/Integer;
    iget-object v2, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v2, p2}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 380
    .local v0, columnIndex:Ljava/lang/Integer;
    if-eqz v1, :cond_0

    if-nez v0, :cond_1

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return-object v2

    :cond_1
    iget-object v2, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aget-object v2, v2, v3

    goto :goto_0
.end method

.method public row(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)",
            "Lcom/google/common/collect/ImmutableMap",
            "<TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 385
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    .local p1, rowKey:Ljava/lang/Object;,"TR;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5, p1}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 387
    .local v3, rowIndex:Ljava/lang/Integer;
    if-nez v3, :cond_0

    .line 388
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v5

    .line 398
    :goto_0
    return-object v5

    .line 390
    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v2

    .line 391
    .local v2, rowBuilder:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TC;TV;>;"
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->values:[[Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-object v1, v5, v6

    .line 392
    .local v1, row:[Ljava/lang/Object;,"[TV;"
    const/4 v0, 0x0

    .local v0, r:I
    :goto_1
    array-length v5, v1

    if-ge v0, v5, :cond_2

    .line 393
    aget-object v4, v1, v0

    .line 394
    .local v4, value:Ljava/lang/Object;,"TV;"
    if-eqz v4, :cond_1

    .line 395
    iget-object v5, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->columnKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableBiMap;->inverse()Lcom/google/common/collect/ImmutableBiMap;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/common/collect/ImmutableBiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 392
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 398
    .end local v4           #value:Ljava/lang/Object;,"TV;"
    :cond_2
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v5

    goto :goto_0
.end method

.method public bridge synthetic row(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1
    .parameter "x0"

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->row(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

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
    .line 403
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeyToIndex:Lcom/google/common/collect/ImmutableBiMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableBiMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic rowKeySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowKeySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public rowMap()Lcom/google/common/collect/ImmutableMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap",
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 426
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    .line 427
    .local v0, result:Lcom/google/common/collect/ImmutableMap;,"Lcom/google/common/collect/ImmutableMap<TR;Ljava/util/Map<TC;TV;>;>;"
    if-nez v0, :cond_0

    .line 428
    invoke-direct {p0}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->makeRowMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    .line 430
    :cond_0
    return-object v0
.end method

.method public bridge synthetic rowMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;->rowMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 273
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$DenseImmutableTable<TR;TC;TV;>;"
    invoke-super {p0}, Lcom/google/common/collect/RegularImmutableTable;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v0

    return-object v0
.end method
