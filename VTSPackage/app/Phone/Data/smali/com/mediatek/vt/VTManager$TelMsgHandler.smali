.class Lcom/mediatek/vt/VTManager$TelMsgHandler;
.super Landroid/os/Handler;
.source "VTManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/VTManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TelMsgHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/VTManager;


# direct methods
.method private constructor <init>(Lcom/mediatek/vt/VTManager;)V
    .locals 0
    .parameter

    .prologue
    .line 615
    iput-object p1, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/vt/VTManager;Lcom/mediatek/vt/VTManager$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 615
    invoke-direct {p0, p1}, Lcom/mediatek/vt/VTManager$TelMsgHandler;-><init>(Lcom/mediatek/vt/VTManager;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 619
    iget v3, p1, Landroid/os/Message;->what:I

    sparse-switch v3, :sswitch_data_0

    .line 665
    :cond_0
    :goto_0
    :sswitch_0
    return-void

    .line 621
    :sswitch_1
    iget v3, p1, Landroid/os/Message;->arg1:I

    if-nez v3, :cond_4

    move v2, v4

    .line 622
    .local v2, isDisconent:Z
    :goto_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 623
    .local v0, ar:Landroid/os/AsyncResult;
    if-eqz v0, :cond_1

    .line 624
    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    aget v3, v3, v5

    if-eqz v3, :cond_5

    move v2, v4

    .line 626
    :cond_1
    :goto_2
    if-nez v2, :cond_0

    .line 637
    sget-object v3, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    iget-object v4, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v4, v4, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-eq v3, v4, :cond_2

    sget-object v3, Lcom/mediatek/vt/VTManager$State;->OPEN:Lcom/mediatek/vt/VTManager$State;

    iget-object v4, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v4, v4, Lcom/mediatek/vt/VTManager;->mState:Lcom/mediatek/vt/VTManager$State;

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    #getter for: Lcom/mediatek/vt/VTManager;->mStartVTSMALFail:Z
    invoke-static {v3}, Lcom/mediatek/vt/VTManager;->access$600(Lcom/mediatek/vt/VTManager;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 638
    :cond_2
    iget-object v3, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v4, v3, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    monitor-enter v4

    .line 640
    :try_start_0
    const-string v3, "VTManager"

    const-string v5, "wait for setVTReadyImpl"

    invoke-static {v3, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 641
    iget-object v3, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    iget-object v3, v3, Lcom/mediatek/vt/VTManager;->mTelMsgHandler:Landroid/os/Handler;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 646
    :goto_3
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 650
    :cond_3
    iget-object v3, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    #getter for: Lcom/mediatek/vt/VTManager;->mStartVTSMALFail:Z
    invoke-static {v3}, Lcom/mediatek/vt/VTManager;->access$600(Lcom/mediatek/vt/VTManager;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 651
    iget-object v3, p0, Lcom/mediatek/vt/VTManager$TelMsgHandler;->this$0:Lcom/mediatek/vt/VTManager;

    invoke-virtual {v3}, Lcom/mediatek/vt/VTManager;->onConnected()V

    goto :goto_0

    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v2           #isDisconent:Z
    :cond_4
    move v2, v5

    .line 621
    goto :goto_1

    .restart local v0       #ar:Landroid/os/AsyncResult;
    .restart local v2       #isDisconent:Z
    :cond_5
    move v2, v5

    .line 624
    goto :goto_2

    .line 642
    :catch_0
    move-exception v1

    .line 643
    .local v1, e:Ljava/lang/InterruptedException;
    :try_start_2
    const-string v3, "VTManager"

    const-string v5, "wait for setVTReadyImpl, wait error"

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3

    .line 646
    .end local v1           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 660
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v2           #isDisconent:Z
    :sswitch_2
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Looper;->quit()V

    goto :goto_0

    .line 619
    nop

    :sswitch_data_0
    .sparse-switch
        0x6 -> :sswitch_1
        0x7 -> :sswitch_0
        0x8000000 -> :sswitch_2
    .end sparse-switch
.end method
