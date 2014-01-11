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
    .registers 2
    .parameter

    .prologue
    .line 1357
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .parameter "msg"

    .prologue
    .line 1360
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_3a

    .line 1379
    :cond_5
    :goto_5
    return-void

    .line 1362
    :sswitch_6
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-nez v0, :cond_1b

    .line 1363
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1300(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)Lcom/android/internal/util/AsyncChannel;

    move-result-object v0

    const v1, 0x11001

    invoke-static {p0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/util/AsyncChannel;->sendMessage(Landroid/os/Message;)V

    goto :goto_5

    .line 1366
    :cond_1b
    const-string v0, "NetworkControllerGemini"

    const-string v1, "Failed to connect to wifi"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 1370
    :sswitch_23
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1400(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;)I

    move-result v1

    if-eq v0, v1, :cond_5

    .line 1371
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->access$1402(Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;I)I

    .line 1372
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini$WifiHandler;->this$0:Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/policy/NetworkControllerGemini;->refreshViews()V

    goto :goto_5

    .line 1360
    :sswitch_data_3a
    .sparse-switch
        0x1 -> :sswitch_23
        0x11000 -> :sswitch_6
    .end sparse-switch
.end method
