.class Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$2;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothPanAlert.java"


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
    .line 92
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$2;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 95
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, recAction:Ljava/lang/String;
    const-string v2, "android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 97
    const-string v2, "android.bluetooth.profile.extra.STATE"

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 99
    .local v1, state:I
    if-nez v1, :cond_0

    .line 100
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert$2;->this$0:Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;->finish()V

    .line 103
    .end local v1           #state:I
    :cond_0
    return-void
.end method
