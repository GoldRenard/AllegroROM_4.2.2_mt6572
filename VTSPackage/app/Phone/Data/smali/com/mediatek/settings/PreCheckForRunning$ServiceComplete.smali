.class Lcom/mediatek/settings/PreCheckForRunning$ServiceComplete;
.super Ljava/lang/Object;
.source "PreCheckForRunning.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/PreCheckForRunning;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ServiceComplete"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/PreCheckForRunning;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/PreCheckForRunning;)V
    .locals 0
    .parameter

    .prologue
    .line 23
    iput-object p1, p0, Lcom/mediatek/settings/PreCheckForRunning$ServiceComplete;->this$0:Lcom/mediatek/settings/PreCheckForRunning;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 25
    iget-object v1, p0, Lcom/mediatek/settings/PreCheckForRunning$ServiceComplete;->this$0:Lcom/mediatek/settings/PreCheckForRunning;

    #getter for: Lcom/mediatek/settings/PreCheckForRunning;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/mediatek/settings/PreCheckForRunning;->access$000(Lcom/mediatek/settings/PreCheckForRunning;)Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr;->getResult()I

    move-result v0

    .line 26
    .local v0, result:I
    const-string v1, "Settings/PreCheckForRunning"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ServiceComplete with the result = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/mediatek/CellConnService/CellConnMgr;->resultToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    if-eqz v0, :cond_0

    const/4 v1, 0x4

    if-ne v1, v0, :cond_1

    .line 28
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/PreCheckForRunning$ServiceComplete;->this$0:Lcom/mediatek/settings/PreCheckForRunning;

    #getter for: Lcom/mediatek/settings/PreCheckForRunning;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/mediatek/settings/PreCheckForRunning;->access$200(Lcom/mediatek/settings/PreCheckForRunning;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/PreCheckForRunning$ServiceComplete;->this$0:Lcom/mediatek/settings/PreCheckForRunning;

    #getter for: Lcom/mediatek/settings/PreCheckForRunning;->mIntent:Landroid/content/Intent;
    invoke-static {v2}, Lcom/mediatek/settings/PreCheckForRunning;->access$100(Lcom/mediatek/settings/PreCheckForRunning;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    :cond_1
    return-void
.end method
