.class public abstract Lcom/mediatek/bluetooth/psm/Psm;
.super Ljava/lang/Object;
.source "Psm.java"


# instance fields
.field protected defaultConnCount:I

.field protected maxConnCount:I

.field protected maxMessageId:I

.field protected minMessageId:I

.field protected profile:I

.field protected psmConnList:Lcom/mediatek/bluetooth/util/IdentityList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mediatek/bluetooth/util/IdentityList",
            "<",
            "Lcom/mediatek/bluetooth/psm/PsmConnection;",
            ">;"
        }
    .end annotation
.end field

.field protected psmService:Lcom/mediatek/bluetooth/psm/PsmService;

.field protected psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;


# direct methods
.method protected constructor <init>(ILcom/mediatek/bluetooth/psm/PsmService;IIII)V
    .locals 0
    .parameter "profile"
    .parameter "psmService"
    .parameter "minMessageId"
    .parameter "maxMessageId"
    .parameter "defaultConnCount"
    .parameter "maxConnCount"

    .prologue
    .line 80
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput p1, p0, Lcom/mediatek/bluetooth/psm/Psm;->profile:I

    .line 84
    iput-object p2, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmService:Lcom/mediatek/bluetooth/psm/PsmService;

    .line 85
    iput p3, p0, Lcom/mediatek/bluetooth/psm/Psm;->minMessageId:I

    .line 86
    iput p4, p0, Lcom/mediatek/bluetooth/psm/Psm;->maxMessageId:I

    .line 87
    iput p5, p0, Lcom/mediatek/bluetooth/psm/Psm;->defaultConnCount:I

    .line 88
    iput p6, p0, Lcom/mediatek/bluetooth/psm/Psm;->maxConnCount:I

    .line 89
    return-void
.end method


# virtual methods
.method protected abstract createServiceBinder()Lcom/mediatek/bluetooth/psm/PsmServiceBinder;
.end method

.method public getConnection(I)Lcom/mediatek/bluetooth/psm/PsmConnection;
    .locals 1
    .parameter "connId"

    .prologue
    .line 243
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmConnList:Lcom/mediatek/bluetooth/util/IdentityList;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/util/IdentityList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/psm/PsmConnection;

    return-object v0
.end method

.method public getHandlerLooper()Landroid/os/Looper;
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmService:Lcom/mediatek/bluetooth/psm/PsmService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/psm/PsmService;->getHandlerLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method

.method public getService()Landroid/app/Service;
    .locals 1

    .prologue
    .line 260
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmService:Lcom/mediatek/bluetooth/psm/PsmService;

    return-object v0
.end method

.method public getServiceBinder()Lcom/mediatek/bluetooth/psm/PsmServiceBinder;
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    return-object v0
.end method

.method public abstract handleMessage(Lcom/mediatek/bluetooth/psm/PsmMessage;)I
.end method

.method public isValidMessage(I)Z
    .locals 1
    .parameter "messageId"

    .prologue
    .line 171
    iget v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->minMessageId:I

    if-gt v0, p1, :cond_0

    iget v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->maxMessageId:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected declared-synchronized onServiceBind()Z
    .locals 3

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmConnList:Lcom/mediatek/bluetooth/util/IdentityList;

    if-nez v0, :cond_0

    .line 113
    new-instance v0, Lcom/mediatek/bluetooth/util/IdentityList;

    iget v1, p0, Lcom/mediatek/bluetooth/psm/Psm;->defaultConnCount:I

    iget v2, p0, Lcom/mediatek/bluetooth/psm/Psm;->maxConnCount:I

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/util/IdentityList;-><init>(II)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmConnList:Lcom/mediatek/bluetooth/util/IdentityList;

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    if-nez v0, :cond_1

    .line 120
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/psm/Psm;->createServiceBinder()Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    .line 123
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    if-eqz v0, :cond_1

    .line 125
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    invoke-interface {v0}, Lcom/mediatek/bluetooth/psm/PsmServiceBinder;->onServiceBind()V

    .line 128
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    if-nez v0, :cond_2

    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onServiceBind() failed: psmServiceBinder is null ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 133
    :cond_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmConnList:Lcom/mediatek/bluetooth/util/IdentityList;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_0

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onServiceCreate()V
    .locals 0

    .prologue
    .line 101
    return-void
.end method

.method protected onServiceDestroy()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    invoke-interface {v0}, Lcom/mediatek/bluetooth/psm/PsmServiceBinder;->onServiceDestroy()V

    .line 151
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    .line 157
    :cond_0
    return-void
.end method

.method protected recvMessage(Lcom/mediatek/bluetooth/psm/PsmMessage;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 228
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmServiceBinder:Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    invoke-interface {v0, p1}, Lcom/mediatek/bluetooth/psm/PsmServiceBinder;->onMessageReceived(Lcom/mediatek/bluetooth/psm/PsmMessage;)V

    .line 232
    :cond_0
    return-void
.end method

.method public registerConnection(Lcom/mediatek/bluetooth/psm/PsmConnection;)I
    .locals 2
    .parameter "profileConnection"

    .prologue
    .line 183
    iget-object v1, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmConnList:Lcom/mediatek/bluetooth/util/IdentityList;

    invoke-virtual {v1, p1}, Lcom/mediatek/bluetooth/util/IdentityList;->registerElement(Ljava/lang/Object;)I

    move-result v0

    .line 184
    .local v0, connId:I
    invoke-virtual {p1, v0}, Lcom/mediatek/bluetooth/psm/PsmConnection;->setConnId(I)V

    .line 185
    return v0
.end method

.method protected sendMessage(Lcom/mediatek/bluetooth/psm/PsmMessage;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 218
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmService:Lcom/mediatek/bluetooth/psm/PsmService;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/psm/PsmService;->send(Lcom/mediatek/bluetooth/ilm/Message;)V

    .line 219
    return-void
.end method

.method public unregisterConnection(I)Z
    .locals 1
    .parameter "connId"

    .prologue
    .line 195
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/Psm;->psmConnList:Lcom/mediatek/bluetooth/util/IdentityList;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/util/IdentityList;->unregisterElement(I)Z

    move-result v0

    return v0
.end method
