.class Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;
.super Lcom/google/common/collect/Sets$InvertibleFunction;
.source "WellBehavedMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/WellBehavedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "KeyToEntryConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Sets$InvertibleFunction",
        "<TK;",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;)V
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
    .line 69
    .local p0, this:Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;,"Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter<TK;TV;>;"
    .local p1, map:Ljava/util/Map;,"Ljava/util/Map<TK;TV;>;"
    invoke-direct {p0}, Lcom/google/common/collect/Sets$InvertibleFunction;-><init>()V

    .line 70
    iput-object p1, p0, Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;->map:Ljava/util/Map;

    .line 71
    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    .local p0, this:Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;,"Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter<TK;TV;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;->apply(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/lang/Object;)Ljava/util/Map$Entry;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, this:Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;,"Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter<TK;TV;>;"
    .local p1, key:Ljava/lang/Object;,"TK;"
    new-instance v0, Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter$1;-><init>(Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;Ljava/lang/Object;)V

    return-object v0
.end method

.method public bridge synthetic invert(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    .local p0, this:Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;,"Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter<TK;TV;>;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;->invert(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public invert(Ljava/util/Map$Entry;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;)TK;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, this:Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter;,"Lcom/google/common/collect/WellBehavedMap$KeyToEntryConverter<TK;TV;>;"
    .local p1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
