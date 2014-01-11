.class public Lcom/android/systemui/usb/StorageNotification;
.super Landroid/os/storage/StorageEventListener;
.source "StorageNotification.java"


# static fields
.field private static final POP_UMS_ACTIVITY_ON_CONNECT:Z = true

.field private static final TAG:Ljava/lang/String; = "StorageNotification"

.field private static notifyid:I


# instance fields
.field private mAlarmBootOff:Z

.field private mAsyncEventHandler:Landroid/os/Handler;

.field private mContext:Landroid/content/Context;

.field private final mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mIsLastVisible:Z

.field private mLastConnected:Z

.field private mLastState:Ljava/lang/String;

.field private mMediaStorageNotification:Landroid/app/Notification;

.field private mMediaStorageNotificationForExtStorage:Landroid/app/Notification;

.field private mMediaStorageNotificationForExtUsbOtg:Landroid/app/Notification;

.field private mStorageManager:Landroid/os/storage/StorageManager;

.field private mUmsAvailable:Z

.field private mUsbNotifications:Ljava/util/HashSet;

.field private mUsbStorageNotification:Landroid/app/Notification;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 80
    const/4 v0, 0x0

    sput v0, Lcom/android/systemui/usb/StorageNotification;->notifyid:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 16
    .parameter "context"

    .prologue
    const/4 v13, 0x0

    .line 101
    invoke-direct {p0}, Landroid/os/storage/StorageEventListener;-><init>()V

    .line 77
    iput-boolean v13, p0, Lcom/android/systemui/usb/StorageNotification;->mAlarmBootOff:Z

    .line 78
    iput-boolean v13, p0, Lcom/android/systemui/usb/StorageNotification;->mIsLastVisible:Z

    .line 83
    new-instance v9, Lcom/android/systemui/usb/StorageNotification$1;

    invoke-direct {v9, p0}, Lcom/android/systemui/usb/StorageNotification$1;-><init>(Lcom/android/systemui/usb/StorageNotification;)V

    iput-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 102
    iput-object p1, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    .line 104
    const-string v9, "storage"

    invoke-virtual {p1, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/os/storage/StorageManager;

    iput-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    .line 105
    iget-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v9}, Landroid/os/storage/StorageManager;->isUsbMassStorageConnected()Z

    move-result v0

    .line 108
    .local v0, connected:Z
    const-string v6, ""

    .line 109
    .local v6, st:Ljava/lang/String;
    const-string v3, ""

    .line 110
    .local v3, path:Ljava/lang/String;
    iget-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v9}, Landroid/os/storage/StorageManager;->getVolumeList()[Landroid/os/storage/StorageVolume;

    move-result-object v8

    .line 111
    .local v8, volumes:[Landroid/os/storage/StorageVolume;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2c
    array-length v9, v8

    if-ge v2, v9, :cond_4e

    .line 112
    aget-object v9, v8, v2

    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->allowMassStorage()Z

    move-result v9

    if-eqz v9, :cond_4b

    aget-object v9, v8, v2

    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->isEmulated()Z

    move-result v9

    if-nez v9, :cond_4b

    .line 113
    aget-object v9, v8, v2

    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 114
    iget-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v9, v3}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 111
    :cond_4b
    add-int/lit8 v2, v2, 0x1

    goto :goto_2c

    .line 117
    :cond_4e
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 118
    .local v1, filter:Landroid/content/IntentFilter;
    const-string v9, "android.intent.action.normal.boot.done"

    invoke-virtual {v1, v9}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 119
    const-string v9, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v1, v9}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 120
    iget-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v9, v10, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 122
    const-string v9, "StorageNotification"

    const-string v10, "Startup with UMS connection %s (media state %s)"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    iget-boolean v12, p0, Lcom/android/systemui/usb/StorageNotification;->mUmsAvailable:Z

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    aput-object v12, v11, v13

    const/4 v12, 0x1

    aput-object v6, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    new-instance v7, Landroid/os/HandlerThread;

    const-string v9, "SystemUI StorageNotification"

    invoke-direct {v7, v9}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 125
    .local v7, thr:Landroid/os/HandlerThread;
    invoke-virtual {v7}, Landroid/os/HandlerThread;->start()V

    .line 126
    new-instance v9, Landroid/os/Handler;

    invoke-virtual {v7}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mAsyncEventHandler:Landroid/os/Handler;

    .line 127
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    iput-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbNotifications:Ljava/util/HashSet;

    .line 128
    const-string v9, "mounted"

    iput-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mLastState:Ljava/lang/String;

    .line 129
    iput-boolean v13, p0, Lcom/android/systemui/usb/StorageNotification;->mLastConnected:Z

    .line 130
    invoke-virtual {p0, v0}, Lcom/android/systemui/usb/StorageNotification;->onUsbMassStorageConnectionChanged(Z)V

    .line 132
    const/4 v2, 0x0

    :goto_a3
    array-length v9, v8

    if-ge v2, v9, :cond_e2

    .line 133
    aget-object v9, v8, v2

    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 134
    .local v4, sharePath:Ljava/lang/String;
    iget-object v9, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v9, v4}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 135
    .local v5, shareState:Ljava/lang/String;
    const-string v9, "StorageNotification"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "onStorageStateChanged - sharePath: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " shareState: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const-string v9, "unmountable"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_df

    .line 137
    invoke-virtual {p0, v4, v5, v5}, Lcom/android/systemui/usb/StorageNotification;->onStorageStateChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :cond_df
    add-int/lit8 v2, v2, 0x1

    goto :goto_a3

    .line 140
    .end local v4           #sharePath:Ljava/lang/String;
    .end local v5           #shareState:Ljava/lang/String;
    :cond_e2
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/usb/StorageNotification;)Ljava/util/HashSet;
    .registers 2
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbNotifications:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/systemui/usb/StorageNotification;)Landroid/os/storage/StorageManager;
    .registers 2
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    return-object v0
.end method

.method static synthetic access$202(Lcom/android/systemui/usb/StorageNotification;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/android/systemui/usb/StorageNotification;->mAlarmBootOff:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/systemui/usb/StorageNotification;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/android/systemui/usb/StorageNotification;->onUsbMassStorageConnectionChangedAsync(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/systemui/usb/StorageNotification;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/android/systemui/usb/StorageNotification;->onStorageStateChangedAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static containsFunction(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7
    .parameter "functions"
    .parameter "function"

    .prologue
    const/16 v4, 0x2c

    const/4 v2, 0x0

    .line 206
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 208
    .local v1, index:I
    if-gez v1, :cond_a

    .line 212
    :cond_9
    :goto_9
    return v2

    .line 209
    :cond_a
    if-lez v1, :cond_14

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_9

    .line 210
    :cond_14
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int v0, v1, v3

    .line 211
    .local v0, charAfter:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_26

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v4, :cond_9

    .line 212
    :cond_26
    const/4 v2, 0x1

    goto :goto_9
.end method

.method private declared-synchronized getMediaStorageNotificationDismissable()Z
    .registers 3

    .prologue
    .line 600
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotification:Landroid/app/Notification;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotification:Landroid/app/Notification;

    iget v0, v0, Landroid/app/Notification;->flags:I
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_14

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_12

    .line 603
    const/4 v0, 0x1

    .line 605
    :goto_10
    monitor-exit p0

    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_10

    .line 600
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private onStorageStateChangedAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 36
    .parameter "path"
    .parameter "oldState"
    .parameter "newState"

    .prologue
    .line 229
    const-string v2, "StorageNotification"

    const-string v3, "Media {%s} state changed from {%s} -> {%s}"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    aput-object p2, v4, v5

    const/4 v5, 0x2

    aput-object p3, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/systemui/usb/StorageNotification;->mLastState:Ljava/lang/String;

    .line 233
    const/16 v31, 0x0

    .line 235
    .local v31, volume:Landroid/os/storage/StorageVolume;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v2}, Landroid/os/storage/StorageManager;->getVolumeList()[Landroid/os/storage/StorageVolume;

    move-result-object v26

    .line 236
    .local v26, Volumes:[Landroid/os/storage/StorageVolume;
    const/16 v27, 0x0

    .local v27, i:I
    :goto_29
    move-object/from16 v0, v26

    array-length v2, v0

    move/from16 v0, v27

    if-ge v0, v2, :cond_40

    .line 237
    aget-object v2, v26, v27

    invoke-virtual {v2}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_54

    .line 238
    aget-object v31, v26, v27

    .line 242
    :cond_40
    if-nez v31, :cond_57

    .line 243
    const-string v2, "StorageNotification"

    const-string v3, "Can NOT find volume by name {%s}"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    :goto_53
    return-void

    .line 236
    :cond_54
    add-int/lit8 v27, v27, 0x1

    goto :goto_29

    .line 248
    :cond_57
    const-string v2, "shared"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_95

    .line 253
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_SHARED]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    new-instance v28, Landroid/content/Intent;

    invoke-direct/range {v28 .. v28}, Landroid/content/Intent;-><init>()V

    .line 255
    .local v28, intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const-class v3, Lcom/android/systemui/usb/UsbStorageActivity;

    move-object/from16 v0, v28

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 256
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v28

    invoke-static {v2, v3, v0, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 257
    .local v8, pi:Landroid/app/PendingIntent;
    const v3, 0x104043e

    const v4, 0x104043f

    const v5, 0x108008a

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/systemui/usb/StorageNotification;->setUsbStorageNotification(IIIZZLandroid/app/PendingIntent;)V

    goto :goto_53

    .line 262
    .end local v8           #pi:Landroid/app/PendingIntent;
    .end local v28           #intent:Landroid/content/Intent;
    :cond_95
    const-string v2, "checking"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_de

    .line 267
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_CHECKING]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x104045c

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 270
    .local v11, title:Ljava/lang/CharSequence;
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x104045d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 272
    .local v12, message:Ljava/lang/CharSequence;
    const v13, 0x10800ab

    const/4 v14, 0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    invoke-direct/range {v9 .. v17}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V

    goto/16 :goto_53

    .line 277
    .end local v11           #title:Ljava/lang/CharSequence;
    .end local v12           #message:Ljava/lang/CharSequence;
    :cond_de
    const-string v2, "mounted"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10e

    .line 282
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_MOUNTED]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    invoke-direct/range {v13 .. v21}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;IIIZZZLandroid/app/PendingIntent;)V

    .line 284
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/usb/StorageNotification;->mUmsAvailable:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    goto/16 :goto_53

    .line 286
    :cond_10e
    const-string v2, "unmounted"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e5

    .line 292
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v2}, Landroid/os/storage/StorageManager;->isUsbMassStorageEnabled()Z

    move-result v2

    if-nez v2, :cond_1c8

    .line 294
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  !mStorageManager.isUsbMassStorageEnabled()"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    const-string v2, "shared"

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_157

    .line 300
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  MEDIA_SHARED"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    invoke-direct/range {v13 .. v21}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;IIIZZZLandroid/app/PendingIntent;)V

    goto/16 :goto_53

    .line 308
    :cond_157
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v2

    if-eqz v2, :cond_1ac

    .line 309
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040464

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 310
    .restart local v11       #title:Ljava/lang/CharSequence;
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040465

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 312
    .restart local v12       #message:Ljava/lang/CharSequence;
    const v13, 0x108007a

    const/4 v14, 0x1

    const/4 v15, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    invoke-direct/range {v9 .. v17}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V

    .line 323
    .end local v11           #title:Ljava/lang/CharSequence;
    .end local v12           #message:Ljava/lang/CharSequence;
    :goto_1a3
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  !MEDIA_SHARED"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_53

    .line 318
    :cond_1ac
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  !isExternalStorageRemovable"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    invoke-direct/range {v13 .. v21}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;IIIZZZLandroid/app/PendingIntent;)V

    goto :goto_1a3

    .line 331
    :cond_1c8
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  mStorageManager.isUsbMassStorageEnabled()"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    invoke-direct/range {v13 .. v21}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;IIIZZZLandroid/app/PendingIntent;)V

    goto/16 :goto_53

    .line 334
    :cond_1e5
    const-string v2, "nofs"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_271

    .line 339
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_NOFS]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    new-instance v28, Landroid/content/Intent;

    invoke-direct/range {v28 .. v28}, Landroid/content/Intent;-><init>()V

    .line 341
    .restart local v28       #intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const-class v3, Lcom/android/internal/app/ExternalMediaFormatActivity;

    move-object/from16 v0, v28

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 342
    const-string v2, "PATH"

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 343
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    sget v3, Lcom/android/systemui/usb/StorageNotification;->notifyid:I

    add-int/lit8 v4, v3, 0x1

    sput v4, Lcom/android/systemui/usb/StorageNotification;->notifyid:I

    const/4 v4, 0x0

    move-object/from16 v0, v28

    invoke-static {v2, v3, v0, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 345
    .restart local v8       #pi:Landroid/app/PendingIntent;
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x104045e

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 346
    .restart local v11       #title:Ljava/lang/CharSequence;
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x104045f

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 348
    .restart local v12       #message:Ljava/lang/CharSequence;
    const v13, 0x108007b

    const/4 v14, 0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v17, v8

    invoke-direct/range {v9 .. v17}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V

    .line 353
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/usb/StorageNotification;->mUmsAvailable:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    goto/16 :goto_53

    .line 354
    .end local v8           #pi:Landroid/app/PendingIntent;
    .end local v11           #title:Ljava/lang/CharSequence;
    .end local v12           #message:Ljava/lang/CharSequence;
    .end local v28           #intent:Landroid/content/Intent;
    :cond_271
    const-string v2, "unmountable"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_30e

    .line 359
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_UNMOUNTABLE]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    new-instance v28, Landroid/content/Intent;

    invoke-direct/range {v28 .. v28}, Landroid/content/Intent;-><init>()V

    .line 361
    .restart local v28       #intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const-class v3, Lcom/android/internal/app/ExternalMediaFormatActivity;

    move-object/from16 v0, v28

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 362
    const-string v2, "PATH"

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 363
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    sget v3, Lcom/android/systemui/usb/StorageNotification;->notifyid:I

    add-int/lit8 v4, v3, 0x1

    sput v4, Lcom/android/systemui/usb/StorageNotification;->notifyid:I

    const/4 v4, 0x0

    move-object/from16 v0, v28

    invoke-static {v2, v3, v0, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 365
    .restart local v8       #pi:Landroid/app/PendingIntent;
    const/16 v30, 0x0

    .line 366
    .local v30, titleId:I
    const/16 v29, 0x0

    .line 367
    .local v29, messageId:I
    const/16 v16, 0x0

    .line 368
    .local v16, isDismissable:Z
    const-string v2, "/mnt/usbotg"

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2bf

    .line 369
    const/4 v8, 0x0

    .line 370
    const/16 v16, 0x1

    .line 373
    :cond_2bf
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040460

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 374
    .restart local v11       #title:Ljava/lang/CharSequence;
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040461

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 376
    .restart local v12       #message:Ljava/lang/CharSequence;
    const v13, 0x108007b

    const/4 v14, 0x1

    const/4 v15, 0x0

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v17, v8

    invoke-direct/range {v9 .. v17}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V

    .line 381
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/usb/StorageNotification;->mUmsAvailable:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    goto/16 :goto_53

    .line 382
    .end local v8           #pi:Landroid/app/PendingIntent;
    .end local v11           #title:Ljava/lang/CharSequence;
    .end local v12           #message:Ljava/lang/CharSequence;
    .end local v16           #isDismissable:Z
    .end local v28           #intent:Landroid/content/Intent;
    .end local v29           #messageId:I
    .end local v30           #titleId:I
    :cond_30e
    const-string v2, "removed"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_373

    .line 387
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_REMOVED]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040466

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 390
    .restart local v11       #title:Ljava/lang/CharSequence;
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040467

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 392
    .restart local v12       #message:Ljava/lang/CharSequence;
    const v21, 0x108007b

    const/16 v22, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x1

    const/16 v25, 0x0

    move-object/from16 v17, p0

    move-object/from16 v18, p1

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    invoke-direct/range {v17 .. v25}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V

    .line 399
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    goto/16 :goto_53

    .line 400
    .end local v11           #title:Ljava/lang/CharSequence;
    .end local v12           #message:Ljava/lang/CharSequence;
    :cond_373
    const-string v2, "bad_removal"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d8

    .line 405
    const-string v2, "StorageNotification"

    const-string v3, "onStorageStateChangedAsync - [MEDIA_BAD_REMOVAL]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040462

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 408
    .restart local v11       #title:Ljava/lang/CharSequence;
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x1040463

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Landroid/os/storage/StorageVolume;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 410
    .restart local v12       #message:Ljava/lang/CharSequence;
    const v21, 0x108008a

    const/16 v22, 0x1

    const/16 v23, 0x1

    const/16 v24, 0x1

    const/16 v25, 0x0

    move-object/from16 v17, p0

    move-object/from16 v18, p1

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    invoke-direct/range {v17 .. v25}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V

    .line 416
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    goto/16 :goto_53

    .line 418
    .end local v11           #title:Ljava/lang/CharSequence;
    .end local v12           #message:Ljava/lang/CharSequence;
    :cond_3d8
    const-string v2, "StorageNotification"

    const-string v3, "Ignoring unknown state {%s}"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p3, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_53
.end method

.method private onUsbMassStorageConnectionChangedAsync(Z)V
    .registers 12
    .parameter "connected"

    .prologue
    const/4 v9, 0x0

    .line 156
    iput-boolean p1, p0, Lcom/android/systemui/usb/StorageNotification;->mUmsAvailable:Z

    .line 162
    const-string v3, ""

    .line 163
    .local v3, st:Ljava/lang/String;
    const-string v2, ""

    .line 164
    .local v2, path:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v5}, Landroid/os/storage/StorageManager;->getVolumeList()[Landroid/os/storage/StorageVolume;

    move-result-object v4

    .line 165
    .local v4, volumes:[Landroid/os/storage/StorageVolume;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_e
    array-length v5, v4

    if-ge v0, v5, :cond_2d

    .line 166
    aget-object v5, v4, v0

    invoke-virtual {v5}, Landroid/os/storage/StorageVolume;->allowMassStorage()Z

    move-result v5

    if-eqz v5, :cond_ca

    aget-object v5, v4, v0

    invoke-virtual {v5}, Landroid/os/storage/StorageVolume;->isEmulated()Z

    move-result v5

    if-nez v5, :cond_ca

    .line 167
    aget-object v5, v4, v0

    invoke-virtual {v5}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 168
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v5, v2}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 172
    :cond_2d
    const-string v5, "StorageNotification"

    const-string v6, "UMS connection changed to %s (media state %s), (path %s)"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v7, v9

    const/4 v8, 0x1

    aput-object v3, v7, v8

    const/4 v8, 0x2

    aput-object v2, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    if-eqz p1, :cond_62

    const-string v5, "removed"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_61

    const-string v5, "checking"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_61

    const-string v5, "bad_removal"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_62

    .line 179
    :cond_61
    const/4 p1, 0x0

    .line 182
    :cond_62
    const-string v5, "StorageNotification"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onUsbMassStorageConnectionChangedAsync - mLastState: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/systemui/usb/StorageNotification;->mLastState:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", st: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", mLastConnected: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, p0, Lcom/android/systemui/usb/StorageNotification;->mLastConnected:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", connected: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    if-nez p1, :cond_ce

    .line 184
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbNotifications:Ljava/util/HashSet;

    invoke-virtual {v5}, Ljava/util/HashSet;->clear()V

    .line 185
    invoke-virtual {p0, p1}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    .line 186
    const-string v5, "StorageNotification"

    const-string v6, "onUsbMassStorageConnectionChangedAsync - Disconnect"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    :goto_ad
    iput-boolean p1, p0, Lcom/android/systemui/usb/StorageNotification;->mLastConnected:Z

    .line 202
    const-string v5, "StorageNotification"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onUsbMassStorageConnectionChangedAsync - mLastConnected: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, p0, Lcom/android/systemui/usb/StorageNotification;->mLastConnected:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    :goto_c9
    return-void

    .line 165
    :cond_ca
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_e

    .line 188
    :cond_ce
    const-string v5, "sys.usb.config"

    const-string v6, "none"

    invoke-static {v5, v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, mCurrentFunctions:Ljava/lang/String;
    const-string v5, "mass_storage"

    invoke-static {v1, v5}, Lcom/android/systemui/usb/StorageNotification;->containsFunction(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_101

    .line 190
    const-string v5, "StorageNotification"

    const-string v6, "onUsbMassStorageConnectionChangedAsync - Connect - UMS"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mLastState:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_fd

    iget-boolean v5, p0, Lcom/android/systemui/usb/StorageNotification;->mLastConnected:Z

    if-ne v5, p1, :cond_fd

    iget-boolean v5, p0, Lcom/android/systemui/usb/StorageNotification;->mAlarmBootOff:Z

    if-nez v5, :cond_fd

    .line 192
    const-string v5, "StorageNotification"

    const-string v6, "onUsbMassStorageConnectionChangedAsync - Connect - UMS - Ignore"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c9

    .line 195
    :cond_fd
    invoke-virtual {p0, p1}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    goto :goto_ad

    .line 197
    :cond_101
    const-string v5, "StorageNotification"

    const-string v6, "onUsbMassStorageConnectionChangedAsync - Connect - MTP"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    invoke-virtual {p0, v9}, Lcom/android/systemui/usb/StorageNotification;->updateUsbMassStorageNotification(Z)V

    goto :goto_ad
.end method

.method private declared-synchronized setMediaStorageNotification(Ljava/lang/String;IIIZZZLandroid/app/PendingIntent;)V
    .registers 19
    .parameter "path"
    .parameter "titleId"
    .parameter "messageId"
    .parameter "icon"
    .parameter "visible"
    .parameter "sound"
    .parameter "dismissable"
    .parameter "pi"

    .prologue
    .line 613
    monitor-enter p0

    :try_start_1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v9

    .line 614
    .local v9, r:Landroid/content/res/Resources;
    const/4 v2, 0x0

    .line 615
    .local v2, title:Ljava/lang/CharSequence;
    const/4 v3, 0x0

    .line 616
    .local v3, message:Ljava/lang/CharSequence;
    if-eqz p5, :cond_11

    .line 617
    invoke-virtual {v9, p2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 618
    invoke-virtual {v9, p3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    :cond_11
    move-object v0, p0

    move-object v1, p1

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    .line 620
    invoke-direct/range {v0 .. v8}, Lcom/android/systemui/usb/StorageNotification;->setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_20

    .line 621
    monitor-exit p0

    return-void

    .line 613
    .end local v2           #title:Ljava/lang/CharSequence;
    .end local v3           #message:Ljava/lang/CharSequence;
    .end local v9           #r:Landroid/content/res/Resources;
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized setMediaStorageNotification(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IZZZLandroid/app/PendingIntent;)V
    .registers 18
    .parameter "path"
    .parameter "title"
    .parameter "message"
    .parameter "icon"
    .parameter "visible"
    .parameter "sound"
    .parameter "dismissable"
    .parameter "pi"

    .prologue
    .line 625
    monitor-enter p0

    :try_start_1
    const-string v5, "StorageNotification"

    const-string v6, "setMediaStorageNotification path:%s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    const/4 v2, 0x0

    .line 629
    .local v2, mediaStorageNotification:Landroid/app/Notification;
    const-string v5, "/storage/sdcard0"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_23

    const-string v5, "/storage/emulated/0"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 630
    :cond_23
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotification:Landroid/app/Notification;

    if-nez v5, :cond_34

    .line 631
    new-instance v5, Landroid/app/Notification;

    invoke-direct {v5}, Landroid/app/Notification;-><init>()V

    iput-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotification:Landroid/app/Notification;

    .line 632
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotification:Landroid/app/Notification;

    const-wide/16 v6, 0x0

    iput-wide v6, v5, Landroid/app/Notification;->when:J

    .line 634
    :cond_34
    iget-object v2, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotification:Landroid/app/Notification;

    .line 650
    :goto_36
    if-nez p5, :cond_6e

    iget v5, v2, Landroid/app/Notification;->icon:I
    :try_end_3a
    .catchall {:try_start_1 .. :try_end_3a} :catchall_c6

    if-nez v5, :cond_6e

    .line 708
    :cond_3c
    :goto_3c
    monitor-exit p0

    return-void

    .line 635
    :cond_3e
    :try_start_3e
    const-string v5, "/storage/sdcard1"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5a

    .line 636
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtStorage:Landroid/app/Notification;

    if-nez v5, :cond_57

    .line 637
    new-instance v5, Landroid/app/Notification;

    invoke-direct {v5}, Landroid/app/Notification;-><init>()V

    iput-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtStorage:Landroid/app/Notification;

    .line 638
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtStorage:Landroid/app/Notification;

    const-wide/16 v6, 0x0

    iput-wide v6, v5, Landroid/app/Notification;->when:J

    .line 640
    :cond_57
    iget-object v2, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtStorage:Landroid/app/Notification;

    goto :goto_36

    .line 642
    :cond_5a
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtUsbOtg:Landroid/app/Notification;

    if-nez v5, :cond_6b

    .line 643
    new-instance v5, Landroid/app/Notification;

    invoke-direct {v5}, Landroid/app/Notification;-><init>()V

    iput-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtUsbOtg:Landroid/app/Notification;

    .line 644
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtUsbOtg:Landroid/app/Notification;

    const-wide/16 v6, 0x0

    iput-wide v6, v5, Landroid/app/Notification;->when:J

    .line 646
    :cond_6b
    iget-object v2, p0, Lcom/android/systemui/usb/StorageNotification;->mMediaStorageNotificationForExtUsbOtg:Landroid/app/Notification;

    goto :goto_36

    .line 654
    :cond_6e
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const-string v6, "notification"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/NotificationManager;

    .line 657
    .local v4, notificationManager:Landroid/app/NotificationManager;
    if-eqz v4, :cond_3c

    .line 661
    if-eqz v2, :cond_83

    if-eqz p5, :cond_83

    .line 666
    iget v3, v2, Landroid/app/Notification;->icon:I

    .line 667
    .local v3, notificationId:I
    invoke-virtual {v4, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 670
    .end local v3           #notificationId:I
    :cond_83
    if-eqz p5, :cond_ba

    .line 671
    if-nez v2, :cond_90

    .line 672
    new-instance v2, Landroid/app/Notification;

    .end local v2           #mediaStorageNotification:Landroid/app/Notification;
    invoke-direct {v2}, Landroid/app/Notification;-><init>()V

    .line 673
    .restart local v2       #mediaStorageNotification:Landroid/app/Notification;
    const-wide/16 v5, 0x0

    iput-wide v5, v2, Landroid/app/Notification;->when:J

    .line 677
    :cond_90
    if-eqz p6, :cond_c9

    .line 678
    iget v5, v2, Landroid/app/Notification;->defaults:I

    or-int/lit8 v5, v5, 0x1

    iput v5, v2, Landroid/app/Notification;->defaults:I

    .line 684
    :goto_98
    if-eqz p7, :cond_d0

    .line 685
    const/16 v5, 0x10

    iput v5, v2, Landroid/app/Notification;->flags:I

    .line 690
    :goto_9e
    iput-object p2, v2, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 691
    if-nez p8, :cond_b1

    .line 692
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 693
    .local v1, intent:Landroid/content/Intent;
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    const/4 v7, 0x0

    sget-object v8, Landroid/os/UserHandle;->CURRENT:Landroid/os/UserHandle;

    invoke-static {v5, v6, v1, v7, v8}, Landroid/app/PendingIntent;->getBroadcastAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object p8

    .line 697
    .end local v1           #intent:Landroid/content/Intent;
    :cond_b1
    iput p4, v2, Landroid/app/Notification;->icon:I

    .line 698
    iget-object v5, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, p8

    invoke-virtual {v2, v5, p2, p3, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 701
    :cond_ba
    iget v3, v2, Landroid/app/Notification;->icon:I

    .line 702
    .restart local v3       #notificationId:I
    if-eqz p5, :cond_d4

    .line 703
    const/4 v5, 0x0

    sget-object v6, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v4, v5, v3, v2, v6}, Landroid/app/NotificationManager;->notifyAsUser(Ljava/lang/String;ILandroid/app/Notification;Landroid/os/UserHandle;)V
    :try_end_c4
    .catchall {:try_start_3e .. :try_end_c4} :catchall_c6

    goto/16 :goto_3c

    .line 625
    .end local v2           #mediaStorageNotification:Landroid/app/Notification;
    .end local v3           #notificationId:I
    .end local v4           #notificationManager:Landroid/app/NotificationManager;
    :catchall_c6
    move-exception v5

    monitor-exit p0

    throw v5

    .line 680
    .restart local v2       #mediaStorageNotification:Landroid/app/Notification;
    .restart local v4       #notificationManager:Landroid/app/NotificationManager;
    :cond_c9
    :try_start_c9
    iget v5, v2, Landroid/app/Notification;->defaults:I

    and-int/lit8 v5, v5, -0x2

    iput v5, v2, Landroid/app/Notification;->defaults:I

    goto :goto_98

    .line 687
    :cond_d0
    const/4 v5, 0x2

    iput v5, v2, Landroid/app/Notification;->flags:I

    goto :goto_9e

    .line 706
    .restart local v3       #notificationId:I
    :cond_d4
    const/4 v5, 0x0

    sget-object v6, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v4, v5, v3, v6}, Landroid/app/NotificationManager;->cancelAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)V
    :try_end_da
    .catchall {:try_start_c9 .. :try_end_da} :catchall_c6

    goto/16 :goto_3c
.end method

.method private declared-synchronized setUsbStorageNotification(IIIZZLandroid/app/PendingIntent;)V
    .registers 22
    .parameter "titleId"
    .parameter "messageId"
    .parameter "icon"
    .parameter "sound"
    .parameter "visible"
    .parameter "pi"

    .prologue
    .line 496
    monitor-enter p0

    :try_start_1
    const-string v10, "StorageNotification"

    const-string v11, "setUsbStorageNotification - visible: {%s}"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static/range {p5 .. p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    const-string v10, "StorageNotification"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "setUsbStorageNotification - mIsLastVisible: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-boolean v12, p0, Lcom/android/systemui/usb/StorageNotification;->mIsLastVisible:Z

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    if-nez p5, :cond_38

    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;
    :try_end_34
    .catchall {:try_start_1 .. :try_end_34} :catchall_b9

    if-nez v10, :cond_38

    .line 597
    :cond_36
    :goto_36
    monitor-exit p0

    return-void

    .line 502
    :cond_38
    :try_start_38
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const-string v11, "notification"

    invoke-virtual {v10, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/NotificationManager;

    .line 505
    .local v7, notificationManager:Landroid/app/NotificationManager;
    if-eqz v7, :cond_36

    .line 509
    if-eqz p5, :cond_15c

    .line 510
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v8

    .line 511
    .local v8, r:Landroid/content/res/Resources;
    move/from16 v0, p1

    invoke-virtual {v8, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    .line 512
    .local v9, title:Ljava/lang/CharSequence;
    move/from16 v0, p2

    invoke-virtual {v8, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    .line 514
    .local v5, message:Ljava/lang/CharSequence;
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    if-nez v10, :cond_72

    .line 515
    new-instance v10, Landroid/app/Notification;

    invoke-direct {v10}, Landroid/app/Notification;-><init>()V

    iput-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    .line 516
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    move/from16 v0, p3

    iput v0, v10, Landroid/app/Notification;->icon:I

    .line 517
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    const-wide/16 v11, 0x0

    iput-wide v11, v10, Landroid/app/Notification;->when:J

    .line 518
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    .line 521
    :cond_72
    if-eqz p4, :cond_bc

    .line 522
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    iget v11, v10, Landroid/app/Notification;->defaults:I

    or-int/lit8 v11, v11, 0x1

    iput v11, v10, Landroid/app/Notification;->defaults:I

    .line 527
    :goto_7c
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    const/4 v11, 0x2

    iput v11, v10, Landroid/app/Notification;->flags:I

    .line 529
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    iput-object v9, v10, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 531
    const-string v10, "sys.boot.reason"

    invoke-static {v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 532
    .local v3, bootReason:Ljava/lang/String;
    if-eqz v3, :cond_c5

    const-string v10, "1"

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c5

    const/4 v2, 0x1

    .line 534
    .local v2, alarmBoot:Z
    :goto_96
    const-string v10, "StorageNotification"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "setUsbStorageNotification - alarmBoot: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    if-eqz v2, :cond_c7

    .line 537
    const-string v10, "StorageNotification"

    const-string v11, "setUsbStorageNotification - [Show Notification After AlarmBoot]"

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b7
    .catchall {:try_start_38 .. :try_end_b7} :catchall_b9

    goto/16 :goto_36

    .line 496
    .end local v2           #alarmBoot:Z
    .end local v3           #bootReason:Ljava/lang/String;
    .end local v5           #message:Ljava/lang/CharSequence;
    .end local v7           #notificationManager:Landroid/app/NotificationManager;
    .end local v8           #r:Landroid/content/res/Resources;
    .end local v9           #title:Ljava/lang/CharSequence;
    :catchall_b9
    move-exception v10

    monitor-exit p0

    throw v10

    .line 524
    .restart local v5       #message:Ljava/lang/CharSequence;
    .restart local v7       #notificationManager:Landroid/app/NotificationManager;
    .restart local v8       #r:Landroid/content/res/Resources;
    .restart local v9       #title:Ljava/lang/CharSequence;
    :cond_bc
    :try_start_bc
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    iget v11, v10, Landroid/app/Notification;->defaults:I

    and-int/lit8 v11, v11, -0x2

    iput v11, v10, Landroid/app/Notification;->defaults:I

    goto :goto_7c

    .line 532
    .restart local v3       #bootReason:Ljava/lang/String;
    :cond_c5
    const/4 v2, 0x0

    goto :goto_96

    .line 541
    .restart local v2       #alarmBoot:Z
    :cond_c7
    const-string v10, "StorageNotification"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "setUsbStorageNotification - count of mUsbNotifications: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbNotifications:Ljava/util/HashSet;

    invoke-virtual {v12}, Ljava/util/HashSet;->size()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbNotifications:Ljava/util/HashSet;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_16f

    .line 543
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbNotifications:Ljava/util/HashSet;

    invoke-virtual {v10}, Ljava/util/HashSet;->clear()V

    .line 544
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbNotifications:Ljava/util/HashSet;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 545
    const-string v10, "StorageNotification"

    const-string v11, "setUsbStorageNotification - [Add] title: {%s} to HashSet"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    :cond_114
    if-nez p6, :cond_125

    .line 555
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 556
    .local v4, intent:Landroid/content/Intent;
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const/4 v11, 0x0

    const/4 v12, 0x0

    sget-object v13, Landroid/os/UserHandle;->CURRENT:Landroid/os/UserHandle;

    invoke-static {v10, v11, v4, v12, v13}, Landroid/app/PendingIntent;->getBroadcastAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object p6

    .line 560
    .end local v4           #intent:Landroid/content/Intent;
    :cond_125
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    iget-object v11, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    move-object/from16 v0, p6

    invoke-virtual {v10, v11, v9, v5, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 561
    const/4 v10, 0x1

    iget-object v11, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string v12, "adb_enabled"

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v11

    if-ne v10, v11, :cond_191

    const/4 v1, 0x1

    .line 566
    .local v1, adbOn:Z
    :goto_13f
    if-nez v1, :cond_19a

    .line 576
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "device_provisioned"

    const/4 v12, 0x0

    invoke-static {v10, v11, v12}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v10

    if-nez v10, :cond_193

    .line 578
    const-string v10, "StorageNotification"

    const-string v11, "Device not provisioned, skipping showing full screen UsbStorageActivity"

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    const/4 v11, 0x0

    iput-object v11, v10, Landroid/app/Notification;->fullScreenIntent:Landroid/app/PendingIntent;

    .line 588
    .end local v1           #adbOn:Z
    .end local v2           #alarmBoot:Z
    .end local v3           #bootReason:Ljava/lang/String;
    .end local v5           #message:Ljava/lang/CharSequence;
    .end local v8           #r:Landroid/content/res/Resources;
    .end local v9           #title:Ljava/lang/CharSequence;
    :cond_15c
    :goto_15c
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    iget v6, v10, Landroid/app/Notification;->icon:I

    .line 589
    .local v6, notificationId:I
    if-eqz p5, :cond_1a0

    .line 590
    const/4 v10, 0x0

    iget-object v11, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    sget-object v12, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v7, v10, v6, v11, v12}, Landroid/app/NotificationManager;->notifyAsUser(Ljava/lang/String;ILandroid/app/Notification;Landroid/os/UserHandle;)V

    .line 592
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/android/systemui/usb/StorageNotification;->mIsLastVisible:Z

    goto/16 :goto_36

    .line 547
    .end local v6           #notificationId:I
    .restart local v2       #alarmBoot:Z
    .restart local v3       #bootReason:Ljava/lang/String;
    .restart local v5       #message:Ljava/lang/CharSequence;
    .restart local v8       #r:Landroid/content/res/Resources;
    .restart local v9       #title:Ljava/lang/CharSequence;
    :cond_16f
    const-string v10, "StorageNotification"

    const-string v11, "setUsbStorageNotification - [Hashset contains] visible: {%s}"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static/range {p5 .. p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    iget-boolean v10, p0, Lcom/android/systemui/usb/StorageNotification;->mIsLastVisible:Z

    if-eqz v10, :cond_114

    .line 549
    const-string v10, "StorageNotification"

    const-string v11, "setUsbStorageNotification - same and visible, return"

    invoke-static {v10, v11}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_36

    .line 561
    :cond_191
    const/4 v1, 0x0

    goto :goto_13f

    .line 581
    .restart local v1       #adbOn:Z
    :cond_193
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    move-object/from16 v0, p6

    iput-object v0, v10, Landroid/app/Notification;->fullScreenIntent:Landroid/app/PendingIntent;

    goto :goto_15c

    .line 584
    :cond_19a
    iget-object v10, p0, Lcom/android/systemui/usb/StorageNotification;->mUsbStorageNotification:Landroid/app/Notification;

    const/4 v11, 0x0

    iput-object v11, v10, Landroid/app/Notification;->fullScreenIntent:Landroid/app/PendingIntent;

    goto :goto_15c

    .line 594
    .end local v1           #adbOn:Z
    .end local v2           #alarmBoot:Z
    .end local v3           #bootReason:Ljava/lang/String;
    .end local v5           #message:Ljava/lang/CharSequence;
    .end local v8           #r:Landroid/content/res/Resources;
    .end local v9           #title:Ljava/lang/CharSequence;
    .restart local v6       #notificationId:I
    :cond_1a0
    const/4 v10, 0x0

    sget-object v11, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    invoke-virtual {v7, v10, v6, v11}, Landroid/app/NotificationManager;->cancelAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)V

    .line 595
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/systemui/usb/StorageNotification;->mIsLastVisible:Z
    :try_end_1a9
    .catchall {:try_start_bc .. :try_end_1a9} :catchall_b9

    goto/16 :goto_36
.end method


# virtual methods
.method isAbleToShare()Z
    .registers 11

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 427
    const/4 v0, 0x0

    .line 428
    .local v0, allowedShareNum:I
    iget-object v7, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v7}, Landroid/os/storage/StorageManager;->getVolumeList()[Landroid/os/storage/StorageVolume;

    move-result-object v4

    .line 429
    .local v4, volumes:[Landroid/os/storage/StorageVolume;
    const-string v7, "StorageNotification"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "isAbleToShare - length:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    array-length v9, v4

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    if-eqz v4, :cond_ac

    .line 431
    const/4 v1, 0x0

    .local v1, i:I
    :goto_25
    array-length v7, v4

    if-ge v1, v7, :cond_ac

    .line 432
    const-string v7, "StorageNotification"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "isAbleToShare - allowMassStorage:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v4, v1

    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->allowMassStorage()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "isEmulated:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v4, v1

    invoke-virtual {v9}, Landroid/os/storage/StorageVolume;->isEmulated()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    aget-object v7, v4, v1

    invoke-virtual {v7}, Landroid/os/storage/StorageVolume;->allowMassStorage()Z

    move-result v7

    if-eqz v7, :cond_a8

    aget-object v7, v4, v1

    invoke-virtual {v7}, Landroid/os/storage/StorageVolume;->isEmulated()Z

    move-result v7

    if-nez v7, :cond_a8

    .line 434
    aget-object v7, v4, v1

    invoke-virtual {v7}, Landroid/os/storage/StorageVolume;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 435
    .local v2, path:Ljava/lang/String;
    iget-object v7, p0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v7, v2}, Landroid/os/storage/StorageManager;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 436
    .local v3, st:Ljava/lang/String;
    if-eqz v3, :cond_a8

    .line 437
    const-string v7, "StorageNotification"

    const-string v8, "isAbleToShare - %s @ %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v2, v9, v5

    aput-object v3, v9, v6

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    const-string v7, "unmountable"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a8

    const-string v7, "nofs"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a8

    const-string v7, "removed"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a8

    const-string v7, "bad_removal"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a8

    .line 441
    add-int/lit8 v0, v0, 0x1

    .line 431
    .end local v2           #path:Ljava/lang/String;
    .end local v3           #st:Ljava/lang/String;
    :cond_a8
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_25

    .line 447
    .end local v1           #i:I
    :cond_ac
    const-string v7, "StorageNotification"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "isAbleToShare - allowedShareNum:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    if-nez v0, :cond_c7

    .line 451
    :goto_c6
    return v5

    :cond_c7
    move v5, v6

    goto :goto_c6
.end method

.method public onStorageStateChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .parameter "path"
    .parameter "oldState"
    .parameter "newState"

    .prologue
    .line 220
    iget-object v0, p0, Lcom/android/systemui/usb/StorageNotification;->mAsyncEventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/systemui/usb/StorageNotification$3;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/systemui/usb/StorageNotification$3;-><init>(Lcom/android/systemui/usb/StorageNotification;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 226
    return-void
.end method

.method public onUsbMassStorageConnectionChanged(Z)V
    .registers 4
    .parameter "connected"

    .prologue
    .line 147
    iget-object v0, p0, Lcom/android/systemui/usb/StorageNotification;->mAsyncEventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/systemui/usb/StorageNotification$2;

    invoke-direct {v1, p0, p1}, Lcom/android/systemui/usb/StorageNotification$2;-><init>(Lcom/android/systemui/usb/StorageNotification;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 153
    return-void
.end method

.method updateUsbMassStorageNotification(Z)V
    .registers 20
    .parameter "available"

    .prologue
    .line 459
    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/usb/StorageNotification;->isAbleToShare()Z

    move-result v17

    .line 460
    .local v17, isStorageCanShared:Z
    const-string v2, "StorageNotification"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateUsbMassStorageNotification - isStorageCanShared="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",available="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mStorageManager:Landroid/os/storage/StorageManager;

    invoke-virtual {v2}, Landroid/os/storage/StorageManager;->isUsbMassStorageEnabled()Z

    move-result v2

    if-nez v2, :cond_9e

    .line 464
    if-eqz p1, :cond_79

    if-eqz v17, :cond_79

    .line 465
    const-string v2, "StorageNotification"

    const-string v3, "updateUsbMassStorageNotification - [true]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    new-instance v16, Landroid/content/Intent;

    invoke-direct/range {v16 .. v16}, Landroid/content/Intent;-><init>()V

    .line 467
    .local v16, intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const-class v3, Lcom/android/systemui/usb/UsbStorageActivity;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 468
    const/high16 v2, 0x1000

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 470
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/usb/StorageNotification;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v16

    invoke-static {v2, v3, v0, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 471
    .local v8, pi:Landroid/app/PendingIntent;
    const v3, 0x104043c

    const v4, 0x104043d

    const v5, 0x1080544

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/android/systemui/usb/StorageNotification;->setUsbStorageNotification(IIIZZLandroid/app/PendingIntent;)V

    .line 484
    .end local v8           #pi:Landroid/app/PendingIntent;
    .end local v16           #intent:Landroid/content/Intent;
    :goto_72
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/systemui/usb/StorageNotification;->mLastConnected:Z

    .line 488
    :goto_78
    return-void

    .line 476
    :cond_79
    if-nez p1, :cond_7d

    if-eqz v17, :cond_83

    :cond_7d
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/usb/StorageNotification;->mUmsAvailable:Z

    if-nez v2, :cond_96

    .line 479
    :cond_83
    const-string v2, "StorageNotification"

    const-string v3, "updateUsbMassStorageNotification - [false]"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v9, p0

    invoke-direct/range {v9 .. v15}, Lcom/android/systemui/usb/StorageNotification;->setUsbStorageNotification(IIIZZLandroid/app/PendingIntent;)V

    goto :goto_72

    .line 482
    :cond_96
    const-string v2, "StorageNotification"

    const-string v3, "updateUsbMassStorageNotification - Cannot as your wish!"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_72

    .line 486
    :cond_9e
    const-string v2, "StorageNotification"

    const-string v3, "updateUsbMassStorageNotification - UMS Enabled"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/SXlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_78
.end method
