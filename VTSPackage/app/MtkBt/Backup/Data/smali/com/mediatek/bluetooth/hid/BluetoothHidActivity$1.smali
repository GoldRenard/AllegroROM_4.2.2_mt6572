.class Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;
.super Ljava/lang/Object;
.source "BluetoothHidActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 417
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "className"
    .parameter "service"

    .prologue
    .line 419
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    const-string v1, "onServiceConnected"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V

    .line 420
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    invoke-static {p2}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v1

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$102(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    .line 421
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v0

    if-nez v0, :cond_0

    .line 423
    const-string v0, "[BT][HID][BluetoothHidActivity]"

    const-string v1, "ERROR:mServerNotify null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    :goto_0
    return-void

    .line 427
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getPreferenceList()V
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$200(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V

    .line 428
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$302(Z)Z

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 432
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$102(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    .line 433
    return-void
.end method
