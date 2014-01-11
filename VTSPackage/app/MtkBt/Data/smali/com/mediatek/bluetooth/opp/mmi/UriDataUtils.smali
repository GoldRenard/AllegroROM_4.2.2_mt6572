.class public Lcom/mediatek/bluetooth/opp/mmi/UriDataUtils;
.super Ljava/lang/Object;
.source "UriDataUtils.java"


# static fields
.field private static final CALENDAR_AUTHORITY:Ljava/lang/String; = "com.mediatek.calendarimporter"

.field private static final OPPC_PUSH_TEMP_FILENAME:Ljava/lang/String; = "__OPPC_PuSH_"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeUriData(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 4
    .parameter "context"
    .parameter "uri"

    .prologue
    .line 277
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 279
    .local v1, scheme:Ljava/lang/String;
    const-string v2, "content"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 281
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 284
    .local v0, authority:Ljava/lang/String;
    const-string v2, "com.android.contacts"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "com.mediatek.calendarimporter"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 286
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "__OPPC_PuSH_"

    invoke-virtual {v2, v3}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 289
    .end local v0           #authority:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public static copyStreamContent(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 6
    .parameter "in"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    const-wide/16 v2, 0x0

    .line 257
    .local v2, total:J
    const/16 v4, 0x200

    new-array v0, v4, [B

    .line 259
    .local v0, buf:[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, read:I
    const/4 v4, -0x1

    if-eq v1, v4, :cond_0

    .line 261
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 262
    int-to-long v4, v1

    add-long/2addr v2, v4

    goto :goto_0

    .line 264
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 265
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 266
    return-wide v2
.end method

.method public static getPushTempFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "authority"

    .prologue
    .line 299
    const/4 v1, 0x0

    .line 301
    .local v1, tempFileName:Ljava/lang/String;
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMdd_hhmmss"

    invoke-direct {v2, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 302
    .local v2, tempFormatter:Ljava/text/SimpleDateFormat;
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 303
    .local v0, curDate:Ljava/util/Date;
    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 306
    .local v3, timeStr:Ljava/lang/String;
    const-string v4, "com.android.contacts"

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 308
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".vcf"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 317
    :goto_0
    return-object v1

    .line 309
    :cond_0
    const-string v4, "com.mediatek.calendarimporter"

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 311
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".vcs"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 314
    :cond_1
    move-object v1, v3

    goto :goto_0
.end method

.method public static getUriData(Landroid/content/Context;Landroid/net/Uri;)Lcom/mediatek/bluetooth/opp/mmi/UriData;
    .locals 18
    .parameter "context"
    .parameter "uri"

    .prologue
    .line 66
    const/4 v9, 0x0

    .line 67
    .local v9, cursor:Landroid/database/Cursor;
    const/4 v12, 0x0

    .line 69
    .local v12, result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v14

    .line 72
    .local v14, scheme:Ljava/lang/String;
    const-string v2, "file"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - File: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 76
    new-instance v12, Lcom/mediatek/bluetooth/opp/mmi/UriData;

    .end local v12           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    move-object/from16 v0, p1

    invoke-direct {v12, v0}, Lcom/mediatek/bluetooth/opp/mmi/UriData;-><init>(Landroid/net/Uri;)V

    .line 77
    .restart local v12       #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setData(Ljava/lang/String;)V

    .line 78
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setName(Ljava/lang/String;)V

    .line 79
    new-instance v2, Ljava/io/File;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v12, v2, v3}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setSize(J)V

    move-object v13, v12

    .line 177
    :cond_0
    :goto_0
    return-object v13

    .line 81
    :cond_1
    const-string v2, "content"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - Content: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 85
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v8

    .line 89
    .local v8, authority:Ljava/lang/String;
    const-string v2, "com.android.contacts"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "com.mediatek.calendarimporter"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 91
    :cond_2
    const/4 v2, 0x2

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "_size"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "_display_name"

    aput-object v3, v4, v2

    .line 103
    .local v4, projection:[Ljava/lang/String;
    :goto_1
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 105
    if-eqz v9, :cond_3

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-nez v2, :cond_5

    .line 107
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - no query result for content uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 108
    const/4 v13, 0x0

    .line 157
    if-eqz v9, :cond_0

    .line 158
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 96
    .end local v4           #projection:[Ljava/lang/String;
    :cond_4
    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "_size"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "_display_name"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "_data"

    aput-object v3, v4, v2

    .restart local v4       #projection:[Ljava/lang/String;
    goto :goto_1

    .line 111
    :cond_5
    :try_start_1
    new-instance v13, Lcom/mediatek/bluetooth/opp/mmi/UriData;

    move-object/from16 v0, p1

    invoke-direct {v13, v0}, Lcom/mediatek/bluetooth/opp/mmi/UriData;-><init>(Landroid/net/Uri;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 112
    .end local v12           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    .local v13, result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :try_start_2
    const-string v2, "_display_name"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setName(Ljava/lang/String;)V

    .line 113
    const-string v2, "_size"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v13, v2, v3}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setSize(J)V

    .line 118
    const-string v2, "com.android.contacts"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    const-string v2, "com.mediatek.calendarimporter"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 121
    :cond_6
    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/UriDataUtils;->getPushTempFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setName(Ljava/lang/String;)V

    .line 122
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "__OPPC_PuSH_"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setData(Ljava/lang/String;)V

    .line 124
    invoke-virtual {v13}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->getSize()J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-wide v2

    const-wide/16 v5, 0x0

    cmp-long v2, v2, v5

    if-nez v2, :cond_8

    .line 126
    const/4 v11, 0x0

    .line 128
    .local v11, in:Ljava/io/InputStream;
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v11

    .line 129
    if-eqz v11, :cond_7

    .line 131
    invoke-virtual {v11}, Ljava/io/InputStream;->available()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v13, v2, v3}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setSize(J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 140
    :cond_7
    if-eqz v11, :cond_8

    .line 142
    :try_start_4
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 157
    .end local v11           #in:Ljava/io/InputStream;
    :cond_8
    :goto_2
    if-eqz v9, :cond_9

    .line 158
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_9
    move-object v12, v13

    .end local v13           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    .restart local v12       #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    goto/16 :goto_0

    .line 143
    .end local v12           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    .restart local v11       #in:Ljava/io/InputStream;
    .restart local v13       #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :catch_0
    move-exception v10

    .line 145
    .local v10, ex:Ljava/io/IOException;
    :try_start_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - fail to close input-stream for uri["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 157
    .end local v10           #ex:Ljava/io/IOException;
    .end local v11           #in:Ljava/io/InputStream;
    :catchall_0
    move-exception v2

    move-object v12, v13

    .end local v13           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    .restart local v12       #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :goto_3
    if-eqz v9, :cond_a

    .line 158
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_a
    throw v2

    .line 133
    .end local v12           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    .restart local v11       #in:Ljava/io/InputStream;
    .restart local v13       #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :catch_1
    move-exception v10

    .line 135
    .local v10, ex:Ljava/io/FileNotFoundException;
    :try_start_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - get Contact vCard fail: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v10}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 140
    if-eqz v11, :cond_8

    .line 142
    :try_start_7
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_2

    .line 143
    :catch_2
    move-exception v10

    .line 145
    .local v10, ex:Ljava/io/IOException;
    :try_start_8
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - fail to close input-stream for uri["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_2

    .line 136
    .end local v10           #ex:Ljava/io/IOException;
    :catch_3
    move-exception v10

    .line 137
    .restart local v10       #ex:Ljava/io/IOException;
    :try_start_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - get Contact vCard fail: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 140
    if-eqz v11, :cond_8

    .line 142
    :try_start_a
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    goto/16 :goto_2

    .line 143
    :catch_4
    move-exception v10

    .line 145
    :try_start_b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - fail to close input-stream for uri["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_2

    .line 140
    .end local v10           #ex:Ljava/io/IOException;
    :catchall_1
    move-exception v2

    if-eqz v11, :cond_b

    .line 142
    :try_start_c
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_5

    .line 146
    :cond_b
    :goto_4
    :try_start_d
    throw v2

    .line 143
    :catch_5
    move-exception v10

    .line 145
    .restart local v10       #ex:Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getUriData() - fail to close input-stream for uri["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "]"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    goto :goto_4

    .line 152
    .end local v10           #ex:Ljava/io/IOException;
    .end local v11           #in:Ljava/io/InputStream;
    :cond_c
    const-string v2, "_data"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setData(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto/16 :goto_2

    .line 161
    .end local v4           #projection:[Ljava/lang/String;
    .end local v8           #authority:Ljava/lang/String;
    .end local v13           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    .restart local v12       #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :cond_d
    const-string v2, "btlink"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 163
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - LinkShare: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 164
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v17

    .line 165
    .local v17, text:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v15

    .line 166
    .local v15, subject:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v15, v1}, Lcom/mediatek/bluetooth/opp/mmi/Utils;->createContextFileForText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/net/Uri;

    move-result-object v16

    .line 167
    .local v16, tempFileUri:Landroid/net/Uri;
    if-eqz v16, :cond_e

    .line 169
    new-instance v12, Lcom/mediatek/bluetooth/opp/mmi/UriData;

    .end local v12           #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    move-object/from16 v0, p1

    invoke-direct {v12, v0}, Lcom/mediatek/bluetooth/opp/mmi/UriData;-><init>(Landroid/net/Uri;)V

    .line 170
    .restart local v12       #result:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setData(Ljava/lang/String;)V

    .line 171
    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setName(Ljava/lang/String;)V

    .line 172
    new-instance v2, Ljava/io/File;

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v12, v2, v3}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->setSize(J)V

    :cond_e
    move-object v13, v12

    .line 174
    goto/16 :goto_0

    .line 176
    .end local v15           #subject:Ljava/lang/String;
    .end local v16           #tempFileUri:Landroid/net/Uri;
    .end local v17           #text:Ljava/lang/String;
    :cond_f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getUriData() - unsupported uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 177
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 157
    .restart local v4       #projection:[Ljava/lang/String;
    .restart local v8       #authority:Ljava/lang/String;
    :catchall_2
    move-exception v2

    goto/16 :goto_3
.end method

.method public static openUriData(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 13
    .parameter "context"
    .parameter "uri"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 190
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    .line 193
    .local v4, scheme:Ljava/lang/String;
    const-string v10, "file"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    move v9, v8

    .line 241
    :goto_0
    return v9

    .line 197
    :cond_0
    const-string v10, "content"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 199
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, authority:Ljava/lang/String;
    const-string v10, "media"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    move v9, v8

    .line 205
    goto :goto_0

    .line 206
    :cond_1
    const-string v10, "com.android.contacts"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    const-string v10, "com.mediatek.calendarimporter"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 212
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    invoke-virtual {v10, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 213
    .local v2, in:Ljava/io/InputStream;
    if-nez v2, :cond_3

    .line 214
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "openUriData() - open Contact file fail: openInputStream("

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, ") return null"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 221
    .end local v2           #in:Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 223
    .local v1, ex:Ljava/io/FileNotFoundException;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "openUriData() - open Contact file fail: "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 217
    .end local v1           #ex:Ljava/io/FileNotFoundException;
    .restart local v2       #in:Ljava/io/InputStream;
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    const-string v11, "__OPPC_PuSH_"

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v3

    .line 219
    .local v3, out:Ljava/io/FileOutputStream;
    invoke-static {v2, v3}, Lcom/mediatek/bluetooth/opp/mmi/UriDataUtils;->copyStreamContent(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move v9, v8

    .line 220
    goto :goto_0

    .line 225
    .end local v2           #in:Ljava/io/InputStream;
    .end local v3           #out:Ljava/io/FileOutputStream;
    :catch_1
    move-exception v1

    .line 226
    .local v1, ex:Ljava/io/IOException;
    goto :goto_0

    .line 229
    .end local v1           #ex:Ljava/io/IOException;
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "openUriData() - unsupported content uri: "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 232
    .end local v0           #authority:Ljava/lang/String;
    :cond_5
    const-string v10, "btlink"

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 234
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "getUriData() - LinkShare: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 235
    invoke-virtual {p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v7

    .line 236
    .local v7, text:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v5

    .line 237
    .local v5, subject:Ljava/lang/String;
    invoke-static {p0, v5, v7}, Lcom/mediatek/bluetooth/opp/mmi/Utils;->createContextFileForText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/net/Uri;

    move-result-object v6

    .line 238
    .local v6, tempFileUri:Landroid/net/Uri;
    if-eqz v6, :cond_6

    :goto_1
    move v9, v8

    goto/16 :goto_0

    :cond_6
    move v8, v9

    goto :goto_1

    .line 240
    .end local v5           #subject:Ljava/lang/String;
    .end local v6           #tempFileUri:Landroid/net/Uri;
    .end local v7           #text:Ljava/lang/String;
    :cond_7
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "openUriData() - unsupported uri: "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    goto/16 :goto_0
.end method
