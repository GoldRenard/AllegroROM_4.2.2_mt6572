.class Lcom/google/common/collect/RegularImmutableMultiset;
.super Lcom/google/common/collect/ImmutableMultiset;
.source "RegularImmutableMultiset.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    serializable = true
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableMultiset",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final transient map:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<TE;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final transient size:I


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableMap;I)V
    .locals 0
    .parameter
    .parameter "size"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMap",
            "<TE;",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    .local p1, map:Lcom/google/common/collect/ImmutableMap;,"Lcom/google/common/collect/ImmutableMap<TE;Ljava/lang/Integer;>;"
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableMultiset;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    .line 41
    iput p2, p0, Lcom/google/common/collect/RegularImmutableMultiset;->size:I

    .line 42
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .parameter "element"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 62
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public count(Ljava/lang/Object;)I
    .locals 2
    .parameter "element"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    .line 51
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 52
    .local v0, value:Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0
.end method

.method distinctElements()I
    .locals 1

    .prologue
    .line 95
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->size()I

    move-result v0

    return v0
.end method

.method public elementSet()Lcom/google/common/collect/ImmutableSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic elementSet()Ljava/util/Set;
    .locals 1

    .prologue
    .line 32
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableMultiset;->elementSet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method entryIterator()Lcom/google/common/collect/UnmodifiableIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    .line 74
    .local v0, mapIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TE;Ljava/lang/Integer;>;>;"
    new-instance v1, Lcom/google/common/collect/RegularImmutableMultiset$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/RegularImmutableMultiset$1;-><init>(Lcom/google/common/collect/RegularImmutableMultiset;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 90
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->hashCode()I

    move-result v0

    return v0
.end method

.method isPartialView()Z
    .locals 1

    .prologue
    .line 46
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->isPartialView()Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 57
    .local p0, this:Lcom/google/common/collect/RegularImmutableMultiset;,"Lcom/google/common/collect/RegularImmutableMultiset<TE;>;"
    iget v0, p0, Lcom/google/common/collect/RegularImmutableMultiset;->size:I

    return v0
.end method
