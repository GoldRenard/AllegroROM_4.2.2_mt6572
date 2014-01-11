.class public Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;
.super Ljava/lang/Object;
.source "BTAvrcpBrowseAlbum.java"


# static fields
.field public static final ALBUM_TYPE:B = 0x2t

.field public static final ALL_TYPE:B = 0xet

.field public static final ARTIST_TYPE:B = 0x3t

.field public static final EMPTY_TYPE:B = 0xft

.field public static final GENRES_TYPE:B = 0x4t

.field public static final MIX_TYPE:B = 0x0t

.field public static final PLAYLIST_TYPE:B = 0x5t

.field public static final TAG:Ljava/lang/String; = "AVRCP_ALBUM"

.field public static final TITLE_TYPE:B = 0x1t

.field public static final YEAR_TYPE:B = 0x6t


# instance fields
.field private mContext:Landroid/content/Context;

.field private mId:J

.field private mIdList:[J

.field private mIdSubList:[J

.field private mNameList:[Ljava/lang/String;

.field private mPathArray:[Ljava/lang/String;

.field private mSelectId:J

.field private mSubAlbumLis:[Ljava/lang/String;

.field private mSubArtistLis:[Ljava/lang/String;

.field private mSubPathArray:[Ljava/lang/String;

.field private mSubTitleLis:[Ljava/lang/String;

.field private mType:B


# direct methods
.method constructor <init>(JLandroid/content/Context;B)V
    .locals 8
    .parameter "id"
    .parameter "context"
    .parameter "type"

    .prologue
    const-wide/16 v6, 0x0

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 90
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mId:J

    .line 52
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    .line 54
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mNameList:[Ljava/lang/String;

    .line 56
    iput-wide v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    .line 58
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    .line 60
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubTitleLis:[Ljava/lang/String;

    .line 62
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubArtistLis:[Ljava/lang/String;

    .line 64
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubAlbumLis:[Ljava/lang/String;

    .line 88
    iput-byte v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    .line 91
    iput-wide p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mId:J

    .line 92
    iput-object p3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mContext:Landroid/content/Context;

    .line 93
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->resetSubFolder()V

    .line 94
    iput-byte p4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    .line 96
    new-array v0, v5, [Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    .line 97
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    .line 98
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    const-string v1, "root"

    aput-object v1, v0, v4

    .line 99
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    const-string v1, "root"

    aput-object v1, v0, v4

    .line 101
    sparse-switch p4, :sswitch_data_0

    .line 120
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    .line 121
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    .line 125
    :goto_0
    iget-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mId:J

    cmp-long v0, v6, v0

    if-nez v0, :cond_0

    .line 126
    const-string v0, "AVRCP_ALBUM"

    const-string v1, "[BT][AVRCP] Should not use 0 as Id "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :cond_0
    return-void

    .line 103
    :sswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    const-string v1, "Artist"

    aput-object v1, v0, v3

    .line 104
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    const-string v1, "Artist"

    aput-object v1, v0, v3

    goto :goto_0

    .line 107
    :sswitch_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    const-string v1, "Album"

    aput-object v1, v0, v3

    .line 108
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    const-string v1, "Album"

    aput-object v1, v0, v3

    goto :goto_0

    .line 111
    :sswitch_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    const-string v1, "Empty"

    aput-object v1, v0, v3

    .line 112
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    const-string v1, "Empty"

    aput-object v1, v0, v3

    goto :goto_0

    .line 116
    :sswitch_3
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    const-string v1, "All"

    aput-object v1, v0, v3

    .line 117
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    const-string v1, "All"

    aput-object v1, v0, v3

    goto :goto_0

    .line 101
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_3
        0x2 -> :sswitch_1
        0x3 -> :sswitch_0
        0xe -> :sswitch_3
        0xf -> :sswitch_2
    .end sparse-switch
.end method

.method private destroySubFolder()V
    .locals 1

    .prologue
    .line 148
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    .line 149
    return-void
.end method

.method public static query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 7
    .parameter "context"
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    .line 508
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public static query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;
    .locals 8
    .parameter "context"
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"
    .parameter "limit"

    .prologue
    const/4 v7, 0x0

    .line 492
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 493
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move-object v1, v7

    .line 501
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :goto_0
    return-object v1

    .line 496
    .restart local v0       #resolver:Landroid/content/ContentResolver;
    :cond_0
    if-lez p6, :cond_1

    .line 497
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "limit"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    :cond_1
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 499
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 500
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :catch_0
    move-exception v6

    .local v6, ex:Ljava/lang/UnsupportedOperationException;
    move-object v1, v7

    .line 501
    goto :goto_0
.end method

.method private updateSongs(Landroid/content/Context;)[J
    .locals 10
    .parameter "context"

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 324
    const/4 v9, 0x1

    .line 328
    .local v9, printDetail:Z
    iget-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    sparse-switch v0, :sswitch_data_0

    .line 349
    new-array v2, v5, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v1

    const-string v0, "album"

    aput-object v0, v2, v4

    .line 352
    .local v2, ccols:[Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Albums;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 359
    .local v6, c:Landroid/database/Cursor;
    :goto_0
    if-eqz v6, :cond_0

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    .line 380
    :cond_0
    if-eqz v6, :cond_1

    .line 381
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .end local v2           #ccols:[Ljava/lang/String;
    .end local v6           #c:Landroid/database/Cursor;
    :cond_1
    :goto_1
    return-object v3

    .line 330
    :sswitch_0
    new-array v0, v1, [J

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    .line 331
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mNameList:[Ljava/lang/String;

    .line 332
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    goto :goto_1

    .line 335
    :sswitch_1
    new-array v2, v5, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v1

    const-string v0, "artist"

    aput-object v0, v2, v4

    .line 338
    .restart local v2       #ccols:[Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Artists;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 339
    .restart local v6       #c:Landroid/database/Cursor;
    goto :goto_0

    .line 341
    .end local v2           #ccols:[Ljava/lang/String;
    .end local v6           #c:Landroid/database/Cursor;
    :sswitch_2
    new-array v2, v5, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v1

    const-string v0, "artist"

    aput-object v0, v2, v4

    .line 344
    .restart local v2       #ccols:[Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Artists;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 346
    .restart local v6       #c:Landroid/database/Cursor;
    goto :goto_0

    .line 362
    :cond_2
    :try_start_1
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v8

    .line 363
    .local v8, len:I
    if-lez v8, :cond_3

    .line 364
    new-array v0, v8, [J

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    .line 365
    new-array v0, v8, [Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mNameList:[Ljava/lang/String;

    .line 367
    const/4 v7, 0x0

    .local v7, i:I
    :goto_2
    if-ge v7, v8, :cond_3

    .line 369
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    .line 371
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    aput-wide v3, v0, v7

    .line 372
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mNameList:[Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v7

    .line 367
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 377
    .end local v7           #i:I
    :cond_3
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 380
    if-eqz v6, :cond_1

    .line 381
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 380
    .end local v8           #len:I
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 381
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0

    .line 328
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_2
        0xe -> :sswitch_1
        0xf -> :sswitch_0
    .end sparse-switch
.end method

.method private updateSubSongs(Landroid/content/Context;J)[J
    .locals 15
    .parameter "context"
    .parameter "selectedId"

    .prologue
    .line 424
    const/4 v12, 0x1

    .line 425
    .local v12, printDetail:Z
    const/4 v2, 0x4

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "_id"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "title"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "artist"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, "album"

    aput-object v3, v4, v2

    .line 430
    .local v4, ccols:[Ljava/lang/String;
    iget-byte v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    sparse-switch v2, :sswitch_data_0

    .line 444
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "album_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "is_music"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "=1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 450
    .local v5, where:Ljava/lang/String;
    :goto_0
    sget-object v3, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    const-string v7, "track"

    move-object/from16 v2, p1

    invoke-static/range {v2 .. v7}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 454
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_0

    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_2

    .line 455
    :cond_0
    const/4 v2, 0x0

    .line 483
    if-eqz v8, :cond_1

    .line 484
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .end local v5           #where:Ljava/lang/String;
    .end local v8           #c:Landroid/database/Cursor;
    :cond_1
    :goto_1
    return-object v2

    .line 432
    :sswitch_0
    const/4 v2, 0x0

    new-array v2, v2, [J

    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    .line 433
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    goto :goto_1

    .line 436
    :sswitch_1
    const-string v5, "is_music=1"

    .line 437
    .restart local v5       #where:Ljava/lang/String;
    goto :goto_0

    .line 439
    .end local v5           #where:Ljava/lang/String;
    :sswitch_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "artist_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "is_music"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "=1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 441
    .restart local v5       #where:Ljava/lang/String;
    goto :goto_0

    .line 457
    .restart local v8       #c:Landroid/database/Cursor;
    :cond_2
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v11

    .line 458
    .local v11, len:I
    if-lez v11, :cond_4

    .line 459
    new-array v2, v11, [J

    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    .line 460
    new-array v2, v11, [Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubTitleLis:[Ljava/lang/String;

    .line 461
    new-array v2, v11, [Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubArtistLis:[Ljava/lang/String;

    .line 462
    new-array v2, v11, [Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubAlbumLis:[Ljava/lang/String;

    .line 464
    const/4 v10, 0x0

    .local v10, i:I
    :goto_2
    if-ge v10, v11, :cond_4

    .line 466
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 468
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    const/4 v3, 0x0

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    aput-wide v6, v2, v10

    .line 469
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubTitleLis:[Ljava/lang/String;

    const/4 v3, 0x1

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v10

    .line 470
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubArtistLis:[Ljava/lang/String;

    const/4 v3, 0x2

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v10

    .line 471
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubAlbumLis:[Ljava/lang/String;

    const/4 v3, 0x3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v10

    .line 472
    if-eqz v12, :cond_3

    .line 473
    move-object v9, v8

    .line 474
    .local v9, cursor:Landroid/database/Cursor;
    const-string v2, "AVRCP_ALBUM"

    const-string v3, "[AVRCP][UTIL] id:%d title:%s artist:%s album:%s"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const/4 v13, 0x0

    invoke-interface {v9, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v6, v7

    const/4 v7, 0x1

    const/4 v13, 0x1

    invoke-interface {v9, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v6, v7

    const/4 v7, 0x2

    const/4 v13, 0x2

    invoke-interface {v9, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v6, v7

    const/4 v7, 0x3

    const/4 v13, 0x3

    invoke-interface {v9, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v6, v7

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    .end local v9           #cursor:Landroid/database/Cursor;
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 480
    .end local v10           #i:I
    :cond_4
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 483
    if-eqz v8, :cond_1

    .line 484
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto/16 :goto_1

    .line 483
    .end local v11           #len:I
    :catchall_0
    move-exception v2

    if-eqz v8, :cond_5

    .line 484
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v2

    .line 430
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_2
        0xe -> :sswitch_1
        0xf -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public buildSubFolder()V
    .locals 3

    .prologue
    .line 139
    iget-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 140
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    .line 141
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mContext:Landroid/content/Context;

    const-wide/16 v1, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->updateSubSongs(Landroid/content/Context;J)[J

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    .line 145
    :goto_0
    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->updateSongs(Landroid/content/Context;)[J

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    goto :goto_0
.end method

.method public getAttributeByIndex(II)Ljava/lang/String;
    .locals 5
    .parameter "index"
    .parameter "attrId"

    .prologue
    const/4 v0, 0x0

    .line 292
    const-wide/16 v1, 0x0

    iget-wide v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 294
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    array-length v1, v1

    if-ge p1, v1, :cond_0

    .line 295
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mNameList:[Ljava/lang/String;

    aget-object v0, v0, p1

    .line 312
    :cond_0
    :goto_0
    return-object v0

    .line 298
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    array-length v1, v1

    if-ge p1, v1, :cond_0

    .line 299
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 301
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubTitleLis:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 303
    :pswitch_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubArtistLis:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 305
    :pswitch_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubAlbumLis:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 299
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getCategoryName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 238
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 239
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    .line 241
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "<unknow>"

    goto :goto_0
.end method

.method public getCurPathDepth()I
    .locals 5

    .prologue
    const/4 v0, 0x1

    .line 201
    iget-byte v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    const/16 v2, 0xe

    if-ne v1, v2, :cond_1

    .line 207
    :cond_0
    :goto_0
    return v0

    .line 204
    :cond_1
    const-wide/16 v1, 0x0

    iget-wide v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 207
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public getCurPathItems()I
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 171
    const-wide/16 v1, 0x0

    iget-wide v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    .line 173
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    if-nez v1, :cond_1

    .line 181
    :cond_0
    :goto_0
    return v0

    .line 176
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    array-length v0, v0

    goto :goto_0

    .line 178
    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    if-eqz v1, :cond_0

    .line 181
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    array-length v0, v0

    goto :goto_0
.end method

.method public getCurPaths()[Ljava/lang/String;
    .locals 5

    .prologue
    .line 152
    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mPathArray:[Ljava/lang/String;

    .line 156
    :goto_0
    return-object v0

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    const/4 v1, 0x2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 156
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    goto :goto_0
.end method

.method public getCurrentList()[J
    .locals 5

    .prologue
    .line 160
    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    .line 167
    :goto_0
    return-object v0

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubPathArray:[Ljava/lang/String;

    const/4 v1, 0x2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 167
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    goto :goto_0
.end method

.method public getFolderType()B
    .locals 1

    .prologue
    .line 256
    iget-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    return v0
.end method

.method public getItemAttribute(BJSI)Ljava/lang/String;
    .locals 6
    .parameter "scope"
    .parameter "identifier"
    .parameter "uidCounter"
    .parameter "attrId"

    .prologue
    .line 387
    const/4 v0, 0x0

    .line 389
    .local v0, i:I
    const/4 v2, 0x1

    if-lt p5, v2, :cond_3

    const/4 v2, 0x3

    if-gt p5, v2, :cond_3

    .line 390
    const-wide/16 v2, 0x0

    iget-wide v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 391
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 392
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    aget-wide v2, v2, v0

    cmp-long v2, v2, p2

    if-nez v2, :cond_0

    .line 394
    move v1, v0

    .line 395
    .local v1, index:I
    packed-switch p5, :pswitch_data_0

    .line 391
    .end local v1           #index:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 397
    .restart local v1       #index:I
    :pswitch_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubTitleLis:[Ljava/lang/String;

    aget-object v2, v2, v1

    .line 416
    .end local v1           #index:I
    :goto_1
    return-object v2

    .line 399
    .restart local v1       #index:I
    :pswitch_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubArtistLis:[Ljava/lang/String;

    aget-object v2, v2, v1

    goto :goto_1

    .line 401
    :pswitch_2
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubAlbumLis:[Ljava/lang/String;

    aget-object v2, v2, v1

    goto :goto_1

    .line 408
    .end local v1           #index:I
    :cond_1
    const/4 v0, 0x0

    :goto_2
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 409
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    aget-wide v2, v2, v0

    cmp-long v2, v2, p2

    if-nez v2, :cond_2

    .line 410
    move v1, v0

    .line 411
    .restart local v1       #index:I
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mNameList:[Ljava/lang/String;

    aget-object v2, v2, v1

    goto :goto_1

    .line 408
    .end local v1           #index:I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 416
    :cond_3
    const/4 v2, 0x0

    goto :goto_1

    .line 395
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getNameByIndex(I)Ljava/lang/String;
    .locals 4
    .parameter "index"

    .prologue
    .line 260
    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 262
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    array-length v0, v0

    if-ge p1, v0, :cond_1

    .line 263
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mNameList:[Ljava/lang/String;

    aget-object v0, v0, p1

    .line 285
    :goto_0
    return-object v0

    .line 266
    :cond_0
    iget-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    sparse-switch v0, :sswitch_data_0

    .line 279
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    array-length v0, v0

    if-ge p1, v0, :cond_1

    .line 280
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubAlbumLis:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 268
    :sswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    array-length v0, v0

    if-ge p1, v0, :cond_1

    .line 269
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubTitleLis:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 273
    :sswitch_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    array-length v0, v0

    if-ge p1, v0, :cond_1

    .line 274
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubArtistLis:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    .line 285
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 266
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_1
        0xe -> :sswitch_0
    .end sparse-switch
.end method

.method public getPresentId()J
    .locals 2

    .prologue
    .line 132
    iget-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mId:J

    return-wide v0
.end method

.method public getType()B
    .locals 5

    .prologue
    const/4 v0, 0x3

    .line 245
    iget-byte v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    const/16 v2, 0xe

    if-ne v1, v2, :cond_1

    .line 252
    :cond_0
    :goto_0
    return v0

    .line 249
    :cond_1
    const-wide/16 v1, 0x0

    iget-wide v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 250
    const/4 v0, 0x2

    goto :goto_0
.end method

.method goDown(J)Z
    .locals 6
    .parameter "id"

    .prologue
    const/4 v1, 0x0

    .line 222
    const-wide/16 v2, 0x0

    iget-wide v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 223
    const-string v2, "AVRCP_ALBUM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] goDown reject because has mSelectId:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    :goto_0
    return v1

    .line 226
    :cond_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 227
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdList:[J

    aget-wide v2, v2, v0

    cmp-long v2, v2, p1

    if-nez v2, :cond_1

    .line 228
    iput-wide p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    .line 229
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mContext:Landroid/content/Context;

    invoke-direct {p0, v1, p1, p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->updateSubSongs(Landroid/content/Context;J)[J

    .line 230
    const/4 v1, 0x1

    goto :goto_0

    .line 226
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 233
    :cond_2
    const-string v2, "AVRCP_ALBUM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] goDown fail because not found id:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method goUp()Z
    .locals 4

    .prologue
    .line 316
    const-wide/16 v0, 0x0

    iget-wide v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 317
    const/4 v0, 0x0

    .line 320
    :goto_0
    return v0

    .line 319
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->resetSubFolder()V

    .line 320
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isCategoryRoot()Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    .line 211
    iget-byte v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    const/16 v2, 0xe

    if-ne v1, v2, :cond_1

    .line 217
    :cond_0
    :goto_0
    return v0

    .line 214
    :cond_1
    const-wide/16 v1, 0x0

    iget-wide v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 217
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public resetSubFolder()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 186
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    .line 187
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mIdSubList:[J

    .line 188
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubTitleLis:[Ljava/lang/String;

    .line 189
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubArtistLis:[Ljava/lang/String;

    .line 190
    iput-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSubAlbumLis:[Ljava/lang/String;

    .line 192
    iget-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mType:B

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 193
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->mSelectId:J

    .line 195
    :cond_0
    return-void
.end method
