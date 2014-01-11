.class public Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothShareGatewayReceiver.java"


# static fields
.field private static final ACTION_OPEN_RECEIVED_FILES:Ljava/lang/String; = "android.btopp.intent.action.OPEN_RECEIVED_FILES"

.field private static final ACTION_SEND_BIP_FILES:Ljava/lang/String; = "com.mediatek.bluetooth.sharegateway.action.ACTION_SEND_BIP_FILES"

.field private static final TAG:Ljava/lang/String; = "BluetoothShareGatewayReceiver"

.field private static sBip:Z

.field private static sIntent:Landroid/content/Intent;

.field private static sType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private profileDispatcher(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .parameter "context"
    .parameter "remoteDevice"

    .prologue
    .line 113
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sIntent:Landroid/content/Intent;

    const-string v2, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 114
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    .line 131
    .local v0, uuids:[Landroid/os/ParcelUuid;
    const-string v1, "BluetoothShareGatewayReceiver"

    const-string v2, "OPP is supported"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sIntent:Landroid/content/Intent;

    const-string v2, "com.mediatek.bluetooth"

    const-string v3, "com.mediatek.bluetooth.opp.mmi.OppClientActivity"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sIntent:Landroid/content/Intent;

    const/high16 v2, 0x1000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 141
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sIntent:Landroid/content/Intent;

    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 143
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 70
    const-string v4, "BluetoothShareGatewayReceiver"

    const-string v5, "BSG broadcast receiver receives intent"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, action:Ljava/lang/String;
    const-string v4, "android.bluetooth.devicepicker.action.DEVICE_SELECTED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 76
    const-string v4, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/bluetooth/BluetoothDevice;

    .line 77
    .local v3, remoteDevice:Landroid/bluetooth/BluetoothDevice;
    const-string v4, "BluetoothShareGatewayReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Received BT device selected intent, bt device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    if-eqz v3, :cond_0

    .line 89
    invoke-direct {p0, p1, v3}, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->profileDispatcher(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)V

    .line 110
    .end local v3           #remoteDevice:Landroid/bluetooth/BluetoothDevice;
    :cond_0
    :goto_0
    return-void

    .line 91
    :cond_1
    const-string v4, "android.btopp.intent.action.OPEN_RECEIVED_FILES"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 93
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/mediatek/bluetooth/share/BluetoothShareMgmtActivity;

    invoke-direct {v2, p1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 94
    .local v2, openReceivedIntent:Landroid/content/Intent;
    const/high16 v4, 0x1400

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 96
    invoke-virtual {p1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 97
    .end local v2           #openReceivedIntent:Landroid/content/Intent;
    :cond_2
    const-string v4, "com.mediatek.bluetooth.sharegateway.action.ACTION_SETTINGS"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 98
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 99
    .local v1, bundle:Landroid/os/Bundle;
    if-eqz v1, :cond_3

    .line 100
    const-string v4, "Type"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sType:Ljava/lang/String;

    .line 101
    const-string v4, "BipFlag"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    sput-boolean v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sBip:Z

    .line 102
    const-string v4, "Intent"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/content/Intent;

    sput-object v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sIntent:Landroid/content/Intent;

    .line 103
    sget-object v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sIntent:Landroid/content/Intent;

    if-nez v4, :cond_3

    .line 104
    const-string v4, "BluetoothShareGatewayReceiver"

    const-string v5, "sIntent == null"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :cond_3
    const-string v4, "BluetoothShareGatewayReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sType = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; sBip = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-boolean v6, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;->sBip:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
