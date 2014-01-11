.class Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;
.super Ljava/lang/Object;
.source "VTInCallScreenLoopback.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->showStartVTRecorderDialog()V
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
    .line 2982
    iput-object p1, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 2984
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2200(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2985
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #getter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;
    invoke-static {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2200(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;)Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->dismiss()V

    .line 2986
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const/4 v3, 0x0

    #setter for: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderSelector:Landroid/app/AlertDialog;
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2202(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 2989
    :cond_0
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    iget-object v2, v2, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->mVTRecorderEntries:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2990
    .local v0, currentString:Ljava/lang/String;
    const/4 v1, 0x0

    .line 2992
    .local v1, type:I
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0068

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2995
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "The choice of start VT recording : voice and peer video"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 2997
    const/4 v1, 0x1

    .line 3016
    :goto_0
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->startRecord(I)V
    invoke-static {v2, v1}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$2300(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;I)V

    .line 3017
    :goto_1
    return-void

    .line 2998
    :cond_1
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0069

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 3001
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "The choice of start VT recording : only voice"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 3003
    const/4 v1, 0x2

    goto :goto_0

    .line 3004
    :cond_2
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    invoke-virtual {v2}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d006a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 3007
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "The choice of start VT recording : only peer video"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    .line 3009
    const/4 v1, 0x3

    goto :goto_0

    .line 3012
    :cond_3
    iget-object v2, p0, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback$10;->this$0:Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;

    const-string v3, "The choice of start VT recording : wrong string"

    #calls: Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;->access$000(Lcom/mediatek/vt/loopback/VTInCallScreenLoopback;Ljava/lang/String;)V

    goto :goto_1
.end method
