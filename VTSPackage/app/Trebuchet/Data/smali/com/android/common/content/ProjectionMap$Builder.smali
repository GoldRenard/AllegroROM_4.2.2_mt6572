.class public Lcom/android/common/content/ProjectionMap$Builder;
.super Ljava/lang/Object;
.source "ProjectionMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/common/content/ProjectionMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mMap:Lcom/android/common/content/ProjectionMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/android/common/content/ProjectionMap;

    invoke-direct {v0}, Lcom/android/common/content/ProjectionMap;-><init>()V

    iput-object v0, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)Lcom/android/common/content/ProjectionMap$Builder;
    .locals 1
    .parameter "column"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    #calls: Lcom/android/common/content/ProjectionMap;->putColumn(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, p1, p1}, Lcom/android/common/content/ProjectionMap;->access$000(Lcom/android/common/content/ProjectionMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    return-object p0
.end method

.method public add(Ljava/lang/String;Ljava/lang/String;)Lcom/android/common/content/ProjectionMap$Builder;
    .locals 3
    .parameter "alias"
    .parameter "expression"

    .prologue
    .line 38
    iget-object v0, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " AS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/common/content/ProjectionMap;->putColumn(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, p1, v1}, Lcom/android/common/content/ProjectionMap;->access$000(Lcom/android/common/content/ProjectionMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    return-object p0
.end method

.method public addAll(Lcom/android/common/content/ProjectionMap;)Lcom/android/common/content/ProjectionMap$Builder;
    .locals 5
    .parameter "map"

    .prologue
    .line 50
    invoke-virtual {p1}, Lcom/android/common/content/ProjectionMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 51
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    #calls: Lcom/android/common/content/ProjectionMap;->putColumn(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v4, v2, v3}, Lcom/android/common/content/ProjectionMap;->access$000(Lcom/android/common/content/ProjectionMap;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 53
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-object p0
.end method

.method public addAll([Ljava/lang/String;)Lcom/android/common/content/ProjectionMap$Builder;
    .locals 4
    .parameter "columns"

    .prologue
    .line 43
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 44
    .local v1, column:Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/android/common/content/ProjectionMap$Builder;->add(Ljava/lang/String;)Lcom/android/common/content/ProjectionMap$Builder;

    .line 43
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 46
    .end local v1           #column:Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public build()Lcom/android/common/content/ProjectionMap;
    .locals 2

    .prologue
    .line 57
    iget-object v1, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    invoke-virtual {v1}, Lcom/android/common/content/ProjectionMap;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 58
    .local v0, columns:[Ljava/lang/String;
    iget-object v1, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    invoke-virtual {v1}, Lcom/android/common/content/ProjectionMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 59
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 60
    iget-object v1, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    #setter for: Lcom/android/common/content/ProjectionMap;->mColumns:[Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/android/common/content/ProjectionMap;->access$102(Lcom/android/common/content/ProjectionMap;[Ljava/lang/String;)[Ljava/lang/String;

    .line 61
    iget-object v1, p0, Lcom/android/common/content/ProjectionMap$Builder;->mMap:Lcom/android/common/content/ProjectionMap;

    return-object v1
.end method
