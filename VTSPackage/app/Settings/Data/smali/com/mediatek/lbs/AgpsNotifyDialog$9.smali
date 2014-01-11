.class Lcom/mediatek/lbs/AgpsNotifyDialog$9;
.super Ljava/lang/Object;
.source "AgpsNotifyDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/lbs/AgpsNotifyDialog;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/lbs/AgpsNotifyDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 314
    iput-object p1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$9;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 3
    .parameter "dialog"

    .prologue
    const/4 v2, 0x0

    .line 316
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$9;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    #getter for: Lcom/mediatek/lbs/AgpsNotifyDialog;->mAgpsMgr:Lcom/mediatek/common/agps/MtkAgpsManager;
    invoke-static {v0}, Lcom/mediatek/lbs/AgpsNotifyDialog;->access$300(Lcom/mediatek/lbs/AgpsNotifyDialog;)Lcom/mediatek/common/agps/MtkAgpsManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$9;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    #getter for: Lcom/mediatek/lbs/AgpsNotifyDialog;->mSessionId:I
    invoke-static {v1}, Lcom/mediatek/lbs/AgpsNotifyDialog;->access$200(Lcom/mediatek/lbs/AgpsNotifyDialog;)I

    move-result v1

    invoke-interface {v0, v1, v2}, Lcom/mediatek/common/agps/MtkAgpsManager;->niUserResponse(II)V

    .line 319
    iget-object v0, p0, Lcom/mediatek/lbs/AgpsNotifyDialog$9;->this$0:Lcom/mediatek/lbs/AgpsNotifyDialog;

    invoke-virtual {v0, v2}, Lcom/mediatek/lbs/AgpsNotifyDialog;->finishActivity(Z)V

    .line 320
    return-void
.end method
