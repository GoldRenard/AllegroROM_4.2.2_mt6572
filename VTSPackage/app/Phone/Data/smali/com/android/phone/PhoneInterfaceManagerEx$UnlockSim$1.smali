.class Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;
.super Landroid/os/Handler;
.source "PhoneInterfaceManagerEx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;


# direct methods
.method constructor <init>(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;)V
    .locals 0
    .parameter

    .prologue
    .line 336
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .parameter "msg"

    .prologue
    .line 339
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    .line 340
    .local v2, ar:Landroid/os/AsyncResult;
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    .line 380
    :goto_0
    return-void

    .line 342
    :pswitch_0
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    monitor-enter v4

    .line 343
    :try_start_0
    iget-object v3, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object v1, v0

    .line 344
    .local v1, LockState:[I
    iget-object v3, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_0

    .line 345
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v5, "Query network lock fail"

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mResult:Z
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$102(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;Z)Z

    .line 347
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mDone:Z
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$202(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;Z)Z

    .line 358
    :goto_1
    monitor-exit v4

    goto :goto_0

    .end local v1           #LockState:[I
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 349
    .restart local v1       #LockState:[I
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x2

    aget v5, v1, v5

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mSIMMELockRetryCount:I
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$302(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;I)I

    .line 350
    const-string v3, "PhoneInterfaceManagerEx"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[SIMQUERY] Category = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    aget v6, v1, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ,Network status ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    aget v6, v1, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ,Retry count = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x2

    aget v6, v1, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mDone:Z
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$202(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;Z)Z

    .line 355
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mResult:Z
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$102(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;Z)Z

    .line 356
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 361
    .end local v1           #LockState:[I
    :pswitch_1
    const-string v3, "PhoneInterfaceManagerEx"

    const-string v4, "SUPPLY_NETWORK_LOCK_COMPLETE"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    monitor-enter v4

    .line 363
    :try_start_2
    iget-object v3, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_2

    iget-object v3, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    instance-of v3, v3, Lcom/android/internal/telephony/CommandException;

    if-eqz v3, :cond_2

    .line 365
    const-string v3, "PhoneInterfaceManagerEx"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ar.exception "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    iget-object v3, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v3, Lcom/android/internal/telephony/CommandException;

    invoke-virtual {v3}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v3

    sget-object v5, Lcom/android/internal/telephony/CommandException$Error;->PASSWORD_INCORRECT:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v3, v5, :cond_1

    .line 368
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mVerifyResult:I
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$402(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;I)I

    .line 375
    :goto_2
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mDone:Z
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$202(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;Z)Z

    .line 376
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 377
    monitor-exit v4

    goto/16 :goto_0

    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3

    .line 370
    :cond_1
    :try_start_3
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x2

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mVerifyResult:I
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$402(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;I)I

    goto :goto_2

    .line 373
    :cond_2
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim$1;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;

    const/4 v5, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->mVerifyResult:I
    invoke-static {v3, v5}, Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;->access$402(Lcom/android/phone/PhoneInterfaceManagerEx$UnlockSim;I)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    .line 340
    nop

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
