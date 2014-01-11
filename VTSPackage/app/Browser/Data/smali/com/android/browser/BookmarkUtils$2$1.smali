.class Lcom/android/browser/BookmarkUtils$2$1;
.super Ljava/lang/Object;
.source "BookmarkUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/BookmarkUtils$2;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BookmarkUtils$2;


# direct methods
.method constructor <init>(Lcom/android/browser/BookmarkUtils$2;)V
    .locals 0
    .parameter

    .prologue
    .line 285
    iput-object p1, p0, Lcom/android/browser/BookmarkUtils$2$1;->this$0:Lcom/android/browser/BookmarkUtils$2;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private deleteBookmarkById(J)V
    .locals 4
    .parameter "id"

    .prologue
    const/4 v3, 0x0

    .line 309
    iget-object v2, p0, Lcom/android/browser/BookmarkUtils$2$1;->this$0:Lcom/android/browser/BookmarkUtils$2;

    iget-object v2, v2, Lcom/android/browser/BookmarkUtils$2;->val$context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 310
    .local v0, cResolver:Landroid/content/ContentResolver;
    sget-object v2, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 313
    .local v1, uri:Landroid/net/Uri;
    invoke-virtual {v0, v1, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 314
    return-void
.end method

.method private deleteFoldBookmarks(J)V
    .locals 10
    .parameter "id"

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 292
    iget-object v2, p0, Lcom/android/browser/BookmarkUtils$2$1;->this$0:Lcom/android/browser/BookmarkUtils$2;

    iget-object v2, v2, Lcom/android/browser/BookmarkUtils$2;->val$context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 293
    .local v0, cr:Landroid/content/ContentResolver;
    iget-object v2, p0, Lcom/android/browser/BookmarkUtils$2$1;->this$0:Lcom/android/browser/BookmarkUtils$2;

    iget-object v2, v2, Lcom/android/browser/BookmarkUtils$2;->val$context:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/browser/BookmarkUtils;->getBookmarksUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    .line 294
    .local v1, uri:Landroid/net/Uri;
    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v8

    const-string v3, "parent = ? AND deleted = ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ""

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    const-string v5, "0"

    aput-object v5, v4, v9

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 301
    .local v6, cursor:Landroid/database/Cursor;
    invoke-direct {p0, p1, p2}, Lcom/android/browser/BookmarkUtils$2$1;->deleteBookmarkById(J)V

    .line 302
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 303
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    int-to-long v2, v2

    invoke-direct {p0, v2, v3}, Lcom/android/browser/BookmarkUtils$2$1;->deleteFoldBookmarks(J)V

    goto :goto_0

    .line 305
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 306
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 288
    iget-object v0, p0, Lcom/android/browser/BookmarkUtils$2$1;->this$0:Lcom/android/browser/BookmarkUtils$2;

    iget-wide v0, v0, Lcom/android/browser/BookmarkUtils$2;->val$id:J

    invoke-direct {p0, v0, v1}, Lcom/android/browser/BookmarkUtils$2$1;->deleteFoldBookmarks(J)V

    .line 289
    return-void
.end method
