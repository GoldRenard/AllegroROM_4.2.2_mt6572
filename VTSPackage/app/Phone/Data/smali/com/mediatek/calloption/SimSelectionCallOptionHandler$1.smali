.class Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;
.super Ljava/lang/Object;
.source "SimSelectionCallOptionHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/SimSelectionCallOptionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 534
    iput-object p1, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 536
    move-object v0, p1

    check-cast v0, Landroid/app/AlertDialog;

    .line 537
    .local v0, alert:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    .line 538
    .local v1, listAdapter:Landroid/widget/ListAdapter;
    invoke-interface {v1, p2}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 542
    .local v2, slot:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ReasonAskDismissDialog, onClick() is called, slot = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->log(Ljava/lang/String;)V
    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->access$000(Ljava/lang/String;)V

    .line 543
    const/4 v3, -0x2

    if-ne v2, v3, :cond_1

    .line 544
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 545
    iget-object v3, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    #calls: Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->doSipCallOptionHandle()V
    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->access$100(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)V

    .line 553
    :cond_0
    :goto_0
    return-void

    .line 547
    :cond_1
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 548
    iget-object v3, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v3}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->access$200(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "com.android.phone.extra.slot"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 549
    iget-object v3, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    iget-object v3, v3, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    if-eqz v3, :cond_0

    .line 550
    iget-object v3, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    iget-object v3, v3, Lcom/mediatek/calloption/CallOptionBaseHandler;->mSuccessor:Lcom/mediatek/calloption/CallOptionBaseHandler;

    iget-object v4, p0, Lcom/mediatek/calloption/SimSelectionCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/SimSelectionCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v4}, Lcom/mediatek/calloption/SimSelectionCallOptionHandler;->access$200(Lcom/mediatek/calloption/SimSelectionCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mediatek/calloption/CallOptionBaseHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    goto :goto_0
.end method
