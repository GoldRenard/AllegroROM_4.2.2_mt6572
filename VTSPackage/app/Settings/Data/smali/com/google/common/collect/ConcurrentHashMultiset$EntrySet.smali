.class Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;
.super Lcom/google/common/collect/AbstractMultiset$EntrySet;
.source "ConcurrentHashMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ConcurrentHashMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EntrySet"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/ConcurrentHashMultiset;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/ConcurrentHashMultiset;)V
    .locals 0
    .parameter

    .prologue
    .line 526
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    iput-object p1, p0, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->this$0:Lcom/google/common/collect/ConcurrentHashMultiset;

    invoke-direct {p0, p1}, Lcom/google/common/collect/AbstractMultiset$EntrySet;-><init>(Lcom/google/common/collect/AbstractMultiset;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/ConcurrentHashMultiset;Lcom/google/common/collect/ConcurrentHashMultiset$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 526
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    invoke-direct {p0, p1}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;)V

    return-void
.end method

.method private snapshot()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 545
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->size()I

    move-result v1

    invoke-static {v1}, Lcom/google/common/collect/Lists;->newArrayListWithExpectedSize(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 547
    .local v0, list:Ljava/util/List;,"Ljava/util/List<Lcom/google/common/collect/Multiset$Entry<TE;>;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->addAll(Ljava/util/Collection;Ljava/util/Iterator;)Z

    .line 548
    return-object v0
.end method


# virtual methods
.method multiset()Lcom/google/common/collect/ConcurrentHashMultiset;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ConcurrentHashMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 528
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->this$0:Lcom/google/common/collect/ConcurrentHashMultiset;

    return-object v0
.end method

.method bridge synthetic multiset()Lcom/google/common/collect/Multiset;
    .locals 1

    .prologue
    .line 526
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->multiset()Lcom/google/common/collect/ConcurrentHashMultiset;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 6
    .parameter "object"

    .prologue
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    const/4 v4, 0x0

    .line 552
    instance-of v5, p1, Lcom/google/common/collect/Multiset$Entry;

    if-eqz v5, :cond_0

    move-object v1, p1

    .line 553
    check-cast v1, Lcom/google/common/collect/Multiset$Entry;

    .line 554
    .local v1, entry:Lcom/google/common/collect/Multiset$Entry;,"Lcom/google/common/collect/Multiset$Entry<*>;"
    invoke-interface {v1}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v0

    .line 555
    .local v0, element:Ljava/lang/Object;
    invoke-interface {v1}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v2

    .line 556
    .local v2, entryCount:I
    if-eqz v2, :cond_0

    .line 559
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->multiset()Lcom/google/common/collect/ConcurrentHashMultiset;

    move-result-object v3

    .line 560
    .local v3, multiset:Lcom/google/common/collect/Multiset;,"Lcom/google/common/collect/Multiset<Ljava/lang/Object;>;"
    invoke-interface {v3, v0, v2, v4}, Lcom/google/common/collect/Multiset;->setCount(Ljava/lang/Object;II)Z

    move-result v4

    .line 563
    .end local v0           #element:Ljava/lang/Object;
    .end local v1           #entry:Lcom/google/common/collect/Multiset$Entry;,"Lcom/google/common/collect/Multiset$Entry<*>;"
    .end local v2           #entryCount:I
    .end local v3           #multiset:Lcom/google/common/collect/Multiset;,"Lcom/google/common/collect/Multiset<Ljava/lang/Object;>;"
    :cond_0
    return v4
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 537
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    invoke-direct {p0}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->snapshot()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 541
    .local p0, this:Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,"Lcom/google/common/collect/ConcurrentHashMultiset<TE;>.EntrySet;"
    .local p1, array:[Ljava/lang/Object;,"[TT;"
    invoke-direct {p0}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;->snapshot()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
