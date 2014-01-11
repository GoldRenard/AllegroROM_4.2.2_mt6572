.class Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;
.super Landroid/os/AsyncTask;
.source "BrowserBookmarksPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/BrowserBookmarksPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LookupBookmarkCount"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Long;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mHeader:Lcom/android/browser/BookmarkItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/browser/BookmarkItem;)V
    .locals 1
    .parameter "context"
    .parameter "header"

    .prologue
    .line 728
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 729
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mContext:Landroid/content/Context;

    .line 730
    iput-object p2, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mHeader:Lcom/android/browser/BookmarkItem;

    .line 731
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Long;)Ljava/lang/Integer;
    .locals 9
    .parameter "params"

    .prologue
    const/4 v2, 0x1

    .line 735
    array-length v0, p1

    if-eq v0, v2, :cond_0

    .line 736
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "Missing folder id!"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 738
    :cond_0
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/browser/BookmarkUtils;->getBookmarksUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    .line 739
    .local v1, uri:Landroid/net/Uri;
    const/4 v6, 0x0

    .line 740
    .local v6, c:Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 742
    .local v7, count:I
    :try_start_0
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x0

    const-string v3, "parent=? AND folder ==0"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v8, 0x0

    aget-object v8, p1, v8

    invoke-virtual {v8}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 745
    if-eqz v6, :cond_1

    .line 746
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 749
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 751
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 749
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 724
    check-cast p1, [Ljava/lang/Long;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->doInBackground([Ljava/lang/Long;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 5
    .parameter "result"

    .prologue
    .line 756
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_1

    .line 757
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mHeader:Lcom/android/browser/BookmarkItem;

    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mContext:Landroid/content/Context;

    const v2, 0x7f0c009f

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BookmarkItem;->setUrl(Ljava/lang/String;)V

    .line 762
    :cond_0
    :goto_0
    return-void

    .line 759
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 760
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mHeader:Lcom/android/browser/BookmarkItem;

    iget-object v1, p0, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->mContext:Landroid/content/Context;

    const v2, 0x7f0c00a0

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BookmarkItem;->setUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 724
    check-cast p1, Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserBookmarksPage$LookupBookmarkCount;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
