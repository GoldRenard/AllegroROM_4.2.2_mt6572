.class public Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;
.super Landroid/app/DialogFragment;
.source "AddFavoriteDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;
    }
.end annotation


# static fields
.field private static final STATION_FREQ:Ljava/lang/String; = "station_freq"

.field private static final STATION_NAME:Ljava/lang/String; = "station_name"


# instance fields
.field private mListener:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;

    .line 84
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;)Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;I)Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;
    .locals 3
    .parameter "stationName"
    .parameter "stationFreq"

    .prologue
    .line 72
    new-instance v1, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;

    invoke-direct {v1}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;-><init>()V

    .line 73
    .local v1, fragment:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 74
    .local v0, args:Landroid/os/Bundle;
    const-string v2, "station_name"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const-string v2, "station_freq"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 76
    invoke-virtual {v1, v0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->setArguments(Landroid/os/Bundle;)V

    .line 77
    return-object v1
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 93
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 95
    :try_start_0
    check-cast p1, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;

    .end local p1
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :goto_0
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0}, Ljava/lang/ClassCastException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/4 v9, 0x0

    .line 104
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string v7, "station_name"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, stationName:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string v7, "station_freq"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 106
    .local v3, stationFreq:I
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 107
    .local v0, context:Landroid/content/Context;
    invoke-static {v0}, Lcom/mediatek/FMRadio/ExtensionUtils;->getExtension(Landroid/content/Context;)Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    move-result-object v2

    .line 108
    .local v2, projectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const/high16 v7, 0x7f03

    invoke-static {v6, v7, v9}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 109
    .local v5, v:Landroid/view/View;
    const v6, 0x7f060002

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 110
    .local v1, editTextStationName:Landroid/widget/EditText;
    const v6, 0x7f060004

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    if-eqz v4, :cond_0

    const-string v6, ""

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 115
    :cond_0
    const v6, 0x7f040015

    invoke-virtual {v1, v6}, Landroid/widget/EditText;->setHint(I)V

    .line 119
    :goto_0
    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 120
    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocusFromTouch()Z

    .line 121
    const-string v6, ""

    invoke-virtual {v1, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 122
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v7, 0x7f040002

    const v8, 0x7f040003

    invoke-interface {v2, v0, v7, v8}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f04000e

    new-instance v8, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$1;

    invoke-direct {v8, p0}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$1;-><init>(Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f04000f

    invoke-virtual {v6, v7, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    return-object v6

    .line 117
    :cond_1
    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
