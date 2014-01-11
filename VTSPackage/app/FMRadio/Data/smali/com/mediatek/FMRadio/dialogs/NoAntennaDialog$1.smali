.class Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$1;
.super Ljava/lang/Object;
.source "NoAntennaDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 101
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 104
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;

    #getter for: Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;
    invoke-static {v0}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->access$000(Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;)Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;->noAntennaCancel()V

    .line 105
    return-void
.end method
