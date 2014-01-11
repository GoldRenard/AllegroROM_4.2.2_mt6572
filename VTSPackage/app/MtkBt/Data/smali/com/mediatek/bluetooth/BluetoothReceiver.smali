.class public Lcom/mediatek/bluetooth/BluetoothReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothReceiver.java"


# static fields
.field public static final ACTION_SHOW_TOAST:Ljava/lang/String; = "com.mediatek.bluetooth.receiver.action.SHOW_TOAST"

.field private static final AVRCP_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.avrcp.BluetoothAvrcpService"

.field private static final BIP_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.bip.BipService"

.field private static final DUN_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.dun.BluetoothDunService"

.field public static final EXTRA_TEXT:Ljava/lang/String; = "com.mediatek.bluetooth.receiver.extra.TEXT"

.field private static final FTP_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.ftp.BluetoothFtpService"

.field private static final HID_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.hid.BluetoothHidService"

.field private static final MAP_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.map.BluetoothMapServerService"

.field private static final OPP_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.opp.adp.OppService"

.field private static final PAN_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.pan.BluetoothPanService"

.field private static final PBAP_SERVICE_CLASS:Ljava/lang/String; = "com.mediatek.bluetooth.pbap.BluetoothPbapService"

.field public static sUnmountingStorageSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 54
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    sput-object v0, Lcom/mediatek/bluetooth/BluetoothReceiver;->sUnmountingStorageSet:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static isPathMounted(Ljava/lang/String;)Z
    .locals 3
    .parameter "path"

    .prologue
    .line 83
    sget-object v2, Lcom/mediatek/bluetooth/BluetoothReceiver;->sUnmountingStorageSet:Ljava/util/HashSet;

    monitor-enter v2

    .line 84
    :try_start_0
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothReceiver;->sUnmountingStorageSet:Ljava/util/HashSet;

    invoke-virtual {v1, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 85
    .local v0, ret:Z
    :goto_0
    monitor-exit v2

    .line 86
    return v0

    .line 84
    .end local v0           #ret:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 85
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private startProfileServices(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 148
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 150
    .local v0, btAdapter:Landroid/bluetooth/BluetoothAdapter;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 151
    const-string v1, "com.mediatek.bluetooth.ftp.BluetoothFtpService"

    invoke-direct {p0, p1, v1}, Lcom/mediatek/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 153
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 154
    const-string v1, "com.mediatek.bluetooth.pbap.BluetoothPbapService"

    invoke-direct {p0, p1, v1}, Lcom/mediatek/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 159
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 160
    const-string v1, "com.mediatek.bluetooth.hid.BluetoothHidService"

    invoke-direct {p0, p1, v1}, Lcom/mediatek/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 177
    :cond_2
    return-void
.end method

.method private startService(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "serviceClass"

    .prologue
    .line 200
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, ex:Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start service for class["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] fail:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private startService(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "serviceClass"
    .parameter "extraName"
    .parameter "extraValue"

    .prologue
    .line 218
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    :goto_0
    return-void

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .local v0, ex:Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start service for class["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] fail:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private stopProfileServices(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 181
    const-string v0, "com.mediatek.bluetooth.pbap.BluetoothPbapService"

    invoke-direct {p0, p1, v0}, Lcom/mediatek/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 184
    const-string v0, "com.mediatek.bluetooth.opp.adp.OppService"

    invoke-direct {p0, p1, v0}, Lcom/mediatek/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 186
    const-string v0, "com.mediatek.bluetooth.bip.BipService"

    const-string v1, "action"

    const-string v2, "com.mediatek.bluetooth.bipiservice.action.BIP_DISABLE"

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/mediatek/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string v0, "com.mediatek.bluetooth.hid.BluetoothHidService"

    invoke-direct {p0, p1, v0}, Lcom/mediatek/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 188
    const-string v0, "com.mediatek.bluetooth.dun.BluetoothDunService"

    invoke-direct {p0, p1, v0}, Lcom/mediatek/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 193
    const-string v0, "com.mediatek.bluetooth.pan.BluetoothPanService"

    invoke-direct {p0, p1, v0}, Lcom/mediatek/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method private stopService(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "serviceClass"

    .prologue
    .line 209
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    :goto_0
    return-void

    .line 210
    :catch_0
    move-exception v0

    .line 211
    .local v0, ex:Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stop service for class["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] fail:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/mediatek/bluetooth/util/BtLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 94
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, action:Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "BluetoothReceiver receive action:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 97
    const-string v4, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 99
    const-string v4, "android.bluetooth.adapter.extra.STATE"

    const/high16 v5, -0x8000

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 100
    .local v1, btState:I
    const/16 v4, 0xc

    if-ne v1, v4, :cond_1

    .line 102
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/BluetoothReceiver;->startProfileServices(Landroid/content/Context;)V

    .line 144
    .end local v1           #btState:I
    :cond_0
    :goto_0
    return-void

    .line 103
    .restart local v1       #btState:I
    :cond_1
    const/16 v4, 0xd

    if-ne v1, v4, :cond_0

    .line 105
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/BluetoothReceiver;->stopProfileServices(Landroid/content/Context;)V

    goto :goto_0

    .line 107
    .end local v1           #btState:I
    :cond_2
    const-string v4, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 110
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/BluetoothReceiver;->startProfileServices(Landroid/content/Context;)V

    goto :goto_0

    .line 111
    :cond_3
    const-string v4, "android.bluetooth.profilemanager.action.DISABLE_PROFILES"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 113
    const-string v4, "BluetoothProfileManaher disable profile"

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 115
    :cond_4
    const-string v4, "com.mediatek.bluetooth.receiver.action.SHOW_TOAST"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 117
    const-string v4, "com.mediatek.bluetooth.receiver.extra.TEXT"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 118
    .local v3, text:Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 119
    const/4 v4, 0x0

    invoke-static {p1, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 121
    .end local v3           #text:Ljava/lang/String;
    :cond_5
    const-string v4, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 123
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 124
    .local v2, path:Landroid/net/Uri;
    if-eqz v2, :cond_0

    .line 126
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "BluetoothReceiver: add un-mounting path["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 128
    sget-object v5, Lcom/mediatek/bluetooth/BluetoothReceiver;->sUnmountingStorageSet:Ljava/util/HashSet;

    monitor-enter v5

    .line 129
    :try_start_0
    sget-object v4, Lcom/mediatek/bluetooth/BluetoothReceiver;->sUnmountingStorageSet:Ljava/util/HashSet;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 130
    monitor-exit v5

    goto :goto_0

    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 132
    .end local v2           #path:Landroid/net/Uri;
    :cond_6
    const-string v4, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 134
    :cond_7
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 135
    .restart local v2       #path:Landroid/net/Uri;
    if-eqz v2, :cond_0

    .line 137
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "BluetoothReceiver: del un-mounting path["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/bluetooth/util/BtLog;->d(Ljava/lang/String;)V

    .line 139
    sget-object v5, Lcom/mediatek/bluetooth/BluetoothReceiver;->sUnmountingStorageSet:Ljava/util/HashSet;

    monitor-enter v5

    .line 140
    :try_start_1
    sget-object v4, Lcom/mediatek/bluetooth/BluetoothReceiver;->sUnmountingStorageSet:Ljava/util/HashSet;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 141
    monitor-exit v5

    goto/16 :goto_0

    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v4
.end method
