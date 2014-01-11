.class public Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;
.super Ljava/lang/Thread;
.source "BTAvrcpBrowserAdapter.java"


# static fields
.field private static final ACTION_CHANGE_PATH_DOWN:I = 0x12

.field private static final ACTION_CHANGE_PATH_UP:I = 0x11

.field private static final ACTION_GET_ATTR:I = 0x13

.field private static final ACTION_GET_FILELIST:I = 0x15

.field private static final ACTION_NONE:I = 0x10

.field private static final ACTION_SEARCH:I = 0x14

.field private static final ALBUM_FOLDER_ID:J = 0x102L

.field private static final ARTIST_FOLDER_ID:J = 0x101L

.field private static final DELAY_TIME:I = 0x0

.field private static final FAIL:B = 0x1t

.field private static final NO_EXIST_FOLDER:J = 0xf0fL

.field private static final OK:B = 0x0t

.field private static final ROOT_FOLDER_ID:J = 0x100L

.field public static final STATUS_FAIL:B = 0x1t

.field public static final STATUS_OK:B = 0x4t

.field public static final TAG:Ljava/lang/String; = "BWS_AVRCP"

.field private static final TEST_FOLDER_ID:J = 0x103L

.field private static final UNAWARE_UIDCOUNTER:S = 0x0s

.field private static final UTF8_CHARSET:S = 0x6as


# instance fields
.field mAlbumCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

.field mAllCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

.field mArtistCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

.field private mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

.field mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

.field mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

.field private mCurFakeFolderID:J

.field private mCurFolderID:J

.field private mCurPathItemNum:I

.field private mCurPaths:[Ljava/lang/String;

.field private mDebug:Z

.field private mDepth:B

.field mEmptyCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

.field private mGetFileAttr:[I

.field private mGetFileAttrCount:I

.field private mHandler:Landroid/os/Handler;

.field private mInsideFakeFolder:Z

.field private mIsSearch:Z

.field private mNowAlbum:Ljava/lang/String;

.field private mNowArtist:Ljava/lang/String;

.field private mNowId:J

.field private mNowTtitle:Ljava/lang/String;

.field private mParentID:J

.field private mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

.field private mSearchAlbum:Ljava/lang/String;

.field private mSearchArtist:Ljava/lang/String;

.field private mSearchId:J

.field private mSearchResultList:[J

.field private mSearchText:Ljava/lang/String;

.field private mSearchTtitle:Ljava/lang/String;

.field private volatile mServiceLooper:Landroid/os/Looper;

.field private mUidCounter:S


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;)V
    .locals 9
    .parameter "service"

    .prologue
    const-wide/16 v0, 0x100

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 160
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 85
    iput-boolean v7, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mInsideFakeFolder:Z

    .line 87
    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mParentID:J

    .line 89
    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurFakeFolderID:J

    .line 91
    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurFolderID:J

    .line 93
    iput-short v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    .line 97
    iput v8, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    .line 99
    iput-byte v7, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mDepth:B

    .line 119
    iput-boolean v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    .line 122
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowId:J

    .line 124
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowTtitle:Ljava/lang/String;

    .line 126
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowAlbum:Ljava/lang/String;

    .line 128
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowArtist:Ljava/lang/String;

    .line 131
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchId:J

    .line 133
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchTtitle:Ljava/lang/String;

    .line 135
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAlbum:Ljava/lang/String;

    .line 137
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchArtist:Ljava/lang/String;

    .line 149
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 152
    iput v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mGetFileAttrCount:I

    .line 154
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mGetFileAttr:[I

    .line 156
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mServiceLooper:Landroid/os/Looper;

    .line 158
    iput-boolean v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mDebug:Z

    .line 161
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    .line 162
    iput-boolean v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    .line 163
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    invoke-direct {v0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    .line 164
    const-string v0, "BTAvrcpBrowserAdapterThread"

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->setName(Ljava/lang/String;)V

    .line 166
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    const-wide/16 v1, 0x1001

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-direct {v0, v1, v2, v3, v8}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;-><init>(JLandroid/content/Context;B)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAlbumCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 167
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    const-wide/16 v1, 0x1002

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v4, 0x3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;-><init>(JLandroid/content/Context;B)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mArtistCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 168
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    const-wide/16 v1, 0x1003

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/16 v4, 0xf

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;-><init>(JLandroid/content/Context;B)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mEmptyCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 169
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    const-wide/16 v1, 0x1004

    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/16 v4, 0xe

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;-><init>(JLandroid/content/Context;B)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAllCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 170
    invoke-direct {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->checkPTSMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 172
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAllCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aput-object v1, v0, v6

    .line 173
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mArtistCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aput-object v1, v0, v7

    .line 174
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAlbumCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aput-object v1, v0, v8

    .line 175
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mEmptyCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aput-object v2, v0, v1

    .line 181
    :goto_0
    iput-object v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 183
    invoke-static {}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->isSupportBrowse()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 184
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->start()V

    .line 185
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] AvrcpBrowse start looper"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    :goto_1
    return-void

    .line 177
    :cond_0
    new-array v0, v8, [Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 178
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mArtistCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aput-object v1, v0, v6

    .line 179
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAlbumCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aput-object v1, v0, v7

    goto :goto_0

    .line 187
    :cond_1
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] No AvrcpBrowse debug looper"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private checkPTSMode()Z
    .locals 1

    .prologue
    .line 324
    const/4 v0, 0x1

    return v0
.end method

.method private static getCursorById(Landroid/content/Context;J)Landroid/database/Cursor;
    .locals 7
    .parameter "context"
    .parameter "id"

    .prologue
    .line 941
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "title"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "artist"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "album"

    aput-object v1, v2, v0

    .line 946
    .local v2, ccols:[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id="

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

    .line 948
    .local v3, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const-string v5, "track"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 951
    .local v6, cursor:Landroid/database/Cursor;
    return-object v6
.end method

.method private handleChangePath(SBJ)V
    .locals 7
    .parameter "uidCounter"
    .parameter "dir"
    .parameter "uid"

    .prologue
    const/4 v6, 0x0

    .line 838
    const/4 v0, 0x0

    .line 839
    .local v0, bRet:Z
    const/4 v2, 0x0

    .line 840
    .local v2, status:B
    const/4 v1, 0x0

    .line 843
    .local v1, i:I
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] handleChangePath uid_counter:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " dir:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " uid:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 846
    if-nez p2, :cond_4

    .line 847
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v3, :cond_3

    .line 848
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->isCategoryRoot()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 849
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 850
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v3, v3

    iput v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    .line 851
    const-string v3, "BWS_AVRCP"

    const-string v4, "[BT][AVRCP][BWS] handleChangePath goUp to catagory"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 852
    const/4 v0, 0x1

    .line 918
    :cond_0
    :goto_0
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] changePath final bRet:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 919
    if-eqz v0, :cond_b

    .line 920
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    iget v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    invoke-virtual {v3, v6, v2, v4}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->changePathRspNative(BBI)Z

    .line 938
    :goto_1
    return-void

    .line 854
    :cond_1
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->goUp()Z

    .line 855
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v3, :cond_2

    .line 856
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCurPathItems()I

    move-result v3

    iput v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    .line 860
    :goto_2
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP][BWS] handleChangePath goUp ok num-of-items:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 862
    const/4 v0, 0x1

    goto :goto_0

    .line 858
    :cond_2
    iput v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    goto :goto_2

    .line 867
    :cond_3
    const/4 v0, 0x0

    .line 868
    const/4 v2, 0x7

    goto :goto_0

    .line 870
    :cond_4
    const/4 v3, 0x1

    if-ne p2, v3, :cond_a

    .line 871
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v3, :cond_6

    .line 872
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3, p3, p4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->goDown(J)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 874
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCurPathItems()I

    move-result v3

    iput v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    .line 875
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP][BWS] handleChangePath goDown ok:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " num-of-items:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 877
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 880
    :cond_5
    const/16 v2, 0x8

    .line 881
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP][BWS] handleChangePath mCurCategory.goDown fail uid"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 883
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 888
    :cond_6
    const/4 v1, 0x0

    :goto_3
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v3, v3

    if-ge v1, v3, :cond_7

    .line 889
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getPresentId()J

    move-result-wide v3

    cmp-long v3, p3, v3

    if-nez v3, :cond_9

    .line 890
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aget-object v3, v3, v1

    iput-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 891
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->resetSubFolder()V

    .line 892
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->buildSubFolder()V

    .line 894
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v3, :cond_8

    .line 895
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCurPathItems()I

    move-result v3

    iput v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    .line 899
    :goto_4
    const/4 v0, 0x1

    .line 900
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP][BWS] handleChangePath down to category ok:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " num:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 906
    :cond_7
    if-nez v0, :cond_0

    .line 907
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP][BWS] handleChangePath down to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " fail! cannot found "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 909
    const/4 v0, 0x0

    .line 910
    const/16 v2, 0x9

    goto/16 :goto_0

    .line 897
    :cond_8
    iput v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    goto :goto_4

    .line 888
    :cond_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 914
    :cond_a
    const/4 v0, 0x0

    .line 915
    const/16 v2, 0x9

    goto/16 :goto_0

    .line 926
    :cond_b
    packed-switch v2, :pswitch_data_0

    .line 933
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/16 v4, 0x9

    iget v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    invoke-virtual {v3, v4, v2, v5}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->changePathRspNative(BBI)Z

    goto/16 :goto_1

    .line 930
    :pswitch_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    iget v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    invoke-virtual {v3, v2, v2, v4}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->changePathRspNative(BBI)Z

    goto/16 :goto_1

    .line 926
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private handleGetFileList(III[I)V
    .locals 29
    .parameter "start"
    .parameter "end"
    .parameter "attrCount"
    .parameter "attrIds"

    .prologue
    .line 653
    const/16 v27, 0x0

    .line 654
    .local v27, length:I
    const/16 v24, 0x0

    .line 655
    .local v24, i:I
    const/16 v26, 0x0

    .line 663
    .local v26, j:I
    const-string v2, "BWS_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP][BWS] handleGetFileList start:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " end:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 664
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemStartRspNative()Z

    .line 665
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v2, :cond_b

    .line 667
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCurrentList()[J

    move-result-object v25

    .line 668
    .local v25, idlist:[J
    if-eqz v25, :cond_0

    .line 669
    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v27, v0

    .line 671
    :cond_0
    if-eqz v25, :cond_1

    move/from16 v0, p1

    move/from16 v1, v27

    if-lt v0, v1, :cond_2

    .line 674
    :cond_1
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] handleGetFileList  out-of-bound start:%d list.length:%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x1

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x1

    const/16 v4, 0xb

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    .line 804
    .end local v25           #idlist:[J
    :goto_0
    return-void

    .line 681
    .restart local v25       #idlist:[J
    :cond_2
    move-object/from16 v0, v25

    array-length v2, v0

    if-nez v2, :cond_3

    .line 682
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x1

    const/16 v4, 0xb

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    goto :goto_0

    .line 687
    :cond_3
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] handleGetFileList start:%d end:%d list.length:%d"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x1

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x2

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 690
    move/from16 v0, p2

    move/from16 v1, v27

    if-lt v0, v1, :cond_4

    .line 691
    add-int/lit8 p2, v27, -0x1

    .line 695
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getType()B

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 762
    const-string v2, "BWS_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP]  mCurCategory.getType Wrong "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getType()B

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x1

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    goto :goto_0

    .line 698
    :pswitch_0
    sub-int v2, p2, p1

    add-int/lit8 v28, v2, 0x1

    .line 699
    .local v28, total:I
    move/from16 v24, p1

    :goto_1
    move/from16 v0, v24

    move/from16 v1, p2

    if-gt v0, v1, :cond_6

    .line 704
    const/4 v5, 0x0

    .line 705
    .local v5, attrIndex:B
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    move/from16 v0, v24

    invoke-virtual {v2, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getNameByIndex(I)Ljava/lang/String;

    move-result-object v12

    .line 706
    .local v12, sItemValue:Ljava/lang/String;
    if-eqz v12, :cond_5

    .line 707
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v2

    int-to-short v11, v2

    .line 715
    .local v11, u2ItemLength:S
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x0

    sub-int v4, v24, p1

    int-to-byte v4, v4

    move/from16 v0, v28

    int-to-byte v5, v0

    aget-wide v6, v25, v24

    .end local v5           #attrIndex:B
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v10}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getFolderType()B

    move-result v8

    const/4 v9, 0x0

    const/16 v10, 0x6a

    invoke-virtual/range {v2 .. v12}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemFolderRspNative(BBBJBBSSLjava/lang/String;)Z

    .line 699
    add-int/lit8 v24, v24, 0x1

    goto :goto_1

    .line 709
    .end local v11           #u2ItemLength:S
    .restart local v5       #attrIndex:B
    :cond_5
    const/4 v11, 0x0

    .restart local v11       #u2ItemLength:S
    goto :goto_2

    .line 720
    .end local v5           #attrIndex:B
    .end local v11           #u2ItemLength:S
    .end local v12           #sItemValue:Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    goto/16 :goto_0

    .line 724
    .end local v28           #total:I
    :pswitch_1
    sub-int v2, p2, p1

    add-int/lit8 v28, v2, 0x1

    .line 725
    .restart local v28       #total:I
    move/from16 v24, p1

    :goto_3
    move/from16 v0, v24

    move/from16 v1, p2

    if-gt v0, v1, :cond_a

    .line 727
    const/4 v5, 0x0

    .line 728
    .restart local v5       #attrIndex:B
    const/16 v26, 0x0

    :goto_4
    move/from16 v0, v26

    move/from16 v1, p3

    if-ge v0, v1, :cond_8

    .line 729
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aget v3, p4, v26

    move/from16 v0, v24

    invoke-virtual {v2, v0, v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getAttributeByIndex(II)Ljava/lang/String;

    move-result-object v9

    .line 731
    .local v9, sAttrValue:Ljava/lang/String;
    if-eqz v9, :cond_7

    .line 732
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v2

    int-to-short v8, v2

    .line 736
    .local v8, u2AttrLength:S
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x0

    sub-int v4, v24, p1

    int-to-byte v4, v4

    aget v6, p4, v26

    const/16 v7, 0x6a

    invoke-virtual/range {v2 .. v9}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemFileAttrRspNative(BBBISSLjava/lang/String;)Z

    .line 739
    add-int/lit8 v2, v5, 0x1

    int-to-byte v5, v2

    .line 728
    .end local v8           #u2AttrLength:S
    :cond_7
    add-int/lit8 v26, v26, 0x1

    goto :goto_4

    .line 744
    .end local v9           #sAttrValue:Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    move/from16 v0, v24

    invoke-virtual {v2, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getNameByIndex(I)Ljava/lang/String;

    move-result-object v12

    .line 745
    .restart local v12       #sItemValue:Ljava/lang/String;
    if-eqz v12, :cond_9

    .line 746
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v2

    int-to-short v11, v2

    .line 754
    .restart local v11       #u2ItemLength:S
    :goto_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v14, 0x0

    sub-int v2, v24, p1

    int-to-byte v15, v2

    move/from16 v0, v28

    int-to-byte v0, v0

    move/from16 v16, v0

    aget-wide v17, v25, v24

    const/16 v19, 0x0

    const/16 v20, 0x6a

    move/from16 v21, v11

    move-object/from16 v22, v12

    invoke-virtual/range {v13 .. v22}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemFileRspNative(BBBJBSSLjava/lang/String;)Z

    .line 725
    add-int/lit8 v24, v24, 0x1

    goto :goto_3

    .line 748
    .end local v11           #u2ItemLength:S
    :cond_9
    const/4 v11, 0x0

    .restart local v11       #u2ItemLength:S
    goto :goto_5

    .line 759
    .end local v5           #attrIndex:B
    .end local v11           #u2ItemLength:S
    .end local v12           #sItemValue:Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    goto/16 :goto_0

    .line 769
    .end local v25           #idlist:[J
    .end local v28           #total:I
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v2, v2

    move/from16 v0, p1

    if-le v0, v2, :cond_c

    .line 771
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] handleGetFileList out-of-bound start:%d mCategory.length:%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v7, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 774
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x1

    const/16 v4, 0xb

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    goto/16 :goto_0

    .line 778
    :cond_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v2, v2

    move/from16 v0, p2

    if-lt v0, v2, :cond_d

    .line 779
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v2, v2

    add-int/lit8 p2, v2, -0x1

    .line 781
    :cond_d
    sub-int v2, p2, p1

    add-int/lit8 v28, v2, 0x1

    .line 782
    .restart local v28       #total:I
    move/from16 v24, p1

    :goto_6
    move/from16 v0, v24

    move/from16 v1, p2

    if-gt v0, v1, :cond_f

    .line 783
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v2, v2

    move/from16 v0, v24

    if-lt v0, v2, :cond_e

    .line 784
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP][ERR] Out-of-Array mCategory.length:%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v7, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 786
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x1

    const/16 v4, 0xb

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    goto/16 :goto_0

    .line 790
    :cond_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aget-object v2, v2, v24

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCategoryName()Ljava/lang/String;

    move-result-object v12

    .line 791
    .restart local v12       #sItemValue:Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v2

    int-to-short v11, v2

    .line 795
    .restart local v11       #u2ItemLength:S
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v14, 0x0

    sub-int v2, v24, p1

    int-to-byte v15, v2

    move/from16 v0, v28

    int-to-byte v0, v0

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    aget-object v2, v2, v24

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getPresentId()J

    move-result-wide v17

    const/16 v19, 0x2

    const/16 v20, 0x0

    const/16 v21, 0x6a

    move/from16 v22, v11

    move-object/from16 v23, v12

    invoke-virtual/range {v13 .. v23}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemFolderRspNative(BBBJBBSSLjava/lang/String;)Z

    .line 782
    add-int/lit8 v24, v24, 0x1

    goto :goto_6

    .line 802
    .end local v11           #u2ItemLength:S
    .end local v12           #sItemValue:Ljava/lang/String;
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-short v6, v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    invoke-virtual {v2, v3, v4, v6}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->getFileSystemItemEndRspNative(BBS)Z

    goto/16 :goto_0

    .line 695
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private handleSearch(Ljava/lang/String;)V
    .locals 6
    .parameter "sText"

    .prologue
    const/4 v5, 0x0

    .line 807
    const/4 v0, 0x3

    .line 808
    .local v0, numOfItems:I
    const/4 v1, 0x4

    .line 810
    .local v1, status:B
    const-string v2, "BWS_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] handleSearch "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 815
    iget-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    if-nez v2, :cond_0

    .line 816
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] isSearch false. No return result "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 835
    :goto_0
    return-void

    .line 820
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 821
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP][WRN] handleSearch request empty string !"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 822
    const/4 v0, 0x0

    .line 823
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v2, v5, v1, v5, v0}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->searchRspNative(BBSI)Z

    .line 824
    iput-boolean v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    goto :goto_0

    .line 828
    :cond_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    if-eqz v2, :cond_2

    .line 829
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    invoke-virtual {v2, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->search(Ljava/lang/String;)I

    move-result v0

    .line 832
    :cond_2
    iput-boolean v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    .line 834
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v2, v5, v1, v5, v0}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->searchRspNative(BBSI)Z

    goto :goto_0
.end method

.method private static query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 7
    .parameter "context"
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    .line 973
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private static query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;
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

    .line 957
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 958
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move-object v1, v7

    .line 966
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :goto_0
    return-object v1

    .line 961
    .restart local v0       #resolver:Landroid/content/ContentResolver;
    :cond_0
    if-lez p6, :cond_1

    .line 962
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

    .line 964
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 965
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :catch_0
    move-exception v6

    .local v6, ex:Ljava/lang/UnsupportedOperationException;
    move-object v1, v7

    .line 966
    goto :goto_0
.end method

.method private sendMyselfMsg(III)Z
    .locals 4
    .parameter "what"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 236
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    if-nez v1, :cond_0

    .line 237
    const/4 v1, 0x0

    .line 243
    :goto_0
    return v1

    .line 239
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 240
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 241
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 242
    iput p3, v0, Landroid/os/Message;->arg2:I

    .line 243
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result v1

    goto :goto_0
.end method

.method private sendMyselfMsg(ILjava/lang/String;)Z
    .locals 4
    .parameter "what"
    .parameter "data"

    .prologue
    .line 247
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 248
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 249
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 250
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 251
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result v1

    .line 253
    .end local v0           #msg:Landroid/os/Message;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private updateNowSongId(J)Z
    .locals 6
    .parameter "newId"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 534
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-static {v3, p1, p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->getCursorById(Landroid/content/Context;J)Landroid/database/Cursor;

    move-result-object v0

    .line 535
    .local v0, cursor:Landroid/database/Cursor;
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP][BWS] updateNowSongId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    if-nez v0, :cond_1

    .line 538
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] updateNowSongId got null"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    :cond_0
    :goto_0
    return v1

    .line 543
    :cond_1
    if-eqz v0, :cond_4

    .line 544
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_3

    .line 545
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 547
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowTtitle:Ljava/lang/String;

    .line 548
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowArtist:Ljava/lang/String;

    .line 549
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowAlbum:Ljava/lang/String;

    .line 551
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowTtitle:Ljava/lang/String;

    .line 552
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowArtist:Ljava/lang/String;

    .line 553
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowAlbum:Ljava/lang/String;

    .line 554
    iput-wide p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowId:J

    .line 556
    const-string v1, "BWS_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] updateNowSongId \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowTtitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowArtist:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowAlbum:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 565
    if-eqz v0, :cond_2

    .line 566
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 567
    const/4 v0, 0x0

    :cond_2
    move v1, v2

    goto :goto_0

    .line 560
    :cond_3
    :try_start_1
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] query and get empty result !"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 565
    :cond_4
    if-eqz v0, :cond_0

    .line 566
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 567
    const/4 v0, 0x0

    goto :goto_0

    .line 565
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_5

    .line 566
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 567
    const/4 v0, 0x0

    :cond_5
    throw v1
.end method

.method private updateSearchSongId(J)Z
    .locals 6
    .parameter "newId"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 496
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-static {v3, p1, p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->getCursorById(Landroid/content/Context;J)Landroid/database/Cursor;

    move-result-object v0

    .line 497
    .local v0, cursor:Landroid/database/Cursor;
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP][BWS] updateSearchSongId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    if-nez v0, :cond_1

    .line 500
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] updateSearchSongId got null"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    :cond_0
    :goto_0
    return v1

    .line 505
    :cond_1
    if-eqz v0, :cond_4

    .line 506
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_3

    .line 507
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 509
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchTtitle:Ljava/lang/String;

    .line 510
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchArtist:Ljava/lang/String;

    .line 511
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAlbum:Ljava/lang/String;

    .line 513
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchTtitle:Ljava/lang/String;

    .line 514
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchArtist:Ljava/lang/String;

    .line 515
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAlbum:Ljava/lang/String;

    .line 516
    iput-wide p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchId:J

    .line 517
    const-string v1, "BWS_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] updateSearchSongId \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchTtitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchArtist:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAlbum:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 526
    if-eqz v0, :cond_2

    .line 527
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 528
    const/4 v0, 0x0

    :cond_2
    move v1, v2

    goto :goto_0

    .line 521
    :cond_3
    :try_start_1
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] query and get empty result !"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 526
    :cond_4
    if-eqz v0, :cond_0

    .line 527
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 528
    const/4 v0, 0x0

    goto :goto_0

    .line 526
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_5

    .line 527
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 528
    const/4 v0, 0x0

    :cond_5
    throw v1
.end method


# virtual methods
.method public changePath(SBJ)Z
    .locals 5
    .parameter "uidCounter"
    .parameter "dir"
    .parameter "uid"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 258
    const/4 v0, 0x0

    .line 259
    .local v0, bRet:Z
    if-eqz p1, :cond_1

    .line 260
    const-string v2, "BWS_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] changePath fail to  uid_counter:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    :cond_0
    :goto_0
    return v1

    .line 263
    :cond_1
    if-nez p1, :cond_2

    const-wide/16 v3, 0x0

    cmp-long v3, p3, v3

    if-nez v3, :cond_2

    if-eqz p2, :cond_2

    .line 264
    const-string v2, "BWS_AVRCP"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[BT][AVRCP] changePath fail  uid_counter:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " dir:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " uid:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 269
    :cond_2
    if-ne p2, v2, :cond_3

    .line 270
    const/16 v1, 0x12

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->sendMyselfMsg(ILjava/lang/String;)Z

    move v1, v2

    .line 271
    goto :goto_0

    .line 272
    :cond_3
    if-nez p2, :cond_0

    .line 273
    const/16 v1, 0x11

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->sendMyselfMsg(ILjava/lang/String;)Z

    move v1, v2

    .line 274
    goto :goto_0
.end method

.method public checkSongIdExisted(J)Z
    .locals 4
    .parameter "newId"

    .prologue
    .line 478
    const/4 v0, 0x0

    .line 479
    .local v0, bRet:Z
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-static {v2, p1, p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->getCursorById(Landroid/content/Context;J)Landroid/database/Cursor;

    move-result-object v1

    .line 481
    .local v1, cursor:Landroid/database/Cursor;
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-nez v2, :cond_2

    .line 482
    const/4 v0, 0x1

    .line 488
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 489
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 490
    const/4 v1, 0x0

    .line 492
    :cond_1
    return v0

    .line 483
    :cond_2
    if-nez v1, :cond_3

    .line 484
    const/4 v0, 0x0

    goto :goto_0

    .line 485
    :cond_3
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 486
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public deinit()V
    .locals 3

    .prologue
    .line 192
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mServiceLooper:Landroid/os/Looper;

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    .line 194
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mServiceLooper:Landroid/os/Looper;

    .line 197
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 198
    const-string v1, "BWS_AVRCP"

    const-string v2, "[BT][AVRCP] mHandler is existed. call join"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->interrupt()V

    .line 202
    const-wide/16 v1, 0x64

    :try_start_0
    invoke-virtual {p0, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    :cond_1
    :goto_0
    return-void

    .line 203
    :catch_0
    move-exception v0

    .line 204
    .local v0, ex:Ljava/lang/InterruptedException;
    const-string v1, "BWS_AVRCP"

    const-string v2, "[BT][AVRCP] join fail"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getCurPathDepth()B
    .locals 3

    .prologue
    .line 303
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-nez v0, :cond_0

    .line 304
    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mDepth:B

    .line 308
    :goto_0
    const-string v0, "BWS_AVRCP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BT][AVRCP] getCurPathDepth mDepth:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mDepth:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    iget-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mDepth:B

    return v0

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCurPathDepth()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mDepth:B

    goto :goto_0
.end method

.method public getCurPathItems()I
    .locals 3

    .prologue
    .line 289
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-nez v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCategory:[Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    array-length v0, v0

    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    .line 294
    :goto_0
    const-string v0, "BWS_AVRCP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BT][AVRCP] getCurPathItems mCurPathItemNum:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    iget v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    return v0

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCurPathItems()I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPathItemNum:I

    goto :goto_0
.end method

.method public getCurPaths()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 313
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v0, :cond_0

    .line 314
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getCurPaths()[Ljava/lang/String;

    move-result-object v0

    .line 320
    :goto_0
    return-object v0

    .line 316
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPaths:[Ljava/lang/String;

    if-nez v0, :cond_1

    .line 317
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPaths:[Ljava/lang/String;

    .line 318
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPaths:[Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "root"

    aput-object v2, v0, v1

    .line 320
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurPaths:[Ljava/lang/String;

    goto :goto_0
.end method

.method public getFileSystemitemsList(IIB[I)Z
    .locals 1
    .parameter "start"
    .parameter "end"
    .parameter "count"
    .parameter "attrIds"

    .prologue
    .line 281
    iput p3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mGetFileAttrCount:I

    .line 282
    iput-object p4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mGetFileAttr:[I

    .line 284
    const/16 v0, 0x15

    invoke-direct {p0, v0, p1, p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->sendMyselfMsg(III)Z

    .line 285
    const/4 v0, 0x1

    return v0
.end method

.method getItemAttribute(BJSI)Ljava/lang/String;
    .locals 7
    .parameter "scope"
    .parameter "identifier"
    .parameter "uidCounter"
    .parameter "attrId"

    .prologue
    const/4 v0, 0x0

    .line 386
    const/4 v6, 0x0

    .line 388
    .local v6, sRet:Ljava/lang/String;
    if-eqz p4, :cond_1

    .line 389
    const-string v1, "BWS_AVRCP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BT][AVRCP] getItemAttribute wrong uid_counter"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    :cond_0
    :goto_0
    return-object v0

    .line 393
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 433
    iget-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowId:J

    cmp-long v0, p2, v0

    if-eqz v0, :cond_2

    .line 434
    invoke-direct {p0, p2, p3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->updateNowSongId(J)Z

    .line 438
    :cond_2
    iget-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowId:J

    cmp-long v0, p2, v0

    if-nez v0, :cond_4

    .line 439
    packed-switch p5, :pswitch_data_1

    :goto_1
    move-object v0, v6

    .line 460
    goto :goto_0

    .line 395
    :pswitch_0
    const-string v0, "Player"

    goto :goto_0

    .line 397
    :pswitch_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v1, :cond_0

    .line 398
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    move v1, p1

    move-wide v2, p2

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->getItemAttribute(BJSI)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 410
    :pswitch_2
    iget-wide v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchId:J

    cmp-long v0, p2, v0

    if-nez v0, :cond_3

    .line 411
    packed-switch p5, :pswitch_data_2

    .line 424
    :goto_2
    const-string v0, "BWS_AVRCP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BT][AVRCP] getItemAttribute ret:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 413
    :pswitch_3
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchTtitle:Ljava/lang/String;

    .line 414
    goto :goto_2

    .line 416
    :pswitch_4
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchArtist:Ljava/lang/String;

    .line 417
    goto :goto_2

    .line 419
    :pswitch_5
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAlbum:Ljava/lang/String;

    .line 420
    goto :goto_2

    .line 426
    :cond_3
    const-string v0, "BWS_AVRCP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BT][AVRCP] fail to updateSearchSongId ! id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 441
    :pswitch_6
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowTtitle:Ljava/lang/String;

    .line 442
    goto :goto_1

    .line 444
    :pswitch_7
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowArtist:Ljava/lang/String;

    .line 445
    goto :goto_1

    .line 447
    :pswitch_8
    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mNowAlbum:Ljava/lang/String;

    .line 448
    goto :goto_1

    .line 453
    :cond_4
    const-string v0, "BWS_AVRCP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BT][AVRCP] fail to updateNowSongId ! id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 393
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 439
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 411
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method getSearchedItemAttribute(II)Ljava/lang/String;
    .locals 1
    .parameter "index"
    .parameter "attrId"

    .prologue
    .line 464
    packed-switch p2, :pswitch_data_0

    .line 472
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 466
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSearchedTitleString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 468
    :pswitch_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSearchedArtistString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 470
    :pswitch_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSearchedAlbumString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 464
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getSearchedList()[J
    .locals 1

    .prologue
    .line 574
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserSearch;->getSearchedList()[J

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchResultList:[J

    .line 575
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchResultList:[J

    return-object v0
.end method

.method public getUidCounter()S
    .locals 1

    .prologue
    .line 299
    iget-short v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mUidCounter:S

    return v0
.end method

.method public isItemExist(BJS)Z
    .locals 1
    .parameter "scope"
    .parameter "identifier"
    .parameter "uidCounter"

    .prologue
    .line 378
    if-eqz p4, :cond_0

    .line 379
    const/4 v0, 0x0

    .line 382
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isSearch()Z
    .locals 1

    .prologue
    .line 374
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    return v0
.end method

.method public onConnect()V
    .locals 2

    .prologue
    .line 210
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] onConnect"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;->resetSubFolder()V

    .line 213
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mCurCategory:Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowseAlbum;

    .line 215
    :cond_0
    sget-boolean v0, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->sSupportBrowse:Z

    if-nez v0, :cond_1

    .line 216
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] No Support Avrcp Browse feature"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    .line 221
    return-void
.end method

.method public onDisconnect()V
    .locals 2

    .prologue
    .line 224
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] onDisconnect"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    return-void
.end method

.method public onSelect()V
    .locals 2

    .prologue
    .line 228
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] OnSelect "

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    return-void
.end method

.method public onUnselect()V
    .locals 2

    .prologue
    .line 232
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] OnUnselect "

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    return-void
.end method

.method public passToHandleMessage(Landroid/os/Message;)V
    .locals 9
    .parameter "msg"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 609
    const-string v3, "[BT][AVRCP] AVRCPBrowser Receive a msg.what:%d msg.arg1:%d msg.arg2:%d "

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    iget v5, p1, Landroid/os/Message;->arg1:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    const/4 v5, 0x2

    iget v6, p1, Landroid/os/Message;->arg2:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 612
    .local v0, sMsg:Ljava/lang/String;
    const-string v3, "BWS_AVRCP"

    const-string v4, "[BT][AVRCP] AVRCPBWS passToHandleMessage what:%d"

    new-array v5, v8, [Ljava/lang/Object;

    iget v6, p1, Landroid/os/Message;->what:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    sget-boolean v3, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->sDebugMsg:Z

    if-eqz v3, :cond_0

    .line 614
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-static {v3, v0, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 617
    :cond_0
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    .line 644
    :pswitch_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mAvrcpServ:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    const-string v4, "[BT][AVRCP][BWS]no Handle msg !"

    invoke-static {v3, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 648
    :goto_0
    :pswitch_1
    return-void

    .line 622
    :pswitch_2
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 623
    .local v1, uid:J
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] compose up id:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 624
    invoke-direct {p0, v7, v7, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->handleChangePath(SBJ)V

    goto :goto_0

    .line 629
    .end local v1           #uid:J
    :pswitch_3
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 630
    .restart local v1       #uid:J
    const-string v3, "BWS_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] compose down id:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    invoke-direct {p0, v7, v8, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->handleChangePath(SBJ)V

    goto :goto_0

    .line 636
    .end local v1           #uid:J
    :pswitch_4
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchText:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->handleSearch(Ljava/lang/String;)V

    goto :goto_0

    .line 640
    :pswitch_5
    iget v3, p1, Landroid/os/Message;->arg1:I

    iget v4, p1, Landroid/os/Message;->arg2:I

    iget v5, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mGetFileAttrCount:I

    iget-object v6, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mGetFileAttr:[I

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->handleGetFileList(III[I)V

    goto :goto_0

    .line 617
    nop

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public registerNotification(BI)Z
    .locals 1
    .parameter "eventId"
    .parameter "interval"

    .prologue
    .line 604
    const/4 v0, 0x0

    return v0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 582
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] browse run"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 584
    const-string v0, "BWS_AVRCP"

    const-string v1, "[BT][AVRCP] browse run prepare "

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mServiceLooper:Landroid/os/Looper;

    .line 586
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter$1;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    .line 593
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 594
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mHandler:Landroid/os/Handler;

    .line 595
    return-void
.end method

.method public search(Ljava/lang/String;)Z
    .locals 5
    .parameter "searchText"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 328
    const-string v3, "BWS_AVRCP"

    const-string v4, "[BT][AVRCP] search"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    if-eqz p1, :cond_0

    const-string v3, ""

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 370
    :cond_0
    :goto_0
    return v1

    .line 334
    :cond_1
    iget-boolean v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    if-eqz v3, :cond_2

    .line 339
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] search is in progress"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 342
    :cond_2
    sget-boolean v3, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->sSupportBrowse:Z

    if-eqz v3, :cond_5

    .line 344
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 345
    const-string v3, "BWS_AVRCP"

    const-string v4, "[BT][AVRCP] check isAlive"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    :goto_1
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 359
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mIsSearch:Z

    .line 360
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->mSearchText:Ljava/lang/String;

    .line 361
    const/16 v3, 0x14

    invoke-direct {p0, v3, v1, v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->sendMyselfMsg(III)Z

    move v1, v2

    .line 362
    goto :goto_0

    .line 348
    :cond_3
    invoke-static {}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->yield()V

    .line 350
    const-wide/16 v3, 0x2710

    :try_start_0
    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpBrowserAdapter;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 355
    :goto_2
    const-string v3, "BWS_AVRCP"

    const-string v4, "[BT][AVRCP] delay search 10000"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 351
    :catch_0
    move-exception v0

    .line 352
    .local v0, ex:Ljava/lang/InterruptedException;
    const-string v3, "BWS_AVRCP"

    const-string v4, "[BT][AVRCP] sleep fail"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 364
    .end local v0           #ex:Ljava/lang/InterruptedException;
    :cond_4
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] Thread not start yets!"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 368
    :cond_5
    const-string v2, "BWS_AVRCP"

    const-string v3, "[BT][AVRCP] search fail because bSupportBrowse is false"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
