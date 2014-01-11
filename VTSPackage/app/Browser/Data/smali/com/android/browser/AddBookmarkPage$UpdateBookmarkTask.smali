.class Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;
.super Landroid/os/AsyncTask;
.source "AddBookmarkPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/AddBookmarkPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UpdateBookmarkTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Landroid/content/ContentValues;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field mBookmarkCurrentId:J

.field mContext:Landroid/content/Context;

.field mId:Ljava/lang/Long;


# direct methods
.method public constructor <init>(Landroid/content/Context;J)V
    .locals 1
    .parameter "context"
    .parameter "id"

    .prologue
    .line 1125
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1126
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mContext:Landroid/content/Context;

    .line 1127
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mId:Ljava/lang/Long;

    .line 1128
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1119
    check-cast p1, [Landroid/content/ContentValues;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->doInBackground([Landroid/content/ContentValues;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Landroid/content/ContentValues;)Ljava/lang/Void;
    .locals 6
    .parameter "params"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 1132
    array-length v1, p1

    if-ge v1, v4, :cond_0

    .line 1133
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No ContentValues provided!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1135
    :cond_0
    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/browser/BookmarkUtils;->getBookmarksUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mId:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 1136
    .local v0, uri:Landroid/net/Uri;
    iget-object v1, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v1, v0, v2, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1139
    const-string v1, "browser/AddBookmarkPage"

    const-string v2, "UpdateBookmarkTask doInBackground:"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1140
    array-length v1, p1

    if-le v1, v4, :cond_1

    .line 1141
    aget-object v1, p1, v4

    const-string v2, "bookmark_current_id"

    invoke-virtual {v1, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mBookmarkCurrentId:J

    .line 1145
    :goto_0
    return-object v5

    .line 1143
    :cond_1
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mBookmarkCurrentId:J

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1119
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 7
    .parameter "o"

    .prologue
    .line 1153
    const-string v0, "browser/AddBookmarkPage"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UpdateBookmarkTask onPostExecute mBookmarkCurrentId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mBookmarkCurrentId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1154
    iget-wide v0, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mBookmarkCurrentId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 1155
    iget-object v0, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    iget-wide v5, p0, Lcom/android/browser/AddBookmarkPage$UpdateBookmarkTask;->mBookmarkCurrentId:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1158
    :cond_0
    return-void
.end method
