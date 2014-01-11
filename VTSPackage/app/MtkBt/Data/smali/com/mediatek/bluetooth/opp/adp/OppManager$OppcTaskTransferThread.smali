.class public Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;
.super Ljava/lang/Thread;
.source "OppManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/opp/adp/OppManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OppcTaskTransferThread"
.end annotation


# instance fields
.field private mParam:[Ljava/lang/Object;

.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;


# direct methods
.method public constructor <init>(Lcom/mediatek/bluetooth/opp/adp/OppManager;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter "name"
    .parameter "param"

    .prologue
    .line 1011
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    .line 1013
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 1014
    iput-object p3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->mParam:[Ljava/lang/Object;

    .line 1015
    return-void
.end method


# virtual methods
.method public declared-synchronized oppcHandleTask()V
    .locals 18

    .prologue
    .line 1031
    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 1032
    .local v1, batchTimestamp:J
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->mParam:[Ljava/lang/Object;

    const/4 v14, 0x0

    aget-object v4, v13, v14

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    .line 1033
    .local v4, device:Landroid/bluetooth/BluetoothDevice;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->mParam:[Ljava/lang/Object;

    const/4 v14, 0x1

    aget-object v3, v13, v14

    check-cast v3, Ljava/util/ArrayList;

    .line 1034
    .local v3, cachedTasks:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/bluetooth/share/BluetoothShareTask;>;"
    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    .line 1035
    .local v6, deviceName:Ljava/lang/String;
    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    .line 1036
    .local v5, deviceAddr:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    .line 1038
    .local v11, task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;
    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v11}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectUri()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/mediatek/bluetooth/opp/mmi/UriDataUtils;->getUriData(Landroid/content/Context;Landroid/net/Uri;)Lcom/mediatek/bluetooth/opp/mmi/UriData;

    move-result-object v12

    .line 1039
    .local v12, ud:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    if-eqz v12, :cond_0

    .line 1041
    invoke-virtual {v12}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setObjectName(Ljava/lang/String;)V

    .line 1042
    invoke-virtual {v12}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->getData()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setData(Ljava/lang/String;)V

    .line 1043
    invoke-virtual {v12}, Lcom/mediatek/bluetooth/opp/mmi/UriData;->getSize()J

    move-result-wide v13

    invoke-virtual {v11, v13, v14}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setTotalBytes(J)V

    .line 1044
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 1053
    :goto_1
    invoke-virtual {v11, v6}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setPeerName(Ljava/lang/String;)V

    .line 1054
    invoke-virtual {v11, v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setPeerAddr(Ljava/lang/String;)V

    .line 1055
    invoke-virtual {v11, v1, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setCreationDate(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1057
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;
    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->access$100(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Landroid/content/ContentResolver;

    move-result-object v13

    sget-object v14, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v11}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getContentValues()Landroid/content/ContentValues;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v10

    .line 1058
    .local v10, newUri:Landroid/net/Uri;
    if-eqz v10, :cond_1

    .line 1059
    invoke-virtual {v10}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v11, v13}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setId(I)V

    .line 1061
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v13, v11}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->notifyOppTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1066
    .end local v10           #newUri:Landroid/net/Uri;
    :catch_0
    move-exception v7

    .line 1068
    .local v7, e:Landroid/database/sqlite/SQLiteFullException;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;
    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->access$200(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    move-result-object v13

    iget-object v13, v13, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;
    invoke-static {v14}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->access$200(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    move-result-object v14

    iget-object v14, v14, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    const/4 v15, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    move-object/from16 v16, v0

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;
    invoke-static/range {v16 .. v16}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Landroid/content/Context;

    move-result-object v16

    const v17, 0x7f05003c

    invoke-virtual/range {v16 .. v17}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1070
    const/16 v13, 0x9

    invoke-virtual {v11, v13}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 1072
    const-string v13, "oppcHandleTask::insert to db exception"

    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 1073
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteFullException;->printStackTrace()V

    .line 1075
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1076
    const/4 v3, 0x0

    .line 1096
    .end local v7           #e:Landroid/database/sqlite/SQLiteFullException;
    .end local v11           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .end local v12           #ud:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :goto_2
    monitor-exit p0

    return-void

    .line 1046
    .restart local v11       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .restart local v12       #ud:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :cond_0
    :try_start_3
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "oppcSubmitTask - invalid task object: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v11}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPrintableString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 1049
    const/4 v13, 0x7

    invoke-virtual {v11, v13}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1

    .line 1031
    .end local v1           #batchTimestamp:J
    .end local v3           #cachedTasks:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/bluetooth/share/BluetoothShareTask;>;"
    .end local v4           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v5           #deviceAddr:Ljava/lang/String;
    .end local v6           #deviceName:Ljava/lang/String;
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v11           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .end local v12           #ud:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :catchall_0
    move-exception v13

    monitor-exit p0

    throw v13

    .line 1063
    .restart local v1       #batchTimestamp:J
    .restart local v3       #cachedTasks:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/bluetooth/share/BluetoothShareTask;>;"
    .restart local v4       #device:Landroid/bluetooth/BluetoothDevice;
    .restart local v5       #deviceAddr:Ljava/lang/String;
    .restart local v6       #deviceName:Ljava/lang/String;
    .restart local v8       #i$:Ljava/util/Iterator;
    .restart local v10       #newUri:Landroid/net/Uri;
    .restart local v11       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .restart local v12       #ud:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :cond_1
    :try_start_4
    const-string v13, "newUri is null"

    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_2

    .line 1088
    .end local v10           #newUri:Landroid/net/Uri;
    .end local v11           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .end local v12           #ud:Lcom/mediatek/bluetooth/opp/mmi/UriData;
    :cond_2
    :try_start_5
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 1089
    const/4 v3, 0x0

    .line 1092
    new-instance v9, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;
    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Landroid/content/Context;

    move-result-object v13

    const-class v14, Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-direct {v9, v13, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1093
    .local v9, intent:Landroid/content/Intent;
    const-string v13, "com.mediatek.bluetooth.opp.action.OPPC_START"

    invoke-virtual {v9, v13}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1094
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->this$0:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    #getter for: Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;
    invoke-static {v13}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->access$000(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13, v9}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2
.end method

.method public run()V
    .locals 2

    .prologue
    .line 1020
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Oppc Task handler thread start: thread name - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 1021
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 1023
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->oppcHandleTask()V

    .line 1025
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Oppc Task handler thread end: thread name - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 1027
    return-void
.end method
