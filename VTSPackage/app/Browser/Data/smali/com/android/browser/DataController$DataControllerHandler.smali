.class Lcom/android/browser/DataController$DataControllerHandler;
.super Ljava/lang/Thread;
.source "DataController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/DataController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DataControllerHandler"
.end annotation


# instance fields
.field private mMessageQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lcom/android/browser/DataController$DCMessage;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/browser/DataController;


# direct methods
.method public constructor <init>(Lcom/android/browser/DataController;)V
    .locals 1
    .parameter

    .prologue
    .line 137
    iput-object p1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    .line 138
    const-string v0, "DataControllerHandler"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 134
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/android/browser/DataController$DataControllerHandler;->mMessageQueue:Ljava/util/concurrent/BlockingQueue;

    .line 139
    return-void
.end method

.method private doLoadThumbnail(Lcom/android/browser/Tab;)V
    .locals 8
    .parameter "tab"

    .prologue
    .line 224
    iget-object v2, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 225
    .local v0, cr:Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 227
    .local v6, c:Landroid/database/Cursor;
    :try_start_0
    sget-object v2, Lcom/android/browser/provider/BrowserProvider2$Thumbnails;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 228
    .local v1, uri:Landroid/net/Uri;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "thumbnail"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 230
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 231
    const/4 v2, 0x1

    invoke-interface {v6, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    .line 232
    .local v7, data:[B
    if-eqz v7, :cond_0

    array-length v2, v7

    if-lez v2, :cond_0

    .line 233
    invoke-virtual {p1, v7}, Lcom/android/browser/Tab;->updateCaptureFromBlob([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    .end local v7           #data:[B
    :cond_0
    if-eqz v6, :cond_1

    .line 238
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 241
    :cond_1
    return-void

    .line 237
    .end local v1           #uri:Landroid/net/Uri;
    :catchall_0
    move-exception v2

    if-eqz v6, :cond_2

    .line 238
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v2
.end method

.method private doQueryBookmarkStatus(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 13
    .parameter "url"
    .parameter "replyTo"

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 309
    const/4 v7, 0x0

    .line 310
    .local v7, cursor:Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 312
    .local v9, isBookmark:Z
    :try_start_0
    iget-object v0, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/browser/BookmarkUtils;->getBookmarksUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "url"

    aput-object v4, v2, v3

    const-string v3, "url == ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 318
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    .line 322
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 324
    :cond_0
    :goto_0
    new-instance v6, Lcom/android/browser/DataController$CallbackContainer;

    invoke-direct {v6, v12}, Lcom/android/browser/DataController$CallbackContainer;-><init>(Lcom/android/browser/DataController$1;)V

    .line 325
    .local v6, cc:Lcom/android/browser/DataController$CallbackContainer;
    iput-object p2, v6, Lcom/android/browser/DataController$CallbackContainer;->replyTo:Ljava/lang/Object;

    .line 326
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v10

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v0, v11

    iput-object v0, v6, Lcom/android/browser/DataController$CallbackContainer;->args:[Ljava/lang/Object;

    .line 327
    iget-object v0, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mCbHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/browser/DataController;->access$300(Lcom/android/browser/DataController;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xc8

    invoke-virtual {v0, v1, v6}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 328
    return-void

    .line 319
    .end local v6           #cc:Lcom/android/browser/DataController$CallbackContainer;
    :catch_0
    move-exception v8

    .line 320
    .local v8, e:Landroid/database/sqlite/SQLiteException;
    :try_start_1
    const-string v0, "DataController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error checking for bookmark: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 322
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .end local v8           #e:Landroid/database/sqlite/SQLiteException;
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_1

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_1
    throw v0
.end method

.method private doSaveThumbnail(Lcom/android/browser/Tab;)V
    .locals 6
    .parameter "tab"

    .prologue
    .line 212
    invoke-direct {p0, p1}, Lcom/android/browser/DataController$DataControllerHandler;->getCaptureBlob(Lcom/android/browser/Tab;)[B

    move-result-object v0

    .line 213
    .local v0, blob:[B
    if-nez v0, :cond_0

    .line 221
    :goto_0
    return-void

    .line 216
    :cond_0
    iget-object v3, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 217
    .local v1, cr:Landroid/content/ContentResolver;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 218
    .local v2, values:Landroid/content/ContentValues;
    const-string v3, "_id"

    invoke-virtual {p1}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 219
    const-string v3, "thumbnail"

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 220
    sget-object v3, Lcom/android/browser/provider/BrowserProvider2$Thumbnails;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v3, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto :goto_0
.end method

.method private doUpdateHistoryTitle(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "url"
    .parameter "title"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 332
    invoke-direct {p0, p1}, Lcom/android/browser/DataController$DataControllerHandler;->findHistoryUrlInBookmark(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 333
    .local v2, urlInBookmark:Ljava/lang/String;
    iget-object v4, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 334
    .local v1, cr:Landroid/content/ContentResolver;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 335
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "title"

    invoke-virtual {v3, v4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    const-string v4, "url"

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    sget-object v4, Landroid/provider/BrowserContract$History;->CONTENT_URI:Landroid/net/Uri;

    const-string v5, "url==?"

    new-array v6, v7, [Ljava/lang/String;

    aput-object p1, v6, v8

    invoke-virtual {v1, v4, v3, v5, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 339
    .local v0, count:I
    if-gtz v0, :cond_0

    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 340
    sget-object v4, Landroid/provider/BrowserContract$History;->CONTENT_URI:Landroid/net/Uri;

    const-string v5, "url==?"

    new-array v6, v7, [Ljava/lang/String;

    const-string v7, "/"

    invoke-virtual {v2, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v2, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v1, v4, v3, v5, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 344
    :cond_0
    return-void
.end method

.method private doUpdateVisitedHistory(Ljava/lang/String;)V
    .locals 11
    .parameter "url"

    .prologue
    .line 274
    invoke-direct {p0, p1}, Lcom/android/browser/DataController$DataControllerHandler;->findHistoryUrlInBookmark(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 275
    .local v7, urlInBookmark:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 276
    .local v0, cr:Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 278
    .local v6, c:Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Landroid/provider/BrowserContract$History;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "visits"

    aput-object v4, v2, v3

    const-string v3, "url==? OR url==?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v9, 0x1

    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x0

    const-string v10, "/"

    invoke-virtual {p1, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {p1, v5, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    :goto_0
    aput-object v5, v4, v9

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 282
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 283
    const-string v1, "DataController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "update history to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 285
    .local v8, values:Landroid/content/ContentValues;
    const-string v1, "url"

    invoke-virtual {v8, v1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    const-string v1, "visits"

    const/4 v2, 0x1

    invoke-interface {v6, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 287
    const-string v1, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 288
    sget-object v1, Landroid/provider/BrowserContract$History;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-interface {v6, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v8, v2, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 303
    :goto_1
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 305
    :cond_0
    return-void

    .line 278
    .end local v8           #values:Landroid/content/ContentValues;
    :cond_1
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, "/"

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 291
    :cond_2
    const-string v1, "DataController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "insert new history to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    invoke-static {v0}, Landroid/provider/Browser;->truncateHistory(Landroid/content/ContentResolver;)V

    .line 293
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 294
    .restart local v8       #values:Landroid/content/ContentValues;
    const-string v1, "url"

    invoke-virtual {v8, v1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    const-string v1, "visits"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 296
    const-string v1, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 297
    const-string v1, "title"

    invoke-virtual {v8, v1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    const-string v1, "created"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 299
    const-string v1, "user_entered"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 300
    sget-object v1, Landroid/provider/BrowserContract$History;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v8}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 303
    .end local v8           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v1

    if-eqz v6, :cond_3

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1
.end method

.method private findHistoryUrlInBookmark(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "url"

    .prologue
    .line 247
    const/4 v6, 0x0

    .line 248
    .local v6, bookmarkCursor:Landroid/database/Cursor;
    move-object v8, p1

    .line 250
    .local v8, historyUrl:Ljava/lang/String;
    :try_start_0
    const-string v0, "DataController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "historyUrl is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    iget-object v0, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/browser/BookmarkUtils;->getBookmarksUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "url"

    aput-object v4, v2, v3

    const-string v3, "url == ? OR url == ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v8, v4, v5

    const/4 v9, 0x1

    const-string v5, "/"

    invoke-virtual {v8, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x0

    const-string v10, "/"

    invoke-virtual {v8, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v8, v5, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    :goto_0
    aput-object v5, v4, v9

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 259
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 261
    .local v7, bookmarkUrl:Ljava/lang/String;
    const-string v0, "DataController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Url in bookmark table is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    move-object v8, v7

    .line 263
    const-string v0, "DataController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "save url to history table is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    .end local v7           #bookmarkUrl:Ljava/lang/String;
    :cond_0
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 269
    :cond_1
    return-object v8

    .line 251
    :cond_2
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, "/"

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    goto :goto_0

    .line 267
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private getCaptureBlob(Lcom/android/browser/Tab;)[B
    .locals 3
    .parameter "tab"

    .prologue
    .line 197
    monitor-enter p1

    .line 198
    :try_start_0
    invoke-virtual {p1}, Lcom/android/browser/Tab;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 199
    .local v0, capture:Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 200
    const/4 v1, 0x0

    monitor-exit p1

    .line 207
    :goto_0
    return-object v1

    .line 202
    :cond_0
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mBuffer:Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$100(Lcom/android/browser/DataController;)Ljava/nio/ByteBuffer;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mBuffer:Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$100(Lcom/android/browser/DataController;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 203
    :cond_1
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    #setter for: Lcom/android/browser/DataController;->mBuffer:Ljava/nio/ByteBuffer;
    invoke-static {v1, v2}, Lcom/android/browser/DataController;->access$102(Lcom/android/browser/DataController;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 205
    :cond_2
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mBuffer:Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$100(Lcom/android/browser/DataController;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 206
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mBuffer:Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$100(Lcom/android/browser/DataController;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 207
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mBuffer:Ljava/nio/ByteBuffer;
    invoke-static {v1}, Lcom/android/browser/DataController;->access$100(Lcom/android/browser/DataController;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    monitor-exit p1

    goto :goto_0

    .line 208
    .end local v0           #capture:Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v1

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private handleMessage(Lcom/android/browser/DataController$DCMessage;)V
    .locals 6
    .parameter "msg"

    .prologue
    .line 165
    iget v2, p1, Lcom/android/browser/DataController$DCMessage;->what:I

    sparse-switch v2, :sswitch_data_0

    .line 194
    :goto_0
    return-void

    .line 167
    :sswitch_0
    iget-object v2, p1, Lcom/android/browser/DataController$DCMessage;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/android/browser/DataController$DataControllerHandler;->doUpdateVisitedHistory(Ljava/lang/String;)V

    goto :goto_0

    .line 170
    :sswitch_1
    iget-object v2, p1, Lcom/android/browser/DataController$DCMessage;->obj:Ljava/lang/Object;

    check-cast v2, [Ljava/lang/String;

    move-object v0, v2

    check-cast v0, [Ljava/lang/String;

    .line 171
    .local v0, args:[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v0, v2

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-direct {p0, v2, v3}, Lcom/android/browser/DataController$DataControllerHandler;->doUpdateHistoryTitle(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 177
    .end local v0           #args:[Ljava/lang/String;
    :sswitch_2
    iget-object v2, p1, Lcom/android/browser/DataController$DCMessage;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/android/browser/DataController$DCMessage;->replyTo:Ljava/lang/Object;

    invoke-direct {p0, v2, v3}, Lcom/android/browser/DataController$DataControllerHandler;->doQueryBookmarkStatus(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 180
    :sswitch_3
    iget-object v2, p1, Lcom/android/browser/DataController$DCMessage;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/browser/Tab;

    invoke-direct {p0, v2}, Lcom/android/browser/DataController$DataControllerHandler;->doLoadThumbnail(Lcom/android/browser/Tab;)V

    goto :goto_0

    .line 183
    :sswitch_4
    iget-object v2, p0, Lcom/android/browser/DataController$DataControllerHandler;->this$0:Lcom/android/browser/DataController;

    #getter for: Lcom/android/browser/DataController;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/browser/DataController;->access$000(Lcom/android/browser/DataController;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 185
    .local v1, cr:Landroid/content/ContentResolver;
    :try_start_0
    sget-object v3, Lcom/android/browser/provider/BrowserProvider2$Thumbnails;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p1, Lcom/android/browser/DataController$DCMessage;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 188
    :catch_0
    move-exception v2

    goto :goto_0

    .line 191
    .end local v1           #cr:Landroid/content/ContentResolver;
    :sswitch_5
    iget-object v2, p1, Lcom/android/browser/DataController$DCMessage;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/browser/Tab;

    invoke-direct {p0, v2}, Lcom/android/browser/DataController$DataControllerHandler;->doSaveThumbnail(Lcom/android/browser/Tab;)V

    goto :goto_0

    .line 165
    nop

    :sswitch_data_0
    .sparse-switch
        0x64 -> :sswitch_0
        0x65 -> :sswitch_1
        0xc8 -> :sswitch_2
        0xc9 -> :sswitch_3
        0xca -> :sswitch_5
        0xcb -> :sswitch_4
    .end sparse-switch
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 143
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/browser/DataController$DataControllerHandler;->setPriority(I)V

    .line 146
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->mMessageQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/browser/DataController$DCMessage;

    invoke-direct {p0, v1}, Lcom/android/browser/DataController$DataControllerHandler;->handleMessage(Lcom/android/browser/DataController$DCMessage;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 147
    :catch_0
    move-exception v0

    .line 151
    .local v0, ex:Ljava/lang/InterruptedException;
    return-void
.end method

.method sendMessage(ILjava/lang/Object;)V
    .locals 2
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 154
    new-instance v0, Lcom/android/browser/DataController$DCMessage;

    invoke-direct {v0, p1, p2}, Lcom/android/browser/DataController$DCMessage;-><init>(ILjava/lang/Object;)V

    .line 155
    .local v0, m:Lcom/android/browser/DataController$DCMessage;
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->mMessageQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1, v0}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 156
    return-void
.end method

.method sendMessage(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .parameter "what"
    .parameter "obj"
    .parameter "replyTo"

    .prologue
    .line 159
    new-instance v0, Lcom/android/browser/DataController$DCMessage;

    invoke-direct {v0, p1, p2}, Lcom/android/browser/DataController$DCMessage;-><init>(ILjava/lang/Object;)V

    .line 160
    .local v0, m:Lcom/android/browser/DataController$DCMessage;
    iput-object p3, v0, Lcom/android/browser/DataController$DCMessage;->replyTo:Ljava/lang/Object;

    .line 161
    iget-object v1, p0, Lcom/android/browser/DataController$DataControllerHandler;->mMessageQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1, v0}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 162
    return-void
.end method
