.class Lcom/google/common/collect/Sets$TransformedSet;
.super Ljava/util/AbstractSet;
.source "Sets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Sets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TransformedSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractSet",
        "<TB;>;"
    }
.end annotation


# instance fields
.field final bijection:Lcom/google/common/collect/Sets$InvertibleFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Sets$InvertibleFunction",
            "<TA;TB;>;"
        }
    .end annotation
.end field

.field final delegate:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TA;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Set;Lcom/google/common/collect/Sets$InvertibleFunction;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<TA;>;",
            "Lcom/google/common/collect/Sets$InvertibleFunction",
            "<TA;TB;>;)V"
        }
    .end annotation

    .prologue
    .line 1328
    .local p0, this:Lcom/google/common/collect/Sets$TransformedSet;,"Lcom/google/common/collect/Sets$TransformedSet<TA;TB;>;"
    .local p1, delegate:Ljava/util/Set;,"Ljava/util/Set<TA;>;"
    .local p2, bijection:Lcom/google/common/collect/Sets$InvertibleFunction;,"Lcom/google/common/collect/Sets$InvertibleFunction<TA;TB;>;"
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 1329
    iput-object p1, p0, Lcom/google/common/collect/Sets$TransformedSet;->delegate:Ljava/util/Set;

    .line 1330
    iput-object p2, p0, Lcom/google/common/collect/Sets$TransformedSet;->bijection:Lcom/google/common/collect/Sets$InvertibleFunction;

    .line 1331
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;)Z"
        }
    .end annotation

    .prologue
    .line 1370
    .local p0, this:Lcom/google/common/collect/Sets$TransformedSet;,"Lcom/google/common/collect/Sets$TransformedSet<TA;TB;>;"
    .local p1, b:Ljava/lang/Object;,"TB;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$TransformedSet;->delegate:Ljava/util/Set;

    iget-object v1, p0, Lcom/google/common/collect/Sets$TransformedSet;->bijection:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/Sets$InvertibleFunction;->invert(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 1379
    .local p0, this:Lcom/google/common/collect/Sets$TransformedSet;,"Lcom/google/common/collect/Sets$TransformedSet<TA;TB;>;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$TransformedSet;->delegate:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1380
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    .line 1343
    .local p0, this:Lcom/google/common/collect/Sets$TransformedSet;,"Lcom/google/common/collect/Sets$TransformedSet<TA;TB;>;"
    move-object v1, p1

    .line 1344
    .local v1, b:Ljava/lang/Object;,"TB;"
    iget-object v2, p0, Lcom/google/common/collect/Sets$TransformedSet;->bijection:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-virtual {v2, v1}, Lcom/google/common/collect/Sets$InvertibleFunction;->invert(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1366
    .local v0, a:Ljava/lang/Object;,"TA;"
    iget-object v2, p0, Lcom/google/common/collect/Sets$TransformedSet;->delegate:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/common/collect/Sets$TransformedSet;->bijection:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-virtual {v2, v0}, Lcom/google/common/collect/Sets$InvertibleFunction;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TB;>;"
        }
    .end annotation

    .prologue
    .line 1334
    .local p0, this:Lcom/google/common/collect/Sets$TransformedSet;,"Lcom/google/common/collect/Sets$TransformedSet<TA;TB;>;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$TransformedSet;->delegate:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/collect/Sets$TransformedSet;->bijection:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 2
    .parameter "o"

    .prologue
    .line 1375
    .local p0, this:Lcom/google/common/collect/Sets$TransformedSet;,"Lcom/google/common/collect/Sets$TransformedSet<TA;TB;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Sets$TransformedSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/Sets$TransformedSet;->delegate:Ljava/util/Set;

    iget-object v1, p0, Lcom/google/common/collect/Sets$TransformedSet;->bijection:Lcom/google/common/collect/Sets$InvertibleFunction;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/Sets$InvertibleFunction;->invert(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1338
    .local p0, this:Lcom/google/common/collect/Sets$TransformedSet;,"Lcom/google/common/collect/Sets$TransformedSet<TA;TB;>;"
    iget-object v0, p0, Lcom/google/common/collect/Sets$TransformedSet;->delegate:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
