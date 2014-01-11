.class public Lcom/mediatek/phone/recording/PhoneRecorderHandler;
.super Ljava/lang/Object;
.source "PhoneRecorderHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "PhoneRecorderHandler"

.field private static final VDBG:Z = true

.field private static sInstance:Lcom/mediatek/phone/recording/PhoneRecorderHandler;


# instance fields
.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mConnection:Landroid/content/ServiceConnection;

.field private mCustomValue:I

.field private mHandler:Landroid/os/Handler;

.field private mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

.field private mPhoneRecordStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

.field private mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

.field private mPhoneRecorderState:I

.field private mRecordDiskCheck:Ljava/lang/Runnable;

.field private mRecordStoragePath:Ljava/lang/String;

.field private mRecordType:I

.field private mRecorderServiceIntent:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 95
    new-instance v0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    invoke-direct {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;-><init>()V

    sput-object v0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->sInstance:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    .line 86
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v1, Landroid/content/Intent;

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v2

    const-class v3, Lcom/mediatek/phone/recording/PhoneRecorderServices;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecorderServiceIntent:Landroid/content/Intent;

    .line 67
    const/4 v1, 0x0

    iput v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    .line 97
    new-instance v1, Lcom/mediatek/phone/recording/PhoneRecorderHandler$1;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$1;-><init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mHandler:Landroid/os/Handler;

    .line 104
    new-instance v1, Lcom/mediatek/phone/recording/PhoneRecorderHandler$2;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$2;-><init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordDiskCheck:Ljava/lang/Runnable;

    .line 132
    new-instance v1, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;-><init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mConnection:Landroid/content/ServiceConnection;

    .line 153
    new-instance v1, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;-><init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecordStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    .line 330
    new-instance v1, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;

    invoke-direct {v1, p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$5;-><init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 87
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 88
    .local v0, intentFilter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 89
    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 90
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 91
    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 92
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Lcom/android/phone/PhoneGlobals;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 93
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->checkRecordDisk()V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/IPhoneRecorder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    return v0
.end method

.method static synthetic access$102(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Lcom/mediatek/phone/recording/IPhoneRecorder;)Lcom/mediatek/phone/recording/IPhoneRecorder;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVoiceRecord(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/IPhoneRecordStateListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecordStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Ljava/lang/Runnable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordDiskCheck:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    return v0
.end method

.method static synthetic access$602(Lcom/mediatek/phone/recording/PhoneRecorderHandler;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    iput p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    return p1
.end method

.method static synthetic access$700(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    return v0
.end method

.method static synthetic access$900(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordStoragePath:Ljava/lang/String;

    return-object v0
.end method

.method private checkRecordDisk()V
    .locals 4

    .prologue
    .line 313
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordStoragePath:Ljava/lang/String;

    const-wide/32 v1, 0x200000

    invoke-static {v0, v1, v2}, Lcom/android/phone/PhoneUtils;->diskSpaceAvailable(Ljava/lang/String;J)Z

    move-result v0

    if-nez v0, :cond_4

    .line 314
    const-string v0, "AN: "

    const-string v1, "Checking result, disk is full, stop recording..."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorder;->isRecording()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->isVTRecording()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 316
    :cond_0
    invoke-static {}, Lcom/mediatek/phone/recording/PhoneRecorder;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 317
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVoiceRecord()V

    .line 321
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    if-eqz v0, :cond_2

    .line 322
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    invoke-interface {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;->onStorageFull()V

    .line 328
    :cond_2
    :goto_1
    return-void

    .line 318
    :cond_3
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->isVTRecording()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 319
    invoke-virtual {p0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVideoRecord()V

    goto :goto_0

    .line 326
    :cond_4
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordDiskCheck:Ljava/lang/Runnable;

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1
.end method

.method public static declared-synchronized getInstance()Lcom/mediatek/phone/recording/PhoneRecorderHandler;
    .locals 2

    .prologue
    .line 111
    const-class v0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->sInstance:Lcom/mediatek/phone/recording/PhoneRecorderHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 362
    const-string v0, "PhoneRecorderHandler"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    return-void
.end method

.method private stopVoiceRecord(Z)V
    .locals 4
    .parameter "isMount"

    .prologue
    .line 217
    :try_start_0
    const-string v1, "stopRecord"

    invoke-direct {p0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V

    .line 218
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    if-eqz v1, :cond_1

    .line 219
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    invoke-interface {v1, p1}, Lcom/mediatek/phone/recording/IPhoneRecorder;->stopRecord(Z)V

    .line 220
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    invoke-interface {v1}, Lcom/mediatek/phone/recording/IPhoneRecorder;->remove()V

    .line 221
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mConnection:Landroid/content/ServiceConnection;

    if-eqz v1, :cond_0

    .line 222
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2}, Lcom/android/phone/PhoneGlobals;->unbindService(Landroid/content/ServiceConnection;)V

    .line 224
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :cond_1
    :goto_0
    return-void

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "PhoneRecorderHandler"

    const-string v2, "stopRecord: couldn\'t call to record service"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public clearListener(Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    if-ne p1, v0, :cond_0

    .line 128
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    .line 130
    :cond_0
    return-void
.end method

.method public getCustomValue()I
    .locals 1

    .prologue
    .line 280
    iget v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    return v0
.end method

.method public getPhoneRecorderState()I
    .locals 1

    .prologue
    .line 268
    iget v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    return v0
.end method

.method public getRecordType()I
    .locals 1

    .prologue
    .line 292
    iget v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    return v0
.end method

.method public isVTRecording()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 308
    iget v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    if-ne v0, v1, :cond_0

    iget v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    if-ne v0, v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCustomValue(I)V
    .locals 0
    .parameter "customValue"

    .prologue
    .line 288
    iput p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    .line 289
    return-void
.end method

.method public setListener(Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 119
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    .line 120
    return-void
.end method

.method public setPhoneRecorderState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 276
    iput p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    .line 277
    return-void
.end method

.method public setRecordType(I)V
    .locals 0
    .parameter "recordType"

    .prologue
    .line 300
    iput p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    .line 301
    return-void
.end method

.method public startVideoRecord(IJI)V
    .locals 4
    .parameter "type"
    .parameter "sdMaxSize"
    .parameter "customValue"

    .prologue
    .line 239
    iput p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    .line 240
    iput p4, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    .line 241
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getExternalStorageDefaultPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordStoragePath:Ljava/lang/String;

    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- start call VTManager.startRecording() : type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " sd max size = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V

    .line 244
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/mediatek/vt/VTManager;->startRecording(IJ)I

    .line 245
    const-string v0, "- end call VTManager.startRecording()"

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V

    .line 246
    const/4 v0, 0x1

    iput v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    .line 247
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    iget v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    iget v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    invoke-interface {v0, v1, v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;->requestUpdateRecordState(II)V

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordDiskCheck:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 251
    return-void
.end method

.method public startVoiceRecord(I)V
    .locals 5
    .parameter "customValue"

    .prologue
    .line 195
    iput p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    .line 196
    const/4 v1, 0x2

    iput v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    .line 197
    invoke-static {}, Lcom/android/phone/PhoneUtils;->getExternalStorageDefaultPath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordStoragePath:Ljava/lang/String;

    .line 198
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecorderServiceIntent:Landroid/content/Intent;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    if-nez v1, :cond_1

    .line 199
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecorderServiceIntent:Landroid/content/Intent;

    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mConnection:Landroid/content/ServiceConnection;

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/phone/PhoneGlobals;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 209
    :cond_0
    :goto_0
    return-void

    .line 201
    :cond_1
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecorderServiceIntent:Landroid/content/Intent;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    if-eqz v1, :cond_0

    .line 203
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;

    invoke-interface {v1}, Lcom/mediatek/phone/recording/IPhoneRecorder;->startRecord()V

    .line 204
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordDiskCheck:Ljava/lang/Runnable;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 205
    :catch_0
    move-exception v0

    .line 206
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "PhoneRecorderHandler"

    const-string v2, "start Record failed"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public stopVideoRecord()V
    .locals 3

    .prologue
    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- start call VTManager.stopRecording() : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V

    .line 255
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    invoke-virtual {v0, v1}, Lcom/mediatek/vt/VTManager;->stopRecording(I)I

    .line 256
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "- end call VTManager.stopRecording() : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V

    .line 257
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    .line 258
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    iget v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I

    iget v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I

    invoke-interface {v0, v1, v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;->requestUpdateRecordState(II)V

    .line 261
    :cond_0
    return-void
.end method

.method public stopVoiceRecord()V
    .locals 1

    .prologue
    .line 212
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->stopVoiceRecord(Z)V

    .line 213
    return-void
.end method
