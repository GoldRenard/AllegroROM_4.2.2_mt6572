.class public Lcom/mediatek/bluetooth/ilm/Message;
.super Ljava/lang/Object;
.source "Message.java"


# static fields
.field protected static final ILM:[I = null

.field protected static final ILM_BA_ILM_DATA:I = 0x1c

.field protected static final ILM_BL_ILM_DATA:I = 0x800

.field protected static final ILM_B_SAP_ID:I = 0x14

.field protected static final ILM_B_USED:I = 0x0

.field protected static final ILM_I_DEST_MOD_ID:I = 0x4

.field protected static final ILM_I_LOCAL_PARA_PTR:I = 0x2

.field protected static final ILM_I_MSG_ID:I = 0x1

.field protected static final ILM_I_PEER_BUFF_PTR:I = 0x6

.field protected static final ILM_I_SRC_MOD_ID:I = 0x3


# instance fields
.field private buffer:Ljava/nio/ByteBuffer;

.field protected id:I

.field protected size:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mediatek/bluetooth/ilm/Message;->ILM:[I

    return-void

    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x1ct 0x8t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>(ILjava/nio/ByteBuffer;)V
    .locals 1
    .parameter "id"
    .parameter "content"

    .prologue
    .line 95
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput p1, p0, Lcom/mediatek/bluetooth/ilm/Message;->id:I

    .line 98
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->size:I

    .line 99
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    .line 100
    return-void
.end method

.method public constructor <init>([I)V
    .locals 2
    .parameter "messageDef"

    .prologue
    const/4 v1, 0x1

    .line 81
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 83
    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->id:I

    .line 84
    aget v0, p1, v1

    iput v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->size:I

    .line 85
    aget v0, p1, v1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    .line 86
    return-void
.end method


# virtual methods
.method protected getBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method protected getBuffer(II)Ljava/nio/ByteBuffer;
    .locals 3
    .parameter "index"
    .parameter "length"

    .prologue
    .line 125
    iget-object v1, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 126
    iget-object v1, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    add-int v2, p1, p2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 127
    iget-object v1, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 128
    .local v0, result:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 129
    iget-object v1, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 130
    iget-object v1, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 131
    return-object v0
.end method

.method public getByte(I)B
    .locals 1
    .parameter "field"

    .prologue
    .line 139
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    return v0
.end method

.method public getByteArray(II)[B
    .locals 4
    .parameter "field"
    .parameter "length"

    .prologue
    .line 164
    new-array v1, p2, [B

    .line 165
    .local v1, result:[B
    iget-object v2, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 166
    iget-object v2, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    add-int v3, p1, p2

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 168
    iget-object v2, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 169
    .local v0, bb:Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 172
    iget-object v2, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    iget-object v2, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 174
    return-object v1
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->id:I

    return v0
.end method

.method public getInt(I)I
    .locals 1
    .parameter "field"

    .prologue
    .line 151
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/IntBuffer;->get(I)I

    move-result v0

    return v0
.end method

.method public getLong(I)J
    .locals 2
    .parameter "field"

    .prologue
    .line 157
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asLongBuffer()Ljava/nio/LongBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/LongBuffer;->get(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getShort(I)S
    .locals 1
    .parameter "field"

    .prologue
    .line 145
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v0

    return v0
.end method

.method public setByte(IB)V
    .locals 1
    .parameter "field"
    .parameter "value"

    .prologue
    .line 142
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 143
    return-void
.end method

.method public setByteArray(II[B)V
    .locals 3
    .parameter "field"
    .parameter "length"
    .parameter "value"

    .prologue
    .line 178
    if-eqz p3, :cond_0

    array-length v0, p3

    if-eq v0, p2, :cond_1

    .line 180
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "value["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] is null or length doesn\'t equal to ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 183
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 184
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 188
    return-void
.end method

.method public setInt(II)V
    .locals 1
    .parameter "field"
    .parameter "value"

    .prologue
    .line 154
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/nio/IntBuffer;->put(II)Ljava/nio/IntBuffer;

    .line 155
    return-void
.end method

.method public setLong(IJ)V
    .locals 1
    .parameter "field"
    .parameter "value"

    .prologue
    .line 160
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asLongBuffer()Ljava/nio/LongBuffer;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/LongBuffer;->put(IJ)Ljava/nio/LongBuffer;

    .line 161
    return-void
.end method

.method public setShort(IS)V
    .locals 1
    .parameter "field"
    .parameter "value"

    .prologue
    .line 148
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    .line 149
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 108
    iget v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->size:I

    return v0
.end method

.method public toHexString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->buffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/ConvertUtils;->toHexString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toPrintString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "name["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/bluetooth/ilm/Message;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "size["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/ilm/Message;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
