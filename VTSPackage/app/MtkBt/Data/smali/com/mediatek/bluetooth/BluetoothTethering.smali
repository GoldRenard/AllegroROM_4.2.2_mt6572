.class public Lcom/mediatek/bluetooth/BluetoothTethering;
.super Landroid/net/INetworkManagementEventObserver$Stub;
.source "BluetoothTethering.java"


# static fields
.field public static final BLUETOOTH_INTERFACE_ADDED:Ljava/lang/String; = "android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_ADDED"

.field public static final BLUETOOTH_INTERFACE_NAME:Ljava/lang/String; = "android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_NAME"

.field private static final TAG:Ljava/lang/String; = "BluetoothTethering"

.field private static sBtTethering:Lcom/mediatek/bluetooth/BluetoothTethering;

.field private static sBtTetheringRegistered:Z


# instance fields
.field private mContext:Landroid/content/Context;

.field private mNetworkManagementService:Landroid/os/INetworkManagementService;

.field private mTetherableBTRegexs:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTethering:Lcom/mediatek/bluetooth/BluetoothTethering;

    .line 80
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTetheringRegistered:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 86
    invoke-direct {p0}, Landroid/net/INetworkManagementEventObserver$Stub;-><init>()V

    .line 87
    const-string v0, "BluetoothTethering"

    const-string v1, "Tethering starting"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    return-void
.end method

.method public static getBluetoothTetheringInstance()Lcom/mediatek/bluetooth/BluetoothTethering;
    .locals 1

    .prologue
    .line 91
    sget-object v0, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTethering:Lcom/mediatek/bluetooth/BluetoothTethering;

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Lcom/mediatek/bluetooth/BluetoothTethering;

    invoke-direct {v0}, Lcom/mediatek/bluetooth/BluetoothTethering;-><init>()V

    sput-object v0, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTethering:Lcom/mediatek/bluetooth/BluetoothTethering;

    .line 93
    sget-object v0, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTethering:Lcom/mediatek/bluetooth/BluetoothTethering;

    .line 95
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTethering:Lcom/mediatek/bluetooth/BluetoothTethering;

    goto :goto_0
.end method

.method private isBT(Ljava/lang/String;)Z
    .locals 5
    .parameter "iface"

    .prologue
    .line 138
    iget-object v0, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mTetherableBTRegexs:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 139
    .local v3, regex:Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 140
    const/4 v4, 0x1

    .line 143
    .end local v3           #regex:Ljava/lang/String;
    :goto_1
    return v4

    .line 138
    .restart local v3       #regex:Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 143
    .end local v3           #regex:Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method


# virtual methods
.method public interfaceAdded(Ljava/lang/String;)V
    .locals 4
    .parameter "iface"

    .prologue
    .line 171
    const-string v1, "BluetoothTethering"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "interfaceAdded, iface: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/BluetoothTethering;->isBT(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 182
    :goto_0
    return-void

    .line 177
    :cond_0
    const-string v1, "BluetoothTethering"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "interfaceAdded :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_ADDED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 179
    .local v0, in:Landroid/content/Intent;
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 180
    const-string v1, "android.bluetooth.BluetoothTethering.BLUETOOTH_INTERFACE_NAME"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    iget-object v1, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public interfaceClassDataActivityChanged(Ljava/lang/String;Z)V
    .locals 0
    .parameter "label"
    .parameter "active"

    .prologue
    .line 210
    return-void
.end method

.method public interfaceLinkStateChanged(Ljava/lang/String;Z)V
    .locals 0
    .parameter "iface"
    .parameter "up"

    .prologue
    .line 163
    return-void
.end method

.method public interfaceRemoved(Ljava/lang/String;)V
    .locals 0
    .parameter "iface"

    .prologue
    .line 190
    return-void
.end method

.method public interfaceStatusChanged(Ljava/lang/String;Z)V
    .locals 0
    .parameter "iface"
    .parameter "up"

    .prologue
    .line 153
    return-void
.end method

.method public interfaceStatusChangedIpv6(Ljava/lang/String;Z)V
    .locals 0
    .parameter "iface"
    .parameter "up"

    .prologue
    .line 205
    return-void
.end method

.method public limitReached(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "limitName"
    .parameter "iface"

    .prologue
    .line 200
    return-void
.end method

.method public registerBTTether(Landroid/content/Context;)V
    .locals 7
    .parameter "context"

    .prologue
    .line 100
    sget-boolean v3, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTetheringRegistered:Z

    if-nez v3, :cond_0

    .line 101
    const-string v3, "BluetoothTethering"

    const-string v4, "BluetoothTethering setContext"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iput-object p1, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mContext:Landroid/content/Context;

    .line 104
    const-string v3, "network_management"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 105
    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/os/INetworkManagementService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/INetworkManagementService;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    .line 106
    iget-object v3, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    if-nez v3, :cond_1

    .line 107
    const-string v3, "BluetoothTethering"

    const-string v4, "Error get INetworkManagementService"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .end local v0           #b:Landroid/os/IBinder;
    :cond_0
    :goto_0
    return-void

    .line 111
    .restart local v0       #b:Landroid/os/IBinder;
    :cond_1
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    invoke-interface {v3, p0}, Landroid/os/INetworkManagementService;->registerObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :goto_1
    iget-object v3, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mContext:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 118
    .local v1, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getTetherableBluetoothRegexs()[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mTetherableBTRegexs:[Ljava/lang/String;

    .line 119
    const-string v3, "BluetoothTethering"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "registerBTTether bt regexs: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mTetherableBTRegexs:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    const/4 v3, 0x1

    sput-boolean v3, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTetheringRegistered:Z

    goto :goto_0

    .line 112
    .end local v1           #cm:Landroid/net/ConnectivityManager;
    :catch_0
    move-exception v2

    .line 113
    .local v2, e:Landroid/os/RemoteException;
    const-string v3, "BluetoothTethering"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error registering observer :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public unregisterBTTether()V
    .locals 4

    .prologue
    .line 126
    sget-boolean v1, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTetheringRegistered:Z

    if-eqz v1, :cond_0

    .line 127
    const-string v1, "BluetoothTethering"

    const-string v2, "unregister Bluetooth Tether"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/BluetoothTethering;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    invoke-interface {v1, p0}, Landroid/os/INetworkManagementService;->unregisterObserver(Landroid/net/INetworkManagementEventObserver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :goto_0
    const/4 v1, 0x0

    sput-boolean v1, Lcom/mediatek/bluetooth/BluetoothTethering;->sBtTetheringRegistered:Z

    .line 135
    :cond_0
    return-void

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BluetoothTethering"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error registering observer :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
