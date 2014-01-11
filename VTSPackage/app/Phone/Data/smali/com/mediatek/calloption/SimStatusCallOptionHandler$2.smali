.class Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;
.super Ljava/lang/Object;
.source "SimStatusCallOptionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    .line 77
    iput-object p1, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    .line 79
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v3}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getCellConnMgr()Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/CellConnService/CellConnMgr;->getResult()I

    move-result v1

    .line 80
    .local v1, result:I
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v3}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getCellConnMgr()Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/CellConnService/CellConnMgr;->getPreferSlot()I

    move-result v2

    .line 81
    .local v2, slot:I
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "run, result = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " slot = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$200(Lcom/mediatek/calloption/SimStatusCallOptionHandler;Ljava/lang/String;)V

    .line 83
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    invoke-virtual {v3}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->dismissProgressIndication()V

    .line 84
    const/4 v3, 0x4

    if-eq v1, v3, :cond_1

    .line 85
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v3}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;->onHandlingFinish()V

    .line 97
    :cond_0
    :goto_0
    return-void

    .line 87
    :cond_1
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v3}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.android.phone.extra.slot"

    invoke-virtual {v3, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 88
    .local v0, oldSolt:I
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "afterCheckSIMStatus, oldSolt = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$200(Lcom/mediatek/calloption/SimStatusCallOptionHandler;Ljava/lang/String;)V

    .line 89
    if-eq v0, v6, :cond_2

    if-eq v2, v0, :cond_2

    .line 90
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v3}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.android.phone.extra.slot"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 93
    :cond_2
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    iget-object v3, v3, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v3, :cond_0

    .line 94
    iget-object v3, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    iget-object v3, v3, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    iget-object v4, p0, Lcom/mediatek/calloption/SimStatusCallOptionHandler$2;->this$0:Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimStatusCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v4}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimStatusCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto :goto_0
.end method
