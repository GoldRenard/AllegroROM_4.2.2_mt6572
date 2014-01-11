.class Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;
.super Ljava/lang/Thread;
.source "BluetoothPanService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pan/BluetoothPanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketListenerThread"
.end annotation


# instance fields
.field public stopped:Z

.field final synthetic this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;


# direct methods
.method private constructor <init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V
    .locals 0
    .parameter

    .prologue
    .line 297
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 297
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 302
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->stopped:Z

    if-nez v0, :cond_1

    .line 303
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #calls: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->listentoSocketNative()Z
    invoke-static {v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$500(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 304
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->stopped:Z

    goto :goto_0

    .line 308
    :cond_1
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "SocketListener stopped."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 314
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->stopped:Z

    .line 315
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #calls: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->wakeupListenerNative()V
    invoke-static {v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$600(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V

    .line 317
    return-void
.end method
