.class Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;
.super Landroid/content/BroadcastReceiver;
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
    .line 120
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 122
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onReceive("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 123
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, action:Ljava/lang/String;
    const-string v7, "com.android.bluetooth.pbap.authorize.return"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 126
    const-string v7, "com.mediatek.bluetooth.extra.authorize_always_allowed"

    const/4 v8, 0x0

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 127
    .local v2, alwaysaccept:Z
    const-string v7, "com.mediatek.bluetooth.extra.authorize_result"

    const/4 v8, 0x5

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    int-to-long v4, v7

    .line 128
    .local v4, res:J
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "PBAP_AUTHORIZE_RETURN_ACTION : result == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 129
    const-wide/16 v7, 0x1

    cmp-long v7, v4, v7

    if-nez v7, :cond_0

    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v7, v7, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v7, :cond_0

    .line 130
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v9, v9, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " : setTrust("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 131
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    iget-object v7, v7, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v7, v2}, Landroid/bluetooth/BluetoothDevice;->setTrust(Z)Z

    .line 133
    :cond_0
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPbapServer:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
    invoke-static {v7}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    move-result-object v8

    const-wide/16 v9, 0x1

    cmp-long v7, v4, v9

    if-nez v7, :cond_2

    const/4 v7, 0x1

    :goto_0
    invoke-virtual {v8, v7}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->accept(Z)Z

    .line 153
    .end local v2           #alwaysaccept:Z
    .end local v4           #res:J
    :cond_1
    :goto_1
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->cancelServerNotification()V
    invoke-static {v7}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$200(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)V

    .line 154
    return-void

    .line 133
    .restart local v2       #alwaysaccept:Z
    .restart local v4       #res:J
    :cond_2
    const/4 v7, 0x0

    goto :goto_0

    .line 136
    .end local v2           #alwaysaccept:Z
    .end local v4           #res:J
    :cond_3
    const-string v7, "com.android.bluetooth.pbap.authenticate.return"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 137
    const-string v7, "com.mediatek.bluetooth.extra.authenticate_result"

    const/4 v8, 0x5

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    int-to-long v4, v7

    .line 138
    .restart local v4       #res:J
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "PBAP_AUTHENTICATE_RETURN_ACTION : result == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->printLog(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;Ljava/lang/String;)V

    .line 139
    const-wide/16 v7, 0x1

    cmp-long v7, v4, v7

    if-nez v7, :cond_5

    .line 140
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    .line 141
    .local v1, adapter:Landroid/bluetooth/BluetoothAdapter;
    const-string v7, "com.mediatek.bluetooth.extra.autheticate_code"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 142
    .local v3, passcode:Ljava/lang/String;
    if-nez v1, :cond_4

    const/4 v6, 0x0

    .line 144
    .local v6, userid:Ljava/lang/String;
    :goto_2
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPbapServer:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
    invoke-static {v7}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8, v3, v6}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->authChallRsp(ZLjava/lang/String;Ljava/lang/String;)Z

    goto :goto_1

    .line 142
    .end local v6           #userid:Ljava/lang/String;
    :cond_4
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothAdapter;->getName()Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 147
    .end local v1           #adapter:Landroid/bluetooth/BluetoothAdapter;
    .end local v3           #passcode:Ljava/lang/String;
    :cond_5
    iget-object v7, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->mPbapServer:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
    invoke-static {v7}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapService;)Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    move-result-object v7

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v7, v8, v9, v10}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->authChallRsp(ZLjava/lang/String;Ljava/lang/String;)Z

    goto :goto_1
.end method
