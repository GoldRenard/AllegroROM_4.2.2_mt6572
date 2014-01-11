.class Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$1;
.super Ljava/lang/Object;
.source "BluetoothPanAlert.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;)V
    .locals 0
    .parameter

    .prologue
    .line 80
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;

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
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;

    invoke-static {p2}, Lcom/mediatek/bluetooth/pan/IBluetoothPanAction$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    move-result-object v1

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->access$002(Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;)Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    .line 84
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$1;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->mServerNotify:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->access$002(Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;)Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;

    .line 89
    return-void
.end method
