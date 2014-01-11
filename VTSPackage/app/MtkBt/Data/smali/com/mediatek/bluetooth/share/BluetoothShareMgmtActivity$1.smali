.class Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity$1;
.super Ljava/lang/Object;
.source "BluetoothShareMgmtActivity.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 89
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity$1;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabChanged(Ljava/lang/String;)V
    .locals 2
    .parameter "tabId"

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OnTabChanged() TabId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 94
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity$1;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;

    iput-object p1, v0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OnTabChanged() CurrentTab = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity$1;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;

    iget-object v1, v1, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;->CurrentTab:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 97
    return-void
.end method
