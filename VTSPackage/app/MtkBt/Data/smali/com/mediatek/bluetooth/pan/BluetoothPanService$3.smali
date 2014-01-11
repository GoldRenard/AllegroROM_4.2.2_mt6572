.class Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;
.super Landroid/bluetooth/IBluetoothPan$Stub;
.source "BluetoothPanService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pan/BluetoothPanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V
    .locals 0
    .parameter

    .prologue
    .line 506
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-direct {p0}, Landroid/bluetooth/IBluetoothPan$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public connect(Landroid/bluetooth/BluetoothDevice;)V
    .locals 3
    .parameter "device"

    .prologue
    .line 511
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 513
    .local v0, btAddr:Ljava/lang/String;
    const-string v1, "[BT][PAN][BluetoothPANService]"

    const-string v2, "BluetoothPanServer Connect"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    const/4 v2, 0x2

    invoke-virtual {v1, v0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->connectPanDevice(Ljava/lang/String;I)V

    .line 519
    return-void
.end method

.method public disconnect(Landroid/bluetooth/BluetoothDevice;)V
    .locals 3
    .parameter "device"

    .prologue
    .line 525
    const-string v1, "[BT][PAN][BluetoothPANService]"

    const-string v2, "BluetoothPanServer Disconnect"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 529
    .local v0, btAddr:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-virtual {v1, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->disconnectPanDevice(Ljava/lang/String;)V

    .line 530
    return-void
.end method

.method public getConnectedDevices()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 544
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 546
    .local v1, devices:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;
    invoke-static {v4}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Ljava/util/HashMap;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 547
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;
    invoke-static {v4}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Ljava/util/HashMap;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 548
    .local v3, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v3, :cond_2

    .line 555
    .end local v0           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v3           #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    :cond_1
    return-object v1

    .line 551
    .restart local v0       #device:Landroid/bluetooth/BluetoothDevice;
    .restart local v3       #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    :cond_2
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 552
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getDevicesMatchingConnectionStates([I)Ljava/util/List;
    .locals 9
    .parameter "states"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List",
            "<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 560
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 562
    .local v2, devices:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;
    invoke-static {v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Ljava/util/HashMap;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 563
    .local v1, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;
    invoke-static {v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Ljava/util/HashMap;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 564
    .local v6, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v6, :cond_2

    .line 575
    .end local v1           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v6           #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    :cond_1
    return-object v2

    .line 568
    .restart local v1       #device:Landroid/bluetooth/BluetoothDevice;
    .restart local v6       #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    :cond_2
    move-object v0, p1

    .local v0, arr$:[I
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_1
    if-ge v4, v5, :cond_0

    aget v7, v0, v4

    .line 569
    .local v7, state:I
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v6}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v8

    if-ne v7, v8, :cond_3

    .line 570
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 568
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method public getState(Landroid/bluetooth/BluetoothDevice;)I
    .locals 2
    .parameter "device"

    .prologue
    .line 535
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 536
    .local v0, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v0, :cond_0

    .line 537
    const/4 v1, 0x0

    .line 539
    :goto_0
    return v1

    :cond_0
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v1

    goto :goto_0
.end method

.method public isTetheringOn()Z
    .locals 1

    .prologue
    .line 610
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringOn:Z
    invoke-static {v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$1200(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Z

    move-result v0

    return v0
.end method

.method public setBluetoothTethering(Z)V
    .locals 3
    .parameter "value"

    .prologue
    .line 585
    if-nez p1, :cond_0

    .line 586
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #calls: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->disconnectPanServerDevices()V
    invoke-static {v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$900(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V

    .line 589
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$1000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v1

    const/16 v2, 0xc

    if-eq v1, v2, :cond_1

    if-eqz p1, :cond_1

    .line 590
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 591
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 592
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    new-instance v2, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3$1;

    invoke-direct {v2, p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3$1;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;)V

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringReceiver:Landroid/content/BroadcastReceiver;
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$1102(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Landroid/content/BroadcastReceiver;)Landroid/content/BroadcastReceiver;

    .line 602
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$1300(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringReceiver:Landroid/content/BroadcastReceiver;
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$1100(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/content/BroadcastReceiver;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 606
    .end local v0           #filter:Landroid/content/IntentFilter;
    :goto_0
    return-void

    .line 604
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringOn:Z
    invoke-static {v1, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$1202(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Z)Z

    goto :goto_0
.end method
