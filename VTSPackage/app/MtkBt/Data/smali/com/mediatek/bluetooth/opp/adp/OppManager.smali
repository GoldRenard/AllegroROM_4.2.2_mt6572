.class public Lcom/mediatek/bluetooth/opp/adp/OppManager;
.super Ljava/lang/Object;
.source "OppManager.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;,
        Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;
    }
.end annotation


# static fields
.field private static final MSG_OPPC_SUBMIT_TASK:I = 0x1

.field private static final MSG_SHOW_TOAST:I = 0x2

.field private static final WHITELIST_DURATION_MS:I = 0x3a98

.field private static sInstance:Lcom/mediatek/bluetooth/opp/adp/OppManager;


# instance fields
.field private mApplicationContext:Landroid/content/Context;

.field private mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mNotificationManager:Landroid/app/NotificationManager;

.field private mOppService:Lcom/mediatek/bluetooth/opp/adp/OppService;

.field private mOppcTaskCache:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mediatek/bluetooth/share/BluetoothShareTask;",
            ">;"
        }
    .end annotation
.end field

.field private mOppcTaskTransfer:Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;

.field public mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mWhitelist:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->sInstance:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 139
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskCache:Ljava/util/ArrayList;

    .line 110
    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    .line 113
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    const-string v1, "OppManagerExecuter"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2, p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;-><init>(Ljava/lang/String;ILandroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWhitelist:Ljava/util/List;

    .line 140
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Landroid/content/ContentResolver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/bluetooth/opp/adp/OppManager;)Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;
    .locals 1
    .parameter "x0"

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    return-object v0
.end method

.method private cancelOngoingNotification(Lcom/mediatek/bluetooth/share/BluetoothShareTask;I)V
    .locals 5
    .parameter "task"
    .parameter "pid"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 903
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isHandover()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 905
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.btopp.intent.action.BT_OPP_TRANSFER_DONE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 906
    .local v0, handoverIntent:Landroid/content/Intent;
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    move-result-object v1

    sget-object v2, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-ne v1, v2, :cond_0

    .line 907
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 913
    :goto_0
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_ID"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 914
    const-string v1, "android.btopp.intent.extra.BT_OPP_ADDRESS"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 916
    const/16 v1, 0x8

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 917
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_STATUS"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 919
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_URI"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 920
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_MIMETYPE"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getMimeType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 929
    :goto_1
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const-string v2, "com.android.permission.HANDOVER_STATUS"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 933
    .end local v0           #handoverIntent:Landroid/content/Intent;
    :goto_2
    return-void

    .line 910
    .restart local v0       #handoverIntent:Landroid/content/Intent;
    :cond_0
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_0

    .line 922
    :cond_1
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_STATUS"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 924
    const-string v1, "android.btopp.intent.extra.BT_OPP_TRANSFER_MIMETYPE"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getMimeType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 925
    const-string v1, "com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_OBJECT_NAME"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 926
    const-string v1, "com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_FILE_SIZE"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 927
    const-string v1, "com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_DONE_SIZE"

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    goto :goto_1

    .line 931
    .end local v0           #handoverIntent:Landroid/content/Intent;
    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v1, p2}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_2
.end method

.method private cleanupWhitelist()V
    .locals 8

    .prologue
    .line 166
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 167
    .local v0, curTime:J
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWhitelist:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 168
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 169
    .local v2, entry:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;"
    iget-object v4, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long v4, v0, v4

    const-wide/16 v6, 0x3a98

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 170
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 173
    .end local v2           #entry:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_1
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/mediatek/bluetooth/opp/adp/OppManager;
    .locals 2
    .parameter "context"

    .prologue
    .line 128
    const-class v1, Lcom/mediatek/bluetooth/opp/adp/OppManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->sInstance:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    if-nez v0, :cond_0

    .line 130
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-direct {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;-><init>()V

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->sInstance:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    .line 131
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->sInstance:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->init(Landroid/content/Context;)V

    .line 133
    :cond_0
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->sInstance:Lcom/mediatek/bluetooth/opp/adp/OppManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 149
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 150
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    .line 152
    const-string v0, "Bluetooth is not supported in this hardware platform (null BluetoothAdapter)."

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 162
    :goto_0
    return-void

    .line 156
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    .line 157
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    .line 158
    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    .line 159
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mPowerManager:Landroid/os/PowerManager;

    .line 160
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mPowerManager:Landroid/os/PowerManager;

    const/4 v1, 0x1

    const-string v2, "Bluetooth"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 161
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->start()V

    goto :goto_0
.end method


# virtual methods
.method public acquireWakeLock()V
    .locals 1

    .prologue
    .line 759
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 760
    return-void
.end method

.method public declared-synchronized addToWhitelist(Ljava/lang/String;)V
    .locals 6
    .parameter "address"

    .prologue
    .line 176
    monitor-enter p0

    if-nez p1, :cond_0

    .line 187
    :goto_0
    monitor-exit p0

    return-void

    .line 180
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWhitelist:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 181
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 182
    .local v0, entry:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;"
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 183
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 176
    .end local v0           #entry:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;"
    .end local v1           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 186
    .restart local v1       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWhitelist:Ljava/util/List;

    new-instance v3, Landroid/util/Pair;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected cancelAllNotification()V
    .locals 1

    .prologue
    .line 953
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 954
    return-void
.end method

.method protected cancelNotification(I)V
    .locals 2
    .parameter "id"

    .prologue
    .line 943
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v1, 0xc

    invoke-static {v1, p1}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 944
    return-void
.end method

.method public getDeviceName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "address"

    .prologue
    .line 754
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOppTaskList(Landroid/database/Cursor;)Ljava/util/List;
    .locals 4
    .parameter "cursor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 778
    if-nez p1, :cond_1

    .line 779
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 788
    :cond_0
    return-object v1

    .line 782
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 783
    .local v1, result:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_0

    .line 785
    const-string v2, "_id"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 786
    .local v0, id:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 783
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 8
    .parameter "msg"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 964
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 979
    :goto_0
    return v6

    .line 966
    :pswitch_0
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, [Ljava/lang/Object;

    move-object v1, v2

    check-cast v1, [Ljava/lang/Object;

    .line 967
    .local v1, param:[Ljava/lang/Object;
    new-instance v2, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;

    const-string v3, "BtOppcTaskTransferThread"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aget-object v5, v1, v6

    aput-object v5, v4, v6

    aget-object v5, v1, v7

    aput-object v5, v4, v7

    invoke-direct {v2, p0, v3, v4}, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;-><init>(Lcom/mediatek/bluetooth/opp/adp/OppManager;Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskTransfer:Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;

    .line 970
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskTransfer:Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/opp/adp/OppManager$OppcTaskTransferThread;->start()V

    goto :goto_0

    .line 973
    .end local v1           #param:[Ljava/lang/Object;
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 974
    .local v0, message:Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-static {v2, v0, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 964
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public declared-synchronized isWhitelisted(Ljava/lang/String;)Z
    .locals 3
    .parameter "address"

    .prologue
    .line 190
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->cleanupWhitelist()V

    .line 191
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWhitelist:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 192
    .local v0, entry:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;"
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 193
    const/4 v2, 0x1

    .line 196
    .end local v0           #entry:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Long;>;"
    :goto_0
    monitor-exit p0

    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 190
    .end local v1           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected notifyOppTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
    .locals 18
    .parameter "task"

    .prologue
    .line 798
    const/16 v2, 0xc

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v3

    invoke-static {v2, v3}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v10

    .line 801
    .local v10, pid:I
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    move-result-object v2

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-eq v2, v3, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isHandover()Z

    move-result v2

    if-nez v2, :cond_0

    .line 804
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "create MediaScanner for newly received file:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getMimeType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 805
    new-instance v2, Lcom/mediatek/bluetooth/util/MediaScanner;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getMimeType()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/mediatek/bluetooth/util/MediaScanner;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;I)V

    .line 808
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 895
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cancel notification for unhandled state["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] - id:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 896
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v2, v10}, Landroid/app/NotificationManager;->cancel(I)V

    .line 899
    :goto_0
    return-void

    .line 810
    :pswitch_0
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isHandover()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 811
    const/4 v11, 0x0

    .line 812
    .local v11, progress:F
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v14

    .line 814
    .local v14, totalBytes:J
    const-wide/16 v2, -0x1

    cmp-long v2, v14, v2

    if-nez v2, :cond_1

    .line 815
    const/high16 v11, -0x4080

    .line 821
    :goto_1
    new-instance v8, Landroid/content/Intent;

    const-string v2, "android.btopp.intent.action.BT_OPP_TRANSFER_PROGRESS"

    invoke-direct {v8, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 822
    .local v8, intent:Landroid/content/Intent;
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    move-result-object v2

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-ne v2, v3, :cond_2

    .line 823
    const-string v2, "android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION"

    const/4 v3, 0x0

    invoke-virtual {v8, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 829
    :goto_2
    const-string v2, "android.btopp.intent.extra.BT_OPP_TRANSFER_ID"

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v3

    invoke-virtual {v8, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 830
    const-string v2, "android.btopp.intent.extra.BT_OPP_TRANSFER_PROGRESS"

    invoke-virtual {v8, v2, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 831
    const-string v2, "android.btopp.intent.extra.BT_OPP_ADDRESS"

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 832
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const-string v3, "com.android.permission.HANDOVER_STATUS"

    invoke-virtual {v2, v8, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0

    .line 817
    .end local v8           #intent:Landroid/content/Intent;
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDoneBytes()J

    move-result-wide v2

    long-to-float v2, v2

    long-to-float v3, v14

    div-float v11, v2, v3

    goto :goto_1

    .line 826
    .restart local v8       #intent:Landroid/content/Intent;
    :cond_2
    const-string v2, "android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION"

    const/4 v3, 0x1

    invoke-virtual {v8, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_2

    .line 834
    .end local v8           #intent:Landroid/content/Intent;
    .end local v11           #progress:F
    .end local v14           #totalBytes:J
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    move-object/from16 v0, p1

    invoke-static {v2, v0}, Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;->getOppOngoingNotification(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;)Landroid/app/Notification;

    move-result-object v9

    .line 835
    .local v9, n:Landroid/app/Notification;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v2, v10, v9}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    .line 843
    .end local v9           #n:Landroid/app/Notification;
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v2

    const/4 v3, 0x7

    if-ne v2, v3, :cond_5

    .line 844
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerName()Ljava/lang/String;

    move-result-object v12

    .line 845
    .local v12, strPeerName:Ljava/lang/String;
    if-nez v12, :cond_4

    .line 847
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v13

    .line 849
    .local v13, strRefreshName:Ljava/lang/String;
    if-eqz v13, :cond_7

    .line 850
    move-object v12, v13

    .line 855
    .end local v13           #strRefreshName:Ljava/lang/String;
    :cond_4
    :goto_3
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    move-result-object v2

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->out:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-ne v2, v3, :cond_8

    .line 856
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v2, v2, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v3, v3, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x2

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const v6, 0x7f050083

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v7, v16

    const/16 v16, 0x1

    aput-object v12, v7, v16

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 866
    .end local v12           #strPeerName:Ljava/lang/String;
    :cond_5
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isHandover()Z

    move-result v2

    if-nez v2, :cond_6

    .line 867
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareNotification;->getShareManagementNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v9

    .line 868
    .restart local v9       #n:Landroid/app/Notification;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    sget v3, Lcom/mediatek/bluetooth/util/NotificationFactory;->NID_SHARE_MGMT_NOTIFICATION:I

    invoke-virtual {v2, v3, v9}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 869
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v3

    invoke-static {v2, v3}, Lcom/mediatek/activity/CancelableActivity;->sendCancelActivityIntent(Landroid/content/Context;I)V

    .line 871
    .end local v9           #n:Landroid/app/Notification;
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v10}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->cancelOngoingNotification(Lcom/mediatek/bluetooth/share/BluetoothShareTask;I)V

    goto/16 :goto_0

    .line 852
    .restart local v12       #strPeerName:Ljava/lang/String;
    .restart local v13       #strRefreshName:Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const v3, 0x7f05003a

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    goto :goto_3

    .line 859
    .end local v13           #strRefreshName:Ljava/lang/String;
    :cond_8
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getDirection()Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    move-result-object v2

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;->in:Lcom/mediatek/bluetooth/share/BluetoothShareTask$Direction;

    if-ne v2, v3, :cond_5

    .line 860
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v2, v2, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v3, v3, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x2

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const v6, 0x7f050082

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v7, v16

    const/16 v16, 0x1

    aput-object v12, v7, v16

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_4

    .line 878
    .end local v12           #strPeerName:Ljava/lang/String;
    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isHandover()Z

    move-result v2

    if-nez v2, :cond_9

    .line 879
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-virtual/range {p1 .. p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v3

    invoke-static {v2, v3}, Lcom/mediatek/activity/CancelableActivity;->sendCancelActivityIntent(Landroid/content/Context;I)V

    .line 881
    :cond_9
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v10}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->cancelOngoingNotification(Lcom/mediatek/bluetooth/share/BluetoothShareTask;I)V

    goto/16 :goto_0

    .line 886
    :pswitch_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v10}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->cancelOngoingNotification(Lcom/mediatek/bluetooth/share/BluetoothShareTask;I)V

    goto/16 :goto_0

    .line 808
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public oppAbortDeviceTasks(Ljava/lang/String;)V
    .locals 11
    .parameter "bdAddr"

    .prologue
    const/4 v5, 0x0

    const/4 v10, 0x1

    .line 618
    if-nez p1, :cond_1

    .line 637
    :cond_0
    return-void

    .line 622
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "oppAbortDeviceTasks(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 624
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v10, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v5

    const-string v3, "peer_addr = ? and state in ( ?, ? )"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v5

    const/4 v5, 0x4

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v10

    const/4 v5, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 631
    .local v6, cursor:Landroid/database/Cursor;
    invoke-virtual {p0, v6}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getOppTaskList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v9

    .line 632
    .local v9, uriList:Ljava/util/List;,"Ljava/util/List<Landroid/net/Uri;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    .line 634
    .local v8, uri:Landroid/net/Uri;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "oppAbortDeviceTasks(): aborting task "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 635
    invoke-virtual {p0, v8}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppAbortTask(Landroid/net/Uri;)V

    goto :goto_0
.end method

.method public oppAbortTask(Landroid/net/Uri;)V
    .locals 9
    .parameter "taskUri"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 667
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppService:Lcom/mediatek/bluetooth/opp/adp/OppService;

    if-nez v4, :cond_1

    .line 669
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "oppService is null => can\'t abort task:["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 726
    :cond_0
    :goto_0
    return-void

    .line 676
    :cond_1
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 677
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "state"

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 678
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "state="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x4

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, p1, v3, v5, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 680
    .local v0, count:I
    if-eq v0, v7, :cond_2

    .line 681
    const-string v4, "state"

    const/4 v5, 0x6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 682
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "state="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, p1, v3, v5, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 689
    :goto_1
    if-ne v0, v7, :cond_6

    .line 691
    const-string v4, "oppAbortTask() => STATE_ABORTING or STATE_ABORTED"

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 693
    const/4 v1, 0x1

    .line 694
    .local v1, isOngoing:Z
    invoke-virtual {p0, p1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppQueryTask(Landroid/net/Uri;)Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    move-result-object v2

    .line 695
    .local v2, task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    if-nez v2, :cond_3

    .line 699
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can\'t find task for uri["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] => can\'t abort this task"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 685
    .end local v1           #isOngoing:Z
    .end local v2           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :cond_2
    const-string v4, "oppAbortTask() => STATE_ABORTING"

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    goto :goto_1

    .line 701
    .restart local v1       #isOngoing:Z
    .restart local v2       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :cond_3
    invoke-virtual {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isOppcTask()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 703
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppService:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v4, p1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcAbort(Landroid/net/Uri;)Z

    move-result v1

    .line 711
    :cond_4
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "try to notify aborting/aborted task: isOngoing["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "], state["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getState()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 712
    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->notifyOppTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    goto/16 :goto_0

    .line 704
    :cond_5
    invoke-virtual {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isOppsTask()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 706
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppService:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v4, p1}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsAbort(Landroid/net/Uri;)Z

    move-result v1

    goto :goto_2

    .line 715
    .end local v1           #isOngoing:Z
    .end local v2           #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can\'t find proper task to cancel in db. found["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] task(s) for Uri["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 719
    invoke-virtual {p0, p1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppQueryTask(Landroid/net/Uri;)Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    move-result-object v2

    .line 720
    .restart local v2       #task:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    if-nez v2, :cond_0

    .line 722
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can\'t find task to cancel for Uri["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 723
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->cancelNotification(I)V

    goto/16 :goto_0
.end method

.method protected oppOnServiceStop()V
    .locals 2

    .prologue
    .line 610
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->cancelAllNotification()V

    .line 613
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const v1, -0x9a9c3

    invoke-static {v0, v1}, Lcom/mediatek/activity/CancelableActivity;->sendCancelActivityIntent(Landroid/content/Context;I)V

    .line 614
    return-void
.end method

.method protected oppQueryTask(Landroid/net/Uri;)Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .locals 7
    .parameter "taskUri"

    .prologue
    const/4 v2, 0x0

    .line 736
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 738
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_2

    .line 740
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "oppQueryTask cannot find task for uri: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 746
    if-eqz v6, :cond_1

    .line 747
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_1
    :goto_0
    return-object v2

    .line 743
    :cond_2
    :try_start_1
    new-instance v2, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-direct {v2, v6}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(Landroid/database/Cursor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 746
    if-eqz v6, :cond_1

    .line 747
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 746
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 747
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method public oppQueryTaskDevice(Landroid/net/Uri;)Landroid/bluetooth/BluetoothDevice;
    .locals 8
    .parameter "taskUri"

    .prologue
    const/4 v3, 0x0

    .line 641
    if-nez p1, :cond_1

    .line 659
    :cond_0
    :goto_0
    return-object v3

    .line 645
    :cond_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v4, "peer_addr"

    aput-object v4, v2, v1

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 650
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_2

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_3

    .line 652
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "oppQueryTask cannot find task for uri: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 658
    if-eqz v6, :cond_0

    .line 659
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 655
    :cond_3
    :try_start_1
    const-string v0, "peer_addr"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 656
    .local v7, peerAddr:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0, v7}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 658
    if-eqz v6, :cond_0

    .line 659
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 658
    .end local v7           #peerAddr:Ljava/lang/String;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 659
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method

.method public declared-synchronized oppcCacheTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
    .locals 2
    .parameter "task"

    .prologue
    .line 213
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskCache:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 215
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskCache:Ljava/util/ArrayList;

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskCache:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    monitor-exit p0

    return-void

    .line 213
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public oppcGetCurrentTask()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppService:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppcGetCurrentTask()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method protected oppcResetTaskState()V
    .locals 13

    .prologue
    const/16 v12, 0x9

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 263
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "type between ? and ? AND state in ( ?, ?, ?, ? )"

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v9

    const/4 v4, 0x6

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v10

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v11

    const/4 v4, 0x4

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 276
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 277
    .local v7, cv:Landroid/content/ContentValues;
    const-string v0, "state"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 278
    const-string v0, "done"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 279
    const-string v0, "result"

    const-string v1, ""

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "type between ? and ? AND state = ?"

    new-array v3, v11, [Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v9

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v10

    invoke-virtual {v0, v1, v7, v2, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 289
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const-string v3, "type between ? and ? AND state = ?"

    new-array v4, v11, [Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v10

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 298
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_2

    .line 300
    :cond_0
    const-string v0, "oppcResetTaskState() - can\'t find any OPPC pending task to restart."

    invoke-static {v0}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    if-eqz v6, :cond_1

    .line 316
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 319
    :cond_1
    :goto_0
    return-void

    .line 306
    :cond_2
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "oppc found ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] pending tasks after reset (creating notification for them)."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 309
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_4

    .line 311
    new-instance v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-direct {v0, v6}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->notifyOppTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 309
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 315
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 316
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0

    .line 315
    :cond_4
    if-eqz v6, :cond_1

    .line 316
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method public declared-synchronized oppcSubmitTask(Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .parameter "device"

    .prologue
    .line 232
    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "oppcSubmitTask for device["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 240
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskCache:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 244
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskCache:Ljava/util/ArrayList;

    aput-object v2, v0, v1

    .line 247
    .local v0, param:[Ljava/lang/Object;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppcTaskCache:Ljava/util/ArrayList;

    .line 250
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v1, v1, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v2, v2, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    .end local v0           #param:[Ljava/lang/Object;
    :cond_0
    monitor-exit p0

    return-void

    .line 232
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected oppsCancelPushActivity()V
    .locals 5

    .prologue
    .line 476
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    if-nez v2, :cond_0

    .line 502
    :goto_0
    return-void

    .line 480
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 483
    const/16 v2, 0xc

    :try_start_1
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v4

    invoke-static {v2, v4}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v1

    .line 485
    .local v1, notificationId:I
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v2, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 488
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v4

    invoke-static {v2, v4}, Lcom/mediatek/activity/CancelableActivity;->sendCancelActivityIntent(Landroid/content/Context;I)V

    .line 493
    const-string v2, "oppsCancelPushActivity: STATE_REJECTED -> STATE_FAILURE"

    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 494
    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsSubmitTask(I)V

    .line 496
    monitor-exit v3

    goto :goto_0

    .end local v1           #notificationId:I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 498
    :catch_0
    move-exception v0

    .line 500
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "oppsCancelPushActivity catch exception, this.oppstask:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public oppsCheckCurrentTask()Ljava/lang/String;
    .locals 6

    .prologue
    .line 336
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    .line 339
    :cond_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    if-nez v2, :cond_1

    .line 341
    const-string v2, "current opps task is null => can\'t check it"

    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 346
    :goto_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const v3, 0x7f05003d

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 359
    :goto_1
    return-object v2

    .line 343
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid opps new task parameters: peerAddr["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "], objectName["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "], totalByte["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 350
    :cond_2
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/mediatek/bluetooth/util/SystemUtils;->getReceivedFilePathAvailableSize(Landroid/content/Context;)J

    move-result-wide v0

    .line 351
    .local v0, as:J
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-gtz v2, :cond_3

    .line 353
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "storage is not available for opps new task: available["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] v.s. required["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getTotalBytes()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 355
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const v3, 0x7f05003b

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 359
    :cond_3
    const/4 v2, 0x0

    goto/16 :goto_1
.end method

.method public oppsGetCurrentTask()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 600
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppService:Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/opp/adp/OppService;->oppsGetCurrentTask()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public oppsResetTaskState()V
    .locals 5

    .prologue
    .line 580
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 582
    .local v1, where:Ljava/lang/StringBuilder;
    const-string v2, "( "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 583
    const-string v2, "type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    const-string v2, " between ? and ?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    const-string v2, " ) and ( "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 586
    const-string v2, "state"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    const-string v2, " not in ( ?, ? ))"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 589
    const/4 v2, 0x4

    new-array v0, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x1

    const/16 v3, 0x13

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x2

    const/16 v3, 0x8

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x3

    const/4 v3, 0x7

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    .line 595
    .local v0, selectionArgs:[Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 596
    return-void
.end method

.method public oppsSendCurrentIncomingNotification()V
    .locals 5

    .prologue
    .line 458
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    monitor-enter v3

    .line 461
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    if-nez v2, :cond_0

    .line 462
    monitor-exit v3

    .line 472
    :goto_0
    return-void

    .line 466
    :cond_0
    const/16 v2, 0xc

    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v4}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v4

    invoke-static {v2, v4}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v1

    .line 468
    .local v1, notificationId:I
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-static {v2, v4}, Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;->getOppIncomingNotification(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;)Landroid/app/Notification;

    move-result-object v0

    .line 469
    .local v0, n:Landroid/app/Notification;
    const/4 v2, 0x0

    iput v2, v0, Landroid/app/Notification;->defaults:I

    .line 470
    iget-object v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v2, v1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 471
    monitor-exit v3

    goto :goto_0

    .end local v0           #n:Landroid/app/Notification;
    .end local v1           #notificationId:I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method protected oppsStartPushActivity(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 13
    .parameter "isAuthorized"
    .parameter "peerAddr"
    .parameter "objectName"
    .parameter "mimeType"
    .parameter "totalBytes"

    .prologue
    .line 375
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "oppsStartPushActivity for: authorized["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "], device["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "], object["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p3

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "], mime["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p4

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "], size["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-wide/from16 v0, p5

    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 379
    const-string v8, "text/x-vcard"

    move-object/from16 v0, p4

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 380
    const/16 v8, 0x100

    move-object/from16 v0, p3

    invoke-static {v0, v8}, Lcom/mediatek/bluetooth/util/MimeUtils;->applyVcardExt(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p3

    .line 384
    :cond_0
    invoke-virtual {p0, p2}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->getDeviceName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 387
    .local v7, peerName:Ljava/lang/String;
    if-eqz p4, :cond_1

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_1

    const-string v8, "*"

    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 389
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/mediatek/bluetooth/util/MimeUtils;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 393
    :cond_2
    new-instance v8, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    const/16 v9, 0xb

    invoke-direct {v8, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(I)V

    iput-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    .line 394
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v8, p2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setPeerAddr(Ljava/lang/String;)V

    .line 395
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v8, v7}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setPeerName(Ljava/lang/String;)V

    .line 396
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    move-object/from16 v0, p3

    invoke-virtual {v8, v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setObjectName(Ljava/lang/String;)V

    .line 397
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    move-object/from16 v0, p4

    invoke-virtual {v8, v0}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setMimeType(Ljava/lang/String;)V

    .line 398
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    move-wide/from16 v0, p5

    invoke-virtual {v8, v0, v1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setTotalBytes(J)V

    .line 400
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    iget-object v10, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v10}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getObjectName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/bluetooth/opp/mmi/Utils;->getValidStoragePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setData(Ljava/lang/String;)V

    .line 402
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v8}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->isWhitelisted(Ljava/lang/String;)Z

    move-result v3

    .line 403
    .local v3, isHandover:Z
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v8, v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setHandover(Z)V

    .line 406
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v9, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    iget-object v10, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v10}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getContentValues()Landroid/content/ContentValues;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v4

    .line 409
    .local v4, newUri:Landroid/net/Uri;
    if-nez v4, :cond_3

    .line 411
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "opps newUri: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 412
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v8, v8, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v9, v9, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    const/4 v10, 0x2

    iget-object v11, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const v12, 0x7f05003b

    invoke-virtual {v11, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 414
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    const/16 v9, 0x9

    invoke-virtual {v8, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 415
    const/4 v8, 0x1

    .line 452
    :goto_0
    return v8

    .line 418
    :cond_3
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v4}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setId(I)V

    .line 423
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "opps newTask: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPrintableString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 427
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsCheckCurrentTask()Ljava/lang/String;

    move-result-object v2

    .line 428
    .local v2, errMessage:Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 430
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v8, v8, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mBgRunner:Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;

    iget-object v9, v9, Lcom/mediatek/bluetooth/opp/adp/OppManager$LooperThread;->mHandler:Landroid/os/Handler;

    const/4 v10, 0x2

    invoke-virtual {v9, v10, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 433
    const/4 v8, 0x2

    invoke-virtual {p0, v8}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsSubmitTask(I)V

    .line 434
    const/4 v8, 0x1

    goto :goto_0

    .line 438
    :cond_4
    if-nez p1, :cond_5

    if-eqz v3, :cond_6

    .line 440
    :cond_5
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsSubmitTask(I)V

    .line 441
    const/4 v8, 0x1

    goto :goto_0

    .line 445
    :cond_6
    const/16 v8, 0xc

    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v9}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v9

    invoke-static {v8, v9}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v6

    .line 447
    .local v6, notificationId:I
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    iget-object v9, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-static {v8, v9}, Lcom/mediatek/bluetooth/opp/adp/OppNotificationFactory;->getOppIncomingNotification(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;)Landroid/app/Notification;

    move-result-object v5

    .line 451
    .local v5, notification:Landroid/app/Notification;
    iget-object v8, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v8, v6, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 452
    const/4 v8, 0x0

    goto :goto_0
.end method

.method public oppsStartService()V
    .locals 3

    .prologue
    .line 573
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    const-class v2, Lcom/mediatek/bluetooth/opp/adp/OppService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 574
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.mediatek.bluetooth.opp.action.OPPS_START"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 575
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 576
    return-void
.end method

.method public oppsSubmitTask(I)V
    .locals 9
    .parameter "taskSate"

    .prologue
    .line 514
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "oppsSubmitTask for task: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->d(Ljava/lang/String;)V

    .line 517
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    if-nez v3, :cond_0

    .line 519
    const-string v3, "current opps task is null => can\'t submit it"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    .line 565
    :goto_0
    return-void

    .line 523
    :cond_0
    iget-object v4, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    monitor-enter v4

    .line 525
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    if-nez v3, :cond_1

    .line 527
    const-string v3, "duplicated submit [Rejecting] opps task (timeout and user) => skip one"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 528
    monitor-exit v4

    goto :goto_0

    .line 564
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 534
    :cond_1
    const/4 v3, 0x2

    if-eq p1, v3, :cond_2

    const/4 v3, 0x5

    if-eq p1, v3, :cond_2

    const/4 v3, 0x7

    if-ne p1, v3, :cond_5

    .line 536
    :cond_2
    :try_start_1
    const-string v3, "oppsSubmitTask,taskState is rejecting or rejected or failure"

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 548
    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v3, p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setState(I)V

    .line 549
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    iget-object v6, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v6}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v6}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getContentValues()Landroid/content/ContentValues;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v3, v5, v6, v7, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 551
    .local v0, count:I
    const/4 v3, 0x1

    if-eq v0, v3, :cond_4

    .line 553
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "oppsSubmitTask(): update task fail: count["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "], id["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getId()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "]"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->w(Ljava/lang/String;)V

    .line 557
    :cond_4
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {p0, v3}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->notifyOppTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 560
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppsStartService()V

    .line 563
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    .line 564
    monitor-exit v4

    goto :goto_0

    .line 540
    .end local v0           #count:I
    :cond_5
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getData()Ljava/lang/String;

    move-result-object v2

    .line 541
    .local v2, filename:Ljava/lang/String;
    invoke-static {v2}, Lcom/mediatek/bluetooth/util/SystemUtils;->createNewFileForSaving(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 542
    .local v1, file:Ljava/io/File;
    if-eqz v1, :cond_3

    .line 543
    iget-object v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppsTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setData(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public releaeWakeLock()V
    .locals 1

    .prologue
    .line 764
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 766
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 768
    :cond_0
    return-void
.end method

.method protected setOppService(Lcom/mediatek/bluetooth/opp/adp/OppService;)V
    .locals 0
    .parameter "oppService"

    .prologue
    .line 773
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppManager;->mOppService:Lcom/mediatek/bluetooth/opp/adp/OppService;

    .line 774
    return-void
.end method
