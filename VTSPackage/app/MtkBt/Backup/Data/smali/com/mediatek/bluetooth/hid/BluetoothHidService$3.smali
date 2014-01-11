.class Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;
.super Landroid/os/Handler;
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
    .line 890
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 14
    .parameter "msg"

    .prologue
    .line 894
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 895
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleMessage(): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 896
    const/4 v1, 0x0

    .line 897
    .local v1, notifyID:I
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v7

    .line 898
    .local v7, data:Landroid/os/Bundle;
    if-eqz v7, :cond_5

    const-string v0, "device_addr"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 899
    .local v3, deviceAddr:Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2}, Ljava/lang/String;-><init>()V

    .line 901
    .local v2, deviceName:Ljava/lang/String;
    const/4 v11, 0x0

    .line 902
    .local v11, noti:Landroid/app/Notification;
    if-eqz v3, :cond_1

    .line 903
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getDeviceList()Landroid/preference/PreferenceCategory;

    move-result-object v4

    iput-object v4, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    .line 904
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    if-eqz v0, :cond_0

    .line 905
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v3}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    iput-object v4, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    .line 908
    :cond_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getBluetoothDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    invoke-static {v0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v10

    .line 909
    .local v10, mBD:Landroid/bluetooth/BluetoothDevice;
    if-eqz v10, :cond_6

    .line 910
    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    .line 911
    if-nez v2, :cond_1

    .line 912
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getDeviceName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2400(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 923
    .end local v10           #mBD:Landroid/bluetooth/BluetoothDevice;
    :cond_1
    :goto_1
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 1174
    :cond_2
    :goto_2
    const/4 v0, 0x4

    iget v4, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_3

    const/4 v0, 0x5

    iget v4, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_3

    const/4 v0, 0x6

    iget v4, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_3

    const/4 v0, 0x7

    iget v4, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_3

    const/16 v0, 0xa

    iget v4, p1, Landroid/os/Message;->what:I

    if-eq v0, v4, :cond_3

    const/16 v0, 0xb

    iget v4, p1, Landroid/os/Message;->what:I

    if-ne v0, v4, :cond_4

    .line 1180
    :cond_3
    new-instance v9, Landroid/content/Intent;

    const-string v0, "com.mediatek.bluetooth.hid.finish"

    invoke-direct {v9, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1181
    .local v9, intent:Landroid/content/Intent;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-virtual {v0, v9}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendBroadcast(Landroid/content/Intent;)V

    .line 1184
    .end local v9           #intent:Landroid/content/Intent;
    :cond_4
    return-void

    .line 898
    .end local v2           #deviceName:Ljava/lang/String;
    .end local v3           #deviceAddr:Ljava/lang/String;
    .end local v11           #noti:Landroid/app/Notification;
    :cond_5
    const/4 v3, 0x0

    goto :goto_0

    .line 915
    .restart local v2       #deviceName:Ljava/lang/String;
    .restart local v3       #deviceAddr:Ljava/lang/String;
    .restart local v10       #mBD:Landroid/bluetooth/BluetoothDevice;
    .restart local v11       #noti:Landroid/app/Notification;
    :cond_6
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getDeviceName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2400(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 916
    if-nez v2, :cond_1

    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    if-eqz v0, :cond_1

    .line 917
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    invoke-virtual {v0}, Landroid/preference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 925
    .end local v10           #mBD:Landroid/bluetooth/BluetoothDevice;
    :sswitch_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/16 v4, 0x64

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mServerState:I
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2502(Lcom/mediatek/bluetooth/hid/BluetoothHidService;I)I

    .line 926
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    const-string v4, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/16 v5, 0xb

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 928
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    invoke-virtual {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendBroadcast(Landroid/content/Intent;)V

    .line 930
    new-instance v6, Landroid/content/Intent;

    const-string v0, "android.bluetooth.input.profile.action.ACTION_BIND_SERVICE"

    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 931
    .local v6, bindIntent:Landroid/content/Intent;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    invoke-virtual {v0, v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_2

    .line 935
    .end local v6           #bindIntent:Landroid/content/Intent;
    :sswitch_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    const-string v4, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/16 v5, 0xe

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 937
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    invoke-virtual {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 941
    :sswitch_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/16 v4, 0x68

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mServerState:I
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2502(Lcom/mediatek/bluetooth/hid/BluetoothHidService;I)I

    .line 942
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    const-string v4, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/16 v5, 0xd

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 944
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    invoke-virtual {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 948
    :sswitch_3
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    const-string v4, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/16 v5, 0xe

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 950
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mUpdateStateIntent:Landroid/content/Intent;

    invoke-virtual {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 954
    :sswitch_4
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mCx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v5, 0x7f050016

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-virtual {v4, v5, v12}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 956
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/16 v4, 0x66

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mServerState:I
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2502(Lcom/mediatek/bluetooth/hid/BluetoothHidService;I)I

    .line 957
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "connected"

    iget-object v5, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getBluetoothDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    invoke-static {v5, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateSettingsState(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V

    .line 959
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "connected"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2600(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 965
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v4, 0x7f05000b

    const/4 v5, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateActivityUI(Ljava/lang/String;IZ)V
    invoke-static {v0, v3, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1700(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;IZ)V

    .line 966
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 967
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2700()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 968
    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2708()I

    .line 971
    :cond_7
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 972
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "connected"

    const/4 v5, 0x0

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->genHidNotification(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/Notification;
    invoke-static/range {v0 .. v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/app/Notification;

    move-result-object v11

    .line 974
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNM:Landroid/app/NotificationManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Landroid/app/NotificationManager;

    move-result-object v0

    invoke-virtual {v0, v1, v11}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 976
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 978
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mConnectTimeout close."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 979
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->shutdown()V

    .line 980
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->join()V

    .line 981
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3002(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    .line 982
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mConnectTimeout close OK."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    .line 983
    :catch_0
    move-exception v8

    .line 984
    .local v8, e:Ljava/lang/InterruptedException;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mConnectTimeout close error."

    const/4 v5, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto/16 :goto_2

    .line 991
    .end local v8           #e:Ljava/lang/InterruptedException;
    :sswitch_5
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 992
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v4, "connecting"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v4, "authorize"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 995
    :cond_8
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mCx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v5, 0x7f050017

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-virtual {v4, v5, v12}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 998
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "disconnect"

    iget-object v5, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getBluetoothDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    invoke-static {v5, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateSettingsState(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V

    .line 1000
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "disconnect"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2600(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 1006
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v4, 0x7f05000d

    const/4 v5, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateActivityUI(Ljava/lang/String;IZ)V
    invoke-static {v0, v3, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1700(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;IZ)V

    .line 1011
    :cond_9
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 1013
    :try_start_1
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mConnectTimeout close."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 1014
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->shutdown()V

    .line 1015
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3000(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->join()V

    .line 1016
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mConnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3002(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    .line 1017
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mConnectTimeout close OK."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1022
    :cond_a
    :goto_3
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1023
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1025
    :cond_b
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNM:Landroid/app/NotificationManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Landroid/app/NotificationManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    goto/16 :goto_2

    .line 1018
    :catch_1
    move-exception v8

    .line 1019
    .restart local v8       #e:Ljava/lang/InterruptedException;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mConnectTimeout close error."

    const/4 v5, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto :goto_3

    .line 1030
    .end local v8           #e:Ljava/lang/InterruptedException;
    :sswitch_6
    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3100()Z

    move-result v0

    if-nez v0, :cond_c

    .line 1031
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mCx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v5, 0x7f050018

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-virtual {v4, v5, v12}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1035
    :cond_c
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/16 v4, 0x67

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mServerState:I
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2502(Lcom/mediatek/bluetooth/hid/BluetoothHidService;I)I

    .line 1037
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1038
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v4, "unplug"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1039
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "disconnect"

    iget-object v5, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getBluetoothDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    invoke-static {v5, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateSettingsState(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V

    .line 1046
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "unplug_disconnect"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2600(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 1048
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    if-eqz v0, :cond_d

    .line 1049
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPC:Landroid/preference/PreferenceCategory;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v4, v4, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mPreference:Landroid/preference/Preference;

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 1074
    :cond_d
    :goto_4
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1076
    :try_start_2
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mDisconnectTimeout close."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 1077
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->shutdown()V

    .line 1078
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->join()V

    .line 1079
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3202(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    .line 1080
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mDisconnectTimeout close OK."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_2

    .line 1081
    :catch_2
    move-exception v8

    .line 1082
    .restart local v8       #e:Ljava/lang/InterruptedException;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mDisconnectTimeout close error."

    const/4 v5, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto/16 :goto_2

    .line 1052
    .end local v8           #e:Ljava/lang/InterruptedException;
    :cond_e
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "disconnect"

    iget-object v5, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getBluetoothDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    invoke-static {v5, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateSettingsState(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V

    .line 1059
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "disconnect"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2600(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1061
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1062
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNM:Landroid/app/NotificationManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Landroid/app/NotificationManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1069
    :cond_f
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v4, 0x7f05000d

    const/4 v5, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateActivityUI(Ljava/lang/String;IZ)V
    invoke-static {v0, v3, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1700(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;IZ)V

    goto :goto_4

    .line 1089
    :sswitch_7
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 1090
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v4, "disconnecting"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mStateMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v4, "unplug"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 1094
    :cond_10
    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3100()Z

    move-result v0

    if-nez v0, :cond_11

    .line 1095
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mCx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v5, 0x7f050019

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-virtual {v4, v5, v12}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1101
    :cond_11
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "connected"

    iget-object v5, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getBluetoothDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    invoke-static {v5, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateSettingsState(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V

    .line 1103
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "connected"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2600(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 1109
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v4, 0x7f05000b

    const/4 v5, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateActivityUI(Ljava/lang/String;IZ)V
    invoke-static {v0, v3, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1700(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;IZ)V

    .line 1114
    :cond_12
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1116
    :try_start_3
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mDisconnectTimeout close."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    .line 1117
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->shutdown()V

    .line 1118
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;->join()V

    .line 1119
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/4 v4, 0x0

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mDisconnectTimeout:Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$3202(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;)Lcom/mediatek/bluetooth/hid/BluetoothHidService$ActionTimeoutThread;

    .line 1120
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mDisconnectTimeout close OK."

    const/4 v5, 0x3

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_2

    .line 1121
    :catch_3
    move-exception v8

    .line 1122
    .restart local v8       #e:Ljava/lang/InterruptedException;
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "mDisconnectTimeout close error."

    const/4 v5, 0x2

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->printLog(Ljava/lang/String;I)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$100(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;I)V

    goto/16 :goto_2

    .line 1128
    .end local v8           #e:Ljava/lang/InterruptedException;
    :sswitch_8
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mCx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v5, 0x7f05001a

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-virtual {v4, v5, v12}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1130
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/16 v4, 0x67

    #setter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mServerState:I
    invoke-static {v0, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2502(Lcom/mediatek/bluetooth/hid/BluetoothHidService;I)I

    .line 1131
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "unplug"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2600(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 1133
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1134
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1135
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNM:Landroid/app/NotificationManager;
    invoke-static {v0}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;)Landroid/app/NotificationManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    goto/16 :goto_2

    .line 1140
    :sswitch_9
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mCx:Landroid/content/Context;

    iget-object v4, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v5, 0x7f05001b

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v2, v12, v13

    invoke-virtual {v4, v5, v12}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    .line 1145
    :sswitch_a
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 1146
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    iget-object v0, v0, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->mNotifyMap:Ljava/util/Map;

    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2700()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1147
    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2708()I

    .line 1150
    :cond_13
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "connecting"

    iget-object v5, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->getBluetoothDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;
    invoke-static {v5, v3}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1800(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateSettingsState(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V
    invoke-static {v0, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1900(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V

    .line 1152
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const-string v4, "authorize"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2600(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Ljava/lang/String;)V

    .line 1159
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const v4, 0x7f05000c

    const/4 v5, 0x0

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->updateActivityUI(Ljava/lang/String;IZ)V
    invoke-static {v0, v3, v4, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$1700(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;IZ)V

    .line 1167
    iget-object v0, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidService$3;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidService;

    const/4 v4, 0x1

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidService;->serverAuthorizeReqNative(Ljava/lang/String;Z)V
    invoke-static {v0, v3, v4}, Lcom/mediatek/bluetooth/hid/BluetoothHidService;->access$2200(Lcom/mediatek/bluetooth/hid/BluetoothHidService;Ljava/lang/String;Z)V

    goto/16 :goto_2

    .line 923
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0xa -> :sswitch_8
        0xb -> :sswitch_9
        0x1b -> :sswitch_a
    .end sparse-switch
.end method
