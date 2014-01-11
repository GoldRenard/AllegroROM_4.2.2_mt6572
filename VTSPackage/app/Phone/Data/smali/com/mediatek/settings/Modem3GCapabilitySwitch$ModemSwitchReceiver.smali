.class Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;
.super Landroid/content/BroadcastReceiver;
.source "Modem3GCapabilitySwitch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/Modem3GCapabilitySwitch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ModemSwitchReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V
    .locals 0
    .parameter

    .prologue
    .line 609
    iput-object p1, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .parameter "context"
    .parameter "intent"

    .prologue
    const/16 v12, 0x3e8

    const/4 v11, 0x0

    .line 612
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 613
    .local v0, action:Ljava/lang/String;
    sget-object v8, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_3G_SWITCH_LOCK_CHANGED:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 614
    const-string v8, "Settings/Modem3GCapabilitySwitch"

    const-string v9, "receives EVENT_3G_SWITCH_LOCK_CHANGED..."

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    sget-object v8, Lcom/android/internal/telephony/gemini/GeminiPhone;->EXTRA_3G_SWITCH_LOCKED:Ljava/lang/String;

    invoke-virtual {p2, v8, v11}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 616
    .local v2, bLocked:Z
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateItemStatus()V
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$800(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    .line 658
    .end local v2           #bLocked:Z
    :cond_0
    :goto_0
    return-void

    .line 617
    :cond_1
    sget-object v8, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_PRE_3G_SWITCH:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 618
    const-string v8, "Settings/Modem3GCapabilitySwitch"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Starting the switch......@"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-virtual {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->showSwitchProgress()V

    .line 620
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    const-string v9, "Receive starting switch broadcast"

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->showInstanceIndex(Ljava/lang/String;)V
    invoke-static {v8, v9}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$900(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Ljava/lang/String;)V

    .line 621
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->setStatusBarEnableStatus(Z)V
    invoke-static {v8, v11}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$100(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Z)V

    .line 622
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mTimerHandler:Landroid/os/Handler;
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1000(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/os/Handler;

    move-result-object v8

    const-wide/32 v9, 0xea60

    invoke-virtual {v8, v12, v9, v10}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 623
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$500(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/preference/ListPreference;

    move-result-object v8

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 624
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mNetworkMode:Landroid/preference/ListPreference;
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$500(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/preference/ListPreference;

    move-result-object v8

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Dialog;->dismiss()V

    goto :goto_0

    .line 626
    :cond_2
    sget-object v8, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_3G_SWITCH_DONE:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 627
    const-string v8, "Settings/Modem3GCapabilitySwitch"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Done the switch......@"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 628
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    const-string v9, "Receive switch done broadcast"

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->showInstanceIndex(Ljava/lang/String;)V
    invoke-static {v8, v9}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$900(Lcom/mediatek/settings/Modem3GCapabilitySwitch;Ljava/lang/String;)V

    .line 629
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-virtual {v8, p2}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->clearAfterSwitch(Landroid/content/Intent;)V

    .line 630
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mTimerHandler:Landroid/os/Handler;
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1000(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Landroid/os/Handler;

    move-result-object v8

    invoke-virtual {v8, v12}, Landroid/os/Handler;->removeMessages(I)V

    goto/16 :goto_0

    .line 631
    :cond_3
    const-string v8, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string v8, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 633
    :cond_4
    const-string v8, "state"

    invoke-virtual {p2, v8, v11}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 634
    .local v1, airplaneMode:Z
    const-string v8, "Settings/Modem3GCapabilitySwitch"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "airplaneMode new  state is ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 635
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateNetworkMode()V
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1100(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    .line 636
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->update3GService()V
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1200(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    .line 637
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1300(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/mediatek/settings/ServiceSelectList;

    move-result-object v8

    invoke-virtual {v8}, Lcom/mediatek/settings/ServiceSelectList;->refreshList()V

    goto/16 :goto_0

    .line 638
    .end local v1           #airplaneMode:Z
    :cond_5
    const-string v8, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 639
    const-string v8, "Settings/Modem3GCapabilitySwitch"

    const-string v9, "ACTION_SIM_INFO_UPDATE received"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 640
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-static {v8}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v7

    .line 641
    .local v7, temp:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_8

    .line 642
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #getter for: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mServiceList:Lcom/mediatek/settings/ServiceSelectList;
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1300(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)Lcom/mediatek/settings/ServiceSelectList;

    move-result-object v8

    invoke-virtual {v8}, Lcom/mediatek/settings/ServiceSelectList;->refreshList()V

    .line 643
    const-wide/16 v4, -0x2

    .line 644
    .local v4, simId:J
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    iget-object v8, v8, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->mPhoneMgr:Lcom/android/phone/PhoneInterfaceManager;

    invoke-virtual {v8}, Lcom/android/phone/PhoneInterfaceManager;->get3GCapabilitySIM()I

    move-result v6

    .line 646
    .local v6, slot:I
    const/4 v8, -0x1

    if-ne v6, v8, :cond_6

    .line 647
    int-to-long v4, v6

    .line 652
    :goto_1
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateSummarys(J)V
    invoke-static {v8, v4, v5}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1400(Lcom/mediatek/settings/Modem3GCapabilitySwitch;J)V

    .line 653
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    #calls: Lcom/mediatek/settings/Modem3GCapabilitySwitch;->updateNetworkMode()V
    invoke-static {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->access$1100(Lcom/mediatek/settings/Modem3GCapabilitySwitch;)V

    goto/16 :goto_0

    .line 649
    :cond_6
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-static {v8, v6}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v3

    .line 650
    .local v3, info:Landroid/provider/Telephony$SIMInfo;
    if-eqz v3, :cond_7

    iget-wide v4, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    :goto_2
    goto :goto_1

    :cond_7
    const-wide/16 v4, -0x2

    goto :goto_2

    .line 655
    .end local v3           #info:Landroid/provider/Telephony$SIMInfo;
    .end local v4           #simId:J
    .end local v6           #slot:I
    :cond_8
    iget-object v8, p0, Lcom/mediatek/settings/Modem3GCapabilitySwitch$ModemSwitchReceiver;->this$0:Lcom/mediatek/settings/Modem3GCapabilitySwitch;

    invoke-virtual {v8}, Lcom/mediatek/settings/Modem3GCapabilitySwitch;->finish()V

    goto/16 :goto_0
.end method
