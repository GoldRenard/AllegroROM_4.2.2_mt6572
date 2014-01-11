.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;
.super Ljava/lang/Object;
.source "VTInCallScreenLoopback.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onReceiveVTManagerReady()V
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
    .line 3120
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 3123
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, " user select yes !! "

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 3124
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "Incallscreen, before userSelectYes"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 3126
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->userSelectYes(I)V

    .line 3128
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v1, "Incallscreen, after userSelectYes"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 3131
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3132
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2400(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3133
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTMTAsker:Landroid/app/AlertDialog;
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2402(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 3135
    :cond_0
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v0

    const-string v1, "0"

    iput-object v1, v0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    .line 3136
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$13;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->onVTHideMeClick()V
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2500(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)V

    .line 3137
    return-void
.end method
