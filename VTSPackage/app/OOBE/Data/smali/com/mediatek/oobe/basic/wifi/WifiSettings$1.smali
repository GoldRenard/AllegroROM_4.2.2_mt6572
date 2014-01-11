.class Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;
.super Landroid/content/BroadcastReceiver;
.source "WifiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/wifi/WifiSettings;-><init>()V
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
    .line 233
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    #calls: Lcom/mediatek/oobe/basic/wifi/WifiSettings;->handleEvent(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-static {v0, p1, p2}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->access$000(Lcom/mediatek/oobe/basic/wifi/WifiSettings;Landroid/content/Context;Landroid/content/Intent;)V

    .line 237
    return-void
.end method
