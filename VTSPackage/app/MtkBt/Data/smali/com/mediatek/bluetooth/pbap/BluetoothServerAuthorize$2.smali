.class Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$2;
.super Landroid/content/BroadcastReceiver;
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
    .line 145
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 147
    const-string v0, "BluetoothServerAuthorize"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceive("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    const/4 v1, 0x3

    #calls: Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->sendAuthResult(I)V
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->access$000(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;I)V

    .line 149
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$2;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    #getter for: Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mInfoDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->access$100(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 150
    return-void
.end method
