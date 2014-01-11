.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;
.super Ljava/lang/Object;
.source "VTInCallScreenLoopback.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSetting()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final DIALOG_ITEM_FOUR:I = 0x4

.field private static final DIALOG_ITEM_THREE:I = 0x3


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter

    .prologue
    .line 1476
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    const v2, 0x7f0d004e

    .line 1482
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$900(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1483
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$900(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1484
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingDialog:Landroid/app/AlertDialog;
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$902(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 1486
    :cond_0
    if-nez p2, :cond_2

    .line 1488
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSetting() : select - 0 "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1490
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->canDecZoom()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->canIncZoom()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1492
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1532
    :goto_0
    return-void

    .line 1494
    :cond_1
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalZoom()V
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    goto :goto_0

    .line 1496
    :cond_2
    const/4 v0, 0x1

    if-ne v0, p2, :cond_4

    .line 1498
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSetting() : select - 1 "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1500
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->canDecBrightness()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->canIncBrightness()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1502
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto :goto_0

    .line 1504
    :cond_3
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalBrightness()V
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1100(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    goto :goto_0

    .line 1506
    :cond_4
    const/4 v0, 0x2

    if-ne v0, p2, :cond_6

    .line 1508
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSetting() : select - 2 "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1510
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->canDecContrast()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/vt/VTManager;->canIncContrast()Z

    move-result v0

    if-nez v0, :cond_5

    .line 1512
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showToast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto :goto_0

    .line 1514
    :cond_5
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showVTLocalContrast()V
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1200(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    goto :goto_0

    .line 1516
    :cond_6
    const/4 v0, 0x3

    if-ne v0, p2, :cond_7

    .line 1518
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSetting() : select - 3 "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1520
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSettingLocalEffect()V
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    goto :goto_0

    .line 1521
    :cond_7
    const/4 v0, 0x4

    if-ne v0, p2, :cond_8

    .line 1523
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSetting() : select - 4 "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1525
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSettingLocalNightMode()V
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    goto/16 :goto_0

    .line 1528
    :cond_8
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSetting() : select - 5 "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1530
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$4;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSettingPeerQuality()V
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1500(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    goto/16 :goto_0
.end method
