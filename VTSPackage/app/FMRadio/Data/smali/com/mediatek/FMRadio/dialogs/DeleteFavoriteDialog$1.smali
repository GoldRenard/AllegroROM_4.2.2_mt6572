.class Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$1;
.super Ljava/lang/Object;
.source "DeleteFavoriteDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 96
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 98
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;

    #getter for: Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;
    invoke-static {v0}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->access$000(Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;)Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;->deleteFavorite()V

    .line 99
    return-void
.end method
