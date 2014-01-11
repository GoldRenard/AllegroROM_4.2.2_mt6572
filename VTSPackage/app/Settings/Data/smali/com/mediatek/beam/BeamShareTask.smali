.class public Lcom/mediatek/beam/BeamShareTask;
.super Ljava/lang/Object;
.source "BeamShareTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/beam/BeamShareTask$Direction;,
        Lcom/mediatek/beam/BeamShareTask$BeamShareTaskMetaData;
    }
.end annotation


# static fields
.field public static final ID_NULL:I = -0x1

.field public static final SC_INCOMING_TASK:Ljava/lang/String; = "type in (0,2)"

.field public static final SC_OUTGOING_TASK:Ljava/lang/String; = "type in (1,3)"

.field public static final STATE_FAILURE:I = 0x0

.field public static final STATE_SUCCESS:I = 0x1

.field public static final TYPE_BLUETOOTH_INCOMING:I = 0x0

.field public static final TYPE_BLUETOOTH_OUTGOING:I = 0x1

.field public static final TYPE_WIFI_DIRECT_INCOMING:I = 0x2

.field public static final TYPE_WIFI_DIRECT_OUTGOING:I = 0x3


# instance fields
.field private mData:Ljava/lang/String;

.field private mDoneBytes:J

.field private mId:I

.field private mMimeType:Ljava/lang/String;

.field private mModifiedDate:J

.field private mState:I

.field private mTotalBytes:J

.field private mType:I


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .parameter "type"

    .prologue
    .line 126
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    .line 124
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mModifiedDate:J

    .line 128
    iput p1, p0, Lcom/mediatek/beam/BeamShareTask;->mType:I

    .line 129
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 2
    .parameter "cursor"

    .prologue
    .line 131
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    .line 124
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mModifiedDate:J

    .line 133
    const-string v0, "_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    .line 134
    const-string v0, "type"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/beam/BeamShareTask;->mType:I

    .line 135
    const-string v0, "state"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/beam/BeamShareTask;->mState:I

    .line 137
    const-string v0, "data"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/beam/BeamShareTask;->mData:Ljava/lang/String;

    .line 138
    const-string v0, "mime"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/beam/BeamShareTask;->mMimeType:Ljava/lang/String;

    .line 140
    const-string v0, "total"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mTotalBytes:J

    .line 141
    const-string v0, "done"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mDoneBytes:J

    .line 143
    const-string v0, "modified"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mModifiedDate:J

    .line 144
    return-void
.end method


# virtual methods
.method public getContentValues()Landroid/content/ContentValues;
    .locals 5

    .prologue
    .line 153
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 156
    .local v0, values:Landroid/content/ContentValues;
    iget v1, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 157
    const-string v1, "_id"

    iget v2, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 159
    :cond_0
    iget-wide v1, p0, Lcom/mediatek/beam/BeamShareTask;->mModifiedDate:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    .line 160
    const-string v1, "modified"

    iget-wide v2, p0, Lcom/mediatek/beam/BeamShareTask;->mModifiedDate:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 162
    :cond_1
    const-string v1, "type"

    iget v2, p0, Lcom/mediatek/beam/BeamShareTask;->mType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 163
    const-string v1, "state"

    iget v2, p0, Lcom/mediatek/beam/BeamShareTask;->mState:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 165
    const-string v1, "data"

    iget-object v2, p0, Lcom/mediatek/beam/BeamShareTask;->mData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    const-string v1, "mime"

    iget-object v2, p0, Lcom/mediatek/beam/BeamShareTask;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    const-string v1, "total"

    iget-wide v2, p0, Lcom/mediatek/beam/BeamShareTask;->mTotalBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 169
    const-string v1, "done"

    iget-wide v2, p0, Lcom/mediatek/beam/BeamShareTask;->mDoneBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 171
    return-object v0
.end method

.method public getData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/mediatek/beam/BeamShareTask;->mData:Ljava/lang/String;

    return-object v0
.end method

.method public getDirection()Lcom/mediatek/beam/BeamShareTask$Direction;
    .locals 1

    .prologue
    .line 191
    iget v0, p0, Lcom/mediatek/beam/BeamShareTask;->mType:I

    packed-switch v0, :pswitch_data_0

    .line 199
    sget-object v0, Lcom/mediatek/beam/BeamShareTask$Direction;->out:Lcom/mediatek/beam/BeamShareTask$Direction;

    :goto_0
    return-object v0

    .line 194
    :pswitch_0
    sget-object v0, Lcom/mediatek/beam/BeamShareTask$Direction;->in:Lcom/mediatek/beam/BeamShareTask$Direction;

    goto :goto_0

    .line 197
    :pswitch_1
    sget-object v0, Lcom/mediatek/beam/BeamShareTask$Direction;->out:Lcom/mediatek/beam/BeamShareTask$Direction;

    goto :goto_0

    .line 191
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getDoneBytes()J
    .locals 2

    .prologue
    .line 241
    iget-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mDoneBytes:J

    return-wide v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 257
    iget v0, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    return v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/mediatek/beam/BeamShareTask;->mMimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getModifiedDate()J
    .locals 2

    .prologue
    .line 249
    iget-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mModifiedDate:J

    return-wide v0
.end method

.method public getPrintableString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 176
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .local v3, res:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/mediatek/beam/BeamShareTask;->getContentValues()Landroid/content/ContentValues;

    move-result-object v0

    .line 178
    .local v0, cv:Landroid/content/ContentValues;
    invoke-virtual {v0}, Landroid/content/ContentValues;->valueSet()Ljava/util/Set;

    move-result-object v4

    .line 179
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

    .line 181
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

    .line 183
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 207
    iget v0, p0, Lcom/mediatek/beam/BeamShareTask;->mState:I

    return v0
.end method

.method public getTaskUri()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 108
    iget v0, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 110
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "null id task can\'t get uri"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    sget-object v0, Lcom/mediatek/beam/BeamShareTask$BeamShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    iget v1, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getTotalBytes()J
    .locals 2

    .prologue
    .line 233
    iget-wide v0, p0, Lcom/mediatek/beam/BeamShareTask;->mTotalBytes:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 265
    iget v0, p0, Lcom/mediatek/beam/BeamShareTask;->mType:I

    return v0
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0
    .parameter "data"

    .prologue
    .line 273
    iput-object p1, p0, Lcom/mediatek/beam/BeamShareTask;->mData:Ljava/lang/String;

    .line 274
    return-void
.end method

.method public setDoneBytes(J)V
    .locals 0
    .parameter "doneBytes"

    .prologue
    .line 245
    iput-wide p1, p0, Lcom/mediatek/beam/BeamShareTask;->mDoneBytes:J

    .line 246
    return-void
.end method

.method public setId(I)V
    .locals 0
    .parameter "id"

    .prologue
    .line 261
    iput p1, p0, Lcom/mediatek/beam/BeamShareTask;->mId:I

    .line 262
    return-void
.end method

.method public setMimeType(Ljava/lang/String;)V
    .locals 1
    .parameter "mimeType"

    .prologue
    .line 220
    if-eqz p1, :cond_0

    .line 226
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/beam/BeamShareTask;->mMimeType:Ljava/lang/String;

    .line 230
    :goto_0
    return-void

    .line 228
    :cond_0
    iput-object p1, p0, Lcom/mediatek/beam/BeamShareTask;->mMimeType:Ljava/lang/String;

    goto :goto_0
.end method

.method public setModifiedDate(J)V
    .locals 0
    .parameter "modifiedDate"

    .prologue
    .line 253
    iput-wide p1, p0, Lcom/mediatek/beam/BeamShareTask;->mModifiedDate:J

    .line 254
    return-void
.end method

.method public setState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 211
    iput p1, p0, Lcom/mediatek/beam/BeamShareTask;->mState:I

    .line 212
    return-void
.end method

.method public setTotalBytes(J)V
    .locals 0
    .parameter "totalBytes"

    .prologue
    .line 237
    iput-wide p1, p0, Lcom/mediatek/beam/BeamShareTask;->mTotalBytes:J

    .line 238
    return-void
.end method
