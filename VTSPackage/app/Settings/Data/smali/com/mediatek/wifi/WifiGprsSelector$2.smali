.class Lcom/mediatek/wifi/WifiGprsSelector$2;
.super Landroid/database/ContentObserver;
.source "WifiGprsSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/wifi/WifiGprsSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/wifi/WifiGprsSelector;


# direct methods
.method constructor <init>(Lcom/mediatek/wifi/WifiGprsSelector;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 204
    iput-object p1, p0, Lcom/mediatek/wifi/WifiGprsSelector$2;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 2
    .parameter "selfChange"

    .prologue
    .line 207
    const-string v0, "WifiGprsSelector"

    const-string v1, "Gprs connection changed"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$2;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$2;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->getSimSlot()I
    invoke-static {v1}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1000(Lcom/mediatek/wifi/WifiGprsSelector;)I

    move-result v1

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mSimSlot:I
    invoke-static {v0, v1}, Lcom/mediatek/wifi/WifiGprsSelector;->access$902(Lcom/mediatek/wifi/WifiGprsSelector;I)I

    .line 209
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$2;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->updateDataEnabler()V
    invoke-static {v0}, Lcom/mediatek/wifi/WifiGprsSelector;->access$300(Lcom/mediatek/wifi/WifiGprsSelector;)V

    .line 210
    return-void
.end method
