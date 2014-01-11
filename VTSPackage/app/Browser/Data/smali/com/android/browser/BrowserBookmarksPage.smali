.class public Lcom/android/browser/BrowserBookmarksPage;
.super Landroid/app/Fragment;
.source "BrowserBookmarksPage.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;
.implements Landroid/app/LoaderManager$LoaderCallbacks;
.implements Lcom/android/browser/BreadCrumbView$Controller;
.implements Landroid/widget/ExpandableListView$OnChildClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/BrowserBookmarksPage$AccountsLoader;,
        Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;,
        Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;,
        Lcom/android/browser/BrowserBookmarksPage$CombinedBookmarksCallbackWrapper;,
        Lcom/android/browser/BrowserBookmarksPage$ExtraDragState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/Fragment;",
        "Landroid/view/View$OnCreateContextMenuListener;",
        "Landroid/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Lcom/android/browser/BreadCrumbView$Controller;",
        "Landroid/widget/ExpandableListView$OnChildClickListener;"
    }
.end annotation


# static fields
.field static final ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field static final ACCOUNT_TYPE:Ljava/lang/String; = "account_type"

.field static final EXTRA_DISABLE_WINDOW:Ljava/lang/String; = "disable_new_window"

.field static final LOADER_ACCOUNTS:I = 0x1

.field static final LOADER_BOOKMARKS:I = 0x64

.field static final LOGTAG:Ljava/lang/String; = "browser"

.field static final PREF_GROUP_STATE:Ljava/lang/String; = "bbp_group_state"

.field public static final VIEW_LIST:I = 0x2

.field public static final VIEW_THUMBNAILS:I = 0x1

.field static sOptions:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Landroid/graphics/BitmapFactory$Options;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mBookmarkAdapters:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/android/browser/BrowserBookmarksAdapter;",
            ">;"
        }
    .end annotation
.end field

.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

.field private mContextItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field mCurrentFolderId:J

.field mDisableNewWindow:Z

.field mEmptyView:Landroid/view/View;

.field mEnableContextMenu:Z

.field mGrid:Lcom/android/browser/view/BookmarkExpandableView;

.field mHeader:Landroid/view/View;

.field mRoot:Landroid/view/View;

.field mState:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 298
    new-instance v0, Lcom/android/browser/BrowserBookmarksPage$1;

    invoke-direct {v0}, Lcom/android/browser/BrowserBookmarksPage$1;-><init>()V

    sput-object v0, Lcom/android/browser/BrowserBookmarksPage;->sOptions:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 77
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mEnableContextMenu:Z

    .line 107
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mBookmarkAdapters:Ljava/util/HashMap;

    .line 109
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mCurrentFolderId:J

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 321
    new-instance v0, Lcom/android/browser/BrowserBookmarksPage$2;

    invoke-direct {v0, p0}, Lcom/android/browser/BrowserBookmarksPage$2;-><init>(Lcom/android/browser/BrowserBookmarksPage;)V

    iput-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mContextItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 765
    return-void
.end method

.method private changeOptionItemSelectedManner(Landroid/view/MenuItem;Landroid/app/Activity;)V
    .locals 7
    .parameter "item"
    .parameter "activity"

    .prologue
    .line 202
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0d00a1

    if-ne v3, v4, :cond_0

    .line 203
    const-string v2, "http://"

    .line 204
    .local v2, url:Ljava/lang/String;
    const-string v1, ""

    .line 206
    .local v1, title:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/android/browser/AddBookmarkPage;

    invoke-direct {v0, p2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 207
    .local v0, intent:Landroid/content/Intent;
    const-string v3, "title"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 208
    const-string v3, "parent"

    iget-wide v4, p0, Lcom/android/browser/BrowserBookmarksPage;->mCurrentFolderId:J

    invoke-virtual {v0, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 209
    const-string v3, "url"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 210
    const-string v3, "browser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CurrentFolderId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lcom/android/browser/BrowserBookmarksPage;->mCurrentFolderId:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    invoke-virtual {p2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 214
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #title:Ljava/lang/String;
    .end local v2           #url:Ljava/lang/String;
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v4, 0x7f0d00a2

    if-ne v3, v4, :cond_1

    .line 215
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/android/browser/AddBookmarkFolderForOP01Menu;

    invoke-direct {v0, p2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 216
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v3, "parent"

    iget-wide v4, p0, Lcom/android/browser/BrowserBookmarksPage;->mCurrentFolderId:J

    invoke-virtual {v0, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 217
    invoke-virtual {p2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 219
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    return-void
.end method

.method private copy(Ljava/lang/CharSequence;)V
    .locals 3
    .parameter "text"

    .prologue
    .line 662
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 664
    .local v0, cm:Landroid/content/ClipboardManager;
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/ClipData;->newRawUri(Ljava/lang/CharSequence;Landroid/net/Uri;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 665
    return-void
.end method

.method static createShortcutIntent(Landroid/content/Context;Landroid/database/Cursor;)Landroid/content/Intent;
    .locals 5
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 529
    const/4 v4, 0x1

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 530
    .local v3, url:Ljava/lang/String;
    const/4 v4, 0x2

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 531
    .local v1, title:Ljava/lang/String;
    const/4 v4, 0x5

    invoke-static {p1, v4}, Lcom/android/browser/BrowserBookmarksPage;->getBitmap(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 532
    .local v2, touchIcon:Landroid/graphics/Bitmap;
    const/4 v4, 0x3

    invoke-static {p1, v4}, Lcom/android/browser/BrowserBookmarksPage;->getBitmap(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 533
    .local v0, favicon:Landroid/graphics/Bitmap;
    invoke-static {p0, v3, v1, v2, v0}, Lcom/android/browser/BookmarkUtils;->createAddToHomeIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/content/Intent;

    move-result-object v4

    return-object v4
.end method

.method private displayRemoveBookmarkDialog(Lcom/android/browser/BrowserBookmarksAdapter;I)V
    .locals 8
    .parameter "adapter"
    .parameter "position"

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 641
    invoke-virtual {p1, p2}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v1

    .line 642
    .local v1, cursor:Landroid/database/Cursor;
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 643
    .local v2, id:J
    const/4 v6, 0x2

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 644
    .local v5, title:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 645
    .local v0, context:Landroid/content/Context;
    const/4 v6, 0x6

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    if-eqz v6, :cond_0

    const/4 v4, 0x1

    .line 646
    .local v4, isFolder:Z
    :cond_0
    if-nez v4, :cond_1

    .line 647
    invoke-static {v2, v3, v5, v0, v7}, Lcom/android/browser/BookmarkUtils;->displayRemoveBookmarkDialog(JLjava/lang/String;Landroid/content/Context;Landroid/os/Message;)V

    .line 651
    :goto_0
    return-void

    .line 649
    :cond_1
    invoke-static {v2, v3, v5, v0, v7}, Lcom/android/browser/BookmarkUtils;->displayRemoveFolderDialog(JLjava/lang/String;Landroid/content/Context;Landroid/os/Message;)V

    goto :goto_0
.end method

.method private editBookmark(Lcom/android/browser/BrowserBookmarksAdapter;I)V
    .locals 9
    .parameter "adapter"
    .parameter "position"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 615
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const-class v7, Lcom/android/browser/AddBookmarkPage;

    invoke-direct {v2, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 616
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {p1, p2}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v0

    .line 617
    .local v0, cursor:Landroid/database/Cursor;
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 618
    .local v3, item:Landroid/os/Bundle;
    const-string v6, "title"

    const/4 v7, 0x2

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    const-string v6, "url"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    const/4 v6, 0x3

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    .line 623
    .local v1, data:[B
    if-eqz v1, :cond_0

    .line 624
    const-string v6, "favicon"

    array-length v7, v1

    invoke-static {v1, v5, v7}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 627
    :cond_0
    const-string v6, "_id"

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-virtual {v3, v6, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 629
    const-string v6, "parent"

    const/16 v7, 0x8

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-virtual {v3, v6, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 631
    const-string v6, "bookmark"

    invoke-virtual {v2, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 632
    const-string v6, "is_folder"

    const/4 v7, 0x6

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    if-ne v7, v4, :cond_1

    :goto_0
    invoke-virtual {v2, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 634
    invoke-virtual {p0, v2}, Lcom/android/browser/BrowserBookmarksPage;->startActivity(Landroid/content/Intent;)V

    .line 635
    return-void

    :cond_1
    move v4, v5

    .line 632
    goto :goto_0
.end method

.method static getBitmap(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "cursor"
    .parameter "columnIndex"

    .prologue
    .line 295
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/browser/BrowserBookmarksPage;->getBitmap(Landroid/database/Cursor;ILandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static getBitmap(Landroid/database/Cursor;ILandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "cursor"
    .parameter "columnIndex"
    .parameter "inBitmap"

    .prologue
    const/4 v5, 0x0

    .line 305
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    .line 306
    .local v0, data:[B
    if-nez v0, :cond_0

    .line 307
    const/4 v3, 0x0

    .line 317
    :goto_0
    return-object v3

    .line 309
    :cond_0
    sget-object v3, Lcom/android/browser/BrowserBookmarksPage;->sOptions:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/BitmapFactory$Options;

    .line 310
    .local v2, opts:Landroid/graphics/BitmapFactory$Options;
    iput-object p2, v2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 311
    const/4 v3, 0x1

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 312
    iput-boolean v5, v2, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 314
    const/4 v3, 0x0

    :try_start_0
    array-length v4, v0

    invoke-static {v0, v3, v4, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 315
    :catch_0
    move-exception v1

    .line 317
    .local v1, ex:Ljava/lang/IllegalArgumentException;
    array-length v3, v0

    invoke-static {v0, v5, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_0
.end method

.method private getBreadCrumbs(I)Lcom/android/browser/BreadCrumbView;
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 485
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {v0, p1}, Lcom/android/browser/view/BookmarkExpandableView;->getBreadCrumbs(I)Lcom/android/browser/BreadCrumbView;

    move-result-object v0

    return-object v0
.end method

.method private getChildAdapter(I)Lcom/android/browser/BrowserBookmarksAdapter;
    .locals 1
    .parameter "groupPosition"

    .prologue
    .line 481
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {v0, p1}, Lcom/android/browser/view/BookmarkExpandableView;->getChildAdapter(I)Lcom/android/browser/BrowserBookmarksAdapter;

    move-result-object v0

    return-object v0
.end method

.method static getUrl(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1
    .parameter "c"

    .prologue
    .line 658
    const/4 v0, 0x1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUrl(Lcom/android/browser/BrowserBookmarksAdapter;I)Ljava/lang/String;
    .locals 1
    .parameter "adapter"
    .parameter "position"

    .prologue
    .line 654
    invoke-virtual {p1, p2}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v0

    invoke-static {v0}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private loadFolder(ILandroid/net/Uri;)V
    .locals 3
    .parameter "groupPosition"
    .parameter "uri"

    .prologue
    .line 700
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    .line 702
    .local v1, manager:Landroid/app/LoaderManager;
    add-int/lit8 v2, p1, 0x64

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    check-cast v0, Lcom/android/browser/BookmarksLoader;

    .line 704
    .local v0, loader:Lcom/android/browser/BookmarksLoader;
    invoke-virtual {v0, p2}, Lcom/android/browser/BookmarksLoader;->setUri(Landroid/net/Uri;)V

    .line 705
    invoke-virtual {v0}, Lcom/android/browser/BookmarksLoader;->forceLoad()V

    .line 706
    return-void
.end method

.method private loadUrl(Lcom/android/browser/BrowserBookmarksAdapter;I)V
    .locals 5
    .parameter "adapter"
    .parameter "position"

    .prologue
    .line 537
    iget-object v2, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    .line 539
    invoke-virtual {p1, p2}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v2

    invoke-static {v2}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    .line 540
    .local v1, url:Ljava/lang/String;
    const-string v2, "rtsp://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 541
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 542
    .local v0, i:Landroid/content/Intent;
    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 543
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 544
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 552
    .end local v0           #i:Landroid/content/Intent;
    .end local v1           #url:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 548
    .restart local v1       #url:Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    invoke-virtual {p1, p2}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Lcom/android/browser/BookmarksPageCallbacks;->onBookmarkSelected(Landroid/database/Cursor;Z)Z

    goto :goto_0
.end method

.method private openInNewWindow(Lcom/android/browser/BrowserBookmarksAdapter;I)V
    .locals 10
    .parameter "adapter"
    .parameter "position"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 555
    iget-object v8, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    if-eqz v8, :cond_0

    .line 556
    invoke-virtual {p1, p2}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v0

    .line 557
    .local v0, c:Landroid/database/Cursor;
    const/4 v8, 0x6

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    if-ne v8, v6, :cond_1

    move v4, v6

    .line 558
    .local v4, isFolder:Z
    :goto_0
    if-eqz v4, :cond_2

    .line 559
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 560
    .local v2, id:J
    new-instance v6, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;

    invoke-direct {v6, p0, v2, v3}, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;-><init>(Lcom/android/browser/BrowserBookmarksPage;J)V

    new-array v7, v7, [Ljava/lang/Void;

    invoke-virtual {v6, v7}, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 576
    .end local v0           #c:Landroid/database/Cursor;
    .end local v2           #id:J
    .end local v4           #isFolder:Z
    :cond_0
    :goto_1
    return-void

    .restart local v0       #c:Landroid/database/Cursor;
    :cond_1
    move v4, v7

    .line 557
    goto :goto_0

    .line 562
    .restart local v4       #isFolder:Z
    :cond_2
    invoke-static {v0}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v5

    .line 564
    .local v5, url:Ljava/lang/String;
    const-string v8, "rtsp://"

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 565
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 566
    .local v1, i:Landroid/content/Intent;
    const-string v6, "android.intent.action.VIEW"

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 567
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 568
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 572
    .end local v1           #i:Landroid/content/Intent;
    :cond_3
    iget-object v8, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    new-array v6, v6, [Ljava/lang/String;

    invoke-static {v0}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v7

    invoke-interface {v8, v6}, Lcom/android/browser/BookmarksPageCallbacks;->onOpenInNewWindow([Ljava/lang/String;)Z

    goto :goto_1
.end method

.method private populateBookmarkItem(Landroid/database/Cursor;Lcom/android/browser/BookmarkItem;Z)V
    .locals 7
    .parameter "cursor"
    .parameter "item"
    .parameter "isFolder"

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 369
    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/android/browser/BookmarkItem;->setName(Ljava/lang/String;)V

    .line 370
    if-eqz p3, :cond_0

    .line 371
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Lcom/android/browser/BookmarkItem;->setUrl(Ljava/lang/String;)V

    .line 372
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f02002e

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 374
    .local v0, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v0}, Lcom/android/browser/BookmarkItem;->setFavicon(Landroid/graphics/Bitmap;)V

    .line 375
    new-instance v2, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;

    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, p2}, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;-><init>(Landroid/content/Context;Lcom/android/browser/BookmarkItem;)V

    new-array v3, v4, [Ljava/lang/Long;

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v2, v3}, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 383
    :goto_0
    return-void

    .line 378
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    :cond_0
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 379
    .local v1, url:Ljava/lang/String;
    invoke-virtual {p2, v1}, Lcom/android/browser/BookmarkItem;->setUrl(Ljava/lang/String;)V

    .line 380
    const/4 v2, 0x3

    invoke-static {p1, v2}, Lcom/android/browser/BrowserBookmarksPage;->getBitmap(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 381
    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v0}, Lcom/android/browser/BookmarkItem;->setFavicon(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method


# virtual methods
.method canEdit(Landroid/database/Cursor;)Z
    .locals 3
    .parameter "c"

    .prologue
    const/4 v1, 0x1

    .line 363
    const/16 v2, 0x9

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 364
    .local v0, type:I
    if-eq v0, v1, :cond_0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public handleContextItem(III)Z
    .locals 11
    .parameter "itemId"
    .parameter "groupPosition"
    .parameter "childPosition"

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 240
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 241
    .local v0, activity:Landroid/app/Activity;
    invoke-direct {p0, p2}, Lcom/android/browser/BrowserBookmarksPage;->getChildAdapter(I)Lcom/android/browser/BrowserBookmarksAdapter;

    move-result-object v1

    .line 243
    .local v1, adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    sparse-switch p1, :sswitch_data_0

    .line 289
    const/4 v6, 0x0

    .line 291
    :goto_0
    return v6

    .line 245
    :sswitch_0
    invoke-direct {p0, v1, p3}, Lcom/android/browser/BrowserBookmarksPage;->loadUrl(Lcom/android/browser/BrowserBookmarksAdapter;I)V

    goto :goto_0

    .line 248
    :sswitch_1
    invoke-direct {p0, v1, p3}, Lcom/android/browser/BrowserBookmarksPage;->editBookmark(Lcom/android/browser/BrowserBookmarksAdapter;I)V

    goto :goto_0

    .line 251
    :sswitch_2
    invoke-virtual {v1, p3}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v2

    .line 252
    .local v2, c:Landroid/database/Cursor;
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7, v2}, Lcom/android/browser/BrowserBookmarksPage;->createShortcutIntent(Landroid/content/Context;Landroid/database/Cursor;)Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 255
    .end local v2           #c:Landroid/database/Cursor;
    :sswitch_3
    invoke-direct {p0, v1, p3}, Lcom/android/browser/BrowserBookmarksPage;->displayRemoveBookmarkDialog(Lcom/android/browser/BrowserBookmarksAdapter;I)V

    goto :goto_0

    .line 258
    :sswitch_4
    invoke-direct {p0, v1, p3}, Lcom/android/browser/BrowserBookmarksPage;->openInNewWindow(Lcom/android/browser/BrowserBookmarksAdapter;I)V

    goto :goto_0

    .line 261
    :sswitch_5
    invoke-virtual {v1, p3}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v3

    .line 262
    .local v3, cursor:Landroid/database/Cursor;
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-static {v3, v9}, Lcom/android/browser/BrowserBookmarksPage;->getBitmap(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v9

    const/4 v10, 0x4

    invoke-static {v3, v10}, Lcom/android/browser/BrowserBookmarksPage;->getBitmap(Landroid/database/Cursor;I)Landroid/graphics/Bitmap;

    move-result-object v10

    invoke-static {v0, v7, v8, v9, v10}, Lcom/android/browser/Controller;->sharePage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 270
    .end local v3           #cursor:Landroid/database/Cursor;
    :sswitch_6
    invoke-direct {p0, v1, p3}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Lcom/android/browser/BrowserBookmarksAdapter;I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/browser/BrowserBookmarksPage;->copy(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 273
    :sswitch_7
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v7

    invoke-direct {p0, v1, p3}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Lcom/android/browser/BrowserBookmarksAdapter;I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/browser/BrowserSettings;->setHomePage(Ljava/lang/String;)V

    .line 274
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v7

    const-string v8, "other"

    invoke-virtual {v7, v8}, Lcom/android/browser/BrowserSettings;->setHomePagePicker(Ljava/lang/String;)V

    .line 275
    const v7, 0x7f0c0088

    invoke-static {v0, v7, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 280
    :sswitch_8
    invoke-virtual {v1, p3}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v3

    .line 281
    .restart local v3       #cursor:Landroid/database/Cursor;
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 282
    .local v4, name:Ljava/lang/String;
    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 285
    .local v5, url:Ljava/lang/String;
    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-static {v0, v7, v5, v4}, Lcom/android/browser/Bookmarks;->removeFromBookmarks(Landroid/content/Context;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 243
    :sswitch_data_0
    .sparse-switch
        0x7f0d0021 -> :sswitch_0
        0x7f0d0022 -> :sswitch_4
        0x7f0d00a4 -> :sswitch_1
        0x7f0d00a5 -> :sswitch_2
        0x7f0d00a6 -> :sswitch_5
        0x7f0d00a7 -> :sswitch_6
        0x7f0d00a8 -> :sswitch_3
        0x7f0d00a9 -> :sswitch_7
        0x7f0d00f4 -> :sswitch_8
    .end sparse-switch
.end method

.method public onChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .locals 13
    .parameter "parent"
    .parameter "v"
    .parameter "groupPosition"
    .parameter "childPosition"
    .parameter "id"

    .prologue
    .line 491
    move/from16 v0, p3

    invoke-direct {p0, v0}, Lcom/android/browser/BrowserBookmarksPage;->getChildAdapter(I)Lcom/android/browser/BrowserBookmarksAdapter;

    move-result-object v2

    .line 492
    .local v2, adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    move/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v4

    .line 493
    .local v4, cursor:Landroid/database/Cursor;
    const/4 v11, 0x6

    invoke-interface {v4, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    if-eqz v11, :cond_0

    const/4 v7, 0x1

    .line 496
    .local v7, isFolder:Z
    :goto_0
    invoke-static {v4}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v10

    .line 498
    .local v10, url:Ljava/lang/String;
    if-eqz v10, :cond_1

    const-string v11, "rtsp://"

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    iget-object v11, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    if-eqz v11, :cond_1

    .line 499
    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 500
    .local v6, i:Landroid/content/Intent;
    const-string v11, "android.intent.action.VIEW"

    invoke-virtual {v6, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 501
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v6, v11}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 502
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v11

    invoke-virtual {v11, v6}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 503
    const/4 v11, 0x1

    .line 525
    .end local v6           #i:Landroid/content/Intent;
    :goto_1
    return v11

    .line 493
    .end local v7           #isFolder:Z
    .end local v10           #url:Ljava/lang/String;
    :cond_0
    const/4 v7, 0x0

    goto :goto_0

    .line 506
    .restart local v7       #isFolder:Z
    .restart local v10       #url:Ljava/lang/String;
    :cond_1
    iget-object v11, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    if-eqz v11, :cond_2

    iget-object v11, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    invoke-interface {v11, v4, v7}, Lcom/android/browser/BookmarksPageCallbacks;->onBookmarkSelected(Landroid/database/Cursor;Z)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 508
    const/4 v11, 0x1

    goto :goto_1

    .line 511
    :cond_2
    if-eqz v7, :cond_4

    .line 512
    const/4 v11, 0x2

    invoke-interface {v4, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 513
    .local v8, title:Ljava/lang/String;
    sget-object v11, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI_DEFAULT_FOLDER:Landroid/net/Uri;

    move-wide/from16 v0, p5

    invoke-static {v11, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v9

    .line 515
    .local v9, uri:Landroid/net/Uri;
    move/from16 v0, p3

    invoke-direct {p0, v0}, Lcom/android/browser/BrowserBookmarksPage;->getBreadCrumbs(I)Lcom/android/browser/BreadCrumbView;

    move-result-object v3

    .line 516
    .local v3, crumbs:Lcom/android/browser/BreadCrumbView;
    if-eqz v3, :cond_3

    .line 518
    invoke-virtual {v3, v8, v9}, Lcom/android/browser/BreadCrumbView;->pushView(Ljava/lang/String;Ljava/lang/Object;)Landroid/view/View;

    .line 519
    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Lcom/android/browser/BreadCrumbView;->setVisibility(I)V

    .line 520
    invoke-virtual {v3}, Lcom/android/browser/BreadCrumbView;->getTopData()Ljava/lang/Object;

    move-result-object v5

    .line 521
    .local v5, data:Ljava/lang/Object;
    if-eqz v5, :cond_5

    check-cast v5, Landroid/net/Uri;

    .end local v5           #data:Ljava/lang/Object;
    invoke-static {v5}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v11

    :goto_2
    iput-wide v11, p0, Lcom/android/browser/BrowserBookmarksPage;->mCurrentFolderId:J

    .line 523
    :cond_3
    move/from16 v0, p3

    invoke-direct {p0, v0, v9}, Lcom/android/browser/BrowserBookmarksPage;->loadFolder(ILandroid/net/Uri;)V

    .line 525
    .end local v3           #crumbs:Lcom/android/browser/BreadCrumbView;
    .end local v8           #title:Ljava/lang/String;
    .end local v9           #uri:Landroid/net/Uri;
    :cond_4
    const/4 v11, 0x1

    goto :goto_1

    .line 521
    .restart local v3       #crumbs:Lcom/android/browser/BreadCrumbView;
    .restart local v5       #data:Ljava/lang/Object;
    .restart local v8       #title:Ljava/lang/String;
    .restart local v9       #uri:Landroid/net/Uri;
    :cond_5
    const-wide/16 v11, -0x1

    goto :goto_2
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 5
    .parameter "newConfig"

    .prologue
    const/4 v4, 0x0

    .line 669
    invoke-super {p0, p1}, Landroid/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 670
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 671
    .local v1, res:Landroid/content/res/Resources;
    iget-object v2, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    const v3, 0x7f040009

    invoke-virtual {v2, v3}, Lcom/android/browser/view/BookmarkExpandableView;->setColumnWidthFromLayout(I)V

    .line 672
    const v2, 0x7f0b0026

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v0, v2

    .line 673
    .local v0, paddingTop:I
    iget-object v2, p0, Lcom/android/browser/BrowserBookmarksPage;->mRoot:Landroid/view/View;

    invoke-virtual {v2, v4, v0, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 674
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 675
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    const/4 v1, 0x0

    .line 223
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v2

    instance-of v2, v2, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;

    if-nez v2, :cond_1

    .line 235
    :cond_0
    :goto_0
    return v1

    .line 226
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;

    .line 228
    .local v0, i:Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;
    if-eqz v0, :cond_0

    .line 232
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    iget v2, v0, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;->groupPosition:I

    iget v3, v0, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;->childPosition:I

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/browser/BrowserBookmarksPage;->handleContextItem(III)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 233
    const/4 v1, 0x1

    goto :goto_0

    .line 235
    :cond_2
    invoke-super {p0, p1}, Landroid/app/Fragment;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "icicle"

    .prologue
    const/4 v3, 0x0

    .line 390
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 391
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/browser/BrowserSettings;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    .line 393
    .local v2, prefs:Landroid/content/SharedPreferences;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    const-string v5, "bbp_group_state"

    const-string v6, "{}"

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/android/browser/BrowserBookmarksPage;->mState:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 399
    :goto_0
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 400
    .local v0, args:Landroid/os/Bundle;
    if-nez v0, :cond_1

    :goto_1
    iput-boolean v3, p0, Lcom/android/browser/BrowserBookmarksPage;->mDisableNewWindow:Z

    .line 401
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/android/browser/BrowserBookmarksPage;->setHasOptionsMenu(Z)V

    .line 402
    iget-object v3, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    if-nez v3, :cond_0

    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v3

    instance-of v3, v3, Lcom/android/browser/CombinedBookmarksCallbacks;

    if-eqz v3, :cond_0

    .line 403
    new-instance v4, Lcom/android/browser/BrowserBookmarksPage$CombinedBookmarksCallbackWrapper;

    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v3

    check-cast v3, Lcom/android/browser/CombinedBookmarksCallbacks;

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Lcom/android/browser/BrowserBookmarksPage$CombinedBookmarksCallbackWrapper;-><init>(Lcom/android/browser/CombinedBookmarksCallbacks;Lcom/android/browser/BrowserBookmarksPage$1;)V

    iput-object v4, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    .line 406
    :cond_0
    return-void

    .line 394
    .end local v0           #args:Landroid/os/Bundle;
    :catch_0
    move-exception v1

    .line 396
    .local v1, e:Lorg/json/JSONException;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "bbp_group_state"

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 397
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    iput-object v4, p0, Lcom/android/browser/BrowserBookmarksPage;->mState:Lorg/json/JSONObject;

    goto :goto_0

    .line 400
    .end local v1           #e:Lorg/json/JSONException;
    .restart local v0       #args:Landroid/os/Bundle;
    :cond_1
    const-string v4, "disable_new_window"

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    goto :goto_1
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 12
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 331
    move-object v7, p3

    check-cast v7, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;

    .line 332
    .local v7, info:Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;
    iget v11, v7, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;->groupPosition:I

    invoke-direct {p0, v11}, Lcom/android/browser/BrowserBookmarksPage;->getChildAdapter(I)Lcom/android/browser/BrowserBookmarksAdapter;

    move-result-object v1

    .line 333
    .local v1, adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    iget v11, v7, Lcom/android/browser/view/BookmarkExpandableView$BookmarkContextMenuInfo;->childPosition:I

    invoke-virtual {v1, v11}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v3

    .line 334
    .local v3, cursor:Landroid/database/Cursor;
    invoke-virtual {p0, v3}, Lcom/android/browser/BrowserBookmarksPage;->canEdit(Landroid/database/Cursor;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 360
    :cond_0
    return-void

    .line 337
    :cond_1
    const/4 v11, 0x6

    invoke-interface {v3, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    if-eqz v11, :cond_3

    move v8, v9

    .line 340
    .local v8, isFolder:Z
    :goto_0
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 341
    .local v0, activity:Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v6

    .line 342
    .local v6, inflater:Landroid/view/MenuInflater;
    const v11, 0x7f100002

    invoke-virtual {v6, v11, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 343
    if-eqz v8, :cond_4

    .line 344
    const v10, 0x7f0d00aa

    invoke-interface {p1, v10, v9}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 351
    :cond_2
    :goto_1
    new-instance v4, Lcom/android/browser/BookmarkItem;

    invoke-direct {v4, v0}, Lcom/android/browser/BookmarkItem;-><init>(Landroid/content/Context;)V

    .line 352
    .local v4, header:Lcom/android/browser/BookmarkItem;
    invoke-virtual {v4, v9}, Lcom/android/browser/BookmarkItem;->setEnableScrolling(Z)V

    .line 353
    invoke-direct {p0, v3, v4, v8}, Lcom/android/browser/BrowserBookmarksPage;->populateBookmarkItem(Landroid/database/Cursor;Lcom/android/browser/BookmarkItem;Z)V

    .line 354
    invoke-interface {p1, v4}, Landroid/view/ContextMenu;->setHeaderView(Landroid/view/View;)Landroid/view/ContextMenu;

    .line 356
    invoke-interface {p1}, Landroid/view/ContextMenu;->size()I

    move-result v2

    .line 357
    .local v2, count:I
    const/4 v5, 0x0

    .local v5, i:I
    :goto_2
    if-ge v5, v2, :cond_0

    .line 358
    invoke-interface {p1, v5}, Landroid/view/ContextMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v9

    iget-object v10, p0, Lcom/android/browser/BrowserBookmarksPage;->mContextItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v9, v10}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 357
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .end local v0           #activity:Landroid/app/Activity;
    .end local v2           #count:I
    .end local v4           #header:Lcom/android/browser/BookmarkItem;
    .end local v5           #i:I
    .end local v6           #inflater:Landroid/view/MenuInflater;
    .end local v8           #isFolder:Z
    :cond_3
    move v8, v10

    .line 337
    goto :goto_0

    .line 346
    .restart local v0       #activity:Landroid/app/Activity;
    .restart local v6       #inflater:Landroid/view/MenuInflater;
    .restart local v8       #isFolder:Z
    :cond_4
    const v11, 0x7f0d00a3

    invoke-interface {p1, v11, v9}, Landroid/view/ContextMenu;->setGroupVisible(IZ)V

    .line 347
    iget-boolean v11, p0, Lcom/android/browser/BrowserBookmarksPage;->mDisableNewWindow:Z

    if-eqz v11, :cond_2

    .line 348
    const v11, 0x7f0d0022

    invoke-interface {p1, v11}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v11

    invoke-interface {v11, v10}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_1
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 6
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
    .line 112
    const/4 v3, 0x1

    if-ne p1, v3, :cond_0

    .line 113
    new-instance v2, Lcom/android/browser/BrowserBookmarksPage$AccountsLoader;

    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/browser/BrowserBookmarksPage$AccountsLoader;-><init>(Landroid/content/Context;)V

    .line 119
    :goto_0
    return-object v2

    .line 114
    :cond_0
    const/16 v3, 0x64

    if-lt p1, v3, :cond_1

    .line 115
    const-string v3, "account_type"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, accountType:Ljava/lang/String;
    const-string v3, "account_name"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, accountName:Ljava/lang/String;
    new-instance v2, Lcom/android/browser/BookmarksLoader;

    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, v1, v0}, Lcom/android/browser/BookmarksLoader;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .local v2, bl:Lcom/android/browser/BookmarksLoader;
    goto :goto_0

    .line 121
    .end local v0           #accountName:Ljava/lang/String;
    .end local v1           #accountType:Ljava/lang/String;
    .end local v2           #bl:Lcom/android/browser/BookmarksLoader;
    :cond_1
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown loader id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 181
    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 183
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 184
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v0, p1, p2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldCreateBookmarksOptionMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    const v0, 0x7f100001

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 188
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 451
    const v1, 0x7f04000a

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mRoot:Landroid/view/View;

    .line 452
    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mRoot:Landroid/view/View;

    const v2, 0x1020004

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mEmptyView:Landroid/view/View;

    .line 454
    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mRoot:Landroid/view/View;

    const v2, 0x7f0d0020

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/browser/view/BookmarkExpandableView;

    iput-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    .line 455
    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {v1, p0}, Lcom/android/browser/view/BookmarkExpandableView;->setOnChildClickListener(Landroid/widget/ExpandableListView$OnChildClickListener;)V

    .line 456
    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    const v2, 0x7f040009

    invoke-virtual {v1, v2}, Lcom/android/browser/view/BookmarkExpandableView;->setColumnWidthFromLayout(I)V

    .line 457
    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {v1, p0}, Lcom/android/browser/view/BookmarkExpandableView;->setBreadcrumbController(Lcom/android/browser/BreadCrumbView$Controller;)V

    .line 458
    iget-boolean v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mEnableContextMenu:Z

    invoke-virtual {p0, v1}, Lcom/android/browser/BrowserBookmarksPage;->setEnableContextMenu(Z)V

    .line 461
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    .line 462
    .local v0, lm:Landroid/app/LoaderManager;
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 464
    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mRoot:Landroid/view/View;

    return-object v1
.end method

.method public onDestroyView()V
    .locals 5

    .prologue
    .line 469
    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    .line 470
    iget-object v3, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/android/browser/view/BookmarkExpandableView;->setBreadcrumbController(Lcom/android/browser/BreadCrumbView$Controller;)V

    .line 471
    iget-object v3, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {v3}, Lcom/android/browser/view/BookmarkExpandableView;->clearAccounts()V

    .line 472
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v2

    .line 473
    .local v2, lm:Landroid/app/LoaderManager;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/LoaderManager;->destroyLoader(I)V

    .line 474
    iget-object v3, p0, Lcom/android/browser/BrowserBookmarksPage;->mBookmarkAdapters:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 475
    .local v1, id:I
    invoke-virtual {v2, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    goto :goto_0

    .line 477
    .end local v1           #id:I
    :cond_0
    iget-object v3, p0, Lcom/android/browser/BrowserBookmarksPage;->mBookmarkAdapters:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 478
    return-void
.end method

.method public onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V
    .locals 13
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
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    const/16 v9, 0x8

    const/4 v8, 0x0

    const/4 v12, 0x1

    .line 128
    const/4 v4, 0x0

    .line 129
    .local v4, empty:Z
    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v10

    if-nez v10, :cond_0

    .line 130
    const/4 v4, 0x1

    .line 132
    :cond_0
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v10

    if-ne v10, v12, :cond_4

    .line 133
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v7

    .line 134
    .local v7, lm:Landroid/app/LoaderManager;
    const/16 v6, 0x64

    .line 135
    .local v6, id:I
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 136
    invoke-interface {p2, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, accountName:Ljava/lang/String;
    invoke-interface {p2, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 138
    .local v1, accountType:Ljava/lang/String;
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 139
    .local v3, args:Landroid/os/Bundle;
    const-string v10, "account_name"

    invoke-virtual {v3, v10, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    const-string v10, "account_type"

    invoke-virtual {v3, v10, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    new-instance v2, Lcom/android/browser/BrowserBookmarksAdapter;

    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v2, v10, v12}, Lcom/android/browser/BrowserBookmarksAdapter;-><init>(Landroid/content/Context;I)V

    .line 143
    .local v2, adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    iget-object v10, p0, Lcom/android/browser/BrowserBookmarksPage;->mBookmarkAdapters:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    const/4 v5, 0x1

    .line 146
    .local v5, expand:Z
    :try_start_0
    iget-object v11, p0, Lcom/android/browser/BrowserBookmarksPage;->mState:Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    move-object v10, v0

    :goto_1
    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 149
    :goto_2
    iget-object v10, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {v10, v0, v2, v5}, Lcom/android/browser/view/BookmarkExpandableView;->addAccount(Ljava/lang/String;Lcom/android/browser/BrowserBookmarksAdapter;Z)V

    .line 150
    invoke-virtual {v7, v6, v3, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    .line 151
    add-int/lit8 v6, v6, 0x1

    .line 152
    goto :goto_0

    .line 146
    :cond_1
    :try_start_1
    const-string v10, "local"
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 160
    .end local v0           #accountName:Ljava/lang/String;
    .end local v1           #accountType:Ljava/lang/String;
    .end local v2           #adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    .end local v3           #args:Landroid/os/Bundle;
    .end local v5           #expand:Z
    :cond_2
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v10

    invoke-virtual {v10, v12}, Landroid/app/LoaderManager;->destroyLoader(I)V

    .line 169
    .end local v6           #id:I
    .end local v7           #lm:Landroid/app/LoaderManager;
    :cond_3
    :goto_3
    iget-object v10, p0, Lcom/android/browser/BrowserBookmarksPage;->mEmptyView:Landroid/view/View;

    if-eqz v4, :cond_5

    :goto_4
    invoke-virtual {v10, v8}, Landroid/view/View;->setVisibility(I)V

    .line 170
    return-void

    .line 161
    :cond_4
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v10

    const/16 v11, 0x64

    if-lt v10, v11, :cond_3

    .line 162
    iget-object v10, p0, Lcom/android/browser/BrowserBookmarksPage;->mBookmarkAdapters:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/BrowserBookmarksAdapter;

    .line 163
    .restart local v2       #adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    invoke-virtual {v2, p2}, Lcom/android/browser/BrowserBookmarksAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 164
    invoke-virtual {v2}, Lcom/android/browser/BrowserBookmarksAdapter;->getCount()I

    move-result v10

    if-eqz v10, :cond_3

    .line 165
    invoke-virtual {v2, v8}, Lcom/android/browser/BrowserBookmarksAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v10

    invoke-interface {v10, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    iput-wide v10, p0, Lcom/android/browser/BrowserBookmarksPage;->mCurrentFolderId:J

    goto :goto_3

    .end local v2           #adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    :cond_5
    move v8, v9

    .line 169
    goto :goto_4

    .line 148
    .restart local v0       #accountName:Ljava/lang/String;
    .restart local v1       #accountType:Ljava/lang/String;
    .restart local v2       #adapter:Lcom/android/browser/BrowserBookmarksAdapter;
    .restart local v3       #args:Landroid/os/Bundle;
    .restart local v5       #expand:Z
    .restart local v6       #id:I
    .restart local v7       #lm:Landroid/app/LoaderManager;
    :catch_0
    move-exception v10

    goto :goto_2
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/browser/BrowserBookmarksPage;->onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0
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
    .line 174
    .local p1, loader:Landroid/content/Loader;,"Landroid/content/Loader<Landroid/database/Cursor;>;"
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 194
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v0}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldChangeBookmarkMenuManner()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {p0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/android/browser/BrowserBookmarksPage;->changeOptionItemSelectedManner(Landroid/view/MenuItem;Landroid/app/Activity;)V

    .line 198
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onPause()V
    .locals 4

    .prologue
    .line 410
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 412
    :try_start_0
    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {v1}, Lcom/android/browser/view/BookmarkExpandableView;->saveGroupState()Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/BrowserBookmarksPage;->mState:Lorg/json/JSONObject;

    .line 414
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 415
    .local v0, prefs:Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "bbp_group_state"

    iget-object v3, p0, Lcom/android/browser/BrowserBookmarksPage;->mState:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 421
    .end local v0           #prefs:Landroid/content/SharedPreferences;
    :goto_0
    return-void

    .line 418
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onTop(Lcom/android/browser/BreadCrumbView;ILjava/lang/Object;)V
    .locals 3
    .parameter "view"
    .parameter "level"
    .parameter "data"

    .prologue
    .line 682
    const/high16 v2, 0x7f0d

    invoke-virtual {p1, v2}, Lcom/android/browser/BreadCrumbView;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .local v0, groupPosition:I
    move-object v1, p3

    .line 683
    check-cast v1, Landroid/net/Uri;

    .line 684
    .local v1, uri:Landroid/net/Uri;
    if-nez v1, :cond_0

    .line 686
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI_DEFAULT_FOLDER:Landroid/net/Uri;

    .line 688
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/android/browser/BrowserBookmarksPage;->loadFolder(ILandroid/net/Uri;)V

    .line 689
    const/4 v2, 0x1

    if-gt p2, v2, :cond_1

    .line 690
    const/16 v2, 0x8

    invoke-virtual {p1, v2}, Lcom/android/browser/BreadCrumbView;->setVisibility(I)V

    .line 694
    :goto_0
    return-void

    .line 692
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lcom/android/browser/BreadCrumbView;->setVisibility(I)V

    goto :goto_0
.end method

.method public setCallbackListener(Lcom/android/browser/BookmarksPageCallbacks;)V
    .locals 0
    .parameter "callbackListener"

    .prologue
    .line 709
    iput-object p1, p0, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    .line 710
    return-void
.end method

.method public setEnableContextMenu(Z)V
    .locals 2
    .parameter "enable"

    .prologue
    .line 713
    iput-boolean p1, p0, Lcom/android/browser/BrowserBookmarksPage;->mEnableContextMenu:Z

    .line 714
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    if-eqz v0, :cond_0

    .line 715
    iget-boolean v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mEnableContextMenu:Z

    if-eqz v0, :cond_1

    .line 716
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {p0, v0}, Lcom/android/browser/BrowserBookmarksPage;->registerForContextMenu(Landroid/view/View;)V

    .line 722
    :cond_0
    :goto_0
    return-void

    .line 718
    :cond_1
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    invoke-virtual {p0, v0}, Lcom/android/browser/BrowserBookmarksPage;->unregisterForContextMenu(Landroid/view/View;)V

    .line 719
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage;->mGrid:Lcom/android/browser/view/BookmarkExpandableView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/browser/view/BookmarkExpandableView;->setLongClickable(Z)V

    goto :goto_0
.end method
