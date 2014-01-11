.class Lcom/mediatek/bluetooth/pan/BluetoothPanService$2;
.super Lcom/mediatek/bluetooth/pan/IBluetoothPanAction$Stub;
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
    .line 384
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$2;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/IBluetoothPanAction$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public authorizeRspAction(Ljava/lang/String;Z)V
    .locals 2
    .parameter "btAddr"
    .parameter "result"

    .prologue
    .line 396
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "authorizeRspAction"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$2;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-virtual {v0, p1, p2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->authorizeRsp(Ljava/lang/String;Z)V

    .line 399
    return-void
.end method

.method public disconnectPanDeviceAction(Ljava/lang/String;)V
    .locals 2
    .parameter "btAddr"

    .prologue
    .line 388
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "disconnectPanDeviceAction: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$2;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->disconnectPanDevice(Ljava/lang/String;)V

    .line 391
    return-void
.end method
