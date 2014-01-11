.class public Lcom/mediatek/bluetooth/pan/BluetoothPanService;
.super Landroid/app/Service;
.source "BluetoothPanService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;,
        Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;
    }
.end annotation


# static fields
.field private static final BLUETOOTH_IFACE_ADDR_START:Ljava/lang/String; = "192.168.44.1"

.field private static final BLUETOOTH_PERM:Ljava/lang/String; = "android.permission.BLUETOOTH"

.field private static final BLUETOOTH_PREFIX_LENGTH:I = 0x18

.field private static final DEBUG:Z = true

.field private static final DHCP_DEFAULT_RANGE:[Ljava/lang/String; = null

.field private static final DNS_DEFAULT_SERVER:[Ljava/lang/String; = null

.field private static final MESSAGE_DISPLAY:Ljava/lang/String; = "show toast"

.field private static final MESSAGE_DISPLAY_ID:I = 0x0

#the value of this static final field might be set in the static constructor
.field private static final PAN_ID_START:I = 0x0

.field private static final TAG:Ljava/lang/String; = "[BT][PAN][BluetoothPANService]"

.field private static sPanAuthorizeNotify:I

.field private static sServerState:Z

.field public static sUtState:Z


# instance fields
.field private mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBluetoothService:Landroid/bluetooth/IBluetooth;

.field private mContext:Landroid/content/Context;

.field private mDhcpRange:[Ljava/lang/String;

.field private mDnsServers:[Ljava/lang/String;

.field private mHasInitiated:Z

.field private mNM:Landroid/app/NotificationManager;

.field private mNativeData:I

.field private mNetworkManagementService:Landroid/os/INetworkManagementService;

.field private mNoti:Landroid/app/Notification;

.field mNotifyId:I

.field mNotifyMap:Ljava/util/Map;

.field private final mPan:Landroid/bluetooth/IBluetoothPan$Stub;

.field private final mPanAction:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction$Stub;

.field private mPanDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/bluetooth/BluetoothDevice;",
            "Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mServiceHandler:Landroid/os/Handler;

.field private mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

.field private mTetheringOn:Z

.field private mTetheringReceiver:Landroid/content/BroadcastReceiver;

.field private mUpdateGNStateIntent:Landroid/content/Intent;

.field private mUpdateNAPStateIntent:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 114
    const/16 v0, 0x10

    invoke-static {v0}, Lcom/mediatek/bluetooth/BluetoothProfile;->getProfileStart(I)I

    move-result v0

    sput v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->PAN_ID_START:I

    .line 117
    sget v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->PAN_ID_START:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    .line 123
    sput-boolean v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sServerState:Z

    .line 163
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "192.168.44.2"

    aput-object v1, v0, v3

    const-string v1, "192.168.44.254"

    aput-object v1, v0, v4

    const-string v1, "192.168.45.2"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "192.168.45.254"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->DHCP_DEFAULT_RANGE:[Ljava/lang/String;

    .line 169
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "8.8.8.8"

    aput-object v1, v0, v3

    const-string v1, "8.8.4.4"

    aput-object v1, v0, v4

    sput-object v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->DNS_DEFAULT_SERVER:[Ljava/lang/String;

    .line 173
    sput-boolean v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sUtState:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 78
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 119
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mUpdateGNStateIntent:Landroid/content/Intent;

    .line 121
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mUpdateNAPStateIntent:Landroid/content/Intent;

    .line 125
    iput-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    .line 131
    iput-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    .line 133
    iput-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNoti:Landroid/app/Notification;

    .line 135
    iput v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 139
    iput-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringReceiver:Landroid/content/BroadcastReceiver;

    .line 151
    iput-boolean v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z

    .line 247
    new-instance v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 384
    new-instance v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$2;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$2;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanAction:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction$Stub;

    .line 506
    new-instance v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$3;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPan:Landroid/bluetooth/IBluetoothPan$Stub;

    .line 1143
    new-instance v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$4;

    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$4;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mServiceHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mediatek/bluetooth/pan/BluetoothPanService;ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->genPanNotification(ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/bluetooth/BluetoothAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/content/BroadcastReceiver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Landroid/content/BroadcastReceiver;)Landroid/content/BroadcastReceiver;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringReceiver:Landroid/content/BroadcastReceiver;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringOn:Z

    return v0
.end method

.method static synthetic access$1202(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringOn:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/app/NotificationManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z

    return v0
.end method

.method static synthetic access$302(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z

    return p1
.end method

.method static synthetic access$400(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Landroid/content/BroadcastReceiver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mReceiver:Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->listentoSocketNative()Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->wakeupListenerNative()V

    return-void
.end method

.method static synthetic access$900(Lcom/mediatek/bluetooth/pan/BluetoothPanService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->disconnectPanServerDevices()V

    return-void
.end method

.method private callback_pan_handle_activate_cnf(Z)V
    .locals 1
    .parameter "result"

    .prologue
    .line 839
    if-eqz p1, :cond_0

    .line 840
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sServerState:Z

    .line 841
    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateProfileState(I)V

    .line 845
    :goto_0
    return-void

    .line 843
    :cond_0
    const/16 v0, 0xe

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateProfileState(I)V

    goto :goto_0
.end method

.method private callback_pan_handle_connect_cnf(ZLjava/lang/String;I)V
    .locals 10
    .parameter "result"
    .parameter "deviceAddr"
    .parameter "unit"

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 936
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5}, Ljava/lang/String;-><init>()V

    .line 937
    .local v5, toastMsg:Ljava/lang/String;
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v6, p2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 938
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 939
    .local v3, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    .line 941
    .local v1, deviceName:Ljava/lang/String;
    if-nez v3, :cond_0

    .line 943
    const-string v6, "[BT][PAN][BluetoothPANService]"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unknow device when callback_pan_handle_connect_cnf:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 991
    :goto_0
    return-void

    .line 948
    :cond_0
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    .line 949
    .local v4, prevState:I
    if-eqz p1, :cond_5

    .line 950
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    if-nez v6, :cond_4

    .line 951
    const v6, 0x7f05005a

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v9

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 957
    :cond_1
    :goto_1
    :try_start_0
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    invoke-direct {p0, p3, v6}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->enableTethering(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 963
    const/4 v6, 0x2

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3, v6}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$702(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I

    .line 965
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v6, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 966
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    sget v7, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, p2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 967
    sget v6, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    add-int/lit8 v6, v6, 0x1

    sput v6, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    .line 970
    :cond_2
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v6, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 971
    iget v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    invoke-direct {p0, v6, v0, v9}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->genPanNotification(ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;

    move-result-object v6

    iput-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNoti:Landroid/app/Notification;

    .line 972
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNoti:Landroid/app/Notification;

    invoke-virtual {v6, v7, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 988
    :cond_3
    :goto_2
    invoke-direct {p0, v9, v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sendServiceMsg(ILjava/lang/String;)V

    .line 989
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v7

    invoke-direct {p0, v4, v6, v0, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    goto :goto_0

    .line 952
    :cond_4
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    if-ne v6, v7, :cond_1

    .line 953
    const v6, 0x7f050058

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v9

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 958
    :catch_0
    move-exception v2

    .line 959
    .local v2, e:Ljava/io/IOException;
    const-string v6, "[BT][PAN][BluetoothPANService]"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error enableTethering :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 974
    .end local v2           #e:Ljava/io/IOException;
    :cond_5
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    if-nez v6, :cond_6

    .line 975
    const v6, 0x7f05005b

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v9

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 980
    :goto_3
    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3, v9}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$702(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I

    .line 982
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v6, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 983
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v6, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 984
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    invoke-virtual {v6, v7}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_2

    .line 977
    :cond_6
    const v6, 0x7f050059

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v9

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_3
.end method

.method private callback_pan_handle_connect_ind(ILjava/lang/String;I)V
    .locals 8
    .parameter "service"
    .parameter "deviceAddr"
    .parameter "unit"

    .prologue
    .line 897
    if-nez p1, :cond_0

    iget-boolean v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringOn:Z

    if-nez v5, :cond_0

    .line 898
    invoke-virtual {p0, p2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->disconnectPanDevice(Ljava/lang/String;)V

    .line 933
    :goto_0
    return-void

    .line 902
    :cond_0
    const/4 v4, 0x0

    .line 903
    .local v4, prevState:I
    const/4 v1, 0x2

    .line 904
    .local v1, deviceState:I
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5, p2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 905
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 907
    .local v3, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v3, :cond_2

    .line 908
    new-instance v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .end local v3           #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    invoke-direct {v3, p0, v1, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;II)V

    .line 909
    .restart local v3       #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v5, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 917
    :goto_1
    :try_start_0
    invoke-direct {p0, p3, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->enableTethering(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 923
    invoke-direct {p0, v4, v1, v0, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    .line 925
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v5, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 926
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    sget v6, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, p2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 927
    sget v5, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    add-int/lit8 v5, v5, 0x1

    sput v5, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    .line 930
    :cond_1
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 931
    iget v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    const/4 v6, 0x0

    invoke-direct {p0, v5, v0, v6}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->genPanNotification(ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNoti:Landroid/app/Notification;

    .line 932
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    iget-object v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNoti:Landroid/app/Notification;

    invoke-virtual {v5, v6, v7}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    .line 911
    :cond_2
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    .line 912
    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3, v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$702(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I

    .line 913
    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v3, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$802(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I

    goto :goto_1

    .line 918
    :catch_0
    move-exception v2

    .line 919
    .local v2, e:Ljava/io/IOException;
    const-string v5, "[BT][PAN][BluetoothPANService]"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error enableTethering :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private callback_pan_handle_connection_authorize_ind(ILjava/lang/String;)V
    .locals 8
    .parameter "service"
    .parameter "deviceAddr"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 862
    if-nez p1, :cond_0

    iget-boolean v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringOn:Z

    if-nez v4, :cond_0

    .line 863
    const v4, 0x7f05005c

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v6, p2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v6

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 865
    .local v3, toastMsg:Ljava/lang/String;
    invoke-direct {p0, v7, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sendServiceMsg(ILjava/lang/String;)V

    .line 866
    invoke-virtual {p0, p2, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->authorizeRsp(Ljava/lang/String;Z)V

    .line 894
    .end local v3           #toastMsg:Ljava/lang/String;
    :goto_0
    return-void

    .line 870
    :cond_0
    const/4 v1, 0x1

    .line 871
    .local v1, deviceState:I
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v4, p2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 872
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 874
    .local v2, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v2, :cond_3

    .line 875
    new-instance v2, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .end local v2           #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    invoke-direct {v2, p0, v1, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;II)V

    .line 876
    .restart local v2       #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v4, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 884
    :cond_1
    invoke-direct {p0, v7, v1, v0, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    .line 886
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v4, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 887
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    sget v5, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, p2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 888
    sget v4, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sPanAuthorizeNotify:I

    .line 891
    :cond_2
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 892
    iget v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    invoke-direct {p0, v4, v0, v6}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->genPanNotification(ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNoti:Landroid/app/Notification;

    .line 893
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNoti:Landroid/app/Notification;

    invoke-virtual {v4, v5, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    .line 878
    :cond_3
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    if-eqz v4, :cond_1

    .line 879
    invoke-virtual {p0, p2, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->authorizeRsp(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private callback_pan_handle_deactivate_cnf(Z)V
    .locals 1
    .parameter "result"

    .prologue
    .line 848
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sServerState:Z

    .line 849
    if-eqz p1, :cond_0

    .line 850
    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateProfileState(I)V

    .line 854
    :goto_0
    return-void

    .line 852
    :cond_0
    const/16 v0, 0xe

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateProfileState(I)V

    goto :goto_0
.end method

.method private callback_pan_handle_disconnect_cnf(ZLjava/lang/String;)V
    .locals 9
    .parameter "result"
    .parameter "deviceAddr"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 1026
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5}, Ljava/lang/String;-><init>()V

    .line 1027
    .local v5, toastMsg:Ljava/lang/String;
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v6, p2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 1028
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 1029
    .local v2, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1030
    .local v1, deviceName:Ljava/lang/String;
    const/4 v4, 0x0

    .line 1032
    .local v4, state:I
    if-nez v2, :cond_0

    .line 1034
    const-string v6, "[BT][PAN][BluetoothPANService]"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unknow device when callback_pan_handle_disconnect_cnf:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1067
    :goto_0
    return-void

    .line 1039
    :cond_0
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v3

    .line 1041
    .local v3, prevState:I
    if-eqz p1, :cond_4

    .line 1042
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    if-nez v6, :cond_3

    .line 1043
    const v6, 0x7f05005f

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 1049
    :cond_1
    :goto_1
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1051
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v6, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1052
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v6, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 1053
    iget-object v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v7, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    invoke-virtual {v6, v7}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1065
    :cond_2
    :goto_2
    invoke-direct {p0, v8, v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sendServiceMsg(ILjava/lang/String;)V

    .line 1066
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    invoke-direct {p0, v3, v4, v0, v6}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    goto :goto_0

    .line 1044
    :cond_3
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    if-ne v6, v7, :cond_1

    .line 1045
    const v6, 0x7f05005d

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 1046
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->stopNetworkConfig()Z

    goto :goto_1

    .line 1056
    :cond_4
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    if-nez v6, :cond_6

    .line 1057
    const v6, 0x7f05005e

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 1061
    :cond_5
    :goto_3
    const/4 v6, 0x2

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v2, v6}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$702(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I

    .line 1062
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    goto :goto_2

    .line 1058
    :cond_6
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    if-ne v6, v7, :cond_5

    .line 1059
    const v6, 0x7f050060

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_3
.end method

.method private callback_pan_handle_disconnect_ind(Ljava/lang/String;)V
    .locals 7
    .parameter "deviceAddr"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 994
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3}, Ljava/lang/String;-><init>()V

    .line 995
    .local v3, toastMsg:Ljava/lang/String;
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v4, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 996
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 997
    .local v2, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    .line 999
    .local v1, deviceName:Ljava/lang/String;
    if-nez v2, :cond_0

    .line 1001
    const-string v4, "[BT][PAN][BluetoothPANService]"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unknow device when callback_pan_handle_disconnect_ind:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1023
    :goto_0
    return-void

    .line 1006
    :cond_0
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    if-nez v4, :cond_3

    .line 1007
    const v4, 0x7f050062

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1013
    :cond_1
    :goto_1
    invoke-direct {p0, v6, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sendServiceMsg(ILjava/lang/String;)V

    .line 1015
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1017
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1018
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 1019
    iget-object v4, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    invoke-virtual {v4, v5}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1021
    :cond_2
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v5

    invoke-direct {p0, v4, v6, v0, v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    goto :goto_0

    .line 1008
    :cond_3
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    if-ne v4, v5, :cond_1

    .line 1009
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->stopNetworkConfig()Z

    .line 1010
    const v4, 0x7f050061

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method private native cleanServiceNative()V
.end method

.method private createNewTetheringAddressLocked(I)Ljava/lang/String;
    .locals 5
    .parameter "unit"

    .prologue
    const/4 v4, 0x2

    .line 404
    const-string v1, "192.168.44.1"

    .line 405
    .local v1, address:Ljava/lang/String;
    const-string v3, "\\."

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 406
    .local v0, addr:[Ljava/lang/String;
    aget-object v3, v0, v4

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 407
    .local v2, newIp:Ljava/lang/Integer;
    aget-object v3, v0, v4

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 408
    return-object v1
.end method

.method private disconnectPanServerDevices()V
    .locals 7

    .prologue
    .line 361
    const-string v5, "[BT][PAN][BluetoothPANService]"

    const-string v6, "disconnect all remote panu devices"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 365
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 366
    .local v3, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v3, :cond_2

    .line 367
    const-string v5, "[BT][PAN][BluetoothPANService]"

    const-string v6, "disconnectPanServerDevices invalid device!"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    .end local v0           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v3           #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    :cond_1
    return-void

    .line 370
    .restart local v0       #device:Landroid/bluetooth/BluetoothDevice;
    .restart local v3       #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    :cond_2
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    .line 371
    .local v1, deviceAddr:Ljava/lang/String;
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 372
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 373
    iget-object v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v6, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    invoke-virtual {v5, v6}, Landroid/app/NotificationManager;->cancel(I)V

    .line 376
    :cond_3
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    .line 377
    .local v4, state:I
    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v5

    if-nez v5, :cond_0

    .line 379
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->disconnectPanDevice(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private enableTethering(II)Ljava/lang/String;
    .locals 21
    .parameter "unit"
    .parameter "role"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 413
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "updateTetherState:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->printLog(Ljava/lang/String;)V

    .line 415
    const-string v18, "network_management"

    invoke-static/range {v18 .. v18}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v5

    .line 416
    .local v5, b:Landroid/os/IBinder;
    invoke-static {v5}, Landroid/os/INetworkManagementService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/INetworkManagementService;

    move-result-object v17

    .line 417
    .local v17, service:Landroid/os/INetworkManagementService;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    const-string v19, "connectivity"

    invoke-virtual/range {v18 .. v19}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/ConnectivityManager;

    .line 418
    .local v7, cm:Landroid/net/ConnectivityManager;
    invoke-virtual {v7}, Landroid/net/ConnectivityManager;->getTetherableBluetoothRegexs()[Ljava/lang/String;

    move-result-object v6

    .line 419
    .local v6, bluetoothRegexs:[Ljava/lang/String;
    const/16 v18, 0x0

    aget-object v18, v6, v18

    const-string v19, "\\d"

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    .line 421
    .local v13, iface:Ljava/lang/String;
    const-string v18, "[BT][PAN][BluetoothPANService]"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "enableTethering interface name: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    const/16 v18, 0x0

    move/from16 v0, v18

    new-array v9, v0, [Ljava/lang/String;

    .line 426
    .local v9, currentIfaces:[Ljava/lang/String;
    :try_start_0
    invoke-interface/range {v17 .. v17}, Landroid/os/INetworkManagementService;->listInterfaces()[Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 432
    const/4 v11, 0x0

    .line 433
    .local v11, found:Z
    move-object v4, v9

    .local v4, arr$:[Ljava/lang/String;
    array-length v15, v4

    .local v15, len$:I
    const/4 v12, 0x0

    .local v12, i$:I
    :goto_0
    if-ge v12, v15, :cond_0

    aget-object v8, v4, v12

    .line 434
    .local v8, currIface:Ljava/lang/String;
    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 435
    const/4 v11, 0x1

    .line 440
    .end local v8           #currIface:Ljava/lang/String;
    :cond_0
    if-nez v11, :cond_3

    .line 441
    const/4 v3, 0x0

    .line 492
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v11           #found:Z
    .end local v12           #i$:I
    .end local v15           #len$:I
    :cond_1
    :goto_1
    return-object v3

    .line 427
    :catch_0
    move-exception v10

    .line 428
    .local v10, e:Landroid/os/RemoteException;
    const-string v18, "[BT][PAN][BluetoothPANService]"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Error listing Interfaces :"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    const/4 v3, 0x0

    goto :goto_1

    .line 433
    .end local v10           #e:Landroid/os/RemoteException;
    .restart local v4       #arr$:[Ljava/lang/String;
    .restart local v8       #currIface:Ljava/lang/String;
    .restart local v11       #found:Z
    .restart local v12       #i$:I
    .restart local v15       #len$:I
    :cond_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 444
    .end local v8           #currIface:Ljava/lang/String;
    :cond_3
    invoke-direct/range {p0 .. p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->createNewTetheringAddressLocked(I)Ljava/lang/String;

    move-result-object v3

    .line 445
    .local v3, address:Ljava/lang/String;
    if-nez v3, :cond_4

    .line 446
    const/4 v3, 0x0

    goto :goto_1

    .line 449
    :cond_4
    const/4 v14, 0x0

    .line 451
    .local v14, ifcg:Landroid/net/InterfaceConfiguration;
    :try_start_1
    move-object/from16 v0, v17

    invoke-interface {v0, v13}, Landroid/os/INetworkManagementService;->getInterfaceConfig(Ljava/lang/String;)Landroid/net/InterfaceConfiguration;

    move-result-object v14

    .line 452
    if-eqz v14, :cond_1

    .line 453
    const/4 v2, 0x0

    .line 454
    .local v2, addr:Ljava/net/InetAddress;
    invoke-virtual {v14}, Landroid/net/InterfaceConfiguration;->getLinkAddress()Landroid/net/LinkAddress;

    move-result-object v16

    .line 455
    .local v16, linkAddr:Landroid/net/LinkAddress;
    invoke-virtual/range {v16 .. v16}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    .line 456
    if-eqz v16, :cond_5

    if-eqz v2, :cond_5

    const-string v18, "0.0.0.0"

    invoke-static/range {v18 .. v18}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_5

    const-string v18, "::0"

    invoke-static/range {v18 .. v18}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 463
    :cond_5
    invoke-static {v3}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .line 465
    :cond_6
    invoke-virtual {v14}, Landroid/net/InterfaceConfiguration;->setInterfaceUp()V

    .line 466
    const-string v18, "running"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Landroid/net/InterfaceConfiguration;->clearFlag(Ljava/lang/String;)V

    .line 467
    new-instance v18, Landroid/net/LinkAddress;

    const/16 v19, 0x18

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v0, v2, v1}, Landroid/net/LinkAddress;-><init>(Ljava/net/InetAddress;I)V

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Landroid/net/InterfaceConfiguration;->setLinkAddress(Landroid/net/LinkAddress;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 475
    :try_start_2
    move-object/from16 v0, v17

    invoke-interface {v0, v13, v14}, Landroid/os/INetworkManagementService;->setInterfaceConfig(Ljava/lang/String;Landroid/net/InterfaceConfiguration;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    .line 480
    if-nez p2, :cond_7

    .line 481
    :try_start_3
    invoke-virtual {v7, v13}, Landroid/net/ConnectivityManager;->tether(Ljava/lang/String;)I

    move-result v18

    if-eqz v18, :cond_1

    .line 482
    const-string v18, "[BT][PAN][BluetoothPANService]"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Error tethering "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1

    .line 488
    .end local v2           #addr:Ljava/net/InetAddress;
    .end local v16           #linkAddr:Landroid/net/LinkAddress;
    :catch_1
    move-exception v10

    .line 489
    .restart local v10       #e:Landroid/os/RemoteException;
    const-string v18, "[BT][PAN][BluetoothPANService]"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Error configuring interface "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ", :"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 476
    .end local v10           #e:Landroid/os/RemoteException;
    .restart local v2       #addr:Ljava/net/InetAddress;
    .restart local v16       #linkAddr:Landroid/net/LinkAddress;
    :catch_2
    move-exception v10

    .line 477
    .local v10, e:Ljava/lang/Exception;
    :try_start_4
    const-string v18, "[BT][PAN][BluetoothPANService]"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Error set interface config"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ", :"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 484
    .end local v10           #e:Ljava/lang/Exception;
    :cond_7
    const/16 v18, 0x1

    move/from16 v0, p2

    move/from16 v1, v18

    if-ne v0, v1, :cond_1

    .line 485
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->startNetworkConfig()Z
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_1
.end method

.method private native forceClearServerNative()V
.end method

.method private genPanNotification(ILandroid/bluetooth/BluetoothDevice;Z)Landroid/app/Notification;
    .locals 16
    .parameter "type"
    .parameter "device"
    .parameter "needSound"

    .prologue
    .line 1071
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 1072
    .local v7, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v7, :cond_0

    .line 1073
    const-string v13, "[BT][PAN][BluetoothPANService]"

    const-string v14, "genPanNotification invalid device!"

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1074
    const/4 v12, 0x0

    .line 1139
    :goto_0
    return-object v12

    .line 1077
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1079
    .local v3, deviceName:Ljava/lang/String;
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    .line 1080
    .local v11, tmpIntent:Landroid/content/Intent;
    const/4 v12, 0x0

    .line 1081
    .local v12, tmpNoti:Landroid/app/Notification;
    const/4 v10, 0x0

    .line 1082
    .local v10, tmpContentIntent:Landroid/app/PendingIntent;
    const/4 v4, -0x1

    .line 1083
    .local v4, iconID:I
    const/4 v2, 0x0

    .line 1084
    .local v2, clazz:Ljava/lang/String;
    const/4 v8, 0x0

    .line 1085
    .local v8, ticker:Ljava/lang/String;
    const/4 v9, 0x0

    .line 1086
    .local v9, title:Ljava/lang/String;
    const/4 v1, 0x0

    .line 1088
    .local v1, action:Ljava/lang/String;
    const-string v13, "[BT][PAN][BluetoothPANService]"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "genPanNotification "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ";device_state "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1091
    const v4, 0x1080080

    .line 1092
    const-class v13, Lcom/mediatek/bluetooth/pan/BluetoothPanAlert;

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1093
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v13

    const-string v14, "device_addr"

    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1094
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6}, Ljava/lang/String;-><init>()V

    .line 1095
    .local v6, notifyMsg:Ljava/lang/String;
    const/4 v5, 0x0

    .line 1097
    .local v5, notifyFlags:I
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v13

    const/4 v14, 0x2

    if-ne v13, v14, :cond_4

    .line 1098
    const/4 v5, 0x2

    .line 1100
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v13

    if-nez v13, :cond_3

    .line 1101
    const v13, 0x7f050057

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v3, v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1102
    const v13, 0x7f050055

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1103
    const v13, 0x7f050056

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1104
    const-string v1, "bt_pan_NAP_device_connected"

    .line 1127
    :cond_1
    :goto_1
    new-instance v12, Landroid/app/Notification;

    .end local v12           #tmpNoti:Landroid/app/Notification;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    invoke-direct {v12, v4, v8, v13, v14}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 1128
    .restart local v12       #tmpNoti:Landroid/app/Notification;
    iput v5, v12, Landroid/app/Notification;->flags:I

    .line 1129
    if-eqz p3, :cond_2

    .line 1130
    iget v13, v12, Landroid/app/Notification;->defaults:I

    or-int/lit8 v13, v13, 0x1

    iput v13, v12, Landroid/app/Notification;->defaults:I

    .line 1131
    iget v13, v12, Landroid/app/Notification;->defaults:I

    or-int/lit8 v13, v13, 0x2

    iput v13, v12, Landroid/app/Notification;->defaults:I

    .line 1134
    :cond_2
    const-string v13, "action"

    invoke-virtual {v11, v13, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1135
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    const/high16 v14, 0x1000

    move/from16 v0, p1

    invoke-static {v13, v0, v11, v14}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 1137
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mContext:Landroid/content/Context;

    invoke-virtual {v12, v13, v9, v6, v10}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    goto/16 :goto_0

    .line 1105
    :cond_3
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_1

    .line 1106
    const v13, 0x7f050054

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v3, v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1107
    const v13, 0x7f050052

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1108
    const v13, 0x7f050053

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1109
    const-string v1, "bt_pan_GN_device_connected"

    goto :goto_1

    .line 1111
    :cond_4
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_1

    .line 1112
    const/16 v5, 0x8

    .line 1114
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v13

    if-nez v13, :cond_5

    .line 1115
    const v13, 0x7f050051

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v3, v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1116
    const v13, 0x7f05004f

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1117
    const v13, 0x7f050050

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1118
    const-string v1, "bt_pan_NAP_device_authorize"

    goto/16 :goto_1

    .line 1119
    :cond_5
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v7}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_1

    .line 1120
    const v13, 0x7f05004e

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v3, v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1121
    const v13, 0x7f05004c

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1122
    const v13, 0x7f05004d

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1123
    const-string v1, "bt_pan_GN_device_authorize"

    goto/16 :goto_1
.end method

.method private native initServiceNative()Z
.end method

.method private native listentoSocketNative()Z
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 177
    const-string v0, "[BT][PAN][BluetoothPANService]"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    return-void
.end method

.method private sendServiceMsg(ILjava/lang/String;)V
    .locals 5
    .parameter "what"
    .parameter "message"

    .prologue
    .line 824
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 827
    .local v1, msg:Landroid/os/Message;
    const-string v2, "[BT][PAN][BluetoothPANService]"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendServiceMsg status="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "message="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 829
    iput p1, v1, Landroid/os/Message;->what:I

    .line 831
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 832
    .local v0, data:Landroid/os/Bundle;
    const-string v2, "show toast"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 833
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 835
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mServiceHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 836
    return-void
.end method

.method private native serverActivateReqNative()V
.end method

.method private static native serverAuthorizeRspNative(Ljava/lang/String;Z)V
.end method

.method private native serverConnectReqNative(ILjava/lang/String;)V
.end method

.method private native serverDeactivateReqNative()V
.end method

.method private static native serverDisconnectReqNative(Ljava/lang/String;)V
.end method

.method private startNetworkConfig()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 217
    :try_start_0
    const-string v2, "[BT][PAN][BluetoothPANService]"

    const-string v3, "start Tethering mDhcp Range"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDhcpRange:[Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/os/INetworkManagementService;->startTethering([Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    :try_start_1
    const-string v2, "[BT][PAN][BluetoothPANService]"

    const-string v3, "set Dns Forwarders"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDnsServers:[Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/os/INetworkManagementService;->setDnsForwarders([Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 232
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "[BT][PAN][BluetoothPANService]"

    const-string v3, "startNetworkConfig error when startTethering"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 227
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 228
    .restart local v0       #e:Landroid/os/RemoteException;
    const-string v2, "[BT][PAN][BluetoothPANService]"

    const-string v3, "startNetworkConfig error when setDnsForwarders"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private native stopListentoSocketNative()V
.end method

.method private stopNetworkConfig()Z
    .locals 3

    .prologue
    .line 237
    :try_start_0
    const-string v1, "[BT][PAN][BluetoothPANService]"

    const-string v2, "stopNetworkConfig"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    invoke-interface {v1}, Landroid/os/INetworkManagementService;->stopTethering()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 239
    :catch_0
    move-exception v0

    .line 240
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "[BT][PAN][BluetoothPANService]"

    const-string v2, "error when stopTethering"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 242
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private updateProfileState(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 213
    return-void
.end method

.method private updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V
    .locals 5
    .parameter "prevState"
    .parameter "state"
    .parameter "device"
    .parameter "role"

    .prologue
    .line 182
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateSettingsState("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->printLog(Ljava/lang/String;)V

    .line 184
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 185
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 186
    const-string v2, "android.bluetooth.profile.extra.PREVIOUS_STATE"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 187
    const-string v2, "android.bluetooth.profile.extra.STATE"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 188
    const-string v2, "android.bluetooth.pan.extra.LOCAL_ROLE"

    invoke-virtual {v1, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 189
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mContext:Landroid/content/Context;

    const-string v3, "android.permission.BLUETOOTH"

    invoke-virtual {v2, v1, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 191
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Pan Device state : device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " State:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->printLog(Ljava/lang/String;)V

    .line 193
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mBluetoothService:Landroid/bluetooth/IBluetooth;

    const/4 v3, 0x5

    invoke-interface {v2, p3, v3, p2, p1}, Landroid/bluetooth/IBluetooth;->sendConnectionStateChange(Landroid/bluetooth/BluetoothDevice;III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "[BT][PAN][BluetoothPANService]"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendConnectionStateChange Exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private native wakeupListenerNative()V
.end method


# virtual methods
.method public authorizeRsp(Ljava/lang/String;Z)V
    .locals 0
    .parameter "btAddr"
    .parameter "result"

    .prologue
    .line 321
    if-nez p1, :cond_0

    .line 325
    :goto_0
    return-void

    .line 324
    :cond_0
    invoke-static {p1, p2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->serverAuthorizeRspNative(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public connectPanDevice(Ljava/lang/String;I)V
    .locals 4
    .parameter "btAddr"
    .parameter "service"

    .prologue
    const/4 v3, 0x1

    .line 328
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 329
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 340
    :goto_0
    return-void

    .line 333
    :cond_0
    new-instance v1, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    invoke-direct {v1, p0, v3, p2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;II)V

    .line 335
    .local v1, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    iget-object v2, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    const/4 v2, 0x0

    invoke-direct {p0, v2, v3, v0, p2}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    .line 339
    invoke-direct {p0, p2, p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->serverConnectReqNative(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public disconnectPanDevice(Ljava/lang/String;)V
    .locals 5
    .parameter "btAddr"

    .prologue
    .line 343
    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v3, p1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 344
    .local v0, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 346
    .local v1, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-nez v1, :cond_0

    .line 348
    const-string v3, "[BT][PAN][BluetoothPANService]"

    const-string v4, "unknown device"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    :goto_0
    return-void

    .line 353
    :cond_0
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v2

    .line 354
    .local v2, prevState:I
    const/4 v3, 0x3

    #setter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v1, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$702(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;I)I

    .line 355
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v3

    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v4

    invoke-direct {p0, v2, v3, v0, v4}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    .line 356
    invoke-static {p1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->serverDisconnectReqNative(Ljava/lang/String;)V

    goto :goto_0
.end method

.method localClearService()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 725
    const/4 v7, 0x0

    .line 726
    .local v7, timeout:Z
    const/4 v0, 0x0

    .line 728
    .local v0, cnt:I
    sget-boolean v8, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sServerState:Z

    if-eqz v8, :cond_4

    .line 730
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->serverDeactivateReqNative()V

    .line 731
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 732
    .local v1, device:Landroid/bluetooth/BluetoothDevice;
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v8, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;

    .line 733
    .local v5, panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    if-eqz v5, :cond_0

    .line 734
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mState:I
    invoke-static {v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$700(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v6

    .line 735
    .local v6, prevState:I
    if-eqz v6, :cond_0

    .line 736
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    .line 737
    .local v2, deviceAddr:Ljava/lang/String;
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 738
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    .line 739
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    iget v9, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNotifyId:I

    invoke-virtual {v8, v9}, Landroid/app/NotificationManager;->cancel(I)V

    .line 741
    :cond_1
    #getter for: Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->mLocalRole:I
    invoke-static {v5}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;->access$800(Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;)I

    move-result v8

    invoke-direct {p0, v6, v10, v1, v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateSettingsState(IILandroid/bluetooth/BluetoothDevice;I)V

    goto :goto_0

    .line 754
    .end local v1           #device:Landroid/bluetooth/BluetoothDevice;
    .end local v2           #deviceAddr:Ljava/lang/String;
    .end local v5           #panDevice:Lcom/mediatek/bluetooth/pan/BluetoothPanService$BluetoothPanDevice;
    .end local v6           #prevState:I
    :cond_2
    const-wide/16 v8, 0x64

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 760
    :goto_1
    add-int/lit8 v0, v0, 0x64

    .line 747
    :cond_3
    sget-boolean v8, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sServerState:Z

    if-eqz v8, :cond_4

    .line 748
    const/16 v8, 0x1388

    if-lt v0, v8, :cond_2

    .line 749
    const/4 v7, 0x1

    .line 764
    .end local v4           #i$:Ljava/util/Iterator;
    :cond_4
    if-eqz v7, :cond_5

    .line 771
    const-string v8, "[BT][PAN][BluetoothPANService]"

    const-string v9, "Waiting DEREGISTER_SERVER_CNF time-out. Force clear server context."

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    sput-boolean v10, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sServerState:Z

    .line 774
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->forceClearServerNative()V

    .line 776
    :cond_5
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    if-eqz v8, :cond_6

    .line 778
    :try_start_1
    const-string v8, "mSocketListener close."

    invoke-direct {p0, v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->printLog(Ljava/lang/String;)V

    .line 779
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    invoke-virtual {v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->shutdown()V

    .line 780
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    const-wide/16 v9, 0x3e8

    invoke-virtual {v8, v9, v10}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->join(J)V

    .line 781
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    .line 782
    const-string v8, "mSocketListener close OK."

    invoke-direct {p0, v8}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->printLog(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 789
    :cond_6
    :goto_2
    iget-object v8, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->clear()V

    .line 791
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->stopListentoSocketNative()V

    .line 792
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->cleanServiceNative()V

    .line 793
    return-void

    .line 755
    .restart local v4       #i$:Ljava/util/Iterator;
    :catch_0
    move-exception v3

    .line 757
    .local v3, e:Ljava/lang/InterruptedException;
    const-string v8, "[BT][PAN][BluetoothPANService]"

    const-string v9, "Waiting for server deregister-cnf was interrupted."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 783
    .end local v3           #e:Ljava/lang/InterruptedException;
    .end local v4           #i$:Ljava/util/Iterator;
    :catch_1
    move-exception v3

    .line 785
    .restart local v3       #e:Ljava/lang/InterruptedException;
    const-string v8, "[BT][PAN][BluetoothPANService]"

    const-string v9, "mSocketListener close error."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method localCreateService()V
    .locals 2

    .prologue
    .line 796
    sget-boolean v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sServerState:Z

    if-nez v0, :cond_1

    .line 797
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->updateProfileState(I)V

    .line 798
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->initServiceNative()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 800
    invoke-direct {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->serverActivateReqNative()V

    .line 802
    const-string v0, "Succeed to init BluetoothPanService."

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->printLog(Ljava/lang/String;)V

    .line 803
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    if-nez v0, :cond_0

    .line 804
    new-instance v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;-><init>(Lcom/mediatek/bluetooth/pan/BluetoothPanService;Lcom/mediatek/bluetooth/pan/BluetoothPanService$1;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    .line 805
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    const-string v1, "BTPanSocketListener"

    invoke-virtual {v0, v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->setName(Ljava/lang/String;)V

    .line 806
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->stopped:Z

    .line 807
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mSocketListener:Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService$SocketListenerThread;->start()V

    .line 808
    const-string v0, "SocketListener started."

    invoke-direct {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->printLog(Ljava/lang/String;)V

    .line 812
    :cond_0
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "Pre-enable PAN Server"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 820
    :cond_1
    :goto_0
    return-void

    .line 816
    :cond_2
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "Failed to init BluetoothPanService."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 4
    .parameter "intent"

    .prologue
    .line 618
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 620
    .local v0, action:Ljava/lang/String;
    const-string v1, "[BT][PAN][BluetoothPANService]"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Enter onBind(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    const-class v1, Landroid/bluetooth/IBluetoothPan;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 624
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPan:Landroid/bluetooth/IBluetoothPan$Stub;

    .line 627
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanAction:Lcom/mediatek/bluetooth/pan/IBluetoothPanAction$Stub;

    goto :goto_0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 634
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "Enter onCreate()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mContext:Landroid/content/Context;

    .line 637
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 638
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mPanDevices:Ljava/util/HashMap;

    .line 639
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mTetheringOn:Z

    .line 641
    const-string v0, "[BT][PAN][BluetoothPANService]"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[API:onCreate] sUtState is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sUtState:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    sget-boolean v0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->sUtState:Z

    if-nez v0, :cond_0

    .line 644
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "[API:onCreate] library is extpan_jni.so"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    const-string v0, "extpan_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 650
    :goto_0
    return-void

    .line 647
    :cond_0
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "[API:onCreate] library is expan_ut.so"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    const-string v0, "extpan_ut"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 713
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 715
    const-string v0, "[BT][PAN][BluetoothPANService]"

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 717
    iget-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z

    if-eqz v0, :cond_0

    .line 718
    iget-object v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 719
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->localClearService()V

    .line 720
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z

    .line 722
    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    const/4 v5, 0x1

    .line 656
    const-string v3, "[BT][PAN][BluetoothPANService]"

    const-string v4, "Enter onStartCommand()"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 659
    iget-boolean v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z

    if-nez v3, :cond_5

    .line 661
    const-string v3, "bluetooth"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 662
    .local v0, b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/bluetooth/IBluetooth$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetooth;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mBluetoothService:Landroid/bluetooth/IBluetooth;

    .line 665
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    .line 666
    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNM:Landroid/app/NotificationManager;

    if-nez v3, :cond_0

    .line 668
    const-string v3, "[BT][PAN][BluetoothPANService]"

    const-string v4, "Get Notification-Manager failed. Stop PAN service."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->stopSelf()V

    .line 673
    :cond_0
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 674
    .local v1, filter:Landroid/content/IntentFilter;
    const-string v3, "android.bluetooth.device.action.NAME_CHANGED"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 675
    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 676
    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v1}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 678
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060002

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDnsServers:[Ljava/lang/String;

    .line 679
    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDnsServers:[Ljava/lang/String;

    array-length v3, v3

    if-nez v3, :cond_1

    .line 680
    sget-object v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->DNS_DEFAULT_SERVER:[Ljava/lang/String;

    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDnsServers:[Ljava/lang/String;

    .line 683
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060001

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDhcpRange:[Ljava/lang/String;

    .line 684
    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDhcpRange:[Ljava/lang/String;

    array-length v3, v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDhcpRange:[Ljava/lang/String;

    array-length v3, v3

    rem-int/lit8 v3, v3, 0x2

    if-ne v3, v5, :cond_3

    .line 685
    :cond_2
    sget-object v3, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->DHCP_DEFAULT_RANGE:[Ljava/lang/String;

    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mDhcpRange:[Ljava/lang/String;

    .line 688
    :cond_3
    const-string v3, "network_management"

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    .line 689
    .local v2, nmb:Landroid/os/IBinder;
    invoke-static {v2}, Landroid/os/INetworkManagementService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/INetworkManagementService;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    .line 691
    iget-object v3, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mNetworkManagementService:Landroid/os/INetworkManagementService;

    if-nez v3, :cond_4

    .line 692
    const-string v3, "[BT][PAN][BluetoothPANService]"

    const-string v4, "Error get INetworkManagementService"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 693
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->stopSelf()V

    .line 696
    :cond_4
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->localCreateService()V

    .line 697
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 699
    iput-boolean v5, p0, Lcom/mediatek/bluetooth/pan/BluetoothPanService;->mHasInitiated:Z

    .line 706
    .end local v0           #b:Landroid/os/IBinder;
    .end local v1           #filter:Landroid/content/IntentFilter;
    .end local v2           #nmb:Landroid/os/IBinder;
    :goto_0
    return v5

    .line 702
    :cond_5
    const-string v3, "[BT][PAN][BluetoothPANService]"

    const-string v4, "Already started, just return!"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
