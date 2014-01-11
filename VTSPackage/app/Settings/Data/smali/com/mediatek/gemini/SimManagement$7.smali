.class Lcom/mediatek/gemini/SimManagement$7;
.super Ljava/lang/Object;
.source "SimManagement.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/gemini/SimManagement;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/gemini/SimManagement;)V
    .locals 0
    .parameter

    .prologue
    .line 1180
    iput-object p1, p0, Lcom/mediatek/gemini/SimManagement$7;->this$0:Lcom/mediatek/gemini/SimManagement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 1182
    iget-object v0, p0, Lcom/mediatek/gemini/SimManagement$7;->this$0:Lcom/mediatek/gemini/SimManagement;

    #getter for: Lcom/mediatek/gemini/SimManagement;->mDataSwitchMsgIndex:I
    invoke-static {v0}, Lcom/mediatek/gemini/SimManagement;->access$2100(Lcom/mediatek/gemini/SimManagement;)I

    move-result v0

    const v1, 0x7f0b00fc

    if-ne v0, v1, :cond_0

    .line 1183
    iget-object v0, p0, Lcom/mediatek/gemini/SimManagement$7;->this$0:Lcom/mediatek/gemini/SimManagement;

    iget-object v1, p0, Lcom/mediatek/gemini/SimManagement$7;->this$0:Lcom/mediatek/gemini/SimManagement;

    #getter for: Lcom/mediatek/gemini/SimManagement;->mSelectedGprsSimId:J
    invoke-static {v1}, Lcom/mediatek/gemini/SimManagement;->access$2200(Lcom/mediatek/gemini/SimManagement;)J

    move-result-wide v1

    #calls: Lcom/mediatek/gemini/SimManagement;->enableDataRoaming(J)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/gemini/SimManagement;->access$2300(Lcom/mediatek/gemini/SimManagement;J)V

    .line 1185
    :cond_0
    iget-object v0, p0, Lcom/mediatek/gemini/SimManagement$7;->this$0:Lcom/mediatek/gemini/SimManagement;

    iget-object v1, p0, Lcom/mediatek/gemini/SimManagement$7;->this$0:Lcom/mediatek/gemini/SimManagement;

    #getter for: Lcom/mediatek/gemini/SimManagement;->mSelectedGprsSimId:J
    invoke-static {v1}, Lcom/mediatek/gemini/SimManagement;->access$2200(Lcom/mediatek/gemini/SimManagement;)J

    move-result-wide v1

    #calls: Lcom/mediatek/gemini/SimManagement;->switchGprsDefautlSIM(J)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/gemini/SimManagement;->access$2400(Lcom/mediatek/gemini/SimManagement;J)V

    .line 1186
    return-void
.end method
