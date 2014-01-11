.class Lcom/mediatek/oobe/basic/gemini/SimManagement$7;
.super Ljava/lang/Object;
.source "SimManagement.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/gemini/SimManagement;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter

    .prologue
    .line 1040
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 1046
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I
    invoke-static {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1900(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I
    invoke-static {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1900(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I
    invoke-static {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1900(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 1049
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    invoke-static {v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getValue()J

    move-result-wide v1

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->enableDataRoaming(J)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2000(Lcom/mediatek/oobe/basic/gemini/SimManagement;J)V

    .line 1051
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    invoke-static {v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getValue()J

    move-result-wide v1

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->switchGprsDefautlSIM(J)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2100(Lcom/mediatek/oobe/basic/gemini/SimManagement;J)V

    .line 1053
    return-void
.end method
