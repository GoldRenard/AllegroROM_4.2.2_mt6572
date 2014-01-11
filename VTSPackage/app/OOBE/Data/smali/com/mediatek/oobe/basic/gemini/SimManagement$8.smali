.class Lcom/mediatek/oobe/basic/gemini/SimManagement$8;
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
    .line 1055
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$8;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 1060
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$8;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateGprsSettings()V

    .line 1061
    return-void
.end method
