.class Lcom/android/browser/Controller$17;
.super Landroid/os/AsyncTask;
.source "Controller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/Controller;->updateScreenshot(Lcom/android/browser/Tab;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/Controller;

.field final synthetic val$bm:Landroid/graphics/Bitmap;

.field final synthetic val$cr:Landroid/content/ContentResolver;

.field final synthetic val$originalUrl:Ljava/lang/String;

.field final synthetic val$thumbnailUrl:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/browser/Controller;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2747
    iput-object p1, p0, Lcom/android/browser/Controller$17;->this$0:Lcom/android/browser/Controller;

    iput-object p2, p0, Lcom/android/browser/Controller$17;->val$cr:Landroid/content/ContentResolver;

    iput-object p3, p0, Lcom/android/browser/Controller$17;->val$originalUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/browser/Controller$17;->val$thumbnailUrl:Ljava/lang/String;

    iput-object p5, p0, Lcom/android/browser/Controller$17;->val$url:Ljava/lang/String;

    iput-object p6, p0, Lcom/android/browser/Controller$17;->val$bm:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2747
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller$17;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 9
    .parameter "unused"

    .prologue
    const/4 v8, 0x0

    .line 2750
    const/4 v0, 0x0

    .line 2754
    .local v0, cursor:Landroid/database/Cursor;
    :try_start_0
    iget-object v5, p0, Lcom/android/browser/Controller$17;->val$cr:Landroid/content/ContentResolver;

    iget-object v6, p0, Lcom/android/browser/Controller$17;->val$originalUrl:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/browser/Controller$17;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mNeedUpdateThumbnail:Z
    invoke-static {v4}, Lcom/android/browser/Controller;->access$1300(Lcom/android/browser/Controller;)Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/android/browser/Controller$17;->val$thumbnailUrl:Ljava/lang/String;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/android/browser/Controller$17;->val$thumbnailUrl:Ljava/lang/String;

    :goto_0
    invoke-static {v5, v6, v4}, Lcom/android/browser/Bookmarks;->queryCombinedForUrl(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 2756
    iget-object v4, p0, Lcom/android/browser/Controller$17;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mNeedUpdateThumbnail:Z
    invoke-static {v4}, Lcom/android/browser/Controller;->access$1300(Lcom/android/browser/Controller;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2757
    iget-object v4, p0, Lcom/android/browser/Controller$17;->this$0:Lcom/android/browser/Controller;

    const/4 v5, 0x0

    #setter for: Lcom/android/browser/Controller;->mNeedUpdateThumbnail:Z
    invoke-static {v4, v5}, Lcom/android/browser/Controller;->access$1302(Lcom/android/browser/Controller;Z)Z

    .line 2758
    iget-object v4, p0, Lcom/android/browser/Controller$17;->this$0:Lcom/android/browser/Controller;

    const/4 v5, 0x0

    #setter for: Lcom/android/browser/Controller;->mUrlNeedUpdateThumbnail:Ljava/lang/String;
    invoke-static {v4, v5}, Lcom/android/browser/Controller;->access$1402(Lcom/android/browser/Controller;Ljava/lang/String;)Ljava/lang/String;

    .line 2761
    :cond_0
    if-eqz v0, :cond_2

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2762
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2764
    .local v1, os:Ljava/io/ByteArrayOutputStream;
    iget-object v4, p0, Lcom/android/browser/Controller$17;->val$bm:Landroid/graphics/Bitmap;

    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x64

    invoke-virtual {v4, v5, v6, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 2766
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2767
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "thumbnail"

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2770
    :cond_1
    const-string v4, "url_key"

    const/4 v5, 0x0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2771
    iget-object v4, p0, Lcom/android/browser/Controller$17;->val$cr:Landroid/content/ContentResolver;

    sget-object v5, Landroid/provider/BrowserContract$Images;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v3, v6, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2772
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-nez v4, :cond_1

    .line 2781
    .end local v1           #os:Ljava/io/ByteArrayOutputStream;
    .end local v3           #values:Landroid/content/ContentValues;
    :cond_2
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 2783
    :cond_3
    :goto_1
    return-object v8

    .line 2754
    :cond_4
    :try_start_1
    iget-object v4, p0, Lcom/android/browser/Controller$17;->val$url:Ljava/lang/String;

    goto :goto_0

    :cond_5
    iget-object v4, p0, Lcom/android/browser/Controller$17;->val$url:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 2774
    :catch_0
    move-exception v4

    .line 2781
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 2776
    :catch_1
    move-exception v2

    .line 2779
    .local v2, s:Landroid/database/sqlite/SQLiteException;
    :try_start_2
    const-string v4, "Controller"

    const-string v5, "Error when running updateScreenshot "

    invoke-static {v4, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2781
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .end local v2           #s:Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_6

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_6
    throw v4
.end method
