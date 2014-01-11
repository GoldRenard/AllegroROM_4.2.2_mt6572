.class Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$1;
.super Ljava/lang/Object;
.source "EditFavoriteDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 142
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 145
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    #getter for: Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;
    invoke-static {v0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->access$000(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;->editFavorite()V

    .line 146
    return-void
.end method
