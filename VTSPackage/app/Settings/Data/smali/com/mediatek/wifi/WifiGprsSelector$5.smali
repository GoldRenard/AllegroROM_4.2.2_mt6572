.class Lcom/mediatek/wifi/WifiGprsSelector$5;
.super Landroid/os/Handler;
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
.method constructor <init>(Lcom/mediatek/wifi/WifiGprsSelector;)V
    .locals 0
    .parameter

    .prologue
    .line 228
    iput-object p1, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/16 v3, 0x3e9

    const/4 v2, 0x0

    .line 231
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 251
    :goto_0
    return-void

    .line 233
    :pswitch_0
    const-string v0, "WifiGprsSelector"

    const-string v1, "attach time out......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-virtual {v0}, Lcom/mediatek/wifi/WifiGprsSelector;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->removeDialog(I)V
    invoke-static {v0, v3}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1300(Lcom/mediatek/wifi/WifiGprsSelector;I)V

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mIsGprsSwitching:Z
    invoke-static {v0, v2}, Lcom/mediatek/wifi/WifiGprsSelector;->access$102(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 238
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->updateDataEnabler()V
    invoke-static {v0}, Lcom/mediatek/wifi/WifiGprsSelector;->access$300(Lcom/mediatek/wifi/WifiGprsSelector;)V

    goto :goto_0

    .line 241
    :pswitch_1
    const-string v0, "WifiGprsSelector"

    const-string v1, "detach time out......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-virtual {v0}, Lcom/mediatek/wifi/WifiGprsSelector;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 243
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->removeDialog(I)V
    invoke-static {v0, v3}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1400(Lcom/mediatek/wifi/WifiGprsSelector;I)V

    .line 245
    :cond_1
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mIsGprsSwitching:Z
    invoke-static {v0, v2}, Lcom/mediatek/wifi/WifiGprsSelector;->access$102(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 246
    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$5;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->updateDataEnabler()V
    invoke-static {v0}, Lcom/mediatek/wifi/WifiGprsSelector;->access$300(Lcom/mediatek/wifi/WifiGprsSelector;)V

    goto :goto_0

    .line 231
    nop

    :pswitch_data_0
    .packed-switch 0x7d0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
