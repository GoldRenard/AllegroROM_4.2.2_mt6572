.class public Lcom/mediatek/bluetooth/psm/PsmMessage;
.super Lcom/mediatek/bluetooth/ilm/Message;
.source "PsmMessage.java"


# static fields
.field private static final PSM_MESSAGE_B_INDEX:I = 0x4

.field private static final PSM_MESSAGE_B_REF_COUNT:I = 0x0

.field private static final PSM_MESSAGE_S_MSG_LEN:I = 0x1


# direct methods
.method public constructor <init>(ILjava/nio/ByteBuffer;)V
    .locals 0
    .parameter "id"
    .parameter "content"

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lcom/mediatek/bluetooth/ilm/Message;-><init>(ILjava/nio/ByteBuffer;)V

    .line 64
    return-void
.end method

.method public constructor <init>([II)V
    .locals 1
    .parameter "messageDef"
    .parameter "connId"

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/ilm/Message;-><init>([I)V

    .line 75
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/psm/PsmMessage;->setRefCount(B)V

    .line 76
    iget v0, p0, Lcom/mediatek/bluetooth/ilm/Message;->size:I

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/psm/PsmMessage;->setMsgLen(S)V

    .line 77
    int-to-byte v0, p2

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/psm/PsmMessage;->setIndex(B)V

    .line 78
    return-void
.end method


# virtual methods
.method public getIndex()B
    .locals 1

    .prologue
    .line 93
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/psm/PsmMessage;->getByte(I)B

    move-result v0

    return v0
.end method

.method public getMsgLen()S
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/psm/PsmMessage;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getRefCount()B
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/psm/PsmMessage;->getByte(I)B

    move-result v0

    return v0
.end method

.method public setIndex(B)V
    .locals 1
    .parameter "index"

    .prologue
    .line 96
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Lcom/mediatek/bluetooth/psm/PsmMessage;->setByte(IB)V

    .line 97
    return-void
.end method

.method public setMsgLen(S)V
    .locals 1
    .parameter "msgLen"

    .prologue
    .line 90
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/mediatek/bluetooth/psm/PsmMessage;->setShort(IS)V

    .line 91
    return-void
.end method

.method public setRefCount(B)V
    .locals 1
    .parameter "refCount"

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/mediatek/bluetooth/psm/PsmMessage;->setByte(IB)V

    .line 85
    return-void
.end method
