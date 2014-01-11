.class Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$1;
.super Ljava/lang/Object;
.source "BluetoothHidAlert.java"

# interfaces
.implements Landroid/content/ServiceConnection;


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
    .line 81
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "className"
    .parameter "service"

    .prologue
    .line 83
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    invoke-static {p2}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    move-result-object v1

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->access$002(Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    .line 84
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert$1;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->mServerNotify:Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;->access$002(Lcom/mediatek/bluetooth/hid/BluetoothHidAlert;Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    .line 88
    return-void
.end method
