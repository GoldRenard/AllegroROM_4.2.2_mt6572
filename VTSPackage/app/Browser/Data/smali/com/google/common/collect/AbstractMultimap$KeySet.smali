.class Lcom/google/common/collect/AbstractMultimap$KeySet;
.super Lcom/google/common/collect/Maps$KeySet;
.source "AbstractMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/AbstractMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$KeySet",
        "<TK;",
        "Ljava/util/Collection",
        "<TV;>;>;"
    }
.end annotation


# instance fields
.field final subMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/AbstractMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/AbstractMultimap;Ljava/util/Map;)V
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
    .line 883
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    .local p2, subMap:Ljava/util/Map;,"Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;"
    iput-object p1, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/Maps$KeySet;-><init>()V

    .line 884
    iput-object p2, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->subMap:Ljava/util/Map;

    .line 885
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 933
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractMultimap$KeySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Iterators;->clear(Ljava/util/Iterator;)V

    .line 934
    return-void
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 937
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->subMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "object"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 941
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    if-eq p0, p1, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->subMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 945
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->subMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 893
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    new-instance v0, Lcom/google/common/collect/AbstractMultimap$KeySet$1;

    invoke-direct {v0, p0}, Lcom/google/common/collect/AbstractMultimap$KeySet$1;-><init>(Lcom/google/common/collect/AbstractMultimap$KeySet;)V

    return-object v0
.end method

.method map()Ljava/util/Map;
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
    .line 889
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    iget-object v0, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->subMap:Ljava/util/Map;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 3
    .parameter "key"

    .prologue
    .line 921
    .local p0, this:Lcom/google/common/collect/AbstractMultimap$KeySet;,"Lcom/google/common/collect/AbstractMultimap<TK;TV;>.KeySet;"
    const/4 v1, 0x0

    .line 922
    .local v1, count:I
    iget-object v2, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->subMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 923
    .local v0, collection:Ljava/util/Collection;,"Ljava/util/Collection<TV;>;"
    if-eqz v0, :cond_0

    .line 924
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    .line 925
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 926
    iget-object v2, p0, Lcom/google/common/collect/AbstractMultimap$KeySet;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-static {v2, v1}, Lcom/google/common/collect/AbstractMultimap;->access$220(Lcom/google/common/collect/AbstractMultimap;I)I

    .line 928
    :cond_0
    if-lez v1, :cond_1

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
