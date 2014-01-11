.class Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;
.super Ljava/lang/Thread;
.source "PhoneInterfaceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/PhoneInterfaceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SendBtSimapProfile"
.end annotation


# static fields
.field private static final BTSAP_CONNECT_COMPLETE:I = 0x12c

.field private static final BTSAP_DISCONNECT_COMPLETE:I = 0x12d

.field private static final BTSAP_POWEROFF_COMPLETE:I = 0x12f

.field private static final BTSAP_POWERON_COMPLETE:I = 0x12e

.field private static final BTSAP_RESETSIM_COMPLETE:I = 0x130

.field private static final BTSAP_TRANSFER_APDU_COMPLETE:I = 0x131

.field static final sInstSync:Ljava/lang/Object;

.field private static sInstance:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;


# instance fields
.field private mBtRsp:Landroid/telephony/BtSimapOperResponse;

.field private mBtSapPhone:Lcom/android/internal/telephony/Phone;

.field private mDone:Z

.field private mHandler:Landroid/os/Handler;

.field private mResult:Ljava/util/ArrayList;

.field private mRet:I

.field private mStrResult:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 2391
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->sInstSync:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lcom/android/internal/telephony/Phone;)V
    .locals 2
    .parameter "phone"

    .prologue
    const/4 v1, 0x0

    .line 2408
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2383
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    .line 2384
    iput-object v1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;

    .line 2386
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    .line 2409
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    .line 2410
    iput-object v1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    .line 2411
    return-void
.end method

.method static synthetic access$1000(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2381
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2381
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2381
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2381
    iput-boolean p1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    return p1
.end method

.method static synthetic access$900(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 2381
    iget v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    return v0
.end method

.method static synthetic access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2381
    iput p1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    return p1
.end method

.method public static getInstance(Lcom/android/internal/telephony/Phone;)Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;
    .locals 2
    .parameter "phone"

    .prologue
    .line 2401
    sget-object v1, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->sInstSync:Ljava/lang/Object;

    monitor-enter v1

    .line 2402
    :try_start_0
    sget-object v0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->sInstance:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    if-nez v0, :cond_0

    .line 2403
    new-instance v0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-direct {v0, p0}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;-><init>(Lcom/android/internal/telephony/Phone;)V

    sput-object v0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->sInstance:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    .line 2405
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2406
    sget-object v0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->sInstance:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    return-object v0

    .line 2405
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method declared-synchronized btSimapApduRequest(ILjava/lang/String;)I
    .locals 9
    .parameter "type"
    .parameter "cmdAPDU"

    .prologue
    .line 2820
    monitor-enter p0

    const/4 v7, 0x0

    .line 2821
    .local v7, ret:I
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 2823
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2824
    :catch_0
    move-exception v6

    .line 2825
    .local v6, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2820
    .end local v6           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2828
    :cond_0
    const/4 v0, 0x0

    :try_start_3
    iput-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    .line 2829
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x131

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 2832
    .local v4, callback:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getBtConnectedSimId()I

    move-result v5

    .line 2833
    .local v5, simId:I
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapApduRequest GEMINI connect Sim is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2834
    if-eqz v5, :cond_1

    const/4 v0, 0x1

    if-ne v5, v0, :cond_2

    .line 2835
    :cond_1
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/4 v1, 0x5

    move v2, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendBTSIMProfileGemini(IILjava/lang/String;Landroid/os/Message;I)V

    .line 2844
    :goto_1
    iget-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v0, :cond_3

    .line 2846
    :try_start_4
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "wait for done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2847
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 2848
    :catch_1
    move-exception v6

    .line 2850
    .restart local v6       #e:Ljava/lang/InterruptedException;
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 2837
    .end local v6           #e:Ljava/lang/InterruptedException;
    :cond_2
    const/4 v7, 0x7

    move v8, v7

    .line 2861
    .end local v7           #ret:I
    .local v8, ret:I
    :goto_2
    monitor-exit p0

    return v8

    .line 2853
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_3
    :try_start_6
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2854
    iget v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    if-nez v0, :cond_4

    .line 2855
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "btSimapApduRequest APDU "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getApduString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2860
    :goto_3
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapApduRequest ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v8, v7

    .line 2861
    .end local v7           #ret:I
    .restart local v8       #ret:I
    goto :goto_2

    .line 2857
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_4
    iget v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
.end method

.method declared-synchronized btSimapConnectSIM(I)I
    .locals 8
    .parameter "simId"

    .prologue
    .line 2602
    monitor-enter p0

    const/4 v7, 0x0

    .line 2603
    .local v7, ret:I
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 2605
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2606
    :catch_0
    move-exception v6

    .line 2607
    .local v6, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2602
    .end local v6           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2610
    :cond_0
    const/4 v0, 0x0

    :try_start_3
    iput-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    .line 2611
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x12c

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 2613
    .local v4, callback:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendBTSIMProfileGemini(IILjava/lang/String;Landroid/os/Message;I)V

    .line 2618
    :goto_1
    iget-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v0, :cond_1

    .line 2620
    :try_start_4
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "wait for done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2621
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 2622
    :catch_1
    move-exception v6

    .line 2624
    .restart local v6       #e:Ljava/lang/InterruptedException;
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 2628
    .end local v6           #e:Ljava/lang/InterruptedException;
    :cond_1
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2629
    iget v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    if-nez v0, :cond_2

    .line 2632
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setBtConnectedSimId(I)V

    .line 2633
    const-string v1, "PhoneInterfaceManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapConnectSIM GEMINI connect Sim is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getBtConnectedSimId()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2635
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "btSimapConnectSIM curType "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getCurType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " SupType "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getSupportType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ATR "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getAtrString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2640
    :goto_2
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapConnectSIM ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 2641
    monitor-exit p0

    return v7

    .line 2637
    :cond_2
    :try_start_6
    iget v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2
.end method

.method declared-synchronized btSimapDisconnectSIM()I
    .locals 9

    .prologue
    const/4 v3, 0x1

    .line 2645
    monitor-enter p0

    const/4 v7, 0x0

    .line 2646
    .local v7, ret:I
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 2648
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2649
    :catch_0
    move-exception v6

    .line 2650
    .local v6, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2645
    .end local v6           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2653
    :cond_0
    :try_start_3
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "synchronized btSimapDisconnectSIM"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2654
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    .line 2655
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x12d

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 2657
    .local v4, callback:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getBtConnectedSimId()I

    move-result v5

    .line 2658
    .local v5, simId:I
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapDisconnectSIM GEMINI connect Sim is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2659
    if-eqz v5, :cond_1

    if-ne v5, v3, :cond_2

    .line 2660
    :cond_1
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendBTSIMProfileGemini(IILjava/lang/String;Landroid/os/Message;I)V

    .line 2670
    :goto_1
    iget-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v0, :cond_3

    .line 2672
    :try_start_4
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "wait for done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2673
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 2674
    :catch_1
    move-exception v6

    .line 2676
    .restart local v6       #e:Ljava/lang/InterruptedException;
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 2662
    .end local v6           #e:Ljava/lang/InterruptedException;
    :cond_2
    const/4 v7, 0x7

    move v8, v7

    .line 2687
    .end local v7           #ret:I
    .local v8, ret:I
    :goto_2
    monitor-exit p0

    return v8

    .line 2679
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_3
    :try_start_6
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2680
    iget v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    if-nez v0, :cond_4

    .line 2682
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setBtConnectedSimId(I)V

    .line 2685
    :cond_4
    iget v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    .line 2686
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapDisconnectSIM ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move v8, v7

    .line 2687
    .end local v7           #ret:I
    .restart local v8       #ret:I
    goto :goto_2
.end method

.method declared-synchronized btSimapPowerOffSIM()I
    .locals 9

    .prologue
    .line 2780
    monitor-enter p0

    const/4 v7, 0x0

    .line 2781
    .local v7, ret:I
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 2783
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2784
    :catch_0
    move-exception v6

    .line 2785
    .local v6, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2780
    .end local v6           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2788
    :cond_0
    const/4 v0, 0x0

    :try_start_3
    iput-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    .line 2789
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x12f

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 2792
    .local v4, callback:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getBtConnectedSimId()I

    move-result v5

    .line 2793
    .local v5, simId:I
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapPowerOffSIM GEMINI connect Sim is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2794
    if-eqz v5, :cond_1

    const/4 v0, 0x1

    if-ne v5, v0, :cond_2

    .line 2795
    :cond_1
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendBTSIMProfileGemini(IILjava/lang/String;Landroid/os/Message;I)V

    .line 2804
    :goto_1
    iget-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v0, :cond_3

    .line 2806
    :try_start_4
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "wait for done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2807
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 2808
    :catch_1
    move-exception v6

    .line 2810
    .restart local v6       #e:Ljava/lang/InterruptedException;
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 2797
    .end local v6           #e:Ljava/lang/InterruptedException;
    :cond_2
    const/4 v7, 0x7

    move v8, v7

    .line 2816
    .end local v7           #ret:I
    .local v8, ret:I
    :goto_2
    monitor-exit p0

    return v8

    .line 2813
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_3
    :try_start_6
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2814
    iget v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    .line 2815
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapPowerOffSIM ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move v8, v7

    .line 2816
    .end local v7           #ret:I
    .restart local v8       #ret:I
    goto :goto_2
.end method

.method declared-synchronized btSimapPowerOnSIM(I)I
    .locals 9
    .parameter "type"

    .prologue
    .line 2736
    monitor-enter p0

    const/4 v7, 0x0

    .line 2737
    .local v7, ret:I
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 2739
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2740
    :catch_0
    move-exception v6

    .line 2741
    .local v6, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2736
    .end local v6           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2744
    :cond_0
    const/4 v0, 0x0

    :try_start_3
    iput-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    .line 2745
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x12e

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 2748
    .local v4, callback:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getBtConnectedSimId()I

    move-result v5

    .line 2749
    .local v5, simId:I
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapPowerOnSIM GEMINI connect Sim is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2750
    if-eqz v5, :cond_1

    const/4 v0, 0x1

    if-ne v5, v0, :cond_2

    .line 2751
    :cond_1
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/4 v1, 0x2

    const/4 v3, 0x0

    move v2, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendBTSIMProfileGemini(IILjava/lang/String;Landroid/os/Message;I)V

    .line 2760
    :goto_1
    iget-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v0, :cond_3

    .line 2762
    :try_start_4
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "wait for done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2763
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 2764
    :catch_1
    move-exception v6

    .line 2766
    .restart local v6       #e:Ljava/lang/InterruptedException;
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 2753
    .end local v6           #e:Ljava/lang/InterruptedException;
    :cond_2
    const/4 v7, 0x7

    move v8, v7

    .line 2776
    .end local v7           #ret:I
    .local v8, ret:I
    :goto_2
    monitor-exit p0

    return v8

    .line 2769
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_3
    :try_start_6
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2770
    iget v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    if-nez v0, :cond_4

    .line 2771
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "btSimapPowerOnSIM curType "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getCurType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ATR "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getAtrString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2775
    :goto_3
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapPowerOnSIM ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v8, v7

    .line 2776
    .end local v7           #ret:I
    .restart local v8       #ret:I
    goto :goto_2

    .line 2773
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_4
    iget v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
.end method

.method declared-synchronized btSimapResetSIM(I)I
    .locals 9
    .parameter "type"

    .prologue
    .line 2691
    monitor-enter p0

    const/4 v7, 0x0

    .line 2692
    .local v7, ret:I
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 2694
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2695
    :catch_0
    move-exception v6

    .line 2696
    .local v6, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2691
    .end local v6           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2699
    :cond_0
    const/4 v0, 0x0

    :try_start_3
    iput-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z

    .line 2700
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x130

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    .line 2703
    .local v4, callback:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getBtConnectedSimId()I

    move-result v5

    .line 2704
    .local v5, simId:I
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapResetSIM GEMINI connect Sim is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2705
    if-eqz v5, :cond_1

    const/4 v0, 0x1

    if-ne v5, v0, :cond_2

    .line 2706
    :cond_1
    iget-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtSapPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    const/4 v1, 0x4

    const/4 v3, 0x0

    move v2, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/gemini/GeminiPhone;->sendBTSIMProfileGemini(IILjava/lang/String;Landroid/os/Message;I)V

    .line 2715
    :goto_1
    iget-boolean v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-nez v0, :cond_3

    .line 2717
    :try_start_4
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "wait for done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2718
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 2719
    :catch_1
    move-exception v6

    .line 2721
    .restart local v6       #e:Ljava/lang/InterruptedException;
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 2708
    .end local v6           #e:Ljava/lang/InterruptedException;
    :cond_2
    const/4 v7, 0x7

    move v8, v7

    .line 2732
    .end local v7           #ret:I
    .local v8, ret:I
    :goto_2
    monitor-exit p0

    return v8

    .line 2724
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_3
    :try_start_6
    const-string v0, "PhoneInterfaceManager"

    const-string v1, "done"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2725
    iget v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I

    if-nez v0, :cond_4

    .line 2726
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "btSimapResetSIM curType "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getCurType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ATR "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    invoke-virtual {v2}, Landroid/telephony/BtSimapOperResponse;->getAtrString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2731
    :goto_3
    const-string v0, "PhoneInterfaceManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "synchronized btSimapResetSIM ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v8, v7

    .line 2732
    .end local v7           #ret:I
    .restart local v8       #ret:I
    goto :goto_2

    .line 2728
    .end local v8           #ret:I
    .restart local v7       #ret:I
    :cond_4
    iget v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3
.end method

.method public run()V
    .locals 1

    .prologue
    .line 2420
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 2421
    monitor-enter p0

    .line 2422
    :try_start_0
    new-instance v0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;

    invoke-direct {v0, p0}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;-><init>(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)V

    iput-object v0, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mHandler:Landroid/os/Handler;

    .line 2596
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 2597
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2598
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 2599
    return-void

    .line 2597
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public setBtOperResponse(Landroid/telephony/BtSimapOperResponse;)V
    .locals 0
    .parameter "btRsp"

    .prologue
    .line 2415
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;

    .line 2416
    return-void
.end method
