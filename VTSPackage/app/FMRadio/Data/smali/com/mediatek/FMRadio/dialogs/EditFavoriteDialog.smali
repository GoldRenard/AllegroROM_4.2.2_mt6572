.class public Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;
.super Landroid/app/DialogFragment;
.source "EditFavoriteDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;
    }
.end annotation


# static fields
.field private static final STATION_FREQ:Ljava/lang/String; = "station_freq"

.field private static final STATION_NAME:Ljava/lang/String; = "station_name"


# instance fields
.field private mEditTextFrequency:Landroid/widget/EditText;

.field mFilter:Landroid/text/InputFilter;

.field private mListener:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;

.field private mWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 69
    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;

    .line 70
    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mEditTextFrequency:Landroid/widget/EditText;

    .line 152
    new-instance v0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$2;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$2;-><init>(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mFilter:Landroid/text/InputFilter;

    .line 182
    new-instance v0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;

    invoke-direct {v0, p0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;-><init>(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mEditTextFrequency:Landroid/widget/EditText;

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;I)Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;
    .locals 3
    .parameter "stationName"
    .parameter "stationFreq"

    .prologue
    .line 79
    new-instance v1, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    invoke-direct {v1}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;-><init>()V

    .line 80
    .local v1, fragment:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;
    new-instance v0, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 81
    .local v0, args:Landroid/os/Bundle;
    const-string v2, "station_name"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v2, "station_freq"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 83
    invoke-virtual {v1, v0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->setArguments(Landroid/os/Bundle;)V

    .line 84
    return-object v1
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 100
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 102
    :try_start_0
    check-cast p1, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;

    .end local p1
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mListener:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0}, Ljava/lang/ClassCastException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 14
    .parameter "savedInstanceState"

    .prologue
    const/4 v13, 0x0

    .line 110
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "station_name"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 111
    .local v5, stationName:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "station_freq"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 112
    .local v4, stationFreq:I
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const v9, 0x7f030001

    invoke-static {v8, v9, v13}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    .line 113
    .local v7, v:Landroid/view/View;
    const v8, 0x7f060007

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 114
    .local v0, editTextStationName:Landroid/widget/EditText;
    const v8, 0x7f060009

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    iput-object v8, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mEditTextFrequency:Landroid/widget/EditText;

    .line 117
    const/4 v2, 0x6

    .line 118
    .local v2, lengthOf50Khz:I
    const/4 v1, 0x5

    .line 119
    .local v1, lengthOf100Khz:I
    const/4 v3, 0x5

    .line 121
    .local v3, maxFrequencyLength:I
    iget-object v8, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mEditTextFrequency:Landroid/widget/EditText;

    const/4 v9, 0x2

    new-array v9, v9, [Landroid/text/InputFilter;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mFilter:Landroid/text/InputFilter;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    new-instance v11, Landroid/text/InputFilter$LengthFilter;

    const/4 v12, 0x5

    invoke-direct {v11, v12}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v11, v9, v10

    invoke-virtual {v8, v9}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 127
    iget-object v8, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mEditTextFrequency:Landroid/widget/EditText;

    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 128
    if-eqz v5, :cond_0

    const-string v8, ""

    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 129
    :cond_0
    const v8, 0x7f040015

    invoke-virtual {v0, v8}, Landroid/widget/EditText;->setHint(I)V

    .line 133
    :goto_0
    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 134
    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocusFromTouch()Z

    .line 136
    invoke-virtual {v0, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 137
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    .line 138
    .local v6, text:Landroid/text/Editable;
    invoke-interface {v6}, Landroid/text/Editable;->length()I

    move-result v8

    invoke-static {v6, v8}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 139
    new-instance v8, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v9, 0x7f040014

    invoke-virtual {p0, v9}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f04000e

    new-instance v10, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$1;

    invoke-direct {v10, p0}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$1;-><init>(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)V

    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f04000f

    invoke-virtual {v8, v9, v13}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    return-object v8

    .line 131
    .end local v6           #text:Landroid/text/Editable;
    :cond_1
    invoke-virtual {v0, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
