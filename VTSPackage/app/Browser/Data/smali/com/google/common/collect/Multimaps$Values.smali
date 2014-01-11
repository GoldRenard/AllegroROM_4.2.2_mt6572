.class abstract Lcom/google/common/collect/Multimaps$Values;
.super Ljava/util/AbstractCollection;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractCollection",
        "<TV;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 2007
    .local p0, this:Lcom/google/common/collect/Multimaps$Values;,"Lcom/google/common/collect/Multimaps$Values<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 2037
    .local p0, this:Lcom/google/common/collect/Multimaps$Values;,"Lcom/google/common/collect/Multimaps$Values<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Values;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->clear()V

    .line 2038
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .parameter "o"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 2033
    .local p0, this:Lcom/google/common/collect/Multimaps$Values;,"Lcom/google/common/collect/Multimaps$Values<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Values;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2011
    .local p0, this:Lcom/google/common/collect/Multimaps$Values;,"Lcom/google/common/collect/Multimaps$Values<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Values;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/common/collect/Multimap;->entries()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 2013
    .local v0, backingIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TK;TV;>;>;"
    new-instance v1, Lcom/google/common/collect/Multimaps$Values$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/Multimaps$Values$1;-><init>(Lcom/google/common/collect/Multimaps$Values;Ljava/util/Iterator;)V

    return-object v1
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

.method public size()I
    .locals 1

    .prologue
    .line 2029
    .local p0, this:Lcom/google/common/collect/Multimaps$Values;,"Lcom/google/common/collect/Multimaps$Values<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Values;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->size()I

    move-result v0

    return v0
.end method
