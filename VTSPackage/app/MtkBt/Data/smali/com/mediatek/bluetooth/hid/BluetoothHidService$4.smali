.class Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothHidService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/BluetoothHidService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)V
    .locals 0
    .parameter

    .prologue
    .line 1284
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v11, 0x2

    const/4 v5, 0x0

    .line 1287
    const/4 v1, 0x0

    .line 1288
    .local v1, notifyID:I
    const/4 v8, 0x0

    .line 1289
    .local v8, noti:Landroid/app/Notification;
    const-string v0, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Landroid/bluetooth/BluetoothDevice;

    .line 1290
    .local v7, device:Landroid/bluetooth/BluetoothDevice;
    if-nez v7, :cond_1

    .line 1291
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "ERROR: device null"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v11}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 1337
    :cond_0
    :goto_0
    return-void

    .line 1295
    :cond_1
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    .line 1296
    .local v3, deviceAddr:Ljava/lang/String;
    invoke-virtual {v7}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1297
    .local v2, deviceName:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getDeviceState(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$300(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1298
    .local v10, state:Ljava/lang/String;
    const/4 v9, 0x0

    .line 1299
    .local v9, notifyStr:Ljava/lang/String;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1300
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1302
    :cond_2
    if-nez v9, :cond_3

    .line 1303
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "ERROR: notify_s null"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v11}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_0

    .line 1306
    :cond_3
    const-string v0, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1307
    const-string v0, "android.bluetooth.device.extra.BOND_STATE"

    const/high16 v4, -0x8000

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 1309
    .local v6, bondedState:I
    const/16 v0, 0xa

    if-ne v6, v0, :cond_5

    .line 1310
    if-eqz v3, :cond_5

    .line 1311
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getDeviceList()Landroid/preference/PreferenceCategory;

    move-result-object v4

    iput-object v4, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    .line 1312
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    if-eqz v0, :cond_4

    .line 1313
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v3}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    iput-object v4, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    .line 1316
    :cond_4
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    if-eqz v0, :cond_5

    .line 1317
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 1323
    .end local v6           #bondedState:I
    :cond_5
    if-eqz v10, :cond_0

    const-string v0, "android.bluetooth.device.action.NAME_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1324
    const-string v0, "connected"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1325
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1326
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "connected"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->genHidNotification(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/Notification;
    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/Notification;

    move-result-object v8

    .line 1328
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNM:Landroid/app/NotificationManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Landroid/app/NotificationManager;

    move-result-object v0

    invoke-virtual {v0, v1, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_0

    .line 1329
    :cond_6
    const-string v0, "authorize"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1330
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1331
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "authorize"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->genHidNotification(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/Notification;
    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/Notification;

    move-result-object v8

    .line 1333
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$4;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNM:Landroid/app/NotificationManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Landroid/app/NotificationManager;

    move-result-object v0

    invoke-virtual {v0, v1, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_0
.end method
