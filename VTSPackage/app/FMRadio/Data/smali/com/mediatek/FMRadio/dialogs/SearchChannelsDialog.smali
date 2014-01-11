.class public Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;
.super Landroid/app/DialogFragment;
.source "SearchChannelsDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;

    .line 68
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;)Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;

    return-object v0
.end method

.method public static newInstance()Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;

    invoke-direct {v0}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;-><init>()V

    return-object v0
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 77
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 79
    :try_start_0
    check-cast p1, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;

    .end local p1
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0}, Ljava/lang/ClassCastException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 107
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;

    invoke-interface {v0}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$CancelSearchListener;->cancelSearch()V

    .line 108
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x0

    .line 87
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f040011

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, message:Ljava/lang/String;
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 89
    .local v1, searchDialog:Landroid/app/ProgressDialog;
    invoke-virtual {v1, v4}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 90
    invoke-virtual {v1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 91
    const v2, 0x7f040010

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setTitle(I)V

    .line 92
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 94
    invoke-virtual {v1, v4}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 95
    const v2, 0x7f04000f

    invoke-virtual {p0, v2}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$1;

    invoke-direct {v3, p0}, Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog$1;-><init>(Lcom/mediatek/FMRadio/dialogs/SearchChannelsDialog;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/ProgressDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 102
    return-object v1
.end method
