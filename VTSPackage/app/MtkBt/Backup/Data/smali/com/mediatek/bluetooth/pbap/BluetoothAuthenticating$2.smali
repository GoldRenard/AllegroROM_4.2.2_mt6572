.class Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$2;
.super Landroid/content/BroadcastReceiver;
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
    .line 115
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 117
    const-string v0, "BluetoothAuthenticating"

    const-string v1, "onReceive()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;

    const/4 v1, 0x3

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->sendResult(I)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;I)V

    .line 119
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothAuthenticating;->finish()V

    .line 120
    return-void
.end method
