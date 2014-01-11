.class Lcom/mediatek/oobe/basic/gemini/SimManagement$13;
.super Landroid/os/Handler;
.source "SimManagement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/gemini/SimManagement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter

    .prologue
    .line 1478
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    const/16 v5, 0x44e

    const/16 v4, 0x3ec

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 1481
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 1518
    :goto_0
    return-void

    .line 1483
    :pswitch_0
    const-string v0, "SimManagementSettings"

    const-string v1, "detach time out......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1485
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v0

    if-ne v0, v5, :cond_0

    .line 1487
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static {v0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$502(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)I

    .line 1489
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1490
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V
    invoke-static {v0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2900(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V

    .line 1493
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateGprsSettings()V

    .line 1496
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z
    invoke-static {v0, v3}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1202(Lcom/mediatek/oobe/basic/gemini/SimManagement;Z)Z

    goto :goto_0

    .line 1499
    :pswitch_1
    const-string v0, "SimManagementSettings"

    const-string v1, "attach time out......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1501
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v0

    if-ne v0, v5, :cond_1

    .line 1503
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static {v0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$502(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)I

    .line 1505
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1506
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V
    invoke-static {v0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$3000(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V

    .line 1509
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateGprsSettings()V

    .line 1513
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z
    invoke-static {v0, v3}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1202(Lcom/mediatek/oobe/basic/gemini/SimManagement;Z)Z

    goto :goto_0

    .line 1481
    :pswitch_data_0
    .packed-switch 0x7d0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
