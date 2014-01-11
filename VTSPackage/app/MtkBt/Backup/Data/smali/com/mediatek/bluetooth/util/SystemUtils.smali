.class public Lcom/mediatek/bluetooth/util/SystemUtils;
.super Ljava/lang/Object;
.source "SystemUtils.java"


# static fields
.field private static final FM_SELECTION:Ljava/lang/String; = "Received File"

.field private static final MAX_FILENAME_LENGTH:I = 0xff

.field private static final SDCARD:Ljava/lang/String; = "sdcard"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createNewFileForSaving(ILjava/lang/String;)Ljava/io/File;
    .locals 16
    .parameter "level"
    .parameter "expectedFilePath"

    .prologue
    .line 249
    move/from16 v10, p0

    .line 250
    .local v10, innerLevel:I
    move-object/from16 v9, p1

    .line 254
    .local v9, innerFilePath:Ljava/lang/String;
    :goto_0
    if-nez v9, :cond_0

    .line 256
    const-string v14, "SystemUtils.createNewFileForSaving(): null expected filename!"

    invoke-static {v14}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 257
    const/4 v6, 0x0

    .line 336
    :goto_1
    return-object v6

    .line 261
    :cond_0
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 262
    .local v6, file:Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    .line 265
    .local v8, filename:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    const/16 v15, 0xff

    if-gt v14, v15, :cond_1

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_1

    .line 268
    :try_start_0
    invoke-virtual {v6}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 270
    :catch_0
    move-exception v3

    .line 272
    .local v3, ex:Ljava/lang/Exception;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "create new file error: ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v3}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 273
    const/4 v6, 0x0

    goto :goto_1

    .line 278
    .end local v3           #ex:Ljava/lang/Exception;
    :cond_1
    const/16 v14, 0x2e

    invoke-virtual {v8, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 279
    .local v4, extIndex:I
    const/16 v14, 0x5f

    invoke-virtual {v8, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v12

    .line 281
    .local v12, sufIndex:I
    const/4 v14, -0x1

    if-le v4, v14, :cond_5

    invoke-virtual {v8, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 284
    .local v5, extension:Ljava/lang/String;
    :goto_2
    if-nez v10, :cond_2

    .line 285
    const/4 v12, -0x1

    .line 288
    :cond_2
    const/4 v14, -0x1

    if-le v12, v14, :cond_3

    .line 289
    const/4 v14, -0x1

    if-le v4, v14, :cond_6

    add-int/lit8 v14, v12, 0x1

    invoke-virtual {v8, v14, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 291
    .local v2, counter:Ljava/lang/String;
    :goto_3
    :try_start_1
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v10

    .line 300
    .end local v2           #counter:Ljava/lang/String;
    :cond_3
    :goto_4
    const/4 v14, -0x1

    if-le v12, v14, :cond_7

    .line 301
    const/4 v14, 0x0

    invoke-virtual {v8, v14, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, basename:Ljava/lang/String;
    :goto_5
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    const/16 v15, 0xff

    if-le v14, v15, :cond_4

    .line 311
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v8, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    .line 312
    .local v13, suffix:Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    rsub-int v11, v14, 0xff

    .line 313
    .local v11, maxBasename:I
    invoke-static {v8, v11}, Lcom/mediatek/bluetooth/util/SystemUtils;->trimFilenameWithLength(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    .line 314
    new-instance v7, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v7, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 315
    .end local v6           #file:Ljava/io/File;
    .local v7, file:Ljava/io/File;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "filename is too long and be trimed: ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    move-object v6, v7

    .line 319
    .end local v7           #file:Ljava/io/File;
    .end local v11           #maxBasename:I
    .end local v13           #suffix:Ljava/lang/String;
    .restart local v6       #file:Ljava/io/File;
    :cond_4
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_9

    .line 321
    add-int/lit8 v10, v10, 0x1

    .line 322
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x5f

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 323
    .local v1, buffer:Ljava/lang/StringBuilder;
    new-instance v7, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v14

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v7, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 326
    .end local v6           #file:Ljava/io/File;
    .restart local v7       #file:Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    .line 327
    goto/16 :goto_0

    .line 281
    .end local v0           #basename:Ljava/lang/String;
    .end local v1           #buffer:Ljava/lang/StringBuilder;
    .end local v5           #extension:Ljava/lang/String;
    .end local v7           #file:Ljava/io/File;
    .restart local v6       #file:Ljava/io/File;
    :cond_5
    const-string v5, ""

    goto/16 :goto_2

    .line 289
    .restart local v5       #extension:Ljava/lang/String;
    :cond_6
    add-int/lit8 v14, v12, 0x1

    invoke-virtual {v8, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_3

    .line 292
    .restart local v2       #counter:Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 295
    .local v3, ex:Ljava/lang/NumberFormatException;
    const/4 v12, -0x1

    goto/16 :goto_4

    .line 302
    .end local v2           #counter:Ljava/lang/String;
    .end local v3           #ex:Ljava/lang/NumberFormatException;
    :cond_7
    const/4 v14, -0x1

    if-le v4, v14, :cond_8

    .line 303
    const/4 v14, 0x0

    invoke-virtual {v8, v14, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #basename:Ljava/lang/String;
    goto/16 :goto_5

    .line 305
    .end local v0           #basename:Ljava/lang/String;
    :cond_8
    move-object v0, v8

    .restart local v0       #basename:Ljava/lang/String;
    goto/16 :goto_5

    .line 331
    :cond_9
    :try_start_2
    invoke-virtual {v6}, Ljava/io/File;->createNewFile()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 333
    :catch_2
    move-exception v3

    .line 335
    .local v3, ex:Ljava/lang/Exception;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "create new file error: ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14, v3}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 336
    const/4 v6, 0x0

    goto/16 :goto_1
.end method

.method public static createNewFileForSaving(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .parameter "expectedFilePath"

    .prologue
    .line 244
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/mediatek/bluetooth/util/SystemUtils;->createNewFileForSaving(ILjava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getExternalStorageDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 10
    .parameter "context"
    .parameter "filename"

    .prologue
    .line 140
    const/4 v6, 0x0

    .line 141
    .local v6, result:Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 144
    const/4 v1, 0x0

    .line 145
    .local v1, currMatch:I
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 146
    const-string v8, "storage"

    invoke-virtual {p0, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/storage/StorageManager;

    .line 147
    .local v7, sm:Landroid/os/storage/StorageManager;
    invoke-virtual {v7}, Landroid/os/storage/StorageManager;->getVolumePaths()[Ljava/lang/String;

    move-result-object v3

    .line 148
    .local v3, esds:[Ljava/lang/String;
    move-object v0, v3

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v2, v0, v4

    .line 150
    .local v2, dir:Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v1, :cond_0

    .line 151
    move-object v6, v2

    .line 152
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 148
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 157
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #currMatch:I
    .end local v2           #dir:Ljava/lang/String;
    .end local v3           #esds:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #sm:Landroid/os/storage/StorageManager;
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "SystemUtils.getExternalStorageDirectory(): ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]=>["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 159
    if-nez v6, :cond_2

    .line 160
    const/4 v8, 0x0

    .line 162
    :goto_1
    return-object v8

    :cond_2
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static getMountPointPath()Ljava/lang/String;
    .locals 6

    .prologue
    .line 108
    const/4 v2, 0x0

    .line 109
    .local v2, path:Ljava/lang/String;
    const/4 v3, 0x0

    .line 111
    .local v3, ret:Ljava/lang/String;
    :try_start_0
    const-string v4, "internal_sd_path"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 117
    :goto_0
    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v1, v4, 0x1

    .line 119
    .local v1, idx:I
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 120
    return-object v3

    .line 112
    .end local v1           #idx:I
    :catch_0
    move-exception v0

    .line 113
    .local v0, e:Ljava/lang/IllegalArgumentException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IllegalArgumentException when getInternalStoragePath:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 114
    const-string v2, "/storage/"

    goto :goto_0
.end method

.method public static getOpenFileIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 9
    .parameter "context"
    .parameter "filename"
    .parameter "mimeType"

    .prologue
    const v8, 0x7f05008c

    const v5, 0x7f050088

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 377
    if-nez p1, :cond_0

    .line 379
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid parameters for getOpenFileIntent(): filename="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mimetype="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 380
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f050089

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    aput-object p2, v5, v7

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v3, v4, v5}, Lcom/mediatek/activity/MessageActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 407
    :goto_0
    return-object v1

    .line 386
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 387
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 389
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f05008b

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v3, v4, v5}, Lcom/mediatek/activity/MessageActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    goto :goto_0

    .line 395
    :cond_1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 396
    .local v2, path:Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    .line 397
    :cond_2
    invoke-static {p0, v2, p2}, Lcom/mediatek/bluetooth/util/SystemUtils;->isSupportedDataType(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 399
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f05008a

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p2, v5, v6

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v3, v4, v5}, Lcom/mediatek/activity/MessageActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    goto :goto_0

    .line 404
    :cond_3
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 405
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 406
    const/high16 v3, 0x1000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_0
.end method

.method public static getReceivedFilePath(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .parameter "context"

    .prologue
    .line 92
    const/4 v0, 0x0

    .line 95
    .local v0, result:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/mediatek/storage/StorageManagerEx;->getDefaultPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Received File"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 97
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 98
    .local v1, storageDir:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_0

    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/mediatek/storage/StorageManagerEx;->getDefaultPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "bluetooth"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 104
    :cond_0
    return-object v0
.end method

.method public static getReceivedFilePathAvailableSize(Landroid/content/Context;)J
    .locals 2
    .parameter "context"

    .prologue
    .line 128
    invoke-static {p0}, Lcom/mediatek/bluetooth/util/SystemUtils;->getReceivedFilePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/mediatek/bluetooth/util/SystemUtils;->getStorageAvailableSize(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getStorageAvailableSize(Landroid/content/Context;Ljava/lang/String;)J
    .locals 7
    .parameter "context"
    .parameter "filename"

    .prologue
    const-wide/16 v3, -0x1

    .line 212
    invoke-static {p0, p1}, Lcom/mediatek/bluetooth/util/SystemUtils;->getExternalStorageDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 213
    .local v0, externalStorage:Ljava/io/File;
    if-eqz v0, :cond_1

    invoke-static {p0, p1}, Lcom/mediatek/bluetooth/util/SystemUtils;->isExternalStorageMounted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 230
    :cond_0
    :goto_0
    return-wide v3

    .line 220
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 221
    .local v1, ff:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_2

    .line 223
    const-string v5, "SystemUtils.getStorageAvailableSize(): change to parent folder"

    invoke-static {v5}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 224
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 225
    if-eqz v1, :cond_0

    .line 228
    :cond_2
    new-instance v2, Landroid/os/StatFs;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 230
    .local v2, stat:Landroid/os/StatFs;
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSize()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v5

    add-int/lit8 v5, v5, -0x4

    int-to-long v5, v5

    mul-long/2addr v3, v5

    goto :goto_0
.end method

.method public static isExternalStorageMounted(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 7
    .parameter "context"
    .parameter "filename"

    .prologue
    const/4 v4, 0x0

    .line 176
    invoke-static {p0, p1}, Lcom/mediatek/bluetooth/util/SystemUtils;->getExternalStorageDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 177
    .local v2, storageDir:Ljava/io/File;
    if-nez v2, :cond_1

    .line 179
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "StorageMonitor.isStorageMounted(): can\'t find stroage dir for["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 200
    :cond_0
    :goto_0
    return v4

    .line 184
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 185
    .local v3, storageDirPath:Ljava/lang/String;
    const-string v5, "storage"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/storage/StorageManager;

    .line 186
    .local v0, sm:Landroid/os/storage/StorageManager;
    invoke-virtual {v0, v3}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, state:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SystemUtils.isExternalStorageMounted(): ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]=>["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 192
    const-string v5, "mounted"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SystemUtils.isExternalStorageMounted(): check unmounting["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v3}, Lcom/mediatek/bluetooth/BluetoothReceiver;->isPathMounted(Ljava/lang/String;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 198
    invoke-static {v3}, Lcom/mediatek/bluetooth/BluetoothReceiver;->isPathMounted(Ljava/lang/String;)Z

    move-result v4

    goto :goto_0
.end method

.method public static isSupportedDataType(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Z
    .locals 4
    .parameter "context"
    .parameter "data"
    .parameter "mimeType"

    .prologue
    .line 421
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 422
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 423
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/high16 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 425
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 427
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot find proper Activity to handle Intent: mime["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "], data["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 428
    const/4 v2, 0x0

    .line 430
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static screen(Landroid/content/Context;J)V
    .locals 4
    .parameter "context"
    .parameter "milliseconds"

    .prologue
    .line 501
    const-string v2, "power"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 502
    .local v0, pm:Landroid/os/PowerManager;
    const/16 v2, 0xa

    const-string v3, "SystemUtilsScreenLock"

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    .line 503
    .local v1, wl:Landroid/os/PowerManager$WakeLock;
    invoke-virtual {v1, p1, p2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 505
    return-void
.end method

.method public static sound(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 497
    return-void
.end method

.method public static startVibration(Landroid/content/Context;J)V
    .locals 2
    .parameter "context"
    .parameter "milliseconds"

    .prologue
    .line 462
    const-string v1, "vibrator"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 463
    .local v0, v:Landroid/os/Vibrator;
    if-nez v0, :cond_0

    .line 465
    const-string v1, "startVibration error: cna\'t find VIBRATOR_SERVICE"

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 469
    :goto_0
    return-void

    .line 468
    :cond_0
    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V

    goto :goto_0
.end method

.method public static startVibration(Landroid/content/Context;[JI)V
    .locals 2
    .parameter "context"
    .parameter "pattern"
    .parameter "repeat"

    .prologue
    .line 473
    const-string v1, "vibrator"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 474
    .local v0, v:Landroid/os/Vibrator;
    if-nez v0, :cond_0

    .line 476
    const-string v1, "startVibration error: cna\'t find VIBRATOR_SERVICE"

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 480
    :goto_0
    return-void

    .line 479
    :cond_0
    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate([JI)V

    goto :goto_0
.end method

.method public static stopVibration(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 484
    const-string v1, "vibrator"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 485
    .local v0, v:Landroid/os/Vibrator;
    if-nez v0, :cond_0

    .line 487
    const-string v1, "stopVibration error: can\'t find VIBRATOR_SERVICE"

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 491
    :goto_0
    return-void

    .line 490
    :cond_0
    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    goto :goto_0
.end method

.method public static trimFilenameWithLength(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .parameter "filename"
    .parameter "maxLength"

    .prologue
    .line 344
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SystemUtils.trimFilenameWithLength(): ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 347
    if-nez p0, :cond_1

    .line 348
    const-string p0, ""

    .line 362
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 351
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    if-le v1, p1, :cond_0

    .line 357
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 359
    .local v0, currentEnd:I
    :cond_2
    const/4 v1, 0x0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 360
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    if-gt v1, p1, :cond_2

    goto :goto_0
.end method
