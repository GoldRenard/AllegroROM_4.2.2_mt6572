.class public Lcom/mediatek/bluetooth/opp/adp/OppService;
.super Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;
.source "OppService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;,
        Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;
    }
.end annotation


# instance fields
.field private mIsOppcResetTask:Z

.field private mIsOppsResetTask:Z

.field private mIsTaskWorkThreadInterrupted:Z

.field private mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

.field private mOppcCurrentStoragePath:Ljava/lang/String;

.field private mOppcWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

.field private mOppsCurrentStoragePath:Ljava/lang/String;

.field private mOppsWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

.field private mSdcardBroadcastReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;-><init>()V

    .line 71
    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsTaskWorkThreadInterrupted:Z

    .line 75
    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppcResetTask:Z

    .line 79
    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppsResetTask:Z

    .line 81
    iput-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;

    .line 83
    iput-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;

    .line 85
    iput-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mSdcardBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 595
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppcResetTask:Z

    return v0
.end method

.method static synthetic access$202(Lcom/mediatek/bluetooth/opp/adp/OppService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppcResetTask:Z

    return p1
.end method

.method static synthetic access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsTaskWorkThreadInterrupted:Z

    return v0
.end method

.method static synthetic access$500(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppsResetTask:Z

    return v0
.end method

.method static synthetic access$502(Lcom/mediatek/bluetooth/opp/adp/OppService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppsResetTask:Z

    return p1
.end method

.method private registerSdcardBroadcastReceiver()V
    .locals 2

    .prologue
    .line 89
    const-string v1, "OppService.registerSdcardBroadcastReceiver()[+]"

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 91
    new-instance v1, Lcom/mediatek/bluetooth/opp/adp/OppService$1;

    invoke-direct {v1, p0}, Lcom/mediatek/bluetooth/opp/adp/OppService$1;-><init>(Lcom/mediatek/bluetooth/opp/adp/OppService;)V

    iput-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mSdcardBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 120
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 121
    .local v0, intentFilter:Landroid/content/IntentFilter;
    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 122
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mSdcardBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 123
    return-void
.end method

.method private unregisterSdCardBroadcastReceiver()V
    .locals 1

    .prologue
    .line 127
    const-string v0, "OppService.unregisterSdCardBroadcastReceiver()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 129
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mSdcardBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mSdcardBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 133
    :cond_0
    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 6

    .prologue
    const/16 v5, 0xb

    const/16 v4, 0xa

    const/16 v3, 0xe

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 138
    const-string v0, "OppService.onCreate()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 142
    invoke-super {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->onCreate()V

    .line 143
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    if-nez v0, :cond_0

    .line 145
    const-string v0, "OppService native onCreate failed."

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 147
    invoke-static {p0, v2, v3}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 149
    invoke-static {p0, v1, v3}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 151
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->stopSelf()V

    .line 201
    :goto_0
    return-void

    .line 156
    :cond_0
    invoke-static {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getInstance(Landroid/content/Context;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    .line 157
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v0, p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->setOppService(Lcom/mediatek/bluetooth/opp/adp/OppService;)V

    .line 158
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->cancelAllNotification()V

    .line 161
    invoke-direct {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->registerSdcardBroadcastReceiver()V

    .line 165
    invoke-static {p0, v2, v4}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 166
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcEnable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 168
    invoke-static {p0, v2, v5}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 175
    :goto_1
    invoke-static {p0, v1, v4}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 177
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 179
    invoke-static {p0, v1, v5}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 187
    :goto_2
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    const-string v1, "BtOppc"

    new-instance v2, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;

    invoke-direct {v2, p0}, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;-><init>(Lcom/mediatek/bluetooth/opp/adp/OppService;)V

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;-><init>(Ljava/lang/String;Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    .line 188
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;->start()V

    .line 189
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    const-string v1, "BtOpps"

    new-instance v2, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;

    invoke-direct {v2, p0}, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;-><init>(Lcom/mediatek/bluetooth/opp/adp/OppService;)V

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;-><init>(Ljava/lang/String;Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    .line 190
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;->start()V

    .line 200
    const-string v0, "OppService.onCreate()[-]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 171
    :cond_1
    invoke-static {p0, v2, v3}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    goto :goto_1

    .line 182
    :cond_2
    invoke-static {p0, v1, v3}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    goto :goto_2
.end method

.method public onDestroy()V
    .locals 5

    .prologue
    const/16 v4, 0xe

    const/16 v3, 0xd

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 206
    const-string v0, "OppService.onDestroy()[+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 208
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppOnServiceStop()V

    .line 215
    const-string v0, "OppService.onDestroy() interrupt OppTaskWorkerThread..."

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 216
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;->interrupt()V

    .line 217
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;->interrupt()V

    .line 219
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsTaskWorkThreadInterrupted:Z

    .line 222
    const-string v0, "OppService.onDestroy() disable oppc/opps native service..."

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 223
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcDisable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 225
    invoke-static {p0, v1, v3}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 231
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsDisable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 233
    invoke-static {p0, v2, v3}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    .line 241
    :goto_1
    invoke-direct {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->unregisterSdCardBroadcastReceiver()V

    .line 245
    :cond_0
    const-string v0, "OppService.onDestroy() call native destroy()..."

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 246
    invoke-super {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->onDestroy()V

    .line 249
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    if-eqz v0, :cond_1

    .line 251
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->setOppService(Lcom/mediatek/bluetooth/opp/adp/OppService;)V

    .line 254
    :cond_1
    const-string v0, "OppService.onDestroy()[-]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 255
    return-void

    .line 228
    :cond_2
    invoke-static {p0, v1, v4}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    goto :goto_0

    .line 236
    :cond_3
    invoke-static {p0, v2, v4}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendActivationBroadcast(Landroid/content/Context;ZI)V

    goto :goto_1
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    .line 260
    const-string v1, "OppService.onStartCommand()[+]"

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 263
    iget-boolean v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    if-eqz v1, :cond_2

    if-eqz p1, :cond_2

    .line 265
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 266
    .local v0, action:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OppService.onStartCommand() action: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 269
    const-string v1, "com.mediatek.bluetooth.opp.action.OPPC_START"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 271
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;->notifyNewTask()V

    .line 288
    .end local v0           #action:Ljava/lang/String;
    :goto_0
    const-string v1, "OppService.onStartCommand()[-]"

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 289
    invoke-super {p0, p1, p2, p3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->onStartCommand(Landroid/content/Intent;II)I

    move-result v1

    return v1

    .line 272
    .restart local v0       #action:Ljava/lang/String;
    :cond_0
    const-string v1, "com.mediatek.bluetooth.opp.action.OPPS_START"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 275
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsStopListenDisconnect()V

    .line 276
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;->notifyNewTask()V

    goto :goto_0

    .line 281
    :cond_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsWorker:Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskWorkerThread;->notifyNewTask()V

    goto :goto_0

    .line 284
    .end local v0           #action:Ljava/lang/String;
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OppService.onStartCommand() warn: isServiceNativeEnabled["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] or null Intent"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    goto :goto_0
.end method
