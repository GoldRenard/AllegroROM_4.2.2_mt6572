.class public Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;
.super Landroid/app/DialogFragment;
.source "NoAntennaDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;

    .line 68
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;)Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;

    return-object v0
.end method

.method public static newInstance()Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;

    invoke-direct {v0}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;-><init>()V

    return-object v0
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 82
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 84
    :try_start_0
    check-cast p1, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;

    .end local p1
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$NoAntennaListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :goto_0
    return-void

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0}, Ljava/lang/ClassCastException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 92
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 93
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const v1, 0x7f04000a

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f04000b

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f04000c

    new-instance v3, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$2;

    invoke-direct {v3, p0}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$2;-><init>(Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f04000d

    new-instance v3, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$1;

    invoke-direct {v3, p0}, Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog$1;-><init>(Lcom/mediatek/FMRadio/dialogs/NoAntennaDialog;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method
