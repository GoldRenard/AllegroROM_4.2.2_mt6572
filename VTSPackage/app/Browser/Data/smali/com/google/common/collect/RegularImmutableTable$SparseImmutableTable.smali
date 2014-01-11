.class final Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;
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
    name = "SparseImmutableTable"
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
.field private final columnMap:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<TC;",
            "Ljava/util/Map",
            "<TR;TV;>;>;"
        }
    .end annotation
.end field

.field private final rowMap:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<TR;",
            "Ljava/util/Map",
            "<TC;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/ImmutableSet;)V
    .locals 8
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
    .line 203
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    .local p1, cellSet:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;>;"
    .local p2, rowSpace:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TR;>;"
    .local p3, columnSpace:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TC;>;"
    const/4 v7, 0x0

    invoke-direct {p0, p1, v7}, Lcom/google/common/collect/RegularImmutableTable;-><init>(Lcom/google/common/collect/ImmutableSet;Lcom/google/common/collect/RegularImmutableTable$1;)V

    .line 204
    invoke-static {p2}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->makeIndexBuilder(Lcom/google/common/collect/ImmutableSet;)Ljava/util/Map;

    move-result-object v4

    .line 206
    .local v4, rowIndexBuilder:Ljava/util/Map;,"Ljava/util/Map<TR;Lcom/google/common/collect/ImmutableMap$Builder<TC;TV;>;>;"
    invoke-static {p3}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->makeIndexBuilder(Lcom/google/common/collect/ImmutableSet;)Ljava/util/Map;

    move-result-object v1

    .line 208
    .local v1, columnIndexBuilder:Ljava/util/Map;,"Ljava/util/Map<TC;Lcom/google/common/collect/ImmutableMap$Builder<TR;TV;>;>;"
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Table$Cell;

    .line 209
    .local v0, cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;"
    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getRowKey()Ljava/lang/Object;

    move-result-object v5

    .line 210
    .local v5, rowKey:Ljava/lang/Object;,"TR;"
    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getColumnKey()Ljava/lang/Object;

    move-result-object v2

    .line 211
    .local v2, columnKey:Ljava/lang/Object;,"TC;"
    invoke-interface {v0}, Lcom/google/common/collect/Table$Cell;->getValue()Ljava/lang/Object;

    move-result-object v6

    .line 212
    .local v6, value:Ljava/lang/Object;,"TV;"
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-virtual {v7, v2, v6}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 213
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-virtual {v7, v5, v6}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto :goto_0

    .line 215
    .end local v0           #cell:Lcom/google/common/collect/Table$Cell;,"Lcom/google/common/collect/Table$Cell<TR;TC;TV;>;"
    .end local v2           #columnKey:Ljava/lang/Object;,"TC;"
    .end local v5           #rowKey:Ljava/lang/Object;,"TR;"
    .end local v6           #value:Ljava/lang/Object;,"TV;"
    :cond_0
    invoke-static {v4}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->buildIndex(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v7

    iput-object v7, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    .line 216
    invoke-static {v1}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->buildIndex(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v7

    iput-object v7, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->columnMap:Lcom/google/common/collect/ImmutableMap;

    .line 217
    return-void
.end method

.method private static final buildIndex(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TA;",
            "Lcom/google/common/collect/ImmutableMap$Builder",
            "<TB;TV;>;>;)",
            "Lcom/google/common/collect/ImmutableMap",
            "<TA;",
            "Ljava/util/Map",
            "<TB;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 193
    .local p0, indexBuilder:Ljava/util/Map;,"Ljava/util/Map<TA;Lcom/google/common/collect/ImmutableMap$Builder<TB;TV;>;>;"
    new-instance v0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable$1;

    invoke-direct {v0}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable$1;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->transformValues(Ljava/util/Map;Lcom/google/common/base/Function;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    return-object v0
.end method

.method private static final makeIndexBuilder(Lcom/google/common/collect/ImmutableSet;)Ljava/util/Map;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/ImmutableSet",
            "<TA;>;)",
            "Ljava/util/Map",
            "<TA;",
            "Lcom/google/common/collect/ImmutableMap$Builder",
            "<TB;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 180
    .local p0, keySpace:Lcom/google/common/collect/ImmutableSet;,"Lcom/google/common/collect/ImmutableSet<TA;>;"
    invoke-static {}, Lcom/google/common/collect/Maps;->newLinkedHashMap()Ljava/util/LinkedHashMap;

    move-result-object v1

    .line 181
    .local v1, indexBuilder:Ljava/util/Map;,"Ljava/util/Map<TA;Lcom/google/common/collect/ImmutableMap$Builder<TB;TV;>;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 182
    .local v2, key:Ljava/lang/Object;,"TA;"
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 184
    .end local v2           #key:Ljava/lang/Object;,"TA;"
    :cond_0
    return-object v1
.end method


# virtual methods
.method public bridge synthetic cellSet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-super {p0}, Lcom/google/common/collect/RegularImmutableTable;->cellSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public column(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)",
            "Lcom/google/common/collect/ImmutableMap",
            "<TR;TV;>;"
        }
    .end annotation

    .prologue
    .line 220
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    .local p1, columnKey:Ljava/lang/Object;,"TC;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->columnMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/ImmutableMap;

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/ImmutableMap;

    return-object v0
.end method

.method public bridge synthetic column(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1
    .parameter "x0"

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->column(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

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
    .line 227
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->columnMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic columnKeySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->columnKeySet()Lcom/google/common/collect/ImmutableSet;

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
    .line 231
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->columnMap:Lcom/google/common/collect/ImmutableMap;

    return-object v0
.end method

.method public bridge synthetic columnMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->columnMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    return-object v0
.end method

.method public contains(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .parameter "rowKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter "columnKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 251
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 252
    .local v0, row:Ljava/util/Map;,"Ljava/util/Map<TC;TV;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public containsColumn(Ljava/lang/Object;)Z
    .locals 1
    .parameter "columnKey"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 256
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->columnMap:Lcom/google/common/collect/ImmutableMap;

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
    .line 260
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
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
    .line 265
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 266
    .local v0, row:Ljava/util/Map;,"Ljava/util/Map<TC;TV;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public row(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)",
            "Lcom/google/common/collect/ImmutableMap",
            "<TC;TV;>;"
        }
    .end annotation

    .prologue
    .line 235
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    .local p1, rowKey:Ljava/lang/Object;,"TR;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/ImmutableMap;

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/ImmutableMap;

    return-object v0
.end method

.method public bridge synthetic row(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1
    .parameter "x0"

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->row(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

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
    .line 242
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic rowKeySet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowKeySet()Lcom/google/common/collect/ImmutableSet;

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
    .line 246
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap:Lcom/google/common/collect/ImmutableMap;

    return-object v0
.end method

.method public bridge synthetic rowMap()Ljava/util/Map;
    .locals 1

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->rowMap()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 166
    .local p0, this:Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;,"Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable<TR;TC;TV;>;"
    invoke-super {p0}, Lcom/google/common/collect/RegularImmutableTable;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v0

    return-object v0
.end method
