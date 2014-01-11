.class public Lcom/mediatek/bluetooth/ilm/ilm_native;
.super Ljava/lang/Object;
.source "ilm_native.java"


# static fields
.field public static final END_OF_MOD_ID:I = 0x5

.field public static final EXT_IL_SOCKET_NAMESPACE_ABSTRACT:I = 0x0

.field public static final EXT_IL_SOCKET_NAMESPACE_FILESYSTEM:I = 0x2

.field public static final EXT_IL_SOCKET_NAMESPACE_RESERVED:I = 0x1

.field public static final MAX_ILM_BUFFER_SIZE:I = 0x800

.field public static final MOD_BT:I = 0x0

.field public static final MOD_MMI:I = 0x2

.field public static final MOD_SPP_DEFAULT:I = 0x4

.field public static final MOD_TIMER:I = 0x1

.field public static final MOD_TST:I = 0x3

.field public static final NULL:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 103
    const-string v0, "extsys_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native close_socket(I)V
.end method

.method public static native create_client_socket(Ljava/lang/String;I)I
.end method

.method public static native create_server_socket(Ljava/lang/String;I)I
.end method

.method public static native print_message_id()V
.end method

.method public static recv_message(ILcom/mediatek/bluetooth/ilm/Message;)I
    .locals 1
    .parameter "socketfd"
    .parameter "ilm"

    .prologue
    .line 85
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {p0, v0}, Lcom/mediatek/bluetooth/ilm/ilm_native;->recv_message0(ILjava/nio/ByteBuffer;)I

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/ilm/Message;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0
.end method

.method private static native recv_message0(ILjava/nio/ByteBuffer;)I
.end method

.method public static send_message(ILcom/mediatek/bluetooth/ilm/Message;I)I
    .locals 1
    .parameter "socketfd"
    .parameter "message"
    .parameter "size"

    .prologue
    .line 94
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {p0, v0, p2}, Lcom/mediatek/bluetooth/ilm/ilm_native;->send_message0(ILjava/nio/ByteBuffer;I)I

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/ilm/Message;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0
.end method

.method private static native send_message0(ILjava/nio/ByteBuffer;I)I
.end method
