.class Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;
.super Landroid/os/Handler;
.source "KeyguardViewMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Landroid/os/Looper;Landroid/os/Handler$Callback;Z)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 1400
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    invoke-direct {p0, p2, p3, p4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;Z)V

    return-void
.end method

.method private getMessageString(Landroid/os/Message;)Ljava/lang/String;
    .locals 1
    .parameter "message"

    .prologue
    .line 1404
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 1440
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 1406
    :sswitch_0
    const-string v0, "SHOW"

    goto :goto_0

    .line 1408
    :sswitch_1
    const-string v0, "HIDE"

    goto :goto_0

    .line 1410
    :sswitch_2
    const-string v0, "RESET"

    goto :goto_0

    .line 1412
    :sswitch_3
    const-string v0, "VERIFY_UNLOCK"

    goto :goto_0

    .line 1414
    :sswitch_4
    const-string v0, "NOTIFY_SCREEN_OFF"

    goto :goto_0

    .line 1416
    :sswitch_5
    const-string v0, "NOTIFY_SCREEN_ON"

    goto :goto_0

    .line 1418
    :sswitch_6
    const-string v0, "WAKE_WHEN_READY"

    goto :goto_0

    .line 1420
    :sswitch_7
    const-string v0, "KEYGUARD_DONE"

    goto :goto_0

    .line 1422
    :sswitch_8
    const-string v0, "KEYGUARD_DONE_DRAWING"

    goto :goto_0

    .line 1424
    :sswitch_9
    const-string v0, "KEYGUARD_DONE_AUTHENTICATING"

    goto :goto_0

    .line 1426
    :sswitch_a
    const-string v0, "SET_HIDDEN"

    goto :goto_0

    .line 1428
    :sswitch_b
    const-string v0, "KEYGUARD_TIMEOUT"

    goto :goto_0

    .line 1430
    :sswitch_c
    const-string v0, "SHOW_ASSISTANT"

    goto :goto_0

    .line 1432
    :sswitch_d
    const-string v0, "KEYGUARD_RELAYOUT"

    goto :goto_0

    .line 1434
    :sswitch_e
    const-string v0, "ALARM_BOOT"

    goto :goto_0

    .line 1436
    :sswitch_f
    const-string v0, "RESHOW_ANYWHERE"

    goto :goto_0

    .line 1438
    :sswitch_10
    const-string v0, "MSG_DM_KEYGUARD_UPDATE"

    goto :goto_0

    .line 1404
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x3 -> :sswitch_1
        0x4 -> :sswitch_2
        0x5 -> :sswitch_3
        0x6 -> :sswitch_4
        0x7 -> :sswitch_5
        0x8 -> :sswitch_6
        0x9 -> :sswitch_7
        0xa -> :sswitch_8
        0xb -> :sswitch_9
        0xc -> :sswitch_a
        0xd -> :sswitch_b
        0xe -> :sswitch_c
        0x73 -> :sswitch_e
        0x74 -> :sswitch_f
        0x3e8 -> :sswitch_d
        0x3e9 -> :sswitch_10
    .end sparse-switch
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1445
    const-string v3, "KeyguardViewMediator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleMessage enter msg name="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->getMessageString(Landroid/os/Message;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 1446
    iget v3, p1, Landroid/os/Message;->what:I

    sparse-switch v3, :sswitch_data_0

    .line 1519
    :goto_0
    const-string v1, "KeyguardViewMediator"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleMessage exit msg name="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->getMessageString(Landroid/os/Message;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 1520
    return-void

    .line 1448
    :sswitch_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/Bundle;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleShow(Landroid/os/Bundle;)V
    invoke-static {v2, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2200(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Landroid/os/Bundle;)V

    goto :goto_0

    .line 1451
    :sswitch_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleHide()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2300(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)V

    goto :goto_0

    .line 1454
    :sswitch_2
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/Bundle;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleReset(Landroid/os/Bundle;)V
    invoke-static {v2, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2400(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Landroid/os/Bundle;)V

    goto :goto_0

    .line 1457
    :sswitch_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleVerifyUnlock()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2500(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)V

    goto :goto_0

    .line 1460
    :sswitch_4
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleNotifyScreenOff()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2600(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)V

    goto :goto_0

    .line 1463
    :sswitch_5
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/policy/impl/keyguard/KeyguardViewManager$ShowListener;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleNotifyScreenOn(Lcom/android/internal/policy/impl/keyguard/KeyguardViewManager$ShowListener;)V
    invoke-static {v2, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2700(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Lcom/android/internal/policy/impl/keyguard/KeyguardViewManager$ShowListener;)V

    goto :goto_0

    .line 1467
    :sswitch_6
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleWakeWhenReady(II)V
    invoke-static {v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2800(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;II)V

    goto :goto_0

    .line 1470
    :sswitch_7
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget v4, p1, Landroid/os/Message;->arg1:I

    if-eqz v4, :cond_0

    :goto_1
    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleKeyguardDone(Z)V
    invoke-static {v3, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2900(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Z)V

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_1

    .line 1473
    :sswitch_8
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleKeyguardDoneDrawing()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$3000(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)V

    goto :goto_0

    .line 1476
    :sswitch_9
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    invoke-virtual {v2, v1, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->keyguardDone(ZZ)V

    goto :goto_0

    .line 1479
    :sswitch_a
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget v4, p1, Landroid/os/Message;->arg1:I

    if-eqz v4, :cond_1

    :goto_2
    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleSetHidden(Z)V
    invoke-static {v3, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$3100(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Z)V

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_2

    .line 1482
    :sswitch_b
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    monitor-enter v2

    .line 1483
    :try_start_0
    const-string v1, "KeyguardViewMediator"

    const-string v3, "doKeyguardLocked, because:KEYGUARD_TIMEOUT"

    invoke-static {v1, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardUtils;->xlogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 1484
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/Bundle;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->doKeyguardLocked(Landroid/os/Bundle;)V
    invoke-static {v3, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$3200(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Landroid/os/Bundle;)V

    .line 1485
    monitor-exit v2

    goto/16 :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1488
    :sswitch_c
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleShowAssistant()V

    goto/16 :goto_0

    .line 1493
    :sswitch_d
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget v4, p1, Landroid/os/Message;->arg1:I

    if-ne v4, v1, :cond_2

    :goto_3
    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleKeyguardReLayout(Z)V
    invoke-static {v3, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$3300(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Z)V

    goto/16 :goto_0

    :cond_2
    move v1, v2

    goto :goto_3

    .line 1496
    :sswitch_e
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleAlarmBoot()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$3400(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)V

    goto/16 :goto_0

    .line 1499
    :sswitch_f
    const-string v1, "sys.boot.reason"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1501
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->mUpdateMonitor:Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$800(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor;->dmIsLocked()Z

    move-result v0

    .line 1502
    .local v0, dmLocked:Z
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->mKeyguardViewManager:Lcom/android/internal/policy/impl/keyguard/KeyguardViewManager;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$1200(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)Lcom/android/internal/policy/impl/keyguard/KeyguardViewManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewManager;->reLayoutScreen(Z)V

    .line 1504
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleHide()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2300(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)V

    .line 1505
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    #getter for: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->mLockPatternUtils:Lcom/android/internal/widget/LockPatternUtils;
    invoke-static {v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$300(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;)Lcom/android/internal/widget/LockPatternUtils;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/widget/LockPatternUtils;->isLockScreenDisabled()Z

    move-result v1

    if-nez v1, :cond_3

    .line 1506
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    const/4 v2, 0x0

    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleShow(Landroid/os/Bundle;)V
    invoke-static {v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$2200(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Landroid/os/Bundle;)V

    .line 1508
    :cond_3
    new-instance v1, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4$1;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4$1;-><init>(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;)V

    const-wide/16 v2, 0xfa0

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 1515
    .end local v0           #dmLocked:Z
    :sswitch_10
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator$4;->this$0:Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;

    iget v4, p1, Landroid/os/Message;->arg1:I

    if-ne v4, v1, :cond_4

    :goto_4
    #calls: Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->handleDMKeyguardUpdate(Z)V
    invoke-static {v3, v1}, Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;->access$3500(Lcom/android/internal/policy/impl/keyguard/KeyguardViewMediator;Z)V

    goto/16 :goto_0

    :cond_4
    move v1, v2

    goto :goto_4

    .line 1446
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x3 -> :sswitch_1
        0x4 -> :sswitch_2
        0x5 -> :sswitch_3
        0x6 -> :sswitch_4
        0x7 -> :sswitch_5
        0x8 -> :sswitch_6
        0x9 -> :sswitch_7
        0xa -> :sswitch_8
        0xb -> :sswitch_9
        0xc -> :sswitch_a
        0xd -> :sswitch_b
        0xe -> :sswitch_c
        0x73 -> :sswitch_e
        0x74 -> :sswitch_f
        0x3e8 -> :sswitch_d
        0x3e9 -> :sswitch_10
    .end sparse-switch
.end method
