.class Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;
.super Landroid/content/BroadcastReceiver;
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
    .line 247
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, 0x0

    .line 250
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, action:Ljava/lang/String;
    const-string v7, "android.bluetooth.device.action.NAME_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 252
    const-string v7, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 253
    .local v1, device:Landroid/bluetooth/BluetoothDevice;
    if-nez v1, :cond_1

    .line 255
    const-string v7, "[BT][PAN][BluetoothPANService]"

    const-string v8, "ERROR: device null"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    .end local v1           #device:Landroid/bluetooth/BluetoothDevice;
    :cond_0
    :goto_0
    return-void

    .line 260
    .restart local v1       #device:Landroid/bluetooth/BluetoothDevice;
    :cond_1
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Ljava/util/HashMap;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 261
    .local v6, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-eqz v6, :cond_0

    .line 265
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    .line 267
    .local v2, deviceAddr:Ljava/lang/String;
    const/4 v5, 0x0

    .line 268
    .local v5, notifyS:Ljava/lang/String;
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    iget-object v7, v7, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v7, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 269
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    iget-object v7, v7, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 271
    :cond_2
    if-nez v5, :cond_3

    .line 273
    const-string v7, "[BT][PAN][BluetoothPANService]"

    const-string v8, "ERROR: notify_s null"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 278
    :cond_3
    const/4 v4, 0x0

    .line 279
    .local v4, notifyID:I
    const/4 v3, 0x0

    .line 280
    .local v3, noti:Landroid/app/Notification;
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 281
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #calls: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->genPanNotification(ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;
    invoke-static {v7, v4, v1, v9}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$100(Lcom/mediatek/bluetooth/pan/BluetoothPanService;ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;

    move-result-object v3

    .line 282
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$200(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/app/NotificationManager;

    move-result-object v7

    invoke-virtual {v7, v4, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    .line 283
    .end local v1           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v2           #deviceAddr:Ljava/lang/String;
    .end local v3           #noti:Landroid/app/Notification;
    .end local v4           #notifyID:I
    .end local v5           #notifyS:Ljava/lang/String;
    .end local v6           #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    :cond_4
    const-string v7, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 284
    const-string v7, "android.bluetooth.adapter.extra.STATE"

    const/high16 v8, -0x8000

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    const/16 v8, 0xd

    if-ne v7, v8, :cond_0

    .line 286
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$300(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 287
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mReceiver:Landroid/content/BroadcastReceiver;
    invoke-static {v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$400(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/content/BroadcastReceiver;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 288
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-virtual {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->localClearService()V

    .line 289
    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z
    invoke-static {v7, v9}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$302(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Z)Z

    goto :goto_0
.end method
