.class Lcom/mediatek/calloption/VideoCallOptionHandler$1;
.super Ljava/lang/Object;
.source "VideoCallOptionHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/VideoCallOptionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/calloption/VideoCallOptionHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 140
    iput-object p1, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 142
    move-object v0, p1

    check-cast v0, Landroid/app/AlertDialog;

    .line 143
    .local v0, alert:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    .line 144
    .local v1, listAdapter:Landroid/widget/ListAdapter;
    invoke-interface {v1, p2}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 148
    .local v3, slot:I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "3GSIMSelectClick, onClick() is called, slot = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/mediatek/calloption/VideoCallOptionHandler;->log(Ljava/lang/String;)V
    invoke-static {v4}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$000(Ljava/lang/String;)V

    .line 149
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 150
    iget-object v4, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v4}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$100(Lcom/mediatek/calloption/VideoCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/calloption/Request;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "com.android.phone.extra.slot"

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 151
    iget-object v4, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v4}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$100(Lcom/mediatek/calloption/VideoCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/calloption/Request;->getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/calloption/CallOptionHandlerFactory;->getSimStatusCallOptionHandler()Lcom/mediatek/calloption/SimStatusCallOptionHandler;

    move-result-object v2

    .line 153
    .local v2, simStatusHandler:Lcom/mediatek/calloption/SimStatusCallOptionHandler;
    iget-object v4, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v4}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$100(Lcom/mediatek/calloption/VideoCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/calloption/Request;->getCallOptionHandlerFactory()Lcom/mediatek/calloption/CallOptionHandlerFactory;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mediatek/calloption/CallOptionHandlerFactory;->getFinalCallOptionHandler()Lcom/mediatek/calloption/FinalCallOptionHandler;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->setSuccessor(Lcom/mediatek/calloption/CallOptionBaseHandler;)V

    .line 154
    iget-object v4, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$1;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v4}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$100(Lcom/mediatek/calloption/VideoCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/mediatek/calloption/SimStatusCallOptionHandler;->handleRequest(Lcom/mediatek/calloption/Request;)V

    .line 155
    return-void
.end method
