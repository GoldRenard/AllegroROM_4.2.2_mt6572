.class public Lcom/mediatek/FMRadio/FMRadioFavorite;
.super Landroid/app/Activity;
.source "FMRadioFavorite.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;
.implements Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;
.implements Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;
.implements Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/Activity;",
        "Landroid/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog$AddFavoriteListener;",
        "Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$EditFavoriteListener;",
        "Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog$DeleteFavoriteListener;"
    }
.end annotation


# static fields
.field public static final ACTIVITY_RESULT:Ljava/lang/String; = "ACTIVITY_RESULT"

.field private static final ADD_FAVORITE:Ljava/lang/String; = "AddFavorite"

.field private static final CONTMENU_ID_ADD:I = 0x3

.field private static final CONTMENU_ID_DELETE:I = 0x2

.field private static final CONTMENU_ID_EDIT:I = 0x1

.field private static final DELETE_FAVORITE:Ljava/lang/String; = "DeleteFavorite"

.field private static final EDIT_FAVORITE:Ljava/lang/String; = "EditFavorite"

.field private static final FAVORITE_FREQ:Ljava/lang/String; = "FAVORITE_FREQ"

.field private static final FAVORITE_NAME:Ljava/lang/String; = "FAVORITE_NAME"

.field public static final TAG:Ljava/lang/String; = "FmRx/Favorite"


# instance fields
.field private mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

.field private mContext:Landroid/content/Context;

.field private mDlgStationFreq:I

.field private mDlgStationName:Ljava/lang/String;

.field private mLvFavorites:Landroid/widget/ListView;

.field mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 92
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    .line 93
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    .line 95
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    .line 97
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    .line 99
    iput-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    .line 294
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/FMRadio/FMRadioFavorite;)Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/FMRadio/FMRadioFavorite;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public addFavorite()V
    .locals 8

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    const-string v5, "AddFavorite"

    invoke-virtual {v4, v5}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;

    .line 393
    .local v1, dialogFragment:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;
    if-nez v1, :cond_1

    .line 420
    :cond_0
    :goto_0
    return-void

    .line 397
    :cond_1
    invoke-virtual {v1}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 399
    .local v0, dialog:Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 403
    const v4, 0x7f060002

    invoke-virtual {v0, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 405
    .local v2, editText:Landroid/widget/EditText;
    if-eqz v2, :cond_0

    .line 409
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 412
    .local v3, newName:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    .line 413
    iput-object v3, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    .line 417
    :cond_2
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    const/4 v6, 0x2

    iget v7, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    invoke-static {v4, v5, v6, v7}, Lcom/mediatek/FMRadio/FMRadioStation;->updateStationToDB(Landroid/content/Context;Ljava/lang/String;II)V

    .line 419
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method public deleteFavorite()V
    .locals 4

    .prologue
    .line 484
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    const/4 v2, 0x3

    iget v3, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    invoke-static {v0, v1, v2, v3}, Lcom/mediatek/FMRadio/FMRadioStation;->updateStationToDB(Landroid/content/Context;Ljava/lang/String;II)V

    .line 485
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;->notifyDataSetChanged()V

    .line 486
    return-void
.end method

.method public editFavorite()V
    .locals 13

    .prologue
    const/4 v11, 0x3

    const/4 v12, 0x2

    .line 426
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v9

    const-string v10, "EditFavorite"

    invoke-virtual {v9, v10}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    .line 427
    .local v1, dialogFragment:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;
    if-nez v1, :cond_1

    .line 477
    :cond_0
    :goto_0
    return-void

    .line 430
    :cond_1
    invoke-virtual {v1}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 432
    .local v0, dialog:Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 436
    const v9, 0x7f060007

    invoke-virtual {v0, v9}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 437
    .local v4, nameEditText:Landroid/widget/EditText;
    const v9, 0x7f060009

    invoke-virtual {v0, v9}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 439
    .local v3, frequencyEditText:Landroid/widget/EditText;
    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    .line 443
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 444
    .local v5, newName:Ljava/lang/String;
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 447
    .local v8, newStationFreqStr:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_2

    .line 448
    iput-object v5, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    .line 451
    :cond_2
    const/4 v7, 0x0

    .line 454
    .local v7, newStationFreq:F
    :try_start_0
    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    .line 459
    :goto_1
    invoke-static {v7}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v6

    .line 460
    .local v6, newStation:I
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioUtils;->isValidStation(I)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 463
    iget-object v9, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    invoke-static {v9, v6, v12}, Lcom/mediatek/FMRadio/FMRadioStation;->isStationExist(Landroid/content/Context;II)Z

    move-result v9

    if-eqz v9, :cond_4

    iget v9, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    if-eq v6, v9, :cond_4

    .line 465
    iget-object v9, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    invoke-static {v9, v6, v12}, Lcom/mediatek/FMRadio/FMRadioStation;->deleteStationInDB(Landroid/content/Context;II)V

    .line 470
    :cond_3
    :goto_2
    iget-object v9, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    iget-object v10, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    iget v11, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    invoke-static {v9, v10, v11, v6, v12}, Lcom/mediatek/FMRadio/FMRadioStation;->updateStationToDB(Landroid/content/Context;Ljava/lang/String;III)V

    .line 472
    iget-object v9, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    invoke-virtual {v9}, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 455
    .end local v6           #newStation:I
    :catch_0
    move-exception v2

    .line 456
    .local v2, e:Ljava/lang/NumberFormatException;
    invoke-virtual {v2}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1

    .line 466
    .end local v2           #e:Ljava/lang/NumberFormatException;
    .restart local v6       #newStation:I
    :cond_4
    iget-object v9, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    invoke-static {v9, v6, v11}, Lcom/mediatek/FMRadio/FMRadioStation;->isStationExist(Landroid/content/Context;II)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 468
    iget-object v9, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    invoke-static {v9, v6, v11}, Lcom/mediatek/FMRadio/FMRadioStation;->deleteStationInDB(Landroid/content/Context;II)V

    goto :goto_2

    .line 474
    :cond_5
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f040024

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 10
    .parameter "item"

    .prologue
    const/4 v9, 0x0

    .line 196
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v4

    check-cast v4, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget v1, v4, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 198
    .local v1, position:I
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v4

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    invoke-interface {v4, v1, v5, v6}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 200
    .local v0, itemView:Landroid/view/View;
    const v4, 0x7f060052

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 201
    .local v2, stationFreqView:Landroid/widget/TextView;
    const v4, 0x7f060053

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 202
    .local v3, stationNameView:Landroid/widget/TextView;
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    invoke-static {v4}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v4

    iput v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    .line 203
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    .line 204
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 228
    const-string v4, "FmRx/Favorite"

    const-string v5, "invalid menu item"

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    :goto_0
    return v9

    .line 207
    :pswitch_0
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    const/4 v5, 0x2

    invoke-static {v4, v5}, Lcom/mediatek/FMRadio/FMRadioStation;->getStationCount(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x5

    if-lt v4, v5, :cond_0

    .line 209
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    const v7, 0x7f04001a

    const v8, 0x7f04001b

    invoke-interface {v5, v6, v7, v8}, Lcom/mediatek/FMRadio/ext/IProjectStringExt;->getProjectString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 214
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->showAddFavoriteDialog()V

    goto :goto_0

    .line 219
    :pswitch_1
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->showEditFavoriteDialog()V

    goto :goto_0

    .line 224
    :pswitch_2
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->showDeleteFavoriteDialog()V

    goto :goto_0

    .line 204
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x3

    const/4 v5, 0x1

    const/4 v8, 0x0

    .line 106
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 107
    const-string v0, "FmRx/Favorite"

    const-string v1, "begin FMRadioFavorite.onCreate"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->setVolumeControlStream(I)V

    .line 110
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/Window;->requestFeature(I)Z

    .line 111
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->setContentView(I)V

    .line 113
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    .line 114
    .local v6, actionBar:Landroid/app/ActionBar;
    const v0, 0x7f040001

    invoke-virtual {v6, v0}, Landroid/app/ActionBar;->setTitle(I)V

    .line 115
    invoke-virtual {v6, v5}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 116
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    .line 117
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mediatek/FMRadio/ExtensionUtils;->getExtension(Landroid/content/Context;)Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mProjectStringExt:Lcom/mediatek/FMRadio/ext/IProjectStringExt;

    .line 118
    if-eqz p1, :cond_0

    .line 119
    const-string v0, "FAVORITE_NAME"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    .line 120
    const-string v0, "FAVORITE_FREQ"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    .line 123
    :cond_0
    new-instance v0, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    const v2, 0x7f030008

    new-array v4, v9, [Ljava/lang/String;

    const-string v1, "COLUMN_STATION_TYPE"

    aput-object v1, v4, v8

    const-string v1, "COLUMN_STATION_FREQ"

    aput-object v1, v4, v5

    const/4 v1, 0x2

    const-string v5, "COLUMN_STATION_NAME"

    aput-object v5, v4, v1

    new-array v5, v9, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    .line 130
    const v0, 0x7f06000b

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    .line 131
    const v0, 0x7f06000c

    invoke-virtual {p0, v0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 132
    .local v7, emptyView:Landroid/widget/TextView;
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    invoke-virtual {v0, v7}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 133
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 134
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v8, v3, p0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 135
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    new-instance v1, Lcom/mediatek/FMRadio/FMRadioFavorite$1;

    invoke-direct {v1, p0}, Lcom/mediatek/FMRadio/FMRadioFavorite$1;-><init>(Lcom/mediatek/FMRadio/FMRadioFavorite;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 160
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mLvFavorites:Landroid/widget/ListView;

    new-instance v1, Lcom/mediatek/FMRadio/FMRadioFavorite$2;

    invoke-direct {v1, p0}, Lcom/mediatek/FMRadio/FMRadioFavorite$2;-><init>(Lcom/mediatek/FMRadio/FMRadioFavorite;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 187
    const-string v0, "FmRx/Favorite"

    const-string v1, "end FMRadioFavorite.onCreate"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    return-void

    .line 123
    nop

    :array_0
    .array-data 0x4
        0x51t 0x0t 0x6t 0x7ft
        0x52t 0x0t 0x6t 0x7ft
        0x53t 0x0t 0x6t 0x7ft
    .end array-data
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 8
    .parameter "id"
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 254
    sget-object v2, Lcom/mediatek/FMRadio/FMRadioStation$Station;->CONTENT_URI:Landroid/net/Uri;

    .line 255
    .local v2, uri:Landroid/net/Uri;
    const-string v4, "COLUMN_STATION_TYPE IN (?, ?)"

    .line 256
    .local v4, select:Ljava/lang/String;
    const-string v6, "COLUMN_STATION_TYPE,COLUMN_STATION_FREQ"

    .line 257
    .local v6, order:Ljava/lang/String;
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v3, Lcom/mediatek/FMRadio/FMRadioStation;->COLUMNS:[Ljava/lang/String;

    new-array v5, v7, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v1

    const/4 v1, 0x1

    const/4 v7, 0x3

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .local v0, cursorLoader:Landroid/content/CursorLoader;
    return-object v0
.end method

.method public onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V
    .locals 1
    .parameter
    .parameter "data"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 277
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    invoke-virtual {v0, p2}, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 278
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/mediatek/FMRadio/FMRadioFavorite;->onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 287
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mAdapter:Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/FMRadio/FMRadioFavorite$ChannelListAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 288
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 240
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 241
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 242
    const/4 v0, 0x1

    .line 244
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 383
    const-string v0, "FAVORITE_NAME"

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    const-string v0, "FAVORITE_FREQ"

    iget v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 385
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 386
    return-void
.end method

.method public showAddFavoriteDialog()V
    .locals 3

    .prologue
    .line 360
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    iget v2, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->newInstance(Ljava/lang/String;I)Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;

    move-result-object v0

    .line 361
    .local v0, fragment:Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "AddFavorite"

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/FMRadio/dialogs/AddFavoriteDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 363
    return-void
.end method

.method public showDeleteFavoriteDialog()V
    .locals 3

    .prologue
    .line 377
    invoke-static {}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->newInstance()Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;

    move-result-object v0

    .line 378
    .local v0, newFragment:Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "DeleteFavorite"

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/FMRadio/dialogs/DeleteFavoriteDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 379
    return-void
.end method

.method public showEditFavoriteDialog()V
    .locals 3

    .prologue
    .line 369
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationName:Ljava/lang/String;

    iget v2, p0, Lcom/mediatek/FMRadio/FMRadioFavorite;->mDlgStationFreq:I

    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->newInstance(Ljava/lang/String;I)Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    move-result-object v0

    .line 370
    .local v0, newFragment:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;
    invoke-virtual {p0}, Lcom/mediatek/FMRadio/FMRadioFavorite;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "EditFavorite"

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 371
    return-void
.end method
