.class final Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable$1;
.super Ljava/lang/Object;
.source "RegularImmutableTable.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable;->buildIndex(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<",
        "Lcom/google/common/collect/ImmutableMap$Builder",
        "<TB;TV;>;",
        "Ljava/util/Map",
        "<TB;TV;>;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 194
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 194
    check-cast p1, Lcom/google/common/collect/ImmutableMap$Builder;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableTable$SparseImmutableTable$1;->apply(Lcom/google/common/collect/ImmutableMap$Builder;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public apply(Lcom/google/common/collect/ImmutableMap$Builder;)Ljava/util/Map;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMap$Builder",
            "<TB;TV;>;)",
            "Ljava/util/Map",
            "<TB;TV;>;"
        }
    .end annotation

    .prologue
    .line 196
    .local p1, from:Lcom/google/common/collect/ImmutableMap$Builder;,"Lcom/google/common/collect/ImmutableMap$Builder<TB;TV;>;"
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    return-object v0
.end method
