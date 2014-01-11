.class Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;
.super Ljava/lang/Thread;
.source "BluetoothPbapServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PbapSocketListener"
.end annotation


# instance fields
.field public mStopListen:Z

.field final synthetic this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;


# direct methods
.method private constructor <init>(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;)V
    .locals 0
    .parameter

    .prologue
    .line 174
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 174
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;-><init>(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 179
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    const-string v1, "Start listening"

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Ljava/lang/String;)V

    .line 180
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->mStopListen:Z

    if-nez v0, :cond_1

    .line 181
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    const/4 v1, 0x0

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->listenIndicationNative(Z)Z
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    const-string v1, "listen failed"

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->errorLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->access$200(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Ljava/lang/String;)V

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->mStopListen:Z

    goto :goto_0

    .line 186
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer$PbapSocketListener;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;

    const-string v1, "SocketListener stopped."

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->printLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothPbapServer;Ljava/lang/String;)V

    .line 187
    return-void
.end method
