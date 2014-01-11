.class public Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;
.super Landroid/app/Service;
.source "OppServiceNative.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;,
        Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;
    }
.end annotation


# static fields
.field private static final NATIVE_LIB:Ljava/lang/String; = "extopp_jni"

.field private static sMessageListener:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;


# instance fields
.field mIsAuthorized:Z

.field mIsListenDisconnect:Z

.field protected mIsServiceNativeEnabled:Z

.field private mNativeData:I

.field private mOppcCurrentTask:Landroid/net/Uri;

.field private mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mediatek/bluetooth/opp/adp/EventQueue",
            "<",
            "Lcom/mediatek/bluetooth/opp/adp/OppEvent;",
            ">;"
        }
    .end annotation
.end field

.field private mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

.field private mOppsCurrentTask:Landroid/net/Uri;

.field private mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mediatek/bluetooth/opp/adp/EventQueue",
            "<",
            "Lcom/mediatek/bluetooth/opp/adp/OppEvent;",
            ">;"
        }
    .end annotation
.end field

.field private mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->sMessageListener:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;

    .line 1033
    const-string v0, "extopp_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 1034
    invoke-static {}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->classInitNative()V

    .line 1035
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/16 v3, 0x4e20

    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 61
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 64
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {v0, v3, v2}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;-><init>(II)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    .line 68
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 71
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {v0, v3, v2}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;-><init>(II)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    .line 74
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    .line 614
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsAuthorized:Z

    .line 735
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsListenDisconnect:Z

    .line 1017
    return-void
.end method

.method private checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mediatek/bluetooth/opp/adp/EventQueue",
            "<",
            "Lcom/mediatek/bluetooth/opp/adp/OppEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p1, queue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;,"Lcom/mediatek/bluetooth/opp/adp/EventQueue<Lcom/mediatek/bluetooth/opp/adp/OppEvent;>;"
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "queue size["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->getPrintableString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 173
    :cond_0
    return-void
.end method

.method protected static native classInitNative()V
.end method

.method private jniCallback(I[Ljava/lang/String;)V
    .locals 3
    .parameter "event"
    .parameter "parameters"

    .prologue
    .line 139
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    invoke-direct {v0, p1, p2}, Lcom/mediatek/bluetooth/opp/adp/OppEvent;-><init>(I[Ljava/lang/String;)V

    .line 144
    .local v0, newEvent:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "jni cb event: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 148
    if-lez p1, :cond_0

    const/16 v1, 0x1e

    if-ge p1, v1, :cond_0

    .line 150
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v1, v0}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->notifyNewEvent(Ljava/lang/Object;)V

    .line 157
    :goto_0
    return-void

    .line 151
    :cond_0
    const/16 v1, 0x64

    if-ge v1, p1, :cond_1

    const/16 v1, 0x82

    if-ge p1, v1, :cond_1

    .line 153
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v1, v0}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->notifyNewEvent(Ljava/lang/Object;)V

    goto :goto_0

    .line 155
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid jni cb event["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private oppcFinalEvent(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)Z
    .locals 2
    .parameter "task"
    .parameter "result"

    .prologue
    .line 593
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-eq v0, v1, :cond_1

    .line 595
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 602
    :cond_0
    :goto_0
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 603
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 604
    return p2

    .line 596
    :cond_1
    if-nez p2, :cond_0

    .line 598
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    goto :goto_0
.end method

.method private oppsFinalEvent(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)Z
    .locals 2
    .parameter "task"
    .parameter "result"

    .prologue
    .line 964
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 966
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 974
    :cond_0
    :goto_0
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 975
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 976
    return p2

    .line 967
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-eq v0, v1, :cond_2

    .line 969
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    goto :goto_0

    .line 970
    :cond_2
    if-nez p2, :cond_0

    .line 972
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    goto :goto_0
.end method


# virtual methods
.method protected native disableServiceNative()V
.end method

.method protected native enableServiceNative()Z
.end method

.method protected native objectDeinitNative()V
.end method

.method protected native objectInitNative()V
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 126
    const-string v0, "unsupported function: OppServiceNative.onBind()"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 127
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 83
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 86
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->objectInitNative()V

    .line 87
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->enableServiceNative()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    .line 92
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    if-eqz v0, :cond_0

    .line 95
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->sMessageListener:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;

    if-nez v0, :cond_0

    .line 96
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;-><init>(Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;)V

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->sMessageListener:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;

    .line 97
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->sMessageListener:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$MessageListener;->startup()V

    .line 100
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    if-eqz v0, :cond_0

    .line 115
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsServiceNativeEnabled:Z

    .line 116
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->disableServiceNative()V

    .line 119
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->objectDeinitNative()V

    .line 120
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 121
    return-void
.end method

.method public oppcAbort(Landroid/net/Uri;)Z
    .locals 2
    .parameter "task"

    .prologue
    .line 324
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcCurrentTask:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 326
    :cond_0
    const/4 v0, 0x0

    .line 334
    :goto_0
    return v0

    .line 329
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-eq v0, v1, :cond_2

    .line 332
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 334
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected native oppcAbortNative()Z
.end method

.method public oppcConnect(Ljava/lang/String;)Z
    .locals 5
    .parameter "peerAddr"

    .prologue
    const/4 v2, 0x0

    .line 262
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 263
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 264
    invoke-virtual {p0, p1}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcConnectNative(Ljava/lang/String;)Z

    .line 267
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 268
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v0, :cond_0

    .line 270
    const-string v3, "oppcConnect get NULL event (no available event and return-threshold is reach)"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 288
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :goto_1
    return v2

    .line 272
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_0
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_1

    .line 274
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 275
    const/4 v2, 0x1

    goto :goto_1

    .line 276
    :cond_1
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x10

    if-ne v3, v4, :cond_2

    .line 279
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 285
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :catch_0
    move-exception v1

    .line 287
    .local v1, ex:Ljava/lang/InterruptedException;
    const-string v3, "oppcConnect thread interrupted"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    goto :goto_1

    .line 282
    .end local v1           #ex:Ljava/lang/InterruptedException;
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_2
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid oppcConnect event: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected native oppcConnectNative(Ljava/lang/String;)Z
.end method

.method public oppcDisable()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 219
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 220
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 221
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcDisableNative()Z

    .line 224
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 225
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v0, :cond_0

    .line 227
    const-string v3, "oppcDisable get NULL event (no available event and return-threshold is reach)"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 244
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :goto_1
    return v2

    .line 229
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_0
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_1

    .line 231
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 232
    const/4 v2, 0x1

    goto :goto_1

    .line 233
    :cond_1
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 235
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 241
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :catch_0
    move-exception v1

    .line 243
    .local v1, ex:Ljava/lang/InterruptedException;
    const-string v3, "oppcDisable thread interrupted"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    goto :goto_1

    .line 238
    .end local v1           #ex:Ljava/lang/InterruptedException;
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_2
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid oppcDisable event: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected native oppcDisableNative()Z
.end method

.method public oppcDisconnect()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 294
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 295
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 296
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcDisconnectNative()Z

    .line 299
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 300
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v0, :cond_0

    .line 302
    const-string v3, "oppcDisconnect get NULL event (no available event and return-threshold is reach)"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 315
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :goto_1
    return v2

    .line 304
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_0
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x10

    if-ne v3, v4, :cond_1

    .line 306
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 307
    const/4 v2, 0x1

    goto :goto_1

    .line 309
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid oppcDisconnect event: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 312
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :catch_0
    move-exception v1

    .line 314
    .local v1, ex:Ljava/lang/InterruptedException;
    const-string v3, "oppcDisconnect thread interrupted"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected native oppcDisconnectNative()Z
.end method

.method public oppcEnable()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 182
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 183
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 184
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcEnableNative()Z

    .line 188
    :goto_0
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 189
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v0, :cond_0

    .line 191
    const-string v3, "oppcEnable get NULL event (no available event and return-threshold is reach)"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 208
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :goto_1
    return v2

    .line 193
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_0
    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    if-ne v4, v3, :cond_1

    .line 195
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    move v2, v3

    .line 196
    goto :goto_1

    .line 197
    :cond_1
    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2

    .line 199
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 205
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :catch_0
    move-exception v1

    .line 207
    .local v1, ex:Ljava/lang/InterruptedException;
    const-string v3, "oppcEnable thread interrupted"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    goto :goto_1

    .line 202
    .end local v1           #ex:Ljava/lang/InterruptedException;
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_2
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "invalid oppcEnable event: ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected native oppcEnableNative()Z
.end method

.method protected native oppcExchangeObjectNative(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public oppcGetCurrentTask()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcCurrentTask:Landroid/net/Uri;

    return-object v0
.end method

.method protected native oppcPullObjectNative()Z
.end method

.method public oppcPush(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;)Z
    .locals 12
    .parameter "task"
    .parameter "handler"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 349
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v8}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 351
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "oppc push object: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPrintableString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 354
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v8}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 357
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v9, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v8, v9, :cond_0

    .line 359
    sget-object v8, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 363
    :cond_0
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getMimeType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v8, v9, v10}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcPushNative(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 366
    const/4 v2, 0x0

    .line 367
    .local v2, lastProgress:I
    const-wide/16 v3, 0x0

    .line 373
    .local v3, lastUpdateTime:J
    :cond_1
    :goto_0
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v9, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v8, v9, :cond_2

    .line 376
    sget-object v8, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 377
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcAbortNative()Z

    .line 381
    :cond_2
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v8}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 382
    .local v1, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v1, :cond_3

    .line 384
    const-string v8, "oppcPush get NULL event (no available event and return-threshold is reach)"

    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 385
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcDisconnectNative()Z

    goto :goto_0

    .line 389
    :cond_3
    iget v8, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    packed-switch v8, :pswitch_data_0

    .line 457
    :pswitch_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "oppcPushObject invalid event: ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 391
    :pswitch_1
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v9, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v8, v9, :cond_1

    .line 394
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 395
    .local v5, now:J
    sub-long v8, v5, v3

    const-wide/16 v10, 0x320

    cmp-long v8, v8, v10

    if-lez v8, :cond_1

    .line 397
    move-wide v3, v5

    .line 403
    iget-object v7, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 404
    .local v7, parameters:[Ljava/lang/String;
    const/4 v8, 0x4

    invoke-virtual {p1, v8}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 405
    const/4 v8, 0x0

    aget-object v8, v7, v8

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-virtual {p1, v8, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setDoneBytes(J)V

    .line 406
    const/4 v8, 0x1

    aget-object v8, v7, v8

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-virtual {p1, v8, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setTotalBytes(J)V

    .line 410
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v8

    const-wide/16 v10, 0x64

    mul-long/2addr v8, v10

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v10

    div-long/2addr v8, v10

    long-to-int v0, v8

    .line 411
    .local v0, curProgress:I
    if-ge v2, v0, :cond_1

    .line 413
    move v2, v0

    .line 414
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_0

    .line 419
    .end local v0           #curProgress:I
    .end local v5           #now:J
    .end local v7           #parameters:[Ljava/lang/String;
    :pswitch_2
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v9, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v8, v9, :cond_1

    .line 421
    const/4 v8, 0x4

    invoke-virtual {p1, v8}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 422
    const-wide/16 v8, 0x0

    invoke-virtual {p1, v8, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setDoneBytes(J)V

    .line 423
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_0

    .line 429
    :pswitch_3
    sget-object v8, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 430
    const/16 v8, 0x8

    invoke-virtual {p1, v8}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 431
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 432
    const/4 v8, 0x1

    .line 455
    :goto_1
    return v8

    .line 435
    :pswitch_4
    sget-object v8, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 436
    const/4 v8, 0x6

    invoke-virtual {p1, v8}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 437
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 438
    const/4 v8, 0x1

    goto :goto_1

    .line 440
    :pswitch_5
    sget-object v8, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 441
    iget-object v7, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 442
    .restart local v7       #parameters:[Ljava/lang/String;
    const/4 v8, 0x7

    invoke-virtual {p1, v8}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 445
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "oppcPushObject - push response: GOEP RSP["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x0

    aget-object v9, v7, v9

    invoke-static {v9}, Lcom/mediatek/bluetooth/opp/mmi/Utils;->getGoepResponseCodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 447
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 448
    const/4 v8, 0x1

    goto :goto_1

    .line 452
    .end local v7           #parameters:[Ljava/lang/String;
    :pswitch_6
    sget-object v8, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 453
    const/4 v8, 0x7

    invoke-virtual {p1, v8}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 454
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 455
    const/4 v8, 0x0

    goto :goto_1

    .line 389
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_4
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method

.method protected native oppcPushNative(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public oppcPushObject(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;)Z
    .locals 13
    .parameter "task"
    .parameter "handler"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 474
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v9}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 476
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "oppc push object: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPrintableString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 479
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v9}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 482
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v10, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v9, v10, :cond_0

    .line 484
    sget-object v9, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 488
    :cond_0
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getMimeType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v9, v10, v11, v12}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcPushObjectNative(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 492
    const/4 v2, 0x0

    .line 493
    .local v2, lastProgress:I
    const-wide/16 v3, 0x0

    .line 494
    .local v3, lastUpdateTime:J
    const/4 v8, 0x0

    .line 500
    .local v8, result:Z
    :cond_1
    :goto_0
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v10, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v9, v10, :cond_2

    .line 503
    sget-object v9, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 507
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    new-instance v10, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    const/16 v11, 0x10

    const/4 v12, 0x0

    invoke-direct {v10, v11, v12}, Lcom/mediatek/bluetooth/opp/adp/OppEvent;-><init>(I[Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 509
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcDisconnectNative()Z

    .line 514
    :cond_2
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v9}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 515
    .local v1, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v1, :cond_3

    .line 517
    const-string v9, "oppcPushObject get NULL event (no available event and return-threshold is reach)"

    invoke-static {v9}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 518
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcDisconnectNative()Z

    goto :goto_0

    .line 521
    :cond_3
    iget v9, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    packed-switch v9, :pswitch_data_0

    .line 585
    :pswitch_0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "oppcPushObject invalid event: ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 523
    :pswitch_1
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v10, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v9, v10, :cond_1

    .line 526
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 527
    .local v5, now:J
    sub-long v9, v5, v3

    const-wide/16 v11, 0x320

    cmp-long v9, v9, v11

    if-lez v9, :cond_1

    .line 529
    move-wide v3, v5

    .line 535
    iget-object v7, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 536
    .local v7, parameters:[Ljava/lang/String;
    const/4 v9, 0x4

    invoke-virtual {p1, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 537
    const/4 v9, 0x0

    aget-object v9, v7, v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {p1, v9, v10}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setDoneBytes(J)V

    .line 538
    const/4 v9, 0x1

    aget-object v9, v7, v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-virtual {p1, v9, v10}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setTotalBytes(J)V

    .line 542
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v9

    const-wide/16 v11, 0x64

    mul-long/2addr v9, v11

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v11

    div-long/2addr v9, v11

    long-to-int v0, v9

    .line 543
    .local v0, curProgress:I
    if-ge v2, v0, :cond_1

    .line 545
    move v2, v0

    .line 546
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_0

    .line 551
    .end local v0           #curProgress:I
    .end local v5           #now:J
    .end local v7           #parameters:[Ljava/lang/String;
    :pswitch_2
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v10, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v9, v10, :cond_1

    .line 553
    const/4 v9, 0x4

    invoke-virtual {p1, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 554
    const-wide/16 v9, 0x0

    invoke-virtual {p1, v9, v10}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setDoneBytes(J)V

    .line 555
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_0

    .line 561
    :pswitch_3
    sget-object v9, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 562
    const/16 v9, 0x8

    invoke-virtual {p1, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 563
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 564
    const/4 v8, 0x1

    .line 565
    goto/16 :goto_0

    .line 567
    :pswitch_4
    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v10, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v9, v10, :cond_1

    .line 569
    iget-object v7, v1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 570
    .restart local v7       #parameters:[Ljava/lang/String;
    const/4 v9, 0x7

    invoke-virtual {p1, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 573
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "oppcPushObject - push response: GOEP RSP["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/4 v10, 0x0

    aget-object v10, v7, v10

    invoke-static {v10}, Lcom/mediatek/bluetooth/opp/mmi/Utils;->getGoepResponseCodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 575
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 576
    const/4 v8, 0x0

    .line 577
    goto/16 :goto_0

    .line 581
    .end local v7           #parameters:[Ljava/lang/String;
    :pswitch_5
    invoke-direct {p0, p1, v8}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppcFinalEvent(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)Z

    move-result v8

    .line 582
    invoke-interface {p2, p1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 583
    return v8

    .line 521
    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method protected native oppcPushObjectNative(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public oppcSetCurrentTask(Landroid/net/Uri;)V
    .locals 0
    .parameter "task"

    .prologue
    .line 252
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppcCurrentTask:Landroid/net/Uri;

    .line 253
    return-void
.end method

.method public oppsAbort(Landroid/net/Uri;)Z
    .locals 2
    .parameter "task"

    .prologue
    .line 799
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsCurrentTask:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 801
    :cond_0
    const/4 v0, 0x0

    .line 811
    :goto_0
    return v0

    .line 804
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-eq v0, v1, :cond_2

    .line 806
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 809
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->cancelWaitNewEvent()V

    .line 811
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public oppsAccessResponse(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;)Z
    .locals 21
    .parameter "task"
    .parameter "handler"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 828
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_1

    const/4 v6, 0x0

    .line 830
    .local v6, goepStatus:I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v5

    .line 831
    .local v5, filename:Ljava/lang/String;
    if-nez v5, :cond_0

    const-string v5, ""

    .line 832
    :cond_0
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v13, v0, [Ljava/lang/String;

    const/16 v17, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v13, v17

    const/16 v17, 0x1

    aput-object v5, v13, v17

    .line 837
    .local v13, responseParams:[Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "oppsAccessResponse: goep["

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "], size["

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    aget-object v18, v13, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "], file["

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x1

    aget-object v18, v13, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "]"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 839
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v13}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsAccessResponseNative(I[Ljava/lang/String;)Z

    .line 842
    if-eqz v6, :cond_2

    .line 844
    sget-object v17, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 845
    const/16 v17, 0x5

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 846
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 847
    const/4 v14, 0x1

    .line 954
    :goto_1
    return v14

    .line 828
    .end local v5           #filename:Ljava/lang/String;
    .end local v6           #goepStatus:I
    .end local v13           #responseParams:[Ljava/lang/String;
    :cond_1
    const/16 v6, 0x43

    goto :goto_0

    .line 849
    .restart local v5       #filename:Ljava/lang/String;
    .restart local v6       #goepStatus:I
    .restart local v13       #responseParams:[Ljava/lang/String;
    :cond_2
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsAuthorized:Z

    .line 853
    const/4 v7, 0x0

    .line 854
    .local v7, lastProgress:I
    const-wide/16 v8, 0x0

    .line 855
    .local v8, lastUpdateTime:J
    const/4 v14, 0x0

    .line 863
    .local v14, result:Z
    :cond_3
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v17, v0

    sget-object v18, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_4

    .line 865
    sget-object v17, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 869
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    move-object/from16 v17, v0

    new-instance v18, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    const/16 v19, 0x70

    const/16 v20, 0x0

    invoke-direct/range {v18 .. v20}, Lcom/mediatek/bluetooth/opp/adp/OppEvent;-><init>(I[Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v18}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->contains(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_4

    .line 871
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsDisconnectNative()Z

    .line 876
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 877
    .local v4, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v4, :cond_5

    .line 879
    const-string v17, "oppsAccessResponse get NULL event (be canceled or no available event => return-threshold is reach)"

    invoke-static/range {v17 .. v17}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 881
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsDisconnectNative()Z

    goto :goto_2

    .line 884
    :cond_5
    iget v0, v4, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    move/from16 v17, v0

    packed-switch v17, :pswitch_data_0

    .line 956
    :pswitch_0
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "invalid oppsAccessResponse event: ["

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget v0, v4, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "]"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    goto :goto_2

    .line 886
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v17, v0

    sget-object v18, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_3

    .line 889
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    .line 890
    .local v10, now:J
    sub-long v17, v10, v8

    const-wide/16 v19, 0x320

    cmp-long v17, v17, v19

    if-lez v17, :cond_3

    .line 892
    move-wide v8, v10

    .line 898
    iget-object v12, v4, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 899
    .local v12, parameters:[Ljava/lang/String;
    const/16 v17, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 900
    const/16 v17, 0x0

    aget-object v17, v12, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v17

    move-object/from16 v0, p1

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setDoneBytes(J)V

    .line 904
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v15

    .line 906
    .local v15, totalBytes:J
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v17

    cmp-long v17, v17, v15

    if-lez v17, :cond_6

    .line 907
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v15

    .line 910
    :cond_6
    const/16 v3, 0x64

    .line 911
    .local v3, curProgress:I
    const-wide/16 v17, 0x0

    cmp-long v17, v15, v17

    if-lez v17, :cond_7

    .line 912
    const-wide/16 v17, 0x64

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v19

    mul-long v17, v17, v19

    div-long v17, v17, v15

    move-wide/from16 v0, v17

    long-to-int v3, v0

    .line 914
    :cond_7
    if-ge v7, v3, :cond_3

    .line 916
    move v7, v3

    .line 917
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_2

    .line 925
    .end local v3           #curProgress:I
    .end local v10           #now:J
    .end local v12           #parameters:[Ljava/lang/String;
    .end local v15           #totalBytes:J
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v17, v0

    sget-object v18, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_3

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_3

    .line 928
    const/16 v17, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 929
    const-wide/16 v17, 0x0

    move-object/from16 v0, p1

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setDoneBytes(J)V

    .line 930
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_2

    .line 934
    :pswitch_3
    sget-object v17, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 935
    const/16 v17, 0x8

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 936
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsFinalEvent(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)Z

    move-result v14

    .line 937
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_1

    .line 940
    :pswitch_4
    iget-object v12, v4, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 941
    .restart local v12       #parameters:[Ljava/lang/String;
    const/16 v17, 0x7

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 944
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "oppsAccessResponse get fail response :GOEP RSP["

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    aget-object v18, v12, v18

    invoke-static/range {v18 .. v18}, Lcom/mediatek/bluetooth/opp/mmi/Utils;->getGoepResponseCodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "]"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 946
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsFinalEvent(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)Z

    move-result v14

    .line 947
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_1

    .line 950
    .end local v12           #parameters:[Ljava/lang/String;
    :pswitch_5
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "oppsAccessResponse push disconnect - state["

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "]"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 951
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsAuthorized:Z

    .line 952
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsFinalEvent(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)Z

    move-result v14

    .line 953
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_1

    .line 884
    :pswitch_data_0
    .packed-switch 0x69
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method protected native oppsAccessResponseNative(I[Ljava/lang/String;)Z
.end method

.method public oppsDisable()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 665
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 667
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 668
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsDisableNative()Z

    .line 671
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 672
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v0, :cond_0

    .line 674
    const-string v3, "oppsDisable get NULL event (no available event and return-threshold is reach)"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 691
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :goto_1
    return v2

    .line 676
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_0
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x67

    if-ne v3, v4, :cond_1

    .line 678
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 679
    const/4 v2, 0x1

    goto :goto_1

    .line 680
    :cond_1
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x68

    if-ne v3, v4, :cond_2

    .line 682
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 688
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :catch_0
    move-exception v1

    .line 690
    .local v1, ex:Ljava/lang/InterruptedException;
    const-string v3, "oppsDisable thread interrupted"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    goto :goto_1

    .line 685
    .end local v1           #ex:Ljava/lang/InterruptedException;
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_2
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid oppsDisable event: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected native oppsDisableNative()Z
.end method

.method protected native oppsDisconnectNative()Z
.end method

.method public oppsEnable()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 623
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 625
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsAuthorized:Z

    .line 626
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->clear()V

    .line 627
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->oppsEnableNative()Z

    .line 630
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 631
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-nez v0, :cond_0

    .line 633
    const-string v3, "oppsEnable get NULL event (no available event and return-threshold is reach)"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 654
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :goto_1
    return v2

    .line 635
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_0
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x65

    if-ne v3, v4, :cond_1

    .line 637
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V

    .line 638
    const/4 v2, 0x1

    goto :goto_1

    .line 639
    :cond_1
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x66

    if-ne v3, v4, :cond_2

    .line 641
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-direct {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->checkQueue(Lcom/mediatek/bluetooth/opp/adp/EventQueue;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 651
    .end local v0           #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :catch_0
    move-exception v1

    .line 653
    .local v1, ex:Ljava/lang/InterruptedException;
    const-string v3, "oppsEnable thread interrupted"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    goto :goto_1

    .line 643
    .end local v1           #ex:Ljava/lang/InterruptedException;
    .restart local v0       #event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    :cond_2
    :try_start_1
    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x67

    if-ne v3, v4, :cond_3

    .line 644
    const-string v3, "oppsEnable,event is BT_OPPS_DISABLE_SUCCESS"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 648
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid oppsEnable event: ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected native oppsEnableNative()Z
.end method

.method public oppsGetCurrentTask()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 786
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsCurrentTask:Landroid/net/Uri;

    return-object v0
.end method

.method public oppsIsAuthorized()Z
    .locals 1

    .prologue
    .line 791
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsAuthorized:Z

    return v0
.end method

.method public oppsListenDisconnect()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 739
    iput-boolean v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsListenDisconnect:Z

    .line 740
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v3, v2}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 742
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsListenDisconnect:Z

    .line 744
    if-eqz v0, :cond_0

    iget v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v4, 0x70

    if-ne v3, v4, :cond_0

    .line 748
    const-string v3, "oppsListenDisconnect(): disconnect event happened!"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 752
    iput-boolean v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsAuthorized:Z

    .line 760
    :goto_0
    return v1

    .line 756
    :cond_0
    if-eqz v0, :cond_1

    .line 758
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "oppsListenDisconnect() - unexpected event:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    :cond_1
    move v1, v2

    .line 760
    goto :goto_0
.end method

.method public oppsSetCurrentTask(Landroid/net/Uri;)V
    .locals 0
    .parameter "task"

    .prologue
    .line 781
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsCurrentTask:Landroid/net/Uri;

    .line 782
    return-void
.end method

.method public oppsStopListenDisconnect()V
    .locals 2

    .prologue
    .line 768
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "oppsStopListenDisconnect(): is listening=["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsListenDisconnect:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 771
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsListenDisconnect:Z

    if-eqz v0, :cond_0

    .line 773
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->cancelWaitNewEvent()V

    .line 775
    :cond_0
    return-void
.end method

.method public oppsWaitForAccessRequest()Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 707
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsEventQueue:Lcom/mediatek/bluetooth/opp/adp/EventQueue;

    invoke-virtual {v1, v3}, Lcom/mediatek/bluetooth/opp/adp/EventQueue;->waitNewEvent(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 710
    .local v0, event:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    if-eqz v0, :cond_0

    .line 716
    iget v1, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    packed-switch v1, :pswitch_data_0

    .line 730
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid oppsWaitForAccessRequest event: ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 719
    :pswitch_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v2, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    if-ne v1, v2, :cond_1

    .line 721
    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    iput-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mOppsTaskState:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 724
    :cond_1
    return-object v0

    .line 727
    :pswitch_1
    iput-boolean v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;->mIsAuthorized:Z

    goto :goto_0

    .line 716
    nop

    :pswitch_data_0
    .packed-switch 0x70
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected native startListenNative()V
.end method

.method protected native stopListenNative()V
.end method

.method protected native testJNI(I[Ljava/lang/String;)Z
.end method
