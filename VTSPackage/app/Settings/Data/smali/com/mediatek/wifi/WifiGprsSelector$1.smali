.class Lcom/mediatek/wifi/WifiGprsSelector$1;
.super Landroid/content/BroadcastReceiver;
.source "WifiGprsSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/wifi/WifiGprsSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/wifi/WifiGprsSelector;


# direct methods
.method constructor <init>(Lcom/mediatek/wifi/WifiGprsSelector;)V
    .locals 0
    .parameter

    .prologue
    .line 149
    iput-object p1, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .parameter "context"
    .parameter "intent"

    .prologue
    const/16 v8, 0x3e9

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 152
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, action:Ljava/lang/String;
    const-string v6, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 154
    const-string v4, "reason"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 155
    .local v1, reason:Ljava/lang/String;
    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    invoke-static {p2}, Lcom/mediatek/wifi/WifiGprsSelector;->access$000(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v3

    .line 156
    .local v3, state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    const-string v4, "WifiGprsSelector"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "catch data change, reason : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "  state = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    if-nez v1, :cond_1

    .line 201
    .end local v1           #reason:Ljava/lang/String;
    .end local v3           #state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    :cond_0
    :goto_0
    return-void

    .line 160
    .restart local v1       #reason:Ljava/lang/String;
    .restart local v3       #state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    :cond_1
    const-string v4, "dataEnabled"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$DataState;->CONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    if-ne v3, v4, :cond_3

    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mIsGprsSwitching:Z
    invoke-static {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->access$100(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 162
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iget-object v4, v4, Lcom/mediatek/wifi/WifiGprsSelector;->mTimeHandler:Landroid/os/Handler;

    const/16 v6, 0x7d1

    invoke-virtual {v4, v6}, Landroid/os/Handler;->removeMessages(I)V

    .line 163
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-virtual {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->isResumed()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 164
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->removeDialog(I)V
    invoke-static {v4, v8}, Lcom/mediatek/wifi/WifiGprsSelector;->access$200(Lcom/mediatek/wifi/WifiGprsSelector;I)V

    .line 166
    :cond_2
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mIsGprsSwitching:Z
    invoke-static {v4, v5}, Lcom/mediatek/wifi/WifiGprsSelector;->access$102(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 167
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->updateDataEnabler()V
    invoke-static {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->access$300(Lcom/mediatek/wifi/WifiGprsSelector;)V

    goto :goto_0

    .line 168
    :cond_3
    const-string v4, "dataDisabled"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    if-ne v3, v4, :cond_0

    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mIsGprsSwitching:Z
    invoke-static {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->access$100(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 170
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iget-object v4, v4, Lcom/mediatek/wifi/WifiGprsSelector;->mTimeHandler:Landroid/os/Handler;

    const/16 v6, 0x7d0

    invoke-virtual {v4, v6}, Landroid/os/Handler;->removeMessages(I)V

    .line 171
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-virtual {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->isResumed()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 172
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->removeDialog(I)V
    invoke-static {v4, v8}, Lcom/mediatek/wifi/WifiGprsSelector;->access$400(Lcom/mediatek/wifi/WifiGprsSelector;I)V

    .line 174
    :cond_4
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mIsGprsSwitching:Z
    invoke-static {v4, v5}, Lcom/mediatek/wifi/WifiGprsSelector;->access$102(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 175
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->updateDataEnabler()V
    invoke-static {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->access$300(Lcom/mediatek/wifi/WifiGprsSelector;)V

    goto :goto_0

    .line 177
    .end local v1           #reason:Ljava/lang/String;
    .end local v3           #state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    :cond_5
    const-string v6, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 178
    iget-object v6, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    const-string v7, "state"

    invoke-virtual {p2, v7, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mAirplaneModeEnabled:Z
    invoke-static {v6, v7}, Lcom/mediatek/wifi/WifiGprsSelector;->access$502(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 179
    const-string v6, "WifiGprsSelector"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "AIRPLANE_MODE state changed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mAirplaneModeEnabled:Z
    invoke-static {v8}, Lcom/mediatek/wifi/WifiGprsSelector;->access$500(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ";"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    iget-object v6, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mApnList:Landroid/preference/PreferenceCategory;
    invoke-static {v6}, Lcom/mediatek/wifi/WifiGprsSelector;->access$600(Lcom/mediatek/wifi/WifiGprsSelector;)Landroid/preference/PreferenceCategory;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mAirplaneModeEnabled:Z
    invoke-static {v7}, Lcom/mediatek/wifi/WifiGprsSelector;->access$500(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v7

    if-nez v7, :cond_6

    :goto_1
    invoke-virtual {v6, v4}, Landroid/preference/PreferenceCategory;->setEnabled(Z)V

    .line 181
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->updateDataEnabler()V
    invoke-static {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->access$300(Lcom/mediatek/wifi/WifiGprsSelector;)V

    goto/16 :goto_0

    :cond_6
    move v4, v5

    .line 180
    goto :goto_1

    .line 182
    :cond_7
    const-string v6, "com.android.mms.transaction.START"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 183
    const-string v6, "WifiGprsSelector"

    const-string v7, "ssr: TRANSACTION_START in ApnSettings;"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    iget-object v6, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mScreenEnable:Z
    invoke-static {v6, v5}, Lcom/mediatek/wifi/WifiGprsSelector;->access$702(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 185
    iget-object v6, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mApnList:Landroid/preference/PreferenceCategory;
    invoke-static {v6}, Lcom/mediatek/wifi/WifiGprsSelector;->access$600(Lcom/mediatek/wifi/WifiGprsSelector;)Landroid/preference/PreferenceCategory;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mAirplaneModeEnabled:Z
    invoke-static {v7}, Lcom/mediatek/wifi/WifiGprsSelector;->access$500(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v7

    if-nez v7, :cond_8

    iget-object v7, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mScreenEnable:Z
    invoke-static {v7}, Lcom/mediatek/wifi/WifiGprsSelector;->access$700(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v7

    if-eqz v7, :cond_8

    :goto_2
    invoke-virtual {v6, v4}, Landroid/preference/PreferenceCategory;->setEnabled(Z)V

    goto/16 :goto_0

    :cond_8
    move v4, v5

    goto :goto_2

    .line 186
    :cond_9
    const-string v6, "com.android.mms.transaction.STOP"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 187
    const-string v6, "WifiGprsSelector"

    const-string v7, "ssr: TRANSACTION_STOP in ApnSettings;"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    iget-object v6, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mScreenEnable:Z
    invoke-static {v6, v4}, Lcom/mediatek/wifi/WifiGprsSelector;->access$702(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 189
    iget-object v6, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mApnList:Landroid/preference/PreferenceCategory;
    invoke-static {v6}, Lcom/mediatek/wifi/WifiGprsSelector;->access$600(Lcom/mediatek/wifi/WifiGprsSelector;)Landroid/preference/PreferenceCategory;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mAirplaneModeEnabled:Z
    invoke-static {v7}, Lcom/mediatek/wifi/WifiGprsSelector;->access$500(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v7

    if-nez v7, :cond_a

    iget-object v7, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mScreenEnable:Z
    invoke-static {v7}, Lcom/mediatek/wifi/WifiGprsSelector;->access$700(Lcom/mediatek/wifi/WifiGprsSelector;)Z

    move-result v7

    if-eqz v7, :cond_a

    :goto_3
    invoke-virtual {v6, v4}, Landroid/preference/PreferenceCategory;->setEnabled(Z)V

    goto/16 :goto_0

    :cond_a
    move v4, v5

    goto :goto_3

    .line 190
    :cond_b
    const-string v4, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 191
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    const-string v5, "wifi_state"

    const/4 v6, 0x4

    invoke-virtual {p2, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->handleWifiStateChanged(I)V
    invoke-static {v4, v5}, Lcom/mediatek/wifi/WifiGprsSelector;->access$800(Lcom/mediatek/wifi/WifiGprsSelector;I)V

    goto/16 :goto_0

    .line 193
    :cond_c
    const-string v4, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 194
    const-string v4, "WifiGprsSelector"

    const-string v5, "receive ACTION_SIM_INFO_UPDATE"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-virtual {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 196
    .local v2, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    if-eqz v2, :cond_0

    .line 197
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iget-object v5, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->getSimSlot()I
    invoke-static {v5}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1000(Lcom/mediatek/wifi/WifiGprsSelector;)I

    move-result v5

    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mSimSlot:I
    invoke-static {v4, v5}, Lcom/mediatek/wifi/WifiGprsSelector;->access$902(Lcom/mediatek/wifi/WifiGprsSelector;I)I

    .line 198
    iget-object v4, p0, Lcom/mediatek/wifi/WifiGprsSelector$1;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #calls: Lcom/mediatek/wifi/WifiGprsSelector;->updateDataEnabler()V
    invoke-static {v4}, Lcom/mediatek/wifi/WifiGprsSelector;->access$300(Lcom/mediatek/wifi/WifiGprsSelector;)V

    goto/16 :goto_0
.end method
