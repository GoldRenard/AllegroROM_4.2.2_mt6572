.class public Lcom/mediatek/bluetooth/ilm/MessageService;
.super Landroid/app/Service;
.source "MessageService.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final MSG_ID_SYS_SHUTDOWN_SERVICE_REQ:I = -0x1

.field private static SHUTDOWN_SERVICE_REQUEST:Lcom/mediatek/bluetooth/ilm/Message;


# instance fields
.field protected clientSocketFd:I

.field protected isListening:Z

.field protected listenerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/bluetooth/ilm/MessageListener;",
            ">;"
        }
    .end annotation
.end field

.field protected serverSocketFd:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 75
    new-instance v0, Lcom/mediatek/bluetooth/ilm/Message;

    sget-object v1, Lcom/mediatek/bluetooth/ilm/Message;->ILM:[I

    invoke-direct {v0, v1}, Lcom/mediatek/bluetooth/ilm/Message;-><init>([I)V

    sput-object v0, Lcom/mediatek/bluetooth/ilm/MessageService;->SHUTDOWN_SERVICE_REQUEST:Lcom/mediatek/bluetooth/ilm/Message;

    .line 77
    sget-object v0, Lcom/mediatek/bluetooth/ilm/MessageService;->SHUTDOWN_SERVICE_REQUEST:Lcom/mediatek/bluetooth/ilm/Message;

    const/4 v1, 0x1

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/bluetooth/ilm/Message;->setInt(II)V

    .line 78
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 69
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 83
    iput v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->clientSocketFd:I

    .line 88
    iput v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->serverSocketFd:I

    return-void
.end method


# virtual methods
.method protected closeSocket(I)V
    .locals 2
    .parameter "socketFd"

    .prologue
    .line 239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MessageService.closeSocket()[+]:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 241
    if-ltz p1, :cond_0

    .line 243
    invoke-static {p1}, Lcom/mediatek/bluetooth/ilm/ilm_native;->close_socket(I)V

    .line 245
    :cond_0
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 142
    const-string v0, "MessageService.onBind(): unimplemented function."

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 143
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 108
    const-string v0, "MessageService.onCreate()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 111
    iput-boolean v3, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->isListening:Z

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->listenerList:Ljava/util/ArrayList;

    .line 115
    const/4 v0, 0x1

    iget v1, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->serverSocketFd:I

    const-string v2, "bt.ext.adp.prx"

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/mediatek/bluetooth/ilm/MessageService;->openSocket(ZILjava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->serverSocketFd:I

    .line 116
    iget v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->clientSocketFd:I

    const-string v1, "/dev/socket/bt.int.adp"

    invoke-virtual {p0, v3, v0, v1, v5}, Lcom/mediatek/bluetooth/ilm/MessageService;->openSocket(ZILjava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->clientSocketFd:I

    .line 118
    iget v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->serverSocketFd:I

    if-le v0, v4, :cond_0

    iget v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->clientSocketFd:I

    if-le v0, v4, :cond_0

    .line 120
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/ilm/MessageService;->startListen()V

    .line 125
    :goto_0
    return-void

    .line 123
    :cond_0
    const-string v0, "MessageService.onCreate() error: can\'t create server & client sockets."

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 130
    const-string v0, "MessageService.onDestroy()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 133
    iget v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->clientSocketFd:I

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/ilm/MessageService;->closeSocket(I)V

    .line 136
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/ilm/MessageService;->stopListen()V

    .line 137
    return-void
.end method

.method protected openSocket(ZILjava/lang/String;I)I
    .locals 2
    .parameter "isServer"
    .parameter "socketFd"
    .parameter "socketName"
    .parameter "socketNamespace"

    .prologue
    .line 213
    if-ltz p2, :cond_0

    .line 215
    invoke-virtual {p0, p2}, Lcom/mediatek/bluetooth/ilm/MessageService;->closeSocket(I)V

    .line 219
    :cond_0
    if-eqz p1, :cond_2

    .line 221
    invoke-static {p3, p4}, Lcom/mediatek/bluetooth/ilm/ilm_native;->create_server_socket(Ljava/lang/String;I)I

    move-result p2

    .line 228
    :goto_0
    if-gez p2, :cond_1

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MessageService.openSocket() error: isServer["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], fd["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], name["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], namespace["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 234
    :cond_1
    return p2

    .line 224
    :cond_2
    invoke-static {p3, p4}, Lcom/mediatek/bluetooth/ilm/ilm_native;->create_client_socket(Ljava/lang/String;I)I

    move-result p2

    goto :goto_0
.end method

.method public declared-synchronized registerMessageListener(Lcom/mediatek/bluetooth/ilm/MessageListener;)V
    .locals 1
    .parameter "messageListener"

    .prologue
    .line 185
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->listenerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    monitor-exit p0

    return-void

    .line 185
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    .line 273
    const/4 v5, -0x1

    .line 274
    .local v5, res:I
    iput-boolean v10, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->isListening:Z

    .line 275
    :cond_0
    :goto_0
    iget-boolean v8, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->isListening:Z

    if-eqz v8, :cond_1

    .line 279
    const-string v8, "MessageService.run() - listening message..."

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 284
    :try_start_0
    new-instance v2, Lcom/mediatek/bluetooth/ilm/Message;

    sget-object v8, Lcom/mediatek/bluetooth/ilm/Message;->ILM:[I

    invoke-direct {v2, v8}, Lcom/mediatek/bluetooth/ilm/Message;-><init>([I)V

    .line 285
    .local v2, ilm:Lcom/mediatek/bluetooth/ilm/Message;
    iget v8, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->serverSocketFd:I

    invoke-static {v8, v2}, Lcom/mediatek/bluetooth/ilm/ilm_native;->recv_message(ILcom/mediatek/bluetooth/ilm/Message;)I

    move-result v5

    .line 286
    if-ne v5, v10, :cond_3

    .line 291
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "MessageService.run(): recv message["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/ilm/Message;->toPrintString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 295
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Lcom/mediatek/bluetooth/ilm/Message;->getInt(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 298
    .local v4, msgId:I
    const/4 v8, -0x1

    if-ne v4, v8, :cond_2

    .line 321
    .end local v2           #ilm:Lcom/mediatek/bluetooth/ilm/Message;
    .end local v4           #msgId:I
    :cond_1
    iget v8, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->serverSocketFd:I

    invoke-virtual {p0, v8}, Lcom/mediatek/bluetooth/ilm/MessageService;->closeSocket(I)V

    .line 322
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->listenerList:Ljava/util/ArrayList;

    .line 323
    return-void

    .line 301
    .restart local v2       #ilm:Lcom/mediatek/bluetooth/ilm/Message;
    .restart local v4       #msgId:I
    :cond_2
    const/16 v8, 0x1c

    const/4 v9, 0x4

    :try_start_1
    invoke-virtual {v2, v8, v9}, Lcom/mediatek/bluetooth/ilm/Message;->getBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v6

    .line 302
    .local v6, sb:Ljava/nio/ShortBuffer;
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v7

    .line 305
    .local v7, size:I
    iget-object v8, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->listenerList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/bluetooth/ilm/MessageListener;

    .line 307
    .local v3, listener:Lcom/mediatek/bluetooth/ilm/MessageListener;
    const/16 v8, 0x1c

    invoke-virtual {v2, v8, v7}, Lcom/mediatek/bluetooth/ilm/Message;->getBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-interface {v3, v4, v8}, Lcom/mediatek/bluetooth/ilm/MessageListener;->onMessageReceived(ILjava/nio/ByteBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 314
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #ilm:Lcom/mediatek/bluetooth/ilm/Message;
    .end local v3           #listener:Lcom/mediatek/bluetooth/ilm/MessageListener;
    .end local v4           #msgId:I
    .end local v6           #sb:Ljava/nio/ShortBuffer;
    .end local v7           #size:I
    :catch_0
    move-exception v0

    .line 316
    .local v0, ex:Ljava/lang/Exception;
    const-string v8, "MessageService.run() error: "

    invoke-static {v8, v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 311
    .end local v0           #ex:Ljava/lang/Exception;
    .restart local v2       #ilm:Lcom/mediatek/bluetooth/ilm/Message;
    :cond_3
    :try_start_2
    const-string v8, "MessageService.run(): revc_message() failed"

    invoke-static {v8}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0
.end method

.method public send(Lcom/mediatek/bluetooth/ilm/Message;)V
    .locals 6
    .parameter "message"

    .prologue
    .line 155
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "send()[+]: msgId["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/ilm/Message;->getId()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 160
    new-instance v2, Lcom/mediatek/bluetooth/ilm/Message;

    sget-object v4, Lcom/mediatek/bluetooth/ilm/Message;->ILM:[I

    invoke-direct {v2, v4}, Lcom/mediatek/bluetooth/ilm/Message;-><init>([I)V

    .line 161
    .local v2, ilms:Lcom/mediatek/bluetooth/ilm/Message;
    const/4 v4, 0x1

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/ilm/Message;->getId()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Lcom/mediatek/bluetooth/ilm/Message;->setInt(II)V

    .line 162
    const/4 v4, 0x3

    const/4 v5, 0x2

    invoke-virtual {v2, v4, v5}, Lcom/mediatek/bluetooth/ilm/Message;->setInt(II)V

    .line 163
    const/4 v4, 0x4

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lcom/mediatek/bluetooth/ilm/Message;->setInt(II)V

    .line 166
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/ilm/Message;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 168
    .local v1, data:Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Lcom/mediatek/bluetooth/ilm/Message;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 169
    .local v0, bb:Ljava/nio/ByteBuffer;
    const/16 v4, 0x1c

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 170
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 171
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 174
    invoke-virtual {v2}, Lcom/mediatek/bluetooth/ilm/Message;->size()I

    move-result v4

    add-int/lit16 v4, v4, -0x800

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/ilm/Message;->size()I

    move-result v5

    add-int v3, v4, v5

    .line 175
    .local v3, size:I
    iget v4, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->clientSocketFd:I

    invoke-static {v4, v2, v3}, Lcom/mediatek/bluetooth/ilm/ilm_native;->send_message(ILcom/mediatek/bluetooth/ilm/Message;I)I

    .line 176
    return-void
.end method

.method protected startListen()V
    .locals 2

    .prologue
    .line 252
    const-string v0, "MessageService.startListen()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 256
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "MessageServiceThread"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 257
    return-void
.end method

.method protected declared-synchronized stopListen()V
    .locals 3

    .prologue
    .line 261
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->isListening:Z

    if-eqz v1, :cond_0

    .line 263
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->isListening:Z

    .line 265
    const-string v1, "bt.ext.adp.prx"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/ilm/ilm_native;->create_client_socket(Ljava/lang/String;I)I

    move-result v0

    .line 266
    .local v0, fd:I
    sget-object v1, Lcom/mediatek/bluetooth/ilm/MessageService;->SHUTDOWN_SERVICE_REQUEST:Lcom/mediatek/bluetooth/ilm/Message;

    sget-object v2, Lcom/mediatek/bluetooth/ilm/MessageService;->SHUTDOWN_SERVICE_REQUEST:Lcom/mediatek/bluetooth/ilm/Message;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/ilm/Message;->size()I

    move-result v2

    add-int/lit16 v2, v2, -0x800

    invoke-static {v0, v1, v2}, Lcom/mediatek/bluetooth/ilm/ilm_native;->send_message(ILcom/mediatek/bluetooth/ilm/Message;I)I

    .line 267
    invoke-static {v0}, Lcom/mediatek/bluetooth/ilm/ilm_native;->close_socket(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    .end local v0           #fd:I
    :cond_0
    monitor-exit p0

    return-void

    .line 261
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized unregisterMessageListener(Lcom/mediatek/bluetooth/ilm/MessageListener;)V
    .locals 1
    .parameter "messageListener"

    .prologue
    .line 195
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/ilm/MessageService;->listenerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    monitor-exit p0

    return-void

    .line 195
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
