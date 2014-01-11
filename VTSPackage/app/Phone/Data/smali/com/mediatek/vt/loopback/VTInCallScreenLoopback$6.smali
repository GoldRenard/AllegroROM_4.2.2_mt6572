.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;
.super Ljava/lang/Object;
.source "VTInCallScreenLoopback.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTInCallVideoSettingPeerQuality()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V
    .locals 0
    .parameter

    .prologue
    .line 1737
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v2, 0x1

    .line 1739
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1900(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1740
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1900(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1741
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mInCallVideoSettingPeerQualityDialog:Landroid/app/AlertDialog;
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$1902(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 1743
    :cond_0
    if-nez p2, :cond_2

    .line 1745
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSettingPeerQuality() : VTManager.getInstance().setVideoQuality( VTManager.VT_VQ_NORMAL );"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1749
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/mediatek/vt/VTManager;->setVideoQuality(I)V

    .line 1758
    :cond_1
    :goto_0
    return-void

    .line 1750
    :cond_2
    if-ne v2, p2, :cond_1

    .line 1752
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$6;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "onVTInCallVideoSettingPeerQuality() : VTManager.getInstance().setVideoQuality( VTManager.VT_VQ_SHARP );"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 1756
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->setVideoQuality(I)V

    goto :goto_0
.end method
