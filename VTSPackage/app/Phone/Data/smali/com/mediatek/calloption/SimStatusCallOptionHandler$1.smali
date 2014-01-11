.class Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;
.super Landroid/os/Handler;
.source "SimStatusCallOptionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/SimStatusCallOptionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 59
    iput-object p1, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 62
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 74
    :cond_0
    :goto_0
    return-void

    .line 64
    :pswitch_0
    iget-object v1, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v1}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getCellConnMgr()Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    const/16 v3, 0x132

    iget-object v4, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRunnable:Ljava/lang/Runnable;
    invoke-static {v4}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$000(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/mediatek/CellConnService/CellConnMgr;->handleCellConn(IILjava/lang/Runnable;)I

    move-result v0

    .line 66
    .local v0, result:I
    iget-object v1, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "result = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$200(Lcom/mediatek/calloption/SimStatusCallOptionHandler;Ljava/lang/String;)V

    .line 67
    iget-object v1, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v1}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/calloption/Request;->getCellConnMgr()Lcom/mediatek/CellConnService/CellConnMgr;

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 68
    iget-object v1, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    iget-object v2, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v2}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->showProgressIndication(Lcom/mediatek/calloption/Request;)V

    goto :goto_0

    .line 62
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
    .end packed-switch
.end method
