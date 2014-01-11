.class public Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;
.super Landroid/app/Service;
.source "BluetoothOppService.java"


# static fields
.field public static final STATE_ABNORMAL:I = 0xe

.field public static final STATE_DISABLED:I = 0xd

.field public static final STATE_ENABLED:I = 0xb

.field public static final STATE_ENABLING:I = 0xa


# instance fields
.field private mOppClient:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;

.field private mOppServer:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 57
    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppClient:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;

    .line 59
    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppServer:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;

    return-void
.end method

.method private declared-synchronized initOppClient()V
    .locals 1

    .prologue
    .line 87
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppClient:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppClient:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    :cond_0
    monitor-exit p0

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized initOppServer()V
    .locals 1

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppServer:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppServer:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    :cond_0
    monitor-exit p0

    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static sendActivationBroadcast(Landroid/content/Context;ZI)V
    .locals 3
    .parameter "context"
    .parameter "isOppc"
    .parameter "state"

    .prologue
    .line 141
    if-eqz p1, :cond_0

    sget-object v1, Landroid/bluetooth/BluetoothProfileManager$Profile;->Bluetooth_OPP_Client:Landroid/bluetooth/BluetoothProfileManager$Profile;

    .line 143
    .local v1, profile:Landroid/bluetooth/BluetoothProfileManager$Profile;
    :goto_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 144
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "android.bluetooth.profilemanager.extra.PROFILE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 145
    const-string v2, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 146
    const-string v2, "android.permission.BLUETOOTH"

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 147
    return-void

    .line 141
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #profile:Landroid/bluetooth/BluetoothProfileManager$Profile;
    :cond_0
    sget-object v1, Landroid/bluetooth/BluetoothProfileManager$Profile;->Bluetooth_OPP_Server:Landroid/bluetooth/BluetoothProfileManager$Profile;

    goto :goto_0
.end method

.method public static sendStateChangedBroadcast(Landroid/content/Context;Lcom/mediatek/bluetooth/share/BluetoothShareTask;Z)V
    .locals 5
    .parameter "context"
    .parameter "task"
    .parameter "isConnect"

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 104
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.profilemanager.action.STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 105
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->isOppcTask()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 107
    const-string v1, "android.bluetooth.profilemanager.extra.PROFILE"

    sget-object v2, Landroid/bluetooth/BluetoothProfileManager$Profile;->Bluetooth_OPP_Client:Landroid/bluetooth/BluetoothProfileManager$Profile;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 113
    :goto_0
    if-eqz p2, :cond_1

    .line 115
    const-string v1, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 117
    const-string v1, "android.bluetooth.profilemanager.extra.EXTRA_PREVIOUS_STATE"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 126
    :goto_1
    const-string v1, "android.bluetooth.device.extra.DEVICE"

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->getPeerAddr()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 128
    const-string v1, "android.permission.BLUETOOTH"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 129
    return-void

    .line 110
    :cond_0
    const-string v1, "android.bluetooth.profilemanager.extra.PROFILE"

    sget-object v2, Landroid/bluetooth/BluetoothProfileManager$Profile;->Bluetooth_OPP_Server:Landroid/bluetooth/BluetoothProfileManager$Profile;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_0

    .line 120
    :cond_1
    const-string v1, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 122
    const-string v1, "android.bluetooth.profilemanager.extra.EXTRA_PREVIOUS_STATE"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_1
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 4
    .parameter "intent"

    .prologue
    .line 64
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, action:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BluetoothOppService.onBind()[+]: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    .line 67
    const-class v1, Landroid/bluetooth/BluetoothOpp$Client;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\$"

    const-string v3, "."

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 69
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppClient:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;

    if-nez v1, :cond_0

    .line 71
    invoke-direct {p0}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->initOppClient()V

    .line 73
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppClient:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppClientImpl;

    .line 82
    :goto_0
    return-object v1

    .line 74
    :cond_1
    const-class v1, Landroid/bluetooth/BluetoothOpp$Server;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\$"

    const-string v3, "."

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 76
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppServer:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;

    if-nez v1, :cond_2

    .line 78
    invoke-direct {p0}, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->initOppServer()V

    .line 80
    :cond_2
    iget-object v1, p0, Lcom/mediatek/bluetooth/opp/adp/BluetoothOppService;->mOppServer:Lcom/mediatek/bluetooth/opp/adp/BluetoothOppServerImpl;

    goto :goto_0

    .line 82
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method
