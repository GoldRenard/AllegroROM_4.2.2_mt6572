.class Lcom/mediatek/oobe/basic/gemini/SimManagement$9;
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
    .line 1071
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$9;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 1076
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$9;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$9;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVTTargetTemp:J
    invoke-static {v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2200(Lcom/mediatek/oobe/basic/gemini/SimManagement;)J

    move-result-wide v1

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->switchVideoCallDefaultSIM(J)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$2300(Lcom/mediatek/oobe/basic/gemini/SimManagement;J)V

    .line 1078
    return-void
.end method
