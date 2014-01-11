.class public Lcom/mediatek/settings/CallRejectListModify;
.super Landroid/app/Activity;
.source "CallRejectListModify.java"

# interfaces
.implements Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;
    }
.end annotation


# static fields
.field private static final CALL_LIST_DIALOG_WAIT:I = 0x2

.field private static final ID_INDEX:I = 0x0

.field private static final MENU_ID_SELECT_ALL:I = 0x1

.field private static final MENU_ID_TRUSH:I = 0x3

.field private static final MENU_ID_UNSELECT_ALL:I = 0x2

.field private static final NAME_INDEX:I = 0x3

.field private static final NUMBER_INDEX:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CallRejectListModify"

.field private static final TYPE_INDEX:I = 0x2

.field private static final URI:Landroid/net/Uri;


# instance fields
.field private mAddContactsTask:Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;

.field private mCRLItemArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/settings/CallRejectListItem;",
            ">;"
        }
    .end annotation
.end field

.field private mCallRejectListAdapter:Lcom/mediatek/settings/CallRejectListAdapter;

.field private mListView:Landroid/widget/ListView;

.field private mType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-string v0, "content://reject/list"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/settings/CallRejectListModify;->URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mAddContactsTask:Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;

    .line 53
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/CallRejectListModify;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallRejectListModify;->isCurTypeVtAndVoice(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallRejectListModify;->updateRowById(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallRejectListModify;->deleteRowById(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/settings/CallRejectListModify;)Landroid/widget/ListView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/mediatek/settings/CallRejectListModify;->updateSelectedItemsView(Ljava/lang/String;)V

    return-void
.end method

.method private configureActionBar()V
    .locals 6

    .prologue
    .line 316
    const-string v4, "CallRejectListModify"

    const-string v5, "configureActionBar()"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    const-string v4, "layout_inflater"

    invoke-virtual {p0, v4}, Lcom/mediatek/settings/CallRejectListModify;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/LayoutInflater;

    .line 318
    .local v3, inflater:Landroid/view/LayoutInflater;
    const v4, 0x7f040008

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 319
    .local v1, customActionBarView:Landroid/view/View;
    const v4, 0x7f080018

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    .line 320
    .local v2, doneMenuItem:Landroid/widget/ImageButton;
    new-instance v4, Lcom/mediatek/settings/CallRejectListModify$2;

    invoke-direct {v4, p0}, Lcom/mediatek/settings/CallRejectListModify$2;-><init>(Lcom/mediatek/settings/CallRejectListModify;)V

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 326
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 327
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_0

    .line 328
    const/16 v4, 0x10

    const/16 v5, 0x1a

    invoke-virtual {v0, v4, v5}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 331
    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 332
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 334
    :cond_0
    return-void
.end method

.method private deleteRowById(Ljava/lang/String;)V
    .locals 6
    .parameter "id"

    .prologue
    .line 271
    :try_start_0
    sget-object v3, Lcom/mediatek/settings/CallRejectListModify;->URI:Landroid/net/Uri;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    int-to-long v4, v4

    invoke-static {v3, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 272
    .local v1, existNumberURI:Landroid/net/Uri;
    const-string v3, "CallRejectListModify"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "existNumberURI is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v1, v4, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 274
    .local v2, result:I
    const-string v3, "CallRejectListModify"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "result is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    .end local v1           #existNumberURI:Landroid/net/Uri;
    .end local v2           #result:I
    :goto_0
    return-void

    .line 275
    :catch_0
    move-exception v0

    .line 276
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v3, "CallRejectListModify"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "parseInt failed, the index is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private deleteSelection()V
    .locals 7

    .prologue
    const/4 v5, 0x2

    const/4 v6, 0x0

    .line 240
    const-string v3, "CallRejectListModify"

    const-string v4, "Enter deleteSecection Function"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const/4 v2, 0x0

    .line 242
    .local v2, isSelected:Z
    iget-object v3, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListItem;

    .line 243
    .local v0, callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListItem;->getIsChecked()Z

    move-result v3

    or-int/2addr v2, v3

    goto :goto_0

    .line 245
    .end local v0           #callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    :cond_0
    if-eqz v2, :cond_1

    .line 246
    invoke-virtual {p0, v5}, Lcom/mediatek/settings/CallRejectListModify;->showDialog(I)V

    .line 247
    new-instance v3, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;

    invoke-direct {v3, p0}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;-><init>(Lcom/mediatek/settings/CallRejectListModify;)V

    iput-object v3, p0, Lcom/mediatek/settings/CallRejectListModify;->mAddContactsTask:Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;

    .line 248
    iget-object v3, p0, Lcom/mediatek/settings/CallRejectListModify;->mAddContactsTask:Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;

    new-array v4, v5, [Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 250
    :cond_1
    return-void
.end method

.method private getCallRejectListItems()V
    .locals 12

    .prologue
    .line 191
    const/4 v7, 0x0

    .line 193
    .local v7, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mediatek/settings/CallRejectListModify;->URI:Landroid/net/Uri;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "Number"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "type"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "Name"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 196
    if-nez v7, :cond_0

    .line 219
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 221
    :goto_0
    return-void

    .line 199
    :cond_0
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 201
    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_4

    .line 202
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 203
    .local v8, id:Ljava/lang/String;
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 204
    .local v10, numberDB:Ljava/lang/String;
    const/4 v0, 0x2

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 205
    .local v11, type:Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 206
    .local v9, name:Ljava/lang/String;
    const-string v0, "CallRejectListModify"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    const-string v0, "CallRejectListModify"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "numberDB="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    const-string v0, "CallRejectListModify"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    const-string v0, "CallRejectListModify"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    const-string v0, "3"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "2"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "video"

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListModify;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const-string v0, "1"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "voice"

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListModify;->mType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 213
    :cond_2
    new-instance v6, Lcom/mediatek/settings/CallRejectListItem;

    const/4 v0, 0x0

    invoke-direct {v6, v9, v10, v8, v0}, Lcom/mediatek/settings/CallRejectListItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 214
    .local v6, crli:Lcom/mediatek/settings/CallRejectListItem;
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    .end local v6           #crli:Lcom/mediatek/settings/CallRejectListItem;
    :cond_3
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    .line 219
    .end local v8           #id:Ljava/lang/String;
    .end local v9           #name:Ljava/lang/String;
    .end local v10           #numberDB:Ljava/lang/String;
    .end local v11           #type:Ljava/lang/String;
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_4
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method

.method private isCurTypeVtAndVoice(Ljava/lang/String;)Z
    .locals 12
    .parameter "id"

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 281
    const/4 v1, 0x0

    .line 283
    .local v1, existNumberURI:Landroid/net/Uri;
    :try_start_0
    sget-object v0, Lcom/mediatek/settings/CallRejectListModify;->URI:Landroid/net/Uri;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v4, v2

    invoke-static {v0, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 288
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "_id"

    aput-object v4, v2, v9

    const-string v4, "Number"

    aput-object v4, v2, v10

    const-string v4, "Type"

    aput-object v4, v2, v11

    const/4 v4, 0x3

    const-string v5, "Name"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 290
    .local v6, cursor:Landroid/database/Cursor;
    if-nez v6, :cond_0

    move v0, v9

    .line 304
    :goto_1
    return v0

    .line 284
    .end local v6           #cursor:Landroid/database/Cursor;
    :catch_0
    move-exception v7

    .line 285
    .local v7, e:Ljava/lang/NumberFormatException;
    const-string v0, "CallRejectListModify"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "parseInt failed, the index is "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 293
    .end local v7           #e:Ljava/lang/NumberFormatException;
    .restart local v6       #cursor:Landroid/database/Cursor;
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 295
    :goto_2
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 296
    invoke-interface {v6, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 297
    .local v8, type:Ljava/lang/String;
    const-string v0, "3"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 298
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move v0, v10

    .line 299
    goto :goto_1

    .line 301
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_2

    .line 303
    .end local v8           #type:Ljava/lang/String;
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move v0, v9

    .line 304
    goto :goto_1
.end method

.method private selectAll()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 224
    iget-object v2, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListItem;

    .line 225
    .local v0, callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    invoke-virtual {v0, v3}, Lcom/mediatek/settings/CallRejectListItem;->setIsChecked(Z)V

    goto :goto_0

    .line 227
    .end local v0           #callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    :cond_0
    const v2, 0x7f0d00b6

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/settings/CallRejectListModify;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/settings/CallRejectListModify;->updateSelectedItemsView(Ljava/lang/String;)V

    .line 228
    iget-object v2, p0, Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->invalidateViews()V

    .line 229
    return-void
.end method

.method private unSelectAll()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 232
    iget-object v2, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListItem;

    .line 233
    .local v0, callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    invoke-virtual {v0, v5}, Lcom/mediatek/settings/CallRejectListItem;->setIsChecked(Z)V

    goto :goto_0

    .line 235
    .end local v0           #callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    :cond_0
    const v2, 0x7f0d00b6

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/settings/CallRejectListModify;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/settings/CallRejectListModify;->updateSelectedItemsView(Ljava/lang/String;)V

    .line 236
    iget-object v2, p0, Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->invalidateViews()V

    .line 237
    return-void
.end method

.method private updateRowById(Ljava/lang/String;)V
    .locals 7
    .parameter "id"

    .prologue
    .line 253
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 254
    .local v0, contentValues:Landroid/content/ContentValues;
    const-string v4, "video"

    iget-object v5, p0, Lcom/mediatek/settings/CallRejectListModify;->mType:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 255
    const-string v4, "Type"

    const-string v5, "1"

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    :goto_0
    :try_start_0
    sget-object v4, Lcom/mediatek/settings/CallRejectListModify;->URI:Landroid/net/Uri;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-long v5, v5

    invoke-static {v4, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 262
    .local v2, existNumberURI:Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v2, v0, v5, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    .line 263
    .local v3, result:I
    const-string v4, "CallRejectListModify"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "result is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    .end local v2           #existNumberURI:Landroid/net/Uri;
    .end local v3           #result:I
    :goto_1
    return-void

    .line 257
    :cond_0
    const-string v4, "Type"

    const-string v5, "2"

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 264
    :catch_0
    move-exception v1

    .line 265
    .local v1, e:Ljava/lang/NumberFormatException;
    const-string v4, "CallRejectListModify"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "parseInt failed, the index is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private updateSelectedItemsView(Ljava/lang/String;)V
    .locals 3
    .parameter "checkedItemsCount"

    .prologue
    .line 308
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f080019

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 309
    .local v0, selectedItemsView:Landroid/widget/TextView;
    if-nez v0, :cond_0

    .line 313
    :goto_0
    return-void

    .line 312
    :cond_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x0

    .line 102
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 103
    const v0, 0x7f040007

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallRejectListModify;->setContentView(I)V

    .line 105
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mType:Ljava/lang/String;

    .line 107
    invoke-direct {p0}, Lcom/mediatek/settings/CallRejectListModify;->getCallRejectListItems()V

    .line 108
    const v0, 0x102000a

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallRejectListModify;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;

    .line 109
    new-instance v0, Lcom/mediatek/settings/CallRejectListAdapter;

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/settings/CallRejectListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mCallRejectListAdapter:Lcom/mediatek/settings/CallRejectListAdapter;

    .line 110
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListModify;->mCallRejectListAdapter:Lcom/mediatek/settings/CallRejectListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 112
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;

    new-instance v1, Lcom/mediatek/settings/CallRejectListModify$1;

    invoke-direct {v1, p0}, Lcom/mediatek/settings/CallRejectListModify$1;-><init>(Lcom/mediatek/settings/CallRejectListModify;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mCallRejectListAdapter:Lcom/mediatek/settings/CallRejectListAdapter;

    invoke-virtual {v0, p0}, Lcom/mediatek/settings/CallRejectListAdapter;->setCheckSelectCallBack(Lcom/mediatek/settings/CallRejectListAdapter$CheckSelectCallBack;)V

    .line 125
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "type"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mType:Ljava/lang/String;

    .line 126
    invoke-direct {p0}, Lcom/mediatek/settings/CallRejectListModify;->configureActionBar()V

    .line 127
    const v0, 0x7f0d00b6

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/settings/CallRejectListModify;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/settings/CallRejectListModify;->updateSelectedItemsView(Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3
    .parameter "id"

    .prologue
    .line 132
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 133
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 134
    .local v0, dialog:Landroid/app/ProgressDialog;
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d00b7

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 135
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 136
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 139
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 144
    const v0, 0x7f0d00b3

    invoke-interface {p1, v2, v3, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020078

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 147
    const/4 v0, 0x2

    const v1, 0x7f0d00b4

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020077

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 150
    const/4 v0, 0x3

    const v1, 0x7f0d00b5

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020079

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 153
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 184
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 185
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mAddContactsTask:Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify;->mAddContactsTask:Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->cancel(Z)Z

    .line 188
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 158
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 174
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    .line 160
    :sswitch_0
    invoke-direct {p0}, Lcom/mediatek/settings/CallRejectListModify;->selectAll()V

    goto :goto_0

    .line 163
    :sswitch_1
    invoke-direct {p0}, Lcom/mediatek/settings/CallRejectListModify;->unSelectAll()V

    goto :goto_0

    .line 166
    :sswitch_2
    invoke-direct {p0}, Lcom/mediatek/settings/CallRejectListModify;->deleteSelection()V

    goto :goto_0

    .line 169
    :sswitch_3
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify;->finish()V

    goto :goto_0

    .line 158
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x102002c -> :sswitch_3
    .end sparse-switch
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 179
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 180
    return-void
.end method

.method public setChecked(Z)V
    .locals 7
    .parameter "isChecked"

    .prologue
    .line 338
    const/4 v1, 0x0

    .line 339
    .local v1, count:I
    iget-object v3, p0, Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListItem;

    .line 340
    .local v0, callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListItem;->getIsChecked()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 341
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 344
    .end local v0           #callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    :cond_1
    const v3, 0x7f0d00b6

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p0, v3, v4}, Lcom/mediatek/settings/CallRejectListModify;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/settings/CallRejectListModify;->updateSelectedItemsView(Ljava/lang/String;)V

    .line 345
    return-void
.end method
