.class Lcom/mediatek/oobe/basic/wifi/WifiSettings$2;
.super Ljava/lang/Object;
.source "WifiSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/wifi/WifiSettings;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 256
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 259
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;
    invoke-static {v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->access$200(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$2;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->onAddNetworkPressed()V

    .line 262
    :cond_0
    return-void
.end method
