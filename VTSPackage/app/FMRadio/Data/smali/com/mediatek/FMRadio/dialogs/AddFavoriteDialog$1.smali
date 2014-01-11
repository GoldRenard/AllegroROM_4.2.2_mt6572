.class Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$1;
.super Ljava/lang/Object;
.source "AddFavoriteDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 127
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 129
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$1;->this$0:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;

    #getter for: Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;
    invoke-static {v0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->access$000(Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;)Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;->addFavorite()V

    .line 130
    return-void
.end method
