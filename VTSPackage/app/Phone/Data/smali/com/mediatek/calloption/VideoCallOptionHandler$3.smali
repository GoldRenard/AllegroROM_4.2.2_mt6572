.class Lcom/mediatek/calloption/VideoCallOptionHandler$3;
.super Ljava/lang/Object;
.source "VideoCallOptionHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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
    .line 166
    iput-object p1, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$3;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 169
    const-string v0, "3GSIMSelectCancel, onCancel() is called"

    #calls: Lcom/mediatek/calloption/VideoCallOptionHandler;->log(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$000(Ljava/lang/String;)V

    .line 170
    iget-object v0, p0, Lcom/mediatek/calloption/VideoCallOptionHandler$3;->this$0:Lcom/mediatek/calloption/VideoCallOptionHandler;

    #getter for: Lcom/mediatek/calloption/VideoCallOptionHandler;->mRequest:Lcom/mediatek/calloption/Request;
    invoke-static {v0}, Lcom/mediatek/calloption/VideoCallOptionHandler;->access$100(Lcom/mediatek/calloption/VideoCallOptionHandler;)Lcom/mediatek/calloption/Request;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/calloption/Request;->getResultHandler()Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/calloption/CallOptionBaseHandler$ICallOptionResultHandle;->onHandlingFinish()V

    .line 171
    return-void
.end method
