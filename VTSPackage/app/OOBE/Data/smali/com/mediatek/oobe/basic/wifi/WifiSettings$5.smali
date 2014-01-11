.class Lcom/mediatek/oobe/basic/wifi/WifiSettings$5;
.super Ljava/lang/Object;
.source "WifiSettings.java"

# interfaces
.implements Landroid/net/wifi/WifiManager$ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/wifi/WifiSettings;->onActivityCreated(Landroid/os/Bundle;)V
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
    .line 322
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$5;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(I)V
    .locals 3
    .parameter "reason"

    .prologue
    .line 327
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$5;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 328
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 329
    const v1, 0x7f090114

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 331
    :cond_0
    return-void
.end method

.method public onSuccess()V
    .locals 0

    .prologue
    .line 324
    return-void
.end method
