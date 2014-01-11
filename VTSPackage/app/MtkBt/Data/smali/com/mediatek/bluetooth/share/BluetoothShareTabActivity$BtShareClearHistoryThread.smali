.class public Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;
.super Ljava/lang/Thread;
.source "BluetoothShareTabActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BtShareClearHistoryThread"
.end annotation


# instance fields
.field private mCursor:Landroid/database/Cursor;

.field private mUris:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;


# direct methods
.method public constructor <init>(Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;[Ljava/lang/Object;)V
    .locals 1
    .parameter
    .parameter "param"

    .prologue
    .line 340
    iput-object p1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    .line 341
    const-string v0, "BtShareClearHistoryThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 336
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->mCursor:Landroid/database/Cursor;

    .line 342
    const/4 v0, 0x0

    aget-object v0, p2, v0

    check-cast v0, Landroid/database/Cursor;

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->mCursor:Landroid/database/Cursor;

    .line 343
    const/4 v0, 0x1

    aget-object v0, p2, v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->mUris:Ljava/util/ArrayList;

    .line 344
    return-void
.end method


# virtual methods
.method public declared-synchronized clearAllItems()V
    .locals 12

    .prologue
    .line 360
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_1

    .line 361
    const-string v0, "this.cursor is null "

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 397
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 365
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "this.cursor.getCount(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 367
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->mCursor:Landroid/database/Cursor;

    const-string v1, "_id"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    .line 369
    .local v7, columnIndex:I
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->mUris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/net/Uri;

    .line 370
    .local v11, uri:Landroid/net/Uri;
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    .line 371
    .local v10, updateValues:Landroid/content/ContentValues;
    const-string v0, "state"

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 372
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v11, v10, v1, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 360
    .end local v7           #columnIndex:I
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v10           #updateValues:Landroid/content/ContentValues;
    .end local v11           #uri:Landroid/net/Uri;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 376
    .restart local v7       #columnIndex:I
    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_2
    :try_start_2
    const-string v0, "clear all items in list and trigger check event"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 377
    const/4 v6, 0x0

    .line 379
    .local v6, c:Landroid/database/Cursor;
    :try_start_3
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const-string v3, "state in (8,7)"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 382
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_3

    .line 384
    const-string v0, "No record to be showed and cancel notification"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 385
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    sget v1, Lcom/mediatek/bluetooth/util/NotificationFactory;->NID_SHARE_MGMT_NOTIFICATION:I

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Landroid/database/CursorIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0

    .line 392
    :cond_3
    if-eqz v6, :cond_0

    .line 393
    :try_start_4
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 388
    :catch_0
    move-exception v8

    .line 390
    .local v8, ex:Landroid/database/CursorIndexOutOfBoundsException;
    :try_start_5
    const-string v0, "check empty share list error:"

    invoke-static {v0, v8}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 392
    if-eqz v6, :cond_0

    .line 393
    :try_start_6
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 392
    .end local v8           #ex:Landroid/database/CursorIndexOutOfBoundsException;
    :catchall_1
    move-exception v0

    if-eqz v6, :cond_4

    .line 393
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 349
    const-string v0, "BtShareClearHistoryThread start: [+]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 350
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 351
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->sIsClearThreadWorking:Z

    .line 352
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->clearAllItems()V

    .line 353
    iget-object v0, p0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity$BtShareClearHistoryThread;->this$0:Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/share/BluetoothShareTabActivity;->sIsClearThreadWorking:Z

    .line 354
    const-string v0, "BtShareClearHistoryThread End: [-]"

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 356
    return-void
.end method
