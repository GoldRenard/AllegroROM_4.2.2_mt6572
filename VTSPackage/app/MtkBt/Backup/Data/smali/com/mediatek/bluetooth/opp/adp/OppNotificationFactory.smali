.class public Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;
.super Ljava/lang/Object;
.source "OppNotificationFactory.java"


# static fields
.field public static final NID_TRANSFER_MGMT:I = 0xf423f

.field private static final NULL_INTENT:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;->NULL_INTENT:Landroid/content/Intent;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createCancelIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;
    .locals 4
    .parameter "context"
    .parameter "id"

    .prologue
    const/4 v3, 0x0

    .line 239
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/bluetooth/opp/mmi/OppCancelActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 240
    .local v0, intent:Landroid/content/Intent;
    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 242
    invoke-static {p0, v3, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method private static createCancelingIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;
    .locals 3
    .parameter "context"
    .parameter "taskId"

    .prologue
    .line 247
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mediatek.bluetooth.receiver.action.SHOW_TOAST"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 248
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.mediatek.bluetooth.receiver.extra.TEXT"

    const v2, 0x7f050031

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 250
    const/high16 v1, 0x800

    invoke-static {p0, p1, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method public static getOppIncomingNotification(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;)Landroid/app/Notification;
    .locals 11
    .parameter "context"
    .parameter "task"

    .prologue
    .line 175
    new-instance v9, Landroid/content/Intent;

    const-string v0, "com.mediatek.bluetooth.opp.action.PUSH_REQUEST"

    invoke-direct {v9, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 176
    .local v9, intent:Landroid/content/Intent;
    const/high16 v0, 0x1000

    invoke-virtual {v9, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 179
    const-string v0, "com.mediatek.bluetooth.opp.extra.PEER_NAME"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 180
    const-string v0, "com.mediatek.bluetooth.opp.extra.OBJECT_NAME"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    const-string v0, "com.mediatek.bluetooth.opp.extra.TOTAL_BYTES"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v1

    invoke-virtual {v9, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 182
    const-string v0, "com.mediatek.bluetooth.opp.extra.TASK_ID"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v1

    invoke-virtual {v9, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 184
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v0

    const v1, 0x7f020001

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getCreationDate()J

    move-result-wide v2

    const v4, 0x7f050026

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f050027

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f050028

    invoke-virtual {p0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v7

    const/high16 v8, 0x4000

    invoke-static {p0, v7, v9, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    move-object v8, p0

    invoke-static/range {v0 .. v8}, Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;->getSimpleNotification(IIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v10

    .line 191
    .local v10, n:Landroid/app/Notification;
    iget v0, v10, Landroid/app/Notification;->flags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, v10, Landroid/app/Notification;->flags:I

    .line 192
    const/4 v0, 0x3

    iput v0, v10, Landroid/app/Notification;->defaults:I

    .line 193
    return-object v10
.end method

.method public static getOppOngoingNotification(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;)Landroid/app/Notification;
    .locals 19
    .parameter "context"
    .parameter "task"

    .prologue
    .line 208
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    move-result-object v14

    .line 209
    .local v14, direction:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;
    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-ne v14, v3, :cond_0

    .line 211
    const v4, 0x7f020001

    .line 212
    .local v4, icon:I
    const v16, 0x7f050029

    .line 213
    .local v16, ticker:I
    const v15, 0x7f05002a

    .line 223
    .local v15, message:I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v17

    .line 224
    .local v17, total:J
    const-wide/16 v5, 0x0

    cmp-long v3, v17, v5

    if-nez v3, :cond_2

    const/4 v11, 0x0

    .line 226
    .local v11, done:I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getCreationDate()J

    move-result-wide v5

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "%"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v9, v10

    const/4 v10, 0x1

    move-object/from16 v0, p0

    move-wide/from16 v1, v17

    invoke-static {v0, v1, v2}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v9, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x64

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v12

    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;->createCancelIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;

    move-result-object v12

    move-object/from16 v13, p0

    invoke-static/range {v3 .. v13}, Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;->getProgressNotification(IIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILandroid/app/PendingIntent;Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v3

    return-object v3

    .line 214
    .end local v4           #icon:I
    .end local v11           #done:I
    .end local v15           #message:I
    .end local v16           #ticker:I
    .end local v17           #total:J
    :cond_0
    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-ne v14, v3, :cond_1

    .line 215
    const v4, 0x7f020002

    .line 216
    .restart local v4       #icon:I
    const v16, 0x7f05002b

    .line 217
    .restart local v16       #ticker:I
    const v15, 0x7f05002c

    .restart local v15       #message:I
    goto :goto_0

    .line 219
    .end local v4           #icon:I
    .end local v15           #message:I
    .end local v16           #ticker:I
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unsupport feature for getOppOngoingNotification():"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v14}, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 220
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unsupported feature: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v14}, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 224
    .restart local v4       #icon:I
    .restart local v15       #message:I
    .restart local v16       #ticker:I
    .restart local v17       #total:J
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v5

    const-wide/16 v7, 0x64

    mul-long/2addr v5, v7

    div-long v5, v5, v17

    long-to-int v11, v5

    goto/16 :goto_1
.end method

.method protected static getProgressNotification(IIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILandroid/app/PendingIntent;Landroid/content/Context;)Landroid/app/Notification;
    .locals 3
    .parameter "id"
    .parameter "iconDrawableId"
    .parameter "when"
    .parameter "tickerText"
    .parameter "progressText"
    .parameter "message"
    .parameter "total"
    .parameter "progress"
    .parameter "intent"
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    .line 153
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p10}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 154
    .local v0, b:Landroid/app/Notification$Builder;
    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 155
    invoke-virtual {v0, p2, p3}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    .line 156
    invoke-virtual {v0, p4}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 157
    invoke-virtual {v0, p5}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 158
    invoke-virtual {v0, p6}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 159
    invoke-virtual {v0, p9}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 160
    if-ge p7, v2, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {v0, p7, p8, v1}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 161
    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 162
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v1

    return-object v1

    .line 160
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected static getSimpleNotification(IIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/content/Context;)Landroid/app/Notification;
    .locals 2
    .parameter "id"
    .parameter "iconDrawableId"
    .parameter "when"
    .parameter "tickerText"
    .parameter "contentTitle"
    .parameter "contentText"
    .parameter "intent"
    .parameter "context"

    .prologue
    .line 102
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p8}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 103
    .local v0, b:Landroid/app/Notification$Builder;
    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 104
    invoke-virtual {v0, p2, p3}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    .line 105
    invoke-virtual {v0, p4}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 106
    invoke-virtual {v0, p5}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 107
    invoke-virtual {v0, p6}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 108
    invoke-virtual {v0, p7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 109
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 110
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v1

    return-object v1
.end method
