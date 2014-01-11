.class public Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;
.super Landroid/app/DialogFragment;
.source "DeleteFavoriteDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;

    .line 70
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;)Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;

    return-object v0
.end method

.method public static newInstance()Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;
    .locals 1

    .prologue
    .line 64
    new-instance v0, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;

    invoke-direct {v0}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;-><init>()V

    return-object v0
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 79
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 81
    :try_start_0
    check-cast p1, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;

    .end local p1
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0}, Ljava/lang/ClassCastException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 90
    .local v0, context:Landroid/content/Context;
    invoke-static {v0}, Lcom/mediatek/FMRadio/ExtensionUtils;->getExtension(Landroid/content/Context;)Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    move-result-object v1

    .line 91
    .local v1, projectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f040016

    const v4, 0x7f040017

    invoke-interface {v1, v0, v3, v4}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f040018

    const v4, 0x7f040019

    invoke-interface {v1, v0, v3, v4}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f04000e

    new-instance v4, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$1;

    invoke-direct {v4, p0}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$1;-><init>(Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f04000f

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    return-object v2
.end method
