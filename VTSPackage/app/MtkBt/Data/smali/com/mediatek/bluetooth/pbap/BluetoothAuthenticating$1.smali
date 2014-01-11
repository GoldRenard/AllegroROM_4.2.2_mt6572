.class Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$1;
.super Landroid/os/Handler;
.source "BluetoothAuthenticating.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;)V
    .locals 0
    .parameter

    .prologue
    .line 102
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 104
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 109
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "Unsupported indication"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    :goto_0
    return-void

    .line 106
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;

    const/4 v1, 0x4

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendResult(I)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;I)V

    goto :goto_0

    .line 104
    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
    .end packed-switch
.end method
