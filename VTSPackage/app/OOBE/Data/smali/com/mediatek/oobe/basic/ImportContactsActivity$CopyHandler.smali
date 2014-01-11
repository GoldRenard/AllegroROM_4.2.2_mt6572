.class Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;
.super Landroid/os/Handler;
.source "ImportContactsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CopyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;


# direct methods
.method private constructor <init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1004
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;Lcom/mediatek/oobe/basic/ImportContactsActivity$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1004
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;-><init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    .line 1007
    iget v1, p1, Landroid/os/Message;->what:I

    .line 1008
    .local v1, msgId:I
    packed-switch v1, :pswitch_data_0

    .line 1036
    :goto_0
    return-void

    .line 1010
    :pswitch_0
    iget v2, p1, Landroid/os/Message;->arg1:I

    .line 1011
    .local v2, simIndex:I
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-virtual {v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "CopyHandler, simIndex="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", mTotalCount="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v5

    aget-object v5, v5, v2

    iget v5, v5, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", success count="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v5

    aget-object v5, v5, v2

    iget v5, v5, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1014
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v3}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v3

    aget-object v3, v3, v2

    iget v3, v3, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v4

    aget-object v4, v4, v2

    iget v4, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mTotalCount:I

    if-lt v3, v4, :cond_0

    .line 1015
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->finishProgressBar(I)V
    invoke-static {v3, v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1300(Lcom/mediatek/oobe/basic/ImportContactsActivity;I)V

    goto :goto_0

    .line 1017
    :cond_0
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    iget-object v4, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v4}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v4

    aget-object v4, v4, v2

    iget v4, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->incrementProgressTo(II)V
    invoke-static {v3, v2, v4}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1400(Lcom/mediatek/oobe/basic/ImportContactsActivity;II)V

    goto :goto_0

    .line 1021
    .end local v2           #simIndex:I
    :pswitch_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-static {}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1100()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 1022
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v3}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v3

    aget-object v3, v3, v0

    iget-boolean v3, v3, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-eqz v3, :cond_1

    .line 1023
    const-string v3, "OOBE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-virtual {v5}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "slot "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " finish importing"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1024
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->finishProgressBar(I)V
    invoke-static {v3, v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1300(Lcom/mediatek/oobe/basic/ImportContactsActivity;I)V

    .line 1021
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1027
    :cond_2
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    const/4 v4, 0x3

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateUI(I)V
    invoke-static {v3, v4}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1500(Lcom/mediatek/oobe/basic/ImportContactsActivity;I)V

    goto/16 :goto_0

    .line 1030
    .end local v0           #i:I
    :pswitch_2
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->dealWithCancel()V
    invoke-static {v3}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V

    .line 1031
    iget-object v3, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyHandler;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    const/4 v4, 0x4

    #calls: Lcom/mediatek/oobe/basic/ImportContactsActivity;->updateUI(I)V
    invoke-static {v3, v4}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1500(Lcom/mediatek/oobe/basic/ImportContactsActivity;I)V

    goto/16 :goto_0

    .line 1008
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
