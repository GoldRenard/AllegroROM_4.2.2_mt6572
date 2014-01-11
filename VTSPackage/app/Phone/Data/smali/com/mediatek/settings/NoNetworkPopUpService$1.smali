.class Lcom/mediatek/settings/NoNetworkPopUpService$1;
.super Landroid/telephony/PhoneStateListener;
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
    .line 64
    iput-object p1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 5
    .parameter "serviceState"

    .prologue
    const/4 v4, 0x0

    .line 67
    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getMySimId()I

    move-result v0

    .line 69
    .local v0, simId:I
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$000(Lcom/mediatek/settings/NoNetworkPopUpService;Ljava/lang/String;)V

    .line 70
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[mIsShouldShow = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mIsShouldShow:Z
    invoke-static {v3}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$100(Lcom/mediatek/settings/NoNetworkPopUpService;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/settings/NoNetworkPopUpService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$000(Lcom/mediatek/settings/NoNetworkPopUpService;Ljava/lang/String;)V

    .line 71
    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getIsManualSelection()Z

    move-result v1

    if-nez v1, :cond_1

    .line 91
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_4

    .line 78
    :cond_2
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 79
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mNetworkResponse:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$300(Lcom/mediatek/settings/NoNetworkPopUpService;)Landroid/os/Handler;

    move-result-object v1

    invoke-static {}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$200()[I

    move-result-object v2

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 81
    :cond_3
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mNetworkResponse:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$300(Lcom/mediatek/settings/NoNetworkPopUpService;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 83
    :cond_4
    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_5

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getRegState()I

    move-result v1

    if-nez v1, :cond_0

    .line 85
    :cond_5
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 86
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mNetworkResponse:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$300(Lcom/mediatek/settings/NoNetworkPopUpService;)Landroid/os/Handler;

    move-result-object v1

    invoke-static {}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$200()[I

    move-result-object v2

    aget v2, v2, v0

    iget-object v3, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDelayTime:I
    invoke-static {v3}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$400(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 88
    :cond_6
    iget-object v1, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mNetworkResponse:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$300(Lcom/mediatek/settings/NoNetworkPopUpService;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/NoNetworkPopUpService$1;->this$0:Lcom/mediatek/settings/NoNetworkPopUpService;

    #getter for: Lcom/mediatek/settings/NoNetworkPopUpService;->mDelayTime:I
    invoke-static {v2}, Lcom/mediatek/settings/NoNetworkPopUpService;->access$400(Lcom/mediatek/settings/NoNetworkPopUpService;)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method
