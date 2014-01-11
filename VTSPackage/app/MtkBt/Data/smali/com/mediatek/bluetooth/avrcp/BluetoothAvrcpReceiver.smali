.class public Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothAvrcpReceiver.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "AVRCP"

.field public static sAvrcpServer:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;


# instance fields
.field private mNativeData:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->sAvrcpServer:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public destroyMyself(Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;)V
    .locals 2
    .parameter "server"

    .prologue
    .line 115
    sget-object v0, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->sAvrcpServer:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    if-ne p1, v0, :cond_0

    .line 116
    const-string v0, "AVRCP"

    const-string v1, "destroyMyself"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    :cond_0
    return-void
.end method

.method public initalConnect(Ljava/lang/String;)V
    .locals 2
    .parameter "sAddr"

    .prologue
    .line 121
    sget-object v0, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->sAvrcpServer:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    if-eqz v0, :cond_0

    .line 122
    const-string v0, "AVRCP"

    const-string v1, "AVRCP initConnect connectReqNative used!"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    sget-object v0, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->sAvrcpServer:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v0, p1}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->connectReqNative(Ljava/lang/String;)Z

    .line 127
    :goto_0
    return-void

    .line 125
    :cond_0
    const-string v0, "AVRCP"

    const-string v1, "AVRCP initConnect fail !!! no mAvrcpServer"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x0

    .line 56
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, action:Ljava/lang/String;
    const-string v5, "[BT][AVRCP] onReceive "

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 60
    .local v4, textMessage:Ljava/lang/String;
    const-string v5, "AVRCP"

    invoke-static {v5, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    const-string v5, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 63
    const/4 v3, 0x0

    .line 64
    .local v3, state:I
    const-string v5, "android.bluetooth.adapter.extra.STATE"

    const/high16 v6, -0x8000

    invoke-virtual {p2, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 65
    const/16 v5, 0xc

    if-eq v5, v3, :cond_0

    const/16 v5, 0xa

    if-ne v5, v3, :cond_1

    .line 67
    :cond_0
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 68
    .local v2, in:Landroid/content/Intent;
    invoke-virtual {v2, p2}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 69
    const-class v5, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v2, p1, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 70
    const-string v5, "action"

    invoke-virtual {v2, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 72
    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 76
    .end local v2           #in:Landroid/content/Intent;
    .end local v3           #state:I
    :cond_1
    const-string v5, "android.provider.Telephony.SECRET_CODE"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 77
    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    .line 78
    .local v1, data:Ljava/lang/String;
    const-string v5, "AVRCP"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[BT][AVRCP] Get the securty code ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    if-eqz v1, :cond_2

    .line 80
    const-string v5, "AVRCP"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[BT][AVRCP] Get the securty code data: ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :cond_2
    const-string v4, "AVRCP PTS enable mode (Source:Telephone)"

    .line 84
    if-eqz v1, :cond_7

    const-string v5, "2872710"

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_7

    .line 85
    const-string v5, "00:00:00:00:00:00"

    invoke-virtual {p0, v5}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->initalConnect(Ljava/lang/String;)V

    .line 86
    const-string v4, "AVRCP PTS connect mode (Source:Telephone)"

    .line 90
    :goto_0
    invoke-static {p1, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 92
    .end local v1           #data:Ljava/lang/String;
    :cond_3
    const-string v5, "android.mediatek.bluetooth.avrcp.pts"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 93
    const-string v5, "AVRCP"

    const-string v6, "Get the avrcp.pts code"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    sput v9, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->sPTSDebugMode:I

    .line 95
    const-string v4, "AVRCP PTS enable mode (Source:pts action)"

    .line 96
    invoke-static {p1, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 98
    :cond_4
    const-string v5, "android.mediatek.bluetooth.avrcp.connect"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 99
    const-string v5, "AVRCP"

    const-string v6, "Get the avrcp.connect code"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const-string v4, "AVRCP PTS connect (Source: action)"

    .line 101
    invoke-static {p1, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 102
    const-string v5, "00:00:00:00:00:00"

    invoke-virtual {p0, v5}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->initalConnect(Ljava/lang/String;)V

    .line 104
    :cond_5
    const-string v5, "android.mediatek.bluetooth.avrcp.disconnect"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 105
    const-string v5, "AVRCP"

    const-string v6, "Get the avrcp.disconnect code"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    sget-object v5, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->sAvrcpServer:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    if-eqz v5, :cond_6

    .line 107
    const-string v4, "AVRCP PTS disconnect (Source: action)"

    .line 108
    invoke-static {p1, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 109
    sget-object v5, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpReceiver;->sAvrcpServer:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    invoke-virtual {v5}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->disconnectNative()Z

    .line 112
    :cond_6
    return-void

    .line 88
    .restart local v1       #data:Ljava/lang/String;
    :cond_7
    sput v9, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->sPTSDebugMode:I

    goto :goto_0
.end method
