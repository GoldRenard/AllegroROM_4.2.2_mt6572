.class Lcom/mediatek/wifi/WifiGprsSelector$7;
.super Ljava/lang/Object;
.source "WifiGprsSelector.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/wifi/WifiGprsSelector;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/wifi/WifiGprsSelector;

.field final synthetic val$simItemList:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/mediatek/wifi/WifiGprsSelector;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 618
    iput-object p1, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iput-object p2, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->val$simItemList:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v4, 0x2

    .line 620
    const-string v1, "WifiGprsSelector"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "which = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->val$simItemList:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;

    .line 622
    .local v0, simItem:Lcom/mediatek/wifi/WifiGprsSelector$SimItem;
    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iget v2, v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSlot:I

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mSimSlot:I
    invoke-static {v1, v2}, Lcom/mediatek/wifi/WifiGprsSelector;->access$902(Lcom/mediatek/wifi/WifiGprsSelector;I)I

    .line 623
    const-string v1, "WifiGprsSelector"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mSimSlot = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mSimSlot:I
    invoke-static {v3}, Lcom/mediatek/wifi/WifiGprsSelector;->access$900(Lcom/mediatek/wifi/WifiGprsSelector;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 624
    const-string v1, "WifiGprsSelector"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mIsSim="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mIsSim:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",mState="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",SIM_INDICATOR_LOCKED="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    iget-boolean v1, v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mIsSim:Z

    if-eqz v1, :cond_1

    .line 628
    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1500(Lcom/mediatek/wifi/WifiGprsSelector;)Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v1

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mState:I

    if-ne v1, v4, :cond_0

    .line 629
    const-string v1, "WifiGprsSelector"

    const-string v2, "mCellConnMgr.handleCellConn"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;
    invoke-static {v1}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1500(Lcom/mediatek/wifi/WifiGprsSelector;)Lcom/mediatek/CellConnService/CellConnMgr;

    move-result-object v1

    iget v2, v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSlot:I

    const/16 v3, 0x12e

    invoke-virtual {v1, v2, v3}, Lcom/mediatek/CellConnService/CellConnMgr;->handleCellConn(II)I

    .line 637
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 638
    return-void

    .line 632
    :cond_0
    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iget-wide v2, v0, Lcom/mediatek/wifi/WifiGprsSelector$SimItem;->mSimId:J

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->switchGprsDefautlSIM(J)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1600(Lcom/mediatek/wifi/WifiGprsSelector;J)V

    goto :goto_0

    .line 635
    :cond_1
    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$7;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    const-wide/16 v2, 0x0

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->switchGprsDefautlSIM(J)V
    invoke-static {v1, v2, v3}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1600(Lcom/mediatek/wifi/WifiGprsSelector;J)V

    goto :goto_0
.end method
