.class Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;
.super Lcom/google/common/collect/ForwardingMap;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps$FilteredMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AsMap"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;,
        Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;,
        Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$KeySet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ForwardingMap",
        "<TK;",
        "Ljava/util/Collection",
        "<TV;>;>;"
    }
.end annotation


# instance fields
.field asMapValues:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multimaps$FilteredMultimap",
            "<TK;TV;>.AsMap.Values;"
        }
    .end annotation
.end field

.field final delegate:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field entrySet:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multimaps$FilteredMultimap",
            "<TK;TV;>.AsMap.EntrySet;"
        }
    .end annotation
.end field

.field keySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$FilteredMultimap;Ljava/util/Map;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 2555
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    .local p2, delegate:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMap;-><init>()V

    .line 2556
    iput-object p2, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->delegate:Ljava/util/Map;

    .line 2557
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 2569
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-virtual {v0}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->clear()V

    .line 2570
    return-void
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 2552
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->delegate()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected delegate()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;"
        }
    .end annotation

    .prologue
    .line 2560
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->delegate:Ljava/util/Map;

    return-object v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 2652
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->entrySet:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;

    invoke-super {p0}, Lcom/google/common/collect/ForwardingMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;Ljava/util/Set;)V

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->entrySet:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->entrySet:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$EntrySet;

    goto :goto_0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 2575
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->keySet:Ljava/util/Set;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$KeySet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$KeySet;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;)V

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->keySet:Ljava/util/Set;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->keySet:Ljava/util/Set;

    goto :goto_0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2552
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->remove(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 2
    .parameter "o"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2564
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    iget-object v1, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->this$0:Lcom/google/common/collect/Multimaps$FilteredMultimap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/Multimaps$FilteredMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 2565
    .local v0, output:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    .end local v0           #output:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    :cond_0
    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/Collection",
            "<TV;>;>;"
        }
    .end annotation

    .prologue
    .line 2610
    .local p0, this:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;,"Lcom/google/common/collect/Multimaps$FilteredMultimap<TK;TV;>.AsMap;"
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->asMapValues:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;-><init>(Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;)V

    iput-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->asMapValues:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap;->asMapValues:Lcom/google/common/collect/Multimaps$FilteredMultimap$AsMap$Values;

    goto :goto_0
.end method
