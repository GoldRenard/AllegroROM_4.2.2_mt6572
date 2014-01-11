.class public Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;
.super Landroid/app/Activity;
.source "BluetoothShareGatewayActivity.java"


# static fields
.field public static final ACTION_DEVICE_SELECTED:Ljava/lang/String; = "com.mediatek.bluetooth.sharegateway.action.DEVICE_SELECTED"

.field public static final ACTION_SEND:Ljava/lang/String; = "com.mediatek.bluetooth.sharegateway.action.SEND"

.field private static final ACTION_SEND_BIP_FILES:Ljava/lang/String; = "com.mediatek.bluetooth.sharegateway.action.ACTION_SEND_BIP_FILES"

.field public static final ACTION_SETTINGS:Ljava/lang/String; = "com.mediatek.bluetooth.sharegateway.action.ACTION_SETTINGS"

.field public static final BIP_PROFILE_UUIDS:[Landroid/os/ParcelUuid; = null

.field private static final BLUETOOTH_DEVICE_REQUEST:I = 0x1

.field public static final EXTRA_DEVICE_ADDRESS:Ljava/lang/String; = "android.bluetooth.device.extra.DEVICE"

.field private static final KEY_INTENT:Ljava/lang/String; = "intent"

.field private static final TAG:Ljava/lang/String; = "BluetoothShareGatewayActivity"

.field private static sAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private static sBip:Z

.field private static sIntent:Landroid/content/Intent;

.field private static sReentry:Z

.field private static sType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 83
    sput-boolean v2, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sReentry:Z

    .line 85
    const/4 v0, 0x1

    new-array v0, v0, [Landroid/os/ParcelUuid;

    sget-object v1, Lcom/mediatek/bluetooth/BluetoothUuidEx;->BipResponder:Landroid/os/ParcelUuid;

    aput-object v1, v0, v2

    sput-object v0, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->BIP_PROFILE_UUIDS:[Landroid/os/ParcelUuid;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private profileDispatcher(Landroid/bluetooth/BluetoothDevice;)V
    .locals 4
    .parameter "remoteDevice"

    .prologue
    .line 315
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    const-string v2, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 316
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    .line 327
    .local v0, uuids:[Landroid/os/ParcelUuid;
    const-string v1, "BluetoothShareGatewayActivity"

    const-string v2, "OPP is supported"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    const-string v2, "com.mediatek.bluetooth"

    const-string v3, "com.mediatek.bluetooth.opp.mmi.OppClientActivity"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 334
    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->startActivity(Landroid/content/Intent;)V

    .line 336
    return-void
.end method

.method private startDevicePicker()V
    .locals 5

    .prologue
    .line 290
    new-instance v0, Landroid/content/Intent;

    const-string v3, "com.mediatek.bluetooth.sharegateway.action.ACTION_SETTINGS"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 291
    .local v0, in:Landroid/content/Intent;
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 292
    .local v2, intentBundle:Landroid/os/Bundle;
    const-string v3, "BipFlag"

    sget-boolean v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 293
    const-string v3, "Type"

    sget-object v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sType:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    const-string v3, "Intent"

    sget-object v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 295
    invoke-virtual {v0, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 296
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 297
    const-string v3, "BluetoothShareGatewayActivity"

    const-string v4, "Start Device Picker!"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    const/4 v3, 0x1

    sput-boolean v3, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sReentry:Z

    .line 300
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.bluetooth.devicepicker.action.LAUNCH"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 301
    .local v1, inToBDP:Landroid/content/Intent;
    const/high16 v3, 0x80

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 302
    const-string v3, "android.bluetooth.devicepicker.extra.NEED_AUTH"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 303
    const-string v3, "android.bluetooth.devicepicker.extra.LAUNCH_PACKAGE"

    const-string v4, "com.mediatek.bluetooth"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 304
    const-string v3, "android.bluetooth.devicepicker.extra.DEVICE_PICKER_LAUNCH_CLASS"

    const-class v4, Lcom/mediatek/bluetooth/BluetoothShareGatewayReceiver;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 306
    const-string v3, "android.bluetooth.devicepicker.extra.FILTER_TYPE"

    const/4 v4, 0x2

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 311
    invoke-virtual {p0, v1}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->startActivity(Landroid/content/Intent;)V

    .line 312
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 275
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 277
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 278
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sReentry:Z

    .line 279
    const/4 v0, -0x1

    if-ne v0, p2, :cond_1

    .line 281
    invoke-direct {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->startDevicePicker()V

    .line 287
    :cond_0
    :goto_0
    return-void

    .line 284
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 94
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "savedInstanceState"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 98
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 99
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "onCreate......"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    sput-boolean v11, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sReentry:Z

    .line 103
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 104
    .local v3, intent:Landroid/content/Intent;
    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, action:Ljava/lang/String;
    const-string v8, "android.intent.extra.STREAM"

    invoke-virtual {v3, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    .line 107
    .local v6, uri:Landroid/net/Uri;
    if-nez v6, :cond_5

    .line 108
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "uri is null"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    :cond_0
    :goto_0
    const-string v8, "android.intent.extra.STREAM"

    invoke-virtual {v3, v8}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 121
    .local v7, uris:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/net/Uri;>;"
    if-nez v7, :cond_6

    .line 122
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "uris is null"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    :cond_1
    :goto_1
    const-string v8, "android.intent.action.SEND"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    const-string v8, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    const-string v8, "android.btopp.intent.action.HANDOVER_SEND"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    const-string v8, "android.btopp.intent.action.HANDOVER_SEND_MULTIPLE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 150
    :cond_2
    const-string v8, "android.btopp.intent.action.HANDOVER_SEND"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "android.btopp.intent.action.HANDOVER_SEND_MULTIPLE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 152
    :cond_3
    sput-boolean v11, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    .line 154
    :cond_4
    invoke-virtual {v3}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sType:Ljava/lang/String;

    .line 155
    const-string v8, "BluetoothShareGatewayActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "sType = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sType:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    sput-object v3, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    .line 158
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v8

    sput-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 159
    sget-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v8, :cond_a

    .line 160
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "bluetooth is not started! "

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    .line 224
    :goto_2
    return-void

    .line 110
    .end local v7           #uris:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :cond_5
    const-string v8, "BluetoothShareGatewayActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "uri = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    sput-boolean v11, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    .line 112
    const-string v8, "content"

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 113
    const-string v8, "media"

    invoke-virtual {v6}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 114
    sput-boolean v12, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    goto/16 :goto_0

    .line 124
    .restart local v7       #uris:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :cond_6
    sput-boolean v11, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    .line 125
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/Uri;

    .line 126
    .local v5, tmpUri:Landroid/net/Uri;
    if-nez v5, :cond_7

    .line 127
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "uri is null in Uris arraylist"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    goto :goto_2

    .line 131
    :cond_7
    const-string v8, "BluetoothShareGatewayActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "uri = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    const-string v8, "content"

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 133
    const-string v8, "media"

    invoke-virtual {v5}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 134
    sput-boolean v12, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    goto :goto_3

    .line 136
    :cond_8
    sput-boolean v11, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    goto/16 :goto_1

    .line 140
    :cond_9
    sput-boolean v11, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sBip:Z

    goto/16 :goto_1

    .line 165
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v5           #tmpUri:Landroid/net/Uri;
    :cond_a
    sget-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v8

    if-eqz v8, :cond_c

    .line 166
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "bluetooth is available"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    const-string v8, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {v3, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    .line 169
    .local v4, remoteDevice:Landroid/bluetooth/BluetoothDevice;
    const-string v8, "BluetoothShareGatewayActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Received BT device selected intent, bt device: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    if-nez v4, :cond_b

    .line 172
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "remote device is null"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    invoke-direct {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->startDevicePicker()V

    goto/16 :goto_2

    .line 175
    :cond_b
    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->profileDispatcher(Landroid/bluetooth/BluetoothDevice;)V

    .line 176
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    goto/16 :goto_2

    .line 179
    .end local v4           #remoteDevice:Landroid/bluetooth/BluetoothDevice;
    :cond_c
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "bluetooth is not available! "

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "turning on bluetooth......"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    new-instance v2, Landroid/content/Intent;

    const-string v8, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v2, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 183
    .local v2, in:Landroid/content/Intent;
    invoke-virtual {p0, v2, v12}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_2

    .line 186
    .end local v2           #in:Landroid/content/Intent;
    :cond_d
    const-string v8, "com.mediatek.bluetooth.sharegateway.action.DEVICE_SELECTED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 188
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "return from device picker"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    sget-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    if-nez v8, :cond_e

    .line 190
    if-eqz p1, :cond_f

    .line 191
    const-string v8, "intent"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/content/Intent;

    sput-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    .line 192
    sget-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    invoke-virtual {v8}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sType:Ljava/lang/String;

    .line 199
    :cond_e
    const-string v8, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {v3, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothDevice;

    .line 200
    .restart local v4       #remoteDevice:Landroid/bluetooth/BluetoothDevice;
    const-string v8, "BluetoothShareGatewayActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Received BT device selected intent, bt device: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    if-nez v4, :cond_10

    .line 203
    const-string v8, "BluetoothShareGatewayActivity"

    const-string v9, "remote device is null"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    :goto_4
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    goto/16 :goto_2

    .line 194
    .end local v4           #remoteDevice:Landroid/bluetooth/BluetoothDevice;
    :cond_f
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    goto/16 :goto_2

    .line 205
    .restart local v4       #remoteDevice:Landroid/bluetooth/BluetoothDevice;
    :cond_10
    invoke-direct {p0, v4}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->profileDispatcher(Landroid/bluetooth/BluetoothDevice;)V

    goto :goto_4

    .line 221
    .end local v4           #remoteDevice:Landroid/bluetooth/BluetoothDevice;
    :cond_11
    const-string v8, "BluetoothShareGatewayActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "unsupported action: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    goto/16 :goto_2
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 267
    const-string v0, "BluetoothShareGatewayActivity"

    const-string v1, "onDestroy......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 271
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 251
    const-string v0, "BluetoothShareGatewayActivity"

    const-string v1, "onPause......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 255
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 241
    const-string v0, "BluetoothShareGatewayActivity"

    const-string v1, "onResume......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 243
    sget-boolean v0, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sReentry:Z

    if-eqz v0, :cond_0

    .line 244
    const-string v0, "BluetoothShareGatewayActivity"

    const-string v1, "onResume forget......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->finish()V

    .line 247
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 235
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 236
    const-string v0, "intent"

    sget-object v1, Lcom/mediatek/bluetooth/BluetoothShareGatewayActivity;->sIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 237
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 228
    const-string v0, "BluetoothShareGatewayActivity"

    const-string v1, "onStart......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 231
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 259
    const-string v0, "BluetoothShareGatewayActivity"

    const-string v1, "onStop......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 263
    return-void
.end method
