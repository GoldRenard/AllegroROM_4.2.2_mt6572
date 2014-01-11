.class Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;
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
    name = "OppsTaskHandler"
.end annotation


# instance fields
.field mIsBusy:Z

.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/adp/OppService;)V
    .locals 1
    .parameter

    .prologue
    .line 595
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 598
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    return-void
.end method


# virtual methods
.method public afterWait()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 680
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v11, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v12

    const-string v3, "type between ? and ? AND state in ( ?, ? )"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const/16 v5, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v12

    const/16 v5, 0x13

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v11

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v13

    const/4 v5, 0x3

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v4, v5

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 695
    .local v6, cursor:Landroid/database/Cursor;
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v8

    .line 697
    .local v8, newTaskList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getOppTaskList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v8

    .line 698
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "opps afterWait(): task count: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 701
    if-eqz v6, :cond_0

    .line 703
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 704
    const/4 v6, 0x0

    .line 709
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->acquireWakeLock()V

    .line 711
    :try_start_1
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    .line 713
    .local v1, newTask:Landroid/net/Uri;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "opps afterWait() processing task:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 716
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsSetCurrentTask(Landroid/net/Uri;)V

    .line 719
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x0

    const-string v3, "state=1 OR state=2"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    .line 726
    const/4 v9, 0x0

    .line 728
    .local v9, task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    if-eqz v6, :cond_2

    :try_start_2
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v0

    if-nez v0, :cond_5

    .line 742
    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v2, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$102(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 743
    if-eqz v9, :cond_3

    .line 746
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v2, 0x0

    invoke-static {v0, v9, v2}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V

    .line 750
    :cond_3
    if-eqz v6, :cond_1

    .line 751
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 757
    .end local v1           #newTask:Landroid/net/Uri;
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v9           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :catchall_0
    move-exception v0

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->releaeWakeLock()V

    .line 760
    iput-boolean v12, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    throw v0

    .line 701
    :catchall_1
    move-exception v0

    if-eqz v6, :cond_4

    .line 703
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 704
    const/4 v6, 0x0

    :cond_4
    throw v0

    .line 733
    .restart local v1       #newTask:Landroid/net/Uri;
    .restart local v7       #i$:Ljava/util/Iterator;
    .restart local v9       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :cond_5
    :try_start_4
    new-instance v10, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-direct {v10, v6}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(Landroid/database/Cursor;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 736
    .end local v9           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .local v10, task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :try_start_5
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v2, 0x1

    invoke-static {v0, v10, v2}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V

    .line 738
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v10}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v2

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$102(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 739
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0, v10, p0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsAccessResponse(Lcom/mediatek/bluetooth/share/BluetoothShareTask;Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;)Z

    .line 740
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsSetCurrentTask(Landroid/net/Uri;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 742
    :try_start_6
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v2, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$102(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 743
    if-eqz v10, :cond_6

    .line 746
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v2, 0x0

    invoke-static {v0, v10, v2}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V

    .line 750
    :cond_6
    if-eqz v6, :cond_1

    .line 751
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 742
    .end local v10           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .restart local v9       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :catchall_2
    move-exception v0

    :goto_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v3, 0x0

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppsCurrentStoragePath:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$102(Lcom/mediatek/bluetooth/opp/adp/OppService;Ljava/lang/String;)Ljava/lang/String;

    .line 743
    if-eqz v9, :cond_7

    .line 746
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/4 v3, 0x0

    invoke-static {v2, v9, v3}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V

    .line 750
    :cond_7
    if-eqz v6, :cond_8

    .line 751
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_8
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 757
    .end local v1           #newTask:Landroid/net/Uri;
    .end local v9           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :cond_9
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->releaeWakeLock()V

    .line 760
    iput-boolean v12, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    .line 762
    return-void

    .line 742
    .restart local v1       #newTask:Landroid/net/Uri;
    .restart local v10       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :catchall_3
    move-exception v0

    move-object v9, v10

    .end local v10           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .restart local v9       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    goto :goto_1
.end method

.method public beforeWait()Z
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 605
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppsResetTask:Z
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$500(Lcom/mediatek/bluetooth/opp/adp/OppService;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 607
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #setter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mIsOppsResetTask:Z
    invoke-static {v0, v11}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$502(Lcom/mediatek/bluetooth/opp/adp/OppService;Z)Z

    .line 611
    const-string v0, "opps beforeWait() - oppsResetTaskState() "

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 612
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsResetTaskState()V

    .line 615
    :cond_0
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    if-eqz v0, :cond_1

    move v0, v11

    .line 673
    :goto_0
    return v0

    .line 620
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsWaitForAccessRequest()Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    move-result-object v8

    .line 621
    .local v8, ind:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    iget-object v7, v8, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 624
    .local v7, args:[Ljava/lang/String;
    iget v0, v8, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    const/16 v1, 0x71

    if-ne v0, v1, :cond_4

    .line 627
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsIsAuthorized()Z

    move-result v1

    aget-object v2, v7, v12

    aget-object v3, v7, v11

    aget-object v4, v7, v13

    const/4 v5, 0x3

    aget-object v5, v7, v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual/range {v0 .. v6}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsStartPushActivity(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z

    move-result v9

    .line 630
    .local v9, isConfirmed:Z
    iput-boolean v11, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    .line 633
    if-nez v9, :cond_2

    .line 635
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsListenDisconnect()Z

    move-result v10

    .line 636
    .local v10, isDisconnected:Z
    if-eqz v10, :cond_3

    .line 638
    iput-boolean v12, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    .line 639
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsCancelPushActivity()V

    move v0, v12

    .line 640
    goto :goto_0

    .line 645
    .end local v10           #isDisconnected:Z
    :cond_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    if-eqz v0, :cond_3

    .line 647
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_3

    .line 649
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/16 v1, 0x60

    new-array v2, v13, [Ljava/lang/String;

    const-string v3, "0"

    aput-object v3, v2, v12

    const-string v3, ""

    aput-object v3, v2, v11

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsAccessResponseNative(I[Ljava/lang/String;)Z

    .line 654
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsListenDisconnect()Z

    move-result v10

    .line 655
    .restart local v10       #isDisconnected:Z
    if-eqz v10, :cond_3

    .line 657
    iput-boolean v12, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    move v0, v12

    .line 658
    goto :goto_0

    .end local v10           #isDisconnected:Z
    :cond_3
    move v0, v11

    .line 665
    goto :goto_0

    .line 667
    .end local v9           #isConfirmed:Z
    :cond_4
    const-string v0, "opps beforeWait(): get unsupported event(oppsRequestIndication)"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 668
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    const/16 v1, 0x51

    new-array v2, v13, [Ljava/lang/String;

    const-string v3, "0"

    aput-object v3, v2, v12

    const-string v3, ""

    aput-object v3, v2, v11

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsAccessResponseNative(I[Ljava/lang/String;)Z

    .line 672
    iput-boolean v12, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->mIsBusy:Z

    move v0, v12

    .line 673
    goto/16 :goto_0
.end method

.method public onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
    .locals 5
    .parameter "task"

    .prologue
    const/4 v4, 0x0

    .line 768
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "opps onObjectChange() for taskId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 772
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setModifiedDate(J)V

    .line 774
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppService;->mOppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->access$300(Lcom/mediatek/bluetooth/opp/adp/OppService;)Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->notifyOppTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 777
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 778
    const-string v0, "onObjectChange,task state is STATE_ONGOING"

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 788
    :goto_0
    return-void

    .line 785
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppService$OppsTaskHandler;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTaskUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getContentValues()Landroid/content/ContentValues;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method
