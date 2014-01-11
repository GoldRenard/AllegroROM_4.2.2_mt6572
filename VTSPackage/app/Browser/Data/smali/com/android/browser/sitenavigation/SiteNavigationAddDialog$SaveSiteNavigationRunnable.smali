.class Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;
.super Ljava/lang/Object;
.source "SiteNavigationAddDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveSiteNavigationRunnable"
.end annotation


# instance fields
.field private mMessage:Landroid/os/Message;

.field final synthetic this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;


# direct methods
.method public constructor <init>(Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;Landroid/os/Message;)V
    .locals 0
    .parameter
    .parameter "msg"

    .prologue
    .line 176
    iput-object p1, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput-object p2, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;->mMessage:Landroid/os/Message;

    .line 178
    return-void
.end method


# virtual methods
.method public run()V
    .locals 19

    .prologue
    .line 181
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;->mMessage:Landroid/os/Message;

    invoke-virtual {v3}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v9

    .line 182
    .local v9, bundle:Landroid/os/Bundle;
    const-string v3, "title"

    invoke-virtual {v9, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 183
    .local v14, title:Ljava/lang/String;
    const-string v3, "url"

    invoke-virtual {v9, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 184
    .local v17, url:Ljava/lang/String;
    const-string v3, "itemUrl"

    invoke-virtual {v9, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 185
    .local v12, itemUrl:Ljava/lang/String;
    const-string v3, "toDefaultThumbnail"

    invoke-virtual {v9, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    .line 187
    .local v15, toDefaultThumbnail:Ljava/lang/Boolean;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-virtual {v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 188
    .local v2, cr:Landroid/content/ContentResolver;
    const/4 v10, 0x0

    .line 190
    .local v10, cursor:Landroid/database/Cursor;
    :try_start_0
    sget-object v3, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v5

    const-string v5, "url = ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v12, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 192
    if-eqz v10, :cond_2

    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 193
    new-instance v18, Landroid/content/ContentValues;

    invoke-direct/range {v18 .. v18}, Landroid/content/ContentValues;-><init>()V

    .line 194
    .local v18, values:Landroid/content/ContentValues;
    const-string v3, "title"

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    const-string v3, "url"

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    const-string v3, "website"

    const-string v4, "1"

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 198
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 199
    .local v13, os:Ljava/io/ByteArrayOutputStream;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$SaveSiteNavigationRunnable;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-virtual {v3}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07002f

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 201
    .local v8, bm:Landroid/graphics/Bitmap;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {v8, v3, v4, v13}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 202
    const-string v3, "thumbnail"

    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 204
    .end local v8           #bm:Landroid/graphics/Bitmap;
    .end local v13           #os:Ljava/io/ByteArrayOutputStream;
    :cond_0
    sget-object v3, Lcom/android/browser/sitenavigation/SiteNavigation;->SITE_NAVIGATION_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-interface {v10, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v16

    .line 205
    .local v16, uri:Landroid/net/Uri;
    const-string v3, "browser/AddSiteNavigationPage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SaveSiteNavigationRunnable uri is : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v2, v0, v1, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    .end local v16           #uri:Landroid/net/Uri;
    .end local v18           #values:Landroid/content/ContentValues;
    :goto_0
    if-eqz v10, :cond_1

    .line 214
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 217
    :cond_1
    :goto_1
    return-void

    .line 208
    :cond_2
    :try_start_1
    const-string v3, "browser/AddSiteNavigationPage"

    const-string v4, "saveSiteNavigationItem the item does not exist!"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 210
    :catch_0
    move-exception v11

    .line 211
    .local v11, e:Ljava/lang/IllegalStateException;
    :try_start_2
    const-string v3, "browser/AddSiteNavigationPage"

    const-string v4, "saveSiteNavigationItem"

    invoke-static {v3, v4, v11}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 213
    if-eqz v10, :cond_1

    .line 214
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 213
    .end local v11           #e:Ljava/lang/IllegalStateException;
    :catchall_0
    move-exception v3

    if-eqz v10, :cond_3

    .line 214
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v3
.end method
