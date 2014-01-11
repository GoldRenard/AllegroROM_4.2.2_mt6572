.class Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;
.super Ljava/lang/Thread;
.source "BluetoothHidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/BluetoothHidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketListenerThread"
.end annotation


# instance fields
.field public mStopped:Z

.field final synthetic this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;


# direct methods
.method private constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)V
    .locals 0
    .parameter

    .prologue
    .line 180
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Lcom/mediatek/bluetooth/hid/BluetoothHidService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;-><init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 185
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;->mStopped:Z

    if-nez v0, :cond_1

    .line 186
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->listentoSocketNative()Z
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 187
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;->mStopped:Z

    goto :goto_0

    .line 191
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v1, "SocketListener stopped."

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 192
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 195
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;->mStopped:Z

    .line 196
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$SocketListenerThread;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->wakeupListenerNative()V
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)V

    .line 198
    return-void
.end method
