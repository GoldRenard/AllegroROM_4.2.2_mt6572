.class Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;
.super Ljava/lang/Object;
.source "OppService.java"

# interfaces
.implements Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/opp/adp/OppService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OppcTaskHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/adp/OppService;)V
    .locals 0
    .parameter

    .prologue
    .line 295
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private processBatchPush(Landroid/net/Uri;)V
    .locals 25
    .parameter "taskUri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 399
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 400
    .local v2, contentResolver:Landroid/content/ContentResolver;
    const-string v5, "state=1"

    .line 404
    .local v5, pendingTaskWhere:Ljava/lang/String;
    const/16 v16, 0x0

    .line 405
    .local v16, initTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 407
    .local v14, cursor:Landroid/database/Cursor;
    if-eqz v14, :cond_0

    :try_start_0
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_2

    .line 413
    :cond_0
    if-eqz v14, :cond_1

    .line 414
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 415
    const/4 v14, 0x0

    .line 557
    :cond_1
    :goto_0
    return-void

    .line 411
    :cond_2
    :try_start_1
    new-instance v16, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    .end local v16           #initTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(Landroid/database/Cursor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 413
    .restart local v16       #initTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    if-eqz v14, :cond_3

    .line 414
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 415
    const/4 v14, 0x0

    .line 420
    :cond_3
    sget-object v7, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x1

    new-array v8, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v8, v3

    const-string v9, "type = ? AND state = ? AND peer_addr = ? AND creation = ?"

    const/4 v3, 0x4

    new-array v10, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v10, v3

    const/4 v3, 0x1

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v10, v3

    const/4 v3, 0x2

    invoke-virtual/range {v16 .. v16}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v10, v3

    const/4 v3, 0x3

    invoke-virtual/range {v16 .. v16}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getCreationDate()J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v10, v3

    const-string v11, "_id ASC"

    move-object v6, v2

    invoke-virtual/range {v6 .. v11}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 432
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v12

    .line 434
    .local v12, batchTaskList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v3

    invoke-virtual {v3, v14}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getOppTaskList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v12

    .line 435
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "oppc processBatchPush() - task count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 437
    if-eqz v14, :cond_4

    .line 438
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 439
    const/4 v14, 0x0

    .line 444
    :cond_4
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-lt v3, v4, :cond_1

    .line 449
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual/range {v16 .. v16}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcConnect(Ljava/lang/String;)Z

    move-result v17

    .line 450
    .local v17, isConnected:Z
    const/16 v18, 0x0

    .line 455
    .local v18, isDisconnected:Z
    if-eqz v17, :cond_5

    .line 456
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x1

    move-object/from16 v0, v16

    invoke-static {v3, v0, v4}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V

    .line 460
    :cond_5
    new-instance v22, Landroid/content/ContentValues;

    invoke-direct/range {v22 .. v22}, Landroid/content/ContentValues;-><init>()V

    .line 461
    .local v22, values:Landroid/content/ContentValues;
    const-string v3, "state"

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v22

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 463
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, i$:Ljava/util/Iterator;
    :cond_6
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/Uri;

    .line 465
    .local v7, newTask:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsTaskWorkThreadInterrupted:Z
    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$400(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 466
    const-string v3, "OppTaskWorkerThread had been interuppted, stop current task."

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 470
    const/16 v18, 0x1

    .line 547
    .end local v7           #newTask:Landroid/net/Uri;
    :cond_7
    if-eqz v17, :cond_1

    .line 548
    if-nez v18, :cond_8

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsTaskWorkThreadInterrupted:Z
    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$400(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 549
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcDisconnect()Z

    .line 551
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    move-object/from16 v0, v16

    invoke-static {v3, v0, v4}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V

    .line 553
    const-wide/16 v3, 0x294

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_0

    .line 413
    .end local v12           #batchTaskList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    .end local v15           #i$:Ljava/util/Iterator;
    .end local v16           #initTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .end local v17           #isConnected:Z
    .end local v18           #isDisconnected:Z
    .end local v22           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v3

    if-eqz v14, :cond_9

    .line 414
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 415
    const/4 v14, 0x0

    :cond_9
    throw v3

    .line 437
    .restart local v12       #batchTaskList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    .restart local v16       #initTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :catchall_1
    move-exception v3

    if-eqz v14, :cond_a

    .line 438
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 439
    const/4 v14, 0x0

    :cond_a
    throw v3

    .line 474
    .restart local v7       #newTask:Landroid/net/Uri;
    .restart local v15       #i$:Ljava/util/Iterator;
    .restart local v17       #isConnected:Z
    .restart local v18       #isDisconnected:Z
    .restart local v22       #values:Landroid/content/ContentValues;
    :cond_b
    :try_start_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " oppc processBatchPush() processing task: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 477
    const/4 v3, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v2, v7, v0, v5, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v13

    .line 478
    .local v13, count:I
    const/4 v3, 0x1

    if-eq v13, v3, :cond_e

    .line 479
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "skip non-pending task: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto/16 :goto_1

    .line 547
    .end local v7           #newTask:Landroid/net/Uri;
    .end local v13           #count:I
    .end local v15           #i$:Ljava/util/Iterator;
    .end local v22           #values:Landroid/content/ContentValues;
    :catchall_2
    move-exception v3

    if-eqz v17, :cond_d

    .line 548
    if-nez v18, :cond_c

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsTaskWorkThreadInterrupted:Z
    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$400(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 549
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcDisconnect()Z

    .line 551
    :cond_c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v6, 0x0

    move-object/from16 v0, v16

    invoke-static {v4, v0, v6}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V

    .line 553
    const-wide/16 v8, 0x294

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    :cond_d
    throw v3

    .line 484
    .restart local v7       #newTask:Landroid/net/Uri;
    .restart local v13       #count:I
    .restart local v15       #i$:Ljava/util/Iterator;
    .restart local v22       #values:Landroid/content/ContentValues;
    :cond_e
    :try_start_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v3, v7}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcSetCurrentTask(Landroid/net/Uri;)V

    .line 487
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v6, v2

    invoke-virtual/range {v6 .. v11}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result-object v14

    .line 490
    const/16 v20, 0x0

    .line 492
    .local v20, task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    if-eqz v14, :cond_f

    :try_start_6
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    move-result v3

    if-nez v3, :cond_10

    .line 537
    :cond_f
    :try_start_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$002(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 538
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcSetCurrentTask(Landroid/net/Uri;)V

    .line 539
    if-eqz v14, :cond_6

    .line 540
    invoke-interface {v14}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 541
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 497
    :cond_10
    :try_start_8
    new-instance v21, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    move-object/from16 v0, v21

    invoke-direct {v0, v14}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(Landroid/database/Cursor;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 501
    .end local v20           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .local v21, task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :try_start_9
    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_11

    .line 503
    const-string v3, "handle aborting task before push it."

    invoke-static {v3}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 504
    const/4 v3, 0x6

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 505
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 537
    :try_start_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$002(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 538
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcSetCurrentTask(Landroid/net/Uri;)V

    .line 539
    if-eqz v14, :cond_6

    .line 540
    invoke-interface {v14}, Landroid/database/Cursor;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 541
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 510
    :cond_11
    :try_start_b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v4

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$002(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 514
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/util/SystemUtils;->getExternalStorageDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    if-eqz v3, :cond_12

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppService;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/util/SystemUtils;->isExternalStorageMounted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_13

    :cond_12
    const/16 v19, 0x1

    .line 519
    .local v19, isStorageMounted:Z
    :goto_2
    if-eqz v17, :cond_15

    if-nez v18, :cond_15

    if-eqz v19, :cond_15

    .line 522
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectUri()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/opp/mmi/UriDataUtils;->openUriData(Landroid/content/Context;Landroid/net/Uri;)Z

    .line 525
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v3, v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcPush(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;)Z

    move-result v3

    if-nez v3, :cond_14

    const/16 v18, 0x1

    .line 526
    :goto_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$002(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 528
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual/range {v21 .. v21}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectUri()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/opp/mmi/UriDataUtils;->closeUriData(Landroid/content/Context;Landroid/net/Uri;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 537
    :goto_4
    :try_start_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$002(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 538
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcSetCurrentTask(Landroid/net/Uri;)V

    .line 539
    if-eqz v14, :cond_6

    .line 540
    invoke-interface {v14}, Landroid/database/Cursor;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 541
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 514
    .end local v19           #isStorageMounted:Z
    :cond_13
    const/16 v19, 0x0

    goto :goto_2

    .line 525
    .restart local v19       #isStorageMounted:Z
    :cond_14
    const/16 v18, 0x0

    goto :goto_3

    .line 532
    :cond_15
    const/4 v3, 0x7

    :try_start_d
    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 533
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    goto :goto_4

    .line 537
    .end local v19           #isStorageMounted:Z
    :catchall_3
    move-exception v3

    move-object/from16 v20, v21

    .end local v21           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .restart local v20       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :goto_5
    :try_start_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v6, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppcCurrentStoragePath:Ljava/lang/String;
    invoke-static {v4, v6}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$002(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 538
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcSetCurrentTask(Landroid/net/Uri;)V

    .line 539
    if-eqz v14, :cond_16

    .line 540
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 541
    const/4 v14, 0x0

    :cond_16
    throw v3
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 537
    :catchall_4
    move-exception v3

    goto :goto_5
.end method


# virtual methods
.method public afterWait()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 356
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 359
    .local v0, contentResolver:Landroid/content/ContentResolver;
    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v11, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v10

    const-string v3, "type between ? and ? AND state = ?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v10

    const/16 v5, 0x9

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v11

    const/4 v5, 0x2

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v4, v5

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 370
    .local v6, cursor:Landroid/database/Cursor;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    .line 372
    .local v9, newTaskList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getOppTaskList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v9

    .line 373
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "oppc afterWait() - task count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 375
    if-eqz v6, :cond_0

    .line 376
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 377
    const/4 v6, 0x0

    .line 382
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->acquireWakeLock()V

    .line 385
    :try_start_1
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    .line 387
    .local v8, newTask:Landroid/net/Uri;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " oppc afterWait() processing task: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 388
    invoke-direct {p0, v8}, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->processBatchPush(Landroid/net/Uri;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 392
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #newTask:Landroid/net/Uri;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->releaeWakeLock()V

    throw v1

    .line 375
    :catchall_1
    move-exception v1

    if-eqz v6, :cond_1

    .line 376
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 377
    const/4 v6, 0x0

    :cond_1
    throw v1

    .line 392
    .restart local v7       #i$:Ljava/util/Iterator;
    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->releaeWakeLock()V

    .line 394
    return-void
.end method

.method public beforeWait()Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v11, 0x1

    .line 303
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppcResetTask:Z
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$200(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 305
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppcResetTask:Z
    invoke-static {v1, v11}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$202(Lcom/mediatek/bluetooth/opp/adp/OppService;Z)Z

    .line 307
    const-string v1, "oppc beforeWait() - oppcResetTaskState() "

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 308
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppcResetTaskState()V

    .line 311
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 314
    .local v0, contentResolver:Landroid/content/ContentResolver;
    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v11, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v10

    const-string v3, "type between ? and ? AND state = ?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v10

    const/16 v5, 0x9

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v11

    const/4 v5, 0x2

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v4, v5

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 325
    .local v6, cursor:Landroid/database/Cursor;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    .line 327
    .local v9, newTaskList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getOppTaskList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v9

    .line 328
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "oppc beforeWait() - task count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 330
    if-eqz v6, :cond_0

    .line 331
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 332
    const/4 v6, 0x0

    .line 337
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->acquireWakeLock()V

    .line 340
    :try_start_1
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    .line 342
    .local v8, newTask:Landroid/net/Uri;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " oppc beforeWait() processing task: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 343
    invoke-direct {p0, v8}, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->processBatchPush(Landroid/net/Uri;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 347
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #newTask:Landroid/net/Uri;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->releaeWakeLock()V

    throw v1

    .line 330
    :catchall_1
    move-exception v1

    if-eqz v6, :cond_1

    .line 331
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 332
    const/4 v6, 0x0

    :cond_1
    throw v1

    .line 347
    .restart local v7       #i$:Ljava/util/Iterator;
    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->releaeWakeLock()V

    .line 351
    .end local v0           #contentResolver:Landroid/content/ContentResolver;
    .end local v6           #cursor:Landroid/database/Cursor;
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v9           #newTaskList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    :cond_3
    return v11
.end method

.method public onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
    .locals 6
    .parameter "task"

    .prologue
    .line 563
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "oppc onObjectChange() for taskId["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "], state["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 567
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v1, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setModifiedDate(J)V

    .line 570
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->notifyOppTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 573
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 574
    const-string v1, "onObjectChange,task is STATE_ONGOING"

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 589
    :goto_0
    return-void

    .line 582
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppcTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTaskUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getContentValues()Landroid/content/ContentValues;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 584
    :catch_0
    move-exception v0

    .line 585
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "onObjectChange::update db error"

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 586
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
