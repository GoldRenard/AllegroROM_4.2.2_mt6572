.class Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$1;
.super Landroid/os/Handler;
.source "BluetoothServerAuthorize.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;)V
    .locals 0
    .parameter

    .prologue
    .line 120
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 122
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 127
    const-string v0, "BluetoothServerAuthorize"

    const-string v1, "Unsupported indication"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    :goto_0
    return-void

    .line 124
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$1;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    const/4 v1, 0x4

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->sendAuthResult(I)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;I)V

    goto :goto_0

    .line 122
    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
    .end packed-switch
.end method
