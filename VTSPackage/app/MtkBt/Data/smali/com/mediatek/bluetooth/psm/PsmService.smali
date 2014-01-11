.class public abstract Lcom/mediatek/bluetooth/psm/PsmService;
.super Lcom/mediatek/bluetooth/ilm/MessageService;
.source "PsmService.java"

# interfaces
.implements Lcom/mediatek/bluetooth/ilm/MessageListener;
.implements Landroid/os/Handler$Callback;


# instance fields
.field private handler:Landroid/os/Handler;

.field private handlerThread:Landroid/os/HandlerThread;

.field private psmActionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mediatek/bluetooth/psm/Psm;",
            ">;"
        }
    .end annotation
.end field

.field private psmList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/bluetooth/psm/Psm;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/mediatek/bluetooth/ilm/MessageService;-><init>()V

    return-void
.end method


# virtual methods
.method public getHandlerLooper()Landroid/os/Looper;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handlerThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    .line 280
    const-string v0, "fail to get looper from PsmService (handlerThread is null)"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 281
    const/4 v0, 0x0

    .line 284
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    goto :goto_0
.end method

.method protected abstract getProfileCount()I
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 9
    .parameter "msg"

    .prologue
    .line 238
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "handleMessage()[+]: msgId["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 242
    iget v5, p1, Landroid/os/Message;->what:I

    .line 243
    .local v5, msgId:I
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 246
    .local v0, content:Ljava/nio/ByteBuffer;
    const/4 v3, 0x0

    .line 247
    .local v3, isMessageHandled:Z
    new-instance v4, Lcom/mediatek/bluetooth/psm/PsmMessage;

    invoke-direct {v4, v5, v0}, Lcom/mediatek/bluetooth/psm/PsmMessage;-><init>(ILjava/nio/ByteBuffer;)V

    .line 249
    .local v4, message:Lcom/mediatek/bluetooth/psm/PsmMessage;
    :try_start_0
    iget-object v7, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/bluetooth/psm/Psm;

    .line 250
    .local v6, psm:Lcom/mediatek/bluetooth/psm/Psm;
    invoke-virtual {v6, v5}, Lcom/mediatek/bluetooth/psm/Psm;->isValidMessage(I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 252
    invoke-virtual {v6, v4}, Lcom/mediatek/bluetooth/psm/Psm;->handleMessage(Lcom/mediatek/bluetooth/psm/PsmMessage;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    const/4 v3, 0x1

    goto :goto_0

    .line 257
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v6           #psm:Lcom/mediatek/bluetooth/psm/Psm;
    :catch_0
    move-exception v1

    .line 259
    .local v1, ex:Ljava/lang/Exception;
    const-string v7, "Fail to loop psm-list for message handling: "

    invoke-static {v7, v1}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 263
    .end local v1           #ex:Ljava/lang/Exception;
    :cond_1
    if-nez v3, :cond_2

    .line 264
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "cann\'t find Profile to handle received message:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/psm/PsmMessage;->toPrintString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    .line 268
    :cond_2
    const/4 v7, 0x1

    return v7
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 6
    .parameter "intent"

    .prologue
    const/4 v3, 0x0

    .line 164
    const-string v4, "PsmService.onBind()[+]"

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 167
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, action:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 170
    const-string v4, "onBind() error: invalid action(null)"

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    .line 183
    :goto_0
    return-object v3

    .line 175
    :cond_0
    iget-object v4, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmActionMap:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/bluetooth/psm/Psm;

    .line 176
    .local v2, psm:Lcom/mediatek/bluetooth/psm/Psm;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/psm/Psm;->onServiceBind()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 178
    invoke-virtual {v2}, Lcom/mediatek/bluetooth/psm/Psm;->getServiceBinder()Lcom/mediatek/bluetooth/psm/PsmServiceBinder;

    move-result-object v3

    invoke-interface {v3}, Lcom/mediatek/bluetooth/psm/PsmServiceBinder;->getBinder()Landroid/os/IBinder;

    move-result-object v3

    goto :goto_0

    .line 181
    :cond_1
    if-nez v2, :cond_2

    const-string v1, "psm is null"

    .line 182
    .local v1, msg:Ljava/lang/String;
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onBind() error: cann\'t find service for action:["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "], reason["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 181
    .end local v1           #msg:Ljava/lang/String;
    :cond_2
    const-string v1, "psm.onServiceBind() failed"

    goto :goto_1
.end method

.method public onCreate()V
    .locals 5

    .prologue
    .line 105
    const-string v2, "PsmService.onCreate()[+]"

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 108
    invoke-super {p0}, Lcom/mediatek/bluetooth/ilm/MessageService;->onCreate()V

    .line 111
    new-instance v2, Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/psm/PsmService;->getProfileCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    iput-object v2, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmActionMap:Ljava/util/HashMap;

    .line 112
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/psm/PsmService;->getProfileCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmList:Ljava/util/ArrayList;

    .line 113
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/psm/PsmService;->registerProfileServices()V

    .line 116
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "PsmServiceHandler"

    const/16 v4, 0xa

    invoke-direct {v2, v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v2, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handlerThread:Landroid/os/HandlerThread;

    .line 117
    iget-object v2, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->start()V

    .line 118
    new-instance v2, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/psm/PsmService;->getHandlerLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v2, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handler:Landroid/os/Handler;

    .line 121
    invoke-virtual {p0, p0}, Lcom/mediatek/bluetooth/psm/PsmService;->registerMessageListener(Lcom/mediatek/bluetooth/ilm/MessageListener;)V

    .line 124
    iget-object v2, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/bluetooth/psm/Psm;

    .line 125
    .local v1, psm:Lcom/mediatek/bluetooth/psm/Psm;
    invoke-virtual {v1}, Lcom/mediatek/bluetooth/psm/Psm;->onServiceCreate()V

    goto :goto_0

    .line 127
    .end local v1           #psm:Lcom/mediatek/bluetooth/psm/Psm;
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 132
    const-string v3, "PsmService.onDestroy()[+]"

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 135
    iget-object v3, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/bluetooth/psm/Psm;

    .line 136
    .local v2, psm:Lcom/mediatek/bluetooth/psm/Psm;
    invoke-virtual {v2}, Lcom/mediatek/bluetooth/psm/Psm;->onServiceDestroy()V

    goto :goto_0

    .line 140
    .end local v2           #psm:Lcom/mediatek/bluetooth/psm/Psm;
    :cond_0
    invoke-virtual {p0, p0}, Lcom/mediatek/bluetooth/psm/PsmService;->unregisterMessageListener(Lcom/mediatek/bluetooth/ilm/MessageListener;)V

    .line 143
    iget-object v3, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->quit()Z

    .line 145
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handlerThread:Landroid/os/HandlerThread;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v3, v4, v5}, Landroid/os/HandlerThread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :goto_1
    iput-object v6, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handlerThread:Landroid/os/HandlerThread;

    .line 154
    iget-object v3, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 155
    iput-object v6, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmActionMap:Ljava/util/HashMap;

    .line 158
    invoke-super {p0}, Lcom/mediatek/bluetooth/ilm/MessageService;->onDestroy()V

    .line 159
    return-void

    .line 147
    :catch_0
    move-exception v0

    .line 149
    .local v0, e:Ljava/lang/InterruptedException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PsmServiceHandler thread is not stopped: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->w(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onMessageReceived(ILjava/nio/ByteBuffer;)V
    .locals 2
    .parameter "messageId"
    .parameter "content"

    .prologue
    .line 228
    iget-object v0, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/mediatek/bluetooth/psm/PsmService;->handler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 229
    return-void
.end method

.method protected declared-synchronized registerProfile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "action"
    .parameter "className"

    .prologue
    .line 200
    monitor-enter p0

    :try_start_0
    const-string v3, "PsmService.registerProfile()[+]"

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 204
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PsmService.registerProfile(): action["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "], profile["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 208
    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Lcom/mediatek/bluetooth/psm/PsmService;

    aput-object v4, v0, v3

    .line 209
    .local v0, paramType:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v1, v3

    .line 210
    .local v1, paramValue:[Ljava/lang/Object;
    invoke-static {p2, v0, v1}, Lcom/mediatek/bluetooth/util/ClassUtils;->newObject(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/bluetooth/psm/Psm;

    .line 211
    .local v2, psm:Lcom/mediatek/bluetooth/psm/Psm;
    if-nez v2, :cond_0

    .line 213
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PsmService.registerProfile() error: className["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    :goto_0
    monitor-exit p0

    return-void

    .line 218
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmActionMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    iget-object v3, p0, Lcom/mediatek/bluetooth/psm/PsmService;->psmList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 200
    .end local v0           #paramType:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    .end local v1           #paramValue:[Ljava/lang/Object;
    .end local v2           #psm:Lcom/mediatek/bluetooth/psm/Psm;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method protected abstract registerProfileServices()V
.end method
