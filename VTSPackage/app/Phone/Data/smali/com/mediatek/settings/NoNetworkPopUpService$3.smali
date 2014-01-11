.class Lcom/mediatek/settings/NoNetworkPopUpService$3;
.super Landroid/os/Handler;
.source "NoNetworkPopUpService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NoNetworkPopUpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NoNetworkPopUpService;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NoNetworkPopUpService;)V
    .locals 0
    .parameter

    .prologue
    .line 169
    iput-object p1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .parameter "msg"

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 172
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mSP:Landroid/content/SharedPreferences;
    invoke-static {v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$700(Lcom/mediatek/settings/NoNetworkPopUpService;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "no_service_key"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    #setter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mIsShouldShow:Z
    invoke-static {v0, v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$102(Lcom/mediatek/settings/NoNetworkPopUpService;Z)Z

    .line 173
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[isShouldShow = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mIsShouldShow:Z
    invoke-static {v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$100(Lcom/mediatek/settings/NoNetworkPopUpService;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$000(Lcom/mediatek/settings/NoNetworkPopUpService;Ljava/lang/String;)V

    .line 174
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[mAirplaneModeEnabled = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mAirplaneModeEnabled:Z
    invoke-static {v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$500(Lcom/mediatek/settings/NoNetworkPopUpService;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$000(Lcom/mediatek/settings/NoNetworkPopUpService;Ljava/lang/String;)V

    .line 175
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[mDualSimMode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDualSimMode:I
    invoke-static {v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$600(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$000(Lcom/mediatek/settings/NoNetworkPopUpService;Ljava/lang/String;)V

    .line 176
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[message id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$000(Lcom/mediatek/settings/NoNetworkPopUpService;Ljava/lang/String;)V

    .line 178
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mIsShouldShow:Z
    invoke-static {v0}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$100(Lcom/mediatek/settings/NoNetworkPopUpService;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mAirplaneModeEnabled:Z
    invoke-static {v0}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$500(Lcom/mediatek/settings/NoNetworkPopUpService;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 211
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mNetworkResponse:Landroid/os/Handler;
    invoke-static {v0}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$300(Lcom/mediatek/settings/NoNetworkPopUpService;)Landroid/os/Handler;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->what:I

    iget-object v2, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDelayTime:I
    invoke-static {v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$400(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 212
    return-void

    .line 181
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->isSimReady(I)Z
    invoke-static {v0, v3}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$800(Lcom/mediatek/settings/NoNetworkPopUpService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    iget v1, p1, Landroid/os/Message;->what:I

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->startNWActivity(II)V
    invoke-static {v0, v1, v3}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$900(Lcom/mediatek/settings/NoNetworkPopUpService;II)V

    goto :goto_0

    .line 186
    :pswitch_1
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDualSimMode:I
    invoke-static {v0}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$600(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-ne v0, v4, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->isSimReady(I)Z
    invoke-static {v0, v3}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$800(Lcom/mediatek/settings/NoNetworkPopUpService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    iget v1, p1, Landroid/os/Message;->what:I

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->startNWActivity(II)V
    invoke-static {v0, v1, v3}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$900(Lcom/mediatek/settings/NoNetworkPopUpService;II)V

    goto :goto_0

    .line 191
    :pswitch_2
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDualSimMode:I
    invoke-static {v0}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$600(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-ne v0, v5, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->isSimReady(I)Z
    invoke-static {v0, v4}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$800(Lcom/mediatek/settings/NoNetworkPopUpService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    iget v1, p1, Landroid/os/Message;->what:I

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->startNWActivity(II)V
    invoke-static {v0, v1, v4}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$900(Lcom/mediatek/settings/NoNetworkPopUpService;II)V

    goto :goto_0

    .line 197
    :pswitch_3
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDualSimMode:I
    invoke-static {v0}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$600(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->isSimReady(I)Z
    invoke-static {v0, v5}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$800(Lcom/mediatek/settings/NoNetworkPopUpService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    iget v1, p1, Landroid/os/Message;->what:I

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->startNWActivity(II)V
    invoke-static {v0, v1, v5}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$900(Lcom/mediatek/settings/NoNetworkPopUpService;II)V

    goto :goto_0

    .line 203
    :pswitch_4
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDualSimMode:I
    invoke-static {v0}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$600(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->isSimReady(I)Z
    invoke-static {v0, v6}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$800(Lcom/mediatek/settings/NoNetworkPopUpService;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/mediatek/settings/NoNetworkPopUpService$3;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    iget v1, p1, Landroid/os/Message;->what:I

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->startNWActivity(II)V
    invoke-static {v0, v1, v6}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$900(Lcom/mediatek/settings/NoNetworkPopUpService;II)V

    goto/16 :goto_0

    .line 179
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
