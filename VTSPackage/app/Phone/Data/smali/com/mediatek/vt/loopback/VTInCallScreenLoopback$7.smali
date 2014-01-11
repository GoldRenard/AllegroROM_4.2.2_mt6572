.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;
.super Ljava/lang/Object;
.source "VTInCallScreenLoopback.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showReCallDialogEx(ILjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

.field final synthetic val$number:Ljava/lang/String;

.field final synthetic val$slot:I


# direct methods
.method constructor <init>(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2318
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iput-object p2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->val$number:Ljava/lang/String;

    iput p3, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->val$slot:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 2323
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showReCallDialogEx... , on click, which="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 2325
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2326
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 2327
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTVoiceReCallDialog:Landroid/app/AlertDialog;
    invoke-static {v0, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2002(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 2330
    :cond_0
    iget-object v0, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->val$number:Ljava/lang/String;

    iget v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$7;->val$slot:I

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->makeVoiceReCall(Ljava/lang/String;I)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2100(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;I)V

    .line 2331
    return-void
.end method
