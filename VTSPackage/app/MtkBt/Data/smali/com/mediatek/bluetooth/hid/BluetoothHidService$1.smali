.class Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;
.super Landroid/bluetooth/IBluetoothHid$Stub;
.source "BluetoothHidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/BluetoothHidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)V
    .locals 0
    .parameter

    .prologue
    .line 331
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {p0}, Landroid/bluetooth/IBluetoothHid$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public connect(Landroid/bluetooth/BluetoothDevice;)V
    .locals 5
    .parameter "device"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 333
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 334
    .local v0, btAddr:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v3, "BluetoothHidServer Connect"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v2, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 336
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getDeviceState(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$300(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 337
    .local v1, state:Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 338
    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "connecting"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 340
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->connectHidDevice(Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$700(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)V

    .line 347
    :goto_0
    return-void

    .line 342
    :cond_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v3, "already connected"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v2, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0

    .line 345
    :cond_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->connectHidDevice(Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$700(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public disconnect(Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .parameter "device"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 350
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "BluetoothHidServer Disconnect"

    const/4 v3, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 351
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 353
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->disconnectHidDevice(Ljava/lang/String;)V
    invoke-static {v1, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)V

    .line 354
    return-void
.end method

.method public getCurrentDevices()[Landroid/bluetooth/BluetoothDevice;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 474
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v5, "getCurrentDevices"

    const/4 v6, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v4, v5, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 476
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 477
    .local v0, deviceList:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v2

    .line 480
    .local v2, pairedDevices:Ljava/util/Set;,"Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    if-eqz v2, :cond_1

    .line 481
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/bluetooth/BluetoothDevice;

    .line 482
    .local v3, tmpDevice:Landroid/bluetooth/BluetoothDevice;
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 483
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "connected"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 486
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 493
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #tmpDevice:Landroid/bluetooth/BluetoothDevice;
    :cond_1
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getCurrentDevices:deviceList.size="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x4

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v4, v5, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 494
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v4

    new-array v4, v4, [Landroid/bluetooth/BluetoothDevice;

    invoke-interface {v0, v4}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/bluetooth/BluetoothDevice;

    return-object v4
.end method

.method public getProtocolMode(Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .parameter "device"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 402
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "BluetoothHidServer getProtocolMode"

    const/4 v3, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 403
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 405
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 406
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 407
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverGetProtocolReqNative(Ljava/lang/String;)V
    invoke-static {v1, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)V

    .line 412
    :cond_0
    :goto_0
    return-void

    .line 409
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "error state to getProtocolMode"

    const/4 v3, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public getReport(Landroid/bluetooth/BluetoothDevice;BBI)V
    .locals 4
    .parameter "device"
    .parameter "reportType"
    .parameter "reportId"
    .parameter "bufferSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 374
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "BluetoothHidServer getReport"

    const/4 v3, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 375
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 377
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 378
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 379
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverGetReportReqNative(Ljava/lang/String;II)V
    invoke-static {v1, v0, p2, p3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;II)V

    .line 384
    :cond_0
    :goto_0
    return-void

    .line 381
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "error state to getReport"

    const/4 v3, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public getState(Landroid/bluetooth/BluetoothDevice;)I
    .locals 4
    .parameter "device"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 444
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    .line 469
    :goto_0
    return v1

    .line 448
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 449
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    .line 451
    .local v0, tmpStr:Ljava/lang/String;
    const-string v1, "connecting"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "authorize"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 454
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 455
    :cond_2
    const-string v1, "connected"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 457
    const/4 v1, 0x2

    goto :goto_0

    .line 458
    :cond_3
    const-string v1, "disconnect"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    move v1, v2

    .line 460
    goto :goto_0

    .line 461
    :cond_4
    const-string v1, "disconnecting"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "unplug"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 464
    :cond_5
    const/4 v1, 0x3

    goto :goto_0

    .end local v0           #tmpStr:Ljava/lang/String;
    :cond_6
    move v1, v2

    .line 469
    goto :goto_0
.end method

.method public sendData(Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V
    .locals 4
    .parameter "device"
    .parameter "report"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 388
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "BluetoothHidServer sendData"

    const/4 v3, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 389
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 391
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 392
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 393
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverSendReportReqNative(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v0, p2}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    :cond_0
    :goto_0
    return-void

    .line 395
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "error state to sendData"

    const/4 v3, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public setProtocolMode(Landroid/bluetooth/BluetoothDevice;I)V
    .locals 4
    .parameter "device"
    .parameter "protocolMode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 417
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "BluetoothHidServer setProtocolMode"

    const/4 v3, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 418
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 420
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 421
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 422
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverSetProtocolReqNative(Ljava/lang/String;I)V
    invoke-static {v1, v0, p2}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1300(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 427
    :cond_0
    :goto_0
    return-void

    .line 424
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "error state to setProtocolMode"

    const/4 v3, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public setReport(Landroid/bluetooth/BluetoothDevice;BLjava/lang/String;)V
    .locals 4
    .parameter "device"
    .parameter "reportType"
    .parameter "report"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 359
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "BluetoothHidServer setReport"

    const/4 v3, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 360
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 362
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 363
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 364
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverSetReportReqNative(Ljava/lang/String;ILjava/lang/String;)V
    invoke-static {v1, v0, p2, p3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;ILjava/lang/String;)V

    .line 369
    :cond_0
    :goto_0
    return-void

    .line 366
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "error state to setReport"

    const/4 v3, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public virtualUnplug(Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .parameter "device"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 431
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "BluetoothHidServer virtualUnplug"

    const/4 v3, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 432
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 434
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 435
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 436
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverUnplugReqNative(Ljava/lang/String;)V
    invoke-static {v1, v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1400(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)V

    .line 441
    :cond_0
    :goto_0
    return-void

    .line 438
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v2, "error state to virtualUnplug"

    const/4 v3, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0
.end method
