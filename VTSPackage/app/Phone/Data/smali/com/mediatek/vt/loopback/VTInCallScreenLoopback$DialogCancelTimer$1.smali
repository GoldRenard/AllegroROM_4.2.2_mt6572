.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;
.super Ljava/util/TimerTask;
.source "VTInCallScreenLoopback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;


# direct methods
.method constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)V
    .locals 0
    .parameter

    .prologue
    .line 1291
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;->this$1:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1293
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;->this$1:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->access$700(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1294
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;->this$1:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->access$700(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1295
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;->this$1:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->access$700(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 1298
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer$1;->this$1:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->mTimer:Ljava/util/Timer;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;->access$800(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$DialogCancelTimer;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1299
    return-void
.end method
