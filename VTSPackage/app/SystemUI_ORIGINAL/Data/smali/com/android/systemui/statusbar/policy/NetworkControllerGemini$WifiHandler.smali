.class Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;
.super Landroid/os/Handler;
.source "NetworkControllerGemini.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WifiHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)V
    .locals 0
    .parameter

    .prologue
    .line 1314
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 1317
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 1336
    :cond_0
    :goto_0
    return-void

    .line 1319
    :sswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-nez v0, :cond_1

    .line 1320
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiChannel:Lcom/android/internal/util/AsyncChannel;
    invoke-static {v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)Lcom/android/internal/util/AsyncChannel;

    move-result-object v0

    const v1, 0x11001

    invoke-static {p0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/util/AsyncChannel;->sendMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 1323
    :cond_1
    const-string v0, "NetworkControllerGemini"

    const-string v1, "Failed to connect to wifi"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1327
    :sswitch_1
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    #getter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I
    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 1328
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    iget v1, p1, Landroid/os/Message;->arg1:I

    #setter for: Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->mWifiActivity:I
    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1402(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)I

    .line 1329
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto :goto_0

    .line 1317
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x11000 -> :sswitch_0
    .end sparse-switch
.end method
