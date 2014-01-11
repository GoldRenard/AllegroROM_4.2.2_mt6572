.class Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;
.super Landroid/os/Handler;
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
    .line 158
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .parameter "msg"

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0xd

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 160
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[MSG] handleMessage("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 161
    iget v1, p1, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_0

    .line 225
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    const-string v2, "Unsupported indication"

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->errorLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$800(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 228
    :goto_0
    return-void

    .line 164
    :sswitch_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    const-string v2, "Handling: PBAP_AUTHORIZE_IND"

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 165
    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    iput-object v1, v2, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    .line 166
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mRemoteDevice="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v3, v3, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 167
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getTrustState="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v3, v3, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getTrustState()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 168
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v1, v1, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getTrustState()Z

    move-result v1

    if-nez v1, :cond_1

    .line 169
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->setServerNotification(I)V
    invoke-static {v1, v6}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$300(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;I)V

    .line 170
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v1, v6}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$402(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;I)I

    goto :goto_0

    .line 172
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPbapServer:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->accept(Z)Z

    goto :goto_0

    .line 177
    :sswitch_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    const-string v2, "Handling: PBAP_AUTH_CHALL_IND"

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 178
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->setServerNotification(I)V
    invoke-static {v1, v8}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$300(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;I)V

    .line 179
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v1, v6}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$402(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;I)I

    goto/16 :goto_0

    .line 183
    :sswitch_2
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mBluetoothService:Landroid/bluetooth/IBluetooth;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$500(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Landroid/bluetooth/IBluetooth;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v2, v2, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    const/16 v3, 0xd

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-interface {v1, v2, v3, v4, v5}, Landroid/bluetooth/IBluetooth;->sendConnectionStateChange(Landroid/bluetooth/BluetoothDevice;III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    :goto_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mIsConnected:Z
    invoke-static {v1, v6}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$602(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Z)Z

    .line 190
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v1, v8}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$402(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;I)I

    .line 191
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mIsConnected changed2="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mIsConnected:Z
    invoke-static {v3}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$600(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 193
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    const-string v2, "Handling: PBAP_SESSION_ESTABLISHED"

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 185
    :catch_0
    move-exception v0

    .line 186
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BluetoothPbapService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 197
    .end local v0           #e:Landroid/os/RemoteException;
    :sswitch_3
    :try_start_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mIsConnected:Z
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$600(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 198
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mBluetoothService:Landroid/bluetooth/IBluetooth;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$500(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Landroid/bluetooth/IBluetooth;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v2, v2, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    const/16 v3, 0xd

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-interface {v1, v2, v3, v4, v5}, Landroid/bluetooth/IBluetooth;->sendConnectionStateChange(Landroid/bluetooth/BluetoothDevice;III)V

    .line 200
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    const/4 v2, 0x0

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mIsConnected:Z
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$602(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Z)Z

    .line 201
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mIsConnected changed1="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mIsConnected:Z
    invoke-static {v3}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$600(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 207
    :cond_2
    :goto_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mServerState:I
    invoke-static {v1, v7}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$402(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;I)I

    .line 209
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->cancelServerNotification()V
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$200(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)V

    .line 210
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    const-string v2, "Handling: PBAP_SESSION_DISCONNECTED"

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 203
    :catch_1
    move-exception v0

    .line 204
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v1, "BluetoothPbapService"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 215
    .end local v0           #e:Landroid/os/RemoteException;
    :sswitch_4
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPid:I
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$700(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)I

    move-result v1

    invoke-static {v4, v6}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v2

    if-ne v1, v2, :cond_4

    .line 217
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPbapServer:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    move-result-object v1

    invoke-virtual {v1, v7}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->accept(Z)Z

    .line 222
    :cond_3
    :goto_3
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->cancelServerNotification()V
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$200(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)V

    goto/16 :goto_0

    .line 218
    :cond_4
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPid:I
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$700(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)I

    move-result v1

    invoke-static {v4, v8}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 220
    iget-object v1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPbapServer:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
    invoke-static {v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    move-result-object v1

    invoke-virtual {v1, v6, v5, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->authChallRsp(ZLjava/lang/String;Ljava/lang/String;)Z

    goto :goto_3

    .line 161
    :sswitch_data_0
    .sparse-switch
        0x65 -> :sswitch_0
        0x66 -> :sswitch_1
        0x67 -> :sswitch_2
        0x68 -> :sswitch_3
        0x3e9 -> :sswitch_4
        0x3ea -> :sswitch_4
    .end sparse-switch
.end method
