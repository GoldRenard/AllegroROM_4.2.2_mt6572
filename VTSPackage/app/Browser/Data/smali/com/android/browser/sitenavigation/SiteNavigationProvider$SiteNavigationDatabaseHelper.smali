.class Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SiteNavigationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/sitenavigation/SiteNavigationProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SiteNavigationDatabaseHelper"
.end annotation


# static fields
.field static final DATABASE_NAME:Ljava/lang/String; = "websites.db"


# instance fields
.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field private mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/android/browser/sitenavigation/SiteNavigationProvider;


# direct methods
.method public constructor <init>(Lcom/android/browser/sitenavigation/SiteNavigationProvider;Landroid/content/Context;)V
    .locals 3
    .parameter
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 177
    iput-object p1, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationProvider;

    .line 178
    const-string v0, "websites.db"

    const/4 v1, 0x1

    invoke-direct {p0, p2, v0, v2, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 220
    iput-object v2, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 180
    iput-object p2, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    .line 181
    return-void
.end method

.method public constructor <init>(Lcom/android/browser/sitenavigation/SiteNavigationProvider;Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 1
    .parameter
    .parameter "context"
    .parameter "name"
    .parameter "factory"
    .parameter "version"

    .prologue
    .line 184
    iput-object p1, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationProvider;

    .line 185
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 220
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 187
    iput-object p2, p0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    .line 188
    return-void
.end method

.method private createTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 206
    const-string v0, "CREATE TABLE websites (_id INTEGER PRIMARY KEY AUTOINCREMENT,url TEXT,title TEXT,created LONG,website INTEGER,thumbnail BLOB DEFAULT NULL,favicon BLOB DEFAULT NULL,default_thumb TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method private initTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 17
    .parameter "db"

    .prologue
    .line 223
    const/4 v13, 0x0

    .line 226
    .local v13, websites:[Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v14}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 227
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v14}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->getPredefinedWebsites()[Ljava/lang/CharSequence;

    move-result-object v13

    if-nez v13, :cond_0

    .line 228
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f080067

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v13

    .line 231
    :cond_0
    if-nez v13, :cond_1

    .line 306
    :goto_0
    return-void

    .line 234
    :cond_1
    array-length v12, v13

    .line 235
    .local v12, websiteSize:I
    const/4 v8, 0x0

    .line 237
    .local v8, siteNavigationWebsiteNum:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const/high16 v15, 0x7f09

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v14

    if-nez v14, :cond_4

    .line 238
    const/16 v8, 0x9

    .line 243
    :goto_1
    mul-int/lit8 v14, v8, 0x3

    if-le v12, v14, :cond_2

    .line 244
    mul-int/lit8 v12, v8, 0x3

    .line 247
    :cond_2
    const/4 v6, 0x0

    .line 248
    .local v6, os:Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 249
    .local v1, bm:Landroid/graphics/Bitmap;
    const/4 v9, 0x0

    .line 250
    .local v9, values:Landroid/content/ContentValues;
    const/4 v3, 0x0

    .line 252
    .local v3, fileName:Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, i:I
    move-object v10, v9

    .end local v9           #values:Landroid/content/ContentValues;
    .local v10, values:Landroid/content/ContentValues;
    move-object v7, v6

    .end local v6           #os:Ljava/io/ByteArrayOutputStream;
    .local v7, os:Ljava/io/ByteArrayOutputStream;
    :goto_2
    if-ge v4, v12, :cond_7

    .line 253
    :try_start_0
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_2

    .line 254
    .end local v7           #os:Ljava/io/ByteArrayOutputStream;
    .restart local v6       #os:Ljava/io/ByteArrayOutputStream;
    add-int/lit8 v14, v4, 0x2

    :try_start_1
    aget-object v14, v13, v14

    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 256
    if-eqz v3, :cond_5

    :try_start_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_5

    .line 257
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const-string v15, "raw"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v3, v15, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 258
    .local v5, id:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-static {v14, v5}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v1

    .line 267
    .end local v5           #id:I
    :goto_3
    if-nez v1, :cond_3

    .line 268
    :try_start_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f07002f

    invoke-static {v14, v15}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 273
    :cond_3
    :goto_4
    sget-object v14, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v15, 0x64

    invoke-virtual {v1, v14, v15, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 274
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V
    :try_end_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_1

    .line 275
    .end local v10           #values:Landroid/content/ContentValues;
    .restart local v9       #values:Landroid/content/ContentValues;
    :try_start_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    add-int/lit8 v15, v4, 0x1

    aget-object v15, v13, v15

    invoke-static {v14, v15}, Lcom/android/browser/provider/BrowserProvider2;->replaceSystemPropertyInString(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v11

    .line 277
    .local v11, websiteDestination:Ljava/lang/CharSequence;
    const-string v14, "url"

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const-string v14, "title"

    aget-object v15, v13, v4

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const-string v14, "created"

    const-string v15, "0"

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const-string v14, "website"

    const-string v15, "1"

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string v14, "thumbnail"

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 282
    const-string v14, "websites"

    const-string v15, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15, v9}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_4
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_3

    .line 252
    add-int/lit8 v4, v4, 0x3

    move-object v10, v9

    .end local v9           #values:Landroid/content/ContentValues;
    .restart local v10       #values:Landroid/content/ContentValues;
    move-object v7, v6

    .end local v6           #os:Ljava/io/ByteArrayOutputStream;
    .restart local v7       #os:Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_2

    .line 240
    .end local v1           #bm:Landroid/graphics/Bitmap;
    .end local v3           #fileName:Ljava/lang/String;
    .end local v4           #i:I
    .end local v7           #os:Ljava/io/ByteArrayOutputStream;
    .end local v10           #values:Landroid/content/ContentValues;
    .end local v11           #websiteDestination:Ljava/lang/CharSequence;
    :cond_4
    const/16 v8, 0x8

    goto/16 :goto_1

    .line 260
    .restart local v1       #bm:Landroid/graphics/Bitmap;
    .restart local v3       #fileName:Ljava/lang/String;
    .restart local v4       #i:I
    .restart local v6       #os:Ljava/io/ByteArrayOutputStream;
    .restart local v10       #values:Landroid/content/ContentValues;
    :cond_5
    :try_start_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f07002f

    invoke-static {v14, v15}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v1

    goto :goto_3

    .line 263
    :catch_0
    move-exception v2

    .line 264
    .local v2, e:Ljava/lang/Exception;
    :try_start_6
    const-string v14, "SiteNavigationProvider"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ": "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "not found, use default."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 267
    if-nez v1, :cond_3

    .line 268
    :try_start_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f07002f

    invoke-static {v14, v15}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    goto/16 :goto_4

    .line 267
    .end local v2           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v14

    if-nez v1, :cond_6

    .line 268
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f07002f

    invoke-static/range {v15 .. v16}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    :cond_6
    throw v14
    :try_end_7
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_7 .. :try_end_7} :catch_1

    .line 303
    :catch_1
    move-exception v2

    move-object v9, v10

    .line 304
    .end local v10           #values:Landroid/content/ContentValues;
    .local v2, e:Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v9       #values:Landroid/content/ContentValues;
    :goto_5
    const-string v14, "browser/SiteNavigationProvider"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "initTable: ArrayIndexOutOfBoundsException: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 287
    .end local v2           #e:Ljava/lang/ArrayIndexOutOfBoundsException;
    .end local v6           #os:Ljava/io/ByteArrayOutputStream;
    .end local v9           #values:Landroid/content/ContentValues;
    .restart local v7       #os:Ljava/io/ByteArrayOutputStream;
    .restart local v10       #values:Landroid/content/ContentValues;
    :cond_7
    :try_start_8
    div-int/lit8 v4, v12, 0x3

    :goto_6
    if-ge v4, v8, :cond_8

    .line 288
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_8
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_8 .. :try_end_8} :catch_2

    .line 289
    .end local v7           #os:Ljava/io/ByteArrayOutputStream;
    .restart local v6       #os:Ljava/io/ByteArrayOutputStream;
    :try_start_9
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f07002f

    invoke-static {v14, v15}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 291
    sget-object v14, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v15, 0x64

    invoke-virtual {v1, v14, v15, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 292
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V
    :try_end_9
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_9 .. :try_end_9} :catch_1

    .line 295
    .end local v10           #values:Landroid/content/ContentValues;
    .restart local v9       #values:Landroid/content/ContentValues;
    :try_start_a
    const-string v14, "url"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "about:blank"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    add-int/lit8 v16, v4, 0x1

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    const-string v14, "title"

    const-string v15, "about:blank"

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    const-string v14, "created"

    const-string v15, "0"

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    const-string v14, "website"

    const-string v15, "1"

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    const-string v14, "thumbnail"

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v15

    invoke-virtual {v9, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 300
    const-string v14, "websites"

    const-string v15, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15, v9}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_a .. :try_end_a} :catch_3

    .line 287
    add-int/lit8 v4, v4, 0x1

    move-object v10, v9

    .end local v9           #values:Landroid/content/ContentValues;
    .restart local v10       #values:Landroid/content/ContentValues;
    move-object v7, v6

    .end local v6           #os:Ljava/io/ByteArrayOutputStream;
    .restart local v7       #os:Ljava/io/ByteArrayOutputStream;
    goto :goto_6

    :cond_8
    move-object v9, v10

    .end local v10           #values:Landroid/content/ContentValues;
    .restart local v9       #values:Landroid/content/ContentValues;
    move-object v6, v7

    .line 305
    .end local v7           #os:Ljava/io/ByteArrayOutputStream;
    .restart local v6       #os:Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_0

    .line 303
    .end local v6           #os:Ljava/io/ByteArrayOutputStream;
    .end local v9           #values:Landroid/content/ContentValues;
    .restart local v7       #os:Ljava/io/ByteArrayOutputStream;
    .restart local v10       #values:Landroid/content/ContentValues;
    :catch_2
    move-exception v2

    move-object v9, v10

    .end local v10           #values:Landroid/content/ContentValues;
    .restart local v9       #values:Landroid/content/ContentValues;
    move-object v6, v7

    .end local v7           #os:Ljava/io/ByteArrayOutputStream;
    .restart local v6       #os:Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_5

    :catch_3
    move-exception v2

    goto/16 :goto_5
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 195
    invoke-direct {p0, p1}, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->createTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 197
    invoke-direct {p0, p1}, Lcom/android/browser/sitenavigation/SiteNavigationProvider$SiteNavigationDatabaseHelper;->initTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 198
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 203
    return-void
.end method
