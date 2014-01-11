.class public Lcom/android/phone/PhoneInterfaceManagerEx;
.super Lcom/mediatek/common/telephony/ITelephonyEx$Stub;
.source "PhoneInterfaceManagerEx.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;,
        Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;,
        Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;,
        Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadRequest;,
        Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;
    }
.end annotation


# static fields
.field private static final CMD_GET_SCA_DONE:I = 0xc

.field private static final CMD_HANDLE_GET_SCA:I = 0xb

.field private static final CMD_HANDLE_SET_SCA:I = 0xd

.field private static final CMD_SET_SCA_DONE:I = 0xe

.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "PhoneInterfaceManagerEx"

.field public static final NETWORK_LOCK_TOTAL_COUNT:I = 0x5

.field public static final QUERY_SIMME_LOCK_RESULT:Ljava/lang/String; = "com.android.phone.QUERY_SIMME_LOCK_RESULT"

.field public static final SIMME_LOCK_LEFT_COUNT:Ljava/lang/String; = "com.android.phone.SIMME_LOCK_LEFT_COUNT"

.field public static final VERIFY_INCORRECT_PASSWORD:I = 0x1

.field public static final VERIFY_RESULT_EXCEPTION:I = 0x2

.field public static final VERIFY_RESULT_PASS:I

.field private static sInstance:Lcom/android/phone/PhoneInterfaceManagerEx;


# instance fields
.field private mAdnInfoThread:Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

.field mApp:Lcom/android/phone/PhoneGlobals;

.field mCM:Lcom/android/internal/telephony/CallManager;

.field mMainThreadHandler:Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;

.field mPhone:Lcom/android/internal/telephony/Phone;


# direct methods
.method private constructor <init>(Lcom/android/phone/PhoneGlobals;Lcom/android/internal/telephony/Phone;)V
    .locals 2
    .parameter "app"
    .parameter "phone"

    .prologue
    const/4 v1, 0x0

    .line 137
    invoke-direct {p0}, Lcom/mediatek/common/telephony/ITelephonyEx$Stub;-><init>()V

    .line 95
    iput-object v1, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mAdnInfoThread:Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

    .line 138
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mApp:Lcom/android/phone/PhoneGlobals;

    .line 139
    iput-object p2, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 140
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    iget-object v0, v0, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    iput-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mCM:Lcom/android/internal/telephony/CallManager;

    .line 141
    new-instance v0, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;

    invoke-direct {v0, p0, v1}, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;-><init>(Lcom/android/phone/PhoneInterfaceManagerEx;Lcom/android/phone/PhoneInterfaceManagerEx$1;)V

    iput-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mMainThreadHandler:Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;

    .line 142
    invoke-direct {p0}, Lcom/android/phone/PhoneInterfaceManagerEx;->publish()V

    .line 143
    return-void
.end method

.method static synthetic access$700(Lcom/android/phone/PhoneInterfaceManagerEx;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/android/phone/PhoneInterfaceManagerEx;->sendRequest(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static init(Lcom/android/phone/PhoneGlobals;Lcom/android/internal/telephony/Phone;)Lcom/android/phone/PhoneInterfaceManagerEx;
    .locals 4
    .parameter "app"
    .parameter "phone"

    .prologue
    .line 126
    const-class v1, Lcom/android/phone/PhoneInterfaceManagerEx;

    monitor-enter v1

    .line 127
    :try_start_0
    sget-object v0, Lcom/android/phone/PhoneInterfaceManagerEx;->sInstance:Lcom/android/phone/PhoneInterfaceManagerEx;

    if-nez v0, :cond_0

    .line 128
    new-instance v0, Lcom/android/phone/PhoneInterfaceManagerEx;

    invoke-direct {v0, p0, p1}, Lcom/android/phone/PhoneInterfaceManagerEx;-><init>(Lcom/android/phone/PhoneGlobals;Lcom/android/internal/telephony/Phone;)V

    sput-object v0, Lcom/android/phone/PhoneInterfaceManagerEx;->sInstance:Lcom/android/phone/PhoneInterfaceManagerEx;

    .line 132
    :goto_0
    sget-object v0, Lcom/android/phone/PhoneInterfaceManagerEx;->sInstance:Lcom/android/phone/PhoneInterfaceManagerEx;

    monitor-exit v1

    return-object v0

    .line 130
    :cond_0
    const-string v0, "PhoneInterfaceManagerEx"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init() called multiple times!  sInstance = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/android/phone/PhoneInterfaceManagerEx;->sInstance:Lcom/android/phone/PhoneInterfaceManagerEx;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 133
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 152
    const-string v0, "PhoneInterfaceManagerEx"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[PhoneIntfMgrEx] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 156
    const-string v0, "PhoneInterfaceManagerEx"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[PhoneIntfMgrEx] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    return-void
.end method

.method private publish()V
    .locals 2

    .prologue
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "publish: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/phone/PhoneInterfaceManagerEx;->log(Ljava/lang/String;)V

    .line 148
    const-string v0, "phoneEx"

    invoke-static {v0, p0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 149
    return-void
.end method

.method private sendRequest(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .parameter "command"
    .parameter "argument"

    .prologue
    .line 291
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mMainThreadHandler:Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;

    invoke-virtual {v3}, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;->getLooper()Landroid/os/Looper;

    move-result-object v3

    if-ne v2, v3, :cond_0

    .line 292
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "This method will deadlock if called from the main thread."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 295
    :cond_0
    new-instance v1, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadRequest;

    invoke-direct {v1, p2}, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadRequest;-><init>(Ljava/lang/Object;)V

    .line 296
    .local v1, request:Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadRequest;
    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mMainThreadHandler:Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;

    invoke-virtual {v2, p1, v1}, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 297
    .local v0, msg:Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 300
    monitor-enter v1

    .line 301
    :goto_0
    :try_start_0
    iget-object v2, v1, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadRequest;->result:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    .line 303
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 304
    :catch_0
    move-exception v2

    goto :goto_0

    .line 308
    :cond_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 309
    iget-object v2, v1, Lcom/android/phone/PhoneInterfaceManagerEx$MainThreadRequest;->result:Ljava/lang/Object;

    return-object v2

    .line 308
    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2
.end method


# virtual methods
.method public getAdnStorageInfo(I)[I
    .locals 3
    .parameter "simId"

    .prologue
    .line 488
    const-string v0, "PhoneInterfaceManagerEx"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getAdnStorageInfo "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mAdnInfoThread:Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

    if-nez v0, :cond_0

    .line 490
    const-string v0, "PhoneInterfaceManagerEx"

    const-string v1, "getAdnStorageInfo new thread "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    new-instance v0, Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

    iget-object v1, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-direct {v0, p1, v1}, Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;-><init>(ILcom/android/internal/telephony/Phone;)V

    iput-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mAdnInfoThread:Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

    .line 492
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mAdnInfoThread:Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

    invoke-virtual {v0}, Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;->start()V

    .line 497
    :goto_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mAdnInfoThread:Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

    invoke-virtual {v0}, Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;->GetAdnStorageInfo()[I

    move-result-object v0

    return-object v0

    .line 494
    :cond_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mAdnInfoThread:Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;

    invoke-virtual {v0, p1}, Lcom/android/phone/PhoneInterfaceManagerEx$QueryAdnInfoThread;->setSimId(I)V

    .line 495
    const-string v0, "PhoneInterfaceManagerEx"

    const-string v1, "getAdnStorageInfo old thread "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getScAddressGemini(I)Ljava/lang/String;
    .locals 6
    .parameter "simId"

    .prologue
    const/4 v3, 0x0

    .line 681
    const-string v4, "PhoneInterfaceManagerEx"

    const-string v5, "getScAddressGemini: enter"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    if-eqz p1, :cond_0

    const/4 v4, 0x1

    if-eq p1, v4, :cond_0

    const/4 v4, 0x2

    if-eq p1, v4, :cond_0

    const/4 v4, 0x3

    if-eq p1, v4, :cond_0

    .line 687
    const-string v4, "PhoneInterfaceManagerEx"

    const-string v5, "[sca Invalid sim id"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 712
    :goto_0
    return-object v3

    .line 691
    :cond_0
    new-instance v0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;

    invoke-direct {v0, p0, v3, p1}, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;-><init>(Lcom/android/phone/PhoneInterfaceManagerEx;Ljava/lang/String;I)V

    .line 693
    .local v0, addr:Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;
    new-instance v2, Lcom/android/phone/PhoneInterfaceManagerEx$1;

    invoke-direct {v2, p0, v0}, Lcom/android/phone/PhoneInterfaceManagerEx$1;-><init>(Lcom/android/phone/PhoneInterfaceManagerEx;Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;)V

    .line 702
    .local v2, sender:Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 704
    :try_start_0
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "[sca thread join"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 710
    :goto_1
    const-string v3, "PhoneInterfaceManagerEx"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getScAddressGemini: exit with "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;->scAddr:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 712
    iget-object v3, v0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;->scAddr:Ljava/lang/String;

    goto :goto_0

    .line 706
    :catch_0
    move-exception v1

    .line 707
    .local v1, e:Ljava/lang/InterruptedException;
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "[sca throw interrupted exception"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public getSmsDefaultSim()I
    .locals 1

    .prologue
    .line 674
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getSmsDefaultSim()I

    move-result v0

    return v0
.end method

.method public isPhbReady()Z
    .locals 1

    .prologue
    .line 616
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getMySimId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/phone/PhoneInterfaceManagerEx;->isPhbReadyExt(I)Z

    move-result v0

    return v0
.end method

.method public isPhbReadyExt(I)Z
    .locals 3
    .parameter "simId"

    .prologue
    .line 628
    const-string v0, "false"

    .line 629
    .local v0, strPhbReady:Ljava/lang/String;
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 630
    const-string v1, "gsm.sim.ril.phbready.2"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 639
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[isPhbReady] sim id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", isPhbReady: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/PhoneInterfaceManagerEx;->log(Ljava/lang/String;)V

    .line 641
    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 631
    :cond_0
    const/4 v1, 0x2

    if-ne v1, p1, :cond_1

    .line 632
    const-string v1, "gsm.sim.ril.phbready.3"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 633
    :cond_1
    const/4 v1, 0x3

    if-ne v1, p1, :cond_2

    .line 634
    const-string v1, "gsm.sim.ril.phbready.4"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 636
    :cond_2
    const-string v1, "gsm.sim.ril.phbready"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public isPhbReadyGemini(I)Z
    .locals 3
    .parameter "simId"

    .prologue
    .line 653
    const-string v0, "false"

    .line 654
    .local v0, strPhbReady:Ljava/lang/String;
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 655
    const-string v1, "gsm.sim.ril.phbready.2"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 664
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[isPhbReady] sim id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", isPhbReady: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/phone/PhoneInterfaceManagerEx;->log(Ljava/lang/String;)V

    .line 666
    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 656
    :cond_0
    const/4 v1, 0x2

    if-ne v1, p1, :cond_1

    .line 657
    const-string v1, "gsm.sim.ril.phbready.3"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 658
    :cond_1
    const/4 v1, 0x3

    if-ne v1, p1, :cond_2

    .line 659
    const-string v1, "gsm.sim.ril.phbready.4"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 661
    :cond_2
    const-string v1, "gsm.sim.ril.phbready"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public queryNetworkLock(II)Landroid/os/Bundle;
    .locals 3
    .parameter "category"
    .parameter "simId"

    .prologue
    .line 452
    const-string v1, "PhoneInterfaceManagerEx"

    const-string v2, "queryNetworkLock"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    new-instance v0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    iget-object v1, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;-><init>(Lcom/android/internal/telephony/IccCard;)V

    .line 458
    .local v0, queryNetworkLockState:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;
    invoke-virtual {v0}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->start()V

    .line 459
    invoke-virtual {v0, p1}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->queryNetworkLock(I)Landroid/os/Bundle;

    move-result-object v1

    return-object v1
.end method

.method public setScAddressGemini(Ljava/lang/String;I)V
    .locals 5
    .parameter "address"
    .parameter "simId"

    .prologue
    .line 716
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "setScAddressGemini: enter"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 717
    if-eqz p2, :cond_0

    const/4 v3, 0x1

    if-eq p2, v3, :cond_0

    const/4 v3, 0x2

    if-eq p2, v3, :cond_0

    const/4 v3, 0x3

    if-eq p2, v3, :cond_0

    .line 722
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "[sca Invalid sim id"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    :goto_0
    return-void

    .line 726
    :cond_0
    new-instance v0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;-><init>(Lcom/android/phone/PhoneInterfaceManagerEx;Ljava/lang/String;I)V

    .line 728
    .local v0, addr:Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;
    new-instance v2, Lcom/android/phone/PhoneInterfaceManagerEx$2;

    invoke-direct {v2, p0, v0}, Lcom/android/phone/PhoneInterfaceManagerEx$2;-><init>(Lcom/android/phone/PhoneInterfaceManagerEx;Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;)V

    .line 737
    .local v2, sender:Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 739
    :try_start_0
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "[sca thread join"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 745
    :goto_1
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "setScAddressGemini: exit"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 741
    :catch_0
    move-exception v1

    .line 742
    .local v1, e:Ljava/lang/InterruptedException;
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "[sca throw interrupted exception"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public supplyNetworkDepersonalization(Ljava/lang/String;I)I
    .locals 3
    .parameter "strPasswd"
    .parameter "simId"

    .prologue
    .line 465
    const-string v1, "PhoneInterfaceManagerEx"

    const-string v2, "supplyNetworkDepersonalization"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    new-instance v0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    iget-object v1, p0, Lcom/android/phone/PhoneInterfaceManagerEx;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getIccCardGemini(I)Lcom/android/internal/telephony/IccCard;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;-><init>(Lcom/android/internal/telephony/IccCard;)V

    .line 471
    .local v0, supplyNetworkLock:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;
    invoke-virtual {v0}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->start()V

    .line 472
    invoke-virtual {v0, p1}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->supplyNetworkLock(Ljava/lang/String;)I

    move-result v1

    return v1
.end method
