.class public Lcom/android/browser/AddBookmarkFolderForOP01Menu;
.super Landroid/app/Activity;
.source "AddBookmarkFolderForOP01Menu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/app/LoaderManager$LoaderCallbacks;
.implements Lcom/android/browser/BreadCrumbView$Controller;
.implements Lcom/android/browser/addbookmark/FolderSpinner$OnSetSelectionListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;,
        Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;,
        Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;,
        Lcom/android/browser/AddBookmarkFolderForOP01Menu$AccountsLoader;,
        Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;,
        Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/Activity;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/widget/TextView$OnEditorActionListener;",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "Landroid/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Lcom/android/browser/BreadCrumbView$Controller;",
        "Lcom/android/browser/addbookmark/FolderSpinner$OnSetSelectionListener;",
        "Landroid/widget/AdapterView$OnItemSelectedListener;"
    }
.end annotation


# static fields
.field public static final BOOKMARK_CURRENT_ID:Ljava/lang/String; = "bookmark_current_id"

.field public static final CHECK_FOR_DUPE:Ljava/lang/String; = "check_for_dupe"

.field public static final DEFAULT_FOLDER_ID:J = -0x1L

.field static final EXTRA_EDIT_BOOKMARK:Ljava/lang/String; = "bookmark"

.field static final EXTRA_IS_FOLDER:Ljava/lang/String; = "is_folder"

.field private static final LOADER_ID_ACCOUNTS:I = 0x0

.field private static final LOADER_ID_EDIT_INFO:I = 0x2

.field private static final LOADER_ID_FOLDER_CONTENTS:I = 0x1

.field private static final MAX_CRUMBS_SHOWN:I = 0x2

.field private static final XLOGTAG:Ljava/lang/String; = "browser/AddBookmarkFolderForOP01Menu"


# instance fields
.field private mAccountAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;",
            ">;"
        }
    .end annotation
.end field

.field private mAccountSpinner:Landroid/widget/Spinner;

.field private mAdapter:Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;

.field private mAddNewFolder:Landroid/view/View;

.field private mAddSeparator:Landroid/view/View;

.field private mAddress:Landroid/widget/EditText;

.field private mButton:Landroid/widget/TextView;

.field private mCancelButton:Landroid/view/View;

.field private mCrumbHolder:Landroid/view/View;

.field private mCrumbs:Lcom/android/browser/BreadCrumbView;

.field private mCurrentFolder:J

.field private mDefaultView:Landroid/view/View;

.field private mEditInfoLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks",
            "<",
            "Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mFakeTitle:Landroid/widget/TextView;

.field private mFakeTitleHolder:Landroid/view/View;

.field private mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

.field private mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

.field private mFolderCancel:Landroid/view/View;

.field private mFolderNamer:Landroid/widget/EditText;

.field private mFolderNamerHolder:Landroid/view/View;

.field private mFolderSelector:Landroid/view/View;

.field private mHeaderIcon:Landroid/graphics/drawable/Drawable;

.field private mIsFolderChanged:Z

.field private mIsFolderNamerShowing:Z

.field private mIsOtherFolderSelected:Z

.field private mIsRecentFolder:Z

.field private mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

.field private mMap:Landroid/os/Bundle;

.field private mOriginalFolder:J

.field private mRemoveLink:Landroid/view/View;

.field private mRootFolder:J

.field private mTitle:Landroid/widget/EditText;

.field private mTopLevelLabel:Landroid/widget/TextView;

.field private mWarningDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 62
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 82
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mOriginalFolder:J

    .line 84
    iput-boolean v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderChanged:Z

    .line 86
    iput-boolean v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsOtherFolderSelected:Z

    .line 88
    iput-boolean v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsRecentFolder:Z

    .line 431
    new-instance v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;

    invoke-direct {v0, p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$1;-><init>(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)V

    iput-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mEditInfoLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    .line 924
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 62
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Lcom/android/browser/addbookmark/FolderSpinnerAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Landroid/widget/Spinner;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Landroid/os/Bundle;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mMap:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderNamerShowing:Z

    return v0
.end method

.method static synthetic access$500(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->showWarningDialog()V

    return-void
.end method

.method private addFolderToCurrent(Ljava/lang/String;)J
    .locals 10
    .parameter "name"

    .prologue
    const-wide/16 v5, -0x1

    .line 377
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 378
    .local v4, values:Landroid/content/ContentValues;
    const-string v7, "title"

    invoke-virtual {v4, v7, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    const-string v7, "folder"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 381
    const/4 v2, 0x0

    .line 382
    .local v2, data:Ljava/lang/Object;
    iget-object v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    if-eqz v7, :cond_0

    .line 383
    iget-object v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v7}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v2

    .line 385
    .end local v2           #data:Ljava/lang/Object;
    :cond_0
    if-eqz v2, :cond_2

    .line 386
    check-cast v2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    iget-wide v0, v2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mId:J

    .line 390
    .local v0, currentFolder:J
    :goto_0
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    .line 391
    iget-boolean v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsRecentFolder:Z

    if-eqz v7, :cond_3

    .line 392
    const-string v7, "browser/AddBookmarkFolderForOP01Menu"

    const-string v8, "recentFolder"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    const-string v7, "parent"

    iget-wide v8, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 401
    :goto_1
    const-string v7, "browser/AddBookmarkFolderForOP01Menu"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "values:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "parent"

    invoke-virtual {v4, v9}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v7, v8, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3

    .line 403
    .local v3, uri:Landroid/net/Uri;
    if-eqz v3, :cond_1

    .line 404
    invoke-static {v3}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v5

    .line 406
    :cond_1
    return-wide v5

    .line 388
    .end local v0           #currentFolder:J
    .end local v3           #uri:Landroid/net/Uri;
    :cond_2
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    .restart local v0       #currentFolder:J
    goto :goto_0

    .line 394
    :cond_3
    iget-boolean v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderChanged:Z

    if-eqz v7, :cond_4

    iget-boolean v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsOtherFolderSelected:Z

    if-nez v7, :cond_5

    :cond_4
    iget-wide v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mOriginalFolder:J

    cmp-long v7, v7, v5

    if-eqz v7, :cond_5

    .line 395
    const-string v7, "browser/AddBookmarkFolderForOP01Menu"

    const-string v8, "not changed"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    const-string v7, "parent"

    iget-wide v8, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mOriginalFolder:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    .line 398
    :cond_5
    const-string v7, "browser/AddBookmarkFolderForOP01Menu"

    const-string v8, "defaultFolder"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    const-string v7, "parent"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1
.end method

.method private completeOrCancelFolderNaming(Z)V
    .locals 6
    .parameter "cancel"

    .prologue
    const/4 v5, 0x0

    .line 366
    if-nez p1, :cond_0

    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 367
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 368
    .local v2, name:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->addFolderToCurrent(Ljava/lang/String;)J

    move-result-wide v0

    .line 369
    .local v0, id:J
    invoke-direct {p0, v2, v0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->descendInto(Ljava/lang/String;J)V

    .line 371
    .end local v0           #id:J
    .end local v2           #name:Ljava/lang/String;
    :cond_0
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setShowFolderNamer(Z)V

    .line 372
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v3

    iget-object v4, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v4}, Lcom/android/browser/AddBookmarkPage$CustomListView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v3, v4, v5}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 373
    return-void
.end method

.method private descendInto(Ljava/lang/String;J)V
    .locals 3
    .parameter "foldername"
    .parameter "id"

    .prologue
    .line 422
    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-eqz v0, :cond_0

    .line 423
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    new-instance v1, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    invoke-direct {v1, p1, p2, p3}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v0, p1, v1}, Lcom/android/browser/BreadCrumbView;->pushView(Ljava/lang/String;Ljava/lang/Object;)Landroid/view/View;

    .line 424
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v0}, Lcom/android/browser/BreadCrumbView;->notifyController()V

    .line 429
    :goto_0
    return-void

    .line 426
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c001e

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private displayToastForExistingFolder()V
    .locals 3

    .prologue
    .line 319
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c001e

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 321
    return-void
.end method

.method public static getIdFromData(Ljava/lang/Object;)J
    .locals 3
    .parameter "data"

    .prologue
    .line 180
    if-nez p0, :cond_0

    .line 181
    const-wide/16 v1, 0x1

    .line 184
    :goto_0
    return-wide v1

    :cond_0
    move-object v0, p0

    .line 183
    check-cast v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    .line 184
    .local v0, folder:Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
    iget-wide v1, v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mId:J

    goto :goto_0
.end method

.method private getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;
    .locals 1

    .prologue
    .line 167
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    return-object v0
.end method

.method private getNameFromId(J)Ljava/lang/String;
    .locals 9
    .parameter "mCurrentFolder2"

    .prologue
    .line 755
    const-string v7, ""

    .line 756
    .local v7, title:Ljava/lang/String;
    const/4 v6, 0x0

    .line 758
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "title"

    aput-object v4, v2, v3

    const-string v3, "_id = ? AND deleted = ? AND folder = ? "

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    const/4 v5, 0x1

    const-string v8, "0"

    aput-object v8, v4, v5

    const/4 v5, 0x2

    const-string v8, "1"

    aput-object v8, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 768
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 769
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 770
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    goto :goto_0

    .line 774
    :cond_0
    if-eqz v6, :cond_1

    .line 775
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 778
    :cond_1
    const-string v0, "browser/AddBookmarkFolderForOP01Menu"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "title :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    return-object v7

    .line 774
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 775
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method private getUriForFolder(J)Landroid/net/Uri;
    .locals 4
    .parameter "folder"

    .prologue
    .line 171
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;

    .line 172
    .local v0, account:Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;
    iget-wide v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    cmp-long v1, p1, v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 173
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI_DEFAULT_FOLDER:Landroid/net/Uri;

    iget-object v2, v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;->mAccountType:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;->mAccountName:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/android/browser/BookmarksLoader;->addAccount(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 176
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p1, p2}, Landroid/provider/BrowserContract$Bookmarks;->buildFolderUri(J)Landroid/net/Uri;

    move-result-object v1

    goto :goto_0
.end method

.method private onCurrentFolderFound()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 806
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    .line 807
    .local v0, manager:Landroid/app/LoaderManager;
    iget-wide v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    iget-wide v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 811
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    invoke-virtual {v1, v5}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    .line 816
    :goto_0
    const/4 v1, 0x0

    invoke-virtual {v0, v5, v1, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 817
    return-void

    .line 813
    :cond_0
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setShowBookmarkIcon(Z)V

    goto :goto_0
.end method

.method private onRootFolderFound(J)V
    .locals 2
    .parameter "root"

    .prologue
    .line 791
    iput-wide p1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    .line 792
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    iput-wide v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    .line 793
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setupTopCrumb()V

    .line 794
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->onCurrentFolderFound()V

    .line 795
    return-void
.end method

.method private save()Z
    .locals 9

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 824
    iget-object v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTitle:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 826
    .local v4, title:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_0

    move v0, v5

    .line 827
    .local v0, emptyTitle:Z
    :goto_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 828
    .local v3, r:Landroid/content/res/Resources;
    if-eqz v0, :cond_1

    .line 829
    iget-object v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTitle:Landroid/widget/EditText;

    const v7, 0x7f0c0089

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 840
    :goto_1
    return v6

    .end local v0           #emptyTitle:Z
    .end local v3           #r:Landroid/content/res/Resources;
    :cond_0
    move v0, v6

    .line 826
    goto :goto_0

    .line 833
    .restart local v0       #emptyTitle:Z
    .restart local v3       #r:Landroid/content/res/Resources;
    :cond_1
    invoke-direct {p0, v4}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->addFolderToCurrent(Ljava/lang/String;)J

    move-result-wide v1

    .line 834
    .local v1, id:J
    const-wide/16 v7, -0x1

    cmp-long v7, v1, v7

    if-nez v7, :cond_2

    .line 835
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->displayToastForExistingFolder()V

    goto :goto_1

    .line 839
    :cond_2
    const/4 v6, -0x1

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setResult(I)V

    move v6, v5

    .line 840
    goto :goto_1
.end method

.method private setShowBookmarkIcon(Z)V
    .locals 3
    .parameter "show"

    .prologue
    const/4 v1, 0x0

    .line 213
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mHeaderIcon:Landroid/graphics/drawable/Drawable;

    .line 214
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    :goto_0
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTopLevelLabel:Landroid/widget/TextView;

    invoke-virtual {v2, v0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 215
    return-void

    .end local v0           #drawable:Landroid/graphics/drawable/Drawable;
    :cond_0
    move-object v0, v1

    .line 213
    goto :goto_0
.end method

.method private setShowFolderNamer(Z)V
    .locals 2
    .parameter "show"

    .prologue
    .line 572
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderNamerShowing:Z

    if-eq p1, v0, :cond_0

    .line 573
    iput-boolean p1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderNamerShowing:Z

    .line 574
    if-eqz p1, :cond_1

    .line 577
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamerHolder:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->addFooterView(Landroid/view/View;)V

    .line 582
    :goto_0
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAdapter:Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 583
    if-eqz p1, :cond_0

    .line 584
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setSelection(I)V

    .line 587
    :cond_0
    return-void

    .line 579
    :cond_1
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamerHolder:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->removeFooterView(Landroid/view/View;)Z

    goto :goto_0
.end method

.method private setupTopCrumb()V
    .locals 6

    .prologue
    .line 798
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v1}, Lcom/android/browser/BreadCrumbView;->clear()V

    .line 799
    const v1, 0x7f0c0096

    invoke-virtual {p0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 800
    .local v0, name:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    const/4 v2, 0x0

    new-instance v3, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    iget-wide v4, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    invoke-direct {v3, v0, v4, v5}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v1, v0, v2, v3}, Lcom/android/browser/BreadCrumbView;->pushView(Ljava/lang/String;ZLjava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTopLevelLabel:Landroid/widget/TextView;

    .line 802
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTopLevelLabel:Landroid/widget/TextView;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 803
    return-void
.end method

.method private showRemoveButton()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 783
    const v0, 0x7f0d0032

    invoke-virtual {p0, v0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 784
    const v0, 0x7f0d0033

    invoke-virtual {p0, v0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRemoveLink:Landroid/view/View;

    .line 785
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRemoveLink:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 786
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRemoveLink:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 787
    return-void
.end method

.method private showWarningDialog()V
    .locals 3

    .prologue
    .line 739
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mWarningDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 741
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mWarningDialog:Landroid/app/AlertDialog;

    const v1, 0x7f0c0039

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 742
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mWarningDialog:Landroid/app/AlertDialog;

    const v1, 0x7f0c0038

    invoke-virtual {p0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 743
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mWarningDialog:Landroid/app/AlertDialog;

    const v1, 0x7f0c003a

    invoke-virtual {p0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$3;

    invoke-direct {v2, p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$3;-><init>(Lcom/android/browser/AddBookmarkFolderForOP01Menu;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 749
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 751
    :cond_0
    return-void
.end method

.method private switchToDefaultView(Z)V
    .locals 8
    .parameter "changedFolder"

    .prologue
    const/16 v4, 0x8

    const/4 v7, 0x0

    .line 235
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 236
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mDefaultView:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 237
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbHolder:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 238
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFakeTitleHolder:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 239
    if-eqz p1, :cond_2

    .line 240
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v3}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v0

    .line 241
    .local v0, data:Ljava/lang/Object;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 242
    check-cast v1, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    .line 243
    .local v1, folder:Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
    iget-wide v3, v1, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mId:J

    iput-wide v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    .line 244
    iget-wide v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    iget-wide v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    .line 248
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    invoke-virtual {v3, v7}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    .line 287
    .end local v0           #data:Ljava/lang/Object;
    .end local v1           #folder:Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
    :cond_0
    :goto_0
    return-void

    .line 250
    .restart local v0       #data:Ljava/lang/Object;
    .restart local v1       #folder:Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
    :cond_1
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    iget-object v4, v1, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->setOtherFolderDisplayText(Ljava/lang/String;)V

    goto :goto_0

    .line 256
    .end local v0           #data:Ljava/lang/Object;
    .end local v1           #folder:Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
    :cond_2
    const-string v3, "browser/AddBookmarkFolderForOP01Menu"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mCurrentFolder:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    iget-wide v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    iget-wide v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_3

    .line 269
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    invoke-virtual {v3, v7}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    goto :goto_0

    .line 271
    :cond_3
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v3}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v0

    .line 272
    .restart local v0       #data:Ljava/lang/Object;
    if-eqz v0, :cond_4

    move-object v3, v0

    check-cast v3, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    iget-wide v3, v3, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mId:J

    iget-wide v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_4

    .line 276
    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    check-cast v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    .end local v0           #data:Ljava/lang/Object;
    iget-object v4, v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->setOtherFolderDisplayText(Ljava/lang/String;)V

    goto :goto_0

    .line 280
    .restart local v0       #data:Ljava/lang/Object;
    :cond_4
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setupTopCrumb()V

    .line 281
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v2

    .line 282
    .local v2, manager:Landroid/app/LoaderManager;
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_0
.end method

.method private switchToFolderSelector()V
    .locals 3

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 412
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v0, v2}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setSelection(I)V

    .line 413
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFakeTitleHolder:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 415
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mDefaultView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 416
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 417
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbHolder:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 418
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 419
    return-void
.end method


# virtual methods
.method moveCursorToFolder(Landroid/database/Cursor;JI)V
    .locals 5
    .parameter "cursor"
    .parameter "folderToFind"
    .parameter "idIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 551
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-nez v2, :cond_0

    .line 552
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "No folders in the database!"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 556
    :cond_0
    invoke-interface {p1, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 557
    .local v0, folder:J
    cmp-long v2, v0, p2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 558
    :cond_1
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 559
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Folder(id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") holding this bookmark does not exist!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 562
    :cond_2
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 291
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mButton:Landroid/widget/TextView;

    if-ne p1, v0, :cond_3

    .line 292
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 294
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderNamerShowing:Z

    if-eqz v0, :cond_1

    .line 295
    invoke-direct {p0, v2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->completeOrCancelFolderNaming(Z)V

    .line 315
    :cond_0
    :goto_0
    return-void

    .line 297
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->switchToDefaultView(Z)V

    goto :goto_0

    .line 300
    :cond_2
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->save()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->finish()V

    goto :goto_0

    .line 304
    :cond_3
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCancelButton:Landroid/view/View;

    if-ne p1, v0, :cond_6

    .line 305
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderNamerShowing:Z

    if-eqz v0, :cond_4

    .line 306
    invoke-direct {p0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->completeOrCancelFolderNaming(Z)V

    goto :goto_0

    .line 307
    :cond_4
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_5

    .line 308
    invoke-direct {p0, v2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->switchToDefaultView(Z)V

    goto :goto_0

    .line 310
    :cond_5
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->finish()V

    goto :goto_0

    .line 312
    :cond_6
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderCancel:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 313
    invoke-direct {p0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->completeOrCancelFolderNaming(Z)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "icicle"

    .prologue
    const/4 v12, 0x0

    const v9, 0x7f0c0073

    const/16 v8, 0x8

    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 620
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 621
    invoke-virtual {p0, v10}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->requestWindowFeature(I)Z

    .line 623
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mMap:Landroid/os/Bundle;

    .line 625
    const v6, 0x7f040012

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setContentView(I)V

    .line 627
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getWindow()Landroid/view/Window;

    move-result-object v5

    .line 629
    .local v5, window:Landroid/view/Window;
    invoke-virtual {p0, v9}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 630
    .local v4, title:Ljava/lang/String;
    const v6, 0x7f0d0031

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFakeTitle:Landroid/widget/TextView;

    .line 631
    const v6, 0x7f0d0030

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFakeTitleHolder:Landroid/view/View;

    .line 632
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFakeTitle:Landroid/widget/TextView;

    invoke-virtual {p0, v9}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 634
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mWarningDialog:Landroid/app/AlertDialog;

    .line 635
    const v6, 0x7f0d0007

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTitle:Landroid/widget/EditText;

    .line 636
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTitle:Landroid/widget/EditText;

    invoke-virtual {v6, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 638
    new-array v0, v10, [Landroid/text/InputFilter;

    .line 639
    .local v0, contentFilters:[Landroid/text/InputFilter;
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0e0009

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    .line 640
    .local v3, nLimit:I
    new-instance v6, Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;

    invoke-direct {v6, p0, v3, v3}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$2;-><init>(Lcom/android/browser/AddBookmarkFolderForOP01Menu;II)V

    aput-object v6, v0, v11

    .line 658
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mTitle:Landroid/widget/EditText;

    invoke-virtual {v6, v0}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 662
    const v6, 0x7f0d0038

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAddress:Landroid/widget/EditText;

    .line 663
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAddress:Landroid/widget/EditText;

    invoke-virtual {v6, v8}, Landroid/widget/EditText;->setVisibility(I)V

    .line 664
    const v6, 0x7f0d0036

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 666
    const v6, 0x7f0d003f

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mButton:Landroid/widget/TextView;

    .line 667
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mButton:Landroid/widget/TextView;

    invoke-virtual {v6, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 669
    const v6, 0x7f0d003e

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCancelButton:Landroid/view/View;

    .line 670
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCancelButton:Landroid/view/View;

    invoke-virtual {v6, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 672
    const v6, 0x7f0d003a

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/android/browser/addbookmark/FolderSpinner;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    .line 673
    new-instance v6, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    invoke-direct {v6, p0, v11}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;-><init>(Landroid/content/Context;Z)V

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    .line 674
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    iget-object v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    invoke-virtual {v6, v7}, Lcom/android/browser/addbookmark/FolderSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 675
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    invoke-virtual {v6, p0}, Lcom/android/browser/addbookmark/FolderSpinner;->setOnSetSelectionListener(Lcom/android/browser/addbookmark/FolderSpinner$OnSetSelectionListener;)V

    .line 677
    const v6, 0x7f0d0034

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mDefaultView:Landroid/view/View;

    .line 678
    const v6, 0x7f0d003b

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderSelector:Landroid/view/View;

    .line 680
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v6

    const v7, 0x7f040023

    invoke-virtual {v6, v7, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamerHolder:Landroid/view/View;

    .line 681
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamerHolder:Landroid/view/View;

    const v7, 0x7f0d0062

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    .line 682
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 683
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamerHolder:Landroid/view/View;

    const v7, 0x7f0d0063

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderCancel:Landroid/view/View;

    .line 684
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderCancel:Landroid/view/View;

    invoke-virtual {v6, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 686
    const v6, 0x7f0d002f

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAddNewFolder:Landroid/view/View;

    .line 687
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAddNewFolder:Landroid/view/View;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 688
    const v6, 0x7f0d002e

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAddSeparator:Landroid/view/View;

    .line 689
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAddSeparator:Landroid/view/View;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 691
    const v6, 0x7f0d0024

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/android/browser/BreadCrumbView;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    .line 692
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v6, v10}, Lcom/android/browser/BreadCrumbView;->setUseBackButton(Z)V

    .line 693
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v6, p0}, Lcom/android/browser/BreadCrumbView;->setController(Lcom/android/browser/BreadCrumbView$Controller;)V

    .line 694
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f02002e

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mHeaderIcon:Landroid/graphics/drawable/Drawable;

    .line 695
    const v6, 0x7f0d0016

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbHolder:Landroid/view/View;

    .line 696
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Lcom/android/browser/BreadCrumbView;->setMaxVisible(I)V

    .line 698
    new-instance v6, Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;

    invoke-direct {v6, p0, p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;-><init>(Lcom/android/browser/AddBookmarkFolderForOP01Menu;Landroid/content/Context;)V

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAdapter:Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;

    .line 699
    const v6, 0x7f0d003c

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/android/browser/AddBookmarkPage$CustomListView;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    .line 700
    const v6, 0x7f0d003d

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 701
    .local v1, empty:Landroid/view/View;
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v6, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setEmptyView(Landroid/view/View;)V

    .line 702
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAdapter:Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;

    invoke-virtual {v6, v7}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 703
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v6, p0}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 704
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v6, v7}, Lcom/android/browser/AddBookmarkPage$CustomListView;->addEditText(Landroid/widget/EditText;)V

    .line 706
    new-instance v6, Landroid/widget/ArrayAdapter;

    const v7, 0x1090008

    invoke-direct {v6, p0, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    .line 708
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    const v7, 0x1090009

    invoke-virtual {v6, v7}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 709
    const v6, 0x7f0d0039

    invoke-virtual {p0, v6}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Spinner;

    iput-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;

    .line 710
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;

    iget-object v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v6, v7}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 711
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;

    invoke-virtual {v6, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 713
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->isInTouchMode()Z

    move-result v6

    if-nez v6, :cond_0

    .line 714
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mButton:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->requestFocus()Z

    .line 718
    :cond_0
    invoke-direct {p0, v11}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setShowFolderNamer(Z)V

    .line 719
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v6, v9}, Landroid/widget/EditText;->setText(I)V

    .line 720
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->requestFocus()Z

    .line 721
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v2

    .line 722
    .local v2, imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v2, v6}, Landroid/view/inputmethod/InputMethodManager;->focusIn(Landroid/view/View;)V

    .line 723
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v2, v6, v10}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 725
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "parent"

    const-wide/16 v8, -0x1

    invoke-virtual {v6, v7, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    .line 727
    iget-wide v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    iput-wide v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mOriginalFolder:J

    .line 729
    const-string v6, "browser/AddBookmarkFolderForOP01Menu"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mCurrentFolder:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mRootFolder:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 730
    iget-wide v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-eqz v6, :cond_1

    iget-wide v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    const-wide/16 v8, 0x1

    cmp-long v6, v6, v8

    if-eqz v6, :cond_1

    .line 731
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    invoke-virtual {v6, v10}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    .line 732
    iget-object v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    iget-wide v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mOriginalFolder:J

    invoke-direct {p0, v7, v8}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getNameFromId(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->setOtherFolderDisplayText(Ljava/lang/String;)V

    .line 735
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v6

    invoke-virtual {v6, v11, v12, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 736
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 10
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
    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 484
    packed-switch p1, :pswitch_data_0

    .line 507
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Asking for nonexistant loader!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 486
    :pswitch_0
    new-instance v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$AccountsLoader;

    invoke-direct {v0, p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$AccountsLoader;-><init>(Landroid/content/Context;)V

    .line 504
    :goto_0
    return-object v0

    .line 488
    :pswitch_1
    const/4 v0, 0x3

    new-array v3, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v3, v2

    const-string v0, "title"

    aput-object v0, v3, v6

    const/4 v0, 0x2

    const-string v1, "folder"

    aput-object v1, v3, v0

    .line 492
    .local v3, projection:[Ljava/lang/String;
    const-string v4, "folder != 0 AND _id != ?"

    .line 494
    .local v4, where:Ljava/lang/String;
    new-array v5, v6, [Ljava/lang/String;

    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mMap:Landroid/os/Bundle;

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v2

    .line 498
    .local v5, whereArgs:[Ljava/lang/String;
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v0}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v9

    .line 499
    .local v9, data:Ljava/lang/Object;
    if-eqz v9, :cond_0

    .line 500
    check-cast v9, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    .end local v9           #data:Ljava/lang/Object;
    iget-wide v7, v9, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mId:J

    .line 504
    .local v7, currentFolder:J
    :goto_1
    new-instance v0, Landroid/content/CursorLoader;

    invoke-direct {p0, v7, v8}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getUriForFolder(J)Landroid/net/Uri;

    move-result-object v2

    const-string v6, "_id ASC"

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 502
    .end local v7           #currentFolder:J
    .restart local v9       #data:Ljava/lang/Object;
    :cond_0
    iget-wide v7, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    .restart local v7       #currentFolder:J
    goto :goto_1

    .line 484
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 219
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderNamer:Landroid/widget/EditText;

    if-ne p1, v2, :cond_1

    .line 220
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 221
    if-nez p2, :cond_0

    .line 223
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-ne v2, v0, :cond_0

    .line 224
    invoke-direct {p0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->completeOrCancelFolderNaming(Z)V

    .line 231
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 566
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const v1, 0x1020014

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 568
    .local v0, tv:Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p4, p5}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->descendInto(Ljava/lang/String;J)V

    .line 569
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 845
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;

    if-ne v2, p1, :cond_0

    .line 846
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;

    iget-wide v0, v2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;->rootFolderId:J

    .line 847
    .local v0, root:J
    iget-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 848
    invoke-direct {p0, v0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->onRootFolderFound(J)V

    .line 849
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    invoke-virtual {v2}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->clearRecentFolder()V

    .line 852
    .end local v0           #root:J
    :cond_0
    return-void
.end method

.method public onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V
    .locals 4
    .parameter
    .parameter "cursor"
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
    .line 513
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 529
    :goto_0
    return-void

    .line 515
    :pswitch_0
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->clear()V

    .line 516
    :goto_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 517
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    new-instance v1, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;

    invoke-direct {v1, p0, p2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;-><init>(Landroid/content/Context;Landroid/database/Cursor;)V

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 519
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    .line 520
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mEditInfoLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_0

    .line 524
    :pswitch_1
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAdapter:Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;

    invoke-virtual {v0, p2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 513
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 62
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V

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
    .line 532
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 539
    :goto_0
    return-void

    .line 534
    :pswitch_0
    iget-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAdapter:Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$FolderAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 532
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 857
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onSetSelection(J)V
    .locals 7
    .parameter "id"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 327
    const-string v2, "browser/AddBookmarkFolderForOP01Menu"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onSetSelection id :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    long-to-int v0, p1

    .line 329
    .local v0, intId:I
    iput-boolean v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderChanged:Z

    .line 330
    iput-boolean v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsOtherFolderSelected:Z

    .line 331
    iput-boolean v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsRecentFolder:Z

    .line 332
    packed-switch v0, :pswitch_data_0

    .line 357
    :goto_0
    :pswitch_0
    return-void

    .line 334
    :pswitch_1
    iget-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mRootFolder:J

    iput-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    .line 335
    iget-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    iput-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mOriginalFolder:J

    goto :goto_0

    .line 341
    :pswitch_2
    iput-boolean v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsOtherFolderSelected:Z

    .line 342
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->switchToFolderSelector()V

    goto :goto_0

    .line 345
    :pswitch_3
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    invoke-virtual {v2}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->recentFolderId()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    .line 346
    iget-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mCurrentFolder:J

    iput-wide v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mOriginalFolder:J

    .line 347
    iput-boolean v5, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsRecentFolder:Z

    .line 351
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    .line 352
    .local v1, manager:Landroid/app/LoaderManager;
    const/4 v2, 0x0

    invoke-virtual {v1, v5, v2, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_0

    .line 332
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onTop(Lcom/android/browser/BreadCrumbView;ILjava/lang/Object;)V
    .locals 7
    .parameter "view"
    .parameter "level"
    .parameter "data"

    .prologue
    const/4 v5, 0x1

    .line 190
    if-nez p3, :cond_0

    .line 204
    :goto_0
    return-void

    :cond_0
    move-object v2, p3

    .line 193
    check-cast v2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;

    .line 194
    .local v2, folderData:Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;
    iget-wide v0, v2, Lcom/android/browser/AddBookmarkFolderForOP01Menu$Folder;->mId:J

    .line 195
    .local v0, folder:J
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v4

    .line 196
    .local v4, manager:Landroid/app/LoaderManager;
    invoke-virtual {v4, v5}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v3

    check-cast v3, Landroid/content/CursorLoader;

    .line 198
    .local v3, loader:Landroid/content/CursorLoader;
    invoke-direct {p0, v0, v1}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->getUriForFolder(J)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    .line 199
    invoke-virtual {v3}, Landroid/content/CursorLoader;->forceLoad()V

    .line 200
    iget-boolean v6, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mIsFolderNamerShowing:Z

    if-eqz v6, :cond_1

    .line 201
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->completeOrCancelFolderNaming(Z)V

    .line 203
    :cond_1
    if-ne p2, v5, :cond_2

    :goto_1
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->setShowBookmarkIcon(Z)V

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method

.method setAccount(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "accountName"
    .parameter "accountType"

    .prologue
    .line 470
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 471
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2, v1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;

    .line 472
    .local v0, account:Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;
    iget-object v2, v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;->mAccountName:Ljava/lang/String;

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;->mAccountType:Ljava/lang/String;

    invoke-static {v2, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 474
    iget-object v2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->mAccountSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 475
    iget-wide v2, v0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;->rootFolderId:J

    invoke-direct {p0, v2, v3}, Lcom/android/browser/AddBookmarkFolderForOP01Menu;->onRootFolderFound(J)V

    .line 479
    .end local v0           #account:Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;
    :cond_0
    return-void

    .line 470
    .restart local v0       #account:Lcom/android/browser/AddBookmarkFolderForOP01Menu$BookmarkAccount;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
