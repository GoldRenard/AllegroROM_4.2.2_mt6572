.class Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;
.super Lcom/google/common/collect/ForwardingSet;
.source "LinkedHashMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/LinkedHashMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetDecorator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ForwardingSet",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final delegate:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TV;>;"
        }
    .end annotation
.end field

.field final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/LinkedHashMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/LinkedHashMultimap;Ljava/lang/Object;Ljava/util/Set;)V
    .locals 0
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .parameter
    .end parameter
    .parameter
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Set",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    .local p2, key:Ljava/lang/Object;,"TK;"
    .local p3, delegate:Ljava/util/Set;,"Ljava/util/Set<TV;>;"
    iput-object p1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/ForwardingSet;-><init>()V

    .line 175
    iput-object p3, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    .line 176
    iput-object p2, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->key:Ljava/lang/Object;

    .line 177
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 3
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    .local p1, value:Ljava/lang/Object;,"TV;"
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    .line 199
    .local v0, changed:Z
    if-eqz v0, :cond_0

    .line 200
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    iget-object v1, v1, Lcom/google/common/collect/LinkedHashMultimap;->linkedEntries:Ljava/util/Collection;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->createEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 202
    :cond_0
    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 206
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    .local p1, values:Ljava/util/Collection;,"Ljava/util/Collection<+TV;>;"
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    move-result v0

    .line 207
    .local v0, changed:Z
    if-eqz v0, :cond_0

    .line 208
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    iget-object v1, v1, Lcom/google/common/collect/LinkedHashMultimap;->linkedEntries:Ljava/util/Collection;

    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->createEntries(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 210
    :cond_0
    return v0
.end method

.method public clear()V
    .locals 4

    .prologue
    .line 214
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    iget-object v2, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 215
    .local v1, value:Ljava/lang/Object;,"TV;"
    iget-object v2, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    iget-object v2, v2, Lcom/google/common/collect/LinkedHashMultimap;->linkedEntries:Ljava/util/Collection;

    invoke-virtual {p0, v1}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->createEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 217
    .end local v1           #value:Ljava/lang/Object;,"TV;"
    :cond_0
    iget-object v2, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 218
    return-void
.end method

.method createEntries(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 4
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
            "Ljava/util/Map$Entry",
            "<TK;TE;>;>;"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    .local p1, values:Ljava/util/Collection;,"Ljava/util/Collection<TE;>;"
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-static {v3}, Lcom/google/common/collect/Lists;->newArrayListWithExpectedSize(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 191
    .local v0, entries:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/util/Map$Entry<TK;TE;>;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 192
    .local v2, value:Ljava/lang/Object;,"TE;"
    invoke-virtual {p0, v2}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->createEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 194
    .end local v2           #value:Ljava/lang/Object;,"TE;"
    :cond_0
    return-object v0
.end method

.method createEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
    .locals 1
    .parameter
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(TE;)",
            "Ljava/util/Map$Entry",
            "<TK;TE;>;"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    .local p1, value:Ljava/lang/Object;,"TE;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->key:Ljava/lang/Object;

    invoke-static {v0, p1}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 170
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic delegate()Ljava/util/Collection;
    .locals 1

    .prologue
    .line 170
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected delegate()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 180
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    iget-object v0, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    return-object v0
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
    .line 221
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 222
    .local v0, delegateIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<TV;>;"
    new-instance v1, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator$1;-><init>(Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 3
    .parameter "value"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 243
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 244
    .local v0, changed:Z
    if-eqz v0, :cond_0

    .line 249
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    iget-object v1, v1, Lcom/google/common/collect/LinkedHashMultimap;->linkedEntries:Ljava/util/Collection;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->createEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 251
    :cond_0
    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    .local p1, values:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    .line 256
    .local v0, changed:Z
    if-eqz v0, :cond_0

    .line 257
    iget-object v1, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    iget-object v1, v1, Lcom/google/common/collect/LinkedHashMultimap;->linkedEntries:Ljava/util/Collection;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->createEntries(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 259
    :cond_0
    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 267
    .local p0, this:Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;,"Lcom/google/common/collect/LinkedHashMultimap<TK;TV;>.SetDecorator;"
    .local p1, values:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    const/4 v0, 0x0

    .line 268
    .local v0, changed:Z
    iget-object v3, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->delegate:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 269
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<TV;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 270
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 271
    .local v2, value:Ljava/lang/Object;,"TV;"
    invoke-interface {p1, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 272
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 273
    iget-object v3, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->this$0:Lcom/google/common/collect/LinkedHashMultimap;

    iget-object v3, v3, Lcom/google/common/collect/LinkedHashMultimap;->linkedEntries:Ljava/util/Collection;

    iget-object v4, p0, Lcom/google/common/collect/LinkedHashMultimap$SetDecorator;->key:Ljava/lang/Object;

    invoke-static {v4, v2}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 274
    const/4 v0, 0x1

    goto :goto_0

    .line 277
    .end local v2           #value:Ljava/lang/Object;,"TV;"
    :cond_1
    return v0
.end method
