.class public Lcom/mediatek/bluetooth/util/IdentityManager;
.super Ljava/lang/Object;
.source "IdentityManager.java"


# instance fields
.field private curCapacity:I

.field private curUsed:I

.field private idTable:[Z

.field private maxCapacity:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .parameter "initCapacity"
    .parameter "maxCapacity"

    .prologue
    .line 48
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput p2, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->maxCapacity:I

    .line 51
    iput p1, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    .line 53
    iget v0, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    .line 54
    return-void
.end method


# virtual methods
.method public declared-synchronized acquireId()I
    .locals 7

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    iget v4, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    if-lt v3, v4, :cond_1

    .line 61
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    iget v4, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->maxCapacity:I

    if-le v3, v4, :cond_0

    .line 63
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "max connection id["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->maxCapacity:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] is reach. no more connection can be created."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 66
    :cond_0
    :try_start_1
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    iget v4, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    div-int/lit8 v4, v4, 0x4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    .line 67
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    new-array v2, v3, [Z

    .line 68
    .local v2, newArray:[Z
    iget-object v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    array-length v6, v6

    invoke-static {v3, v4, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 69
    iput-object v2, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    .line 73
    .end local v2           #newArray:[Z
    :cond_1
    iget v0, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    .local v0, i:I
    :goto_0
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    if-ge v0, v3, :cond_3

    .line 75
    iget-object v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    aget-boolean v3, v3, v0

    if-nez v3, :cond_2

    .line 77
    iget-object v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    const/4 v4, 0x1

    aput-boolean v4, v3, v0

    .line 78
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v1, v0

    .line 88
    .end local v0           #i:I
    .local v1, i:I
    :goto_1
    monitor-exit p0

    return v1

    .line 73
    .end local v1           #i:I
    .restart local v0       #i:I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 82
    :cond_3
    :try_start_2
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    add-int/lit8 v0, v3, -0x1

    :goto_2
    if-ltz v0, :cond_5

    .line 84
    iget-object v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    aget-boolean v3, v3, v0

    if-nez v3, :cond_4

    .line 86
    iget-object v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    const/4 v4, 0x1

    aput-boolean v4, v3, v0

    .line 87
    iget v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    move v1, v0

    .line 88
    .end local v0           #i:I
    .restart local v1       #i:I
    goto :goto_1

    .line 82
    .end local v1           #i:I
    .restart local v0       #i:I
    :cond_4
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 93
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IdentityManager.acquireId() error: curUsed["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "], curCapacity["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curCapacity:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 94
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Can\'t find available id. This should be a bug in IdentityManager"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public declared-synchronized releaseId(I)Z
    .locals 3
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    .line 99
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    array-length v1, v1

    if-ge p1, v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    aget-boolean v1, v1, p1

    if-nez v1, :cond_1

    .line 101
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IdentityManager.releaseId() error: release unused id["

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
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    :goto_0
    monitor-exit p0

    return v0

    .line 105
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->idTable:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1

    .line 106
    iget v0, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/mediatek/bluetooth/util/IdentityManager;->curUsed:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    const/4 v0, 0x1

    goto :goto_0

    .line 99
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
