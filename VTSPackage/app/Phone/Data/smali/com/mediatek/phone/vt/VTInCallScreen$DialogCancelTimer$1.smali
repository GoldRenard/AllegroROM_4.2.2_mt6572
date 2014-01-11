.class Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer$1;
.super Ljava/util/TimerTask;
.source "VTInCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;)V
    .locals 0
    .parameter

    .prologue
    .line 1300
    iput-object p1, p0, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer$1;->this$1:Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1302
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer$1;->this$1:Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->access$900(Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1303
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer$1;->this$1:Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->access$900(Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1304
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer$1;->this$1:Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->mAsker:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->access$900(Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 1307
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer$1;->this$1:Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;

    #getter for: Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->mTimer:Ljava/util/Timer;
    invoke-static {v0}, Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;->access$1000(Lcom/mediatek/phone/vt/VTInCallScreen$DialogCancelTimer;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1308
    return-void
.end method
