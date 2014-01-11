.class Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;
.super Landroid/content/AsyncTaskLoader;
.source "AddBookmarkFolderForOP01Menu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/AddBookmarkFolderForOP01Menu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EditBookmarkInfoLoader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader",
        "<",
        "Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mMap:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 1
    .parameter "context"
    .parameter "bundle"

    .prologue
    .line 931
    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 932
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->mContext:Landroid/content/Context;

    .line 933
    iput-object p2, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->mMap:Landroid/os/Bundle;

    .line 934
    return-void
.end method


# virtual methods
.method public loadInBackground()Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;
    .locals 13

    .prologue
    const/4 v12, 0x1

    .line 938
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 939
    .local v0, cr:Landroid/content/ContentResolver;
    new-instance v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;

    invoke-direct {v8}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;-><init>()V

    .line 940
    .local v8, info:Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;
    const/4 v6, 0x0

    .line 944
    .local v6, c:Landroid/database/Cursor;
    :try_start_0
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->mMap:Landroid/os/Bundle;

    const-string v2, "url"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 945
    .local v11, url:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->mMap:Landroid/os/Bundle;

    const-string v2, "_id"

    const-wide/16 v3, -0x1

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mId:J

    .line 946
    iget-object v1, p0, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->mMap:Landroid/os/Bundle;

    const-string v2, "check_for_dupe"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    .line 947
    .local v7, checkForDupe:Z
    if-eqz v7, :cond_1

    iget-wide v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mId:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 948
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const-string v3, "url=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v11, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 953
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ne v1, v12, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 954
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mId:J

    .line 956
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 958
    :cond_1
    iget-wide v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mId:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_4

    .line 959
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v2, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mId:J

    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "parent"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "account_name"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "account_type"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "title"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 965
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 966
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mParentId:J

    .line 967
    const/4 v1, 0x1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mAccountName:Ljava/lang/String;

    .line 968
    const/4 v1, 0x2

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mAccountType:Ljava/lang/String;

    .line 969
    const/4 v1, 0x3

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mEBITitle:Ljava/lang/String;

    .line 971
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 972
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v2, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mParentId:J

    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "title"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 976
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 977
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mParentTitle:Ljava/lang/String;

    .line 979
    :cond_3
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 983
    :cond_4
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "parent"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "modified DESC LIMIT 1"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 986
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 987
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    .line 988
    .local v9, parent:J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 989
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "title"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "account_name"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "account_type"

    aput-object v4, v2, v3

    const-string v3, "_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 996
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 997
    iput-wide v9, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedId:J

    .line 998
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedTitle:Ljava/lang/String;

    .line 999
    const/4 v1, 0x1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedAccountName:Ljava/lang/String;

    .line 1000
    const/4 v1, 0x2

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v8, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;->mLastUsedAccountType:Ljava/lang/String;

    .line 1002
    :cond_5
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1005
    .end local v9           #parent:J
    :cond_6
    if-eqz v6, :cond_7

    .line 1006
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1009
    :cond_7
    return-object v8

    .line 1005
    .end local v7           #checkForDupe:Z
    .end local v11           #url:Ljava/lang/String;
    :catchall_0
    move-exception v1

    if-eqz v6, :cond_8

    .line 1006
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_8
    throw v1
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 924
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->loadInBackground()Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfo;

    move-result-object v0

    return-object v0
.end method

.method protected onStartLoading()V
    .locals 0

    .prologue
    .line 1014
    invoke-virtual {p0}, Lcom/android/browser/AddBookmarkFolderForOP01Menu$EditBookmarkInfoLoader;->forceLoad()V

    .line 1015
    return-void
.end method
