.class Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$3;
.super Ljava/lang/Object;
.source "BluetoothServerAuthorize.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->createView(Ljava/lang/String;)Landroid/view/View;
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
    .line 162
    iput-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 164
    const-string v0, "BluetoothServerAuthorize"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCheckedChanged : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    if-eqz p2, :cond_0

    .line 166
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    const/4 v1, 0x1

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowedValue:Z
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->access$202(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;Z)Z

    .line 170
    :goto_0
    return-void

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize$3;->this$0:Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->mAlwaysAllowedValue:Z
    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;->access$202(Lcom/mediatek/bluetooth/pbap/BluetoothServerAuthorize;Z)Z

    goto :goto_0
.end method
