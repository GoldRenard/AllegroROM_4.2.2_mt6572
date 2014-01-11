.class Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothHidActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 755
    iput-object p1, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 758
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "hid activity receiver receives intent: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V

    .line 759
    const-string v6, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 760
    const-string v6, "android.bluetooth.adapter.extra.STATE"

    const/high16 v7, -0x8000

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 762
    .local v1, btState:I
    packed-switch v1, :pswitch_data_0

    .line 805
    .end local v1           #btState:I
    :cond_0
    :goto_0
    return-void

    .line 764
    .restart local v1       #btState:I
    :pswitch_0
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    const-string v7, "hid activity receiver receives BT OFF intent"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V

    .line 765
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->restorePreferenceList()V
    invoke-static {v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$400(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V

    .line 767
    :try_start_0
    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$300()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 768
    const/4 v6, 0x0

    invoke-static {v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$302(Z)Z

    .line 769
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    const-string v7, "mReceiver,unbindservice"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V

    .line 770
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    iget-object v6, v6, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mCt:Landroid/content/Context;

    iget-object v7, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    #getter for: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->mHidServerNotifyConn:Landroid/content/ServiceConnection;
    invoke-static {v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$500(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)Landroid/content/ServiceConnection;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 778
    :cond_1
    :goto_1
    invoke-static {}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$600()Z

    move-result v6

    if-nez v6, :cond_0

    .line 779
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    invoke-virtual {v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    goto :goto_0

    .line 772
    :catch_0
    move-exception v2

    .line 774
    .local v2, e:Ljava/lang/IllegalArgumentException;
    const-string v6, "[BT][HID][BluetoothHidActivity]"

    const-string v7, "mReceiver,unbindservice error"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 776
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    invoke-virtual {v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->finish()V

    goto :goto_1

    .line 786
    .end local v1           #btState:I
    .end local v2           #e:Ljava/lang/IllegalArgumentException;
    :cond_2
    const-string v6, "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_SUMMARY_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 787
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    const-string v7, "Update summary"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V

    .line 788
    const/4 v4, 0x0

    .line 789
    .local v4, mPreference:Landroid/preference/Preference;
    const-string v6, "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_DEVICE"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 790
    .local v0, btAddr:Ljava/lang/String;
    const-string v6, "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_SUMMARY"

    const/4 v7, -0x1

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 791
    .local v5, summary:I
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "new summary is: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    invoke-virtual {v8, v5}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V

    .line 792
    const-string v6, "com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_ENABLE"

    const/4 v7, 0x1

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    .line 793
    .local v3, enable:Z
    sget-object v6, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    if-eqz v6, :cond_0

    .line 794
    sget-object v6, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->sDeviceList:Landroid/preference/PreferenceCategory;

    invoke-virtual {v6, v0}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    .line 796
    if-eqz v4, :cond_0

    .line 797
    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setSummary(I)V

    .line 798
    invoke-virtual {v4, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    goto/16 :goto_0

    .line 801
    .end local v0           #btAddr:Ljava/lang/String;
    .end local v3           #enable:Z
    .end local v4           #mPreference:Landroid/preference/Preference;
    .end local v5           #summary:I
    :cond_3
    const-string v6, "com.mediatek.bluetooth.BluetoothHidActivity.ACTION_DEVICE_ADDED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 802
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    const-string v7, "New device added"

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->debugLog(Ljava/lang/String;)V
    invoke-static {v6, v7}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$000(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;Ljava/lang/String;)V

    .line 803
    iget-object v6, p0, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity$2;->this$0:Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;

    #calls: Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->getPreferenceList()V
    invoke-static {v6}, Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;->access$200(Lcom/mediatek/bluetooth/hid/BluetoothHidActivity;)V

    goto/16 :goto_0

    .line 762
    :pswitch_data_0
    .packed-switch 0xd
        :pswitch_0
    .end packed-switch
.end method
