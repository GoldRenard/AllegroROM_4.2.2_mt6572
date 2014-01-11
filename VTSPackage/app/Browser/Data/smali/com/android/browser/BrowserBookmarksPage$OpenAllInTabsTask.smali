.class Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;
.super Landroid/os/AsyncTask;
.source "BrowserBookmarksPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/BrowserBookmarksPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OpenAllInTabsTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field mFolderId:J

.field final synthetic this$0:Lcom/android/browser/BrowserBookmarksPage;


# direct methods
.method public constructor <init>(Lcom/android/browser/BrowserBookmarksPage;J)V
    .locals 0
    .parameter
    .parameter "id"

    .prologue
    .line 580
    iput-object p1, p0, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->this$0:Lcom/android/browser/BrowserBookmarksPage;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 581
    iput-wide p2, p0, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->mFolderId:J

    .line 582
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/database/Cursor;
    .locals 10
    .parameter "params"

    .prologue
    const/4 v5, 0x0

    .line 586
    iget-object v0, p0, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->this$0:Lcom/android/browser/BrowserBookmarksPage;

    invoke-virtual {v0}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v6

    .line 587
    .local v6, c:Landroid/content/Context;
    if-nez v6, :cond_0

    .line 588
    :goto_0
    return-object v5

    :cond_0
    invoke-virtual {v6}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v6}, Lcom/android/browser/BookmarkUtils;->getBookmarksUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/android/browser/BookmarksLoader;->PROJECTION:[Ljava/lang/String;

    const-string v3, "parent=? AND folder ==0"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v7, 0x0

    iget-wide v8, p0, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->mFolderId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 578
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->doInBackground([Ljava/lang/Void;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/database/Cursor;)V
    .locals 6
    .parameter "result"

    .prologue
    .line 596
    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-nez v4, :cond_1

    .line 597
    iget-object v4, p0, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->this$0:Lcom/android/browser/BrowserBookmarksPage;

    invoke-virtual {v4}, Lcom/android/browser/BrowserBookmarksPage;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 598
    .local v0, ctx:Landroid/content/Context;
    const v4, 0x7f0c00a0

    invoke-virtual {v0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 609
    .end local v0           #ctx:Landroid/content/Context;
    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 610
    return-void

    .line 600
    :cond_1
    iget-object v4, p0, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->this$0:Lcom/android/browser/BrowserBookmarksPage;

    iget-object v4, v4, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    if-eqz v4, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-lez v4, :cond_0

    .line 601
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    new-array v3, v4, [Ljava/lang/String;

    .line 602
    .local v3, urls:[Ljava/lang/String;
    const/4 v1, 0x0

    .line 603
    .local v1, i:I
    :goto_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 604
    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .local v2, i:I
    invoke-static {p1}, Lcom/android/browser/BrowserBookmarksPage;->getUrl(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    move v1, v2

    .end local v2           #i:I
    .restart local v1       #i:I
    goto :goto_1

    .line 606
    :cond_2
    iget-object v4, p0, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->this$0:Lcom/android/browser/BrowserBookmarksPage;

    iget-object v4, v4, Lcom/android/browser/BrowserBookmarksPage;->mCallbacks:Lcom/android/browser/BookmarksPageCallbacks;

    invoke-interface {v4, v3}, Lcom/android/browser/BookmarksPageCallbacks;->onOpenInNewWindow([Ljava/lang/String;)Z

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 578
    check-cast p1, Landroid/database/Cursor;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserBookmarksPage$OpenAllInTabsTask;->onPostExecute(Landroid/database/Cursor;)V

    return-void
.end method
