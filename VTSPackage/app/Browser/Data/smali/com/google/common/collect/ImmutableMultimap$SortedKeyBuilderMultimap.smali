.class Lcom/google/common/collect/ImmutableMultimap$SortedKeyBuilderMultimap;
.super Lcom/google/common/collect/AbstractMultimap;
.source "ImmutableMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SortedKeyBuilderMultimap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractMultimap",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method constructor <init>(Ljava/util/Comparator;Lcom/google/common/collect/Multimap;)V
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-TK;>;",
            "Lcom/google/common/collect/Multimap",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, this:Lcom/google/common/collect/ImmutableMultimap$SortedKeyBuilderMultimap;,"Lcom/google/common/collect/ImmutableMultimap$SortedKeyBuilderMultimap<TK;TV;>;"
    .local p1, keyComparator:Ljava/util/Comparator;,"Ljava/util/Comparator<-TK;>;"
    .local p2, multimap:Lcom/google/common/collect/Multimap;,"Lcom/google/common/collect/Multimap<TK;TV;>;"
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    invoke-direct {p0, v0}, Lcom/google/common/collect/AbstractMultimap;-><init>(Ljava/util/Map;)V

    .line 141
    invoke-virtual {p0, p2}, Lcom/google/common/collect/ImmutableMultimap$SortedKeyBuilderMultimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    .line 142
    return-void
.end method


# virtual methods
.method createCollection()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, this:Lcom/google/common/collect/ImmutableMultimap$SortedKeyBuilderMultimap;,"Lcom/google/common/collect/ImmutableMultimap$SortedKeyBuilderMultimap<TK;TV;>;"
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method
