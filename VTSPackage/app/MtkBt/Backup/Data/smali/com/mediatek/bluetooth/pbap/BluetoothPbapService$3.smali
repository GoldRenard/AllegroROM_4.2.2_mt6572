.class Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;
.super Landroid/bluetooth/IBluetoothPbap$Stub;
.source "BluetoothPbapService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)V
    .locals 0
    .parameter

    .prologue
    .line 238
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    invoke-direct {p0}, Landroid/bluetooth/IBluetoothPbap$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public connect(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    .line 249
    const/4 v0, 0x0

    return v0
.end method

.method public disconnect()V
    .locals 3

    .prologue
    .line 253
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PBAP disconnect(), state =("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$400(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$400(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 255
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPbapServer:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->disconnect()V

    .line 265
    :cond_0
    :goto_0
    return-void

    .line 257
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$400(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 258
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServiceHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$900(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 259
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServiceHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$900(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServiceHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$900(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x3ea

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    .line 262
    :cond_2
    const-string v0, "BluetoothPbapService"

    const-string v1, "mServiceHandler is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getClient()Landroid/bluetooth/BluetoothDevice;
    .locals 1

    .prologue
    .line 245
    const/4 v0, 0x0

    return-object v0
.end method

.method public getState()I
    .locals 3

    .prologue
    .line 240
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PBAP getState()=("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$400(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 241
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$400(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)I

    move-result v0

    return v0
.end method

.method public isConnected(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 1
    .parameter "device"

    .prologue
    .line 268
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mIsConnected:Z
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$600(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Z

    move-result v0

    return v0
.end method
