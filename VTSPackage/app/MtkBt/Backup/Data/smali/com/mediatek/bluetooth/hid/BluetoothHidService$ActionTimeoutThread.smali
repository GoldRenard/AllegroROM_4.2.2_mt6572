.class Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
.super Ljava/lang/Thread;
.source "BluetoothHidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/BluetoothHidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionTimeoutThread"
.end annotation


# instance fields
.field public mBTAddr:Ljava/lang/String;

.field public mState:Ljava/lang/String;

.field private mStoped:Z

.field final synthetic this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;


# direct methods
.method private constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)V
    .locals 1
    .parameter

    .prologue
    .line 201
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 206
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->mStoped:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 201
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;-><init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)V

    return-void
.end method

.method private actionTimeout(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "btAddr"
    .parameter "state"

    .prologue
    const/4 v6, 0x5

    const/4 v7, 0x2

    .line 218
    const/4 v3, 0x0

    .line 219
    .local v3, timeout:Z
    const/4 v0, 0x0

    .line 220
    .local v0, cnt:I
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getDeviceState(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, p1}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$300(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 222
    .local v1, curState:Ljava/lang/String;
    if-nez v1, :cond_2

    .line 223
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ERROR: stateMap not contain "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v4, v5, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 250
    :cond_0
    :goto_0
    return-void

    .line 234
    :cond_1
    const-wide/16 v4, 0x64

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    :goto_1
    add-int/lit8 v0, v0, 0x64

    .line 227
    :cond_2
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    iget-boolean v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->mStoped:Z

    if-nez v4, :cond_3

    .line 228
    const v4, 0xea60

    if-lt v0, v4, :cond_1

    .line 229
    const/4 v3, 0x1

    .line 241
    :cond_3
    if-eqz v3, :cond_0

    .line 242
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v5, "Waiting action time-out. Force return."

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v4, v5, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 243
    const-string v4, "connected"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 244
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverDisconnectReqNative(Ljava/lang/String;)V
    invoke-static {v4, p1}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$400(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)V

    .line 245
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendServiceMsg(ILjava/lang/String;)V
    invoke-static {v4, v6, p1}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$500(Lcom/mediatek/bluetooth/hid/BluetoothHidService;ILjava/lang/String;)V

    goto :goto_0

    .line 235
    :catch_0
    move-exception v2

    .line 236
    .local v2, e:Ljava/lang/InterruptedException;
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v5, "Waiting for action was interrupted."

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v4, v5, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_1

    .line 246
    .end local v2           #e:Ljava/lang/InterruptedException;
    :cond_4
    const-string v4, "disconnect"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 247
    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/4 v5, 0x7

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendServiceMsg(ILjava/lang/String;)V
    invoke-static {v4, v5, p1}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$500(Lcom/mediatek/bluetooth/hid/BluetoothHidService;ILjava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->mBTAddr:Ljava/lang/String;

    iget-object v1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->mState:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->actionTimeout(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 214
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->mStoped:Z

    .line 215
    return-void
.end method
