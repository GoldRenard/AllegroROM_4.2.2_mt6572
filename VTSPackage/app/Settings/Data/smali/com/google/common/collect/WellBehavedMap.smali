.class final Lcom/google/common/collect/WellBehavedMap;
.super Lcom/google/common/collect/ForwardingMap;
.source "WellBehavedMap.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingMap",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final delegate:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private entrySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/Map;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, this:Lcom/google/common/collect/WellBehavedMap;,"Lcom/google/common/collect/WellBehavedMap<TK;TV;>;"
    .local p1, delegate:Ljava/util/Map;,"Ljava/util/Map<TK;TV;>;"
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMap;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/google/common/collect/WellBehavedMap;->delegate:Ljava/util/Map;

    .line 40
    return-void
.end method

.method static wrap(Ljava/util/Map;)Lcom/google/common/collect/WellBehavedMap;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;TV;>;)",
            "Lcom/google/common/collect/WellBehavedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, delegate:Ljava/util/Map;,"Ljava/util/Map<TK;TV;>;"
    new-instance v0, Lcom/google/common/collect/WellBehavedMap;

    invoke-direct {v0, p0}, Lcom/google/common/collect/WellBehavedMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 33
    .local p0, this:Lcom/google/common/collect/WellBehavedMap;,"Lcom/google/common/collect/WellBehavedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/WellBehavedMap;->delegate()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected delegate()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, this:Lcom/google/common/collect/WellBehavedMap;,"Lcom/google/common/collect/WellBehavedMap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/WellBehavedMap;->delegate:Ljava/util/Map;

    return-object v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, this:Lcom/google/common/collect/WellBehavedMap;,"Lcom/google/common/collect/WellBehavedMap<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/collect/WellBehavedMap;->entrySet:Ljava/util/Set;

    .line 58
    .local v0, es:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    if-eqz v0, :cond_0

    .line 61
    .end local v0           #es:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    :goto_0
    return-object v0

    .restart local v0       #es:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    :cond_0
    iget-object v1, p0, Lcom/google/common/collect/WellBehavedMap;->delegate:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    new-instance v2, Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;

    invoke-direct {v2, p0}, Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;-><init>(Ljava/util/Map;)V

    invoke-static {v1, v2}, Lcom/google/common/collect/Sets;->transform(Ljava/util/Set;Lcom/google/common/collect/Sets$InvertibleFunction;)Ljava/util/Set;

    move-result-object v0

    .end local v0           #es:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    iput-object v0, p0, Lcom/google/common/collect/WellBehavedMap;->entrySet:Ljava/util/Set;

    goto :goto_0
.end method
