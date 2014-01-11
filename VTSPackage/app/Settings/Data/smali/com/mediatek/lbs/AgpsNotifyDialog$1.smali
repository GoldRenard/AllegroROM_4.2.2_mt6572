.class Lcom/mediatek/lbs/AgpsNotifyDialog$1;
.super Ljava/util/TimerTask;
.source "AgpsNotifyDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/lbs/AgpsNotifyDialog;->setTimerIfNeed(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 110
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$1;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$1;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    const-string v1, "timeout occurred"

    #calls: Lcom/mediatek/lbs/AgpsNotifyDialog;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/lbs/AgpsNotifyDialog;->access$000(Lcom/mediatek/lbs/AgpsNotifyDialog;Ljava/lang/String;)V

    .line 113
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$1;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    #getter for: Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->access$100(Lcom/mediatek/lbs/AgpsNotifyDialog;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$1;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    #getter for: Lcom/mediatek/lbs/AgpsNotifyDialog;->mType:I
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->access$100(Lcom/mediatek/lbs/AgpsNotifyDialog;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$1;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    #getter for: Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->access$300(Lcom/mediatek/lbs/AgpsNotifyDialog;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$1;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    #getter for: Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I
    invoke-static {v1}, Lcom/mediatek/lbs/AgpsNotifyDialog;->access$200(Lcom/mediatek/lbs/AgpsNotifyDialog;)I

    move-result v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/mediatek/common/agps/MtkAgpsManager;->niUserResponse(II)V

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$1;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finishActivity(Z)V

    .line 119
    return-void
.end method
