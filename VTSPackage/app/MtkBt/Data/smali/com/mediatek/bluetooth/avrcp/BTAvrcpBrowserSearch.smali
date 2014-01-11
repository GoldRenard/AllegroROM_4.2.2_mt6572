.class public Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;
.super Ljava/lang/Object;
.source "BTAvrcpBrowserSearch.java"


# static fields
.field private static final EMPTY_LIST:[J = null

.field public static final TAG:Ljava/lang/String; = "AVRCP_UTIL"

.field public static sNum:I


# instance fields
.field private mAddrET:Landroid/widget/EditText;

.field private mContext:Landroid/content/Context;

.field private mSearchAlbum:[Ljava/lang/String;

.field private mSearchArtist:[Ljava/lang/String;

.field private mSearchIDList:[J

.field private mSearchTitle:[Ljava/lang/String;

.field private mToAddrET:Landroid/widget/EditText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 49
    sput v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->sNum:I

    .line 131
    new-array v0, v0, [J

    sput-object v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->EMPTY_LIST:[J

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 60
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mContext:Landroid/content/Context;

    .line 62
    return-void
.end method

.method public static getAllSongs(Landroid/content/Context;)[J
    .locals 17
    .parameter "context"

    .prologue
    .line 245
    const/4 v13, 0x1

    .line 246
    .local v13, printDetail:Z
    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "album"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "artist"

    aput-object v1, v2, v0

    const/4 v0, 0x3

    const-string v1, "title"

    aput-object v1, v2, v0

    .line 251
    .local v2, ccols:[Ljava/lang/String;
    const/4 v6, 0x1

    .line 252
    .local v6, albumIndex:I
    const/4 v14, 0x2

    .line 253
    .local v14, titleIndex:I
    const/4 v7, 0x3

    .line 254
    .local v7, artistIndex:I
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, "is_music=1"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 259
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_0

    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    .line 260
    :cond_0
    const/4 v12, 0x0

    .line 280
    if-eqz v8, :cond_1

    .line 281
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_1
    :goto_0
    return-object v12

    .line 262
    :cond_2
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v11

    .line 263
    .local v11, len:I
    new-array v12, v11, [J

    .line 264
    .local v12, list:[J
    const/4 v10, 0x0

    .local v10, i:I
    :goto_1
    if-ge v10, v11, :cond_4

    .line 268
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 269
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    aput-wide v0, v12, v10

    .line 270
    if-eqz v13, :cond_3

    .line 271
    move-object v9, v8

    .line 272
    .local v9, cursor:Landroid/database/Cursor;
    const-string v0, "AVRCP_UTIL"

    const-string v1, "[UTIL] id:%d album:\'%s\' artist:\'%s\' title:\'%s\' "

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {v9, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-interface {v9, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-interface {v9, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    invoke-interface {v9, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 264
    .end local v9           #cursor:Landroid/database/Cursor;
    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 280
    :cond_4
    if-eqz v8, :cond_1

    .line 281
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 280
    .end local v10           #i:I
    .end local v11           #len:I
    .end local v12           #list:[J
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_5

    .line 281
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v0
.end method

.method public static getSongData(Landroid/content/Context;J)Ljava/lang/String;
    .locals 16
    .parameter "context"
    .parameter "id"

    .prologue
    .line 199
    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "album"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "artist"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "title"

    aput-object v3, v4, v2

    .line 203
    .local v4, ccols:[Ljava/lang/String;
    const-string v8, ""

    .line 208
    .local v8, album:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, p1

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

    .line 210
    .local v5, where:Ljava/lang/String;
    sget-object v3, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    const-string v7, "track"

    move-object/from16 v2, p0

    invoke-static/range {v2 .. v7}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 213
    .local v11, cursor:Landroid/database/Cursor;
    if-eqz v11, :cond_2

    .line 215
    :try_start_0
    const-string v2, "album"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 216
    .local v9, albumIndex:I
    const-string v2, "artist"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    .line 217
    .local v14, titleIndex:I
    const-string v2, "title"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    .line 224
    .local v10, artistIndex:I
    :goto_0
    if-eq v14, v10, :cond_1

    .line 225
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 226
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    .line 227
    invoke-interface {v11, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 232
    :goto_1
    const/4 v13, 0x0

    .local v13, j:I
    :goto_2
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge v13, v2, :cond_1

    .line 233
    const-string v2, "AVRCP_UTIL"

    const-string v3, "[UTIL] found: album:\'%s\' artist:\'%s\' title:\'%s\' "

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-interface {v11, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v7

    const/4 v7, 0x1

    invoke-interface {v11, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v7

    const/4 v7, 0x2

    invoke-interface {v11, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v6, v7

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    .line 232
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 218
    .end local v9           #albumIndex:I
    .end local v10           #artistIndex:I
    .end local v13           #j:I
    .end local v14           #titleIndex:I
    :catch_0
    move-exception v12

    .line 219
    .local v12, ex:Ljava/lang/IllegalArgumentException;
    const/4 v9, 0x0

    .line 220
    .restart local v9       #albumIndex:I
    const/4 v14, 0x0

    .line 221
    .restart local v14       #titleIndex:I
    const/4 v10, 0x0

    .restart local v10       #artistIndex:I
    goto :goto_0

    .line 229
    .end local v12           #ex:Ljava/lang/IllegalArgumentException;
    :cond_0
    const-string v2, "AVRCP_UTIL"

    const-string v3, "[UTIL] query and get empty result !"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 238
    :cond_1
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 239
    const/4 v11, 0x0

    .line 241
    .end local v9           #albumIndex:I
    .end local v10           #artistIndex:I
    .end local v14           #titleIndex:I
    :cond_2
    return-object v8
.end method

.method public static getSongListForAlbum(Landroid/content/Context;J)[J
    .locals 8
    .parameter "context"
    .parameter "id"

    .prologue
    .line 170
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    .line 171
    .local v2, ccols:[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "album_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "is_music"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 173
    .local v3, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const-string v5, "track"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 176
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 177
    invoke-static {v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v7

    .line 178
    .local v7, list:[J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 181
    .end local v7           #list:[J
    :goto_0
    return-object v7

    :cond_0
    sget-object v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->EMPTY_LIST:[J

    goto :goto_0
.end method

.method public static getSongListForArtist(Landroid/content/Context;J)[J
    .locals 8
    .parameter "context"
    .parameter "id"

    .prologue
    .line 154
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    .line 155
    .local v2, ccols:[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "artist_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "is_music"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 157
    .local v3, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const-string v5, "album_key,track"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 161
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 162
    invoke-static {v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v7

    .line 163
    .local v7, list:[J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 166
    .end local v7           #list:[J
    :goto_0
    return-object v7

    :cond_0
    sget-object v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->EMPTY_LIST:[J

    goto :goto_0
.end method

.method public static getSongListForCursor(Landroid/database/Cursor;)[J
    .locals 7
    .parameter "cursor"

    .prologue
    .line 134
    if-nez p0, :cond_1

    .line 135
    sget-object v4, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->EMPTY_LIST:[J

    .line 150
    :cond_0
    return-object v4

    .line 137
    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    .line 138
    .local v3, len:I
    new-array v4, v3, [J

    .line 139
    .local v4, list:[J
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 140
    const/4 v0, -0x1

    .line 142
    .local v0, colidx:I
    :try_start_0
    const-string v5, "audio_id"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 146
    :goto_0
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v3, :cond_0

    .line 147
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    aput-wide v5, v4, v2

    .line 148
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 146
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 143
    .end local v2           #i:I
    :catch_0
    move-exception v1

    .line 144
    .local v1, ex:Ljava/lang/IllegalArgumentException;
    const-string v5, "_id"

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public static getSongListForPlaylist(Landroid/content/Context;J)[J
    .locals 8
    .parameter "context"
    .parameter "plid"

    .prologue
    const/4 v3, 0x0

    .line 185
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "audio_id"

    aput-object v1, v2, v0

    .line 186
    .local v2, ccols:[Ljava/lang/String;
    const-string v0, "external"

    invoke-static {v0, p1, p2}, Landroid/provider/MediaStore$Audio$Playlists$Members;->getContentUri(Ljava/lang/String;J)Landroid/net/Uri;

    move-result-object v1

    const-string v5, "play_order"

    move-object v0, p0

    move-object v4, v3

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 189
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 190
    invoke-static {v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v7

    .line 191
    .local v7, list:[J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 194
    .end local v7           #list:[J
    :goto_0
    return-object v7

    :cond_0
    sget-object v7, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->EMPTY_LIST:[J

    goto :goto_0
.end method

.method private listAllMusic()V
    .locals 9

    .prologue
    .line 103
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getAllSongs(Landroid/content/Context;)[J

    move-result-object v5

    .line 104
    .local v5, list:[J
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-eqz v5, :cond_0

    array-length v6, v5

    if-ge v1, v6, :cond_0

    .line 105
    aget-wide v2, v5, v1

    .line 106
    .local v2, id:J
    const-string v6, "AVRCP_UTIL"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "find id:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 109
    .end local v2           #id:J
    :cond_0
    if-eqz v5, :cond_1

    .line 110
    array-length v0, v5

    .line 114
    .local v0, half:I
    :goto_1
    div-int/lit8 v0, v0, 0x2

    .line 115
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mContext:Landroid/content/Context;

    int-to-long v7, v0

    invoke-static {v6, v7, v8}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSongData(Landroid/content/Context;J)Ljava/lang/String;

    .line 117
    const-string v6, "AVRCP_UTIL"

    const-string v7, "Search empty data "

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mContext:Landroid/content/Context;

    const-string v7, "fdsafsfasfasd"

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSearchSongs(Landroid/content/Context;Ljava/lang/String;)[J

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    .line 119
    const/4 v4, 0x0

    .local v4, j:I
    :goto_2
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    array-length v6, v6

    if-ge v4, v6, :cond_2

    .line 120
    const-string v6, "AVRCP_UTIL"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Search Result "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    aget-object v8, v8, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 112
    .end local v0           #half:I
    .end local v4           #j:I
    :cond_1
    const/4 v0, 0x0

    .restart local v0       #half:I
    goto :goto_1

    .line 123
    .restart local v4       #j:I
    :cond_2
    const-string v6, "AVRCP_UTIL"

    const-string v7, "Search es data "

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mContext:Landroid/content/Context;

    const-string v7, "es"

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSearchSongs(Landroid/content/Context;Ljava/lang/String;)[J

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    .line 125
    const/4 v4, 0x0

    :goto_3
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    array-length v6, v6

    if-ge v4, v6, :cond_3

    .line 126
    const-string v6, "AVRCP_UTIL"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Search Result "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    aget-object v8, v8, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 128
    :cond_3
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
    .line 389
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;

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

    .line 374
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 375
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move-object v1, v7

    .line 383
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :goto_0
    return-object v1

    .line 378
    .restart local v0       #resolver:Landroid/content/ContentResolver;
    :cond_0
    if-lez p6, :cond_1

    .line 379
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

    .line 381
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 382
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :catch_0
    move-exception v6

    .local v6, ex:Ljava/lang/UnsupportedOperationException;
    move-object v1, v7

    .line 383
    goto :goto_0
.end method


# virtual methods
.method public getSearchSongs(Landroid/content/Context;Ljava/lang/String;)[J
    .locals 21
    .parameter "context"
    .parameter "sSearch"

    .prologue
    .line 288
    const/16 v16, 0x1

    .line 289
    .local v16, printDetail:Z
    const/4 v15, 0x0

    .line 291
    .local v15, num:I
    const/4 v2, 0x4

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "_id"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "album"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "artist"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, "title"

    aput-object v3, v4, v2

    .line 296
    .local v4, ccols:[Ljava/lang/String;
    const/4 v8, 0x1

    .line 297
    .local v8, albumIndex:I
    const/16 v18, 0x3

    .line 298
    .local v18, titleIndex:I
    const/4 v9, 0x2

    .line 299
    .local v9, artistIndex:I
    sget-object v3, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v5, "is_music=1"

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p1

    invoke-static/range {v2 .. v7}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 305
    .local v10, c:Landroid/database/Cursor;
    if-eqz p2, :cond_0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    .line 306
    :cond_0
    const-string v2, "AVRCP_UTIL"

    const-string v3, "[UTIL] getSearchSongs wrong parameter"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    if-eqz v10, :cond_1

    .line 308
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 309
    const/4 v10, 0x0

    .line 311
    :cond_1
    sget-object v14, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->EMPTY_LIST:[J

    .line 366
    :cond_2
    :goto_0
    return-object v14

    .line 313
    :cond_3
    const-string v2, "AVRCP_UTIL"

    const-string v3, "[AVRCP] search getSearchSongs"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    if-eqz v10, :cond_4

    :try_start_0
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_5

    .line 316
    :cond_4
    const/4 v14, 0x0

    .line 364
    if-eqz v10, :cond_2

    .line 365
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 366
    const/4 v10, 0x0

    goto :goto_0

    .line 318
    :cond_5
    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v13

    .line 320
    .local v13, len:I
    const/4 v12, 0x0

    .local v12, i:I
    :goto_1
    if-ge v12, v13, :cond_7

    .line 321
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    .line 323
    move/from16 v0, v18

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 324
    .local v17, scompare:Ljava/lang/String;
    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_6

    .line 326
    add-int/lit8 v15, v15, 0x1

    .line 327
    if-eqz v16, :cond_6

    .line 328
    move-object v11, v10

    .line 329
    .local v11, cursor:Landroid/database/Cursor;
    const-string v2, "AVRCP_UTIL"

    const-string v3, "[UTIL] id:%d album:\'%s\' artist:\'%s\' title:\'%s\' "

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface {v11, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    move/from16 v0, v18

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-interface {v11, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    invoke-interface {v11, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    .end local v11           #cursor:Landroid/database/Cursor;
    :cond_6
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 336
    .end local v17           #scompare:Ljava/lang/String;
    :cond_7
    new-array v14, v15, [J

    .line 337
    .local v14, list:[J
    new-array v2, v15, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    .line 338
    new-array v2, v15, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchArtist:[Ljava/lang/String;

    .line 339
    new-array v2, v15, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchAlbum:[Ljava/lang/String;

    .line 340
    if-lez v15, :cond_9

    .line 341
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 343
    const/4 v15, 0x0

    .line 344
    const/4 v12, 0x0

    :goto_2
    if-ge v12, v13, :cond_a

    .line 345
    move/from16 v0, v18

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 347
    .restart local v17       #scompare:Ljava/lang/String;
    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_8

    .line 348
    const/4 v2, 0x0

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    aput-wide v2, v14, v15

    .line 349
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    move/from16 v0, v18

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v15

    .line 350
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchArtist:[Ljava/lang/String;

    invoke-interface {v10, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v15

    .line 351
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchAlbum:[Ljava/lang/String;

    invoke-interface {v10, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v15

    .line 353
    add-int/lit8 v15, v15, 0x1

    .line 356
    :cond_8
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    .line 344
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 359
    .end local v17           #scompare:Ljava/lang/String;
    :cond_9
    const-string v2, "AVRCP_UTIL"

    const-string v3, "[BT][AVRCP][WRN] found 0 result !"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    :cond_a
    const-string v2, "AVRCP_UTIL"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] found result list.length:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v5, v14

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 364
    if-eqz v10, :cond_2

    .line 365
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 366
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 364
    .end local v12           #i:I
    .end local v13           #len:I
    .end local v14           #list:[J
    :catchall_0
    move-exception v2

    if-eqz v10, :cond_b

    .line 365
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 366
    const/4 v10, 0x0

    :cond_b
    throw v2
.end method

.method public getSearchedAlbumString(I)Ljava/lang/String;
    .locals 1
    .parameter "index"

    .prologue
    .line 95
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchAlbum:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getSearchedArtistString(I)Ljava/lang/String;
    .locals 1
    .parameter "index"

    .prologue
    .line 92
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchArtist:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getSearchedList()[J
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    if-nez v0, :cond_0

    .line 82
    const-string v0, "AVRCP_UTIL"

    const-string v1, "[BT][AVRCP] getSearchedList mSearchIDList is null"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    sget-object v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->EMPTY_LIST:[J

    .line 85
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    goto :goto_0
.end method

.method public getSearchedTitleString(I)Ljava/lang/String;
    .locals 1
    .parameter "index"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public search(Ljava/lang/String;)I
    .locals 5
    .parameter "sText"

    .prologue
    .line 65
    const-string v1, "AVRCP_UTIL"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Search data "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v1, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSearchSongs(Landroid/content/Context;Ljava/lang/String;)[J

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    .line 67
    const/4 v0, 0x0

    .local v0, j:I
    :goto_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 68
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 69
    const-string v1, "AVRCP_UTIL"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Search Result "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " id:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    aget-wide v3, v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " title:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchTitle:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 71
    :cond_0
    const-string v1, "AVRCP_UTIL"

    const-string v2, "Search Result mSearchIDList[j] is not exist!"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 74
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    if-nez v1, :cond_2

    .line 75
    const/4 v1, 0x0

    .line 77
    :goto_2
    return v1

    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->mSearchIDList:[J

    array-length v1, v1

    goto :goto_2
.end method
