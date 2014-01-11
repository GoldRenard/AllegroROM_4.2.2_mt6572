.class Lcom/mediatek/bluetooth/pan/BluetoothPanService$4;
.super Landroid/os/Handler;
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
    .line 1143
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$4;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 1148
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 1150
    const-string v2, "[BT][PAN][BluetoothPANService]"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleMessage(): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1152
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 1153
    .local v0, data:Landroid/os/Bundle;
    if-eqz v0, :cond_0

    const-string v2, "show toast"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1154
    .local v1, toastMsg:Ljava/lang/String;
    :goto_0
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 1161
    :goto_1
    return-void

    .line 1153
    .end local v1           #toastMsg:Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 1156
    .restart local v1       #toastMsg:Ljava/lang/String;
    :pswitch_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$4;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanService;

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->access$1300(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 1154
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
