.class public Lcom/mediatek/bluetooth/share/BluetoothShareTask;
.super Ljava/lang/Object;
.source "BluetoothShareTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;,
        Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;
    }
.end annotation


# static fields
.field public static final ID_NULL:I = -0x207

.field public static final SC_FINISHED_TASK:Ljava/lang/String; = "state in (8,7)"

.field public static final SC_INCOMING_TASK:Ljava/lang/String; = "type in (11,2,31)"

.field public static final SC_OUTGOING_TASK:Ljava/lang/String; = "type in (1,12,21)"

.field public static final STATE_ABORTED:I = 0x6

.field public static final STATE_ABORTING:I = 0x3

.field public static final STATE_CLEARED:I = 0x9

.field public static final STATE_FAILURE:I = 0x7

.field public static final STATE_ONGOING:I = 0x4

.field public static final STATE_PENDING:I = 0x1

.field public static final STATE_REJECTED:I = 0x5

.field public static final STATE_REJECTING:I = 0x2

.field public static final STATE_SUCCESS:I = 0x8

.field public static final TYPE_BIPI_GROUP_END:I = 0x1d

.field public static final TYPE_BIPI_GROUP_START:I = 0x14

.field public static final TYPE_BIPI_PUSH:I = 0x15

.field public static final TYPE_BIPR_GROUP_END:I = 0x27

.field public static final TYPE_BIPR_GROUP_START:I = 0x1e

.field public static final TYPE_BIPR_PUSH:I = 0x1f

.field public static final TYPE_OPPC_GROUP_END:I = 0x9

.field public static final TYPE_OPPC_GROUP_START:I = 0x0

.field public static final TYPE_OPPC_PULL:I = 0x2

.field public static final TYPE_OPPC_PUSH:I = 0x1

.field public static final TYPE_OPPS_GROUP_END:I = 0x13

.field public static final TYPE_OPPS_GROUP_START:I = 0xa

.field public static final TYPE_OPPS_PULL:I = 0xc

.field public static final TYPE_OPPS_PUSH:I = 0xb


# instance fields
.field private mCreationDate:J

.field private mData:Ljava/lang/String;

.field private mDoneBytes:J

.field private mId:I

.field private mIsHandover:Z

.field private mMimeType:Ljava/lang/String;

.field private mModifiedDate:J

.field private mObjectName:Ljava/lang/String;

.field private mObjectUri:Ljava/lang/String;

.field private mPeerAddr:Ljava/lang/String;

.field private mPeerName:Ljava/lang/String;

.field private mResult:Ljava/lang/String;

.field private mState:I

.field private mTotalBytes:J

.field private mType:I


# direct methods
.method public constructor <init>(I)V
    .locals 3
    .parameter "type"

    .prologue
    const-wide/16 v1, 0x0

    .line 210
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 177
    const/16 v0, -0x207

    iput v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    .line 206
    iput-wide v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mCreationDate:J

    .line 208
    iput-wide v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mModifiedDate:J

    .line 212
    iput p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    .line 213
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 4
    .parameter "cursor"

    .prologue
    const-wide/16 v1, 0x0

    .line 215
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 177
    const/16 v0, -0x207

    iput v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    .line 206
    iput-wide v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mCreationDate:J

    .line 208
    iput-wide v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mModifiedDate:J

    .line 217
    const-string v0, "_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    .line 218
    const-string v0, "type"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    .line 219
    const-string v0, "state"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mState:I

    .line 220
    const-string v0, "result"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mResult:Ljava/lang/String;

    .line 222
    const-string v0, "name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectName:Ljava/lang/String;

    .line 223
    const-string v0, "uri"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectUri:Ljava/lang/String;

    .line 224
    const-string v0, "data"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mData:Ljava/lang/String;

    .line 225
    const-string v0, "mime"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mMimeType:Ljava/lang/String;

    .line 226
    const-string v0, "peer_name"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerName:Ljava/lang/String;

    .line 227
    const-string v0, "peer_addr"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerAddr:Ljava/lang/String;

    .line 229
    const-string v0, "total"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mTotalBytes:J

    .line 230
    const-string v0, "done"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mDoneBytes:J

    .line 232
    const-string v0, "creation"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mCreationDate:J

    .line 233
    const-string v0, "modified"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mModifiedDate:J

    .line 234
    const-string v0, "ishandover"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mIsHandover:Z

    .line 235
    return-void

    .line 234
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getContentValues()Landroid/content/ContentValues;
    .locals 7

    .prologue
    const-wide/16 v5, 0x0

    const/4 v1, 0x1

    .line 244
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 247
    .local v0, values:Landroid/content/ContentValues;
    iget v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    const/16 v3, -0x207

    if-eq v2, v3, :cond_0

    .line 248
    const-string v2, "_id"

    iget v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 250
    :cond_0
    iget-wide v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mCreationDate:J

    cmp-long v2, v2, v5

    if-eqz v2, :cond_1

    .line 251
    const-string v2, "creation"

    iget-wide v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mCreationDate:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 253
    :cond_1
    iget-wide v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mModifiedDate:J

    cmp-long v2, v2, v5

    if-eqz v2, :cond_2

    .line 254
    const-string v2, "modified"

    iget-wide v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mModifiedDate:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 256
    :cond_2
    const-string v2, "type"

    iget v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 257
    const-string v2, "state"

    iget v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mState:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 258
    const-string v2, "result"

    iget-object v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mResult:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    const-string v2, "ishandover"

    iget-boolean v3, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mIsHandover:Z

    if-ne v3, v1, :cond_3

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 261
    const-string v1, "name"

    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    const-string v1, "uri"

    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectUri:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    const-string v1, "data"

    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    const-string v1, "mime"

    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    const-string v1, "peer_name"

    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    const-string v1, "peer_addr"

    iget-object v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerAddr:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    const-string v1, "total"

    iget-wide v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mTotalBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 269
    const-string v1, "done"

    iget-wide v2, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mDoneBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 271
    return-object v0

    .line 259
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCreationDate()J
    .locals 2

    .prologue
    .line 410
    iget-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mCreationDate:J

    return-wide v0
.end method

.method public getData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 438
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mData:Ljava/lang/String;

    return-object v0
.end method

.method public getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;
    .locals 1

    .prologue
    .line 301
    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    sparse-switch v0, :sswitch_data_0

    .line 311
    sget-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    :goto_0
    return-object v0

    .line 305
    :sswitch_0
    sget-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    goto :goto_0

    .line 309
    :sswitch_1
    sget-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    goto :goto_0

    .line 301
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_1
        0x15 -> :sswitch_1
        0x1f -> :sswitch_0
    .end sparse-switch
.end method

.method public getDoneBytes()J
    .locals 2

    .prologue
    .line 402
    iget-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mDoneBytes:J

    return-wide v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 426
    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    return v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mMimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getModifiedDate()J
    .locals 2

    .prologue
    .line 418
    iget-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mModifiedDate:J

    return-wide v0
.end method

.method public getObjectName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectName:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 352
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectUri:Ljava/lang/String;

    return-object v0
.end method

.method public getPeerAddr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 386
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerAddr:Ljava/lang/String;

    return-object v0
.end method

.method public getPeerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 378
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerName:Ljava/lang/String;

    return-object v0
.end method

.method public getPrintableString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 276
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 277
    .local v3, res:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getContentValues()Landroid/content/ContentValues;

    move-result-object v0

    .line 278
    .local v0, cv:Landroid/content/ContentValues;
    invoke-virtual {v0}, Landroid/content/ContentValues;->valueSet()Ljava/util/Set;

    move-result-object v4

    .line 279
    .local v4, set:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 281
    .local v1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 283
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public getResult()Ljava/lang/String;
    .locals 1

    .prologue
    .line 336
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mResult:Ljava/lang/String;

    return-object v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 328
    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mState:I

    return v0
.end method

.method public getTaskUri()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 168
    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    const/16 v1, -0x207

    if-ne v0, v1, :cond_0

    .line 170
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "null id task can\'t get uri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_0
    sget-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    iget v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getTotalBytes()J
    .locals 2

    .prologue
    .line 394
    iget-wide v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mTotalBytes:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 434
    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    return v0
.end method

.method public isHandover()Z
    .locals 1

    .prologue
    .line 320
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mIsHandover:Z

    return v0
.end method

.method public isOppcTask()Z
    .locals 2

    .prologue
    .line 288
    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    const/16 v1, 0x9

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOppsTask()Z
    .locals 2

    .prologue
    .line 293
    const/16 v0, 0xa

    iget v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mType:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCreationDate(J)V
    .locals 0
    .parameter "creationDate"

    .prologue
    .line 414
    iput-wide p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mCreationDate:J

    .line 415
    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0
    .parameter "data"

    .prologue
    .line 442
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mData:Ljava/lang/String;

    .line 443
    return-void
.end method

.method public setDoneBytes(J)V
    .locals 0
    .parameter "doneBytes"

    .prologue
    .line 406
    iput-wide p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mDoneBytes:J

    .line 407
    return-void
.end method

.method public setHandover(Z)V
    .locals 0
    .parameter "isHandover"

    .prologue
    .line 324
    iput-boolean p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mIsHandover:Z

    .line 325
    return-void
.end method

.method public setId(I)V
    .locals 0
    .parameter "id"

    .prologue
    .line 430
    iput p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mId:I

    .line 431
    return-void
.end method

.method public setMimeType(Ljava/lang/String;)V
    .locals 1
    .parameter "mimeType"

    .prologue
    .line 365
    if-eqz p1, :cond_0

    .line 371
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mMimeType:Ljava/lang/String;

    .line 375
    :goto_0
    return-void

    .line 373
    :cond_0
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mMimeType:Ljava/lang/String;

    goto :goto_0
.end method

.method public setModifiedDate(J)V
    .locals 0
    .parameter "modifiedDate"

    .prologue
    .line 422
    iput-wide p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mModifiedDate:J

    .line 423
    return-void
.end method

.method public setObjectName(Ljava/lang/String;)V
    .locals 0
    .parameter "objectName"

    .prologue
    .line 348
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectName:Ljava/lang/String;

    .line 349
    return-void
.end method

.method public setObjectUri(Ljava/lang/String;)V
    .locals 0
    .parameter "objectUri"

    .prologue
    .line 356
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mObjectUri:Ljava/lang/String;

    .line 357
    return-void
.end method

.method public setPeerAddr(Ljava/lang/String;)V
    .locals 0
    .parameter "peerAddr"

    .prologue
    .line 390
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerAddr:Ljava/lang/String;

    .line 391
    return-void
.end method

.method public setPeerName(Ljava/lang/String;)V
    .locals 0
    .parameter "peerName"

    .prologue
    .line 382
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mPeerName:Ljava/lang/String;

    .line 383
    return-void
.end method

.method public setResult(Ljava/lang/String;)V
    .locals 0
    .parameter "result"

    .prologue
    .line 340
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mResult:Ljava/lang/String;

    .line 341
    return-void
.end method

.method public setState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 332
    iput p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mState:I

    .line 333
    return-void
.end method

.method public setTotalBytes(J)V
    .locals 0
    .parameter "totalBytes"

    .prologue
    .line 398
    iput-wide p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->mTotalBytes:J

    .line 399
    return-void
.end method
