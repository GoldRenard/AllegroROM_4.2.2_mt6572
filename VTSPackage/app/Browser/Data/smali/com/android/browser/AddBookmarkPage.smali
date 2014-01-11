.class public Lcom/android/browser/AddBookmarkPage;
.super Landroid/app/Activity;
.source "AddBookmarkPage.java"

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
        Lcom/android/browser/AddBookmarkPage$EditBookmarkInfoLoader;,
        Lcom/android/browser/AddBookmarkPage$EditBookmarkInfo;,
        Lcom/android/browser/AddBookmarkPage$BookmarkAccount;,
        Lcom/android/browser/AddBookmarkPage$AccountsLoader;,
        Lcom/android/browser/AddBookmarkPage$CustomListView;,
        Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;,
        Lcom/android/browser/AddBookmarkPage$SaveBookmarkRunnable;,
        Lcom/android/browser/AddBookmarkPage$FolderAdapter;,
        Lcom/android/browser/AddBookmarkPage$Folder;
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

.field private static final BOOKMARK_DELETED:I = 0x66

.field public static final CHECK_FOR_DUPE:Ljava/lang/String; = "check_for_dupe"

.field public static final DEFAULT_FOLDER_ID:J = -0x1L

.field static final EXTRA_EDIT_BOOKMARK:Ljava/lang/String; = "bookmark"

.field static final EXTRA_IS_FOLDER:Ljava/lang/String; = "is_folder"

.field private static final MAX_CRUMBS_SHOWN:I = 0x2

.field public static final REMOVE_THUMBNAIL:Ljava/lang/String; = "remove_thumbnail"

.field private static final SAVE_BOOKMARK:I = 0x64

.field private static final TOUCH_ICON_DOWNLOADED:I = 0x65

.field public static final TOUCH_ICON_URL:Ljava/lang/String; = "touch_icon_url"

.field public static final USER_AGENT:Ljava/lang/String; = "user_agent"

.field private static final XLOGTAG:Ljava/lang/String; = "browser/AddBookmarkPage"


# instance fields
.field private final LOADER_ID_ACCOUNTS:I

.field private final LOADER_ID_EDIT_INFO:I

.field private final LOADER_ID_FOLDER_CONTENTS:I

.field private final LOGTAG:Ljava/lang/String;

.field private mAccountAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Lcom/android/browser/AddBookmarkPage$BookmarkAccount;",
            ">;"
        }
    .end annotation
.end field

.field private mAccountSpinner:Landroid/widget/Spinner;

.field private mAdapter:Lcom/android/browser/AddBookmarkPage$FolderAdapter;

.field private mAddNewFolder:Landroid/view/View;

.field private mAddSeparator:Landroid/view/View;

.field private mAddress:Landroid/widget/EditText;

.field private mAlertDlgOk:Landroid/content/DialogInterface$OnClickListener;

.field private mButton:Landroid/widget/TextView;

.field private mCancelButton:Landroid/view/View;

.field private mCrumbHolder:Landroid/view/View;

.field private mCrumbs:Lcom/android/browser/BreadCrumbView;

.field private mCurrentFolder:J

.field private mCurrentId:J

.field private mDefaultView:Landroid/view/View;

.field private mEdit:Landroid/widget/EditText;

.field private mEditInfoLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks",
            "<",
            "Lcom/android/browser/AddBookmarkPage$EditBookmarkInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mEditingExisting:Z

.field private mEditingFolder:Z

.field private mFakeTitle:Landroid/widget/TextView;

.field private mFakeTitleHolder:Landroid/view/View;

.field private mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

.field private mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

.field private mFolderCancel:Landroid/view/View;

.field private mFolderNamer:Landroid/widget/EditText;

.field private mFolderNamerHolder:Landroid/view/View;

.field private mFolderSelector:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private mHeaderIcon:Landroid/graphics/drawable/Drawable;

.field private mIsFolderNamerShowing:Z

.field private mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

.field private mMap:Landroid/os/Bundle;

.field private mOriginalUrl:Ljava/lang/String;

.field private mOverwriteBookmarkId:J

.field private mRemoveLink:Landroid/view/View;

.field private mRootFolder:J

.field private mSaveToHomeScreen:Z

.field private mTitle:Landroid/widget/EditText;

.field private mTopLevelLabel:Landroid/widget/TextView;

.field private mTouchIconUrl:Ljava/lang/String;

.field private mWarningDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 96
    const-string v0, "Bookmarks"

    iput-object v0, p0, Lcom/android/browser/AddBookmarkPage;->LOGTAG:Ljava/lang/String;

    .line 100
    iput v1, p0, Lcom/android/browser/AddBookmarkPage;->LOADER_ID_ACCOUNTS:I

    .line 101
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/browser/AddBookmarkPage;->LOADER_ID_FOLDER_CONTENTS:I

    .line 102
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/browser/AddBookmarkPage;->LOADER_ID_EDIT_INFO:I

    .line 123
    iput-wide v2, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    .line 129
    iput-boolean v1, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    .line 138
    iput-wide v2, p0, Lcom/android/browser/AddBookmarkPage;->mOverwriteBookmarkId:J

    .line 413
    new-instance v0, Lcom/android/browser/AddBookmarkPage$1;

    invoke-direct {v0, p0}, Lcom/android/browser/AddBookmarkPage$1;-><init>(Lcom/android/browser/AddBookmarkPage;)V

    iput-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAlertDlgOk:Landroid/content/DialogInterface$OnClickListener;

    .line 572
    new-instance v0, Lcom/android/browser/AddBookmarkPage$2;

    invoke-direct {v0, p0}, Lcom/android/browser/AddBookmarkPage$2;-><init>(Lcom/android/browser/AddBookmarkPage;)V

    iput-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mEditInfoLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    .line 1515
    return-void
.end method

.method static synthetic access$002(Lcom/android/browser/AddBookmarkPage;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/android/browser/AddBookmarkPage;->mEditingExisting:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/browser/AddBookmarkPage;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->showRemoveButton()V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/browser/AddBookmarkPage;)Landroid/widget/Spinner;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAccountSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/browser/AddBookmarkPage;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkPage;->mIsFolderNamerShowing:Z

    return v0
.end method

.method static synthetic access$1200(Lcom/android/browser/AddBookmarkPage;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->showWarningDialog()V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/browser/AddBookmarkPage;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mTouchIconUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/browser/AddBookmarkPage;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mFakeTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/browser/AddBookmarkPage;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mTitle:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/browser/AddBookmarkPage;)Lcom/android/browser/addbookmark/FolderSpinnerAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/browser/AddBookmarkPage;)Landroid/os/Bundle;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/browser/AddBookmarkPage;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 76
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    return-wide v0
.end method

.method static synthetic access$602(Lcom/android/browser/AddBookmarkPage;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    iput-wide p1, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    return-wide p1
.end method

.method static synthetic access$700(Lcom/android/browser/AddBookmarkPage;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->onCurrentFolderFound()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/browser/AddBookmarkPage;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    return v0
.end method

.method static synthetic access$900(Lcom/android/browser/AddBookmarkPage;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 76
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    return-wide v0
.end method

.method private addFolderToCurrent(Ljava/lang/String;)J
    .locals 7
    .parameter "name"

    .prologue
    .line 472
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 473
    .local v4, values:Landroid/content/ContentValues;
    const-string v5, "title"

    invoke-virtual {v4, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    const-string v5, "folder"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 477
    const/4 v2, 0x0

    .line 478
    .local v2, data:Ljava/lang/Object;
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    if-eqz v5, :cond_0

    .line 479
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v5}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v2

    .line 481
    .end local v2           #data:Ljava/lang/Object;
    :cond_0
    if-eqz v2, :cond_1

    .line 482
    check-cast v2, Lcom/android/browser/AddBookmarkPage$Folder;

    iget-wide v0, v2, Lcom/android/browser/AddBookmarkPage$Folder;->Id:J

    .line 486
    .local v0, currentFolder:J
    :goto_0
    const-string v5, "parent"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 487
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3

    .line 489
    .local v3, uri:Landroid/net/Uri;
    if-eqz v3, :cond_2

    .line 490
    invoke-static {v3}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v5

    .line 492
    :goto_1
    return-wide v5

    .line 484
    .end local v0           #currentFolder:J
    .end local v3           #uri:Landroid/net/Uri;
    :cond_1
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    .restart local v0       #currentFolder:J
    goto :goto_0

    .line 492
    .restart local v3       #uri:Landroid/net/Uri;
    :cond_2
    const-wide/16 v5, -0x1

    goto :goto_1
.end method

.method public static addFolderToRoot(Landroid/content/Context;Ljava/lang/String;)J
    .locals 5
    .parameter "context"
    .parameter "name"

    .prologue
    .line 501
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 502
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "title"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    const-string v2, "folder"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 505
    const-string v2, "parent"

    const-wide/16 v3, 0x1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 506
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2, v3, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    .line 508
    .local v0, uri:Landroid/net/Uri;
    if-eqz v0, :cond_0

    .line 509
    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    .line 512
    :goto_0
    return-wide v2

    :cond_0
    invoke-static {p0, p1}, Lcom/android/browser/AddBookmarkPage;->getIdFromName(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v2

    goto :goto_0
.end method

.method private completeOrCancelFolderNaming(Z)V
    .locals 6
    .parameter "cancel"

    .prologue
    const/4 v5, 0x0

    .line 458
    if-nez p1, :cond_0

    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 459
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 460
    .local v2, name:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/browser/AddBookmarkPage;->addFolderToCurrent(Ljava/lang/String;)J

    move-result-wide v0

    .line 461
    .local v0, id:J
    invoke-direct {p0, v2, v0, v1}, Lcom/android/browser/AddBookmarkPage;->descendInto(Ljava/lang/String;J)V

    .line 463
    .end local v0           #id:J
    .end local v2           #name:Ljava/lang/String;
    :cond_0
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkPage;->setShowFolderNamer(Z)V

    .line 464
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mAddNewFolder:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 465
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mAddSeparator:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 466
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v3

    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v4}, Lcom/android/browser/AddBookmarkPage$CustomListView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v3, v4, v5}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 468
    return-void
.end method

.method private createHandler()V
    .locals 1

    .prologue
    .line 1162
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 1163
    new-instance v0, Lcom/android/browser/AddBookmarkPage$7;

    invoke-direct {v0, p0}, Lcom/android/browser/AddBookmarkPage$7;-><init>(Lcom/android/browser/AddBookmarkPage;)V

    iput-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mHandler:Landroid/os/Handler;

    .line 1192
    :cond_0
    return-void
.end method

.method private descendInto(Ljava/lang/String;J)V
    .locals 3
    .parameter "foldername"
    .parameter "id"

    .prologue
    .line 563
    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-eqz v0, :cond_0

    .line 564
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    new-instance v1, Lcom/android/browser/AddBookmarkPage$Folder;

    invoke-direct {v1, p1, p2, p3}, Lcom/android/browser/AddBookmarkPage$Folder;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v0, p1, v1}, Lcom/android/browser/BreadCrumbView;->pushView(Ljava/lang/String;Ljava/lang/Object;)Landroid/view/View;

    .line 565
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v0}, Lcom/android/browser/BreadCrumbView;->notifyController()V

    .line 570
    :goto_0
    return-void

    .line 568
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c001e

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private displayAlertDialogForExistingBookmark()V
    .locals 3

    .prologue
    .line 401
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0c001c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c001d

    invoke-virtual {p0, v1}, Lcom/android/browser/AddBookmarkPage;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0058

    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mAlertDlgOk:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0057

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 408
    return-void
.end method

.method private displayToastForExistingFolder()V
    .locals 3

    .prologue
    .line 360
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0c001e

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 362
    return-void
.end method

.method public static getIdFromData(Ljava/lang/Object;)J
    .locals 3
    .parameter "data"

    .prologue
    .line 178
    if-nez p0, :cond_0

    .line 179
    const-wide/16 v1, 0x1

    .line 182
    :goto_0
    return-wide v1

    :cond_0
    move-object v0, p0

    .line 181
    check-cast v0, Lcom/android/browser/AddBookmarkPage$Folder;

    .line 182
    .local v0, folder:Lcom/android/browser/AddBookmarkPage$Folder;
    iget-wide v1, v0, Lcom/android/browser/AddBookmarkPage$Folder;->Id:J

    goto :goto_0
.end method

.method private static getIdFromName(Landroid/content/Context;Ljava/lang/String;)J
    .locals 11
    .parameter "context"
    .parameter "name"

    .prologue
    .line 520
    const-wide/16 v8, -0x1

    .line 521
    .local v8, id:J
    const/4 v6, 0x0

    .line 523
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const-string v3, "title = ? AND deleted = ? AND folder = ? AND parent = ?"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    const-string v10, "0"

    aput-object v10, v4, v5

    const/4 v5, 0x2

    const-string v10, "1"

    aput-object v10, v4, v5

    const/4 v5, 0x3

    const-string v10, "1"

    aput-object v10, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 534
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 535
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 536
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v8

    goto :goto_0

    .line 542
    :cond_0
    if-eqz v6, :cond_1

    .line 543
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 546
    :cond_1
    :goto_1
    return-wide v8

    .line 539
    :catch_0
    move-exception v7

    .line 540
    .local v7, e:Ljava/lang/Exception;
    :try_start_1
    const-string v0, "AddBookmarkPage"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addFolderToRoot :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 542
    if-eqz v6, :cond_1

    .line 543
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 542
    .end local v7           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 543
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method private getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;
    .locals 1

    .prologue
    .line 160
    const-string v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/android/browser/AddBookmarkPage;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    return-object v0
.end method

.method private getNameFromId(J)Ljava/lang/String;
    .locals 9
    .parameter "mCurrentFolder2"

    .prologue
    .line 985
    const-string v7, ""

    .line 986
    .local v7, title:Ljava/lang/String;
    const/4 v6, 0x0

    .line 988
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

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

    .line 999
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1000
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 1003
    :cond_0
    if-eqz v6, :cond_1

    .line 1004
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1007
    :cond_1
    const-string v0, "browser/AddBookmarkPage"

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

    .line 1008
    return-object v7

    .line 1003
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 1004
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method private getTitleFromId(J)Ljava/lang/String;
    .locals 11
    .parameter "editId"

    .prologue
    .line 1384
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    .line 1385
    .local v1, uri:Landroid/net/Uri;
    const/4 v6, 0x0

    .line 1386
    .local v6, cursor:Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 1388
    .local v8, title:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "title"

    aput-object v4, v2, v3

    const-string v3, "_id = ? AND deleted = ? AND folder = ?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v5

    const/4 v5, 0x1

    const-string v9, "0"

    aput-object v9, v4, v5

    const/4 v5, 0x2

    const-string v9, "1"

    aput-object v9, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1398
    if-nez v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-eqz v0, :cond_1

    .line 1399
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1400
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    goto :goto_0

    .line 1406
    :cond_1
    if-eqz v6, :cond_2

    .line 1407
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1410
    :cond_2
    :goto_1
    return-object v8

    .line 1403
    :catch_0
    move-exception v7

    .line 1404
    .local v7, e:Ljava/lang/Exception;
    :try_start_1
    const-string v0, "browser/AddBookmarkPage"

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1406
    if-eqz v6, :cond_2

    .line 1407
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1406
    .end local v7           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 1407
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private getUriForFolder(J)Landroid/net/Uri;
    .locals 4
    .parameter "folder"

    .prologue
    .line 164
    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mAccountSpinner:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;

    .line 166
    .local v0, account:Lcom/android/browser/AddBookmarkPage$BookmarkAccount;
    iget-wide v1, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    cmp-long v1, p1, v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 167
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI_DEFAULT_FOLDER:Landroid/net/Uri;

    iget-object v2, v0, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;->accountType:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;->accountName:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/android/browser/BookmarksLoader;->addAccount(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 171
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p1, p2}, Landroid/provider/BrowserContract$Bookmarks;->buildFolderUri(J)Landroid/net/Uri;

    move-result-object v1

    goto :goto_0
.end method

.method private haveToOverwriteBookmarkId(Ljava/lang/String;Ljava/lang/String;J)I
    .locals 7
    .parameter "title"
    .parameter "url"
    .parameter "parent"

    .prologue
    .line 348
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    if-nez v0, :cond_0

    .line 349
    const-string v0, "browser/AddBookmarkPage"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Add bookmark page haveToOverwriteBookmarkId mCurrentId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-wide v5, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentId:J

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    invoke-static/range {v0 .. v6}, Lcom/android/browser/Bookmarks;->getIdByNameOrUrl(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;JJ)I

    move-result v0

    .line 352
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private hideSoftInput()V
    .locals 3

    .prologue
    .line 239
    const-string v0, "browser/AddBookmarkPage"

    const-string v1, "hideSoftInput"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 242
    return-void
.end method

.method private isFolderExist(JLjava/lang/String;)Z
    .locals 11
    .parameter "parentId"
    .parameter "title"

    .prologue
    .line 368
    const-string v0, "browser/AddBookmarkPage"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BrowserProvider2.isValidAccountName parentId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " title:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    const-wide/16 v2, 0x0

    cmp-long v0, p1, v2

    if-lez v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 371
    :cond_0
    const/4 v8, 0x0

    .line 393
    :cond_1
    :goto_0
    return v8

    .line 373
    :cond_2
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    .line 374
    .local v1, uri:Landroid/net/Uri;
    const/4 v6, 0x0

    .line 375
    .local v6, cursor:Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 377
    .local v8, exist:Z
    :try_start_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const-string v3, "parent = ? AND deleted = ? AND folder = ? AND title = ?"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v5

    const/4 v5, 0x1

    const-string v9, "0"

    aput-object v9, v4, v5

    const/4 v5, 0x2

    const-string v9, "1"

    aput-object v9, v4, v5

    const/4 v5, 0x3

    aput-object p3, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 385
    if-eqz v6, :cond_3

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_3

    const/4 v8, 0x1

    .line 389
    :goto_1
    if-eqz v6, :cond_1

    .line 390
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 385
    :cond_3
    const/4 v8, 0x0

    goto :goto_1

    .line 386
    :catch_0
    move-exception v7

    .line 387
    .local v7, e:Ljava/lang/Exception;
    :try_start_1
    const-string v0, "browser/AddBookmarkPage"

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 389
    if-eqz v6, :cond_1

    .line 390
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 389
    .end local v7           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 390
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method

.method private onCurrentFolderFound()V
    .locals 7

    .prologue
    const/4 v2, 0x1

    .line 1057
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    .line 1059
    .local v0, manager:Landroid/app/LoaderManager;
    iget-boolean v1, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    if-nez v1, :cond_0

    .line 1061
    iget-wide v3, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    const-wide/16 v5, -0x1

    cmp-long v1, v3, v5

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    iget-wide v5, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_2

    .line 1065
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    iget-boolean v1, p0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v3, v1}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    .line 1078
    :cond_0
    :goto_1
    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 1079
    return-void

    .line 1065
    :cond_1
    const/4 v1, 0x2

    goto :goto_0

    .line 1067
    :cond_2
    invoke-direct {p0, v2}, Lcom/android/browser/AddBookmarkPage;->setShowBookmarkIcon(Z)V

    .line 1068
    iget-boolean v1, p0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    if-nez v1, :cond_0

    .line 1072
    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    invoke-virtual {v1, v2}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    goto :goto_1
.end method

.method private onRootFolderFound(J)V
    .locals 4
    .parameter "root"

    .prologue
    .line 1038
    iput-wide p1, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    .line 1040
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 1041
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    iput-wide v0, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    .line 1043
    :cond_0
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->setupTopCrumb()V

    .line 1044
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->onCurrentFolderFound()V

    .line 1045
    return-void
.end method

.method private setShowBookmarkIcon(Z)V
    .locals 3
    .parameter "show"

    .prologue
    const/4 v1, 0x0

    .line 207
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mHeaderIcon:Landroid/graphics/drawable/Drawable;

    .line 208
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    :goto_0
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mTopLevelLabel:Landroid/widget/TextView;

    invoke-virtual {v2, v0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 209
    return-void

    .end local v0           #drawable:Landroid/graphics/drawable/Drawable;
    :cond_0
    move-object v0, v1

    .line 207
    goto :goto_0
.end method

.method private setShowFolderNamer(Z)V
    .locals 2
    .parameter "show"

    .prologue
    .line 733
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkPage;->mIsFolderNamerShowing:Z

    if-eq p1, v0, :cond_0

    .line 734
    iput-boolean p1, p0, Lcom/android/browser/AddBookmarkPage;->mIsFolderNamerShowing:Z

    .line 735
    if-eqz p1, :cond_1

    .line 738
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamerHolder:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->addFooterView(Landroid/view/View;)V

    .line 743
    :goto_0
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mAdapter:Lcom/android/browser/AddBookmarkPage$FolderAdapter;

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 744
    if-eqz p1, :cond_0

    .line 745
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setSelection(I)V

    .line 748
    :cond_0
    return-void

    .line 740
    :cond_1
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamerHolder:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->removeFooterView(Landroid/view/View;)Z

    goto :goto_0
.end method

.method private setupTopCrumb()V
    .locals 6

    .prologue
    .line 1048
    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v1}, Lcom/android/browser/BreadCrumbView;->clear()V

    .line 1049
    const v1, 0x7f0c0096

    invoke-virtual {p0, v1}, Lcom/android/browser/AddBookmarkPage;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1050
    .local v0, name:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    const/4 v2, 0x0

    new-instance v3, Lcom/android/browser/AddBookmarkPage$Folder;

    iget-wide v4, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    invoke-direct {v3, v0, v4, v5}, Lcom/android/browser/AddBookmarkPage$Folder;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v1, v0, v2, v3}, Lcom/android/browser/BreadCrumbView;->pushView(Ljava/lang/String;ZLjava/lang/Object;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mTopLevelLabel:Landroid/widget/TextView;

    .line 1053
    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mTopLevelLabel:Landroid/widget/TextView;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 1054
    return-void
.end method

.method private showRemoveButton()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1030
    const v0, 0x7f0d0032

    invoke-virtual {p0, v0}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1031
    const v0, 0x7f0d0033

    invoke-virtual {p0, v0}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mRemoveLink:Landroid/view/View;

    .line 1032
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mRemoveLink:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1033
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mRemoveLink:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1034
    return-void
.end method

.method private showWarningDialog()V
    .locals 3

    .prologue
    .line 1016
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mWarningDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1017
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mWarningDialog:Landroid/app/AlertDialog;

    const v1, 0x7f0c0039

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(I)V

    .line 1018
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mWarningDialog:Landroid/app/AlertDialog;

    const v1, 0x7f0c0038

    invoke-virtual {p0, v1}, Lcom/android/browser/AddBookmarkPage;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1019
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mWarningDialog:Landroid/app/AlertDialog;

    const v1, 0x7f0c003a

    invoke-virtual {p0, v1}, Lcom/android/browser/AddBookmarkPage;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/browser/AddBookmarkPage$6;

    invoke-direct {v2, p0}, Lcom/android/browser/AddBookmarkPage$6;-><init>(Lcom/android/browser/AddBookmarkPage;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1025
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mWarningDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1027
    :cond_0
    return-void
.end method

.method private switchToDefaultView(Z)V
    .locals 9
    .parameter "changedFolder"

    .prologue
    const/16 v6, 0x8

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 245
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 246
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mDefaultView:Landroid/view/View;

    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 247
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbHolder:Landroid/view/View;

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 248
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mFakeTitleHolder:Landroid/view/View;

    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 249
    if-eqz p1, :cond_3

    .line 250
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v5}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v0

    .line 251
    .local v0, data:Ljava/lang/Object;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 252
    check-cast v1, Lcom/android/browser/AddBookmarkPage$Folder;

    .line 253
    .local v1, folder:Lcom/android/browser/AddBookmarkPage$Folder;
    iget-wide v5, v1, Lcom/android/browser/AddBookmarkPage$Folder;->Id:J

    iput-wide v5, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    .line 254
    iget-wide v5, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    iget-wide v7, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    cmp-long v5, v5, v7

    if-nez v5, :cond_2

    .line 258
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    iget-boolean v6, p0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    if-eqz v6, :cond_1

    :goto_0
    invoke-virtual {v5, v3}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    .line 289
    .end local v0           #data:Ljava/lang/Object;
    .end local v1           #folder:Lcom/android/browser/AddBookmarkPage$Folder;
    :cond_0
    :goto_1
    return-void

    .restart local v0       #data:Ljava/lang/Object;
    .restart local v1       #folder:Lcom/android/browser/AddBookmarkPage$Folder;
    :cond_1
    move v3, v4

    .line 258
    goto :goto_0

    .line 260
    :cond_2
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    iget-object v4, v1, Lcom/android/browser/AddBookmarkPage$Folder;->Name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->setOtherFolderDisplayText(Ljava/lang/String;)V

    goto :goto_1

    .line 266
    .end local v0           #data:Ljava/lang/Object;
    .end local v1           #folder:Lcom/android/browser/AddBookmarkPage$Folder;
    :cond_3
    iget-boolean v5, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    if-eqz v5, :cond_4

    .line 267
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    invoke-virtual {v4, v3}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    goto :goto_1

    .line 269
    :cond_4
    iget-wide v5, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    iget-wide v7, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    cmp-long v5, v5, v7

    if-nez v5, :cond_6

    .line 270
    iget-object v5, p0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    iget-boolean v6, p0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    if-eqz v6, :cond_5

    :goto_2
    invoke-virtual {v5, v3}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    goto :goto_1

    :cond_5
    move v3, v4

    goto :goto_2

    .line 272
    :cond_6
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v3}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v0

    .line 273
    .restart local v0       #data:Ljava/lang/Object;
    if-eqz v0, :cond_7

    move-object v3, v0

    check-cast v3, Lcom/android/browser/AddBookmarkPage$Folder;

    iget-wide v5, v3, Lcom/android/browser/AddBookmarkPage$Folder;->Id:J

    iget-wide v7, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    cmp-long v3, v5, v7

    if-nez v3, :cond_7

    .line 277
    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    check-cast v0, Lcom/android/browser/AddBookmarkPage$Folder;

    .end local v0           #data:Ljava/lang/Object;
    iget-object v4, v0, Lcom/android/browser/AddBookmarkPage$Folder;->Name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->setOtherFolderDisplayText(Ljava/lang/String;)V

    goto :goto_1

    .line 281
    .restart local v0       #data:Ljava/lang/Object;
    :cond_7
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->setupTopCrumb()V

    .line 282
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v2

    .line 283
    .local v2, manager:Landroid/app/LoaderManager;
    const/4 v3, 0x0

    invoke-virtual {v2, v4, v3, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_1
.end method

.method private switchToFolderSelector()V
    .locals 3

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 551
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v0, v2}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setSelection(I)V

    .line 552
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mDefaultView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 553
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 554
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbHolder:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 555
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mFakeTitleHolder:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 556
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAddNewFolder:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 557
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAddSeparator:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 558
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 560
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
    .line 711
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-nez v2, :cond_0

    .line 712
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "No folders in the database!"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 716
    :cond_0
    invoke-interface {p1, p4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 717
    .local v0, folder:J
    cmp-long v2, v0, p2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 718
    :cond_1
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 719
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

    .line 722
    :cond_2
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    const/16 v7, 0x8

    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 293
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mButton:Landroid/widget/TextView;

    if-ne p1, v4, :cond_3

    .line 294
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2

    .line 296
    iget-boolean v4, p0, Lcom/android/browser/AddBookmarkPage;->mIsFolderNamerShowing:Z

    if-eqz v4, :cond_1

    .line 297
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkPage;->completeOrCancelFolderNaming(Z)V

    .line 342
    :cond_0
    :goto_0
    return-void

    .line 300
    :cond_1
    iput-boolean v5, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    .line 301
    invoke-direct {p0, v6}, Lcom/android/browser/AddBookmarkPage;->switchToDefaultView(Z)V

    goto :goto_0

    .line 305
    :cond_2
    const-wide/16 v4, -0x1

    iput-wide v4, p0, Lcom/android/browser/AddBookmarkPage;->mOverwriteBookmarkId:J

    .line 306
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->save()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 307
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->finish()V

    goto :goto_0

    .line 310
    :cond_3
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mCancelButton:Landroid/view/View;

    if-ne p1, v4, :cond_6

    .line 311
    iget-boolean v4, p0, Lcom/android/browser/AddBookmarkPage;->mIsFolderNamerShowing:Z

    if-eqz v4, :cond_4

    .line 312
    invoke-direct {p0, v6}, Lcom/android/browser/AddBookmarkPage;->completeOrCancelFolderNaming(Z)V

    goto :goto_0

    .line 313
    :cond_4
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mFolderSelector:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_5

    .line 314
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkPage;->switchToDefaultView(Z)V

    goto :goto_0

    .line 316
    :cond_5
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->finish()V

    goto :goto_0

    .line 318
    :cond_6
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mFolderCancel:Landroid/view/View;

    if-ne p1, v4, :cond_7

    .line 319
    invoke-direct {p0, v6}, Lcom/android/browser/AddBookmarkPage;->completeOrCancelFolderNaming(Z)V

    goto :goto_0

    .line 320
    :cond_7
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mAddNewFolder:Landroid/view/View;

    if-ne p1, v4, :cond_8

    .line 321
    invoke-direct {p0, v6}, Lcom/android/browser/AddBookmarkPage;->setShowFolderNamer(Z)V

    .line 322
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    const v5, 0x7f0c0073

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(I)V

    .line 323
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->requestFocus()Z

    .line 324
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mAddNewFolder:Landroid/view/View;

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 325
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mAddSeparator:Landroid/view/View;

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 326
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->getInputMethodManager()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v2

    .line 329
    .local v2, imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    invoke-virtual {v2, v4}, Landroid/view/inputmethod/InputMethodManager;->focusIn(Landroid/view/View;)V

    .line 330
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    invoke-virtual {v2, v4, v6}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 331
    .end local v2           #imm:Landroid/view/inputmethod/InputMethodManager;
    :cond_8
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mRemoveLink:Landroid/view/View;

    if-ne p1, v4, :cond_0

    .line 332
    iget-boolean v4, p0, Lcom/android/browser/AddBookmarkPage;->mEditingExisting:Z

    if-nez v4, :cond_9

    .line 333
    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "Remove button should not be shown for new bookmarks"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 336
    :cond_9
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    const-string v5, "_id"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 337
    .local v0, id:J
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->createHandler()V

    .line 338
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x66

    invoke-static {v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    .line 339
    .local v3, msg:Landroid/os/Message;
    iget-object v4, p0, Lcom/android/browser/AddBookmarkPage;->mTitle:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v4, p0, v3}, Lcom/android/browser/BookmarkUtils;->displayRemoveBookmarkDialog(JLjava/lang/String;Landroid/content/Context;Landroid/os/Message;)V

    goto/16 :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "newConfig"

    .prologue
    .line 231
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 233
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 22
    .parameter "icicle"

    .prologue
    .line 783
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 784
    const/16 v18, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->requestWindowFeature(I)Z

    .line 786
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getIntent()Landroid/content/Intent;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    .line 788
    const v18, 0x7f040012

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->setContentView(I)V

    .line 790
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getWindow()Landroid/view/Window;

    move-result-object v17

    .line 793
    .local v17, window:Landroid/view/Window;
    invoke-static/range {p0 .. p0}, Lcom/android/browser/BrowserActivity;->isTablet(Landroid/content/Context;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 794
    const/16 v18, 0x10

    invoke-virtual/range {v17 .. v18}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 798
    :cond_0
    const/4 v15, 0x0

    .line 799
    .local v15, title:Ljava/lang/String;
    const/16 v16, 0x0

    .line 801
    .local v16, url:Ljava/lang/String;
    const v18, 0x7f0d0031

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/TextView;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFakeTitle:Landroid/widget/TextView;

    .line 803
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    if-eqz v18, :cond_2

    .line 804
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "bookmark"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v5

    .line 805
    .local v5, b:Landroid/os/Bundle;
    if-eqz v5, :cond_6

    .line 806
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "is_folder"

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v20}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    .line 807
    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    .line 808
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/AddBookmarkPage;->mEditingExisting:Z

    .line 810
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "_id"

    const-wide/16 v20, -0x1

    invoke-virtual/range {v18 .. v21}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/browser/AddBookmarkPage;->mCurrentId:J

    .line 811
    const-string v18, "browser/AddBookmarkPage"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Add bookmark page onCreate mCurrentId:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentId:J

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 812
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFakeTitle:Landroid/widget/TextView;

    move-object/from16 v18, v0

    const v19, 0x7f0c007f

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setText(I)V

    .line 813
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v18, v0

    if-eqz v18, :cond_5

    .line 814
    const v18, 0x7f0d0036

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setVisibility(I)V

    .line 826
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "title"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 827
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "url"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .end local v16           #url:Ljava/lang/String;
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mOriginalUrl:Ljava/lang/String;

    .line 828
    .restart local v16       #url:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "touch_icon_url"

    invoke-virtual/range {v18 .. v19}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mTouchIconUrl:Ljava/lang/String;

    .line 830
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "parent"

    const-wide/16 v20, -0x1

    invoke-virtual/range {v18 .. v21}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    .line 831
    const-string v18, "Bookmarks"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "CurrentFolderId: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    .end local v5           #b:Landroid/os/Bundle;
    :cond_2
    new-instance v18, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual/range {v18 .. v18}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mWarningDialog:Landroid/app/AlertDialog;

    .line 836
    const v18, 0x7f0d0007

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/EditText;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mTitle:Landroid/widget/EditText;

    .line 838
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v7, v0, [Landroid/text/InputFilter;

    .line 839
    .local v7, contentFilters:[Landroid/text/InputFilter;
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f0e0009

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v13

    .line 840
    .local v13, nLimit:I
    const/16 v18, 0x0

    new-instance v19, Lcom/android/browser/AddBookmarkPage$3;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13, v13}, Lcom/android/browser/AddBookmarkPage$3;-><init>(Lcom/android/browser/AddBookmarkPage;II)V

    aput-object v19, v7, v18

    .line 858
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mTitle:Landroid/widget/EditText;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 860
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mTitle:Landroid/widget/EditText;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 862
    const v18, 0x7f0d0038

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/EditText;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mAddress:Landroid/widget/EditText;

    .line 864
    const-string v18, "ro.operator.optr"

    invoke-static/range {v18 .. v18}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 865
    .local v14, optr:Ljava/lang/String;
    if-eqz v14, :cond_3

    const-string v18, "OP01"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 866
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v4, v0, [Landroid/text/InputFilter;

    .line 867
    .local v4, addressFilters:[Landroid/text/InputFilter;
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f0e000a

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v12

    .line 868
    .local v12, nAddressLimit:I
    const/16 v18, 0x0

    new-instance v19, Lcom/android/browser/AddBookmarkPage$4;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v12, v12}, Lcom/android/browser/AddBookmarkPage$4;-><init>(Lcom/android/browser/AddBookmarkPage;II)V

    aput-object v19, v4, v18

    .line 885
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAddress:Landroid/widget/EditText;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 888
    .end local v4           #addressFilters:[Landroid/text/InputFilter;
    .end local v12           #nAddressLimit:I
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAddress:Landroid/widget/EditText;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 890
    const v18, 0x7f0d003f

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/TextView;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mButton:Landroid/widget/TextView;

    .line 891
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mButton:Landroid/widget/TextView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 893
    const v18, 0x7f0d003e

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mCancelButton:Landroid/view/View;

    .line 894
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mCancelButton:Landroid/view/View;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 896
    const v18, 0x7f0d003a

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Lcom/android/browser/addbookmark/FolderSpinner;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    .line 897
    new-instance v19, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v18, v0

    if-nez v18, :cond_7

    const/16 v18, 0x1

    :goto_1
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;-><init>(Landroid/content/Context;Z)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    .line 898
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/android/browser/addbookmark/FolderSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 899
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/android/browser/addbookmark/FolderSpinner;->setOnSetSelectionListener(Lcom/android/browser/addbookmark/FolderSpinner$OnSetSelectionListener;)V

    .line 901
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v18, v0

    const-wide/16 v20, -0x1

    cmp-long v18, v18, v20

    if-eqz v18, :cond_9

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v18, v0

    const-wide/16 v20, 0x1

    cmp-long v18, v18, v20

    if-eqz v18, :cond_9

    .line 902
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v18, v0

    if-eqz v18, :cond_8

    const/16 v18, 0x1

    :goto_2
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    .line 903
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    invoke-direct {v0, v1, v2}, Lcom/android/browser/AddBookmarkPage;->getNameFromId(J)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->setOtherFolderDisplayText(Ljava/lang/String;)V

    .line 910
    :goto_3
    const v18, 0x7f0d0034

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mDefaultView:Landroid/view/View;

    .line 911
    const v18, 0x7f0d003b

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFolderSelector:Landroid/view/View;

    .line 913
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v18

    const v19, 0x7f040023

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v20}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFolderNamerHolder:Landroid/view/View;

    .line 914
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderNamerHolder:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0d0062

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/EditText;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    .line 916
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f0e0009

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v11

    .line 917
    .local v11, limit:I
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v6, v0, [Landroid/text/InputFilter;

    .line 918
    .local v6, contentFilter:[Landroid/text/InputFilter;
    const/16 v18, 0x0

    new-instance v19, Lcom/android/browser/AddBookmarkPage$5;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11, v13}, Lcom/android/browser/AddBookmarkPage$5;-><init>(Lcom/android/browser/AddBookmarkPage;II)V

    aput-object v19, v6, v18

    .line 936
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 939
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 941
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Landroid/widget/EditText;->setLongClickable(Z)V

    .line 943
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderNamerHolder:Landroid/view/View;

    move-object/from16 v18, v0

    const v19, 0x7f0d0063

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFolderCancel:Landroid/view/View;

    .line 944
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderCancel:Landroid/view/View;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 946
    const v18, 0x7f0d002f

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mAddNewFolder:Landroid/view/View;

    .line 947
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAddNewFolder:Landroid/view/View;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 948
    const v18, 0x7f0d002e

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mAddSeparator:Landroid/view/View;

    .line 950
    const v18, 0x7f0d0024

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Lcom/android/browser/BreadCrumbView;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    .line 951
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lcom/android/browser/BreadCrumbView;->setUseBackButton(Z)V

    .line 952
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/android/browser/BreadCrumbView;->setController(Lcom/android/browser/BreadCrumbView$Controller;)V

    .line 953
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f02002e

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mHeaderIcon:Landroid/graphics/drawable/Drawable;

    .line 954
    const v18, 0x7f0d0016

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mCrumbHolder:Landroid/view/View;

    .line 955
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    move-object/from16 v18, v0

    const/16 v19, 0x2

    invoke-virtual/range {v18 .. v19}, Lcom/android/browser/BreadCrumbView;->setMaxVisible(I)V

    .line 957
    new-instance v18, Lcom/android/browser/AddBookmarkPage$FolderAdapter;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/android/browser/AddBookmarkPage$FolderAdapter;-><init>(Lcom/android/browser/AddBookmarkPage;Landroid/content/Context;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mAdapter:Lcom/android/browser/AddBookmarkPage$FolderAdapter;

    .line 958
    const v18, 0x7f0d003c

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Lcom/android/browser/AddBookmarkPage$CustomListView;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    .line 959
    const v18, 0x7f0d003d

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 960
    .local v8, empty:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setEmptyView(Landroid/view/View;)V

    .line 961
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAdapter:Lcom/android/browser/AddBookmarkPage$FolderAdapter;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 962
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$CustomListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 963
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mListView:Lcom/android/browser/AddBookmarkPage$CustomListView;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/android/browser/AddBookmarkPage$CustomListView;->addEditText(Landroid/widget/EditText;)V

    .line 965
    new-instance v18, Landroid/widget/ArrayAdapter;

    const v19, 0x1090008

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    .line 967
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    move-object/from16 v18, v0

    const v19, 0x1090009

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 969
    const v18, 0x7f0d0039

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/Spinner;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mAccountSpinner:Landroid/widget/Spinner;

    .line 970
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAccountSpinner:Landroid/widget/Spinner;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 971
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAccountSpinner:Landroid/widget/Spinner;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 974
    const v18, 0x7f0d0030

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/browser/AddBookmarkPage;->mFakeTitleHolder:Landroid/view/View;

    .line 976
    invoke-virtual/range {v17 .. v17}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->isInTouchMode()Z

    move-result v18

    if-nez v18, :cond_4

    .line 977
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mButton:Landroid/widget/TextView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/TextView;->requestFocus()Z

    .line 980
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v18

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move-object/from16 v2, v20

    move-object/from16 v3, p0

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 981
    return-void

    .line 816
    .end local v6           #contentFilter:[Landroid/text/InputFilter;
    .end local v7           #contentFilters:[Landroid/text/InputFilter;
    .end local v8           #empty:Landroid/view/View;
    .end local v11           #limit:I
    .end local v13           #nLimit:I
    .end local v14           #optr:Ljava/lang/String;
    .restart local v5       #b:Landroid/os/Bundle;
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->showRemoveButton()V

    goto/16 :goto_0

    .line 819
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v18, v0

    const-string v19, "gravity"

    const/16 v20, -0x1

    invoke-virtual/range {v18 .. v20}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v9

    .line 820
    .local v9, gravity:I
    const/16 v18, -0x1

    move/from16 v0, v18

    if-eq v9, v0, :cond_1

    .line 821
    invoke-virtual/range {v17 .. v17}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v10

    .line 822
    .local v10, l:Landroid/view/WindowManager$LayoutParams;
    iput v9, v10, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 823
    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    goto/16 :goto_0

    .line 897
    .end local v5           #b:Landroid/os/Bundle;
    .end local v9           #gravity:I
    .end local v10           #l:Landroid/view/WindowManager$LayoutParams;
    .restart local v7       #contentFilters:[Landroid/text/InputFilter;
    .restart local v13       #nLimit:I
    .restart local v14       #optr:Ljava/lang/String;
    :cond_7
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 902
    :cond_8
    const/16 v18, 0x2

    goto/16 :goto_2

    .line 906
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mFolder:Lcom/android/browser/addbookmark/FolderSpinner;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v18, v0

    if-eqz v18, :cond_a

    const/16 v18, 0x0

    :goto_4
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/android/browser/addbookmark/FolderSpinner;->setSelectionIgnoringSelectionChange(I)V

    goto/16 :goto_3

    :cond_a
    const/16 v18, 0x1

    goto :goto_4
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

    .line 641
    packed-switch p1, :pswitch_data_0

    .line 671
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Asking for nonexistant loader!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 643
    :pswitch_0
    new-instance v0, Lcom/android/browser/AddBookmarkPage$AccountsLoader;

    invoke-direct {v0, p0}, Lcom/android/browser/AddBookmarkPage$AccountsLoader;-><init>(Landroid/content/Context;)V

    .line 664
    :goto_0
    return-object v0

    .line 645
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

    .line 650
    .local v3, projection:[Ljava/lang/String;
    const-string v4, "folder != 0"

    .line 651
    .local v4, where:Ljava/lang/String;
    const/4 v5, 0x0

    .line 652
    .local v5, whereArgs:[Ljava/lang/String;
    iget-boolean v0, p0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    if-eqz v0, :cond_0

    .line 653
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND _id != ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 654
    new-array v5, v6, [Ljava/lang/String;

    .end local v5           #whereArgs:[Ljava/lang/String;
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v2

    .line 658
    .restart local v5       #whereArgs:[Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mCrumbs:Lcom/android/browser/BreadCrumbView;

    invoke-virtual {v0}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v9

    .line 659
    .local v9, data:Ljava/lang/Object;
    if-eqz v9, :cond_1

    .line 660
    check-cast v9, Lcom/android/browser/AddBookmarkPage$Folder;

    .end local v9           #data:Ljava/lang/Object;
    iget-wide v7, v9, Lcom/android/browser/AddBookmarkPage$Folder;->Id:J

    .line 664
    .local v7, currentFolder:J
    :goto_1
    new-instance v0, Landroid/content/CursorLoader;

    invoke-direct {p0, v7, v8}, Lcom/android/browser/AddBookmarkPage;->getUriForFolder(J)Landroid/net/Uri;

    move-result-object v2

    const-string v6, "_id ASC"

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 662
    .end local v7           #currentFolder:J
    .restart local v9       #data:Ljava/lang/Object;
    :cond_1
    iget-wide v7, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    .restart local v7       #currentFolder:J
    goto :goto_1

    .line 641
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    .line 213
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mFolderNamer:Landroid/widget/EditText;

    if-ne p1, v0, :cond_2

    .line 214
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 215
    const/4 v0, 0x6

    if-eq p2, v0, :cond_0

    if-nez p2, :cond_1

    .line 216
    :cond_0
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->hideSoftInput()V

    .line 220
    :cond_1
    const/4 v0, 0x1

    .line 222
    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

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
    .line 727
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const v1, 0x1020014

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 729
    .local v0, tv:Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p4, p5}, Lcom/android/browser/AddBookmarkPage;->descendInto(Ljava/lang/String;J)V

    .line 730
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
    .line 1416
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mAccountSpinner:Landroid/widget/Spinner;

    if-ne v2, p1, :cond_0

    .line 1417
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;

    iget-wide v0, v2, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;->rootFolderId:J

    .line 1418
    .local v0, root:J
    iget-wide v2, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 1419
    invoke-direct {p0, v0, v1}, Lcom/android/browser/AddBookmarkPage;->onRootFolderFound(J)V

    .line 1420
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    invoke-virtual {v2}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->clearRecentFolder()V

    .line 1423
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
    .line 677
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 691
    :goto_0
    return-void

    .line 679
    :pswitch_0
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->clear()V

    .line 680
    :goto_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 681
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    new-instance v1, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;

    invoke-direct {v1, p0, p2}, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;-><init>(Landroid/content/Context;Landroid/database/Cursor;)V

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 683
    :cond_0
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    .line 684
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/browser/AddBookmarkPage;->mEditInfoLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_0

    .line 688
    :pswitch_1
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAdapter:Lcom/android/browser/AddBookmarkPage$FolderAdapter;

    invoke-virtual {v0, p2}, Lcom/android/browser/AddBookmarkPage$FolderAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 677
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
    .line 76
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/AddBookmarkPage;->onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V

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
    .line 694
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 699
    :goto_0
    return-void

    .line 696
    :pswitch_0
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage;->mAdapter:Lcom/android/browser/AddBookmarkPage$FolderAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage$FolderAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 694
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
    .line 1428
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method

.method public onSetSelection(J)V
    .locals 6
    .parameter "id"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 425
    long-to-int v0, p1

    .line 426
    .local v0, intId:I
    packed-switch v0, :pswitch_data_0

    .line 450
    :goto_0
    return-void

    .line 428
    :pswitch_0
    iget-wide v2, p0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    iput-wide v2, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    .line 429
    iput-boolean v4, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    goto :goto_0

    .line 433
    :pswitch_1
    iput-boolean v5, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    goto :goto_0

    .line 436
    :pswitch_2
    invoke-direct {p0}, Lcom/android/browser/AddBookmarkPage;->switchToFolderSelector()V

    goto :goto_0

    .line 439
    :pswitch_3
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mFolderAdapter:Lcom/android/browser/addbookmark/FolderSpinnerAdapter;

    invoke-virtual {v2}, Lcom/android/browser/addbookmark/FolderSpinnerAdapter;->recentFolderId()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    .line 440
    iput-boolean v4, p0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    .line 444
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    .line 445
    .local v1, manager:Landroid/app/LoaderManager;
    const/4 v2, 0x0

    invoke-virtual {v1, v5, v2, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_0

    .line 426
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
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

    .line 188
    if-nez p3, :cond_0

    .line 200
    :goto_0
    return-void

    :cond_0
    move-object v2, p3

    .line 189
    check-cast v2, Lcom/android/browser/AddBookmarkPage$Folder;

    .line 190
    .local v2, folderData:Lcom/android/browser/AddBookmarkPage$Folder;
    iget-wide v0, v2, Lcom/android/browser/AddBookmarkPage$Folder;->Id:J

    .line 191
    .local v0, folder:J
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v4

    .line 192
    .local v4, manager:Landroid/app/LoaderManager;
    invoke-virtual {v4, v5}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v3

    check-cast v3, Landroid/content/CursorLoader;

    .line 194
    .local v3, loader:Landroid/content/CursorLoader;
    invoke-direct {p0, v0, v1}, Lcom/android/browser/AddBookmarkPage;->getUriForFolder(J)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    .line 195
    invoke-virtual {v3}, Landroid/content/CursorLoader;->forceLoad()V

    .line 196
    iget-boolean v6, p0, Lcom/android/browser/AddBookmarkPage;->mIsFolderNamerShowing:Z

    if-eqz v6, :cond_1

    .line 197
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkPage;->completeOrCancelFolderNaming(Z)V

    .line 199
    :cond_1
    if-ne p2, v5, :cond_2

    :goto_1
    invoke-direct {p0, v5}, Lcom/android/browser/AddBookmarkPage;->setShowBookmarkIcon(Z)V

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method

.method save()Z
    .locals 37

    .prologue
    .line 1198
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->createHandler()V

    .line 1200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mTitle:Landroid/widget/EditText;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v26

    .line 1202
    .local v26, title:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAddress:Landroid/widget/EditText;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/android/browser/UrlUtils;->fixUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 1203
    .local v27, unfilteredUrl:Ljava/lang/String;
    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_3

    const/4 v15, 0x1

    .line 1204
    .local v15, emptyTitle:Z
    :goto_0
    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_4

    const/16 v16, 0x1

    .line 1205
    .local v16, emptyUrl:Z
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getResources()Landroid/content/res/Resources;

    move-result-object v22

    .line 1206
    .local v22, r:Landroid/content/res/Resources;
    if-nez v15, :cond_0

    if-eqz v16, :cond_5

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v33, v0

    if-nez v33, :cond_5

    .line 1207
    :cond_0
    if-eqz v15, :cond_1

    .line 1208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mTitle:Landroid/widget/EditText;

    move-object/from16 v33, v0

    const v34, 0x7f0c0089

    move-object/from16 v0, v22

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 1210
    :cond_1
    if-eqz v16, :cond_2

    .line 1211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAddress:Landroid/widget/EditText;

    move-object/from16 v33, v0

    const v34, 0x7f0c008a

    move-object/from16 v0, v22

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 1213
    :cond_2
    const/16 v33, 0x0

    .line 1375
    :goto_2
    return v33

    .line 1203
    .end local v15           #emptyTitle:Z
    .end local v16           #emptyUrl:Z
    .end local v22           #r:Landroid/content/res/Resources;
    :cond_3
    const/4 v15, 0x0

    goto :goto_0

    .line 1204
    .restart local v15       #emptyTitle:Z
    :cond_4
    const/16 v16, 0x0

    goto :goto_1

    .line 1216
    .restart local v16       #emptyUrl:Z
    .restart local v22       #r:Landroid/content/res/Resources;
    :cond_5
    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v29

    .line 1217
    .local v29, url:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v33, v0

    if-nez v33, :cond_8

    .line 1222
    :try_start_0
    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v33

    const-string v34, "javascript:"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v33

    if-nez v33, :cond_8

    .line 1223
    new-instance v28, Ljava/net/URI;

    invoke-direct/range {v28 .. v29}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 1224
    .local v28, uriObj:Ljava/net/URI;
    invoke-virtual/range {v28 .. v28}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v23

    .line 1225
    .local v23, scheme:Ljava/lang/String;
    invoke-static/range {v29 .. v29}, Lcom/android/browser/Bookmarks;->urlHasAcceptableScheme(Ljava/lang/String;)Z

    move-result v33

    if-nez v33, :cond_8

    .line 1229
    if-eqz v23, :cond_6

    .line 1230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAddress:Landroid/widget/EditText;

    move-object/from16 v33, v0

    const v34, 0x7f0c008c

    move-object/from16 v0, v22

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1231
    const/16 v33, 0x0

    goto :goto_2

    .line 1235
    :cond_6
    :try_start_1
    new-instance v5, Landroid/net/WebAddress;

    move-object/from16 v0, v27

    invoke-direct {v5, v0}, Landroid/net/WebAddress;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/net/ParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1239
    .local v5, address:Landroid/net/WebAddress;
    :try_start_2
    invoke-virtual {v5}, Landroid/net/WebAddress;->getHost()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_7

    .line 1240
    new-instance v33, Ljava/net/URISyntaxException;

    const-string v34, ""

    const-string v35, ""

    invoke-direct/range {v33 .. v35}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v33
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1245
    .end local v5           #address:Landroid/net/WebAddress;
    .end local v23           #scheme:Ljava/lang/String;
    .end local v28           #uriObj:Ljava/net/URI;
    :catch_0
    move-exception v12

    .line 1246
    .local v12, e:Ljava/net/URISyntaxException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mAddress:Landroid/widget/EditText;

    move-object/from16 v33, v0

    const v34, 0x7f0c008b

    move-object/from16 v0, v22

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 1247
    const/16 v33, 0x0

    goto :goto_2

    .line 1236
    .end local v12           #e:Ljava/net/URISyntaxException;
    .restart local v23       #scheme:Ljava/lang/String;
    .restart local v28       #uriObj:Ljava/net/URI;
    :catch_1
    move-exception v12

    .line 1237
    .local v12, e:Landroid/net/ParseException;
    :try_start_3
    new-instance v33, Ljava/net/URISyntaxException;

    const-string v34, ""

    const-string v35, ""

    invoke-direct/range {v33 .. v35}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v33

    .line 1242
    .end local v12           #e:Landroid/net/ParseException;
    .restart local v5       #address:Landroid/net/WebAddress;
    :cond_7
    invoke-virtual {v5}, Landroid/net/WebAddress;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v29

    .line 1252
    .end local v5           #address:Landroid/net/WebAddress;
    .end local v23           #scheme:Ljava/lang/String;
    .end local v28           #uriObj:Ljava/net/URI;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mOriginalUrl:Ljava/lang/String;

    move-object/from16 v33, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    .line 1254
    .local v30, urlUnmodified:Z
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mOverwriteBookmarkId:J

    move-wide/from16 v33, v0

    const-wide/16 v35, 0x0

    cmp-long v33, v33, v35

    if-lez v33, :cond_b

    .line 1255
    new-instance v32, Landroid/content/ContentValues;

    invoke-direct/range {v32 .. v32}, Landroid/content/ContentValues;-><init>()V

    .line 1256
    .local v32, valuesDeleteItem:Landroid/content/ContentValues;
    const-string v33, "bookmark_current_id"

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentId:J

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1258
    new-instance v31, Landroid/content/ContentValues;

    invoke-direct/range {v31 .. v31}, Landroid/content/ContentValues;-><init>()V

    .line 1259
    .local v31, values:Landroid/content/ContentValues;
    const-string v33, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1260
    const-string v33, "parent"

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1261
    const-string v33, "url"

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1262
    if-nez v30, :cond_9

    .line 1263
    const-string v33, "thumbnail"

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1265
    :cond_9
    invoke-virtual/range {v31 .. v31}, Landroid/content/ContentValues;->size()I

    move-result v33

    if-lez v33, :cond_a

    .line 1266
    new-instance v33, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;

    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

    move-result-object v34

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mOverwriteBookmarkId:J

    move-wide/from16 v35, v0

    invoke-direct/range {v33 .. v36}, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;-><init>(Landroid/content/Context;J)V

    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v0, v0, [Landroid/content/ContentValues;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    aput-object v31, v34, v35

    const/16 v35, 0x1

    aput-object v32, v34, v35

    invoke-virtual/range {v33 .. v34}, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1268
    :cond_a
    const-wide/16 v33, -0x1

    move-wide/from16 v0, v33

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/browser/AddBookmarkPage;->mOverwriteBookmarkId:J

    .line 1269
    const/16 v33, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->setResult(I)V

    .line 1270
    const/16 v33, 0x1

    goto/16 :goto_2

    .line 1272
    .end local v31           #values:Landroid/content/ContentValues;
    .end local v32           #valuesDeleteItem:Landroid/content/ContentValues;
    :cond_b
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v33, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v29

    move-wide/from16 v3, v33

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/browser/AddBookmarkPage;->haveToOverwriteBookmarkId(Ljava/lang/String;Ljava/lang/String;J)I

    move-result v33

    move/from16 v0, v33

    int-to-long v0, v0

    move-wide/from16 v33, v0

    move-wide/from16 v0, v33

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/browser/AddBookmarkPage;->mOverwriteBookmarkId:J

    .line 1273
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mOverwriteBookmarkId:J

    move-wide/from16 v33, v0

    const-wide/16 v35, 0x0

    cmp-long v33, v33, v35

    if-lez v33, :cond_c

    .line 1274
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->displayAlertDialogForExistingBookmark()V

    .line 1275
    const/16 v33, 0x0

    goto/16 :goto_2

    .line 1278
    :cond_c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingExisting:Z

    move/from16 v33, v0

    if-eqz v33, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v33, v0

    if-eqz v33, :cond_f

    .line 1279
    const-string v33, "browser/AddBookmarkPage"

    const-string v34, "editing folder save"

    invoke-static/range {v33 .. v34}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1282
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v33, v0

    const-string v34, "_id"

    const-wide/16 v35, -0x1

    invoke-virtual/range {v33 .. v36}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v13

    .line 1283
    .local v13, editId:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v33, v0

    const-string v34, "parent"

    const-wide/16 v35, -0x1

    invoke-virtual/range {v33 .. v36}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 1285
    .local v7, beforeParentId:J
    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    .line 1287
    .local v10, currentParentId:J
    const-wide/16 v33, -0x1

    cmp-long v33, v7, v33

    if-nez v33, :cond_d

    .line 1288
    move-object/from16 v0, p0

    iget-wide v7, v0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    .line 1290
    :cond_d
    const-wide/16 v33, -0x1

    cmp-long v33, v10, v33

    if-nez v33, :cond_e

    .line 1291
    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/android/browser/AddBookmarkPage;->mRootFolder:J

    .line 1293
    :cond_e
    cmp-long v33, v7, v10

    if-nez v33, :cond_f

    .line 1295
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/android/browser/AddBookmarkPage;->getTitleFromId(J)Ljava/lang/String;

    move-result-object v6

    .line 1296
    .local v6, beforeEditTitle:Ljava/lang/String;
    if-eqz v6, :cond_f

    move-object/from16 v0, v26

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_f

    .line 1298
    const-string v33, "browser/AddBookmarkPage"

    const-string v34, "edit folder save, does not change anything"

    invoke-static/range {v33 .. v34}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1299
    const/16 v33, 0x1

    goto/16 :goto_2

    .line 1304
    .end local v6           #beforeEditTitle:Ljava/lang/String;
    .end local v7           #beforeParentId:J
    .end local v10           #currentParentId:J
    .end local v13           #editId:J
    :cond_f
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v33, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v33

    move-object/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/AddBookmarkPage;->isFolderExist(JLjava/lang/String;)Z

    move-result v20

    .line 1305
    .local v20, isExist:Z
    if-eqz v20, :cond_10

    .line 1306
    invoke-direct/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->displayToastForExistingFolder()V

    .line 1307
    const/16 v33, 0x0

    goto/16 :goto_2

    .line 1312
    :cond_10
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    move/from16 v33, v0

    if-eqz v33, :cond_11

    .line 1313
    const/16 v33, 0x0

    move/from16 v0, v33

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/AddBookmarkPage;->mEditingExisting:Z

    .line 1316
    :cond_11
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingExisting:Z

    move/from16 v33, v0

    if-eqz v33, :cond_14

    .line 1317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v33, v0

    const-string v34, "_id"

    invoke-virtual/range {v33 .. v34}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v33

    invoke-static/range {v33 .. v34}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    .line 1318
    .local v19, id:Ljava/lang/Long;
    new-instance v31, Landroid/content/ContentValues;

    invoke-direct/range {v31 .. v31}, Landroid/content/ContentValues;-><init>()V

    .line 1319
    .restart local v31       #values:Landroid/content/ContentValues;
    const-string v33, "title"

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1320
    const-string v33, "parent"

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/browser/AddBookmarkPage;->mCurrentFolder:J

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1321
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mEditingFolder:Z

    move/from16 v33, v0

    if-nez v33, :cond_12

    .line 1322
    const-string v33, "url"

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1323
    if-nez v30, :cond_12

    .line 1324
    const-string v33, "thumbnail"

    move-object/from16 v0, v31

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1327
    :cond_12
    invoke-virtual/range {v31 .. v31}, Landroid/content/ContentValues;->size()I

    move-result v33

    if-lez v33, :cond_13

    .line 1328
    new-instance v33, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;

    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

    move-result-object v34

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Long;->longValue()J

    move-result-wide v35

    invoke-direct/range {v33 .. v36}, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;-><init>(Landroid/content/Context;J)V

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Landroid/content/ContentValues;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    aput-object v31, v34, v35

    invoke-virtual/range {v33 .. v34}, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1330
    :cond_13
    const/16 v33, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->setResult(I)V

    .line 1375
    .end local v19           #id:Ljava/lang/Long;
    .end local v31           #values:Landroid/content/ContentValues;
    :goto_3
    const/16 v33, 0x1

    goto/16 :goto_2

    .line 1334
    :cond_14
    if-eqz v30, :cond_15

    .line 1335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v33, v0

    const-string v34, "thumbnail"

    invoke-virtual/range {v33 .. v34}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v25

    check-cast v25, Landroid/graphics/Bitmap;

    .line 1337
    .local v25, thumbnail:Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v33, v0

    const-string v34, "favicon"

    invoke-virtual/range {v33 .. v34}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v17

    check-cast v17, Landroid/graphics/Bitmap;

    .line 1344
    .local v17, favicon:Landroid/graphics/Bitmap;
    :goto_4
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    .line 1345
    .local v9, bundle:Landroid/os/Bundle;
    const-string v33, "title"

    move-object/from16 v0, v33

    move-object/from16 v1, v26

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1346
    const-string v33, "url"

    move-object/from16 v0, v33

    move-object/from16 v1, v29

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1347
    const-string v33, "favicon"

    move-object/from16 v0, v33

    move-object/from16 v1, v17

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1349
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/browser/AddBookmarkPage;->mSaveToHomeScreen:Z

    move/from16 v33, v0

    if-eqz v33, :cond_17

    .line 1350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mTouchIconUrl:Ljava/lang/String;

    move-object/from16 v33, v0

    if-eqz v33, :cond_16

    if-eqz v30, :cond_16

    .line 1351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mHandler:Landroid/os/Handler;

    move-object/from16 v33, v0

    const/16 v34, 0x65

    invoke-static/range {v33 .. v34}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v21

    .line 1353
    .local v21, msg:Landroid/os/Message;
    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 1354
    new-instance v18, Lcom/android/browser/DownloadTouchIcon;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mMap:Landroid/os/Bundle;

    move-object/from16 v33, v0

    const-string v34, "user_agent"

    invoke-virtual/range {v33 .. v34}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v21

    move-object/from16 v3, v33

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/DownloadTouchIcon;-><init>(Landroid/content/Context;Landroid/os/Message;Ljava/lang/String;)V

    .line 1356
    .local v18, icon:Lcom/android/browser/DownloadTouchIcon;
    sget-object v33, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mTouchIconUrl:Ljava/lang/String;

    move-object/from16 v36, v0

    aput-object v36, v34, v35

    move-object/from16 v0, v18

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/DownloadTouchIcon;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1372
    .end local v18           #icon:Lcom/android/browser/DownloadTouchIcon;
    .end local v21           #msg:Landroid/os/Message;
    :goto_5
    const/16 v33, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->setResult(I)V

    .line 1373
    const-string v33, "bookmarkview"

    move-object/from16 v0, v29

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lcom/android/browser/LogTag;->logBookmarkAdded(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1340
    .end local v9           #bundle:Landroid/os/Bundle;
    .end local v17           #favicon:Landroid/graphics/Bitmap;
    .end local v25           #thumbnail:Landroid/graphics/Bitmap;
    :cond_15
    const/16 v25, 0x0

    .line 1341
    .restart local v25       #thumbnail:Landroid/graphics/Bitmap;
    const/16 v17, 0x0

    .restart local v17       #favicon:Landroid/graphics/Bitmap;
    goto/16 :goto_4

    .line 1358
    .restart local v9       #bundle:Landroid/os/Bundle;
    :cond_16
    const/16 v33, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, v26

    move-object/from16 v3, v33

    move-object/from16 v4, v17

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/browser/BookmarkUtils;->createAddToHomeIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/content/Intent;

    move-result-object v33

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/browser/AddBookmarkPage;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_5

    .line 1362
    :cond_17
    const-string v33, "thumbnail"

    move-object/from16 v0, v33

    move-object/from16 v1, v25

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1363
    const-string v34, "remove_thumbnail"

    if-nez v30, :cond_18

    const/16 v33, 0x1

    :goto_6
    move-object/from16 v0, v34

    move/from16 v1, v33

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1364
    const-string v33, "touch_icon_url"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mTouchIconUrl:Ljava/lang/String;

    move-object/from16 v34, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-virtual {v9, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/AddBookmarkPage;->mHandler:Landroid/os/Handler;

    move-object/from16 v33, v0

    const/16 v34, 0x64

    invoke-static/range {v33 .. v34}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v21

    .line 1367
    .restart local v21       #msg:Landroid/os/Message;
    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 1369
    new-instance v24, Ljava/lang/Thread;

    new-instance v33, Lcom/android/browser/AddBookmarkPage$SaveBookmarkRunnable;

    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/AddBookmarkPage;->getApplicationContext()Landroid/content/Context;

    move-result-object v34

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    move-object/from16 v2, v34

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/AddBookmarkPage$SaveBookmarkRunnable;-><init>(Lcom/android/browser/AddBookmarkPage;Landroid/content/Context;Landroid/os/Message;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1370
    .local v24, t:Ljava/lang/Thread;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Thread;->start()V

    goto/16 :goto_5

    .line 1363
    .end local v21           #msg:Landroid/os/Message;
    .end local v24           #t:Ljava/lang/Thread;
    :cond_18
    const/16 v33, 0x0

    goto :goto_6
.end method

.method setAccount(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "accountName"
    .parameter "accountType"

    .prologue
    .line 627
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 628
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mAccountAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2, v1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;

    .line 629
    .local v0, account:Lcom/android/browser/AddBookmarkPage$BookmarkAccount;
    iget-object v2, v0, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;->accountName:Ljava/lang/String;

    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;->accountType:Ljava/lang/String;

    invoke-static {v2, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 631
    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage;->mAccountSpinner:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 632
    iget-wide v2, v0, Lcom/android/browser/AddBookmarkPage$BookmarkAccount;->rootFolderId:J

    invoke-direct {p0, v2, v3}, Lcom/android/browser/AddBookmarkPage;->onRootFolderFound(J)V

    .line 636
    .end local v0           #account:Lcom/android/browser/AddBookmarkPage$BookmarkAccount;
    :cond_0
    return-void

    .line 627
    .restart local v0       #account:Lcom/android/browser/AddBookmarkPage$BookmarkAccount;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
