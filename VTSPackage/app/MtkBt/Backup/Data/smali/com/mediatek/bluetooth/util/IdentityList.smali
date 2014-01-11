.class public Lcom/mediatek/bluetooth/util/IdentityList;
.super Ljava/lang/Object;
.source "IdentityList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected identityMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "TE;>;"
        }
    .end annotation
.end field

.field protected identityMgr:Lcom/mediatek/bluetooth/util/IdentityManager;


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .parameter "initialCapacity"
    .parameter "maxCapacity"

    .prologue
    .line 64
    .local p0, this:Lcom/mediatek/bluetooth/util/IdentityList;,"Lcom/mediatek/bluetooth/util/IdentityList<TE;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "IdentityList()[+]: initialCapacity["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], maxCapacity["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->v(Ljava/lang/String;)V

    .line 71
    new-instance v0, Lcom/mediatek/bluetooth/util/IdentityManager;

    invoke-direct {v0, p1, p2}, Lcom/mediatek/bluetooth/util/IdentityManager;-><init>(II)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMgr:Lcom/mediatek/bluetooth/util/IdentityManager;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMap:Ljava/util/Map;

    .line 73
    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .locals 2
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, this:Lcom/mediatek/bluetooth/util/IdentityList;,"Lcom/mediatek/bluetooth/util/IdentityList<TE;>;"
    iget-object v0, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getElements()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, this:Lcom/mediatek/bluetooth/util/IdentityList;,"Lcom/mediatek/bluetooth/util/IdentityList<TE;>;"
    iget-object v0, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public registerElement(Ljava/lang/Object;)I
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)I"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, this:Lcom/mediatek/bluetooth/util/IdentityList;,"Lcom/mediatek/bluetooth/util/IdentityList<TE;>;"
    .local p1, element:Ljava/lang/Object;,"TE;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "registerElement(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->v(Ljava/lang/String;)V

    .line 89
    iget-object v1, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMgr:Lcom/mediatek/bluetooth/util/IdentityManager;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/util/IdentityManager;->acquireId()I

    move-result v0

    .line 90
    .local v0, id:I
    iget-object v1, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 125
    .local p0, this:Lcom/mediatek/bluetooth/util/IdentityList;,"Lcom/mediatek/bluetooth/util/IdentityList<TE;>;"
    iget-object v0, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public unregisterElement(I)Z
    .locals 3
    .parameter "id"

    .prologue
    .line 104
    .local p0, this:Lcom/mediatek/bluetooth/util/IdentityList;,"Lcom/mediatek/bluetooth/util/IdentityList<TE;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unregisterElement(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->v(Ljava/lang/String;)V

    .line 107
    iget-object v1, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 108
    .local v0, element:Ljava/lang/Object;,"TE;"
    if-eqz v0, :cond_0

    .line 110
    iget-object v1, p0, Lcom/mediatek/bluetooth/util/IdentityList;->identityMgr:Lcom/mediatek/bluetooth/util/IdentityManager;

    invoke-virtual {v1, p1}, Lcom/mediatek/bluetooth/util/IdentityManager;->releaseId(I)Z

    move-result v1

    .line 114
    :goto_0
    return v1

    .line 113
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unregisterElement() error: unknown id["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 114
    const/4 v1, 0x0

    goto :goto_0
.end method
