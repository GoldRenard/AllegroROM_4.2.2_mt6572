.class Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;
.super Landroid/os/Handler;
.source "PhoneInterfaceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;


# direct methods
.method constructor <init>(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)V
    .locals 0
    .parameter

    .prologue
    .line 2422
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .parameter "msg"

    .prologue
    .line 2425
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 2426
    .local v0, ar:Landroid/os/AsyncResult;
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 2594
    :goto_0
    return-void

    .line 2428
    :pswitch_0
    const-string v4, "PhoneInterfaceManager"

    const-string v5, "BTSAP_CONNECT_COMPLETE"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2429
    iget-object v5, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    monitor-enter v5

    .line 2430
    :try_start_0
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_2

    .line 2431
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v1, Lcom/android/internal/telephony/CommandException;

    .line 2432
    .local v1, ce:Lcom/android/internal/telephony/CommandException;
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_CARD_REMOVED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_0

    .line 2433
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x4

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    .line 2439
    :goto_1
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception BTSAP_CONNECT, Exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2459
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :goto_2
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1202(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Z)Z

    .line 2460
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 2461
    monitor-exit v5

    goto :goto_0

    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 2434
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_NOT_ACCESSIBLE:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_1

    .line 2435
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x2

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_1

    .line 2437
    :cond_1
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_1

    .line 2441
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_2
    iget-object v6, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v6, v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1002(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Ljava/lang/String;)Ljava/lang/String;

    .line 2442
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_CONNECT_COMPLETE  mStrResult "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1000(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2443
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1000(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Ljava/lang/String;

    move-result-object v4

    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 2446
    .local v3, splited:[Ljava/lang/String;
    :try_start_2
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v6, v3, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/telephony/BtSimapOperResponse;->setCurType(I)V

    .line 2447
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v4

    const/4 v6, 0x1

    aget-object v6, v3, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/telephony/BtSimapOperResponse;->setSupportType(I)V

    .line 2448
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v4

    const/4 v6, 0x2

    aget-object v6, v3, v6

    invoke-virtual {v4, v6}, Landroid/telephony/BtSimapOperResponse;->setAtrString(Ljava/lang/String;)V

    .line 2449
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_CONNECT_COMPLETE curType "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getCurType()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " SupType "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getSupportType()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ATR "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getAtrString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 2454
    :goto_3
    :try_start_3
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto/16 :goto_2

    .line 2450
    :catch_0
    move-exception v2

    .line 2451
    .local v2, e:Ljava/lang/NumberFormatException;
    const-string v4, "PhoneInterfaceManager"

    const-string v6, "NumberFormatException"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 2464
    .end local v2           #e:Ljava/lang/NumberFormatException;
    .end local v3           #splited:[Ljava/lang/String;
    :pswitch_1
    const-string v4, "PhoneInterfaceManager"

    const-string v5, "BTSAP_DISCONNECT_COMPLETE"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2465
    iget-object v5, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    monitor-enter v5

    .line 2466
    :try_start_4
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_5

    .line 2467
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v1, Lcom/android/internal/telephony/CommandException;

    .line 2468
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_CARD_REMOVED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_3

    .line 2469
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x4

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    .line 2475
    :goto_4
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception BTSAP_DISCONNECT, Exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2479
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :goto_5
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_DISCONNECT_COMPLETE result is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$900(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2480
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1202(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Z)Z

    .line 2481
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 2482
    monitor-exit v5

    goto/16 :goto_0

    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v4

    .line 2470
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    :cond_3
    :try_start_5
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_NOT_ACCESSIBLE:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_4

    .line 2471
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x2

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_4

    .line 2473
    :cond_4
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_4

    .line 2477
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_5
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_5

    .line 2485
    :pswitch_2
    const-string v4, "PhoneInterfaceManager"

    const-string v5, "BTSAP_POWERON_COMPLETE"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2486
    iget-object v5, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    monitor-enter v5

    .line 2487
    :try_start_6
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_8

    .line 2488
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v1, Lcom/android/internal/telephony/CommandException;

    .line 2489
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_CARD_REMOVED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_6

    .line 2490
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x4

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    .line 2496
    :goto_6
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception POWERON_COMPLETE, Exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2512
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :goto_7
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1202(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Z)Z

    .line 2513
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 2514
    monitor-exit v5

    goto/16 :goto_0

    :catchall_2
    move-exception v4

    monitor-exit v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v4

    .line 2491
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    :cond_6
    :try_start_7
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_NOT_ACCESSIBLE:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_7

    .line 2492
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x2

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_6

    .line 2494
    :cond_7
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_6

    .line 2498
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_8
    iget-object v6, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v6, v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1002(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Ljava/lang/String;)Ljava/lang/String;

    .line 2499
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_POWERON_COMPLETE  mStrResult "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1000(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2500
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1000(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Ljava/lang/String;

    move-result-object v4

    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-result-object v3

    .line 2503
    .restart local v3       #splited:[Ljava/lang/String;
    :try_start_8
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v6, v3, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/telephony/BtSimapOperResponse;->setCurType(I)V

    .line 2504
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v4

    const/4 v6, 0x1

    aget-object v6, v3, v6

    invoke-virtual {v4, v6}, Landroid/telephony/BtSimapOperResponse;->setAtrString(Ljava/lang/String;)V

    .line 2505
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_POWERON_COMPLETE curType "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getCurType()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ATR "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getAtrString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_8} :catch_1

    .line 2509
    :goto_8
    :try_start_9
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto/16 :goto_7

    .line 2506
    :catch_1
    move-exception v2

    .line 2507
    .restart local v2       #e:Ljava/lang/NumberFormatException;
    const-string v4, "PhoneInterfaceManager"

    const-string v6, "NumberFormatException"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto :goto_8

    .line 2517
    .end local v2           #e:Ljava/lang/NumberFormatException;
    .end local v3           #splited:[Ljava/lang/String;
    :pswitch_3
    const-string v4, "PhoneInterfaceManager"

    const-string v5, "BTSAP_POWEROFF_COMPLETE"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2518
    iget-object v5, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    monitor-enter v5

    .line 2519
    :try_start_a
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_b

    .line 2520
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v1, Lcom/android/internal/telephony/CommandException;

    .line 2521
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_CARD_REMOVED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_9

    .line 2522
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x4

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    .line 2528
    :goto_9
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception BTSAP_POWEROFF, Exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2532
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :goto_a
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_POWEROFF_COMPLETE result is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$900(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2533
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1202(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Z)Z

    .line 2534
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 2535
    monitor-exit v5

    goto/16 :goto_0

    :catchall_3
    move-exception v4

    monitor-exit v5
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    throw v4

    .line 2523
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    :cond_9
    :try_start_b
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_NOT_ACCESSIBLE:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_a

    .line 2524
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x2

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_9

    .line 2526
    :cond_a
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_9

    .line 2530
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_b
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    goto :goto_a

    .line 2538
    :pswitch_4
    const-string v4, "PhoneInterfaceManager"

    const-string v5, "BTSAP_RESETSIM_COMPLETE"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2539
    iget-object v5, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    monitor-enter v5

    .line 2540
    :try_start_c
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_e

    .line 2541
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v1, Lcom/android/internal/telephony/CommandException;

    .line 2542
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_CARD_REMOVED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_c

    .line 2543
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x4

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    .line 2549
    :goto_b
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception BTSAP_RESETSIM, Exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2565
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :goto_c
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1202(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Z)Z

    .line 2566
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 2567
    monitor-exit v5

    goto/16 :goto_0

    :catchall_4
    move-exception v4

    monitor-exit v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    throw v4

    .line 2544
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    :cond_c
    :try_start_d
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_NOT_ACCESSIBLE:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_d

    .line 2545
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x2

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_b

    .line 2547
    :cond_d
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_b

    .line 2551
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_e
    iget-object v6, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v6, v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1002(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Ljava/lang/String;)Ljava/lang/String;

    .line 2552
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_RESETSIM_COMPLETE  mStrResult "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1000(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2553
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mStrResult:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1000(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Ljava/lang/String;

    move-result-object v4

    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    move-result-object v3

    .line 2556
    .restart local v3       #splited:[Ljava/lang/String;
    :try_start_e
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v6, v3, v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/telephony/BtSimapOperResponse;->setCurType(I)V

    .line 2557
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v4

    const/4 v6, 0x1

    aget-object v6, v3, v6

    invoke-virtual {v4, v6}, Landroid/telephony/BtSimapOperResponse;->setAtrString(Ljava/lang/String;)V

    .line 2558
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_RESETSIM_COMPLETE curType "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getCurType()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ATR "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getAtrString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_e} :catch_2

    .line 2562
    :goto_d
    :try_start_f
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto/16 :goto_c

    .line 2559
    :catch_2
    move-exception v2

    .line 2560
    .restart local v2       #e:Ljava/lang/NumberFormatException;
    const-string v4, "PhoneInterfaceManager"

    const-string v6, "NumberFormatException"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    goto :goto_d

    .line 2570
    .end local v2           #e:Ljava/lang/NumberFormatException;
    .end local v3           #splited:[Ljava/lang/String;
    :pswitch_5
    const-string v4, "PhoneInterfaceManager"

    const-string v5, "BTSAP_TRANSFER_APDU_COMPLETE"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2571
    iget-object v5, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    monitor-enter v5

    .line 2572
    :try_start_10
    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_11

    .line 2573
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v1, Lcom/android/internal/telephony/CommandException;

    .line 2574
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_CARD_REMOVED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_f

    .line 2575
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x4

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    .line 2582
    :goto_e
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception BTSAP_TRANSFER_APDU, Exception:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2589
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :goto_f
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mDone:Z
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1202(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;Z)Z

    .line 2590
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 2591
    monitor-exit v5

    goto/16 :goto_0

    :catchall_5
    move-exception v4

    monitor-exit v5
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    throw v4

    .line 2576
    .restart local v1       #ce:Lcom/android/internal/telephony/CommandException;
    :cond_f
    :try_start_11
    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v4

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->BT_SAP_NOT_ACCESSIBLE:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v4, v6, :cond_10

    .line 2577
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x2

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_e

    .line 2579
    :cond_10
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I

    goto :goto_e

    .line 2584
    .end local v1           #ce:Lcom/android/internal/telephony/CommandException;
    :cond_11
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v6

    iget-object v4, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Landroid/telephony/BtSimapOperResponse;->setApduString(Ljava/lang/String;)V

    .line 2585
    const-string v4, "PhoneInterfaceManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BTSAP_TRANSFER_APDU_COMPLETE result is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mBtRsp:Landroid/telephony/BtSimapOperResponse;
    invoke-static {v7}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$1100(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;)Landroid/telephony/BtSimapOperResponse;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/BtSimapOperResponse;->getApduString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2586
    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;

    const/4 v6, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->mRet:I
    invoke-static {v4, v6}, Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;->access$902(Lcom/android/phone/PhoneInterfaceManager$SendBtSimapProfile;I)I
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    goto :goto_f

    .line 2426
    nop

    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
