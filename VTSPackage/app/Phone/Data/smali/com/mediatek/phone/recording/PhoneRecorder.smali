.class public Lcom/mediatek/phone/recording/PhoneRecorder;
.super Lcom/mediatek/phone/recording/Recorder;
.source "PhoneRecorder.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# static fields
.field private static final AUDIO_3GPP:Ljava/lang/String; = "audio/3gpp"

.field private static final AUDIO_AMR:Ljava/lang/String; = "audio/amr"

.field private static final AUDIO_ANY:Ljava/lang/String; = "audio/*"

.field private static final AUDIO_DB_TITLE_FORMAT:Ljava/lang/String; = "yyyy-MM-dd HH:mm:ss"

.field public static final LOW_STORAGE_THRESHOLD:J = 0x80000L

.field private static final TAG:Ljava/lang/String; = "PhoneRecorder"

.field private static sFlagRecord:Z

.field private static sLock:[B

.field private static sPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

.field private static sSDcardFullFlag:Z


# instance fields
.field private mAlertDialog:Landroid/app/AlertDialog;

.field private mAudioDBPlaylistName:Ljava/lang/String;

.field private mConnection:Landroid/media/MediaScannerConnection;

.field private mContext:Landroid/content/Context;

.field mMaxFileSize:J

.field mRequestedType:Ljava/lang/String;

.field mSampleInterrupted:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sLock:[B

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/mediatek/phone/recording/Recorder;-><init>()V

    .line 78
    const-string v0, "audio/3gpp"

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mRequestedType:Ljava/lang/String;

    .line 79
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mMaxFileSize:J

    .line 93
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    .line 94
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    const v1, 0x7f0d0009

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mAudioDBPlaylistName:Ljava/lang/String;

    .line 95
    new-instance v0, Landroid/media/MediaScannerConnection;

    invoke-direct {v0, p1, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mConnection:Landroid/media/MediaScannerConnection;

    .line 96
    return-void
.end method

.method private addToMediaDB(Ljava/io/File;)Landroid/net/Uri;
    .locals 17
    .parameter "file"

    .prologue
    .line 263
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 264
    .local v5, cv:Landroid/content/ContentValues;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 265
    .local v3, current:J
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    .line 266
    .local v7, modDate:J
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 268
    .local v6, date:Ljava/util/Date;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    invoke-static {v14}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v12

    .line 269
    .local v12, sTime:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    invoke-static {v14}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v11

    .line 270
    .local v11, sDate:Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 280
    .local v13, title:Ljava/lang/String;
    const-string v14, "_data"

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v5, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string v14, "mime_type"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/phone/recording/PhoneRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v5, v14, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    .line 291
    .local v9, resolver:Landroid/content/ContentResolver;
    sget-object v2, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 293
    .local v2, base:Landroid/net/Uri;
    invoke-virtual {v9, v2, v5}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v10

    .line 295
    .local v10, result:Landroid/net/Uri;
    if-nez v10, :cond_1

    .line 296
    const-string v14, "PhoneRecorder"

    const-string v15, "----- Unable to save recorded audio !!"

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    const/4 v10, 0x0

    .line 312
    .end local v10           #result:Landroid/net/Uri;
    :cond_0
    :goto_0
    return-object v10

    .line 300
    .restart local v10       #result:Landroid/net/Uri;
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->getPlaylistId()I

    move-result v14

    const/4 v15, -0x1

    if-ne v14, v15, :cond_2

    .line 301
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/mediatek/phone/recording/PhoneRecorder;->createPlaylist(Landroid/content/ContentResolver;)Landroid/net/Uri;

    .line 303
    :cond_2
    invoke-virtual {v10}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 304
    .local v1, audioId:I
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->getPlaylistId()I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v1, v14, v15}, Lcom/mediatek/phone/recording/PhoneRecorder;->addToPlaylist(Landroid/content/ContentResolver;IJ)V

    .line 308
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    new-instance v15, Landroid/content/Intent;

    const-string v16, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v14, v15}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 309
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/phone/recording/PhoneRecorder;->mConnection:Landroid/media/MediaScannerConnection;

    if-eqz v14, :cond_0

    .line 310
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/phone/recording/PhoneRecorder;->mConnection:Landroid/media/MediaScannerConnection;

    invoke-virtual {v14}, Landroid/media/MediaScannerConnection;->connect()V

    goto :goto_0
.end method

.method private addToPlaylist(Landroid/content/ContentResolver;IJ)V
    .locals 10
    .parameter "resolver"
    .parameter "audioId"
    .parameter "playlistId"

    .prologue
    const/4 v9, 0x0

    const/4 v3, 0x0

    .line 369
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "count(*)"

    aput-object v0, v2, v9

    .line 370
    .local v2, cols:[Ljava/lang/String;
    const-string v0, "external"

    invoke-static {v0, p3, p4}, Landroid/provider/MediaStore$Audio$Playlists$Members;->getContentUri(Ljava/lang/String;J)Landroid/net/Uri;

    move-result-object v1

    .local v1, uri:Landroid/net/Uri;
    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    .line 371
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 372
    .local v7, cur:Landroid/database/Cursor;
    if-eqz v7, :cond_0

    .line 373
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 374
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 375
    .local v6, base:I
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 376
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 377
    .local v8, values:Landroid/content/ContentValues;
    const-string v0, "play_order"

    add-int v3, v6, p2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 378
    const-string v0, "audio_id"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v8, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 379
    invoke-virtual {p1, v1, v8}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 381
    .end local v6           #base:I
    .end local v8           #values:Landroid/content/ContentValues;
    :cond_0
    return-void
.end method

.method private createPlaylist(Landroid/content/ContentResolver;)Landroid/net/Uri;
    .locals 4
    .parameter "resolver"

    .prologue
    .line 351
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 352
    .local v0, cv:Landroid/content/ContentValues;
    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    const v3, 0x7f0d0009

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mAudioDBPlaylistName:Ljava/lang/String;

    .line 353
    const-string v2, "name"

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mAudioDBPlaylistName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    const-string v2, "external"

    invoke-static {v2}, Landroid/provider/MediaStore$Audio$Playlists;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 355
    .local v1, uri:Landroid/net/Uri;
    if-nez v1, :cond_0

    .line 356
    const-string v2, "PhoneRecorder"

    const-string v3, "---- Unable to save recorded audio -----"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    :cond_0
    return-object v1
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/mediatek/phone/recording/PhoneRecorder;
    .locals 2
    .parameter "context"

    .prologue
    .line 112
    sget-object v1, Lcom/mediatek/phone/recording/PhoneRecorder;->sLock:[B

    monitor-enter v1

    .line 113
    :try_start_0
    sget-object v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    if-nez v0, :cond_0

    .line 114
    new-instance v0, Lcom/mediatek/phone/recording/PhoneRecorder;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/recording/PhoneRecorder;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    .line 116
    :cond_0
    sget-object v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    monitor-exit v1

    return-object v0

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private getPlaylistId()I
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v9, 0x0

    .line 320
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Audio$Playlists;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 321
    .local v1, uri:Landroid/net/Uri;
    new-array v2, v5, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v9

    .line 324
    .local v2, ids:[Ljava/lang/String;
    const-string v8, "name=?"

    .line 325
    .local v8, where:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    const v3, 0x7f0d0009

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mAudioDBPlaylistName:Ljava/lang/String;

    .line 326
    new-array v4, v5, [Ljava/lang/String;

    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mAudioDBPlaylistName:Ljava/lang/String;

    aput-object v0, v4, v9

    .line 329
    .local v4, args:[Ljava/lang/String;
    const-string v3, "name=?"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/mediatek/phone/recording/PhoneRecorder;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 330
    .local v6, cursor:Landroid/database/Cursor;
    if-nez v6, :cond_0

    .line 331
    const-string v0, "PhoneRecorder"

    const-string v3, "query returns null"

    invoke-static {v0, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    :cond_0
    const/4 v7, -0x1

    .line 334
    .local v7, id:I
    if-eqz v6, :cond_2

    .line 335
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 336
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_1

    .line 337
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 339
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 341
    :cond_2
    return v7
.end method

.method public static isRecording()Z
    .locals 1

    .prologue
    .line 141
    sget-boolean v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sFlagRecord:Z

    return v0
.end method

.method private query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    const/4 v7, 0x0

    .line 395
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 396
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move-object v1, v7

    .line 401
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :goto_0
    return-object v1

    .restart local v0       #resolver:Landroid/content/ContentResolver;
    :cond_0
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 399
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 400
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :catch_0
    move-exception v6

    .local v6, ex:Ljava/lang/UnsupportedOperationException;
    move-object v1, v7

    .line 401
    goto :goto_0
.end method

.method public static sdcardFullFlag()Z
    .locals 2

    .prologue
    .line 229
    const-wide/32 v0, 0x200000

    invoke-static {v0, v1}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(J)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sSDcardFullFlag:Z

    .line 230
    sget-boolean v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sSDcardFullFlag:Z

    return v0

    .line 229
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public ismFlagRecord()Z
    .locals 1

    .prologue
    .line 125
    sget-boolean v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sFlagRecord:Z

    return v0
.end method

.method public log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 430
    const-string v0, "PhoneRecorder"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    return-void
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 2
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 406
    const-string v0, "PhoneRecorder"

    const-string v1, "MediaRecorder error..."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    return-void
.end method

.method public onMediaScannerConnected()V
    .locals 4

    .prologue
    .line 415
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mConnection:Landroid/media/MediaScannerConnection;

    if-eqz v1, :cond_0

    .line 416
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->sampleFile()Ljava/io/File;

    move-result-object v0

    .line 417
    .local v0, file:Ljava/io/File;
    if-eqz v0, :cond_0

    .line 418
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mConnection:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    .end local v0           #file:Ljava/io/File;
    :cond_0
    return-void
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 1
    .parameter "path"
    .parameter "uri"

    .prologue
    .line 424
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mConnection:Landroid/media/MediaScannerConnection;

    if-eqz v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mConnection:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 427
    :cond_0
    return-void
.end method

.method public saveSample()Z
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 240
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->sampleLength()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    .line 254
    :cond_0
    :goto_0
    return v2

    .line 243
    :cond_1
    const/4 v1, 0x0

    .line 245
    .local v1, uri:Landroid/net/Uri;
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->sampleFile()Ljava/io/File;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/phone/recording/PhoneRecorder;->addToMediaDB(Ljava/io/File;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 250
    if-eqz v1, :cond_0

    .line 254
    const/4 v2, 0x1

    goto :goto_0

    .line 246
    :catch_0
    move-exception v0

    .line 248
    .local v0, ex:Ljava/lang/UnsupportedOperationException;
    goto :goto_0
.end method

.method public setMContext(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 103
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    .line 104
    return-void
.end method

.method public setmFlagRecord(Z)V
    .locals 0
    .parameter "flag"

    .prologue
    .line 133
    sput-boolean p1, Lcom/mediatek/phone/recording/PhoneRecorder;->sFlagRecord:Z

    .line 134
    return-void
.end method

.method public startRecord()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 145
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startRecord, mRequestedType = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/phone/recording/PhoneRecorder;->log(Ljava/lang/String;)V

    .line 146
    sget-boolean v2, Lcom/mediatek/phone/recording/PhoneRecorder;->sFlagRecord:Z

    if-eqz v2, :cond_0

    .line 175
    :goto_0
    return-void

    .line 149
    :cond_0
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isExternalStorageMounted()Z

    move-result v2

    if-nez v2, :cond_1

    .line 150
    iput-boolean v4, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mSampleInterrupted:Z

    .line 151
    const-string v2, "PhoneRecorder"

    const-string v3, "-----Please insert an SD card----"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 152
    :cond_1
    const-wide/32 v2, 0x200000

    invoke-static {v2, v3}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(J)Z

    move-result v2

    if-nez v2, :cond_2

    .line 153
    iput-boolean v4, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mSampleInterrupted:Z

    .line 154
    const-string v2, "PhoneRecorder"

    const-string v3, "--------Storage is full-------"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 157
    :cond_2
    :try_start_0
    const-string v2, "audio/amr"

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 158
    const/4 v2, 0x3

    const-string v3, ".amr"

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorder;->startRecording(ILjava/lang/String;)V

    .line 168
    :goto_1
    sget-object v2, Lcom/mediatek/phone/recording/PhoneRecorder;->sPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorder;->setmFlagRecord(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, oe:Ljava/io/IOException;
    sget-object v2, Lcom/mediatek/phone/recording/PhoneRecorder;->sPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    invoke-virtual {v2, v5}, Lcom/mediatek/phone/recording/PhoneRecorder;->setmFlagRecord(Z)V

    goto :goto_0

    .line 159
    .end local v0           #oe:Ljava/io/IOException;
    :cond_3
    :try_start_1
    const-string v2, "audio/3gpp"

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 160
    const/4 v2, 0x1

    const-string v3, ".3gpp"

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorder;->startRecording(ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 171
    :catch_1
    move-exception v1

    .line 172
    .local v1, re:Ljava/lang/RuntimeException;
    sget-object v2, Lcom/mediatek/phone/recording/PhoneRecorder;->sPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    invoke-virtual {v2, v5}, Lcom/mediatek/phone/recording/PhoneRecorder;->setmFlagRecord(Z)V

    goto :goto_0

    .line 162
    .end local v1           #re:Ljava/lang/RuntimeException;
    :cond_4
    :try_start_2
    const-string v2, "audio/*"

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mRequestedType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 164
    const/4 v2, 0x1

    const-string v3, ".3gpp"

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/phone/recording/PhoneRecorder;->startRecording(ILjava/lang/String;)V

    goto :goto_1

    .line 166
    :cond_5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid output file type requested"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 178
    sget-boolean v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sFlagRecord:Z

    if-nez v0, :cond_0

    .line 183
    :goto_0
    return-void

    .line 181
    :cond_0
    invoke-super {p0}, Lcom/mediatek/phone/recording/Recorder;->stop()V

    .line 182
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/phone/recording/PhoneRecorder;->sFlagRecord:Z

    goto :goto_0
.end method

.method public stopRecord(Z)V
    .locals 6
    .parameter "mount"

    .prologue
    const/4 v5, 0x1

    .line 190
    sget-boolean v1, Lcom/mediatek/phone/recording/PhoneRecorder;->sFlagRecord:Z

    if-nez v1, :cond_0

    .line 222
    :goto_0
    return-void

    .line 193
    :cond_0
    const-string v1, "stopRecord"

    invoke-virtual {p0, v1}, Lcom/mediatek/phone/recording/PhoneRecorder;->log(Ljava/lang/String;)V

    .line 194
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->stop()V

    .line 196
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    .line 197
    .local v0, app:Lcom/android/phone/PhoneGlobals;
    if-eqz p1, :cond_2

    .line 198
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->saveSample()Z

    .line 199
    sget-boolean v1, Lcom/mediatek/phone/recording/PhoneRecorder;->sSDcardFullFlag:Z

    if-eqz v1, :cond_1

    .line 200
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d000d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 209
    :cond_1
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d000e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/phone/recording/Recorder;->recordFilePatch:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 215
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->delete()V

    .line 216
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorder;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d000b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
