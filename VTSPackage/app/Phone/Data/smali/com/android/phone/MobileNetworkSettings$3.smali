.class Lcom/android/phone/MobileNetworkSettings$3;
.super Landroid/content/BroadcastReceiver;
.source "MobileNetworkSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/MobileNetworkSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/MobileNetworkSettings;


# direct methods
.method constructor <init>(Lcom/android/phone/MobileNetworkSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 240
    iput-object p1, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .parameter "context"
    .parameter "intent"

    .prologue
    const/16 v10, 0x190

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 243
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 244
    .local v0, action:Ljava/lang/String;
    const-string v6, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 245
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    const-string v7, "state"

    invoke-virtual {p2, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    #setter for: Lcom/android/phone/MobileNetworkSettings;->mAirplaneModeEnabled:Z
    invoke-static {v6, v7}, Lcom/android/phone/MobileNetworkSettings;->access$302(Lcom/android/phone/MobileNetworkSettings;Z)Z

    .line 246
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setScreenEnabled()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$100(Lcom/android/phone/MobileNetworkSettings;)V

    .line 319
    :cond_0
    :goto_0
    return-void

    .line 247
    :cond_1
    const-string v6, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$400(Lcom/android/phone/MobileNetworkSettings;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 248
    const-string v6, "NetworkSettings"

    const-string v7, "catch data change!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    #calls: Lcom/android/phone/MobileNetworkSettings;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    invoke-static {p2}, Lcom/android/phone/MobileNetworkSettings;->access$500(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v5

    .line 250
    .local v5, state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    const-string v6, "apnType"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 251
    .local v1, apnTypeList:Ljava/lang/String;
    const-string v6, "NetworkSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "apnTypeList="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    const-string v6, "NetworkSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "state="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    const-string v6, "default"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    sget-object v6, Lcom/android/internal/telephony/PhoneConstants$DataState;->CONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    if-eq v5, v6, :cond_2

    sget-object v6, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    if-ne v5, v6, :cond_0

    .line 256
    :cond_2
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    iget-object v6, v6, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    const/16 v7, 0x7d1

    invoke-virtual {v6, v7}, Landroid/os/Handler;->removeMessages(I)V

    .line 257
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    invoke-virtual {v6, v10}, Lcom/android/phone/MobileNetworkSettings;->removeDialog(I)V

    .line 258
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #setter for: Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z
    invoke-static {v6, v9}, Lcom/android/phone/MobileNetworkSettings;->access$402(Lcom/android/phone/MobileNetworkSettings;Z)Z

    .line 259
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setDataConnPref()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$200(Lcom/android/phone/MobileNetworkSettings;)V

    goto :goto_0

    .line 261
    .end local v1           #apnTypeList:Ljava/lang/String;
    .end local v5           #state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    :cond_3
    const-string v6, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 262
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    const-string v7, "mode"

    const/4 v8, -0x1

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    #setter for: Lcom/android/phone/MobileNetworkSettings;->mDualSimMode:I
    invoke-static {v6, v7}, Lcom/android/phone/MobileNetworkSettings;->access$602(Lcom/android/phone/MobileNetworkSettings;I)I

    .line 263
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setScreenEnabled()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$100(Lcom/android/phone/MobileNetworkSettings;)V

    goto/16 :goto_0

    .line 264
    :cond_4
    const-string v6, "android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 265
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setNetworkOperator()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$700(Lcom/android/phone/MobileNetworkSettings;)V

    goto/16 :goto_0

    .line 266
    :cond_5
    const-string v6, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 267
    const-string v6, "NetworkSettings"

    const-string v7, "indicator state changed"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setDataConnPref()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$200(Lcom/android/phone/MobileNetworkSettings;)V

    .line 269
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setScreenEnabled()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$100(Lcom/android/phone/MobileNetworkSettings;)V

    goto/16 :goto_0

    .line 270
    :cond_6
    const-string v6, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 272
    const-string v6, "NetworkSettings"

    const-string v7, "ACTION_SIM_INFO_UPDATE received"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    invoke-static {v6}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v4

    .line 274
    .local v4, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    if-eqz v4, :cond_0

    .line 275
    const-string v6, "NetworkSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sim card number is: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_7

    .line 277
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setDataConnPref()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$200(Lcom/android/phone/MobileNetworkSettings;)V

    .line 278
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setScreenEnabled()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$100(Lcom/android/phone/MobileNetworkSettings;)V

    goto/16 :goto_0

    .line 280
    :cond_7
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    invoke-virtual {v6}, Lcom/android/phone/MobileNetworkSettings;->finish()V

    goto/16 :goto_0

    .line 284
    .end local v4           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_8
    const-string v6, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 285
    const-string v6, "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE"

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_0

    .line 286
    const-string v6, "NetworkSettings"

    const-string v7, "network mode change failed! restore the old value."

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    const-string v6, "com.android.phone.OLD_NETWORK_MODE"

    invoke-virtual {p2, v6, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 288
    .local v3, oldMode:I
    const-string v6, "NetworkSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "oldMode = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mPhone:Lcom/android/internal/telephony/Phone;
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$800(Lcom/android/phone/MobileNetworkSettings;)Lcom/android/internal/telephony/Phone;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "preferred_network_mode"

    invoke-static {v6, v7, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto/16 :goto_0

    .line 293
    .end local v3           #oldMode:I
    :cond_9
    const-string v6, "com.android.mms.transaction.START"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 294
    const-string v6, "NetworkSettings"

    const-string v7, "start to send MMS"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$900(Lcom/android/phone/MobileNetworkSettings;)Lcom/mediatek/settings/DefaultSimPreference;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mediatek/settings/DefaultSimPreference;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 296
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$900(Lcom/android/phone/MobileNetworkSettings;)Lcom/mediatek/settings/DefaultSimPreference;

    move-result-object v6

    invoke-virtual {v6, v9}, Lcom/mediatek/settings/DefaultSimPreference;->setEnabled(Z)V

    .line 298
    :cond_a
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$900(Lcom/android/phone/MobileNetworkSettings;)Lcom/mediatek/settings/DefaultSimPreference;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mediatek/settings/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    .line 299
    .local v2, dlg:Landroid/app/Dialog;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 300
    const-string v6, "NetworkSettings"

    const-string v7, "MMS stopped dismiss GPRS selection dialog"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    goto/16 :goto_0

    .line 303
    .end local v2           #dlg:Landroid/app/Dialog;
    :cond_b
    const-string v6, "com.android.mms.transaction.STOP"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 304
    const-string v6, "NetworkSettings"

    const-string v7, "send MMS is end"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$900(Lcom/android/phone/MobileNetworkSettings;)Lcom/mediatek/settings/DefaultSimPreference;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mediatek/settings/DefaultSimPreference;->isEnabled()Z

    move-result v6

    if-nez v6, :cond_c

    .line 306
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$900(Lcom/android/phone/MobileNetworkSettings;)Lcom/mediatek/settings/DefaultSimPreference;

    move-result-object v6

    invoke-virtual {v6, v8}, Lcom/mediatek/settings/DefaultSimPreference;->setEnabled(Z)V

    .line 308
    :cond_c
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mDataConnPref:Lcom/mediatek/settings/DefaultSimPreference;
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$900(Lcom/android/phone/MobileNetworkSettings;)Lcom/mediatek/settings/DefaultSimPreference;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mediatek/settings/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v2

    .line 309
    .restart local v2       #dlg:Landroid/app/Dialog;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 310
    const-string v6, "NetworkSettings"

    const-string v7, "MMS stopped dismiss GPRS selection dialog"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    goto/16 :goto_0

    .line 313
    .end local v2           #dlg:Landroid/app/Dialog;
    :cond_d
    const-string v6, "com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 314
    const-string v6, "NetworkSettings"

    const-string v7, "deal with data limit broadcast"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    invoke-virtual {v6, v10}, Lcom/android/phone/MobileNetworkSettings;->removeDialog(I)V

    .line 316
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #setter for: Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z
    invoke-static {v6, v9}, Lcom/android/phone/MobileNetworkSettings;->access$402(Lcom/android/phone/MobileNetworkSettings;Z)Z

    .line 317
    iget-object v6, p0, Lcom/android/phone/MobileNetworkSettings$3;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setDataConnPref()V
    invoke-static {v6}, Lcom/android/phone/MobileNetworkSettings;->access$200(Lcom/android/phone/MobileNetworkSettings;)V

    goto/16 :goto_0
.end method
