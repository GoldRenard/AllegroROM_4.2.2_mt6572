.class Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$2;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothHidAlert.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;)V
    .locals 0
    .parameter

    .prologue
    .line 272
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 275
    const-string v0, "com.mediatek.bluetooth.hid.finish"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 277
    const-string v0, "[BT][HID][BluetoothHidAlert]"

    const-string v1, "onReceive"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->access$102(Z)Z

    .line 280
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->finish()V

    .line 282
    :cond_0
    return-void
.end method
