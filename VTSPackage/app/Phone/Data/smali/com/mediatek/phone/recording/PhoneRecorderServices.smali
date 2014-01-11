.class public Lcom/mediatek/phone/recording/PhoneRecorderServices;
.super Landroid/app/Service;
.source "PhoneRecorderServices.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "RecorderServices"

.field private static final PHONE_VOICE_RECORD_STATE_CHANGE_MESSAGE:Ljava/lang/String; = "com.android.phone.VoiceRecorder.STATE"


# instance fields
.field private final mBinder:Lcom/mediatek/phone/recording/IPhoneRecorder$Stub;

.field private mMount:Z

.field private mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

.field private mPhoneRecorderStateListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

.field private mPhoneRecorderStatus:I

.field mStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mMount:Z

    .line 97
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorderStatus:I

    .line 98
    new-instance v0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;-><init>(Lcom/mediatek/phone/recording/PhoneRecorderServices;)V

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorderStateListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

    .line 131
    new-instance v0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;

    invoke-direct {v0, p0}, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;-><init>(Lcom/mediatek/phone/recording/PhoneRecorderServices;)V

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mBinder:Lcom/mediatek/phone/recording/IPhoneRecorder$Stub;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/phone/recording/PhoneRecorderServices;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorderStatus:I

    return v0
.end method

.method static synthetic access$002(Lcom/mediatek/phone/recording/PhoneRecorderServices;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 44
    iput p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorderStatus:I

    return p1
.end method

.method static synthetic access$100(Lcom/mediatek/phone/recording/PhoneRecorderServices;)Lcom/mediatek/phone/recording/PhoneRecorder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    return-object v0
.end method

.method static synthetic access$102(Lcom/mediatek/phone/recording/PhoneRecorderServices;Lcom/mediatek/phone/recording/PhoneRecorder;)Lcom/mediatek/phone/recording/PhoneRecorder;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 44
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    return-object p1
.end method


# virtual methods
.method public log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 94
    const-string v0, "RecorderServices"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .parameter "intent"

    .prologue
    .line 53
    const-string v0, "RecorderServices"

    const-string v1, "onBind"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mBinder:Lcom/mediatek/phone/recording/IPhoneRecorder$Stub;

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 63
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 64
    const-string v0, "onCreate"

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 65
    invoke-static {p0}, Lcom/mediatek/phone/recording/PhoneRecorder;->getInstance(Landroid/content/Context;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    .line 67
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorderStateListener:Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorder;->setOnStateChangedListener(Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;)V

    .line 70
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 73
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 74
    const-string v0, "onDestroy"

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    iget-boolean v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mMount:Z

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorder;->stopRecord(Z)V

    .line 77
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    .line 83
    :cond_0
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 1
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 86
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 87
    const-string v0, "onStart"

    invoke-virtual {p0, v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 88
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorder;->startRecord()V

    .line 91
    :cond_0
    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2
    .parameter "intent"

    .prologue
    .line 58
    const-string v0, "RecorderServices"

    const-string v1, "onUnbind"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
